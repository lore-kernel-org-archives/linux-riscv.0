From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 7 Sep 2018 14:50:52 -0700
Subject: Memory allocation failure using GFP_DMA32 in 4.19-rc2
Message-ID: <3aa15803-e86a-7aa2-e57c-93e43c3d046f@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,
I got Radeon HD6450 GPU with Microsemi expansion board working on 4.17 
kernel + all required out of tree patches (drivers/dma). However, I 
moved to 4.19-rc2 and faces following error. It seems that kernel 
couldn't allocate memory using GFP_DMA32. Other than this, kernel can 
boot and even detect SATA devices.

Here is the relevant dmesg
-----------------------------------------------------------------------------
[    2.490000] [drm] GPU not posted. posting now...
[    2.500000] radeon 0000:04:00.0: VRAM: 1024M 0x0000000000000000 - 
0x000000003FFFFFFF (1024M used)
[    2.510000] radeon 0000:04:00.0: GTT: 1024M 0x0000000040000000 - 
0x000000007FFFFFFF
[    2.520000] [drm] Detected VRAM RAM=1024M, BAR=256M
[    2.520000] [drm] RAM width 64bits DDR
[    2.530000] [TTM] Zone  kernel: Available graphics memory: 4058868 kiB
[    2.530000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    2.540000] [TTM] Initializing pool allocator
[    2.540000] [TTM] Initializing DMA pool allocator
[    2.550000] swapper/0: page allocation failure: order:0, 
mode:0x8004(GFP_DMA32|__GFP_ZERO), nodemask=(null)
[    2.560000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
4.19.0-rc2-00288-g7bce0d67 #146
[    2.560000] Call Trace:
[    2.560000] [<ffffffe0000331d0>] walk_stackframe+0x0/0xa0
[    2.560000] [<ffffffe00003336c>] show_stack+0x2a/0x34
[    2.560000] [<ffffffe0005ee434>] dump_stack+0x62/0x7c
[    2.560000] [<ffffffe0000a4dca>] warn_alloc+0x8c/0xf6
[    2.560000] [<ffffffe0000a5630>] __alloc_pages_nodemask+0x790/0x8ba
[    2.560000] [<ffffffe0002cb510>] ttm_bo_global_init+0x4a/0xd2
[    2.560000] [<ffffffe0002b91a2>] drm_global_item_ref+0x5a/0xc0
[    2.560000] [<ffffffe0002ea9f6>] radeon_ttm_init+0x86/0x278
[    2.560000] [<ffffffe0002eb674>] radeon_bo_init+0x5e/0x68
[    2.560000] [<ffffffe000332736>] evergreen_init+0xce/0x2a2
[    2.560000] [<ffffffe0002d4578>] radeon_device_init+0x4f4/0xa2c
[    2.560000] [<ffffffe0002d6564>] radeon_driver_load_kms+0x8a/0x140
[    2.560000] [<ffffffe0002afbe6>] drm_dev_register+0xfe/0x162
[    2.560000] [<ffffffe0002b04fc>] drm_get_pci_dev+0x70/0xfe
[    2.560000] [<ffffffe0002d3154>] radeon_pci_probe+0x70/0x86
[    2.560000] [<ffffffe00024b4aa>] pci_device_probe+0x90/0xf6
[    2.560000] [<ffffffe0003a584a>] really_probe+0x178/0x1e4
[    2.560000] [<ffffffe0003a5a32>] driver_probe_device+0x7a/0x90
[    2.560000] [<ffffffe0003a5ae0>] __driver_attach+0x98/0x9a
[    2.560000] [<ffffffe0003a3fa6>] bus_for_each_dev+0x4a/0x72
[    2.560000] [<ffffffe0003a530c>] driver_attach+0x1a/0x22
[    2.560000] [<ffffffe0003a4eea>] bus_add_driver+0x156/0x1b8
[    2.560000] [<ffffffe0003a6066>] driver_register+0x3a/0xd0
[    2.560000] [<ffffffe00024ad84>] __pci_register_driver+0x38/0x40
[    2.560000] [<ffffffe000010bb8>] radeon_init+0x70/0x8c
[    2.560000] [<ffffffe00003139a>] do_one_initcall+0x2c/0x108
[    2.560000] [<ffffffe000000a38>] kernel_init_freeable+0x11e/0x1a6
[    2.560000] [<ffffffe0005ff50c>] kernel_init+0x12/0xf0
[    2.560000] [<ffffffe0000321ca>] ret_from_exception+0x0/0xc
[    2.730000] Mem-Info:
[    2.730000] active_anon:0 inactive_anon:0 isolated_anon:0
[    2.730000]  active_file:0 inactive_file:0 isolated_file:0
[    2.730000]  unevictable:0 dirty:0 writeback:0 unstable:0
[    2.730000]  slab_reclaimable:78 slab_unreclaimable:873
[    2.730000]  mapped:0 shmem:0 pagetables:0 bounce:0
[    2.730000]  free:2027459 free_pcp:276 free_cma:0
[    2.760000] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB 
inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB 
mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB 
unstable:0kB all_unreclaimable? no
[    2.780000] Normal free:8109836kB min:11396kB low:19512kB 
high:27628kB active_anon:0kB inactive_anon:0kB active_file:0kB 
inactive_file:0kB unevictable:0kB writepending:0kB present:8386560kB 
managed:8117736kB mlocked:0kB kernel_stack:360kB pagetables:0kB 
bounce:0kB free_pcp:1104kB local_pcp:264kB free_cma:0kB
[    2.810000] lowmem_reserve[]: 0 0 0
[    2.820000] Normal: 5*4kB (UM) 5*8kB (UME) 3*16kB (UM) 3*32kB (M) 
3*64kB (UME) 4*128kB (M) 5*256kB (UME) 5*512kB (UM) 3*1024kB (ME) 
4*2048kB (ME) 1976*4096kB (M) = 8109708kB
[    2.830000] 0 total pagecache pages
[    2.830000] 0 pages in swap cache
[    2.840000] Swap cache stats: add 0, delete 0, find 0/0
[    2.840000] Free swap  = 0kB
[    2.850000] Total swap = 0kB
[    2.850000] 2096640 pages RAM
[    2.850000] 0 pages HighMem/MovableOnly
[    2.860000] 67206 pages reserved
[    2.860000] [drm:radeon_ttm_init] *ERROR* Failed setting up TTM BO 
subsystem.
[    2.870000] [TTM] Finalizing pool allocator
[    2.870000] [TTM] Finalizing DMA pool allocator
[    2.870000] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[    2.880000] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[    2.890000] radeon 0000:04:00.0: Fatal error during GPU init
[    2.890000] [drm] radeon: finishing device.
[    2.900000] [TTM] Memory type 2 has not been initialized
[    2.910000] radeon: probe of 0000:04:00.0 failed with error -12

-----------------------------------------------------------------------------

I have ported riscv specific out-of-tree dma patches as well to my new 
branch.

| * | 1847e725 DMA cleanups (by Palmer Dabbelt 5 months ago)
| * | ee247f86 riscv: support for broken PCIe controllers (by Wesley W. 
Terpstra 6 months ago)
| * | 9b994793 riscv: add DMA mappings suitable for a pure 64-bit system 
(by Palmer Dabbelt 7 months ago)

Any suggestions/pointers what might be wrong ?


Regards,
Atish
