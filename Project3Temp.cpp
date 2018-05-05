#include <stdio.h>
#include <fstream>
#include <math.h>
#include <omp.h>

#define NUMTRIES   20

struct s
{
	float value;
} Array[8];

main( int argc, char *argv[ ] )
{
#ifndef _OPENMP
		fprintf( stderr, "OpenMP is not available\n" );
		return 1;
#endif

	omp_set_num_threads( NUMT );

	int someBigNumber = 10000000;
	double peakPerformance = 0.;
	double performanceSum = 0.;
	
	for( int t = 0; t < NUMTRIES; t++ )
	{
		
		double time0 = omp_get_wtime( );

		#pragma omp parallel for
		for( int i = 0; i < 8; i++ )
		{
			float tmp = Array[ i ].value;
			for( int j = 0; j < someBigNumber; j++ )
			{
				tmp = tmp + 2.;
			}
			Array[ i ].value = tmp;
		}
		
		double time1 = omp_get_wtime( );
		double performance = (double) (8 * someBigNumber) / (time1 - time0) / 1000000;
		performanceSum += performance;
			
		if( performance > peakPerformance )
		{
			peakPerformance = performance;
		}
	}
	
	double averagePerformance = performanceSum / (double)NUMTRIES;
	printf( "Peak Performance : %8.2lf MegaSums/sec\n", peakPerformance );
	printf( "Average Performance : %8.2lf MegaSums/sec\n", averagePerformance );
	
	std::ofstream dataFile("FalseSharingTempData.txt", std::ofstream::out | std::ofstream::app);
	dataFile << NUMT << ", " << peakPerformance << ", " << averagePerformance << "\n";

}