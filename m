Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8640C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEZtoi7MWeGEf+0cTeYURZbboFq36TOwyT1l3mCo6hE=; b=LrbSA4bzkwrnsF
	NIlkdB6jb32zxuSzzEZeYbdDjkhwogam3VEehOD3m4Mx89mH1tJkP96YZngr4hYUw+IHSWSi6hvz6
	o2Z+Spg4wPdSkPs1kIvgZxU7SshD75hDX1mGqGP8hGkZ8ImG+pAxn3SQAjQHQNGZGVRlFg0Ug4Xpj
	scvTv3ovaozn+hRfkYZB9F9pivebRmVOld/7Us5dYv5FXbFt3aTdrUDNvsa67XggrEPZ0HwJNQumh
	Q+ODfwdQTvHDfGLuH7xoBZMVqxGZTHexV2QPlmVScArS9yUnmPgqlcgSghnTBAkFjsaNfYyPWLWTn
	GxEiHY0ugLIvNnpii2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevlW-004t3T-V1; Thu, 14 Apr 2022 09:27:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevlG-004sxV-T6; Thu, 14 Apr 2022 09:27:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8293D61CAB;
 Thu, 14 Apr 2022 09:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F941C385A1;
 Thu, 14 Apr 2022 09:27:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iCKw8U+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649928448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jitaCCQ2e/PpJGSBhLHWsevtZEgEekS1b3Wk73klyKA=;
 b=iCKw8U+BX0unZDHdCqu1WEQPpDnLVael4IDVYgWvfW7w0XcoPFz96Q+X7Oh/HXcBDfoQgf
 relkkKJiqLUs0hWWbJBeLDEdKmFO5iYlsrmp12SxDsveaByJUqA4gI9QfV6k/NrhryczGl
 YX1t4UDjk8/egPtL7ZCNgWMOfE4aDFg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff3c9dc5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 14 Apr 2022 09:27:27 +0000 (UTC)
Date: Thu, 14 Apr 2022 11:27:22 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
Message-ID: <YlfoeGRM6w2O+eXA@zx2c4.com>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_022735_265604_85AF45B1 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Maciej,

On Thu, Apr 14, 2022 at 02:16:18AM +0100, Maciej W. Rozycki wrote:
>  Yes, for the relevant CPUs the range is 63-8 << 8 for R3k machines and 
> 47-0 (the lower bound can be higher if wired entries are used, which I 
> think we occasionally do) for R4k machines with a buggy CP0 counter.  So 
> there are either 56 or up to 48 distinct CP0 Random register values.

Ahh interesting, so it varies a bit, but it remains rather small.

>  It depends on the exact system.  Some have a 32-bit high-resolution 
> counter in the chipset (arch/mips/kernel/csrc-ioasic.c) giving like 25MHz 
> resolution, some have nothing but jiffies.

Alright, so there _are_ machines with no c0 cycles but with a good
clock. Yet, 25MHz is still less than the cpu cycle, so this c0 random
ORing trick remains useful perhaps.

>  It seems like a reasonable idea to me, but the details would have to be 
> sorted out, because where a chipset high-resolution counter is available 
> we want to factor it in, and otherwise we need to extract the right bits 
> from the CP0 Random register, either 13:8 for the R3k or 5:0 for the R4k.

One thing we could do here that would seemingly cover all the cases
without losing _that_ much would be:

    return (random_get_entropy_fallback() << 13) | ((1<<13) - read_c0_random());

Or in case the 13 turns out to be wrong on some hardware, we could
mitigate the effect with:

    return (random_get_entropy_fallback() << 13) ^ ((1<<13) - read_c0_random());

As mentioned in the 1/xx patch of this series,
random_get_entropy_fallback() should call the highest resolution thing.
We then shave off the least-changing bits and stuff in the
faster-changing bits from read_c0_random(). Then, in order to keep it
counting up instead of down, we do the subtraction there.

What do you think of this plan?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
