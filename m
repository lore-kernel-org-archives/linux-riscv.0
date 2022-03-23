Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37175C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTc+HKkUOEn/szH3iww4ZgEQn9jRZoN7FVxBsIojIFQ=; b=ii66JSBknz+NhZ
	F29V4oBwCRw7bBiJTBdzKgnF4NEADlcHDyySRXssupIdXwKwZuGycuTG8YfaX3cERT7C8IekKq0rs
	14mzNHNLQPQqSIdbgnD8yEpIL14d+3pFc6zlbRicIFGn3DwCmr8N79s5hrATOupOymn6ud06M1hiu
	RfCgx2NP1UTwYB1IoC+5WGZ5w4nWn+TAfYlY4c2bZRhAOwxl/sGSF6Pd7+D2eDmLL6TpeSOWCh2zV
	ow1QEKFokafxCWtvps/8ueKoJIBOtEmGMfB9B+yPzMOZvXL5G6rmdo8hKFPx62GJgZJxfg9AfPrHj
	axCT5YD4prkYRY7wNdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4Cl-00EIxh-IQ; Wed, 23 Mar 2022 16:51:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4Ci-00EIxD-RI
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 16:51:26 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nX4Cb-000381-K5; Wed, 23 Mar 2022 17:51:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v6 08/14] riscv: move boot alternatives to a slightly
 earlier position
Date: Wed, 23 Mar 2022 17:51:16 +0100
Message-ID: <2695327.BEx9A2HvPv@diego>
In-Reply-To: <mhng-3d591628-2c87-40c7-91e4-407ad313a4aa@palmer-ri-x1c9>
References: <mhng-3d591628-2c87-40c7-91e4-407ad313a4aa@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_095124_914136_9A4845FF 
X-CRM114-Status: GOOD (  28.66  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 8. M=E4rz 2022, 01:47:23 CET schrieb Palmer Dabbelt:
> On Wed, 09 Feb 2022 04:37:54 PST (-0800), heiko@sntech.de wrote:
> > Move the application of boot alternatives to soc_early_init().
> > This allows to catch more generic cases of code needing patches
> > than doing it in smp_prepare_boot_cpu() and also makes it actually
> > work if CONFIG_SMP is disabled for whatever reason.
> >
> > The position is chosen mainly as it is before the actual soc early
> > init runs but also already allows accessing the devicetree
> > via fdt_* functions.
> =

> I think this is OK, but it warrants testing on the K210 -- specifically =

> the system is in an odd state before soc_early_init (IIRC some of memory =

> doesn't work right) so I'm always a bit worried about calling stuff =

> there.  I don't have a K210 (or at least a working one), so I'm not =

> going to be able to test it.

just to finalize this partial thread, v7 and onward doesn't move
the alternative-application this early but instead actually behind
fill_hwcaps to be able to read available extensions.

So nothing to do for this - for people reading along, and me if
I don't remember this in the future ;-)

> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/kernel/head.S    | 2 ++
> >  arch/riscv/kernel/smpboot.c | 2 --
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 2363b43312fc..0e1bb97f9749 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -10,6 +10,7 @@
> >  #include <asm/thread_info.h>
> >  #include <asm/page.h>
> >  #include <asm/pgtable.h>
> > +#include <asm/alternative.h>
> >  #include <asm/csr.h>
> >  #include <asm/cpu_ops_sbi.h>
> >  #include <asm/hwcap.h>
> > @@ -341,6 +342,7 @@ clear_bss_done:
> >  	call kasan_early_init
> >  #endif
> >  	/* Start the kernel */
> > +	call apply_boot_alternatives
> >  	call soc_early_init
> >  	tail start_kernel
> >
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index a6d13dca1403..f1e4948a4b52 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -32,7 +32,6 @@
> >  #include <asm/sections.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> > -#include <asm/alternative.h>
> >
> >  #include "head.h"
> >
> > @@ -41,7 +40,6 @@ static DECLARE_COMPLETION(cpu_running);
> >  void __init smp_prepare_boot_cpu(void)
> >  {
> >  	init_cpu_topology();
> > -	apply_boot_alternatives();
> >  }
> >
> >  void __init smp_prepare_cpus(unsigned int max_cpus)
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
