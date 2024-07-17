Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF39C3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV3L5q88OGQ0eUS2NORFzVRJRmEkQIRaoxpF8QErWqQ=; b=nG1rZZ8D+z2ic/
	HEIovE5xhpwtSVWo7muBLnBocXxzS3ASHTe6VLTSKceIUYC+i2f2iC974UZsbNn+6jVWYF8e0wNZH
	RqRxBfyS50mhzS8segLzCSzf/0sMehadoSWvFTRNnfuQU93wXhBpVIeDGsvTWcicwXCLrPWKXHc8q
	2GhpifKfRmsJ82UkeyB/hwO5Pzayy2c+K3hWXvUlMPxUnmsw4p8b0oNkJtGrCXQ9Em1anKlDWoFtc
	eBK2lxDVYu/657efEAd72l8Oo4MuFitrh9tXB8zMsKVAdBfWGvlYo+hMFc5c0USqdSbbyQfDzpiB0
	waKUxar0VMhlQl4ceTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFjn-0000000FNNm-1TF3;
	Thu, 18 Jul 2024 01:15:15 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6fh-0000000EDfY-0ezz
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 15:34:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 470AD20009;
	Wed, 17 Jul 2024 15:34:20 +0000 (UTC)
Message-ID: <f31da52a-55c4-472d-8056-b3e82feba4f8@ghiti.fr>
Date: Wed, 17 Jul 2024 17:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 <20240717-enroll-snowless-e722e367789b@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240717-enroll-snowless-e722e367789b@spud>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_083425_596595_60D12BDD 
X-CRM114-Status: GOOD (  13.53  )
X-Mailman-Approved-At: Wed, 17 Jul 2024 18:15:08 -0700
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

On 17/07/2024 17:29, Conor Dooley wrote:
> On Wed, Jul 17, 2024 at 10:26:34AM -0500, Andrew Jones wrote:
>> On Wed, Jul 17, 2024 at 08:19:49AM GMT, Alexandre Ghiti wrote:
>>> -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
>>> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
>>>   ({									\
>>> +	__label__ no_zabha_zacas, end;					\
>>> +									\
>>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
>>> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
>>> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
>>> +				     RISCV_ISA_EXT_ZABHA, 1)		\
>>> +			 : : : : no_zabha_zacas);			\
>>> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
>>> +				     RISCV_ISA_EXT_ZACAS, 1)		\
>>> +			 : : : : no_zabha_zacas);			\
>> I came late to the call, but I guess trying to get rid of these asm gotos
>> was the topic of the discussion. The proposal was to try and use static
>> branches, but keep in mind that we've had trouble with static branches
>> inside macros in the past when those macros are used in many places[1]
>>
>> [1] commit 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y")
> The other half of the suggestion was not using an asm goto, but instead
> trying to patch the whole thing in the alternative, for the problematic
> section with llvm < 17.


And I'm not a big fan of this solution since it would imply patching the 
5-7 instructions for LR/SC into nops which would probably slow (a bit) 
the amocas/amoswap sequence. I agree it should not be that big, but that 
it is just to fix an llvm issue, so not worth it to me!


>>> +									\
>>> +		__asm__ __volatile__ (					\
>>> +			prepend						\
>>> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
>>> +			append						\
>>> +			: "+&r" (r), "+A" (*(p))			\
>>> +			: "rJ" (n)					\
>>> +			: "memory");					\
>>> +		goto end;						\
>>> +	}								\
>>> +									\
>>> +no_zabha_zacas:;							\
>> unnecessary ;
>>
>>>   	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>>>   	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>>>   	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
>>> @@ -133,6 +155,8 @@
>>>   		: "memory");						\
>>>   									\
>>>   	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>>> +									\
>>> +end:;									\
>>>   })
>>>   
>>>   #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
