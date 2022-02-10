Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC97C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xkRa/tUAcmdVKuJnsjk2ia9IxlntPAYNdUTgmOIDk8=; b=WQTcgeUwAej2KW
	L/5e/1zekYKhucsoOGp39rivTZZSyAyNV3TX6q5RK0ZUbjd+uBK1zlZXYqKEjKevQVJSy6fqMVd1K
	YQDvUrfQtWAOhAQbeYAqkpgiTnW4x3713BQrWo9asBDVpQ9j6UpgZEvv8nZwRgazi/CXWjNjLwFYC
	A4MIHgkWI4dbjZaOHMQkV0YcxbwFrer98URq1qgIKy+bx8kJQ9/AXvQqQY7V7uSoImfDAK8T1BSj/
	nkSoC9JLBLo2mrMrhYztw9nFDl/7QugZMauybhg6AVATOP7/RCkUuJe6qQah4huH/vH1MdKjz3o6i
	wCMs1OJtuZwi94MI3ezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nII9X-0053Dz-1L; Thu, 10 Feb 2022 22:43:03 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nII9H-0053A4-Hu
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 22:42:57 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id o19so19641558ybc.12
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 14:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OjreJ4Dbxm2NwQlgnQYlRNvrqvyn6H+tQ+K3U0g0mFI=;
 b=LX8u+w3RqcntgJCHyFMV4Fre+NntXNFQQlBWBGTBu67MgFdVmMjY4UPqS9LePVWP9q
 ++KmXmIcvng+CQaKcXpdHGPKgfZw95uSBgxJbFskcujzYu3MN57xy/TWm4L28xAomOPi
 e39N5a0TeU8SvKhzNwQFOmjJdb3DcmqQhtL2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OjreJ4Dbxm2NwQlgnQYlRNvrqvyn6H+tQ+K3U0g0mFI=;
 b=EGP9pjC94vOcc/y2vL/pyloART56fU9Dkvn48uviFeCew7FsuA+i9mEQkoAdg8M/tZ
 NcgCYZ9f5BlXws8cBp65aswcILy+JoWznF0OdMZuPQ+oubSJotw9YqEqHjbDZtKXgpHO
 Gq8nJww9HL7cCOP9ihn+19xLFxnuMwApbvlvwAd7BYp3PRsB1Mo9m2YWU1jcvrGXzam4
 brIQmfzK/FMx6nA4oAGURHIqt4qNLNOzBSQaaJPHkCiWbxKFCydUsysYNTvXaIlCYftm
 HWpf1B35ShhUDL80RTTwSH3ffKSybHzj7sUxGiIh3dM1rUF0Y6YoP3kjLYSTwulviWJo
 gPIw==
X-Gm-Message-State: AOAM530Pm/fR3adsV4irBn9IWHQh6pabXxZ9MuaN4UoHZv3DmfDrY+tw
 W9Urfd64ZABVQsgakKlX/cyqfOgoaTXaGlr7ErOa
X-Google-Smtp-Source: ABdhPJyR8oYWkiUH8cQr2NFW+hlos0Nq2+W+WHKskklGcfGFhys92e0ats7QSYkRoCXeYmJAm9nXLikQIY28et3jaCs=
X-Received: by 2002:a81:e241:: with SMTP id z1mr9683966ywl.62.1644532966055;
 Thu, 10 Feb 2022 14:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-9-heiko@sntech.de>
In-Reply-To: <20220209123800.269774-9-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 14:42:35 -0800
Message-ID: <CAOnJCULe_5v6cb_JcoPKf-UD3bVze1U=jaYeLTsMu7pFigde+A@mail.gmail.com>
Subject: Re: [PATCH v6 08/14] riscv: move boot alternatives to a slightly
 earlier position
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_144247_672554_87DFEAC7 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Feb 9, 2022 at 4:39 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Move the application of boot alternatives to soc_early_init().
> This allows to catch more generic cases of code needing patches
> than doing it in smp_prepare_boot_cpu() and also makes it actually
> work if CONFIG_SMP is disabled for whatever reason.
>
> The position is chosen mainly as it is before the actual soc early
> init runs but also already allows accessing the devicetree
> via fdt_* functions.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/head.S    | 2 ++
>  arch/riscv/kernel/smpboot.c | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 2363b43312fc..0e1bb97f9749 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -10,6 +10,7 @@
>  #include <asm/thread_info.h>
>  #include <asm/page.h>
>  #include <asm/pgtable.h>
> +#include <asm/alternative.h>
>  #include <asm/csr.h>
>  #include <asm/cpu_ops_sbi.h>
>  #include <asm/hwcap.h>
> @@ -341,6 +342,7 @@ clear_bss_done:
>         call kasan_early_init
>  #endif
>         /* Start the kernel */
> +       call apply_boot_alternatives

Do you really need this early ?
if non-smp configuration is the only option, Can you do it in
setup_arch() after riscv_fill_hwcap() is called ?

By doing that, we can unify the cpu feature probing and you don't need
a separate DT parsing just for svpbmt.

>         call soc_early_init
>         tail start_kernel
>
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
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
