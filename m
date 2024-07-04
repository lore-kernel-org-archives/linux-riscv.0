Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6880BC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vK+WG/3QO3uUdYXkkEbHeBTbJUE3jDHBesj2qpGtcqE=; b=VQjEuoUHmDnwM5
	/GdkpPJAMfZcFTW5M62MD08H0P1qMYzOH28oburF/PRwmzqjIl/pRHsr90vq2vNKBZIpEUugUshE4
	9MPrDhV8eGy29yV1MEfamDmQJn85VBwFTPWx5krtT6Ftnu4G0Q8K6CZPRCuB30uw2c1IERkeVxVXY
	JzWQXvbZLo9/KccTTVd8/6zsKHIyuX7vAqggeX+yR4JubG4V2D0fmQzr4Jq2KipBeeJRPDUdKKgBT
	unOPkqE//8XBlqhI4oWbw4cepACzL2UtkfkpFQqOYY6YkrqdJiD0oYQSFeiBXjSWloXiZSqIDRk7G
	tkp40z4i4vm0ZtxI36dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQFs-0000000E0dl-1wwW;
	Thu, 04 Jul 2024 17:28:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQDU-0000000DzTd-2vws
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:26:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17AB3240004;
	Thu,  4 Jul 2024 17:25:47 +0000 (UTC)
Message-ID: <b221b813-51dc-4d34-be27-7dacb8866560@ghiti.fr>
Date: Thu, 4 Jul 2024 19:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] riscv: Implement xchg8/16() using Zabha
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
 <20240626130347.520750-7-alexghiti@rivosinc.com> <Zn1tC1G6eiyIW/yJ@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zn1tC1G6eiyIW/yJ@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_102557_158723_320FC3B9 
X-CRM114-Status: GOOD (  11.15  )
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


On 27/06/2024 15:45, Andrea Parri wrote:
>> -#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
>> +#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
>> +			   swap_append, r, p, n)			\
>>   ({									\
>> +	__label__ zabha, end;						\
>> +									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>> +		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
>> +				     RISCV_ISA_EXT_ZABHA, 1)		\
>> +			 : : : : zabha);				\
>> +	}								\
>> +									\
>>   	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>>   	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>>   	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
>> @@ -28,12 +37,25 @@
>>   	       "	or   %1, %1, %z3\n"				\
>>   	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
>>   	       "	bnez %1, 0b\n"					\
>> -	       append							\
>> +	       sc_append							\
>>   	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
>>   	       : "rJ" (__newx), "rJ" (~__mask)				\
>>   	       : "memory");						\
>>   									\
>>   	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>> +	goto end;							\
>> +									\
>> +zabha:									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>> +		__asm__ __volatile__ (					\
>> +			prepend						\
>> +			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
>> +			swap_append						\
>> +			: "=&r" (r), "+A" (*(p))			\
>> +			: "rJ" (n)					\
>> +			: "memory");					\
>> +	}								\
>> +end:;									\
>>   })
> As for patch #1: why the semicolon? and should the second IS_ENABLED()
> be kept?
>
>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index e17d0078a651..f71ddd2ca163 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -81,6 +81,7 @@
>>   #define RISCV_ISA_EXT_ZTSO		72
>>   #define RISCV_ISA_EXT_ZACAS		73
>>   #define RISCV_ISA_EXT_XANDESPMU		74
>> +#define RISCV_ISA_EXT_ZABHA		75
>>   
>>   #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>   
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 5ef48cb20ee1..c125d82c894b 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>   	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>   	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>   	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>> +	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>>   	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>>   	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>>   	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> To be squashed into patch #3?


Yep, done, thanks.


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
