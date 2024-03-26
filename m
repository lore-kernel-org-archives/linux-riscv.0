Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FC3C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQolVMEKmFxhCezzFjQRwcmTOcpzlNrW3qyBoL/7yno=; b=Cprp7e7c/s7vCG
	YJ6MUorL9cAtICzsDpTNvNJ6co/uPGyURmV3Vf6ptc5LVrD2n2Yz55Iy8h03+v79ebbhExUc1J4ok
	MN4gsMfkb5X87uzA4vhbW91VGB80ynb28DBNDj/JRPogTgy/cw8nVH9IA6b/kVkrYmLlqvAXyY9tD
	bQOMAFEgzGb5hREVtoBmdN4lGL1L26v6SGmfFMM7lpwFHGWFh7RINdmYkzptlf30jZBuj7QlXIFat
	zIWYmx/HQuWQeDFbN4PZMyM71G6cwzw8XerTusHd826hwhQmd9K89ZgNqR7SDTC0FjqTPcCVDX9+h
	SC3uqkMPmicNt4UWT3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9sl-00000005WeW-3A5N;
	Tue, 26 Mar 2024 16:42:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9sc-00000005Wah-1boq
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24D64CE229F;
	Tue, 26 Mar 2024 16:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DEFC433C7;
	Tue, 26 Mar 2024 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711471345;
	bh=lMhVc2v7bRz8k8LdU4TXbYBFsE7OwpYvUfGmmJADg0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUgvsFercPZRojON0Wjsk9l8PnkwtZsfWQlIKS0uzTzIU8hz/uN1R63K895yLAx9U
	 PYFQBcCPS7dIZ3tLuFSCPgIEPBpqVFRfKbo5b1/TlPjnbly+XfT30dzn4g+vfVLfBo
	 2+EIUYJtEdL7wBPfsOeTvLiPHf0rhQx/lLKly6WBGWJ683Y6R5z0+C6Pi1ZA138gkQ
	 vSICCbX22K/35I09L8hhmzS5uxBSJk4o7aIQdkxZ2FXqpH1MDqcA7s/BXsD+VfVVxU
	 KAzcclVJR+ddKYpiq5uTViHU90bq9mnR9xj0TivnjmxBh9iLwrzRLnJFu4Wsgf6ZRv
	 KVIDbV3oJEkXA==
Date: Wed, 27 Mar 2024 00:29:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: nommu: use CSR_TIME* for get_cycles*
 implementation
Message-ID: <ZgL31BFWvaLwYQrN@xhacker>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-3-jszhang@kernel.org>
 <b063df9b-90b6-4f06-8be5-5a8c267e6c8d@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b063df9b-90b6-4f06-8be5-5a8c267e6c8d@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_094231_942965_92B68144 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, Mar 25, 2024 at 09:39:26PM -0500, Samuel Holland wrote:
> Hi Jisheng,
> 
> On 2024-03-25 11:40 AM, Jisheng Zhang wrote:
> > Per riscv privileged spec, "The time CSR is a read-only shadow of the
> > memory-mapped mtime register", "On RV32I the timeh CSR is a read-only
> > shadow of the upper 32 bits of the memory-mapped mtime register, while
> > time shadows only the lower 32 bits of mtime." Since get_cycles() only
> > reads the timer, it's fine to use CSR_TIME to implement get_cycles().
> 
> Unfortunately there are various implementations (e.g. FU740/Unmatched, probably
> K210 which this code was originally used for) which do not implement the time
> CSR, relying on M-mode software to emulate the CSR so S-mode software doesn't
> notice. So this code is needed to support those platforms when running Linux in
> M-mode.

OOPS, I knew this for the first time there are such implementations
which doesn't implement the TIME CSR :(

> 
> Maybe there should be an option to assume the time CSR is/is not implemented,
> like there is for misaligned access?

Yep, this seems the only solution. Then which should be the default
choice? I.E

Assume all NOMMU goes through TIME CSR, and provide an option for
platform lacking of TIME CSR. This prefers TIME CSR.

VS.

By default, MTIME is used, and provide one Kconfig option for TIME CSR
usage. This prefers MTIME

which choice is better? Any suggestion?

Thanks in advance

> 
> Regards,
> Samuel
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/timex.h | 40 ----------------------------------
> >  1 file changed, 40 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> > index a06697846e69..a3fb85d505d4 100644
> > --- a/arch/riscv/include/asm/timex.h
> > +++ b/arch/riscv/include/asm/timex.h
> > @@ -10,44 +10,6 @@
> >  
> >  typedef unsigned long cycles_t;
> >  
> > -#ifdef CONFIG_RISCV_M_MODE
> > -
> > -#include <asm/clint.h>
> > -
> > -#ifdef CONFIG_64BIT
> > -static inline cycles_t get_cycles(void)
> > -{
> > -	return readq_relaxed(clint_time_val);
> > -}
> > -#else /* !CONFIG_64BIT */
> > -static inline u32 get_cycles(void)
> > -{
> > -	return readl_relaxed(((u32 *)clint_time_val));
> > -}
> > -#define get_cycles get_cycles
> > -
> > -static inline u32 get_cycles_hi(void)
> > -{
> > -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> > -}
> > -#define get_cycles_hi get_cycles_hi
> > -#endif /* CONFIG_64BIT */
> > -
> > -/*
> > - * Much like MIPS, we may not have a viable counter to use at an early point
> > - * in the boot process. Unfortunately we don't have a fallback, so instead
> > - * we just return 0.
> > - */
> > -static inline unsigned long random_get_entropy(void)
> > -{
> > -	if (unlikely(clint_time_val == NULL))
> > -		return random_get_entropy_fallback();
> > -	return get_cycles();
> > -}
> > -#define random_get_entropy()	random_get_entropy()
> > -
> > -#else /* CONFIG_RISCV_M_MODE */
> > -
> >  static inline cycles_t get_cycles(void)
> >  {
> >  	return csr_read(CSR_TIME);
> > @@ -60,8 +22,6 @@ static inline u32 get_cycles_hi(void)
> >  }
> >  #define get_cycles_hi get_cycles_hi
> >  
> > -#endif /* !CONFIG_RISCV_M_MODE */
> > -
> >  #ifdef CONFIG_64BIT
> >  static inline u64 get_cycles64(void)
> >  {
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
