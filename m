From: schwab@suse.de (Andreas Schwab)
Date: Mon, 19 Nov 2018 12:23:14 +0100
Subject: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
Message-ID: <mvmo9alb9b1.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Could this be a stack overflow?

[ 2427.690000] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[ 2427.690000]
[ 2427.690000] CPU: 1 PID: 3540 Comm: kworker/u8:2 Not tainted 4.19.0-00014-g978b77fe75 #6
[ 2427.690000] Workqueue: writeback wb_workfn (flush-179:0)
[ 2427.690000] Call Trace:
[ 2427.690000] [<ffffffe000c867d4>] walk_stackframe+0x0/0xa4
[ 2427.690000] [<ffffffe000c869d4>] show_stack+0x2a/0x34
[ 2427.690000] [<ffffffe0011a8800>] dump_stack+0x62/0x7c
[ 2427.690000] [<ffffffe000c8b542>] panic+0xd2/0x1f0
[ 2427.690000] [<ffffffe0011bb25c>] schedule+0x0/0x58
[ 2427.690000] [<ffffffe0011bb470>] preempt_schedule_common+0xe/0x1e
[ 2427.690000] [<ffffffe0011bb4b4>] _cond_resched+0x34/0x40
[ 2427.690000] [<ffffffe001025694>] __spi_pump_messages+0x29e/0x40e
[ 2427.690000] [<ffffffe001025986>] __spi_sync+0x168/0x16a
[ 2427.690000] [<ffffffe001025b86>] spi_sync_locked+0xc/0x14
[ 2427.690000] [<ffffffe001077e8e>] mmc_spi_data_do.isra.2+0x568/0xa7c
[ 2427.690000] [<ffffffe0010783fa>] mmc_spi_request+0x58/0xc6
[ 2427.690000] [<ffffffe001068bbe>] __mmc_start_request+0x4e/0xe2
[ 2427.690000] [<ffffffe001069902>] mmc_start_request+0x78/0xa4
[ 2427.690000] [<ffffffd008307394>] mmc_blk_mq_issue_rq+0x21e/0x64e [mmc_block]
[ 2427.690000] [<ffffffd008307b46>] mmc_mq_queue_rq+0x11a/0x1f0 [mmc_block]
[ 2427.690000] [<ffffffe000ebbf60>] __blk_mq_try_issue_directly+0xca/0x146
[ 2427.690000] [<ffffffe000ebca2c>] blk_mq_request_issue_directly+0x42/0x92
[ 2427.690000] [<ffffffe000ebcaac>] blk_mq_try_issue_list_directly+0x30/0x6e
[ 2427.690000] [<ffffffe000ebfdc2>] blk_mq_sched_insert_requests+0x56/0x80
[ 2427.690000] [<ffffffe000ebc9da>] blk_mq_flush_plug_list+0xd6/0xe6
[ 2427.690000] [<ffffffe000eb3498>] blk_flush_plug_list+0x9e/0x17c
[ 2427.690000] [<ffffffe000ebc2f8>] blk_mq_make_request+0x282/0x2d8
[ 2427.690000] [<ffffffe000eb1d02>] generic_make_request+0xee/0x27a
[ 2427.690000] [<ffffffe000eb1f6e>] submit_bio+0xe0/0x136
[ 2427.690000] [<ffffffe000db10da>] submit_bh_wbc+0x130/0x176
[ 2427.690000] [<ffffffe000db12c6>] __block_write_full_page+0x1a6/0x3a8
[ 2427.690000] [<ffffffe000db167c>] block_write_full_page+0xce/0xe0
[ 2427.690000] [<ffffffe000db40f0>] blkdev_writepage+0x16/0x1e
[ 2427.690000] [<ffffffe000d3c7ca>] __writepage+0x14/0x4c
[ 2427.690000] [<ffffffe000d3d142>] write_cache_pages+0x15c/0x306
[ 2427.690000] [<ffffffe000d3e8a4>] generic_writepages+0x36/0x52
[ 2427.690000] [<ffffffe000db40b4>] blkdev_writepages+0xc/0x14
[ 2427.690000] [<ffffffe000d3f0ec>] do_writepages+0x36/0xa6
[ 2427.690000] [<ffffffe000da96ca>] __writeback_single_inode+0x2e/0x174
[ 2427.690000] [<ffffffe000da9c08>] writeback_sb_inodes+0x1ac/0x33e
[ 2427.690000] [<ffffffe000da9dea>] __writeback_inodes_wb+0x50/0x96
[ 2427.690000] [<ffffffe000daa052>] wb_writeback+0x182/0x186
[ 2427.690000] [<ffffffe000daa67c>] wb_workfn+0x242/0x270
[ 2427.690000] [<ffffffe000c9bb08>] process_one_work+0x16e/0x2ee
[ 2427.690000] [<ffffffe000c9bcde>] worker_thread+0x56/0x42a
[ 2427.690000] [<ffffffe000ca0bdc>] kthread+0xda/0xe8
[ 2427.690000] [<ffffffe000c85730>] ret_from_exception+0x0/0xc

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
