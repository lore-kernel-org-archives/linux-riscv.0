Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF1C43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917C321582
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jiAGkX+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917C321582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HV6OVeDx9GusTIycL3J3Cv6Vr/vSDyKBY9hLFUcuiC8=; b=jiAGkX+RBAMilrbtJdy3ehPNf
	ggslHTRCp17jAjEGgdq/ZVphY8ciSmYNJp+VXwYRYuEgdy8AtqScDe7iqL3e0U+XzmjCPoHlUcrhf
	Me7wSQFvejbmXRbnPgsNg36ZF/Z75p6RqdoKzw8fL/D2EGqSGpp0v/nGWWecUXgnDsZfOX4L1+o1e
	AeT99yO2qA5mJg1a5jIzUyWINE16cN9KLMwocgr5MvSvwGgNLyYDkhYAoBeutAUOklMry6G/QIGye
	OgJA+IafmtmOy2IrhCrMM81uIbNrJMgee5q4uHTAPlRKqjbPYcnlxL327YPofb3vbLMBWOyfXYvDh
	VqwWvLkIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAUT-0005ro-Se; Mon, 07 Sep 2020 06:18:57 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAUS-0005rM-DV
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 06:18:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90B7E68BFE; Mon,  7 Sep 2020 08:18:53 +0200 (CEST)
Date: Mon, 7 Sep 2020 08:18:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64
 for M-mode kernel
Message-ID: <20200907061853.GA19038@lst.de>
References: <20200904165709.GA32667@lst.de>
 <mhng-5249e999-3e82-417d-8d39-dcb4a159bd83@palmerdabbelt-glaptop1>
 <CAAhSdy0HW8Rjyoiu+Ldx31C9zCBdxJZxhDBcXC4sgitfXnPNDg@mail.gmail.com>
 <CAAhSdy3ESD6L_T1rFprDF2jduN8buTz173F6_mYCbTL3s4RG2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3ESD6L_T1rFprDF2jduN8buTz173F6_mYCbTL3s4RG2A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_021856_570742_004F5D14 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 05, 2020 at 11:05:48AM +0530, Anup Patel wrote:
> Your patch will also break if the SOC specific timer has a 32bit
> free-running counter
> unlike the 64bit free-running counter found on CLINT.
> 
> I guess it's better to let the SOC timer driver provide the
> method/function to read the
> free-running counter.

Seriously, build the interfaces once you know the consumers.  Don't
build pie in the sky interfaces just because you can, because that
is what creates all the problems.

And of coruse at least for IPIs which absolutely are performance
criticical we need a standard interface (one that doesn't suck as much
as the SBI detour with the four extra context switches).  But I guess
I have already given up on RISC-V because the incompetency about things
like the irq design are just so horrible that it isn't worth bothering
any more.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
