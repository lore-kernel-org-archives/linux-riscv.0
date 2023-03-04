Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2813AC678DB
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjh+w6EOhn1Ymg0KZpplf24QYYZrHNCuokHNT4J5Cns=; b=loLzVQ6yfUdVXD
	9yYplgsh+Pw0B50T7Xjjvbw3rC89nWKIZtzn/xQS5KiFPmKQHzv9gDJkusDf/SWFVVYQn5JXZXIDY
	eVPSmlY6V60/UPvq5SUl2PFQL7gSi5CiPUah+QTFqwqiuA2nKFDlgsEKO43zbllupiL0E/XzIUgqn
	bFpzfnk/3O4xgvWTPJ8k7umxKfvDNBqQBfYpWpXCdQorm7E+RK12UIFO3S1zGXjRXnkto5yI/owYn
	F6qKuEVvGdXqgqJ0+0vJVJcMt3s0pXzvJd1Ov7an23OS+aTiIYtPz3d4AJS6nUvJqK3RRgFiCHGfX
	wloCiawD+WBo9kCBjFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYT1x-00989T-H9; Sat, 04 Mar 2023 14:38:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYT1t-00988L-8F
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 14:38:34 +0000
Received: by mail-ed1-x533.google.com with SMTP id f13so21284834edz.6
        for <linux-riscv@lists.infradead.org>; Sat, 04 Mar 2023 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUAgGXgRJv+laJqNVXMEReHwclDFkLvFtLnzR72uPrw=;
        b=dIVQYAwN0oY6GneEdKUwezanImjswih8kPJ1Hk7y+unDqTtkY8DJ56+T7nzP/leXQS
         bh1YNEuYIDW8d01I+YbSNf/D7NRvv6cKg3KSzMNIjQMhrMd/XwG+YXh063tMMl1gJtS/
         jWUwmPcnIg6hLyQy/yBBnYyG29z7elYzz3FQvDmYnBANKll8Rake9Px1391rCXfcy+l4
         QuvQ3jU025f6JnPVol8kPSrtRrDzpsdxwbTKxWx+Fyvb1wCOdG5UPR75wnE0OxViPhPr
         MS6Tg5ONjHalcocp7UciaHZ17zRJ+T2HloS7ugVdM2+HIToQigNv4z/5bxXOJLAHrm6G
         1SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUAgGXgRJv+laJqNVXMEReHwclDFkLvFtLnzR72uPrw=;
        b=NYO1FPosDdVBetXqIYMKW/WpoFAqugmG0q7ofa34a1l1J62fGPIovK/+bFk3FF0thp
         GodU8MbehfL5np1veVPaRAFM7XVow2lJkkvJOe4RkOk40lBv4FIjbdu6ERBCJbKc+3pU
         Oo4ygZ9tsapgtO6kmTepWW2/l1wBo3pea2ktFuWoBq5OAUCkJaoxC54MJTe3IoW0FK+q
         EUVXRwf2L2b8JVqjsobu3uHJszU4Qo/MfCukfBVcwZb0p64Rnqw004zIbNtb5aw3IROz
         HX19G1/O4O/JWQL5+gB4R+v3Uykh3whsJELGr8BP6n5UzqpTaAhe3BJNtHp/NMyXdxqA
         Cxuw==
X-Gm-Message-State: AO0yUKXptRnkEnylrNhOB81GpQ3bpE3oQrP/XjDhvCEOcSTdwDFCejZY
	nfXXaHgqlloJxqpS53XMeN8ObQ==
X-Google-Smtp-Source: AK7set8ioNcJPp/YawVWhmtAJLjQLjVLhXcs+aVHAAieiYpxHxPO/0j30k2MStzTMMBS7PIbvmXdjg==
X-Received: by 2002:aa7:c551:0:b0:4a3:43c1:8430 with SMTP id s17-20020aa7c551000000b004a343c18430mr8483606edr.4.1677940708917;
        Sat, 04 Mar 2023 06:38:28 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r29-20020a50d69d000000b004af70c546dasm2470291edi.87.2023.03.04.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 06:38:28 -0800 (PST)
Date: Sat, 4 Mar 2023 15:38:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 06/20] RISC-V: Add support to build the ACPI core
Message-ID: <20230304143827.mcampnt3ehkgwu26@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-7-sunilvl@ventanamicro.com>
 <20230303153617.ko4duynxjvixy3bf@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303153617.ko4duynxjvixy3bf@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_063833_376751_A57AC42D 
X-CRM114-Status: GOOD (  24.55  )
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

On Fri, Mar 03, 2023 at 04:36:17PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:33PM +0530, Sunil V L wrote:
> > Enable ACPI core for RISC-V after adding architecture-specific
> > interfaces and header files required to build the ACPI core.
> > 
> > 1) Couple of header files are required unconditionally by the ACPI
> > core. Add empty acenv.h and cpu.h header files.
> > 
> > 2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
> > be provided by the architecture. Define dummy interfaces for now
> > so that build succeeds. Actual implementation will be added when
> > PCI support is added for ACPI along with external interrupt
> > controller support.
> > 
> > 3) A few globals and memory mapping related functions specific
> > to the architecture need to be provided.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig             |  5 +++
> >  arch/riscv/include/asm/acenv.h | 11 +++++
> >  arch/riscv/include/asm/acpi.h  | 61 ++++++++++++++++++++++++++
> >  arch/riscv/include/asm/cpu.h   |  8 ++++
> >  arch/riscv/kernel/Makefile     |  2 +
> >  arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
> >  6 files changed, 167 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/acenv.h
> >  create mode 100644 arch/riscv/include/asm/acpi.h
> >  create mode 100644 arch/riscv/include/asm/cpu.h
> >  create mode 100644 arch/riscv/kernel/acpi.c
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 71754eb32ee6..f3108c7e19d8 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -12,6 +12,8 @@ config 32BIT
> >  
> >  config RISCV
> >  	def_bool y
> > +	select ACPI_GENERIC_GSI if ACPI
> > +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > @@ -617,6 +619,7 @@ config EFI
> >  	depends on OF && !XIP_KERNEL
> >  	depends on MMU
> >  	default y
> > +	select ARCH_SUPPORTS_ACPI if 64BIT
> >  	select EFI_GENERIC_STUB
> >  	select EFI_PARAMS_FROM_FDT
> >  	select EFI_RUNTIME_WRAPPERS
> > @@ -720,3 +723,5 @@ source "drivers/cpufreq/Kconfig"
> >  endmenu # "CPU Power Management"
> >  
> >  source "arch/riscv/kvm/Kconfig"
> > +
> > +source "drivers/acpi/Kconfig"
> 
> The above Kconfig hunks don't apply on the IPI improvement base. The
> second hunk also looks weird with the select under the default.
> 

Just following up here; as Sunil pointed out in chat, the base is
latest master with the IPI improvement rebased. I was using the
last IPI improvement branch. So that explains the problem I had
applying this and the weirdness I was seeing with the Kconfig
lines (select/default) as compared to v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
