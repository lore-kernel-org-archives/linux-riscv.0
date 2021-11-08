Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C5FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 07:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D0461059
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 07:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7D0461059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRIFvf7Djmv8q4peiTMsENuMzjSq9/gkMv85nQXBE54=; b=NsLlMmomPpyMFc
	+sn3GccdA92xRnuCZZa6zwzSu36EjV8DCRB+iZVWNldZ9uHeHgXncEMF5Y0RSABWkveOihtm1YffK
	x+YXxa8VtOn1mCgqcHQSwUUOEHJY9Lwqmpb5K0hwDz+u483WnF0wbsxKAZCGX1b1tckL8vqEEqFXp
	aMZ3zRk9pxHnkf+U06KxafkKp7168gTYXCJ5qODthLxCbIxzlmSbVA/HBEf82Iq2ZQFZzTRnJzAVa
	HAg8xC4p14HWqXTl4EfVWujztCtvkyY1oRzry6AtoIjOHyMFX8YDRj3YOSmQXi0UKqTa0RFyOq+pj
	EsyolBVQAeci8DivKmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzNS-00FckJ-8z; Mon, 08 Nov 2021 07:47:38 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzNO-00FciO-Rw; Mon, 08 Nov 2021 07:47:36 +0000
Received: by mail-pl1-f180.google.com with SMTP id u11so15233582plf.3;
 Sun, 07 Nov 2021 23:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niQCVpji9nu8a8Mfie3ofua8MkF1HzpLuS22ys5pvwg=;
 b=tVnksRb6Vn9GTkqLR9CFuR9fa9gRTD7AkOO5oEtx/Ofxskwk6lPkMDjn7wnXFhtOaP
 XBOPu7R+DA35gFub4C8XM18cM22aKUVHtsdC2xv8Ap1Om4y63KUJuWVEQv/aOONNeg/f
 qT6K/5oNnLxIgm1znYdkW7mOGH90H05QcIeWy1nCZu0THMp9PS6tpeHFwgsFZ3unAG5u
 8ybipuM0Hx4UrMyonxLkR3rNLJIYBp0oCLeWBZjZ6meGbOU9Fz1XVWh8/T2tmIrSbnQD
 4tlgKikDBrg7rLCNt33gjF58STbwdcHZce6Q9I8EuPPgStLN3ymkqRr+1q1qOOC6yQI2
 cctQ==
X-Gm-Message-State: AOAM530Q1AkYIEYbOOO23wqRR4xXd+Kz9ZtDZOMCfKsIfFdhR87JwMhV
 2pw4e2JtuD/ECeSjQ9CRK8luz/fwRjGczg==
X-Google-Smtp-Source: ABdhPJyJ+tzCZmEuOe/hoHAmozM5FZkbax5gKLhPfaB9wX5jMGEM65CHT5IE3kmjz0z4fmG7srJOwQ==
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr68598911pll.21.1636357652814; 
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51])
 by smtp.gmail.com with ESMTPSA id l6sm16025668pfc.126.2021.11.07.23.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so8146637pjb.4; 
 Sun, 07 Nov 2021 23:47:32 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id
 b7mr71214037vsu.35.1636357641114; 
 Sun, 07 Nov 2021 23:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20211108004524.29465-1-digetx@gmail.com>
 <20211108004524.29465-22-digetx@gmail.com>
In-Reply-To: <20211108004524.29465-22-digetx@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 08:47:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Subject: Re: [PATCH v3 21/25] m68k: Switch to new sys-off handler API
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_234734_924305_F7B1B3CC 
X-CRM114-Status: GOOD (  24.52  )
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

On Mon, Nov 8, 2021 at 1:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> Kernel now supports chained power-off handlers. Use
> register_power_off_handler() that registers power-off handlers and
> do_kernel_power_off() that invokes chained power-off handlers. Legacy
> pm_power_off() will be removed once all drivers will be converted to
> the new power-off API.
>
> Normally arch code should adopt only the do_kernel_power_off() at first,
> but m68k is a special case because it uses pm_power_off() "inside out",
> i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
> while it's machine_power_off() that should invoke the pm_power_off(), and
> thus, we can't convert platforms to the new API separately. There are only
> two platforms changed here, so it's not a big deal.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
