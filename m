Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEFDC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muoShSEZyNL71OGaLNLuK1rStlJYvwNiXEj6dl4+4vY=; b=k2kD43nWF6B59J
	athKnwn8wJZFh31qIaqjwiGi3dwiSVWb0xcUjJf7ygGIi5iCU+TU60YkokWXBqzWY45izijZ/G+tP
	eGDp+eCWzPl9SATOH5s803v9rzSX1Nn//xzs7YgpjgRkDdimgSs7uC4zElbOJ2gpB/9OjGoQ8yH3U
	eLrdsGZQIsWBrq5ofq3JlbneBt81UC61XQcdSgrWOvq1luuSIglh8SYHy/alMBROMyEeVwD9jZz7I
	B8zwy2/yzXbREHSw8sVqD/DI/+/7GXbzzQ3vAWp5QxVzGRTzIiLCRxj3Ar+QWSDDAEJYTYA98hKmk
	wujjqkVuAJz7u+GJ79oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntUot-008940-4v; Tue, 24 May 2022 13:43:31 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntUoq-00891m-AP
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 13:43:29 +0000
Received: by mail-yb1-f180.google.com with SMTP id v26so2627833ybd.2
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gF0TUV/f1EYPh7LzpbylOlyjLRvO0rS2Z8aSd7vESdM=;
 b=TRSSki8zKQiwJVT5KPo3hHF8kZ8d/7Ir4a1QnCchrmMMwgVgAAx7TaUWhkKrOmA0MU
 mjmYYu3cInc7zFfw2RYR5fzXGs1hi2+UZmnK2QEGlBtYvfVXQY4opNE1jI/PGP/zKF71
 x1hezO0JMzyQ+GJ07dAV+jamVL47wD1ckVYPWsIfnj8bQ6zpG+NUD1b2xbJaxspVfbWr
 qjiqsGbOMDlUPo94eyJ2R+9xudqEQcUldH6tAmAv9kK/potLLFfUI4XxHXSj9kUzfNUD
 KNdI3I/wumJRZb0SuNDVv3aR/VfivEbzLzmVKT6nSNECg2/q4GmJ7UTkzmPjSU60rQ34
 tt9Q==
X-Gm-Message-State: AOAM530MmsxYeCLYHODjwkCnJrr0lJkRS5EgwMHxEEexc1TSCA+LZt5Q
 6o2NiNA8deZT1V5gH07B+86QzNLQEVCKWewRhDc=
X-Google-Smtp-Source: ABdhPJxrx+4PyTpojs6STJF90N5O3lVotlMS1F5ewlefJhltMPRleCLQ6INTFZNdlhzglSskVKU04pl4oHllKVWle+Q=
X-Received: by 2002:a05:6902:100a:b0:64f:44ec:13ff with SMTP id
 w10-20020a056902100a00b0064f44ec13ffmr24477246ybt.137.1653399805346; Tue, 24
 May 2022 06:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
 <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
In-Reply-To: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 May 2022 15:43:14 +0200
Message-ID: <CAJZ5v0jar8GONkAZfLuRpKHuYRu1Y_0AecmGxayM00AHCJkYVg@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
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
X-CRM114-CacheID: sfid-20220524_064328_394164_7AC5F956 
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

Hi Geert,

On Mon, May 23, 2022 at 8:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rafael,
>
> On Wed, May 18, 2022 at 4:46 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
>
> > >   m68k: Switch to new sys-off handler API
>
> Sorry, I didn't realize this was going to interact with the new m68k
> virtual machine support, which is included in the m68k pull request
> for v5.19.
>
> > However, I'm going to send a pull request with it in the second half
> > of the merge window, after the majority of the other changes in the
> > subsystems touched by it have been integrated.
>
> And presumably you will have to merge in v5.19-rc1, too?

I will merge this series on top of the Linus' merges of my pull
requests sent yesterday (assuming that he pulls them, that is).

> I've sent a fix.  It should appear at
> https://lore.kernel.org/r/20220523175520.949681-1-geert@linux-m68k.org
> soon.
>
> Can you please include that in your PR?

I will.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
