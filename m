Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B9C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXQW9ymtxe5qMgvDiInZZnmbovHAq2nBO1hNAZfv6Ps=; b=rIENgQuu9wJMF6
	oQdja0DJXpdFJWycBDrwYAQ7S0dEwHDUQVeWqbtSkXVzVbGE6mhQnUBVVn1GnV7ZW2BjbrceisVVd
	2Qk70+TypXrmTJqheYAmSRKrfdZFJCKtjokR+foHInFIl9/Q9BLevOAwZBV7xf5S3ffvY/cGgAl3X
	Us4I3wTBlXs1s1TvJ/gThzl8Ysgvoe22nHLM0sOZqX2GXwQVBV5xi9EjRQ5RgaNfm4f9SChfyK5XC
	htbXsWv1MwZXhNkHxX3kemYq1A3AF2edCPbaf9pVLTAkkLCGD8Od2ju1mk5GPj7WASo5XHWbUttHe
	9T+JG1Ec46cUmxGXWJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPHL-0000000DphD-06No;
	Thu, 04 Jul 2024 16:25:51 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPHH-0000000Dpfy-2hJ8
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 16:25:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 076E52000A;
	Thu,  4 Jul 2024 16:25:41 +0000 (UTC)
Message-ID: <4008aeca-352f-489e-ba07-7a11f5ab7ccb@ghiti.fr>
Date: Thu, 4 Jul 2024 18:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
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
 <20240626130347.520750-2-alexghiti@rivosinc.com> <Zn1Hwpcamaz1YaEM@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zn1Hwpcamaz1YaEM@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_092547_847483_9B8E37A0 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Andrea,

On 27/06/2024 13:06, Andrea Parri wrote:
>> -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
>> +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
>>   ({									\
>> +	__label__ zacas, end;						\
>>   	register unsigned int __rc;					\
>>   									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
>> +		asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,		\
>> +				     RISCV_ISA_EXT_ZACAS, 1)		\
>> +			 : : : : zacas);				\
>> +	}								\
>> +									\
>>   	__asm__ __volatile__ (						\
>>   		prepend							\
>>   		"0:	lr" lr_sfx " %0, %2\n"				\
>>   		"	bne  %0, %z3, 1f\n"				\
>> -		"	sc" sc_sfx " %1, %z4, %2\n"			\
>> +		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
>>   		"	bnez %1, 0b\n"					\
>>   		append							\
>>   		"1:\n"							\
>>   		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
>>   		: "rJ" (co o), "rJ" (n)					\
>>   		: "memory");						\
>> +	goto end;							\
>> +									\
>> +zacas:									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
>> +		__asm__ __volatile__ (					\
>> +			prepend						\
>> +			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
>> +			append						\
>> +			: "+&r" (r), "+A" (*(p))			\
>> +			: "rJ" (n)					\
>> +			: "memory");					\
>> +	}								\
> Is this second IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check actually needed?
> (just wondering - no real objection)


To me yes, otherwise a toolchain without zacas support would fail to 
assemble the amocas instruction.


>
>
>> +end:;									\
> Why the semicolon?


That fixes a clang warning reported by Nathan here: 
https://lore.kernel.org/linux-riscv/20240528193110.GA2196855@thelio-3990X/


>
>
>>   })
>>   
>>   #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
>> @@ -156,7 +177,7 @@
>>   	__typeof__(ptr) __ptr = (ptr);					\
>>   	__typeof__(*(__ptr)) __old = (old);				\
>>   	__typeof__(*(__ptr)) __new = (new);				\
>> -	__typeof__(*(__ptr)) __ret;					\
>> +	__typeof__(*(__ptr)) __ret = (old);				\
> This is because the compiler doesn't realize __ret is actually
> initialized, right?  IAC, seems a bit unexpected to initialize
> with (old) (which indicates SUCCESS of the CMPXCHG operation);
> how about using (new) for the initialization of __ret instead?
> would (new) still work for you?


But amocas rd register must contain the expected old value in order to 
actually work right?


>
>    Andrea
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
