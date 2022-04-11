Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C4AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rf8JLGedHYDu/VJcZEJJny394eN2WDwahCVIYaSWINg=; b=DNSPMpqJdohMre
	om5OP9GrhzVwqjp0UWp1TdpVbau0E+/WJIgBvqwtWwZhhRnm/edH1TH6OI9FO4U/qV5pptmn331IQ
	fMvhAHpl/YT2lE3+nGgU/zyzO8BPYkiP8CfjEG0RtJWK80IcDbdu8zCAb3lRPw75Ff2yBnZWAuLWd
	cmRMR04+SO+7WR4+HL3OMt0IEtgm4B/GiCEV1vUcCsuMJ8UXknnVEmV0rcz1Oe/LBzA5mFix0Mvue
	p5CxjG8jBUUPmtpE82RbfjUmSKv+AlJOnexrilHYwAyj4DF/3tq9OIUpfdQMrYP5Z0GtbSiz6BfNc
	ZM/zttzmThP5XOS9IgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne2D4-00AdUe-JE; Mon, 11 Apr 2022 22:08:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne2Cu-00AdTP-0T; Mon, 11 Apr 2022 22:08:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90FB86174F;
 Mon, 11 Apr 2022 22:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7F7C385A4;
 Mon, 11 Apr 2022 22:08:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="at5bQW50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649714901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSudnh1FVwn/cRuaWERLZCgg6VCPqB/kIypq5KjigTQ=;
 b=at5bQW50PWPyuLMBXtNm2j6CzvHzZUtsTgTOkf/FKao2vKXaGVGieoWedIf2TemwN59thP
 wmfLih4rTTlC5dLuNkdAWrqK6D8/0XkBBVk/SUW5rQi0UPdFb+aHm+m9vOQ3/JjhHhTQd/
 0QkLrPwRsTKqNLEETOF5+sl7Rmx/z9c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f845bd9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 11 Apr 2022 22:08:21 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso12261504otj.0; 
 Mon, 11 Apr 2022 15:08:21 -0700 (PDT)
X-Gm-Message-State: AOAM531XS70LID6M/YvT5xE/vq9bqu06DbqzUkNZmrrtAnDgWssuVAd2
 yFhhSUwPJAK393Ml6n4fcnqRFQ7XPmn8N4aQS78=
X-Google-Smtp-Source: ABdhPJyrbHcZ7X1J23rQnANqA3RR06u0ZM3R7CT8etsKwGDR+r4LAk7JuXL3JmvpUSxPvBr0OEr8z3kykwSI+XeJazE=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr24066153ybq.235.1649714889427; Mon, 11
 Apr 2022 15:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220410214951.55294-1-Jason@zx2c4.com>
 <20220410214951.55294-4-Jason@zx2c4.com> <87sfqkf2y1.ffs@tglx>
In-Reply-To: <87sfqkf2y1.ffs@tglx>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Apr 2022 00:07:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9qU7x3=KsjfH0qDW=isdcGxTweHbssvshYxkV5iHpamGw@mail.gmail.com>
Message-ID: <CAHmME9qU7x3=KsjfH0qDW=isdcGxTweHbssvshYxkV5iHpamGw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] m68k: use ktime_read_raw_clock() for
 random_get_entropy() instead of zero
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
X-CRM114-CacheID: sfid-20220411_150824_168611_98AAC64A 
X-CRM114-Status: GOOD (  23.87  )
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

On Mon, Apr 11, 2022 at 10:18 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> > diff --git a/arch/m68k/include/asm/timex.h b/arch/m68k/include/asm/timex.h
> > index 6a21d9358280..5351b10e1b18 100644
> > --- a/arch/m68k/include/asm/timex.h
> > +++ b/arch/m68k/include/asm/timex.h
> > @@ -35,7 +35,7 @@ static inline unsigned long random_get_entropy(void)
> >  {
> >       if (mach_random_get_entropy)
> >               return mach_random_get_entropy();
> > -     return 0;
> > +     return ktime_read_raw_clock();
>
> I'd rather do something like this in a common header:
>
> unsigned long random_get_entropy_fallback(void);
>
> and use random_get_entropy_fallback() in the architecture specific
> files.
>
> That way you can encapsulate the fallback implementation in the random
> code and if it turns out that ktime_read_raw_clock() is a stupid idea or
> someone has a better idea then you have to change exactly one place and
> not patch the whole tree again.

Absolutely. That's a good idea. I'll do that for v3.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
