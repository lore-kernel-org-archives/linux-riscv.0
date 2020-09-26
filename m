Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9913BC2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:17:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27553238E2
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5omhAkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27553238E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-mips.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=elbVws0rOQaTVDmhc+Jh1+ZSPB06DUI0591XeBpxKks=; b=E5omhAkrqmo84WBlSlP4bj3Q5
	Cfi7OsFUd25GqaiBFqEEwGAC9mPo8DhPKM9d9lq7du2pRODpWdWujYKeIlG5vgVBUoPk1Q1e3kDLP
	oxtINNRZQK8RuznU8YgEv9VKPAtN0n910UkZBt4t1icbklrZUU8zVQjYcks3sG0Icz3T1ht3/46XC
	pD9bqt4QJrAaFsYXps4P9AIoe6oKw2ebYctr6lsKFia/lbjEB8hkuGgvOuJWiv/So4dsLiK/yELJt
	QzUF358bESct6BZ3aaX2Bglzc0gf+dXqmGHmb0Su54GfyhGA3iGjRknQ/wYSu7YFRZEAArJeXokQL
	z8vxMkkqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM7GU-000773-A6; Sat, 26 Sep 2020 10:17:14 +0000
Received: from [78.8.192.131] (helo=orcam.me.uk)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM7GR-00076f-9m
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 10:17:12 +0000
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by orcam.me.uk (Postfix) with ESMTPS id 2F9902BE086;
 Sat, 26 Sep 2020 11:09:42 +0100 (BST)
Date: Sat, 26 Sep 2020 11:09:41 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
In-Reply-To: <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
Message-ID: <alpine.LFD.2.21.2009261054270.3561363@eddie.linux-mips.org>
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
 <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
 <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_061711_851004_E624EE55 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "anup@brainfault.org" <anup@brainfault.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020, Damien Le Moal wrote:

> > > Applying this on top of rc6, I now get a hang on Kendryte boot...
> > > No problems without the patch on the other hand.
> > 
> > Not sure about the issue with Kendryte but I get a crash on
> > QEMU virt machine without this patch.
> 
> With this applied in addition to your patch, it works.
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-
> clint.c
> index d17367dee02c..8dbec85979fd 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>  
>  #ifdef CONFIG_RISCV_M_MODE
> -u64 __iomem *clint_time_val;
> +u64 __iomem *clint_time_val = NULL;
>  #endif

 Hmm, BSS initialisation issue?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
