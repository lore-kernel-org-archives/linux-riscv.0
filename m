From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 10 Sep 2018 18:13:07 -0700
Subject: Memory allocation failure using GFP_DMA32 in 4.19-rc2
In-Reply-To: <20180910135231.GA19320@infradead.org>
References: <3aa15803-e86a-7aa2-e57c-93e43c3d046f@wdc.com>
 <20180910135231.GA19320@infradead.org>
Message-ID: <de897a8b-4961-247e-e90c-c5132bddf125@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/10/18 6:52 AM, Christoph Hellwig wrote:
> On Fri, Sep 07, 2018 at 02:50:52PM -0700, Atish Patra wrote:
>> Hi,
>> I got Radeon HD6450 GPU with Microsemi expansion board working on 4.17
>> kernel + all required out of tree patches (drivers/dma). However, I moved to
>> 4.19-rc2 and faces following error. It seems that kernel couldn't allocate
>> memory using GFP_DMA32. Other than this, kernel can boot and even detect
>> SATA devices.
> 
> Please take a look at /proc/zoneinfo how much memory there is in
> ZONE_DMA32.  Or send the file out if it looks too confusing.
> 
>>
>> | * | 1847e725 DMA cleanups (by Palmer Dabbelt 5 months ago)
>> | * | ee247f86 riscv: support for broken PCIe controllers (by Wesley W.
>> Terpstra 6 months ago)
>> | * | 9b994793 riscv: add DMA mappings suitable for a pure 64-bit system (by
>> Palmer Dabbelt 7 months ago)
>>
>> Any suggestions/pointers what might be wrong ?
> 
> None of the above should be needed for mainline.  Also try without them.
> 

I found the issue. /proc/zoneinfo did not report any available memory 
for DMA32 as there was no memory zone allocated for DMA32 during 
setup_bootmem().

Relevant dmesg output (with additional debug message)

[    0.000000] zone_sizes_init: DMA32 zone 0x280 nrmal zone 0x280000
[    0.000000] free_area_init_nodes: start pfn [0x80200]
[    0.000000] free_area_init_nodes: end pfn [0x80200] for zone = [DMA32   ]
[    0.000000] free_area_init_nodes: end pfn [0x280000] for zone = 
[Normal  ]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000080200000-0x000000027fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x000000027fffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000080200000-0x000000027fffffff]

The above issue can be fixed by your patch which was present in one of 
the wip-dma branch.

https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=wip-dma&id=004baee3b83c7ce1c70ff0b7a15fbc3946278af4

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f0d2070866d4..df3d0159f73b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -172,7 +172,7 @@ static void __init setup_bootmem(void)
  	BUG_ON(mem_size == 0);

  	set_max_mapnr(PFN_DOWN(mem_size));
-	max_low_pfn = pfn_base + PFN_DOWN(mem_size);
+	max_low_pfn = memblock_end_of_DRAM();

  #ifdef CONFIG_BLK_DEV_INITRD
  	setup_initrd();

However, the 4.19-rc2 kernel merged following patch from you. Strangely, 
both patches had exact same commit text and commit date but completely 
different code.

https://groups.google.com/a/groups.riscv.org/forum/#!topic/patches/7frysy0xc6g

I am not sure if both are required or the 1st one was never meant to be 
be merged but that one solves the problem at hand. Perhaps, the issue 
can be fixed in a different way ?

Regards
Atish
