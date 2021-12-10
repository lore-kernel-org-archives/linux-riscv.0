Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9CBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMNpkTpbK91kyOKzMY9gvA9dDHpwlN2o1LfbjJ0jAoI=; b=PXsp/JJ4iDOL7J
	PB9HxkxdvmfW6aZna55wttQX8GFOFafn9t58gdpgv70MUpdbG5HOqQrrRVWcnwWkcLu/HahKuTp6e
	gD/UiUZYxBL20HsrtVFjBaD6WBmlCFfrYIiM/WyH53LMQSQ/yMkgF+5psEyh1KfZMhfoGu84RQuir
	FfJaO1FhpjCHzRjgXKe1UxtF3qXeQJ7ByPdsj7ocLB//9Q8F6caOi+HK562MPYjtaYb9IQebKpzct
	6o2W6lEI1+UTKP5FxstmytIsSI8Z6Qh7BBkQs5n1jtKWE+8t04S1ZMkVhaKhdd/vgooFzwXQDQFse
	Rr3KlBSbGSpN5BsW9I/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkKz-0038g6-F1; Fri, 10 Dec 2021 18:09:41 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkKu-0038c2-TH; Fri, 10 Dec 2021 18:09:38 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso2575137oow.10; 
 Fri, 10 Dec 2021 10:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnSiIIEAxVbWb5ME0b4EjQTIeMlzMMlMKVBEVEKFmvo=;
 b=nlayelVznyhV11O7mhZ1rWDd6/wAKDnSmkHbfXUhtl1DKh4zkriHM07LXQX+ZccATg
 VgvgveXYmoXOSoMYOBrJzXdZHgqfHyM/gUhhsAgNJiAkhwVsHsdp0d9qIT+e1d/oC59j
 Yvnq+LG+Dd+UXnGbKs59QNuytEnNioNt/ekmITXn9J50RwtCUWzLQqPZj5q39uWx9Ylf
 X4Y226zmSQV3TNA36BsyMLopY309hzmC7EtZ+pMC5uzVs64kXGR1wzMXvU1km/Dvs9AL
 aiL/qd6oIrZ5Ne9Aivz9HANPoldzeSD7n6gtjeDF7gB5dA3j2oiyxbkOULg0qwT3l/Dx
 KYVg==
X-Gm-Message-State: AOAM531DjtVh09+WWfUdZyMhZX0ggLSoT9LLU9oza1pHvre6LKR/4baV
 cfEY2LcdfTIpOv+GY8FPtc8YDBUesQ7xUqJQpjM=
X-Google-Smtp-Source: ABdhPJylQaHxxBjvxLDdejK26dmax8gF5GO2emXKWarqrtdmHFUWV4Injg4wQQswc1tWUgMSYyPwJPfech+QMe2lThI=
X-Received: by 2002:a05:6820:388:: with SMTP id r8mr9365162ooj.0.1639159771506; 
 Fri, 10 Dec 2021 10:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-8-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:09:20 +0100
Message-ID: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
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
X-CRM114-CacheID: sfid-20211210_100936_990932_F37472E9 
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

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> There is no need to annotate function prototypes with 'extern', it makes
> code less readable. Remove unnecessary annotations from <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I'm not sure that this is really useful.

Personally, I tend to respect the existing conventions like this.

Surely, this change is not required for the rest of the series to work.

> ---
>  include/linux/reboot.h | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index 7c288013a3ca..b7fa25726323 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -40,36 +40,36 @@ extern int reboot_cpu;
>  extern int reboot_force;
>
>
> -extern int register_reboot_notifier(struct notifier_block *);
> -extern int unregister_reboot_notifier(struct notifier_block *);
> +int register_reboot_notifier(struct notifier_block *);
> +int unregister_reboot_notifier(struct notifier_block *);
>
> -extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
> +int devm_register_reboot_notifier(struct device *, struct notifier_block *);
>
> -extern int register_restart_handler(struct notifier_block *);
> -extern int unregister_restart_handler(struct notifier_block *);
> -extern void do_kernel_restart(char *cmd);
> +int register_restart_handler(struct notifier_block *);
> +int unregister_restart_handler(struct notifier_block *);
> +void do_kernel_restart(char *cmd);
>
>  /*
>   * Architecture-specific implementations of sys_reboot commands.
>   */
>
> -extern void migrate_to_reboot_cpu(void);
> -extern void machine_restart(char *cmd);
> -extern void machine_halt(void);
> -extern void machine_power_off(void);
> +void migrate_to_reboot_cpu(void);
> +void machine_restart(char *cmd);
> +void machine_halt(void);
> +void machine_power_off(void);
>
> -extern void machine_shutdown(void);
> +void machine_shutdown(void);
>  struct pt_regs;
> -extern void machine_crash_shutdown(struct pt_regs *);
> +void machine_crash_shutdown(struct pt_regs *);
>
>  /*
>   * Architecture independent implementations of sys_reboot commands.
>   */
>
> -extern void kernel_restart_prepare(char *cmd);
> -extern void kernel_restart(char *cmd);
> -extern void kernel_halt(void);
> -extern void kernel_power_off(void);
> +void kernel_restart_prepare(char *cmd);
> +void kernel_restart(char *cmd);
> +void kernel_halt(void);
> +void kernel_power_off(void);
>
>  extern int C_A_D; /* for sysctl */
>  void ctrl_alt_del(void);
> @@ -77,15 +77,15 @@ void ctrl_alt_del(void);
>  #define POWEROFF_CMD_PATH_LEN  256
>  extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
>
> -extern void orderly_poweroff(bool force);
> -extern void orderly_reboot(void);
> +void orderly_poweroff(bool force);
> +void orderly_reboot(void);
>  void hw_protection_shutdown(const char *reason, int ms_until_forced);
>
>  /*
>   * Emergency restart, callable from an interrupt handler.
>   */
>
> -extern void emergency_restart(void);
> +void emergency_restart(void);
>  #include <asm/emergency-restart.h>
>
>  #endif /* _LINUX_REBOOT_H */
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
