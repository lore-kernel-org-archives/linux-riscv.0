Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19625C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Um0Viw6JxlS0ZKttviPid6gsnaFDN+G6FGtISEu7Uao=; b=0ablnUlulaSxTO
	e49+ZG6A840hJ4Mbw5WY7jjFQpAOdOWd00r5kChWYVmRjUVNte0K0ov6TGnBe67fu861qrI5LA5gC
	+Ar4hzD5rUbjOFdD21dcWA1r4FPiU0pRIYWy4La77wfRg7kJnk8X59I+evNyPACySfkvnhHfZep7C
	Z665i4RHNmCK520qbF9txFrjyu9ABAqdSal8kst5ao+AK77igQdrYbtTVlTYJB3EyEURyeH3SJiLh
	CF/ObXsrkxD3Px8igg2CrCGZSCj35/K38RAEbFgdKr8k0p4afnh6JB38LH6jmyyhJMyPumsXwdzHq
	soHoj/Q4li6Jnv+7Danw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08np-00BVzR-Dy; Tue, 29 Nov 2022 22:10:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08nn-00BVz5-0k
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:10:08 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p08ni-0006MF-TH; Tue, 29 Nov 2022 23:10:02 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 4/5] RISC-V: hwprobe: Support probing of misaligned accesss performance
Date: Tue, 29 Nov 2022 23:10:02 +0100
Message-ID: <5662455.1IzOArtZ34@diego>
In-Reply-To: <mhng-e4edd80d-2aa6-4a56-a13d-2d75d7ddd82f@palmer-ri-x1c9a>
References: <mhng-e4edd80d-2aa6-4a56-a13d-2d75d7ddd82f@palmer-ri-x1c9a>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_141007_113804_CB7CAE63 
X-CRM114-Status: GOOD (  30.32  )
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

Am Dienstag, 29. November 2022, 22:18:18 CET schrieb Palmer Dabbelt:
> On Tue, 29 Nov 2022 13:09:49 PST (-0800), heiko@sntech.de wrote:
> > Am Donnerstag, 13. Oktober 2022, 18:35:50 CET schrieb Palmer Dabbelt:
> >> This allows userspace to select various routines to use based on the
> >> performance of misaligned access on the target hardware.
> >>
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > [...]
> >
> >> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> >> index cbda062de9bd..54bdcf9a5049 100644
> >> --- a/arch/riscv/include/asm/cpufeature.h
> >> +++ b/arch/riscv/include/asm/cpufeature.h
> >> @@ -18,4 +18,6 @@ struct riscv_cpuinfo {
> >>
> >>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >>
> >> +DECLARE_PER_CPU(long, misaligned_access_speed);
> >
> > just my 2ct ... wouldn't it make sense to have struct riscv_cpuinfo
> > as the central instance for all cpu-related stuff, so
> > misaligned_access_speed could also be part of it?
> 
> I remember going through this one a few times and ending up here despite 
> some cleaner-looking ways of doing it.  That way does look cleaner, 
> though, so I'll give it a shot and we'll see what happens...
> 
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >> index 553d755483ed..1599e40cd170 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -222,6 +226,22 @@ void __init riscv_fill_hwcap(void)
> >>  			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> >>  		else
> >>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> >> +
> >> +		/*
> >> +		 * Check for the performance of misaligned accesses.
> >> +		 */
> >> +		cpu = hartid_to_cpuid_map(hartid);
> >> +		if (cpu < 0)
> >> +			continue;
> >> +
> >> +		if (of_property_read_string(node, "riscv,misaligned-access-performance", &misaligned)) {
> >
> > I think this wants a "!" in front :-) .
> >
> > of_property_read_string() returns 0 on success, so running this
> > results in a nullptr right now.
> 
> Thanks.  I'd not gotten around to actually running this so I bet it's 
> broken in a bunch of ways.  Did you try it out?  I was really hoping to 
> find some time to get at least the simple stuff in for this cycle, but 
> too many things keep coming up.

I ran the code today, so bumped into the "!" issue.
I'm not yet "using" it, but that will come in the next days.

And no worries about that time-thingy, your series already provides
a nice pointer for the general direction to with things, so that is helpful
in its own right.

I will simply report any brokeness I find when it happens ;-) .


Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
