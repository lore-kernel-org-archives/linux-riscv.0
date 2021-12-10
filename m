Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0C9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZVmcW08kac6ox0jwjWBP/Umjm6dfgM0Cod1iWmpu/Q=; b=set6Z88gKJrBDr
	vncXPnZnamVtrFNNnyhLhmdabe/DfMbXm42s+B7B3Z+kKJRtABpOPG+0GFH+TQfKwhgPxdJW1JDN6
	xX+3x7lBWF5o0T4CX6x5pufESdZHDIY3Fk0cVKEOAYl/bhT9Qj7pdkhP+xyHUYsXO5W6bpWnKNyXL
	X7s8uiYTf02/SDQ1eQdBv65X8lL/oZVToco3fHlFMSRxj/IGB08GPAEiUWaoPC1RDglWH12Ja8Ml1
	nzOeVPEaYxBh1sUIl8b5dYbuHc8h/S1FlVVvON3SeZ9E0RelEwWP0zvK2hSrtESKYQJ91FIWkCoyr
	3+sXXTvcQ+iWMZqjj8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkhG-003DHB-Ku; Fri, 10 Dec 2021 18:32:42 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkhD-003DGh-4B; Fri, 10 Dec 2021 18:32:40 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso10449609otj.11; 
 Fri, 10 Dec 2021 10:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYFeMefDtygzQHG6cGasFJft83PyhMCvIHgML7JQ1W8=;
 b=mw2VNofU8bVAwcmbPbh0NchtkTIauEXGgL/kwB3SL+ZUY8gNWeBNH9FExDUT1CzzJi
 d+xWT7Akzyc53Ug/H6Jpr5qXMffCEs7HVU2mZptjIS3LnyOwHb+5ocuAWR3B2KQn1LjD
 QrNkUOrp887HcQ8XhnMVQtKfjvmxWe3kYZkcxscPxfvCuQDC9ULBm+UYCuUFGRQQyfSl
 gavSHaM2AWROpVEsTo/g1L5rZ5slapQW0K0MTlluBtlCQ88obATpK+H6Ay72wmhB7u2u
 j/Hbh1fQRGPSG711G3gDbCoLn+cHYSNuQEtPCVGzubzWApnAMkyDIhV7+9F7N42c7Jh/
 igmg==
X-Gm-Message-State: AOAM532zEhVR1iyUYdcDUv2pp0TVcBSEHnobRmHCCg0i55IeMqkBTMOw
 fw27D4u7q3fLjho1gpApAAAL3gxr17qaYpN8BCk=
X-Google-Smtp-Source: ABdhPJy/ApH2I9ley83OfAtDiEoSWuJBoE9Gqun3QKF0IviB+39TRacgd3bR+5yVv4MXsqS5F4aemy99lcaDR84MB0I=
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr12642134otu.254.1639161158278; 
 Fri, 10 Dec 2021 10:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-7-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-7-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:32:27 +0100
Message-ID: <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_103239_206754_78454FE4 
X-CRM114-Status: GOOD (  19.19  )
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

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Emit warning if unregister_restart_handler() fails since it never should
> fail. This will ease further API development by catching mistakes early.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  kernel/reboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index e6659ae329f1..f0e7b9c13f6b 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
>   */
>  int unregister_restart_handler(struct notifier_block *nb)
>  {
> -       return atomic_notifier_chain_unregister(&restart_handler_list, nb);
> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));

The only reason why it can fail is if the object pointed to by nb is
not in the chain.  Why WARN() about this?  And what about systems with
panic_on_warn set?

>  }
>  EXPORT_SYMBOL(unregister_restart_handler);
>
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
