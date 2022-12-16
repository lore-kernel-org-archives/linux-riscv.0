Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D01C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 01:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwMfdexo/sF5y5dRMzVKm8sJph932c701Rw6IfLpDTw=; b=vn8/mOxQmoStPH
	A9WO3ItaRvKSH+6nvZ67Wyr9gu2lB7z/oauq4oZaBwfE6jfa+aSbsUu8hMkXQmQFiLkj1b3M5eZ8x
	HkV7e+crqBsd3LT8xpqX6e1q0Pc5NuUYlBUnMBxTLML5atHGWiOrIA/vxwkL/qYCcjSaTkyN5PvfC
	XjdyKRayyFwQsyAtFdW17CFg49l6IGeKRGtw+gP+wD3sax0mODuExU8vBPep5okZM1ux4RkGDegEQ
	qnMa3Kenk2nN+m1aix97R/w90c46m+38XbJ06ZA2DeOtIqRQ2sk29SbHSnh3gw4GLey1p/ZQerbp/
	UyvC1rOILDo9KgswTj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5zaI-00CEkr-DS; Fri, 16 Dec 2022 01:32:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5zaF-00CEk0-Tb
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 01:32:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E660361FD9
	for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 01:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570A1C433F1
	for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671154337;
	bh=WWdQKzHA8nf22v/OFQFI1ds1vcA1UIuh7vvuZYDECOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nCvaCS6gHauVcBnVZfKURpicxhfn6G/YiBVLvNYVEhlboSe3tt6CkCOb2d9V7oWAd
	 gFMyeW9YkLwNH3Ivsu3vHl0iEzbbEXr3CuqgvhFllbiXBrd4brWuM2MvFIO368vk98
	 KSufTeTdJVrOg5YvbCLnmu9FgrLaDneKCi5xvF6mJmdgOLB9hPuhJlG97U3GozqbNL
	 HdLyYdaGSgV9pD9ploRUbnd04XLQ9i2lKVwa3KUdkgEnS3X6jbvSiM7co2dHs96TB0
	 LTQr/Oa8TtTA8DRMp6qPGmYutjdRrN+AoAzuZhXQVIs8gHtIe29Gy57+yejmobNEWF
	 ujPpuADwbP9Qg==
Received: by mail-ed1-f43.google.com with SMTP id b69so1709932edf.6
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 17:32:17 -0800 (PST)
X-Gm-Message-State: ANoB5pmcJJn46hNAkAPhQoGOtyk42gcbzVbID9P3QbpomClfpMEKAOr1
	WukkyRHRyqPFnBGSluUQwL7uVGHyO8UvWZvcs7g=
X-Google-Smtp-Source: AA0mqf42YLAwQARhvxsf7dGvS0oc39aHHg/VjrmuoPl5AnlSakaRzEm4vNH6yBmh16Vo+BrOSyi3tz/l6+TpkPFOfQ4=
X-Received: by 2002:aa7:db07:0:b0:470:44da:db04 with SMTP id
 t7-20020aa7db07000000b0047044dadb04mr1540957eds.419.1671154335559; Thu, 15
 Dec 2022 17:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20221215073212.1966823-1-guoren@kernel.org> <c10c9742-06d6-f56b-ea55-47f99b06ca32@arm.com>
In-Reply-To: <c10c9742-06d6-f56b-ea55-47f99b06ca32@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 16 Dec 2022 09:32:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRHjhCzDT4J1F=zjcB0Mx+w+Ok0JYuuqorxgnw+KODnDA@mail.gmail.com>
Message-ID: <CAJF2gTRHjhCzDT4J1F=zjcB0Mx+w+Ok0JYuuqorxgnw+KODnDA@mail.gmail.com>
Subject: Re: [PATCH] iommu/renesas: Support riscv compile
To: Robin Murphy <robin.murphy@arm.com>
Cc: palmer@dabbelt.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	iommu@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_173220_052058_DF1A0FA0 
X-CRM114-Status: GOOD (  18.03  )
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

On Fri, Dec 16, 2022 at 1:16 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-12-15 07:32, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > After riscv selects ARCH_RENESAS, we need to add ARM64 || ARM
> > dependency here.
>
> This effectively removes all the extra COMPILE_TEST coverage we've been
> enjoying. FWIW I prefer Geert's suggestion to separate the real
> functional dependency from implicit assumptions about ARCH_RENESAS, with
> something like:
>
>         depends on ARCH_RENESAS || COMPILE_TEST
>         depends on !GENERIC_ATOMIC64    #for IOMMU_IO_PGTABLE_LPAE

The problem is from clang version 16.0.0, and gcc version 12.2.0 () is
okay. I didn't recognize COMPILE_TEST could utilize the x86(another
arch) to test the arm driver.

How About:

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index dc5f7a156ff5..a2e259da5a6a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -283,6 +283,7 @@ config EXYNOS_IOMMU_DEBUG

 config IPMMU_VMSA
        bool "Renesas VMSA-compatible IPMMU"
+       depends on !RISCV
        depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
        select IOMMU_API
        select IOMMU_IO_PGTABLE_LPAE

>
> Thanks,
> Robin.
>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >   drivers/iommu/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index dc5f7a156ff5..746b95b9f345 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -283,6 +283,7 @@ config EXYNOS_IOMMU_DEBUG
> >
> >   config IPMMU_VMSA
> >       bool "Renesas VMSA-compatible IPMMU"
> > +     depends on ARM64 || ARM
> >       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
> >       select IOMMU_API
> >       select IOMMU_IO_PGTABLE_LPAE



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
