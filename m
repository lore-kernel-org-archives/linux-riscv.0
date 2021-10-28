Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7564BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 09:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B76E60FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 09:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B76E60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZDKrkYiMco2zVgqHL5tOS225wYwBld32VIebjDAscU=; b=T8cuxVYCHCg1K7
	p9NudqWNtOCsmU/eiLiJ9Q1sNoIn6p4zCOb2YcWsMdcMP1q+C6NSNsx3FFFAeCSH70fFzCuOsJmcR
	uqlod1sPnKgzvN1r0z3G1pgHc1HJKiZcCKtI1RIIguB84MPSkgZmD52SP1IyJMiX0Ld2cZURNAWQ1
	KKuTgxx7LT1KxYrEF7liWnp7naX2BV4G4u3y4zpse5juu86krm67VNvhIM0buv8p/h++5TC/yWdbu
	4ImseFGdA069KPXvPDXJbEKPR9nJ6Ctdc6QLgN8tGNhoosvUnj3/iK8HBSHAji3nD5JOkLVg2lxKn
	VBy3rxb5BL8tbSefguHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg26K-007S46-7K; Thu, 28 Oct 2021 09:53:36 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg26H-007S3g-FC; Thu, 28 Oct 2021 09:53:34 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so7746556ote.13; 
 Thu, 28 Oct 2021 02:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uz31be5RzrXoa4uAxe1xyKZoIQd0wtsVVy1gZjyOGeo=;
 b=SKr/khx5H6dO/7isGhk3JmiLa3D8FzYyPuAeCoAe4gz4Xu7RQP/0Ziayh4hYC3ttqw
 3IBoVQdTxx6HxiqLC0YNfpUnEkmJX2XA6pGomn01EUuYgYmU4TqsLtLXekYte9QjWT3M
 CU+yf0jcAa3PgPQGI2c1X4beakNcG+IslyUWDo/tLAC6U/CCWy6PzYOZSyOpE9VHwJoV
 mJiQeWeTTAvGVK5/q0JMTNcbvYAxjMx4ko0VuiX9jTPOoINStNwXeCydjR8HIWnvjpGv
 Wcwy4eWkVF5ON2ooGUGk6cQqnL4jJWY7JCbM6h01sw8OgJk4rm+Hb1ANFgBrVK2a/ffn
 8Jaw==
X-Gm-Message-State: AOAM5336cJ9M644gtJUACKf+lttOE+wErGINHl2L1M2CC5BwMTUsOAgJ
 8QFS15caGlmbU11OxLZLyrI0/Tvkjaq6rqcRJ50=
X-Google-Smtp-Source: ABdhPJzOhFRTFEQQ+n5tEP/bBwTFb0889hJMVw20FWNyFAcerxAE3whFQ+5AhX1ip3T9ogNIhdu7wA8+/uN9VNCEoX8=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr2411564oth.198.1635414812552; 
 Thu, 28 Oct 2021 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-9-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Oct 2021 11:53:20 +0200
Message-ID: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
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
 Guo Ren <guoren@kernel.org>, 
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
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>, openbmc@lists.ozlabs.org,
 linux-tegra <linux-tegra@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_025333_540545_8CFEB3B5 
X-CRM114-Status: GOOD (  32.20  )
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

On Wed, Oct 27, 2021 at 11:18 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> SoC platforms often have multiple options of how to perform system's
> power-off and restart operations. Meanwhile today's kernel is limited to
> a single option. Add combined power-off+restart handler call chain API,
> which is inspired by the restart API. The new API provides both power-off
> and restart functionality.
>
> The old pm_power_off method will be kept around till all users are
> converted to the new API.
>
> Current restart API will be replaced by the new unified API since
> new API is its superset. The restart functionality of the power-handler
> API is built upon the existing restart-notifier APIs.
>
> In order to ease conversion to the new API, convenient helpers are added
> for the common use-cases. They will reduce amount of boilerplate code and
> remove global variables. These helpers preserve old behaviour for cases
> where only one power-off handler is executed, this is what existing
> drivers want, and thus, they could be easily converted to the new API.
> Users of the new API should explicitly enable power-off chaining by
> setting corresponding flag of the power_handler structure.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/reboot.h   | 176 +++++++++++-
>  kernel/power/hibernate.c |   2 +-
>  kernel/reboot.c          | 601 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 768 insertions(+), 11 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index b7fa25726323..0ec835338c27 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -8,10 +8,16 @@
>
>  struct device;
>
> -#define SYS_DOWN       0x0001  /* Notify of system down */
> -#define SYS_RESTART    SYS_DOWN
> -#define SYS_HALT       0x0002  /* Notify of system halt */
> -#define SYS_POWER_OFF  0x0003  /* Notify of system power off */
> +enum reboot_prepare_mode {
> +       SYS_DOWN = 1,           /* Notify of system down */
> +       SYS_RESTART = SYS_DOWN,
> +       SYS_HALT,               /* Notify of system halt */
> +       SYS_POWER_OFF,          /* Notify of system power off */
> +};
> +
> +#define RESTART_PRIO_RESERVED          0
> +#define RESTART_PRIO_DEFAULT           128
> +#define RESTART_PRIO_HIGH              192
>
>  enum reboot_mode {
>         REBOOT_UNDEFINED = -1,
> @@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
>  int unregister_restart_handler(struct notifier_block *);
>  void do_kernel_restart(char *cmd);
>
> +/*
> + * Unified poweroff + restart API.
> + */
> +
> +#define POWEROFF_PRIO_RESERVED         0
> +#define POWEROFF_PRIO_PLATFORM         1
> +#define POWEROFF_PRIO_DEFAULT          128
> +#define POWEROFF_PRIO_HIGH             192
> +#define POWEROFF_PRIO_FIRMWARE         224
> +
> +enum poweroff_mode {
> +       POWEROFF_NORMAL = 0,
> +       POWEROFF_PREPARE,
> +};
> +
> +struct power_off_data {
> +       void *cb_data;
> +};
> +
> +struct power_off_prep_data {
> +       void *cb_data;
> +};
> +
> +struct restart_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_mode mode;
> +};
> +
> +struct reboot_prep_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_prepare_mode mode;
> +};
> +
> +struct power_handler_private_data {
> +       struct notifier_block reboot_prep_nb;
> +       struct notifier_block power_off_nb;
> +       struct notifier_block restart_nb;
> +       void (*trivial_power_off_cb)(void);
> +       void (*simple_power_off_cb)(void *data);
> +       void *simple_power_off_cb_data;
> +       bool registered;
> +};
> +
> +/**
> + * struct power_handler - Machine power-off + restart handler
> + *
> + * Describes power-off and restart handlers which are invoked by kernel
> + * to power off or restart this machine.  Supports prioritized chaining for
> + * both restart and power-off handlers.  Callback's priority must be unique.
> + * Intended to be used by device drivers that are responsible for restarting
> + * and powering off hardware which kernel is running on.
> + *
> + * Struct power_handler can be static.  Members of this structure must not be
> + * altered while handler is registered.
> + *
> + * Fill the structure members and pass it to register_power_handler().
> + */
> +struct power_handler {

The name of this structure is too generic IMV.  There are many things
that it might apply to in principle.

What about calling power_off_handler or sys_off_handler as it need not
be about power at all?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
