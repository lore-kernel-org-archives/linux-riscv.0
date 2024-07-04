Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731FAC3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FXX7m4wfKJDr2B3vZ87cUYdcZoF4JuQBv3NAxbagA8=; b=m9DYr+zjb3Zpey
	90bfRCKL1crv4dUM/eZ8g4e5FJc/2cVJReC2alul6lTmeMez0Iduv2F/kDecDLI7egxVMU/QF3MWe
	IfR8KomjMn2h53Nd62yPxmRkU5ktw9A4jM1SVx5CcsZ2Dt9tCH9PqVYSSVOK2Ku6NpQ3rc3IyMemD
	QsJfIT6LHTmnJGHIBSfhYDLlg2AItXR30ZiCOJDj/xaQbyz2g+YmVWuDNN1KT3g1T3niQ3BglKRoI
	SSD8+n0A18WSJvuKLD6XsnCkP2PLKqHw0pOcm9T4TW5TwtpFriBqxvOPRGEi8JizJgPlKAYpHNGVL
	wEWYi2l6udU3QsaDcz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQFt-0000000E0eb-3dbM;
	Thu, 04 Jul 2024 17:28:25 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQES-0000000DzxM-3bXZ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:26:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF825240003;
	Thu,  4 Jul 2024 17:26:52 +0000 (UTC)
Message-ID: <c6c305a7-37d0-4834-ac65-1ac5d32014d1@ghiti.fr>
Date: Thu, 4 Jul 2024 19:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] riscv: Improve amoswap.X use in xchg()
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
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Andrea Parri <andrea@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-8-alexghiti@rivosinc.com> <Zn1wDAXjBdJu48Oi@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zn1wDAXjBdJu48Oi@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_102657_219850_A766EB11 
X-CRM114-Status: GOOD (  11.87  )
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

On 27/06/2024 15:58, Andrea Parri wrote:
> On Wed, Jun 26, 2024 at 03:03:44PM +0200, Alexandre Ghiti wrote:
>> xchg() uses amoswap.X instructions from Zabha but still uses
>> the LR/SC acquire/release semantics which require barriers.
>>
>> Let's improve that by using proper amoswap acquire/release semantics in
>> order to avoid any of those barriers.
>>
>> Suggested-by: Andrea Parri <andrea@rivosinc.com>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/cmpxchg.h | 35 +++++++++++++-------------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
>> index eb35e2d30a97..0e57d5fbf227 100644
>> --- a/arch/riscv/include/asm/cmpxchg.h
>> +++ b/arch/riscv/include/asm/cmpxchg.h
>> @@ -11,8 +11,8 @@
>>   #include <asm/fence.h>
>>   #include <asm/alternative.h>
>>   
>> -#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
>> -			   swap_append, r, p, n)			\
>> +#define __arch_xchg_masked(sc_sfx, swap_sfx, sc_prepend, sc_append,	\
>> +			   r, p, n)					\
>>   ({									\
>>   	__label__ zabha, end;						\
>>   									\
>> @@ -31,7 +31,7 @@
>>   	ulong __rc;							\
>>   									\
>>   	__asm__ __volatile__ (						\
>> -	       prepend							\
>> +	       sc_prepend							\
>>   	       "0:	lr.w %0, %2\n"					\
>>   	       "	and  %1, %0, %z4\n"				\
>>   	       "	or   %1, %1, %z3\n"				\
>> @@ -48,9 +48,7 @@
>>   zabha:									\
>>   	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>>   		__asm__ __volatile__ (					\
>> -			prepend						\
>>   			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
>> -			swap_append						\
>>   			: "=&r" (r), "+A" (*(p))			\
>>   			: "rJ" (n)					\
>>   			: "memory");					\
>> @@ -58,19 +56,17 @@ zabha:									\
>>   end:;									\
>>   })
>>   
>> -#define __arch_xchg(sfx, prepend, append, r, p, n)			\
>> +#define __arch_xchg(sfx, r, p, n)					\
>>   ({									\
>>   	__asm__ __volatile__ (						\
>> -		prepend							\
>>   		"	amoswap" sfx " %0, %2, %1\n"			\
>> -		append							\
>>   		: "=r" (r), "+A" (*(p))					\
>>   		: "r" (n)						\
>>   		: "memory");						\
>>   })
>>   
>> -#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
>> -		   sc_append, swap_append)				\
>> +#define _arch_xchg(ptr, new, sc_sfx, swap_sfx,				\
>> +		   sc_prepend, sc_append)				\
>>   ({									\
>>   	__typeof__(ptr) __ptr = (ptr);					\
>>   	__typeof__(*(__ptr)) __new = (new);				\
>> @@ -79,21 +75,19 @@ end:;									\
>>   	switch (sizeof(*__ptr)) {					\
>>   	case 1:								\
>>   		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
>> -				   prepend, sc_append, swap_append,	\
>> +				   sc_prepend, sc_append,		\
>>   				   __ret, __ptr, __new);		\
>>   		break;							\
>>   	case 2:								\
>>   		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
>> -				   prepend, sc_append, swap_append,	\
>> +				   sc_prepend, sc_append,		\
>>   				   __ret, __ptr, __new);		\
>>   		break;							\
>>   	case 4:								\
>> -		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
>> -			      __ret, __ptr, __new);			\
>> +		__arch_xchg(".w" swap_sfx,  __ret, __ptr, __new);	\
>>   		break;							\
>>   	case 8:								\
>> -		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
>> -			      __ret, __ptr, __new);			\
>> +		__arch_xchg(".d" swap_sfx,  __ret, __ptr, __new);	\
>>   		break;							\
>>   	default:							\
>>   		BUILD_BUG();						\
>> @@ -102,17 +96,16 @@ end:;									\
>>   })
>>   
>>   #define arch_xchg_relaxed(ptr, x)					\
>> -	_arch_xchg(ptr, x, "", "", "", "", "")
>> +	_arch_xchg(ptr, x, "", "", "", "")
>>   
>>   #define arch_xchg_acquire(ptr, x)					\
>> -	_arch_xchg(ptr, x, "", "", "",					\
>> -		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
>> +	_arch_xchg(ptr, x, "", ".aq", "", RISCV_ACQUIRE_BARRIER)
>>   
>>   #define arch_xchg_release(ptr, x)					\
>> -	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
>> +	_arch_xchg(ptr, x, "", ".rl", RISCV_RELEASE_BARRIER, "")
>>   
>>   #define arch_xchg(ptr, x)						\
>> -	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
>> +	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER)
> I actually see no reason for this patch, please see also my remarks
> /question on patch #4.


You mean that we can't improve the fully-ordered version here?


>
>    Andrea
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
