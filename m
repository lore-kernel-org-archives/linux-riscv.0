Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D89ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+5SkGUpWNA7Sy7hmPE2nO0V6lB1G4DD3CLBSCISWP8=; b=JJgQW4TFiM9OVX
	N4QS+kx+Bt2NJkzlR9vCv/prhr9TL9w+PlBDDB/GfU2ukLIim0PTvJEYRCBWg0f1wBrziaYuzhpZ1
	6EnrP5Spo8gPINkClr4EJxfXyXWjQABbUMtLMtrFa5VNE2XdPGrjVd3nBNMSV/rUdXXDeatHRhAEI
	z86S/0khAb8w7Pmfu8WdVP3cdmdGJ1LKvrGMQ25PiQp1rpgEAYdRWEayRD/ANCxg1okbX624cjTnG
	O1CxDyNH/YRRPGZDG8xWztDv2izkM2bW3FhbvY3BDD2utth7Nc3Vuqjp+xNDy+iYtlSoUQ9CCSXra
	YBiw3d2fPA/OPHj6RLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo8wV-00EjDT-1T; Thu, 27 Oct 2022 19:53:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo8wR-00EjD1-Rs
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 19:53:29 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo8wL-0002tI-AN; Thu, 27 Oct 2022 21:53:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>, mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, samuel@sholland.org
Subject: Re: [PATCH v6 0/2] riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Thu, 27 Oct 2022 21:53:20 +0200
Message-ID: <3621249.aeNJFYEL58@diego>
In-Reply-To: <mhng-0bf8c154-76ce-4cd3-bfdb-ffd8a4670600@palmer-ri-x1c9>
References: <mhng-0bf8c154-76ce-4cd3-bfdb-ffd8a4670600@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_125327_979335_C457B0BF 
X-CRM114-Status: GOOD (  25.68  )
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

Am Donnerstag, 27. Oktober 2022, 07:02:59 CEST schrieb Palmer Dabbelt:
> On Tue, 11 Oct 2022 16:18:39 PDT (-0700), heiko@sntech.de wrote:
> > The PMU on T-Head C9xx cores is quite similar to the SSCOFPMF extension
> > but not completely identical, so this series
> 
> The rest of that sentance got dropped, so I put in
> 
>     The PMU on T-Head C9xx cores is quite similar to the SSCOFPMF extension
>     but not completely identical, so this series adds a T-Head PMU errata
>     that handlen the differences.
> 
> but LMK if you had a better version, it's still early so I don't mind 
> swapping it around.

sounds just fine and sorry for not finishing that sentence on my own.


> b4 also got kind of confused here so I had to merge suff manually.

do you still know what b4 complained about?

My patch workflow is pretty basic (git format-patch + separate
git send-email) so I guess it might be interesting what it was
stumbling on.

Thanks
Heiko


> > changes in v6:
> > - follow Anup's suggestion and hook into the (pending) cpuinfo patch [2]
> >   instead of modifying the core sbi_get_* functions
> >
> > changes in v5:
> > - add received Reviews
> > - fix sbi caching wrt. negative values (Drew)
> > - add comment about specific c9xx arch- and imp-ids (Conor)
> >
> > changes in v4:
> > - add new patch to cache sbi mvendor, march and mimp-ids (Atish)
> > - errata dependencies in one line (Conor)
> > - make driver detection conditional on CONFIG_ERRATA_THEAD_PMU too (Atish)
> >
> > changes in v3:
> > - improve commit message (Atish, Conor)
> > - IS_ENABLED and BIT() in errata probe (Conor)
> >
> > The change depends on my cpufeature/t-head errata probe cleanup series [1].
> >
> >
> > changes in v2:
> > - use alternatives for the CSR access
> > - make the irq num selection a bit nicer
> >
> > There is of course a matching opensbi-part whose most recent implementation
> > can be found on [0].
> >
> >
> > [0] https://patchwork.ozlabs.org/project/opensbi/cover/20221004164227.1381825-1-heiko@sntech.de
> > [1] https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/
> > [2] https://lore.kernel.org/r/20220727043829.151794-1-apatel@ventanamicro.com
> >
> > Heiko Stuebner (2):
> >   RISC-V: Cache SBI vendor values
> >   drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head
> >     C9xx cores
> >
> >  arch/riscv/Kconfig.erratas           | 13 +++++++++++
> >  arch/riscv/errata/thead/errata.c     | 19 ++++++++++++++++
> >  arch/riscv/include/asm/errata_list.h | 16 ++++++++++++-
> >  arch/riscv/include/asm/sbi.h         |  5 ++++
> >  arch/riscv/kernel/cpu.c              | 30 +++++++++++++++++++++---
> >  drivers/perf/riscv_pmu_sbi.c         | 34 ++++++++++++++++++++--------
> >  6 files changed, 103 insertions(+), 14 deletions(-)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
