Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAA3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7INRpcE9fFDBFMwGEVVAx5FJyoYyFMO4ihma1UJUx04=; b=haUlCETDK+RZqt
	yfnYLJKg3kJNa0UYIeEKQQl+linK3gZl0E46uYse65zL2MoJKYgQKNYptRapDVlxzPhd2YGwRZM6V
	E5ch2ViF2AsWM6g7xFosX0Ef6qBEJDs9J5L4OAFe3ovWQzX7nPm0PR1TrcqZvxt6Y4FkcWGo4oDHm
	BRAKCssOi41wWMS8v+c/+ki8fjC9Y0qVS+WZ0LU79UYjEWWqvdAmNWD7/pP5pALLfh6GmGrKWFaTg
	mF1VMFWB2/QYkhVD8H1unjqJeq+JaGobI+6xdncuTpGW/pnZfkutWH7Oe3vNU4jB3n1l4nA7o0tRn
	LZn5b3oSRtMpSNTyn5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nei2g-0029s3-Sh; Wed, 13 Apr 2022 18:48:38 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nei2c-0029qu-TZ
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 18:48:36 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so32833137b3.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 11:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1rErWVySlUxlEFN2u18NGS5Qm0qvXYHGlMsYpGhhEY=;
 b=XzNn4TgQ5Zo7v/BteSuAmgKUM4MzhfdEeL8oVfj6JVxWRXdes7lJWw8Z81Id8pF3mg
 ohy1dqvj3V5uZgE5/nu2mgllDrSFCMJkOmCFIFYM2QzO1y+Qxu/JoN5w8xSisE0TF9dg
 pJWdW5C91Vtzi9kiAhF6Y/TWPm28bnCyL9V3e7Jxc4/yRg7sbLwXckKqb06nNdiyCx/E
 8Vg1v2HaCmdrxmCO+/pZjKxcBhypMla80nd5knHEUafotcb6qSXQVyL8UJZtZFYNGIRX
 BT6wGlISLubIefsi0u4P35DXR2vZCs5FZRcUtA0SaPEdimxG4wRjOP35Q09tLkuT61bf
 IQKQ==
X-Gm-Message-State: AOAM530hydfS824OgGgYfnX0mqhnDiQ9aqn3nuYNDwtkanBunX5c0onr
 kchB3/9SMZI7zPDEHJCmyoXrJZOvdTYnEzGo3CI=
X-Google-Smtp-Source: ABdhPJz9BfsA7QIGi43YRDlzzrWhVjbeGEMJOs01j9nA3vXXWXOOPKhq5d8EhdtGHqqQ5dYXQmK91VGL/RQnfnI1jKs=
X-Received: by 2002:a81:7c45:0:b0:2eb:4759:cc32 with SMTP id
 x66-20020a817c45000000b002eb4759cc32mr224284ywc.515.1649875711933; Wed, 13
 Apr 2022 11:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-4-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-4-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 13 Apr 2022 20:48:20 +0200
Message-ID: <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/20] reboot: Print error message if restart handler
 has duplicated priority
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
 xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_114835_590243_6D8636B2 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Apr 12, 2022 at 1:39 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add sanity check which ensures that there are no two restart handlers
> registered using the same priority. This requirement will become mandatory
> once all drivers will be converted to the new API and such errors will be
> fixed.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The first two patches in the series are fine with me and there's only
one minor nit regarding this one (below).

> ---
>  kernel/reboot.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index ed4e6dfb7d44..acdae4e95061 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
>   */
>  int register_restart_handler(struct notifier_block *nb)
>  {
> +       int ret;
> +
> +       ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
> +       if (ret != -EBUSY)
> +               return ret;
> +
> +       /*
> +        * Handler must have unique priority. Otherwise call order is
> +        * determined by registration order, which is unreliable.
> +        *
> +        * This requirement will become mandatory once all drivers
> +        * will be converted to use new sys-off API.
> +        */
> +       pr_err("failed to register restart handler using unique priority\n");

I would use pr_info() here, because this is not a substantial error AFAICS.

> +
>         return atomic_notifier_chain_register(&restart_handler_list, nb);
>  }
>  EXPORT_SYMBOL(register_restart_handler);
> --

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
