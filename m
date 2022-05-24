Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5yeJrcRg3Av2R+7slPrpuBc0OONpSJ+t312AlIV5MI=; b=zXFNu3ynOGvcSj
	7DEVVyfL3SmlgowhE/rKQcvFzA4Jjdz/wIDEq2rIjYFl6wDV5KCprUwBsHGN4+bLNP/ZM/5rjFKLN
	CqmvGjILa4tSQnaSA5Zl56GNQyumzrO99dPjzcWGuQj8xmUBA2HlS5sogK2577KEOo+TbqV6HTVEp
	FrddSACW7dyDwi8Rkzdstry96oZc5Hpo8kRPySsqgfalQ37fsA9ADd32K8BSswcRrU76x5yMFnTSx
	2WiqQzcmJXgghY2ap6P1R4V5jLVlyTKCrrcW8qzLm/uh9NFbVaZiLzEe0HdRkAvVnPkiDAMRCBZ3R
	Y52LUJgcwwOmY4erY4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntUNh-0084ei-8h; Tue, 24 May 2022 13:15:25 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntUNa-0084ct-Ns
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 13:15:23 +0000
Received: by mail-vs1-f45.google.com with SMTP id c62so18145111vsc.10
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 06:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/pNo5ypsj8sjqbjG1l1gWrym6AVA3NFtAtotZSuvpI=;
 b=2RBYaBb0yPdOemC2pA6elBhfi33MTViImXVS4q0u7ssc7MPo8NRAvKWQx38Wxdd0hI
 RWAkDcjJoqTlb5Y3/R2bo3dq7/hPhrnTabZC/lsDagDcamj8jEB92prawx9sZjnxFdMM
 Hc7SoAK0CjUC0KN09qfcyfOCPLwCVy/JUonCNcVdPqWbkvsJyTOUn+4H5VCMd80AzhFR
 DbPahrm3A6zClvlj5/afqtrEh/miDA319olRzMXaT5X/4wkfNasRgjE39Rk7mgVGO9d8
 NW3WEeklC+CwL3L+LP5oQ/y3vvvzGGOz988q3xP6IY9aYK6ObaSX+tZ209agwnfjkz7K
 egWA==
X-Gm-Message-State: AOAM533wgNKlZJWA0Lsqfk/MSApzUI0C3u9l8Q5lVgCUwPzppeNbc+U3
 lvFIQsPAxg0pEzzOb73uLUreK9X+fxfPz/I9ghM=
X-Google-Smtp-Source: ABdhPJzOK1Vf19wjgYXNyxFGj9AgWzBklDct0+MOuqOKO3RhaCJCzf0q2Rl/o3jcs1VONK4QZ+supQ==
X-Received: by 2002:a67:d215:0:b0:335:f166:6527 with SMTP id
 y21-20020a67d215000000b00335f1666527mr9565527vsi.53.1653398115534; 
 Tue, 24 May 2022 06:15:15 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 c185-20020a671cc2000000b003358307b9a6sm1252064vsc.27.2022.05.24.06.15.14
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 06:15:15 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id j20so6253466uan.6
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 06:15:14 -0700 (PDT)
X-Received: by 2002:a25:e7ce:0:b0:64d:6028:96b9 with SMTP id
 e197-20020a25e7ce000000b0064d602896b9mr25151338ybh.365.1653398104009; Tue, 24
 May 2022 06:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-8-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-8-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 May 2022 15:14:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
Subject: Re: [PATCH v8 07/27] kernel/reboot: Add kernel_can_power_off()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_061518_834696_899D561F 
X-CRM114-Status: GOOD (  21.88  )
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

Hi Dmitry,

On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Add kernel_can_power_off() helper that replaces open-coded checks of
> the global pm_power_off variable. This is a necessary step towards
> supporting chained power-off handlers.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks for your patch, which is now commit 0e2110d2e910e44c
("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.

This causes the "poweroff" command (Debian nfsroot) to no longer
cleanly halt the system on arm32 systems, but fail with a panic
instead:

-reboot: System halted
+reboot: Power down
+Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
+CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+ unwind_backtrace from show_stack+0x10/0x14
+ show_stack from dump_stack_lvl+0x40/0x4c
+ dump_stack_lvl from panic+0xf4/0x330
+ panic from do_exit+0x1c8/0x8e4
+ do_exit from __do_sys_reboot+0x174/0x1fc
+ __do_sys_reboot from ret_fast_syscall+0x0/0x54
+Exception stack(0xf0815fa8 to 0xf0815ff0)
+5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f0d94600
+5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 004e56f8
+5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
+---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000000 ]---

On arm64, "poweroff" causes a clean "reboot: Power down" before/after.

On both arm32 and arm64, the same handlers are registered:
  - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
  - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off

On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
On both arm32 and arm64, legacy_pm_power_off() does not seem to
be called.

On arm32, both pm_power_off_prepare and pm_power_off are NULL.
On arm64, pm_power_off_prepare is NULL, and
pm_power_off is psci_sys_poweroff.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
