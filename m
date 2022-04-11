Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2E2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RK0kLWsYQw5khUjQvc+kuHxdqsVkZRssGrd/dQyUuM=; b=VPcZQ0skSoipcn
	wpmdsDIk03dQS/YKcQymC3Jl2x3B6l/05QBvppk4NEPo/Nul1qFHnGALkRklxEV9fUCAlAHoMKuDt
	nnUydHk6E15zEBJQFJM2XJyAaSHxOJjWJZw2umTe1NXbCWs8NJhbpy89fEv8Eb38Rjg5PYfXeXC7z
	3LFsBrENYgYhx059XxENJqGeIqWcItgDpRLx+pN0P17jAjymEqia18Y1lL8ZII73wwsWlU0bg5HK2
	dJLv8iwdvSozVWEUTxjLrJXy4mxqtB1SMBOsaZvIdrtoyJJFJ6J9svx4hol8J35anxYMGbqwA3cjJ
	Gk1yXB8QIoKgfP5R5sjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpG1-007V0T-Fr; Mon, 11 Apr 2022 08:18:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpFp-007Uvv-3s; Mon, 11 Apr 2022 08:18:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1649665111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjhhzRNcm78JGgGtLG6mgwaGj8Cww0Tlt26NaB6GyE8=;
 b=bQRUSKc6DEfWq2JW4zBYVX9dk6BAlFAOz8ziZI1nuAr8ThUSn9e4Pp4TH0bz7ykDdAbytZ
 7E1JFmxLLPSA9yL/pLdV+Narb8ojwoUuHfRpcDWF7RSs/XNw8NP/mtP12PhEDKsDgxWdwX
 vj1X7Tk9jubTJlEIAMDexIL70/zM+Ev13+w45xEIm/Pg10UwmbczcL33LQfaYjkFbjCAwR
 nWRv8uLzxf0uwY7wWrnhC9hKJv5hsVxGhFPLc//BILYIvle9sl9xbz+4/B2WaiAREmOlO7
 QMeWCwYxU6fvIGepcveLrvpqjGJJ/UVr5H5Gu5FcUTDSJ2ZLo6XAuABFlQLZ3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1649665111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjhhzRNcm78JGgGtLG6mgwaGj8Cww0Tlt26NaB6GyE8=;
 b=dYt2Xa6X2UETGYKSaI3sFGG38t3wto/bY9ksZnmh+Jh5QgkWcPQfA5MzFrnWyF0a21HHlJ
 MeANaRegf0On2MDw==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, arnd@arndb.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v2 03/11] m68k: use ktime_read_raw_clock() for
 random_get_entropy() instead of zero
In-Reply-To: <20220410214951.55294-4-Jason@zx2c4.com>
References: <20220410214951.55294-1-Jason@zx2c4.com>
 <20220410214951.55294-4-Jason@zx2c4.com>
Date: Mon, 11 Apr 2022 10:18:30 +0200
Message-ID: <87sfqkf2y1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_011833_342042_B42B2C99 
X-CRM114-Status: GOOD (  22.20  )
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

On Sun, Apr 10 2022 at 23:49, Jason A. Donenfeld wrote:

> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling ktime_read_raw_clock() would be preferable,
> because that always needs to return _something_, even falling back to
> jiffies eventually. It's not as though ktime_read_raw_clock() is super
> high precision or guaranteed to be entropic, but basically anything
> that's not zero all the time is better than returning zero all the time.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/m68k/include/asm/timex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/include/asm/timex.h b/arch/m68k/include/asm/timex.h
> index 6a21d9358280..5351b10e1b18 100644
> --- a/arch/m68k/include/asm/timex.h
> +++ b/arch/m68k/include/asm/timex.h
> @@ -35,7 +35,7 @@ static inline unsigned long random_get_entropy(void)
>  {
>  	if (mach_random_get_entropy)
>  		return mach_random_get_entropy();
> -	return 0;
> +	return ktime_read_raw_clock();

I'd rather do something like this in a common header:

unsigned long random_get_entropy_fallback(void);

and use random_get_entropy_fallback() in the architecture specific
files.

That way you can encapsulate the fallback implementation in the random
code and if it turns out that ktime_read_raw_clock() is a stupid idea or
someone has a better idea then you have to change exactly one place and
not patch the whole tree again.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
