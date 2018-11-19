Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F00BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 23:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BE442080C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 23:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ki4B3FXo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Y6SEi9+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BE442080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FVQz40ALwfQbcW9kessvtSE6YMT8lYWG+mCdYJIDkCg=; b=ki4B3FXodez9nQB6b0PWVOnIh
	LGg6v96dTOXYQI5KYYo2rt0BzRPbwJr7BVkL7Wx5aOgnNKztGO85bY+1qaJgXe7TWmcJz3uctFg5F
	29bcsuKJSr3cwqE/omGSq8bHt4U+J38tKwXM0CuPgjP5EuE21XfPhrfeoeCG/QuP6gUQG5Yd5AT7W
	iY6VMSMNjAhcuod1aIgDkvuGhaf3/v2Hb8aZ51P5W8gyRG27oUetohS4LGmgyZ4ma7Zog289RO1dk
	lA0ss5NuX36NkCAto1eZoUQlL9Kr8WcknbsKFH/HjGKmauJ45A6wVio/b63I00oeURG2ZREBokv/8
	DAlhwiPKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOtFm-0006QS-KB; Mon, 19 Nov 2018 23:46:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtFi-0006PE-QS
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 23:46:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id a14so22047plm.12
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 15:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Qa60pDiO8n+Bj+F7h0X74/S4CV8IRq+YH9eJwvGoYdI=;
 b=Y6SEi9+/We5iF4yPWJR0G4XsWaUwDoXWTHo9n42h3YQ6GM8AVheAu0w+Ecs1wOOC/6
 Pa/OHFaMrVOm8nPjdzsMVu8hd0IxrU1BTQtlExoN55mIY2FfoUt4SYpLliuWJ5/ictDT
 G1DvP1nN0/SycSoPQtqHcoYh7m6SMNk/2+JeXUoQbXOTvs0YRW9Yl7ynl4iYlMbRLL6i
 myhiSgOcoRGMHbCOzL2QZOkCGcas2viIwMP5cTi41S9oDr+AYjHfQY5eIiLWdUI2MDYv
 UQ+hHH1/OPUUBa4DzJ+VPK9G1fNogIezry7YWuLFA4ahnrasspFk+aW/ExI2y4j0pcsq
 Sp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Qa60pDiO8n+Bj+F7h0X74/S4CV8IRq+YH9eJwvGoYdI=;
 b=fmN8WYo92cX/o417dtcAD2LQdugmNeQZ47PQbRfjsz6rQjlgnVz4MLgqtWCsKa4600
 51dCzWOcz6dlJwNZiaeU/1iMtE6Llb8PRDx82ivi3F0hrMrQKF4zD9eJfYq0fWcfhxtw
 r6mFRBNYPybZp7he/tFLmsvus1+BX26Yr6rVGQgRRu71bP7znezG9t9aY90+481Zfvbs
 QLM4g5h1Mnzir7H5lnjeuB5sXXTnPm8E0tZQ+a5vfR+lSmpRZyopReudD+H4AyXWiZIY
 NEKKhtqLT4D9svUKjIPhjQIcu4h/TxSGzuqfcuWP5TQEpAEXbzjhh9oxGsZoxZNVxOiz
 ziHA==
X-Gm-Message-State: AGRZ1gIS2f2TcmgaAUbdeBDqJW2xU72OPhJtPcKlE4NxX/3PwM2ivORU
 mqlswFe4zyZIZIybloFXLVzwncOCWOE=
X-Google-Smtp-Source: AJdET5cIKHSuYZQhTMxYDERSsXIKXjiEHLeB8u9CWZI1LJ2UC3VjetS1gvsnM5l9/6Az6wRWV3zN1w==
X-Received: by 2002:a17:902:64c1:: with SMTP id
 y1mr14929561pli.64.1542671197882; 
 Mon, 19 Nov 2018 15:46:37 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k24sm34486115pfj.13.2018.11.19.15.46.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 15:46:37 -0800 (PST)
Date: Mon, 19 Nov 2018 15:46:37 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 15:44:19 PST (-0800)
Subject: Re: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
In-Reply-To: <mvmo9alb9b1.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-ce3ee330-9ac5-41c3-9890-ee9d6dabe105@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_154650_896070_4E797EFE 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119234637.zTRODJWL5nCeZsIKI_eC6ux505QPvtjZqYUx29pfYvI@z>

On Mon, 19 Nov 2018 03:23:14 PST (-0800), schwab@suse.de wrote:
> Could this be a stack overflow?

Yes.

> [ 2427.690000] Kernel panic - not syncing: corrupted stack end detected inside scheduler
> [ 2427.690000]
> [ 2427.690000] CPU: 1 PID: 3540 Comm: kworker/u8:2 Not tainted 4.19.0-00014-g978b77fe75 #6
> [ 2427.690000] Workqueue: writeback wb_workfn (flush-179:0)
> [ 2427.690000] Call Trace:
> [ 2427.690000] [<ffffffe000c867d4>] walk_stackframe+0x0/0xa4
> [ 2427.690000] [<ffffffe000c869d4>] show_stack+0x2a/0x34
> [ 2427.690000] [<ffffffe0011a8800>] dump_stack+0x62/0x7c
> [ 2427.690000] [<ffffffe000c8b542>] panic+0xd2/0x1f0
> [ 2427.690000] [<ffffffe0011bb25c>] schedule+0x0/0x58
> [ 2427.690000] [<ffffffe0011bb470>] preempt_schedule_common+0xe/0x1e
> [ 2427.690000] [<ffffffe0011bb4b4>] _cond_resched+0x34/0x40
> [ 2427.690000] [<ffffffe001025694>] __spi_pump_messages+0x29e/0x40e
> [ 2427.690000] [<ffffffe001025986>] __spi_sync+0x168/0x16a
> [ 2427.690000] [<ffffffe001025b86>] spi_sync_locked+0xc/0x14
> [ 2427.690000] [<ffffffe001077e8e>] mmc_spi_data_do.isra.2+0x568/0xa7c
> [ 2427.690000] [<ffffffe0010783fa>] mmc_spi_request+0x58/0xc6
> [ 2427.690000] [<ffffffe001068bbe>] __mmc_start_request+0x4e/0xe2
> [ 2427.690000] [<ffffffe001069902>] mmc_start_request+0x78/0xa4
> [ 2427.690000] [<ffffffd008307394>] mmc_blk_mq_issue_rq+0x21e/0x64e [mmc_block]
> [ 2427.690000] [<ffffffd008307b46>] mmc_mq_queue_rq+0x11a/0x1f0 [mmc_block]
> [ 2427.690000] [<ffffffe000ebbf60>] __blk_mq_try_issue_directly+0xca/0x146
> [ 2427.690000] [<ffffffe000ebca2c>] blk_mq_request_issue_directly+0x42/0x92
> [ 2427.690000] [<ffffffe000ebcaac>] blk_mq_try_issue_list_directly+0x30/0x6e
> [ 2427.690000] [<ffffffe000ebfdc2>] blk_mq_sched_insert_requests+0x56/0x80
> [ 2427.690000] [<ffffffe000ebc9da>] blk_mq_flush_plug_list+0xd6/0xe6
> [ 2427.690000] [<ffffffe000eb3498>] blk_flush_plug_list+0x9e/0x17c
> [ 2427.690000] [<ffffffe000ebc2f8>] blk_mq_make_request+0x282/0x2d8
> [ 2427.690000] [<ffffffe000eb1d02>] generic_make_request+0xee/0x27a
> [ 2427.690000] [<ffffffe000eb1f6e>] submit_bio+0xe0/0x136
> [ 2427.690000] [<ffffffe000db10da>] submit_bh_wbc+0x130/0x176
> [ 2427.690000] [<ffffffe000db12c6>] __block_write_full_page+0x1a6/0x3a8
> [ 2427.690000] [<ffffffe000db167c>] block_write_full_page+0xce/0xe0
> [ 2427.690000] [<ffffffe000db40f0>] blkdev_writepage+0x16/0x1e
> [ 2427.690000] [<ffffffe000d3c7ca>] __writepage+0x14/0x4c
> [ 2427.690000] [<ffffffe000d3d142>] write_cache_pages+0x15c/0x306
> [ 2427.690000] [<ffffffe000d3e8a4>] generic_writepages+0x36/0x52
> [ 2427.690000] [<ffffffe000db40b4>] blkdev_writepages+0xc/0x14
> [ 2427.690000] [<ffffffe000d3f0ec>] do_writepages+0x36/0xa6
> [ 2427.690000] [<ffffffe000da96ca>] __writeback_single_inode+0x2e/0x174
> [ 2427.690000] [<ffffffe000da9c08>] writeback_sb_inodes+0x1ac/0x33e
> [ 2427.690000] [<ffffffe000da9dea>] __writeback_inodes_wb+0x50/0x96
> [ 2427.690000] [<ffffffe000daa052>] wb_writeback+0x182/0x186
> [ 2427.690000] [<ffffffe000daa67c>] wb_workfn+0x242/0x270
> [ 2427.690000] [<ffffffe000c9bb08>] process_one_work+0x16e/0x2ee
> [ 2427.690000] [<ffffffe000c9bcde>] worker_thread+0x56/0x42a
> [ 2427.690000] [<ffffffe000ca0bdc>] kthread+0xda/0xe8
> [ 2427.690000] [<ffffffe000c85730>] ret_from_exception+0x0/0xc

It smells like the issue is somewhere in the SPI driver, which is known to be 
buggy.  I don't see anything specific to indicate this is a stack overflow in 
this stack trace (the stack stuff above panic is just part of the printing).

Sorry I can't be more specific.  Does this require hardware to manifest?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
