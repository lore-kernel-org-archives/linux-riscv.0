Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0ECC4708E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwL7mVa2Z+YlSHoCcQRS6Tei6HePpdn03Lbv+KUxtYg=; b=3borQXDCIEd1X1
	PiXNmnQ/qLLRCc782HOn+yBUf9zWEvDkGt41mqPpW65xBlVbA6H6nCg8m4XmJm65BTf3aE/VIThEC
	LpWGAfbufLWGdk7TwjMrT3S/OcyosYjCDrOB/D/CvtRI3yXOpCEjrHoiFil5e49rVipDyVs2NUTtG
	hLi7QezMvisQ0B/HpLV7mwwBCqki4IJTbywIIYfn0DyRJxEUOVotrouKmaR1n6Mpf91uFyXZBvuWa
	qGC4ZfVEQyJMOXrODHPx+ox8FXgOdCPsvzNihEBcOEHFfxCb6rNkOJvl4Fi/oXkZfKjFeB1Y+hmp8
	9NKkFUdVOPOrnMMzo4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uzO-004ORI-7j; Wed, 07 Dec 2022 14:01:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uzK-004OOf-V7
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 14:01:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B0BAB81E07
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 14:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340E3C43470
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670421688;
	bh=w6UAheOP9K9CZ5W+S4wCRu1UQ6+nS3YNGMMAjD5DFyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MLrY/zqjG/ZJ7HYgA23kiPlkV0x+qkbC/tPOePS7+em9Swf4jrZh9x7/yoPhl2jF/
	 g6pbbE72mZS7xm76MLD2nKtp8MFbruMYbtDnP+ExJZP1N6vW4oYU4xC84ylMuHFAXq
	 kWQ1Yh/rXA5Be06ZEZuSJqWfBJjgY0IW4vnGhzYt6D6dMAf6aumhOasT7A6LtStxbR
	 diAhbtLLPxBppYciQQhdTFNru5YsXcKV/vEbNKDkAGf2hYO3CaKh5fn/IYHORQlBTE
	 cHdSvjCZn/vOSGtHVoZW4L36e+2Z1Q7Y9VLNJuFLt6qa7bxaVVo89OLe+cxCYSqdzB
	 bIc2/mQ/Pdv6A==
Received: by mail-ed1-f53.google.com with SMTP id s5so24952075edc.12
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 06:01:28 -0800 (PST)
X-Gm-Message-State: ANoB5pmAZX2t2hgPPdnEQusNfRUrWc2sqHU1sgt3/TzsbaKMEsXn5Zz8
	ErRzBMnUU1KmMrQT7nuQE+a8GspMm/gUWMbsaE0=
X-Google-Smtp-Source: AA0mqf5e447ZTB0mmY7c1BgYGRUmx4Bc61x2rBDn1ATvJuU5w3XAlzlyO8fRfBuxcJ0pFx5jkb8Tn1kE9DIihu4T8xQ=
X-Received: by 2002:a05:6402:289d:b0:46c:2460:cdf with SMTP id
 eg29-20020a056402289d00b0046c24600cdfmr20874014edb.103.1670421686467; Wed, 07
 Dec 2022 06:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20221207091112.2258674-1-guoren@kernel.org> <Y5BdpHrKrRCw9izQ@spud>
In-Reply-To: <Y5BdpHrKrRCw9izQ@spud>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Dec 2022 22:01:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRiTqnDiWtqkOrJFxLDFHjwikSeREFWVSJH2uV_WpAz4g@mail.gmail.com>
Message-ID: <CAJF2gTRiTqnDiWtqkOrJFxLDFHjwikSeREFWVSJH2uV_WpAz4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup compile error with !MMU
To: Conor Dooley <conor@kernel.org>
Cc: palmer@rivosinc.com, conor.dooley@microchip.com, liaochang1@huawei.com, 
	lizhengyu3@huawei.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_060131_328773_2576CB38 
X-CRM114-Status: GOOD (  24.95  )
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

On Wed, Dec 7, 2022 at 5:32 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Dec 07, 2022 at 04:11:12AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Current nommu_virt_defconfig can't compile:
> >
> > In file included from
> > arch/riscv/kernel/crash_core.c:3:
> > arch/riscv/kernel/crash_core.c:
> > In function 'arch_crash_save_vmcoreinfo':
> > arch/riscv/kernel/crash_core.c:8:27:
> > error: 'VA_BITS' undeclared (first use in this function)
> >     8 |         VMCOREINFO_NUMBER(VA_BITS);
> >       |                           ^~~~~~~
> >
> > Add MMU dependency for KEXEC_FILE.
> >
> > Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
> > Reported-by: Conor Dooley <conor@kernel.org>
>
> FWIW (but certainly don't resend for this)
> s/conor@kernel.org/conor.dooley@microchip.com
>
> Thanks for the quick fix, there's other issues w/ that config for me,
> but this fixed the kexec bits :)
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
Thx for the report and test.

>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  arch/riscv/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ef8d66de5f38..91319044fd13 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -496,7 +496,7 @@ config KEXEC_FILE
> >       select KEXEC_CORE
> >       select KEXEC_ELF
> >       select HAVE_IMA_KEXEC if IMA
> > -     depends on 64BIT
> > +     depends on 64BIT && MMU
> >       help
> >         This is new version of kexec system call. This system call is
> >         file based and takes file descriptors as system call argument
> > --
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
