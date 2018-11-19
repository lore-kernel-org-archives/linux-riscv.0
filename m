Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76120C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 14:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE86206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 14:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lGxVUU3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lbkLGNSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE86206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1vYgGrIOeTXxB3tMFWAACNj4C+GSsWTBOjPufrPbzY=; b=lGxVUU3n01fnfE
	eIw2ZeIW69c5ju7qzHJKxSNRZZdRAO9AmJIjejxiwZ1X33tTNDxAohs8PBVsQC6myklb1XMaOJ+fe
	ikjCHw4SjqjVvglda7nKEjpF1+jaUhe8vw38nMYdJuafX60/EzF9e92AZCU3UjAVHDXPCxf6wSqBg
	Uh53X7xWiseXepRLh8G3d2IaplR68xLd/gSS/yBdNMVABP6Gpqy99IY8FrodbKVbYkrbsIpYU3jg3
	8GohjrgfqCmNX/4Q2ksgMTr1iJnTQv1QRpJeny0EWP4xOivneOUWo7K2oUQGHrskOw+HmDHt3VwMv
	hX4LNl23FWIvJqGteseg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOkzW-0005cr-7q; Mon, 19 Nov 2018 14:57:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOkzU-0005cl-CK
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 14:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqbTCtADTeHUFEh07nXTxhTn2X6GYzWbawSxFF1MaHk=; b=lbkLGNSLqXT++UU+FoX+w+Cxb
 pE9jpcq4x7njN2QU+grphTDzewHpA32nyCbY40YOrbaoKX7Ed/ea4S0xC7bghWkORFRP2hlz965SS
 zKbqTWq935vM7emAzkMMhZ9DAeui1SpVKsh0fdAFK38uGw7Gp2Q9Kdm6HpYB8I256g4FpiaOAfkEU
 RP55OjnsmqcQGTxLiHEPPGN/HzPRmq1hN5rH+n1Ne19IHcJ3c44hhcJAph2vKV7ViXwgqn42i1lxt
 2VMeBT3w/+McWLDgUiSTMIodVwSYFb372QygN/4nOGDUm2wMUT577wa5A2R9mSDcRcL3SlJAsKATX
 HQeJUPOIQ==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOkzR-0004sL-Af
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 14:57:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C4DEACE5;
 Mon, 19 Nov 2018 14:57:18 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
X-Yow: Where's th' DAFFY DUCK EXHIBIT??
Date: Mon, 19 Nov 2018 15:57:17 +0100
In-Reply-To: <20181008100728.24959-2-quentin.schulz@bootlin.com> (Quentin
 Schulz's message of "Mon, 8 Oct 2018 12:07:23 +0200")
Message-ID: <mvm8t1pazea.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_145729_393067_2CB5F1EC 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119145717.O7CVyvrtGGZ0ueePpuJ7g8Wo1bZJy3Uw4v0dORpuOT4@z>

On Okt 08 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> The Microsemi PHYs have multiple banks of registers (called pages).
> Registers can only be accessed from one page, if we need a register from
> another page, we need to switch the page and the registers of all other
> pages are not accessible anymore.
>
> Basically, to read register 5 from page 0, 1, 2, etc., you do the same
> phy_read(phydev, 5); but you need to set the desired page beforehand.
>
> In order to guarantee that two concurrent functions do not change the
> page, we need to do some locking per page. This can be achieved with the
> use of phy_select_page and phy_restore_page functions but phy_write/read
> calls in-between those two functions shall be replaced by their
> lock-free alternative __phy_write/read.
>
> Let's migrate this driver to those functions.

This has some serious locking problem.

[<0>] __schedule+0x25e/0x74c
[<0>] schedule+0x1a/0x58
[<0>] schedule_preempt_disabled+0xc/0x14
[<0>] __mutex_lock.isra.0+0x10e/0x22e
[<0>] __mutex_lock_slowpath+0xe/0x16
[<0>] mutex_lock+0x22/0x2a
[<0>] mdiobus_read+0x36/0x60
[<0>] vsc85xx_config_init+0x4c/0x1e2
[<0>] phy_init_hw+0x3c/0x52
[<0>] phy_attach_direct+0xec/0x1dc
[<0>] phy_connect_direct+0x1a/0x56
[<0>] macb_probe+0x800/0xb5e [macb]
[<0>] platform_drv_probe+0x3e/0x7e
[<0>] really_probe+0xba/0x310
[<0>] driver_probe_device+0x54/0xf2
[<0>] __driver_attach+0xde/0x106
[<0>] bus_for_each_dev+0x4a/0x72
[<0>] driver_attach+0x1a/0x22
[<0>] bus_add_driver+0x1ce/0x212
[<0>] driver_register+0x3a/0xd0
[<0>] __platform_driver_register+0x3a/0x42
[<0>] macb_driver_init+0x20/0x28 [macb]
[<0>] do_one_initcall+0x48/0x128
[<0>] do_init_module+0x4a/0x186
[<0>] load_module+0xd6a/0xe6a
[<0>] sys_finit_module+0xc6/0xfc
[<0>] check_syscall_nr+0x22/0x22

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
