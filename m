Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E160C3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ54ODGGdz9HtP2jr9NTYHKlzZ4qdk3hM9RZPBT1uYA=; b=zYVJOFY5j/gIvm
	abo2BC7CytoVBIlV+xs7+vZ0kIhX7n798uju/xA0dMWhVCuuOBxAtCle4tSJ9qLD2GXmTGMeHvaCh
	XDK1DqABTH7QEOcSbY5caLPGmn0uN/EErLuHTF4oNB/MCnf57S93EmYxLm4UXJWvzj2FZ3AHiHCRL
	DAhiAsWTKMAlWAA4sjhNOtGMFBFzeGXO2jjGRHCuCSe48T3jiDkWFFMkDQcsMeJUsHt5UWYuOwD2q
	wV3ad7yWD3l2L2vgho5s0YFvwSrJJALA/Vb5+2Xvd+DQLPW191px4Wtm0WOka5SbC9GR4wB1gvHtL
	gXJTCRS5mcDU8MpAUpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPRm-0000000Dr85-0MRO;
	Thu, 04 Jul 2024 16:36:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPRh-0000000Dr6s-2aRB
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 16:36:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E251A1C0003;
	Thu,  4 Jul 2024 16:36:26 +0000 (UTC)
Message-ID: <1cd452af-58cd-468c-9bb6-90f67711d0b0@ghiti.fr>
Date: Thu, 4 Jul 2024 18:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com> <Zn1StcN3H0r/eHjh@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zn1StcN3H0r/eHjh@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_093633_962309_F84E41C7 
X-CRM114-Status: GOOD (  20.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 27/06/2024 13:53, Andrea Parri wrote:
>> -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
>> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
>>   ({									\
>> +	__label__ no_zacas, zabha, end;					\
>> +									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
>> +				     RISCV_ISA_EXT_ZACAS, 1)		\
>> +			 : : : : no_zacas);				\
>> +		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
>> +				     RISCV_ISA_EXT_ZABHA, 1)		\
>> +			 : : : : zabha);				\
>> +	}								\
>> +									\
>> +no_zacas:;								\
>>   	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>>   	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>>   	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
>> @@ -133,6 +145,19 @@
>>   		: "memory");						\
>>   									\
>>   	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>> +	goto end;							\
>> +									\
>> +zabha:									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>> +		__asm__ __volatile__ (					\
>> +			prepend						\
>> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
>> +			append						\
>> +			: "+&r" (r), "+A" (*(p))			\
>> +			: "rJ" (n)					\
>> +			: "memory");					\
>> +	}								\
>> +end:;									\
>>   })
> I admit that I found this all quite difficult to read; IIUC, this is
> missing an IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check.


I'm not sure we need the zacas check here, since we could use a 
toolchain that supports zabha but not zacas, run this on a zabha/zacas 
platform and it would work.


>    How about adding
> such a check under the zabha: label (replacing/in place of the second
> IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) check) and moving the corresponding
> asm goto statement there, perhaps as follows? (on top of this patch)


If that makes things clearer for you, sure, I can do that.


>
> Also, the patch presents the first occurrence of RISCV_ISA_EXT_ZABHA;
> perhaps worth moving the hwcap/cpufeature changes from patch #6 here?
>
>    Andrea
>
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index b9a3fdcec919..3c913afec150 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -110,15 +110,12 @@
>   	__label__ no_zacas, zabha, end;					\
>   									\
>   	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> -		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> -				     RISCV_ISA_EXT_ZACAS, 1)		\
> -			 : : : : no_zacas);				\
>   		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
>   				     RISCV_ISA_EXT_ZABHA, 1)		\
>   			 : : : : zabha);				\
>   	}								\
>   									\
> -no_zacas:;								\
> +no_zacas:								\
>   	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>   	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>   	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> @@ -148,16 +145,20 @@ no_zacas:;								\
>   	goto end;							\
>   									\
>   zabha:									\
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\


But we need to keep this check, otherwise it would fail to compile on 
toolchains without Zabha support.


> -		__asm__ __volatile__ (					\
> -			prepend						\
> -			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> -			append						\
> -			: "+&r" (r), "+A" (*(p))			\
> -			: "rJ" (n)					\
> -			: "memory");					\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZAZAS)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zacas);				\
>   	}								\
> -end:;									\
> +									\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"	amocas" cas_sfx " %0, %z2, %1\n"		\
> +		append							\
> +		: "+&r" (r), "+A" (*(p))				\
> +		: "rJ" (n)						\
> +		: "memory");						\
> +end:									\
>   })
>   
>   #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
