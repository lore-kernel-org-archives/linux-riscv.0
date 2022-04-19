Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6500CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KzEL/ar9LHcYaNse0CzXIO0Axv+2dRkGPVxi+KiviM=; b=0kRUUehBy0FOJg
	ViyMCM04XR7c58XiWJp9ydulXlAaSmlf1Yn7MXIjNeQnCkrKjDdNnwVdSNJB0rcRZ7QBEqUZFhBYW
	OTSuU79IFGMt8TEDejaSJPn5E+1yFtJLU/WkjYqqK14daKDWMN8I1VzoEMw9Mn0ZWkS0EdL/xTz/5
	afb1mq8eKQn6V3fbQVmsXouo1C4clQqUsDh8sOekWRNgfgOaiqTPC7US7OHDGk0dkmKG2hOUe/Iio
	1fnYCZiQ8NYpo0QSWJJ+7hxY4VDaUQ9HHRLD9F7zZQPgq2UrrnPjiOwdcQ4nP6CVgouuqCRGt1dzA
	x+yFJxdY+1dUCj7YmglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsww-005pS7-9X; Tue, 19 Apr 2022 18:51:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngskl-005kYY-T6; Tue, 19 Apr 2022 18:39:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 322E2615C4;
 Tue, 19 Apr 2022 18:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE45C385A9;
 Tue, 19 Apr 2022 18:39:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GE+vM+I4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650393544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VyT5yFR69WOgQEnV8/wlLftu+VkDei1XdPwIV0Ddyb0=;
 b=GE+vM+I4KVy9+Lao8kKoiOFoVTgTAVST+k2lAzfhIhFe7a6rPu+yqn8oFbfGkVznz/pMr9
 hExF4AXazrYp53Oyjlka12q2XG8I0rd52K9ZUtr2oi7zz0qs0va6x62IWI2blHWOhmM8oe
 7Yh/wEVCT3avI4/0zTZRO3YidHiBhaU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b42a1a02
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Apr 2022 18:39:04 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id b11so6131108uaq.2;
 Tue, 19 Apr 2022 11:39:04 -0700 (PDT)
X-Gm-Message-State: AOAM532ibI1OQ4pljgg/60wU8QFwVs6WFqIpcJsPqUGMgRgixheaDwk8
 2z06EGdiYiGaa92QyRh5s4pu6XYEIn4oXjeY704=
X-Google-Smtp-Source: ABdhPJygDGhFZIcjwzbmxEAjC5M4INHOWHqlOEzmD5UKXJ5M3M4pBOw2NrPU2pCGLpW8o7rnLG0GwAkXiG41Hu3MclU=
X-Received: by 2002:a25:d88c:0:b0:645:570:72d2 with SMTP id
 p134-20020a25d88c000000b00645057072d2mr11051453ybg.373.1650393531955; Tue, 19
 Apr 2022 11:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-8-Jason@zx2c4.com>
 <Yl78gLLcSb3EHv0B@zn.tnic>
In-Reply-To: <Yl78gLLcSb3EHv0B@zn.tnic>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Apr 2022 20:38:41 +0200
X-Gmail-Original-Message-ID: <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
Message-ID: <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] x86: use fallback for random_get_entropy()
 instead of zero
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
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
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_113908_081988_90B890B8 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Borislav,

On Tue, Apr 19, 2022 at 8:16 PM Borislav Petkov <bp@alien8.de> wrote:
> > +static inline unsigned long random_get_entropy(void)
> > +{
> > +#ifndef CONFIG_X86_TSC
> > +     if (!boot_cpu_has(X86_FEATURE_TSC))
>
> cpu_feature_enabled() pls.

This function began as a carbon copy of get_cycles(), which reads:

static inline cycles_t get_cycles(void)
{
#ifndef CONFIG_X86_TSC
       if (!boot_cpu_has(X86_FEATURE_TSC))
               return 0;
#endif

       return rdtsc();
}

As you see, random_get_entropy() is the same function, but with that
zero replaced with the fallback. (Using the fallback in get_cycles()
wouldn't be appropriate.)

So, your options are:
a) We keep this patch as-is, using boot_cpu_has(); or
b) I make an unrelated change inside of this same patch to change
get_cycles() to use cpu_feature_enabled() (in addition to the new
random_get_entropy()).

I think I prefer doing (a), and leaving (b) for another time when you
or another x86 maintainer can do so. But I'll do whichever you say.
Which would you like?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
