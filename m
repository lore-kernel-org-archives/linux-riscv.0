Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3943CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 01:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F317660F24
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 01:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F317660F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c31XiJXvsXwDF3fZP8BIjZXw/u7kxjN7A3vegmgyVnc=; b=4Aae96aPgrh+s5
	b2Jse546vpoT1ynXltsPrkTPEajpioDBAcTI/yoYVaThq3RUHJ3yGfO+ufzxE64DdTMNIXVXN7+eI
	ENbCvJeQn6195c25/X7oOnNRHkQw852ErpoZZXToau1N6dA+iYQJEK3Yfl+PdiG8rEmRNtofyV49G
	5dtoU3+GkH2bUHa+bXeO6TMzmCQaxUt7G2LYItM12VBzIKc6988k5s7XUprvxZgY1meOrxfKgoDTS
	DMCpooTHNfSgIKrJx4u/LRuVbGkhahm/oya5SkWqvs/wQMGpg6L97tS1CVuFeWdSPTdTfHw2SJfxe
	4gA6OQs/xi/LUi4+Y+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhMZs-00F46N-Hq; Mon, 01 Nov 2021 01:57:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhMZo-00F45d-Lz; Mon, 01 Nov 2021 01:57:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52825610CA;
 Mon,  1 Nov 2021 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635731852;
 bh=fuaUan8WpsO3AU0Pd876OqdiQB5S59Rz/RFmfxHCqFo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WTZ2r/aqsZBJ/SEMp/W5aRRvu0wWWG+qZmM8hZPwjrObwwMpW1TgXwf1zWnw0Qa9i
 Zv/YGYWGYxl7myNvWxfw0CIgJUc9b2/XePq2AH0H37XLuqx44GHHVjgkb3ys6UwuYH
 QFUJSlyCI2x3AldpppHi6cKlbUrpf5epTIwYkQ0LyIddZNVrNNmKUj9pq1nkh3vhav
 ePFznWLS5KXHwuBhRZexeraVkFwzXRLP/38HX/OFwy/5mrR8Hs9LdC9PbwjoOwqbNV
 ADgrJu7beLvyyJTcpsvn3lAsea5miSCymSsM2dL/H4uMyDHc1oqmdVcUWCHL7cYIF+
 w+SQ6/88DMfNA==
Received: by mail-yb1-f177.google.com with SMTP id s186so16729513yba.12;
 Sun, 31 Oct 2021 18:57:32 -0700 (PDT)
X-Gm-Message-State: AOAM5324pq6vbD8kzUj7BBT7iRXDBoApbT8ZShO8Ru0q9zh/+NbCpb3p
 IeRQy1B+ZBU3IyetPzebx2LeGwIUC9ObgcWS5l8=
X-Google-Smtp-Source: ABdhPJwLzr48xvkbPUYNSwW4wG4jcRHULAsaxHDgvLOaeOhiDi1MY+7mZCeP1WaifSe+QfUYgjKQrdu4XIYT2pTMgvI=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr16913634uar.66.1635731841194; 
 Sun, 31 Oct 2021 18:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-13-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-13-digetx@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Nov 2021 09:57:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT+EsLt+pnYyTw_B0C8isho=E4tfOWROe9h-GZpYjET=w@mail.gmail.com>
Message-ID: <CAJF2gTT+EsLt+pnYyTw_B0C8isho=E4tfOWROe9h-GZpYjET=w@mail.gmail.com>
Subject: Re: [PATCH v2 12/45] csky: Use do_kernel_power_off()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Lee Jones <lee.jones@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_185732_768242_3F73EF36 
X-CRM114-Status: GOOD (  20.07  )
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

Only for this patch, Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Oct 28, 2021 at 5:18 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/csky/kernel/power.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
> index 923ee4e381b8..86ee202906f8 100644
> --- a/arch/csky/kernel/power.c
> +++ b/arch/csky/kernel/power.c
> @@ -9,16 +9,14 @@ EXPORT_SYMBOL(pm_power_off);
>  void machine_power_off(void)
>  {
>         local_irq_disable();
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>         asm volatile ("bkpt");
>  }
>
>  void machine_halt(void)
>  {
>         local_irq_disable();
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>         asm volatile ("bkpt");
>  }
>
> --
> 2.33.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
