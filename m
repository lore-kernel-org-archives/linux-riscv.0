Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3ADF8A159
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWIuwbsvbUdoYz7oGA4nmxdAi9+3XGZczW2naiShXl4=; b=AMUa8zexkhdJ4D
	+4saGB0ejhbj7m8kAr9iqpseNRKJ5uo0dRa9wLWpKM9X/3Z3QUi6SpVKfRL4tUXwB/6mko3X0u9bg
	ggYFoqYSid4T16emKlG3vtoTa4qbj6obUj09oiGu9bp15jUfITCx37RVYRV1hXyMy7ezN8JBWiGfX
	EbZ2762yfMtee8FNBXbDUorwvy/3I9MiTcj7sh8E3p3FeJq9/nkWNdV0O0GSE+HVEIVDg4RT6zkQn
	iGF5ThqkwOWTAjS3JjWb5pLJHFIAVdfmYidNWMETit9Kdpc8MwECrW8RBrCy24CTNEsZMPHWugs1m
	2uFlPHq/Ze0YBU85LchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDK01-00000002JTG-01JY;
	Thu, 16 Apr 2026 10:31:05 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJzy-00000002JSc-1PSl
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 10:31:03 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-47952229034so2844186b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 03:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335461; x=1776940261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=h+PYgMsCt+HsycGOWH4ok4pLvxTfZjU4euAIxqEMOV0Z51vycfbXBDQCXNZ03RUs5x
         0U4UbBrK/l96xrS6zfwj8yx7ReunHsun2UVds39TB0wyb0dnje1kfNhsBfIvUjlJsWtS
         dDzLImQ1uZAekXaVWmW85LZH+IXiZ+Q7I9nx1gv7VPEOEar3TZnneQKxnry+fe7hTvvO
         bqkYvd0yldpHhn9TD/YFh8OD6EFdYaIEOlvh2lYbiayRB+iNRp8O6tRI0qmPqgPmhXyN
         sQzmLSAz+kk/5Dz7TXUINvO8jjYa/QMRca9Xy4L1w8aqtrzRkdMXH0LfTr1WunQHATji
         1dbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Bb8a8q5Oh3bBgPzzxyDqdByAaSlFYrCEgkKhlNlMZ2ETGCP8TbrAb6pORbUznBliK+Zs01v3W97wnJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCH5/M7rFGbognkv2d9GSA9FsCOa8qThlBMyFFA4iUxymvZuvK
	UCYIcKhj8J5COTMFFfpm3xabSBA/wK9YcE0BYg/Zs2yntImMpi3souzRJdHURxbS
X-Gm-Gg: AeBDies9opAu47pgi3rxLz3F3yrty1dIASjpMFv2ZW96pgPJbuliNoscP10iAwnXmLJ
	IQe3FfOsF1FbHbo8H9/Irc6zVSK6jxqMOqhiTEzfJqr6dCPNLU1ZKFArHFqtIc/TMTJi7yAQyNP
	B8MNk65K9lqjsF1oqGg0reVFWI67s7YlnLVBGERCMDvWDhdMo3ghNVJIlzS+IKhVxpE7Tuw7+u1
	ZT4MQNv85gmfN3zTGkoqZXViilTFHVp/poo5s7sejHXk/FEzMTH+C2pucmbIvsoibx4dmkuCa9R
	WkiQ0DXaPDqqa3ZvlGYws/eJiZhsvb0p34oMBXp4+yOwLLmZF02iGz0D3NQJa7n/A01UdhCAkl5
	icqz0HInaH2rIvsakbVexP8vmmcb2BL1GvPiVCBnK30sPQvLV7jFyKKV+1lTJYM2CoGzLlx937T
	Kp4stx0r7Sf4a1xmFctRWapIql2aALXUQ4a5tZm2mRNV157lGfEOTQrG0aKgMlVqTrQis4tgM=
X-Received: by 2002:a05:6808:894c:b0:467:1504:eb13 with SMTP id 5614622812f47-4789f10d9d7mr12694156b6e.36.1776335461014;
        Thu, 16 Apr 2026 03:31:01 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a36800bsm2510111b6e.5.2026.04.16.03.31.00
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:31:00 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6841e6a5e51so4351182eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 03:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+z0frxeV+HZjhYMF5MGbMDlaDw5IabeY8wMeTGN+Ah2FFgw21BLjWv0UZaF5H6alcoyKJ4Slfu3YWgJg==@lists.infradead.org
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_033102_852014_C586ECA4 
X-CRM114-Status: GOOD (  34.76  )
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

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

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
