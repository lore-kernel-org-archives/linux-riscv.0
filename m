Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCED6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1SdMSDhzKYT9F27xFogyWtPbeDZpS5ysbGVbCtbaow=; b=iuj+6WjpiJ6Ut2
	x2zeBehmRUGOGd78oIM2ZRvMBhAQWPNxiIUDP4f/sgdXdp0JDgnIvMyaDWO1Hq/DIw7rX9VkFdFdc
	gHo1+F3saCDNArwNvOMp8l1F9qlxHiPfo9iFl2gCbyLWA+30UI0M5uzA50SX2R2sQnee0vnBqAE1D
	L9i09D/5S2qn07sQTi8pLIHNYwT9djjwq2GrywiFtAQkj+SFd5zKYq7cTzy9tYwv6+2SBkiZ743bQ
	1ICkQsuKrNPi7idg0oEPdebabBXC+v9Jj6anO3JZy05qQHotxivedBCisp7Wt4JJ/xiHJ7R2bHwe1
	SxFQcNsmU9WcW5PBhhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neVqN-00Gtrr-JO; Wed, 13 Apr 2022 05:47:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neVqK-00Gtqr-A3
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 05:47:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECB83B81EA0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D7BC385B5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649828820;
 bh=HDKik8QF3OtnxnBSdiMFywaH7pAjKSH73aE+xYfjwA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eIUg5nGiYGotfBgo8RxQz4+LyghtaVqFkBnLdhVPxYY7akTr4OCQ0qdvly8M0D79S
 v0+MxRjCkViWbtPsqyIun9qISL4E8ike+U4MWhUsrMoXSnztORxCK/sMHIILwHuprB
 xv7Vv+LTN5dRjvGWGTzVWNQv4WHqpGe515bYOOAcZlc2yDmlZU1u+EC9ivd64p0Wri
 efCASxI23Mu6zRMcTrQshhN8gXWAbhbbAieaROJAMlrqqM0dGaxWTMePr04AJbKtYB
 t944UHn10ij7ms1lOuAtD7We5taCXFnDQj4TYNyzofhux53DrU+MDhyLxc8sQbi0m2
 Fboo/kG9QkrGg==
Received: by mail-vk1-f177.google.com with SMTP id j4so68641vki.8
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 22:47:00 -0700 (PDT)
X-Gm-Message-State: AOAM531PsScG2TTGqF0rRCR53ImaDljdaA+HHQYxRTgkz4wW4BziMA58
 lqRxHRYwCUhWGQXbC93beyyt5zOw1V3SDARNWlI=
X-Google-Smtp-Source: ABdhPJzxdy1DgTdwkI5mBFUoZAa1bIFYSMWm6GZIzpP6qxRS7suwlxoA4eehs1H37b+vIAsfZDceddRYN0OimyFQs/o=
X-Received: by 2002:a05:6122:16a2:b0:345:62c8:2321 with SMTP id
 34-20020a05612216a200b0034562c82321mr5788236vkl.8.1649828819427; Tue, 12 Apr
 2022 22:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-8-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-8-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Apr 2022 13:46:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRj_Lwz_krceR+8UzttsCoJgB5w1ng1cVf5J=5cUbdZ=Q@mail.gmail.com>
Message-ID: <CAJF2gTRj_Lwz_krceR+8UzttsCoJgB5w1ng1cVf5J=5cUbdZ=Q@mail.gmail.com>
Subject: Re: [PATCH v9 07/12] riscv: move boot alternatives to after fill_hwcap
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 liush <liush@allwinnertech.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_224704_676759_FB10695F 
X-CRM114-Status: GOOD (  21.20  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Apr 13, 2022 at 11:03 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Move the application of boot alternatives to after the hw-capabilities
> are populated. This allows to check for available extensions when
> determining which alternatives to apply and also makes it actually
> work if CONFIG_SMP is disabled for whatever reason.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/setup.c   | 2 ++
>  arch/riscv/kernel/smpboot.c | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f4f4a64bc3a0..9162e9a824d2 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -21,6 +21,7 @@
>  #include <linux/efi.h>
>  #include <linux/crash_dump.h>
>
> +#include <asm/alternative.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
> @@ -295,6 +296,7 @@ void __init setup_arch(char **cmdline_p)
>  #endif
>
>         riscv_fill_hwcap();
> +       apply_boot_alternatives();
>  }
>
>  static int __init topology_init(void)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index a6d13dca1403..f1e4948a4b52 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -32,7 +32,6 @@
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> -#include <asm/alternative.h>
>
>  #include "head.h"
>
> @@ -41,7 +40,6 @@ static DECLARE_COMPLETION(cpu_running);
>  void __init smp_prepare_boot_cpu(void)
>  {
>         init_cpu_topology();
> -       apply_boot_alternatives();
>  }
>
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
