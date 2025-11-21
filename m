Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DADCFA473
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 05:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ8HyWkPqmLX9kQWamL8Tr3EWNVpfJtfWvTk2LzjBJY=; b=ujueH6VcIOsw9S
	/QYu8+f2dbDjRDwgKG2v2SnrxHb+8I+7utTcHBrFOg0UUUxiyCUHDv8ckbUeGRdHrXBQkprFML832
	MrvIj/7gsj+8dG1sAjm9qfCo4TgmiwoXEB2qSImva2JPT85ThTDtGqHqTilL/FJgEqKBsky1gSNyR
	lbWTV7NM0kQFZvFRBiXH9h6w6fp/YEhDo8RR7rcCZM2buUOoJlVT2+9CvSOh57WiQkg5RNHBRNY8r
	0i3XobsmZrnki3WdUIOsHEsUJfhDj7XV5c/TLCDUtDXFUBa3MlrldT3MMbbK3HhhysgOUuOhZ1Mov
	aYLqpDNVlgS8kBYsGp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZw-00000007pw3-2Ice;
	Fri, 21 Nov 2025 05:21:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZm-00000007ptb-3hPf
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 05:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43DD6444DC;
	Fri, 21 Nov 2025 05:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17684C4CEFB;
	Fri, 21 Nov 2025 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702454;
	bh=yusO0uQN14S6dK5wVmEdCIvoT5mDHm1dk9z9DY6DrPw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j7kch2yyq1xSD0kBpihOVxhsx6tDSVaP/OlwJVyXJra4cjmV1SkWI/9eEir3y64QT
	 Xc7s50VgbQEjF2AMdydhZPcAA7rA9CgZAhsDfKfHRhezr4Wc3+ih0/EzmvxbhaLfr/
	 JXsOcu3BSsVZXFPAp9/owxJMSxq0SertMFTYKEJGHqjK7vlQGQBMtVfg+pyUWYkxTD
	 Ke9TR+sLbcuki54jNodw4/c38iCjNXkHVKRkQI53eoT6j8souvMpaEU5p9UMUfgl6o
	 8obFhCdt7hVCn+9DWYCZDRR5YO1qapPvEFvqyH3W0Ka1SJsY3GtB8YoBlwFkkbZfAF
	 Jpk7vlMW8GTBQ==
MIME-Version: 1.0
In-Reply-To: <20251117190329.1337250-1-cmirabil@redhat.com>
References: <20251117190329.1337250-1-cmirabil@redhat.com>
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, dlan@gentoo.org, heylenay@4d2.org, elder@riscstar.com, troy.mitchell@linux.spacemit.com, inochiama@outlook.com, Charles Mirabile <cmirabil@redhat.com>, Yanko Kaneti <yaneti@declera.com>
To: Charles Mirabile <cmirabil@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 20 Nov 2025 19:04:50 -0800
Message-ID: <176369429000.11952.15242492549872244422@localhost.localdomain>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_212054_943017_A651B431 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Charles Mirabile (2025-11-17 11:03:29)
> When booting with KASAN enabled the following splat is encountered during
> probe of the k1 clock driver:
> 
> UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
> index 0 is out of range for type 'clk_hw *[*]'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(lazy)
> Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022
> Call Trace:
> [<ffffffff8002b628>] dump_backtrace+0x28/0x38
> [<ffffffff800027d2>] show_stack+0x3a/0x50
> [<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
> [<ffffffff80022100>] dump_stack+0x18/0x20
> [<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
> [<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
> [<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
> [<ffffffff80b79e6e>] platform_probe+0x56/0x98
> [<ffffffff80b76a7e>] really_probe+0x9e/0x350
> [<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
> [<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
> [<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
> [<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
> [<ffffffff80b76296>] driver_attach+0x26/0x38
> [<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
> [<ffffffff80b7836a>] driver_register+0x52/0x100
> [<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
> [<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
> [<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
> [<ffffffff81401c60>] do_initcalls+0x170/0x1a8
> [<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
> [<ffffffff811f7534>] kernel_init+0x2c/0x180
> [<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
> [<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
> ---[ end trace ]---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
