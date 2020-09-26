Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE875C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:52:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B30238E2
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INptLkaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B30238E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-mips.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UrKvXklAHH3hmGcjAGKDooYXtxz1FjSbyTYm55k/QME=; b=INptLkaRtW7D4nXOg5mY4Od1t
	0gC5y9m73KfUkKlh2SGUY3d5MN3i1YFkjY56F16LD5ncCXD+y9pO1zJDT7j9bZDuvfx0kn0f9sF9u
	GTMI+gwAmhGSsIDMWWg6WKG0mREVgbwevSq37mZu3Cyss4bpdiGVfJhL68KYtyF43eRnII4wfBddH
	sFbmWbboUqrjXuJTQB94pj15zXKW5OGN/fVlY2MrzkKvCtDaBlNM8UdrliVCd7s2UthK9QWE+e24m
	8i4fA+VFxfjjoWBT93KfhynhFB3JZwXowOIAGJSjty9EYVxzVUSmntvgqTyz5AlKfvr5OxP9DvQ2k
	V9H/xYExA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM7on-0001Fq-3U; Sat, 26 Sep 2020 10:52:41 +0000
Received: from [78.8.192.131] (helo=orcam.me.uk)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM7oj-0001FO-2z
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 10:52:38 +0000
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by orcam.me.uk (Postfix) with ESMTPS id BF1E92BE086;
 Sat, 26 Sep 2020 11:52:31 +0100 (BST)
Date: Sat, 26 Sep 2020 11:52:25 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
In-Reply-To: <8a99b16ae3037487b762fb1bbcd81b576d9e11ab.camel@wdc.com>
Message-ID: <alpine.LFD.2.21.2009261141060.3561363@eddie.linux-mips.org>
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
 <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
 <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
 <alpine.LFD.2.21.2009261054270.3561363@eddie.linux-mips.org>
 <8a99b16ae3037487b762fb1bbcd81b576d9e11ab.camel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_065238_280564_D30A7392 
X-CRM114-Status: GOOD (  11.68  )
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020, Damien Le Moal wrote:

> > > With this applied in addition to your patch, it works.
> > > 
> > > diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-
> > > clint.c
> > > index d17367dee02c..8dbec85979fd 100644
> > > --- a/drivers/clocksource/timer-clint.c
> > > +++ b/drivers/clocksource/timer-clint.c
> > > @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
> > >  static unsigned int clint_timer_irq;
> > >  
> > >  #ifdef CONFIG_RISCV_M_MODE
> > > -u64 __iomem *clint_time_val;
> > > +u64 __iomem *clint_time_val = NULL;
> > >  #endif
> > 
> >  Hmm, BSS initialisation issue?
> 
> Not a static variable, so it is not in BSS, no ?

 Maybe it has a weird declaration elsewhere which messes up things (I 
haven't checked), but it looks to me like it does have static storage 
(rather than automatic or thread one), so if uninitialised it goes to BSS, 
and it is supposed to be all-zeros whether explicitly assigned a NULL 
value or not.  It does have external rather than internal linkage (as it 
would if it had the `static' keyword), but it does not matter.  Best check 
with `objdump'/`readelf'.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
