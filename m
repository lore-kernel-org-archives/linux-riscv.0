Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A567C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 19:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htGqaaRnXst1PqE/ct9psU6ryjCDl1tTUNCY9wvU/NU=; b=FvKPqIcrxRDogo
	FGzNFlEoO+LTFAvIUnfCigm9JXQiEOuXSfZAO6un2AsLtN9SHqTfTAlucWOlKF71gf4ncFYhbAoxG
	SLpXggjUJH7AeKTUG/jf9uUDUVT2MbSjlcPxL897LiCUB7CDRTZraIk+4ZOpt/P0FIDLAW4823q3C
	izUUvH7+97PqgGimseD5D6KlBqJtJXc1w3HFneVBtTJ/CF1Tva79j7Mj40oXjmosIo7Lm5Q7ZaaGX
	B48n0U+sS6Ot43j3f7ozs9iCfLKeekcmwOQbsyPBS8sFEGoYDXGt1sUbw7umu90c3PNo2zc/C2n3U
	DxNAnj1uoA7PYDpRPjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAGVg-009BgQ-AP; Sat, 09 Jul 2022 19:53:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAGVd-009Baq-Gv; Sat, 09 Jul 2022 19:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZE0PQ0MZrLyaJYHo2cd45HOu0b/fLPvPR3wyfIGYWYE=; b=NMFVOz8OCDZFbynDpHumuV62vw
	0nUuhix3V56rMW0YyYvRr3Khh1VKXXudSddVUDIoii+AnLHJBB/bBHDD0mdF+aw3/WvY6ft1YKdWb
	CJ+MiYGMmV6VFRGvhFggvC48MEgKoPqMvlRc8PUK01qdEXWA3Ub1vyE/PcyreSMCVuxNRJZExMwzW
	FVu9kXPtlela1A/k14i3dbeWWJXxbRjsnlheKBSPtDy6NPbMx7nS5wpP7/yUhOGxtJFFSA2pXVncX
	jKflxNsCaAp5c1EI90HZNf8SAVOkeB0l0dWyUw5/c4GnEC1LKiHLPuWEWo3H6tUctAgPGxb+B3TcP
	dlj1t2mA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33270)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oAGTB-0006wR-1F; Sat, 09 Jul 2022 20:50:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oAGT3-0000l1-MC; Sat, 09 Jul 2022 20:50:17 +0100
Date: Sat, 9 Jul 2022 20:50:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, sudeep.holla@arm.com,
	catalin.marinas@arm.com, will@kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org, arnd@arndb.de,
	Daire.McNamara@microchip.com, niklas.cassel@wdc.com,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	guoren@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
	heiko@sntech.de, philipp.tomsich@vrull.eu, robh@kernel.org,
	maz@kernel.org, viresh.kumar@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <Ysnb+VNniRBF1Hh0@shell.armlinux.org.uk>
References: <20220708203342.256459-1-mail@conchuod.ie>
 <20220708203342.256459-2-mail@conchuod.ie>
 <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
 <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_125257_605947_93833468 
X-CRM114-Status: GOOD (  23.55  )
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

On Sat, Jul 09, 2022 at 12:58:57PM +0000, Conor.Dooley@microchip.com wrote:
> +CC Russel, Arnd
> 
> On 08/07/2022 21:45, Conor Dooley - M52691 wrote:
> > On 08/07/2022 21:33, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> arm64's method of defining a default cpu topology requires only minimal
> >> changes to apply to RISC-V also. The current arm64 implementation exits
> >> early in a uniprocessor configuration by reading MPIDR & claiming that
> >> uniprocessor can rely on the default values.
> >>
> >> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> >> topology: Stop using MPIDR for topology information")', because the
> >> current code just assigns default values for multiprocessor systems.
> >>
> >> With the MPIDR references removed, store_cpu_topolgy() can be moved to
> >> the common arch_topology code.
> >>
> >> CC: stable@vger.kernel.org
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> ---8<---
> >>  #ifdef CONFIG_ACPI
> >>  static bool __init acpi_cpu_is_threaded(int cpu)
> >>  {
> >> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> >> index 441e14ac33a4..07e84c6ac5c2 100644
> >> --- a/drivers/base/arch_topology.c
> >> +++ b/drivers/base/arch_topology.c
> >> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
> >>  	}
> >>  }
> >>  
> >> +void __weak store_cpu_topology(unsigned int cpuid)
> > 
> > Ahh crap, I forgot to remove the __weak.
> > I won't immediately respin since it is minor. I've pushed it (without
> > the __weak) to https://git.kernel.org/conor/h/arch-topo so it'll get
> > the lkp coverage.
> 
> And build failure for arm32:
> 
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git arch-topo
> > branch HEAD: df379c4b12f6b22fb8c07c2be16fd821a4fcbfc5  riscv: topology: fix default topology reporting
> > 
> > Error/Warning: (recently discovered and may have been fixed)
> > 
> > arch_topology.c:(.text+0xbac): multiple definition of `store_cpu_topology'; arch/arm/kernel/topology.o:topology.c:(.text+0x0): first defined here
> > 
> > Error/Warning ids grouped by kconfigs:
> > 
> > gcc_recent_errors
> > `-- arm-defconfig
> >     `-- multiple-definition-of-store_cpu_topology-arch-arm-kernel-topology.o:topology.c:(.text):first-defined-here
> > 
> > elapsed time: 721m
> 
> Looking at the arm32 implementation - it appears to be mostly the sort of MPIDR
> stuff that was removed from the arm64 implementation in 3102bc0e6ac7 ("arm64:
> topology: Stop using MPIDR for topology information"). Could arm32 benefit from
> the same shared implemenation too, or is usage of MPIDR only invalid for arm64?

Don't look at me... this code was contributed by Linaro, presumably for
systems they have. I've never had anything that would require this so
the code never interested me, so I never took much notice of it.

Sorry, I can't be of more help.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
