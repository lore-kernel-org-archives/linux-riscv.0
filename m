Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C39C3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcwTDJSZDcDd4ZSLV2Oqv8Y7B2tVE+91bl1H+kYeOBw=; b=mALTrTM9UShpSq
	eTzoSSV6oq1qDDKxL75/9IcoPQZ9L2uNg/ZCWl+XfMpSC3VMWn1g3bcbpjE1DgQkLF8JHjLHZyBlL
	8657iFqdCvxrP8V9GrzOer9raefZvl0t8XPQC2nbfuWlZAwzTW2aW5Yg67OKvp3yYe3wgzZMauLCf
	LNqzPY05Uq6yQ3G9StvOH99lxah86MjN0HaGY30epfYx9pwC5r6jO60gH10Rk0u00LIivGR+rSmnV
	/+Bhe0IvhbZ1hWVkDn/CBWsUbIi6Xe5zw/5bw9kiC/YIcfNRu2nScBOKf0nEDs/3GHc9esu/OW5ls
	ubDpfiPQjDB3En7d9alA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV8xU-000000054Am-1J9S;
	Sat, 20 Jul 2024 12:13:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV8x7-0000000543l-0dwG;
	Sat, 20 Jul 2024 12:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 160BD60AC0;
	Sat, 20 Jul 2024 12:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09110C2BD10;
	Sat, 20 Jul 2024 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721477557;
	bh=fwbjiZOl2jVEvkjLoIR5P7+CK/Chy3OdwVeEOh6ZuS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zrgu0SuBbpILpJBm8U5PR8XGe87tRutuy1WzG7Fmsz4VozP42z8IfYuFPMEiCO6ez
	 djid8auGU5SdaEK5v5L5Kcs3yzuWYeCcZtOzcSL3vqkCL7k8A8lfqmCMd/yVXhjtF8
	 VHhSwiU64gORZkNkAHRI6mECdB/Pr9e9NEqnu9OJaFfY/A4K+TFaCMAZSDIPmjuJXD
	 m9fyDujPC45QYgAsPUjQDHQ+rAx5rEVo8xTvK67ZSw30TE3zGPomSDzPciI4/ZXvh5
	 fjlXjrfuFyfqzBaLPEL/6dkuLr5m5vWTRuYPQWlUZ6Y2t6qDf8GDx6tPL5wdYxPr4T
	 RVe/6SLZl02bQ==
Date: Sat, 20 Jul 2024 15:09:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 14/17] mm: introduce numa_emulation
Message-ID: <Zpuo-BWxvdbun5z7@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-15-rppt@kernel.org>
 <CCB95DEB-6B72-4175-A379-7E60D89114A6@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CCB95DEB-6B72-4175-A379-7E60D89114A6@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_051241_354944_070C359A 
X-CRM114-Status: GOOD (  21.34  )
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

On Fri, Jul 19, 2024 at 12:03:11PM -0400, Zi Yan wrote:
> On 16 Jul 2024, at 7:13, Mike Rapoport wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Move numa_emulation codfrom arch/x86 to mm/numa_emulation.c
> >
> > This code will be later reused by arch_numa.
> >
> > No functional changes.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/Kconfig             |  8 --------
> >  arch/x86/include/asm/numa.h  | 12 ------------
> >  arch/x86/mm/Makefile         |  1 -
> >  arch/x86/mm/numa_internal.h  | 11 -----------
> >  include/linux/numa_memblks.h | 17 +++++++++++++++++
> >  mm/Kconfig                   |  8 ++++++++
> >  mm/Makefile                  |  1 +
> >  mm/numa_emulation.c          |  4 +---
> >  8 files changed, 27 insertions(+), 35 deletions(-)
> 
> After this code move, the document of numa=fake= should be moved from
> Documentation/arch/x86/x86_64/boot-options.rst to
> Documentation/admin-guide/kernel-parameters.txt
> too.

I'll add this as a separate commit.
 
> Something like:
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index bc55fb55cd26..ce3659289b5e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4158,6 +4158,18 @@
>                         Disable NUMA, Only set up a single NUMA node
>                         spanning all memory.
> 
> +       numa=fake=<size>[MG]
> +                       If given as a memory unit, fills all system RAM with nodes of
> +                       size interleaved over physical nodes.
> +
> +       numa=fake=<N>
> +                       If given as an integer, fills all system RAM with N fake nodes
> +                       interleaved over physical nodes.
> +
> +       numa=fake=<N>U
> +                       If given as an integer followed by 'U', it will divide each
> +                       physical node into N emulated nodes.
> +
>         numa_balancing= [KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
>                         NUMA balancing.
>                         Allowed values are enable and disable
> diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
> index 137432d34109..98d4805f0823 100644
> --- a/Documentation/arch/x86/x86_64/boot-options.rst
> +++ b/Documentation/arch/x86/x86_64/boot-options.rst
> @@ -170,18 +170,6 @@ NUMA
>      Don't parse the HMAT table for NUMA setup, or soft-reserved memory
>      partitioning.
> 
> -  numa=fake=<size>[MG]
> -    If given as a memory unit, fills all system RAM with nodes of
> -    size interleaved over physical nodes.
> -
> -  numa=fake=<N>
> -    If given as an integer, fills all system RAM with N fake nodes
> -    interleaved over physical nodes.
> -
> -  numa=fake=<N>U
> -    If given as an integer followed by 'U', it will divide each
> -    physical node into N emulated nodes.
> -
>  ACPI
>  ====
> 
> Best Regards,
> Yan, Zi



-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
