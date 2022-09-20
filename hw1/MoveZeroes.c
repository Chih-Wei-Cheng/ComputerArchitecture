/* LeetCode 283 Move Zeroes
 * Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 * Note that you must do this in-place without making a copy of the array.
 */

#include <stdio.h>
#include <stdlib.h>

void moveZeroes(int* nums, int numsSize){
    int next_nonzero_index = 0, i = 0;
    for(i=0 ; i<numsSize ; i++){
        if(nums[i] != 0){
            nums[next_nonzero_index] = nums[i];
            if(next_nonzero_index != i){
                nums[i] = 0;
            }
            next_nonzero_index++;
        }
    }
}
int main(){
	int array_size=0, i=0;
	int *array = NULL;
	scanf("%d", &array_size);
	array = (int *)malloc(array_size * sizeof(int));
	for(i=0 ; i<array_size ; i++){
		scanf("%d", &array[i]);
	}
	moveZeroes(array, array_size);
	for(i = 0 ;i < array_size ; i++){
		printf("%d ", array[i]);
	}
	
	return 0;
}
