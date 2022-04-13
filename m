Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F13C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yU8TCQsiHMg6A+1Fb93ErLWXBCuXpKVI7HYyDxp3tB0=; b=NIUM5xGeQSxBzr
	bfwamunn/2IGq50MvWAPoQ+BomzoXLQxtxuEsAarLg82HqndI2g018Fbb7Re74KJODySznWspDfSq
	5eLCCMUra3e1BqBCOssLX48YZ/JJRxXyOx30DaimxmsO1Ii7X3ysYLgYpsdrdYwqKhaj9WEzQh8xe
	XIdC1U78uS6gOGMu3KXWnGRFx2h0ggfNuOnRGAVatx6HSdvfy+rpu22mswCot537bTFZBfpJghexL
	9zm4AtbYptEsYEfWguIVZVxAWARdOVBLZ0V7OrLnl685aoMRpa+lgvepVP/sApl7LnDj9bOK66Eg6
	6gNF5JZgNSqpcWKOtZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neeAs-001RVu-GJ; Wed, 13 Apr 2022 14:40:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neeAf-001RTn-TT; Wed, 13 Apr 2022 14:40:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69B62B824F9;
 Wed, 13 Apr 2022 14:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207FDC385A3;
 Wed, 13 Apr 2022 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649860835;
 bh=78m64rXl3BqnnR/vfXtui5J5LLZFfkI1NSRN1fS+Ck0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mBloTi80NCaNPxXcwcRvo8wyFdlQMZCqyt+qQA90W9fNmHUAzaiOuprMwuzvpsxMk
 YcLi2wOjr4XpHl6X+XRYZ0WZQqU5k1x62zj+5sVyG0Jlk8evP3rvZpvEzOdJksUFOj
 LY4BUyne6tOFbpV/GUNZBBafSr9j+yiHZVAnXEg7WkroShW/BxW6USkdfv+RLfi5fA
 +rJMsX2moMxKIH3oc7TKuw8PRT1E4rfmo9GPcCFQM+RcNjrFHQenVHrac3luK73yqC
 qeYswip5BzTciW78mineRnxf9WLHZZNQidRz7jCtUe+DkxHv0sNSswpjhqJ5wnolEH
 0sy3bYxeJMutw==
Received: by mail-pg1-f169.google.com with SMTP id q12so1969387pgj.13;
 Wed, 13 Apr 2022 07:40:35 -0700 (PDT)
X-Gm-Message-State: AOAM533jIv9ZUytvxcJVFkj0E0da/+8XB+odOAkrn8pZRGtljpTNFMWO
 fh5dgq9DGIzmoe3ys1/mD0s8LswszpsfolpnSQ==
X-Google-Smtp-Source: ABdhPJwPF0VHE9D8w/oeESIlTTrvwO1gVXfb+xfx+0hNhkJEN+zqgaOI+EWicwhkoM5T8fMAkoGBIRO6Tom03sqTu+o=
X-Received: by 2002:a92:dd86:0:b0:2bc:805c:23c7 with SMTP id
 g6-20020a92dd86000000b002bc805c23c7mr17523118iln.279.1649860824300; Wed, 13
 Apr 2022 07:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-4-Jason@zx2c4.com>
In-Reply-To: <20220413115411.21489-4-Jason@zx2c4.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 13 Apr 2022 09:40:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ86vZKZQO+9_Kva-EbZrRPMbcgDm+UvjJdnR=GL-qHSw@mail.gmail.com>
Message-ID: <CAL_JsqJ86vZKZQO+9_Kva-EbZrRPMbcgDm+UvjJdnR=GL-qHSw@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] riscv: use fallback for random_get_entropy()
 instead of zero
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k@lists.linux-m68k.org, 
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_074038_273112_22EA6FB2 
X-CRM114-Status: GOOD (  24.98  )
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

On Wed, Apr 13, 2022 at 6:56 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/riscv/include/asm/timex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 507cae273bc6..d6a7428f6248 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -41,7 +41,7 @@ static inline u32 get_cycles_hi(void)
>  static inline unsigned long random_get_entropy(void)
>  {
>         if (unlikely(clint_time_val == NULL))

Moving this check to get_cycles() implementation would eliminate the
RiscV implementation of random_get_entropy() if you follow my other
suggestion.

I guess there's some advantage to skipping a NULL check every time for
get_cycles(), but really the register read time will be much slower
than an added check.

> -               return 0;
> +               return random_get_entropy_fallback();
>         return get_cycles();
>  }
>  #define random_get_entropy()   random_get_entropy()

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
