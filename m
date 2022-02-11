Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C609C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5TPnG5WdpZacGTu3Ju3o5MN0v6iPSnX+yrsiFS/USg=; b=mJckQs56Ge5ntf
	mYXL5urEMyIZzH+x1XZ4cWl75FiZnEo/4EqGTapfaVGF73VeM9rzoNlteZ9FHpZ23WhkvHf4elip4
	okUZFglAOA5lmbrOJTAEgcfV5limzpxvMUjbguRCIc/IWyJ+3I7ZXs9dFEgEVXJy7g/R7PogU/GEx
	SXzJ6NV/ggexRovH223b4TcASaH7kU5jQ1pJf3s8LttLktX7zxv85x96aKJRaV0MV4wjPNPFGdN7o
	igb6X+gCaXK1Q8JXrcMAXXho7Pups/GAKmuSkvUVkSYMaPlXXWyrEXuL46FA6O4Fd/g0cgxir5Ndl
	m8vW8bQHxCUFNdImQrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIKTO-005Oz1-8E; Fri, 11 Feb 2022 01:11:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIKTK-005Oyd-CK
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:11:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nIKT8-0004UP-7v; Fri, 11 Feb 2022 02:11:26 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Wei Fu <wefu@redhat.com>,
 liush <liush@allwinnertech.com>, Guo Ren <guoren@kernel.org>,
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>,
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [PATCH v6 08/14] riscv: move boot alternatives to a slightly
 earlier position
Date: Fri, 11 Feb 2022 02:11:24 +0100
Message-ID: <2532021.2vfPgEiFAl@diego>
In-Reply-To: <CAOnJCULe_5v6cb_JcoPKf-UD3bVze1U=jaYeLTsMu7pFigde+A@mail.gmail.com>
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-9-heiko@sntech.de>
 <CAOnJCULe_5v6cb_JcoPKf-UD3bVze1U=jaYeLTsMu7pFigde+A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_171138_479176_D253A06B 
X-CRM114-Status: GOOD (  31.18  )
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

Hi Atish,

Am Donnerstag, 10. Februar 2022, 23:42:35 CET schrieb Atish Patra:
> On Wed, Feb 9, 2022 at 4:39 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Move the application of boot alternatives to soc_early_init().
> > This allows to catch more generic cases of code needing patches
> > than doing it in smp_prepare_boot_cpu() and also makes it actually
> > work if CONFIG_SMP is disabled for whatever reason.
> >
> > The position is chosen mainly as it is before the actual soc early
> > init runs but also already allows accessing the devicetree
> > via fdt_* functions.
> >
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
> >         call kasan_early_init
> >  #endif
> >         /* Start the kernel */
> > +       call apply_boot_alternatives
> 
> Do you really need this early ?
> if non-smp configuration is the only option, Can you do it in
> setup_arch() after riscv_fill_hwcap() is called ?

The issue I see is, we we have the soc_early_init [0] running
directly after this and the one user I see [1] already wants to
ioremap io-memory at this stage.

So judging by the fact that more early-inits will get added
in the future I do guess we should've set up the io-memory
page-type by this point?


Heiko

[0] https://elixir.bootlin.com/linux/latest/source/arch/riscv/kernel/soc.c#L14
[1] https://elixir.bootlin.com/linux/latest/source/drivers/soc/canaan/k210-sysctl.c#L66

> By doing that, we can unify the cpu feature probing and you don't need
> a separate DT parsing just for svpbmt.
> 
> >         call soc_early_init
> >         tail start_kernel
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
> >         init_cpu_topology();
> > -       apply_boot_alternatives();
> >  }
> >
> >  void __init smp_prepare_cpus(unsigned int max_cpus)
> > --
> > 2.30.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
