Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C617C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OB114WPFWdZDqTUPRH1TX6ccETHRCi6lVv9ibDQM4X0=; b=4hWfjpvn6CeVR6
	Cmt2yRlIfA+GktlePilIInOIRL/2Y0Xd+Ej1TrThku7UXKV4dqiZzfl1rkESg3BGzjN2y66UkuDWs
	Xfy1t5i141dDpCHtVOVIqNfn4SCAYoOp7gtnr9dwpBZKpre9soPG1H7cax4KBUi+pjlBHHK1OHANu
	6rXwjASDkKEtBpYh9Jr/tq1CqZs6rIANFjWP1G2hxL+Qzny5+OH/U9vw1Ge/IvSyMJNtzzll8H7a8
	wYj8JbnBekM+inmISO0Oz2AbHLQFJukququEL935+BXRNfue5KacbVXaClJIq/g2DCMsxmVo2nBed
	V/1/reIyZ7lCIqhZx3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neAcL-00C411-Pc; Tue, 12 Apr 2022 07:07:13 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neAcG-00C3vY-Tq
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 07:07:10 +0000
Received: by mail-oi1-f174.google.com with SMTP id w127so18114359oig.10
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 00:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5mglcYZA42FcZWexfT//Na3N8U+QShWNDx9HhSMVxo=;
 b=3d9pQaNLIqz8PgGj4jLPHeiFUvMMita2Ew6F1q5fSBEecO0EUQiiVqcf0j8nLAwqsy
 63g4iSaGDy/gZgu/4QDRjYARt1xrGMoWthIuLgFFdcZz8MrPW/Lt0AKef2bu29owITBj
 UtqJZU3l6+3pzEXRFYAEIgEEiSmFS1kDGgSHkdT2UZc4gGDSsI5gUNvvnsgOYmTc574a
 ULuiwaPdHwWUkwzhYVnS6A3xuvMZ7ONUJ9dcB2Ng19TLWWmX5f6zXlF7NaDvudDjnuCS
 TLnqHnXoGcVBVRy2D28ZVAcryTxUQp5CKVw7ZszWxK9dnDBWPHKXMmUB2qFGdP3mgg4K
 yWmg==
X-Gm-Message-State: AOAM530OR64emq0ROJz3C0ZjeQEwZ4YVsN7uRcfoZkw09tbVOGqK71tH
 HDrko/kAFAQAk1jiUNSGAP2r03lRaygE/h2f
X-Google-Smtp-Source: ABdhPJwKGe9uezBTVpiRUyvWmJ+J22w3i7ZVlQP3V68jruudW6jBAWlvlrSwTh38rFqXY4tUgW9/tA==
X-Received: by 2002:a54:4406:0:b0:2d9:ef76:da60 with SMTP id
 k6-20020a544406000000b002d9ef76da60mr1118275oiw.259.1649747224928; 
 Tue, 12 Apr 2022 00:07:04 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54]) by smtp.gmail.com with ESMTPSA id
 w25-20020a9d6759000000b005e6b6424611sm5564370otm.50.2022.04.12.00.07.04
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:07:04 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so12812477otq.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 00:07:04 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr25945732ybf.6.1649747214062; Tue, 12
 Apr 2022 00:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
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
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_000709_002605_C34A0BC3 
X-CRM114-Status: GOOD (  22.05  )
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

On Tue, Apr 12, 2022 at 1:38 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Problem
> -------
>
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.

> Changelog:
>
> v7: - Rebased on a recent linux-next. Dropped the recently removed
>       NDS32 architecture. Only SH and x86 arches left un-acked.
>
>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>       to the MIPS and memory/emif patches respectively.

Looks like you forgot to add the actual acks?

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
