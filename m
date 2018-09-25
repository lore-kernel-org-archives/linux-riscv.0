Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55506C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 05:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F862087A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 05:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GwtDjBrG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F862087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxFHfdkwpSAb6cnpt4F/6x4hTIc1nmD3mzARsMscOJU=; b=GwtDjBrGYWBNxd
	LxcVZG3l4OpWi7vXiZsY/5JOYi1gkx5/nByBiAxmsJBeuGueBxZtydcQOjx3f2BjnJdNAUydzGxWj
	pbg+Oi5DCPOLw3bcpbTEuga2p+3bh1JPLiBp99MJRZCQKB9IVYXU4R4g2aUg50nNVMO8B9F97qu/2
	4nXdNsHk+d/oPsWA+XcJOjhv1sqkSz0rn/aDJtlxIuOaKL4HK4Z/bRG7bED64GZbAxRLLjL2fX3YZ
	kmVa0HJ16mM13bmKJ6LFGTDvOf3Xmy03sjo+DnGZSnpbGbf4JZAegzlx3FJeQ+6OpQJSm9RSniibM
	YKq4ppB2JIGevgFR/EVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4gDu-0001ab-P4; Tue, 25 Sep 2018 05:49:26 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4gDX-0001Yx-EW
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 05:49:04 +0000
Received: by mail-qt1-f194.google.com with SMTP id c25-v6so6386924qtp.6
 for <linux-riscv@lists.infradead.org>; Mon, 24 Sep 2018 22:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkUhX1NaZ71n//SXTrSIxhMnJube6PgBVszujUt3naw=;
 b=ITd/uiqjvNUNMypXcYr8il5v6lYfpTUgrO6Gc9Pcq25Wvg4arwl5725KSzAeqn/yyc
 VhjY6dRt0oviwxDP+QYKE8goy3exOwD1Ua0v4SSNgrbYL2mWO4QqM045xIri7+nYkp+L
 yEj0fnvhAye+OzEZb9mwWgsspOkXE60X2vEAf3V62bqJer4BJvbTHSe/j/aKFs3lJ8ck
 47Gj+QS/RTgnN+JC1e4Bm2t7qm8x4o8vW2ZIerrq3D/DxHp6gRQsy/noLIVvHa1D9np/
 JLBBk2zOZgh+a3gy1wl7ZbOdP9qxo8k0DazOSA6cnDPll+sCmbpwizjGRv+h2DWNF58L
 8O9g==
X-Gm-Message-State: ABuFfojqvK3Z8Cc1DtA9ZjYwbPuUd8ovG4XnVx++15Xvz+5SQHd26rGZ
 8uFFdgaM1S5nbQq+86ot90fStuWgYufDBdxftTao4A==
X-Google-Smtp-Source: ACcGV60vrNr2Uui7t1uho+AndUrBC5Frerr9gHsufr1XJmCN+Oxe4LTOlJKw343BIHhJsCwzLuX72jpdFEDauSOrQbY=
X-Received: by 2002:aed:316b:: with SMTP id 98-v6mr1695239qtg.9.1537854511497; 
 Mon, 24 Sep 2018 22:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <q3worc5qfj.fsf@armitage.lysator.liu.se>
In-Reply-To: <q3worc5qfj.fsf@armitage.lysator.liu.se>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 25 Sep 2018 07:48:14 +0200
Message-ID:
 <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
Subject: Re: mmcqd/0 stuck at 100% CPU
To: marcus@lysator.liu.se
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_224903_490337_35D113C9 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925054814.aL1VOxw-8LN7UbG0TjwCXweArG58bEXF6uVu_lI4cJU@z>

On Tue, Sep 25, 2018 at 3:38 AM Marcus Comstedt <marcus@lysator.liu.se> wrote:
> I'm writing this mail to inform about an issue with the SDcard driver on
> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
> from git + patch-4.15.18.xz from kernel.org).

Can you try a newer kernel version?

> So what is mmcqd/0 doing?  Checking /proc/74/stack gives one of three
> results:
>
> # cat /proc/74/stack
> [<0>] __schedule+0x1c6/0x4ea
> [<0>] 0xffffffffffffffff
> # cat /proc/74/stack
> [<0>] __schedule+0x1c6/0x4ea
> [<0>] blk_fetch_request+0x12/0x56
> [<0>] mmc_queue_thread+0x56/0xf6
> [<0>] kthread+0xcc/0xde

This part of the mmc stack was completely rewritten in 4.16
(after many years of not changing much), so the results will
be very different. If there is a bug in the driver, it may show
in a different way though.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
