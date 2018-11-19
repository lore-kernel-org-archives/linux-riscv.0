Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98C8C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 11:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E7220823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 11:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fkQvk4Zr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gtXRjRdS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E7220823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8wAb8bz7F20xtoR5jGE8zL9PB9D34povoZVUbn7EQU=; b=fkQvk4Zr/XTAYo
	Y1K4IZyfiWvkQJ2H/ZVGgkvKk5Zdb38gSygT7NxJE6j2Dmr/OWXswdMlvKguQQlN/IUFxjJhcNdhW
	Ji4xoReJKrrkdRI8yeSXYLaUrPs8/xfLNUfKZ5Tx9VYyzx+oz3XHwhMVUXQdUNT8haF8kmG01PBZH
	PyquTKiLK7t7vjMn9bcy1MNpopFwRBCQzp01/js9+MbkI2WDXuZfzjxMvsz+8VaOZ9lqPn663sFEv
	w6cvo59X5mfVWnnFR2062vFuU6qrMb1p6bqdpVFwDny6AYQxPcOqstB4DcIQEetT31ALW3EAMh9an
	cBD0pmv80HdqYiminRLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOheM-0006kY-43; Mon, 19 Nov 2018 11:23:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOheL-0006kS-37
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2z98t0weGTtyoHja4x+2VZjP+03sOr9J8yf0qXmXLDQ=; b=gtXRjRdSxpYRWr/XbkLtg8UrYv
 F4Xx3mYBJEdWDnEmDdypG7kQsOZEk3GtF4YXJMHwoRQPvhfBuza7vhAL6FwR5kIIBfIUr0TGd6EE/
 q98zyJIzcaUNnylds+rGpJLqQ2heBrXNLWoWoQdCEn5SZ4ScU9JPdcIAdTJHd9P0cf20tbEzysndv
 hO3AQxprO4/UNebE6pzQ8FRqOjzDN0uf+3i14A+L8OOBw+pSszPzA6RBXfV+gu4Jk/8LGpNlGI5bh
 CK+VsWcoYnyF/VrXv4n1VTIBjRAjareucYNtQVqjvV8JPDCJ0NhZQU9h/yc8aVIuPf0Pvkgyl+UNy
 BrVRFYVQ==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOheI-0004yx-5M
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 11:23:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40FF6AE4F
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 11:23:15 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
X-Yow: Gee, I feel kind of LIGHT in the head now, knowing I can't make
 my satellite dish PAYMENTS!
Date: Mon, 19 Nov 2018 12:23:14 +0100
Message-ID: <mvmo9alb9b1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_112326_213425_4DFB6DA7 
X-CRM114-Status: UNSURE (   5.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119112314.lvaE8yTNY5qmcKUvCGsFXLcpkYoJuwELxUE7KMmOB-Q@z>

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
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
