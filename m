Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F36C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmrnBsIIMA7/RRdI3hWtBUwayWulZ1LBErRSiqLBGN4=; b=E8i/tlLHU+/CFq
	HkFt7W+s11kC3Zmx//HHTp56m53FSV4krFrFzc0Ql5v3RJAn1XXm8soJxhtr4SgdUu+wbaG7KqviG
	ftIpqF4ZJJ47B1sbBZunV78SlsS3Wkm74nsgTeB6o5Bp8M7l3lQCBxENpF9aWjLGm9Bh6mJgapH1w
	MPX6xuP2eaqxBnUHNybMC2ygMbnyicl4BzwuF63PqIkGRN7ZaNvbyCKc5laOgJBkYM3u+sYF7PoN1
	HGx71cDii3ACg8+ZvHBo2U/tvK6OX5ssL9rHdjW39B/04vi4Iw4GuP/EjGho3WJEfYSoo95WdSRj7
	tqKVQH7QR2Z2dStR8msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsdx-005hKB-Vw; Tue, 19 Apr 2022 18:32:06 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsP4-005Zw4-GZ; Tue, 19 Apr 2022 18:16:45 +0000
Received: from zn.tnic (p200300ea971b5839329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:5839:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2F71F1EC056A;
 Tue, 19 Apr 2022 20:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1650392195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=UoJkiPpVHwxIF95pounRIe0Bw7VF4LrYgBjTdnaLh4M=;
 b=TSOc8IYhoBaLvKhqpez3H0jtLDK8Eseo4q06zwIlkbjmkVhCwgTpQznSaGHr4tJI5mPOVm
 DtWKis1fu5W+gNxL/sbpwYLcLQW53nl+zraOpDLEzLeassVwhpGIPTCrFfe75/3S+78kjs
 hPtr3FvTE+KH1mPoULDw9muY288aKXQ=
Date: Tue, 19 Apr 2022 20:16:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 07/11] x86: use fallback for random_get_entropy()
 instead of zero
Message-ID: <Yl78gLLcSb3EHv0B@zn.tnic>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-8-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419111650.1582274-8-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111642_728189_08756442 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, Apr 19, 2022 at 01:16:46PM +0200, Jason A. Donenfeld wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
> 
> If CONFIG_X86_TSC=n, then it's possible that we're running on a 486 with
> no RDTSC, so we only need the fallback code for that case.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: x86@kernel.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/x86/include/asm/timex.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/include/asm/timex.h b/arch/x86/include/asm/timex.h
> index a4a8b1b16c0c..fac180359693 100644
> --- a/arch/x86/include/asm/timex.h
> +++ b/arch/x86/include/asm/timex.h
> @@ -5,6 +5,16 @@
>  #include <asm/processor.h>
>  #include <asm/tsc.h>
>  
> +static inline unsigned long random_get_entropy(void)
> +{
> +#ifndef CONFIG_X86_TSC
> +	if (!boot_cpu_has(X86_FEATURE_TSC))

cpu_feature_enabled() pls.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
