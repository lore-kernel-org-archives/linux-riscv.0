Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCCDC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHoBAWnc0pC6wdUfcYPswUsmTfDJsXt8iLdMDvFQLj8=; b=igrrN/eNbgre+j
	Ep56RwOQOK03ZR3Gr9kbzsCohk/lNWP8SIAeCLjaPRlCGeFm9X9llGxgkNbPKkctvLqO6nuf47Cbb
	O1scZHhfoXxs56uyEUmTOCw1ZUzEtrx1jzw1S972e5J0kO11QZ78Ym46s9IwO3AqVFwdJE1NUwa5K
	5gJXLLoVlKe1Emv/0wEyABbywI9X4ME8f9eD7OO2kU9BqVDdXWOiURdZsrzPMFq1lYrJLdlC7J7++
	5FdR7bG3TDu0ncbYuW87C5UM0HloW7KUzn5j8zj7AOmpIX+BVcwu/oN59U2MHMs8NTyM/zES1GLJ6
	eemKpmgyqyMIPj987xNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRagQ-00FBSV-MQ; Mon, 13 Feb 2023 15:23:58 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRagO-00FBRn-22
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:23:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o13so12268559pjg.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIG79omTuAqh92FYqalRSBErGwvaWBx/kFaBBIuHnJI=;
        b=RkzvbBqCzhcJq+aCvWqxW0ulR29Msgdt+7aIn1JRBsFQoncmghs+GZc7d6YCR4iGkS
         TDgqJ8VaI/QQAxI2uyjQ4hdzy2T8OqrZHYhP7SLLaryY09RagnCpfl1kVP5LYDinXD5b
         yHNCpg3Aaw/RfOjSWwaHpUe7QRkbs0SJNEtalDt+w9awYarvdRhnPxAXWRa6D8EywR6P
         HW7+/l8ILedEd4ocGvSKTpKtj1YsVohZhldYRn41xQelvMv+ODbyDhRDDXhhEDjvtzu9
         wjiYwWF4k2lgiTecS+Vugi7ZOdbzcm9WBS5ZXjyY2DbfdwG/ZXrqOnIfL/kaaM8GTSci
         AlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIG79omTuAqh92FYqalRSBErGwvaWBx/kFaBBIuHnJI=;
        b=asdlqIsomVfvIVskrTeFFXcdTW8MorOW3XpNWOQRbfz8803zlg+Ha2LQFTv/jB9be7
         4AgfgCTXPYogPUKuV1G7bVXTXSsvuaOk+8VDhczDsHyVCVX4WNfxXDaPZBRfxs74exp3
         rsvBL8BEpgrEk6Slt2vEuXVysT/UEkMV3AmM4bi22frOK0PxcPBfp5mkQgIGCz5cdwTr
         HJtlZLsya1WSG1tyfAy4ZQ6OhJoq6xFnNMVz8Pj3ea+bXzAeciQU/7Y3Wv7OlUOVBIUv
         K2iWoGObFUQ4qsyOpmasISnW0S5eJ3xonzXf3dtq2vSylIMpdoRVoB3aOxwK2WconwOc
         LOYQ==
X-Gm-Message-State: AO0yUKWq723LzzKfT2yKR55Xiv0cih2hfL7xXSFl+dNtliJnAkJdsaCt
	wO5qtGAMcjJN4cCJBSO424TGzQ==
X-Google-Smtp-Source: AK7set+hb1XmMLJh/78y4oD9MeKNqlA8guKewewIHXEIqcAaBoXEVpek0ge/MjnZYOUUPYr2o5Tjbg==
X-Received: by 2002:a17:903:120c:b0:197:35fc:6a5d with SMTP id l12-20020a170903120c00b0019735fc6a5dmr26864926plh.30.1676301835225;
        Mon, 13 Feb 2023 07:23:55 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903120300b00196053474a8sm8365196plh.53.2023.02.13.07.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:23:54 -0800 (PST)
Date: Mon, 13 Feb 2023 20:53:46 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 07/24] RISC-V: ACPI: Enable ACPI build infrastructure
Message-ID: <Y+pWAhdFHSzq5SOR@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-8-sunilvl@ventanamicro.com>
 <Y+QUwFIIj7tvrHpM@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+QUwFIIj7tvrHpM@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072356_124861_BEE5EA78 
X-CRM114-Status: GOOD (  17.24  )
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

On Wed, Feb 08, 2023 at 09:31:44PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:08PM +0530, Sunil V L wrote:
> > Enable build infrastructure to add ACPI support for
> > RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d153e1cd890b..f664350679bc 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -12,6 +12,9 @@ config 32BIT
> >  
> >  config RISCV
> >  	def_bool y
> > +	select ACPI_GENERIC_GSI if ACPI
> > +	select ACPI_MCFG if (ACPI && PCI)
> 
> These brackets are not needed, right?
> 
Okay.

> > +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> >  	select ARCH_CLOCKSOURCE_INIT
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> > @@ -598,6 +601,7 @@ config EFI_STUB
> >  config EFI
> >  	bool "UEFI runtime support"
> >  	depends on OF && !XIP_KERNEL
> > +	select ARCH_SUPPORTS_ACPI if 64BIT
> >  	select LIBFDT
> >  	select UCS2_STRING
> >  	select EFI_PARAMS_FROM_FDT
> > @@ -703,3 +707,4 @@ source "drivers/cpufreq/Kconfig"
> >  endmenu # "CPU Power Management"
> >  
> >  source "arch/riscv/kvm/Kconfig"
> > +source "drivers/acpi/Kconfig"
> 
> For consistency with the rest of the file, a newline before drivers
> would be in order here.
>
Sure.

Thanks
Sunil 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
