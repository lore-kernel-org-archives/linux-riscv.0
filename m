Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB4FC3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePzgJTvsBJOO81CqGoF0qPQrPLqYMuXzimAJULLCNAw=; b=SXQG9wIHGnDBKC
	T92HJ5w7X0tt4bzl84sO7th2UhO7FoAUFgDl4uBBgFBll1XDAcRp0+rzOnypsx4LVNx5Bq0YlDNsK
	woaEVa0t4KzQCYiWRuwjWwDuHRopl60CITwByURkkB4WDsGNcui81oTV6FMayo3M3nQv2G4nOUzvr
	K6OZ7mAyXLHQtIGlnCyqjeesQI1aDOSVatQWFgWgh2ppJE7d7yjAfcP12tW6YM2qThE6m3ZiNR2C7
	KC6WpsbYCovfIpjrH7mw4L4DLn24jbimC0Tih3FZhhwEZFU7CG5G9+x4NQZuf69KAj+yIpOWFpNGH
	Mj+S3lCuIi1wgDFEtqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQan-0000000H0rT-2Djt;
	Thu, 18 Jul 2024 12:50:41 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQaj-0000000H0pb-2xBj
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 12:50:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A1E21C000C;
	Thu, 18 Jul 2024 12:50:29 +0000 (UTC)
Message-ID: <fb03939b-502b-410a-85f5-2785b2bd0676@ghiti.fr>
Date: Thu, 18 Jul 2024 14:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-4-alexghiti@rivosinc.com>
 <20240717-e7104dac172d9f2cbc25d9c6@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240717-e7104dac172d9f2cbc25d9c6@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_055038_038722_C59A8261 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Drew,

On 17/07/2024 17:26, Andrew Jones wrote:
> On Wed, Jul 17, 2024 at 08:19:49AM GMT, Alexandre Ghiti wrote:
>> This adds runtime support for Zabha in cmpxchg8/16() operations.
>>
>> Note that in the absence of Zacas support in the toolchain, CAS
>> instructions from Zabha won't be used.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/Kconfig               | 17 ++++++++++++++++
>>   arch/riscv/Makefile              |  3 +++
>>   arch/riscv/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++++++++--
>>   arch/riscv/include/asm/hwcap.h   |  1 +
>>   arch/riscv/kernel/cpufeature.c   |  1 +
>>   5 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1caaedec88c7..d3b0f92f92da 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
>>   	  preemption. Enabling this config will result in higher memory
>>   	  consumption due to the allocation of per-task's kernel Vector context.
>>   
>> +config TOOLCHAIN_HAS_ZABHA
>> +	bool
>> +	default y
>> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
>> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
>> +	depends on AS_HAS_OPTION_ARCH
>> +
>> +config RISCV_ISA_ZABHA
>> +	bool "Zabha extension support for atomic byte/halfword operations"
>> +	depends on TOOLCHAIN_HAS_ZABHA
>> +	default y
>> +	help
>> +	  Enable the use of the Zabha ISA-extension to implement kernel
>> +	  byte/halfword atomic memory operations when it is detected at boot.
>> +
>> +	  If you don't know what to do here, say Y.
>> +
>>   config TOOLCHAIN_HAS_ZACAS
>>   	bool
>>   	default y
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 9fd13d7a9cc6..78dcaaeebf4e 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -88,6 +88,9 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>>   # Check if the toolchain supports Zacas
>>   riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
>>   
>> +# Check if the toolchain supports Zabha
>> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>> +
>>   # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>>   # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>>   KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
>> index 5d38153e2f13..c86722a101d0 100644
>> --- a/arch/riscv/include/asm/cmpxchg.h
>> +++ b/arch/riscv/include/asm/cmpxchg.h
>> @@ -105,8 +105,30 @@
>>    * indicated by comparing RETURN with OLD.
>>    */
>>   
>> -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
>> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
>>   ({									\
>> +	__label__ no_zabha_zacas, end;					\
>> +									\
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
>> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
>> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
>> +				     RISCV_ISA_EXT_ZABHA, 1)		\
>> +			 : : : : no_zabha_zacas);			\
>> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
>> +				     RISCV_ISA_EXT_ZACAS, 1)		\
>> +			 : : : : no_zabha_zacas);			\
> I came late to the call, but I guess trying to get rid of these asm gotos
> was the topic of the discussion. The proposal was to try and use static
> branches, but keep in mind that we've had trouble with static branches
> inside macros in the past when those macros are used in many places[1]
>
> [1] commit 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y")


Thanks for the pointer, I was not aware of this. I came up with a 
solution with preprocessor guards, not the prettiest solution but at 
least it does not create more problems :)


>
>> +									\
>> +		__asm__ __volatile__ (					\
>> +			prepend						\
>> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
>> +			append						\
>> +			: "+&r" (r), "+A" (*(p))			\
>> +			: "rJ" (n)					\
>> +			: "memory");					\
>> +		goto end;						\
>> +	}								\
>> +									\
>> +no_zabha_zacas:;							\
> unnecessary ;


Actually it is, it fixes a warning encountered on llvm: 
https://lore.kernel.org/linux-riscv/20240528193110.GA2196855@thelio-3990X/

Thanks,

Alex


>
>>   	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>>   	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>>   	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
>> @@ -133,6 +155,8 @@
>>   		: "memory");						\
>>   									\
>>   	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>> +									\
>> +end:;									\
>>   })
>>   
>>   #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
>> @@ -180,8 +204,13 @@ end:;									\
>>   									\
>>   	switch (sizeof(*__ptr)) {					\
>>   	case 1:								\
>> +		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
>> +					prepend, append,		\
>> +					__ret, __ptr, __old, __new);    \
>> +		break;							\
>>   	case 2:								\
>> -		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
>> +		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
>> +					prepend, append,		\
>>   					__ret, __ptr, __old, __new);	\
>>   		break;							\
>>   	case 4:								\
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
>> -- 
>> 2.39.2
>>
> Thanks,
> drew
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
