Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bndZ9UxUcQoLNw1mc73LbZHfq+e/pCsYq4EfFvLMNk=; b=FyEABulXo8dIak
	vWbGq1S1AiF0L4fguXtx0/J/cjhn6cBiW88SZQixEWHFFLoOqQWo9qg+Vf2KX800Dk/taHbLVoQjv
	Xuva6xjt8tuWL9MUTEQCZb0j/vYnyGMmVCuJAM1goH+ts/DxnfTuQg1SbgPqSL54Db6O1wgiw4/At
	3Dtvd5YUOX07OcCjC2g3vita/e8dVUByPetYzfByobvOOBuCXZuzDFxafAYbcsGN+wWZItr/3a2Gm
	7C76MMih/xDgV9EJH23Rw0z31mZ76GL6CWCVa8amKXH/zuQqTCM2KeCPuD4vIp1465NMu0vseu4wk
	9o2GCFs9hlZwUBXaymzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntCMn-005TI9-Vt; Mon, 23 May 2022 18:01:18 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntCMk-005THJ-Jc
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 18:01:16 +0000
Received: by mail-qv1-f43.google.com with SMTP id e20so12638833qvr.6
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 11:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4rBBcobCQCpRnDX0N4E6NWTW64w3K1pdJQpMj8qNhc=;
 b=wW/kvvSZxgy1l0ZNdYMJxGFXsXELD0cZrKEnYDFMXdAtDI3a35MitCq54rzMtQWe3O
 MA7068CeStMes2znmWE98dHWyjuf6uN1sw1vSWFVLfdlDRDOOzOhjbU8vHkY3Y0Ef4vt
 vWerAi0hVddjmgWra7r/1dxtagDcKliztsZA+zcibjZinnSgYWGSLFKTYqPvSs1KebfO
 eSel6ZBYULGbUWCOc+Uk281fUEUOY39G/nCpYZaV5enUvOV9STtWXBdpYTFbS8Nwl23h
 fg16BqpCK+2kgRF+4EkWxYNNWIwWSlxSHiYHu7V+DLjGoDoyoTi0L7hYuh5zijIGD4Zo
 t45A==
X-Gm-Message-State: AOAM532LeSfeLDZaiHyY+HOKlJoB4Ut/isZGHGKOCnRNWpcNOqzTVZwe
 MmJgJzitJk0jq3EeXJ3i5cCAQB6NxUzLfIBlnd4=
X-Google-Smtp-Source: ABdhPJwjDcISiNocH2Wa45/8v4HqKDpjGdSC5/ABKygk4UgcIcxwkftcv3pcaAJwl4igKHkbrI9+lA==
X-Received: by 2002:a05:6214:3005:b0:462:21ca:58b1 with SMTP id
 ke5-20020a056214300500b0046221ca58b1mr8643731qvb.47.1653328871857; 
 Mon, 23 May 2022 11:01:11 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 a13-20020ac84d8d000000b002f940249151sm99422qtw.73.2022.05.23.11.01.11
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 11:01:11 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id z7so5544742ybf.7
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 11:01:11 -0700 (PDT)
X-Received: by 2002:a81:ad11:0:b0:2fe:fb00:a759 with SMTP id
 l17-20020a81ad11000000b002fefb00a759mr24887559ywh.283.1653328860919; Mon, 23
 May 2022 11:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 20:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
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
 Len Brown <lenb@kernel.org>, 
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
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_110114_686597_019234BD 
X-CRM114-Status: GOOD (  25.04  )
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

Hi Rafael,

On Wed, May 18, 2022 at 4:46 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:

> >   m68k: Switch to new sys-off handler API

Sorry, I didn't realize this was going to interact with the new m68k
virtual machine support, which is included in the m68k pull request
for v5.19.

> However, I'm going to send a pull request with it in the second half
> of the merge window, after the majority of the other changes in the
> subsystems touched by it have been integrated.

And presumably you will have to merge in v5.19-rc1, too?

I've sent a fix.  It should appear at
https://lore.kernel.org/r/20220523175520.949681-1-geert@linux-m68k.org
soon.

Can you please include that in your PR?
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
