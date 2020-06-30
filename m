Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FD6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 15:11:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B454C20720
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 15:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OYW+Cq6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B454C20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+2aHxU2fwAVy0OJpKrxNypMJ6Dhhxsr2VjKd4jzrbfE=; b=OYW+Cq6K2sT4Lop7qoTSnNQz2
	UTK4122OrN60L6N7T8+FvO6ArwHZfMwmi9ImRTjzlXyWsLZifg8V24Ht7yhPMczikG6xiUQG8NhX0
	lNLwnFKaPrh/ICgKlnnNrPdsac1TgqC01AD3UIhPv6AyVcvCYdsmzYNEnO6vB44PP0400KcEGr3Qq
	3w7z7WrNdyX18gvE9v9XTr3MP75ZjXI+mKeiewWdYe5auR//NnBB523lQEMgQkCHGmB345oej/NWV
	XEcFWR8WC/1YTgVvvUg4HWzgh75edxmKEMFTKwWnu/HWL6IW3iT9G5ODizZI4pNUKTvrja/aIjP+H
	bEu0XfRYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHuR-0000BD-IW; Tue, 30 Jun 2020 15:10:55 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHuP-0000B4-KZ
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 15:10:54 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49x78j2gj7zvjc1; Tue, 30 Jun 2020 17:10:45 +0200 (CEST)
Date: Tue, 30 Jun 2020 17:10:44 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: syzkaller on risc-v
Message-ID: <20200630151044.ds5junfupcokcei6@distanz.ch>
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-06-30 at 14:48:31 +0200, Dmitry Vyukov <dvyukov@google.com> wrote:
[...]
> 6. I observed lots of what looks like user-space process memory
> corruptions. There included thousands of panics in our Go programs
> with things that I would consider "impossible", at least they did not
> come up before in our syzbot fuzzing. Also some Go runtime
> "impossible" crashes, e.g.:
> https://gist.githubusercontent.com/dvyukov/fb489ed93f7180621c71714ee07e53dc/raw/a7d2e98a56da17af2aec79c164cd3a8e154ecf5c/gistfile1.txt
> Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
> Though it's not necessary Go b/c kernel contains hundreds of memory
> corruptions and we observed kernel corrupting user-space processes
> routinely. This is especially true without KASAN because kernel
> corruptions are not caught early. However, the ratio and nature of
> crashes makes me suspect some issue in Go risc-v runtime.

I haven't seen any of these crashes myself when testing the syzkaller
port, but then again I only ran it for rather brief amounts of time
(~1h) on my laptop using the riscv defconfig and a few additional
configs enabled.

AFAIK Go tip has seen quite some improvments to its RISC-V port, so it
might be worth giving it (or Go 1.14beta1) a try.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
