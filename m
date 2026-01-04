Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71DC2A070
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 23:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/JU0eHWGfdSBII18hInsRLko08ek3RfCBfcAyPxa1A=; b=RAyHez+EStYh7M
	Nt5Kc5pR8XdT5nMSfYsXJN8fimIFXgSxg7lLl9z7i2nx0/SytUSi5tI7CufoLt6EecgA2iQUMRXhx
	KXLcHYcAkLVPaodg/Ot1C8R6R+wgVgtJJxJ3nK+q5uodTpYnSsO1A+eEX4j3HbFad+WDx7xm+Q1+K
	ve5vIOWB2IE+ltwluayUrluZ7u7z8a2NqevilF9/ivXGJymovIKA0Rf2sscH65ur7GyTghP+PKzJD
	+JrpjzZ/ZkxFawozYJSWJPhdsQfAbThm6MjVPMu2FgCBQSUDUhauvP5NEkv1qG/NsMBiBA2zV+LpE
	nw6GVcUhpQkVyGjnK0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcX6Y-0000000AXIq-2Zzb;
	Sun, 04 Jan 2026 23:01:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcX6V-0000000AXHi-1In9
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 23:01:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43246af170aso692440f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567700; x=1768172500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=hTSV515b18AO70GXYckibs+eV1Yf40cmefJ3AECPmzgJXY0x69zumpmOx780Wn1yDB
         NBDc9G/W6wB6GHURfQaQxJwlDfzjB3hUnmUo2o5EikOfsXuZqTT2VUU7ZPqkaUfEY0hQ
         EoXY61CoiQYuqoGHt4+8EyYEEDRb7y2a+Ejd3Cdnf8LtAvZk9/XySyjY9wipOiqTXvow
         S7xpehxZG26PEcAXRbgoIdOnuAa6IElqXR+Nga6FJwDZPi6sUqlqr9N8Q64RarGyErjQ
         XuHz0Y3r+wk2UXYuazNXLWehBUkJ2bLaDOzOtKU0VEwuiRF2vMgYR5EV9X7cNsYgQd5G
         uO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567700; x=1768172500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=Nmf3gu3xfbOZe0T1YT8PFfeiaRxqWmkCiPveqYI/FF4+7eOTj0bRYmRQNUXzKjmDc2
         WFBAkR7qPlOJtcCclelIY5wzVCQkmkmrzYVJVp3aeheRlHY4XXMjlhZ0eBOGd4te9sn8
         S3modgXfsxPgHIEyO+g2kyVIu07iTJ38QgwwM2c+b39Q0kdBrv75I909LnIk1Ed+Tf3e
         8JrCeyW03FUXz1gIpyOdOm8p7t5guGqCl5f2l3scJ3CTFixtvOtte1rT6Eybmf3OdTYv
         TLrfTFAwiDi6iAnEmh4RdkifQ98Ep1NFwizXk93L4t81j6J98kOXD858kEVSZS4gqeIe
         4cFw==
X-Forwarded-Encrypted: i=1; AJvYcCUGlBl76T2eJNOxUBnDEuSDnWgYztEEacZ8iAepPS2mFTufHY2k2BxBYuAbuPJEKYhawOJFEbH+MMIJHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyanw5dIrdO2QzSnpog8Q3rNniHSlavnVfc2qBOoo/Ps8ixCz0D
	Di7xdKaxIpWQ/jO1O6+n4DsImVMfYU/pc/SpMTSxXM/kObSN0tI0wKSN
X-Gm-Gg: AY/fxX7GCJVaisaMpFpW9nfPLjNuldpzezy0TRMMNRZYpAVnYt08M665mApz+3uPTnN
	ZqupxhFtX21auIudZqnRAf9+BcSd9KaEqJ5kDoI2UujvM1h6wlk58ZwPb/ksMIQkXttffP1dN0s
	cVJSvgIN/SIa1W0/IDWsfqfH5a0GnYcnCrj3nNxU8yC8Y7dO7aXaesUbrtAF8S8LY/ZeeK0AWIB
	oOZUhnxbXGBk8gc0mnrfJijWfKy3Q6XoQ2WBcRbbv7g1PjWydB7pV0Jt1xlnYhLCfpcrzO5XF6m
	5muunKx9wQJbyH/6Jff5gr2sJQOiw1ALsbj1nCpFp/vGZSPXUetwVoErL53Fa4siOPaXYt+nRdQ
	Yn5M+xnWPHQMFHIca+8nB4lz/8slReItrgDxlXi19Izna/2p+7KkxeOrw7aZPiC0xng/EfhogZv
	tFAtVBibZtblmXtSFkpWpGVNmN1JqUfY9PFBLziNhZhwuXAx6pU2lX
X-Google-Smtp-Source: AGHT+IEPxlgtmoJsOcbnrDXHkchjsFc7moeHiVQTpzEoBA2t+H1hGAq+A791EuxHgrzC5U6Ox/NHuQ==
X-Received: by 2002:a05:6000:3111:b0:430:fe6c:b1aa with SMTP id ffacd0b85a97d-432aa434e77mr7977363f8f.26.1767567699992;
        Sun, 04 Jan 2026 15:01:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm99650545f8f.17.2026.01.04.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 15:01:38 -0800 (PST)
Date: Sun, 4 Jan 2026 23:01:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260104230136.7aaf8886@pumpkin>
In-Reply-To: <20260102131156.3265118-4-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_150143_443189_E829E0DB 
X-CRM114-Status: GOOD (  26.09  )
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

On Fri,  2 Jan 2026 13:11:54 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Previously different architectures were using random sources of
> differing strength and cost to decide the random kstack offset. A number
> of architectures (loongarch, powerpc, s390, x86) were using their
> timestamp counter, at whatever the frequency happened to be. Other
> arches (arm64, riscv) were using entropy from the crng via
> get_random_u16().
> 
> There have been concerns that in some cases the timestamp counters may
> be too weak, because they can be easily guessed or influenced by user
> space. And get_random_u16() has been shown to be too costly for the
> level of protection kstack offset randomization provides.
> 
> So let's use a common, architecture-agnostic source of entropy; a
> per-cpu prng, seeded at boot-time from the crng. This has a few
> benefits:
> 
>   - We can remove choose_random_kstack_offset(); That was only there to
>     try to make the timestamp counter value a bit harder to influence
>     from user space.
> 
>   - The architecture code is simplified. All it has to do now is call
>     add_random_kstack_offset() in the syscall path.
> 
>   - The strength of the randomness can be reasoned about independently
>     of the architecture.
> 
>   - Arches previously using get_random_u16() now have much faster
>     syscall paths, see below results.
> 
> There have been some claims that a prng may be less strong than the
> timestamp counter if not regularly reseeded. But the prng has a period
> of about 2^113. So as long as the prng state remains secret, it should
> not be possible to guess. If the prng state can be accessed, we have
> bigger problems.

If you have 128 bits of output from consecutive outputs I think you
can trivially determine the full state using (almost) 'school boy' maths
that could be done on pencil and paper.
(Most of the work only has to be done once.)

The underlying problem is that the TAUSWORTHE() transformation is 'linear'
So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
(This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
This means that each output bit is the 'xor' of some of the input bits.
The four new 'state' values are just xor of the the bits of the old ones.
The final xor of the four states gives a 32bit value with each bit just
an xor of some of the 128 state bits.
Get four consecutive 32 bit values and you can solve the 128 simultaneous
equations (by trivial substitution) and get the initial state.
The solution gives you the 128 128bit constants for:
	u128 state = 0;
	u128 val = 'value returned from 4 calls';
	for (int i = 0; i < 128; i++)
		state |= parity(const128[i] ^ val) << i;
You done need all 32bits, just accumulate 128 bits.  
So if you can get the 5bit stack offset from 26 system calls you know the
value that will be used for all the subsequent calls.

Simply changing the final line to use + not ^ makes the output non-linear
and solving the equations a lot harder.

I might sit down tomorrow and see if I can actually code it...

	David

 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
