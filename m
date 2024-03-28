Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E97C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gzl7TKY089gusFtr3VQacrEBiFY8b9rGAsv/Fz1+s6M=; b=q2YCZVp15A/bfE
	CJH1QH5ub/p3CxhYQfFNsO4ASc8/+Lo1pGOtelSP2QERCVYsjr/EzFJzeOWmkUtPGRFTtSLAwcSLN
	y6BgqHJrcjvsorZndPnGhtbjHV1LueRAlpvHTO/5oxk4LG5d5E8Dm7eHIhYzbMjCmMEKa2FGbogl7
	okhFk2rmteOJXT3Ri7koYUon4VZmOzvZOlL6zE7NRPHahUxEIFeh7emfbc54n7LBzLmqQNRvQLLOc
	HCqSR8oTnWyygu6H11o5T0l4wcLbaQLH3CgrG+rl1mn30RRcSZ6JOBHLj0XGslRdaQuJ/gM/ES9Rq
	Wocc0W6M8sgxwrhB/T3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmwP-0000000DYO5-47HP;
	Thu, 28 Mar 2024 10:25:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmwM-0000000DYN8-0zA7
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 10:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 220AF610A4;
	Thu, 28 Mar 2024 10:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B64C433C7;
	Thu, 28 Mar 2024 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711621496;
	bh=1cx1Xifn9yhAxfZ5u2l/0D09nOJTgLrcayVsJ8qGHPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQK7GBDe1wsZlOAAMHiYgXEi6nC6ZSDIE6GsMksCXpsOEpueKiDPu5ma+SruGSoG4
	 KNMXCq9vhjZxFpBvLiUb5jo4C/VoUsNzUxxG/WyH2EueJBJCfhm4iStVss2jpxgxQm
	 1JKVnc+QMLCG9HnxTccidaDLw6C8XpFTf9hx8aKXCMyAPbI2kmybqdd5xsbZnzKmHf
	 Vs+nQrtEbfk4sUxsTJ8IfmF0AGLdmxDhUEgVhK2NQ2NL004wgjOAbyf61BHvtyfd2p
	 OLHoBf5AvQ29YSeymdVlGwpxcJKBIS1xdg/kkGsmatLvyja00DlrNZnIV0PupaMFIl
	 9PhTfVXgLKj7A==
Date: Thu, 28 Mar 2024 18:11:32 +0800
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
Message-ID: <ZgVCVKu5YaBDUULB@xhacker>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-3-jszhang@kernel.org>
 <b063df9b-90b6-4f06-8be5-5a8c267e6c8d@sifive.com>
 <ZgL31BFWvaLwYQrN@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZgL31BFWvaLwYQrN@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_032458_505727_B50F5C84 
X-CRM114-Status: GOOD (  31.19  )
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

On Wed, Mar 27, 2024 at 12:29:13AM +0800, Jisheng Zhang wrote:
> On Mon, Mar 25, 2024 at 09:39:26PM -0500, Samuel Holland wrote:
> > Hi Jisheng,
> > 
> > On 2024-03-25 11:40 AM, Jisheng Zhang wrote:
> > > Per riscv privileged spec, "The time CSR is a read-only shadow of the
> > > memory-mapped mtime register", "On RV32I the timeh CSR is a read-only
> > > shadow of the upper 32 bits of the memory-mapped mtime register, while
> > > time shadows only the lower 32 bits of mtime." Since get_cycles() only
> > > reads the timer, it's fine to use CSR_TIME to implement get_cycles().
> > 
> > Unfortunately there are various implementations (e.g. FU740/Unmatched, probably
> > K210 which this code was originally used for) which do not implement the time
> > CSR, relying on M-mode software to emulate the CSR so S-mode software doesn't
> > notice. So this code is needed to support those platforms when running Linux in
> > M-mode.
> 
> OOPS, I knew this for the first time there are such implementations
> which doesn't implement the TIME CSR :(
> 
> > 
> > Maybe there should be an option to assume the time CSR is/is not implemented,
> > like there is for misaligned access?
> 
> Yep, this seems the only solution. Then which should be the default
> choice? I.E
> 
> Assume all NOMMU goes through TIME CSR, and provide an option for
> platform lacking of TIME CSR. This prefers TIME CSR.

Hi all,

v2 will prefer TIME CSR.

Thanks

> 
> VS.
> 
> By default, MTIME is used, and provide one Kconfig option for TIME CSR
> usage. This prefers MTIME
> 
> which choice is better? Any suggestion?
> 
> Thanks in advance
> 
> > 
> > Regards,
> > Samuel
> > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/timex.h | 40 ----------------------------------
> > >  1 file changed, 40 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> > > index a06697846e69..a3fb85d505d4 100644
> > > --- a/arch/riscv/include/asm/timex.h
> > > +++ b/arch/riscv/include/asm/timex.h
> > > @@ -10,44 +10,6 @@
> > >  
> > >  typedef unsigned long cycles_t;
> > >  
> > > -#ifdef CONFIG_RISCV_M_MODE
> > > -
> > > -#include <asm/clint.h>
> > > -
> > > -#ifdef CONFIG_64BIT
> > > -static inline cycles_t get_cycles(void)
> > > -{
> > > -	return readq_relaxed(clint_time_val);
> > > -}
> > > -#else /* !CONFIG_64BIT */
> > > -static inline u32 get_cycles(void)
> > > -{
> > > -	return readl_relaxed(((u32 *)clint_time_val));
> > > -}
> > > -#define get_cycles get_cycles
> > > -
> > > -static inline u32 get_cycles_hi(void)
> > > -{
> > > -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > -}
> > > -#define get_cycles_hi get_cycles_hi
> > > -#endif /* CONFIG_64BIT */
> > > -
> > > -/*
> > > - * Much like MIPS, we may not have a viable counter to use at an early point
> > > - * in the boot process. Unfortunately we don't have a fallback, so instead
> > > - * we just return 0.
> > > - */
> > > -static inline unsigned long random_get_entropy(void)
> > > -{
> > > -	if (unlikely(clint_time_val == NULL))
> > > -		return random_get_entropy_fallback();
> > > -	return get_cycles();
> > > -}
> > > -#define random_get_entropy()	random_get_entropy()
> > > -
> > > -#else /* CONFIG_RISCV_M_MODE */
> > > -
> > >  static inline cycles_t get_cycles(void)
> > >  {
> > >  	return csr_read(CSR_TIME);
> > > @@ -60,8 +22,6 @@ static inline u32 get_cycles_hi(void)
> > >  }
> > >  #define get_cycles_hi get_cycles_hi
> > >  
> > > -#endif /* !CONFIG_RISCV_M_MODE */
> > > -
> > >  #ifdef CONFIG_64BIT
> > >  static inline u64 get_cycles64(void)
> > >  {
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
