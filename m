Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D58C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 21:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fQAWMzuHftEGGFX8A58g0YFLJeCCBv1/mTM9w4FaV4=; b=Hw1wsHDz5wx7Yq
	ziJwJZgD0dMUFwGsX4jh513xCcVkBMUUXpUh9OS3JacmcdSrxt3ijXFiGaQ0Y1wBsFyWwvGoHIL8r
	TEvzbPJSsMOcRcMlkjXF92WXhY3g/BvFjwZpcF03gXagVKhFY9eMIUFH7PJCbi3Lw4wQluvjvDlzG
	AvsuQ8zF5xMF5I+TByUt5X78XCm6pH9jwDB9eGLhKD4FDWo+TxyHRgxcEChCEkfQrnH1JFDYk9uUm
	exysTlSdsSowhBjvsbrwFy87jS6fU06bIfwbfe4ymnocrBYDT3GikXqKIYs7H+Ryz7kiHvPpSVcpR
	A605Ufj7fvQsAvDKk6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neNtN-00Fo3s-TM; Tue, 12 Apr 2022 21:17:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neNtC-00Fo2F-NC; Tue, 12 Apr 2022 21:17:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA70E61B74;
 Tue, 12 Apr 2022 21:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5361C385A6;
 Tue, 12 Apr 2022 21:17:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PN66lJ9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649798247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7RYqiP9nhX0rKf7m7FCUHmIMWi5HqXJa2wb5GRUCRN4=;
 b=PN66lJ9Ucajbvf2VVHjWPG1FJUFASZDmOYitMzqJBqTCLQXHhFBshwjiwR+Mg/UydgTKlL
 Jbn7/unSYJoKGR5pvsqrEXiau7+ImngUEYdhw6Zr1FpdNhIofmZljw0weE4T09fWhYikum
 FXFLf6Z984cSQ7hS160SW4xM1RbeJ/8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7459c086
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 12 Apr 2022 21:17:27 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id e71so293740ybf.8;
 Tue, 12 Apr 2022 14:17:26 -0700 (PDT)
X-Gm-Message-State: AOAM531wCA35U/IytrIVpC1sWtaVmRUX4DbQ6rk3yEB04eLsAprNykhA
 D8GB7CSDRY6uAIgNOojP7w0d921Rc43p8Lsx7GA=
X-Google-Smtp-Source: ABdhPJyzoWPsFnF8ik/yAzlm3KPNzdj5Txo6RqIWYvjdGUg1ERYyQK8PArA04S/85l5pbLiU/ZXjCNxyEog+/ToSU0U=
X-Received: by 2002:a81:4a55:0:b0:2ef:3ef1:def7 with SMTP id
 x82-20020a814a55000000b002ef3ef1def7mr1543639ywa.2.1649798234768; Tue, 12 Apr
 2022 14:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220412172754.149498-1-Jason@zx2c4.com>
 <20220412172754.149498-2-Jason@zx2c4.com> <87bkx6f29b.ffs@tglx>
In-Reply-To: <87bkx6f29b.ffs@tglx>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Apr 2022 23:17:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9pVhO24V8V3YdeHfz6q1nmSgqXocUtn=+zu5Wh-OWrSRA@mail.gmail.com>
Message-ID: <CAHmME9pVhO24V8V3YdeHfz6q1nmSgqXocUtn=+zu5Wh-OWrSRA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] timekeeping: add raw clock fallback for
 random_get_entropy()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 "Theodore Ts'o" <tytso@mit.edu>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_141730_857359_E1B1E937 
X-CRM114-Status: GOOD (  15.00  )
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

On Tue, Apr 12, 2022 at 10:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Apr 12 2022 at 19:27, Jason A. Donenfeld wrote:
> > +/**
> > + * random_get_entropy_fallback - Returns the raw clock source value,
> > + * used by random.c for platforms with no valid random_get_entropy().
> > + */
> > +unsigned long random_get_entropy_fallback(void)
> > +{
> > +     return tk_clock_read(&tk_core.timekeeper.tkr_mono);
> > +}
> > +EXPORT_SYMBOL(random_get_entropy_fallback);
>
> EXPORT_SYMBOL_GPL() please.

Okay, will do.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
