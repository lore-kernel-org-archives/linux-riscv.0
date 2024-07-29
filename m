Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9FBC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVZk4w69LDz9n05FKDJco/bOq/mAqFdHqpQ6ilMkqU4=; b=Cb1+VBeYWriu9z
	Esd75oBti+nAlIHmS8vvjtBeSpwwTHzcoGmeUdARvGy4y6glvTNJO1d3wkZe+79enDWzPAe7wtxbe
	4nmwg8BoKBa8SNT5vSPP9fov5ybld79wrZE/B03W9Z2AfBcEgbVfi0jfUobmA01XeWCWwn2b4/gcS
	bVb3qeEQCcgRNg5+oHVik4XDHDGh5RA7MvP7gztF6DEr6ZjfzJOuoVKdLSWExreI9dlAYx4y15yGs
	OAwwiggiPbC57Q6KCedGljbeyPGRl2dSLYUfwfCo9fneMSOxHf9yqAmZRBdOnSiYDVJtuUoJFTN7R
	qPWMVPP7WLFlwjHOEdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRZo-0000000Bh72-1Oiv;
	Mon, 29 Jul 2024 14:42:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRO6-0000000BbWf-1k1d;
	Mon, 29 Jul 2024 14:30:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CFFD40007;
	Mon, 29 Jul 2024 14:30:01 +0000 (UTC)
Message-ID: <51043fe4-297b-4f2e-9e67-669ea53cf273@ghiti.fr>
Date: Mon, 29 Jul 2024 16:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] riscv: Add Zawrs support for spinlocks
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org,
 atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de,
 charlie@rivosinc.com, David.Laight@aculab.com, parri.andrea@gmail.com,
 luxu.kernel@bytedance.com
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-11-ajones@ventanamicro.com>
 <4de22b20-8a6a-47d0-a4e9-74343c45411c@ghiti.fr>
 <20240729-b6707d037c0546c2c2f8da25@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240729-b6707d037c0546c2c2f8da25@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_073010_663007_9891BED7 
X-CRM114-Status: GOOD (  11.57  )
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

On 29/07/2024 16:01, Andrew Jones wrote:
> On Mon, Jul 29, 2024 at 03:43:30PM GMT, Alexandre Ghiti wrote:
> ...
>>> +static __always_inline void __cmpwait(volatile void *ptr,
>>> +				      unsigned long val,
>>> +				      int size)
>>> +{
>>> +	unsigned long tmp;
>>> +
>>> +	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
>>> +			     0, RISCV_ISA_EXT_ZAWRS, 1)
>>> +		 : : : : no_zawrs);
>>> +
>>> +	switch (size) {
>>> +	case 4:
>>> +		asm volatile(
>>> +		"	lr.w	%0, %1\n"
>>> +		"	xor	%0, %0, %2\n"
>>> +		"	bnez	%0, 1f\n"
>>> +			ZAWRS_WRS_NTO "\n"
>>> +		"1:"
>>> +		: "=&r" (tmp), "+A" (*(u32 *)ptr)
>>> +		: "r" (val));
>>> +		break;
>>> +#if __riscv_xlen == 64
>>> +	case 8:
>>> +		asm volatile(
>>> +		"	lr.d	%0, %1\n"
>>> +		"	xor	%0, %0, %2\n"
>>> +		"	bnez	%0, 1f\n"
>>> +			ZAWRS_WRS_NTO "\n"
>>> +		"1:"
>>> +		: "=&r" (tmp), "+A" (*(u64 *)ptr)
>>> +		: "r" (val));
>>> +		break;
>>> +#endif
>>> +	default:
>>> +		BUILD_BUG();
>>> +	}
>>> +
>>> +	return;
>>> +
>>> +no_zawrs:
>>> +	asm volatile(RISCV_PAUSE : : : "memory");
>>
>> Shouldn't we fallback to the previous implementation (cpu_relax()) here? Not
>> sure this is really important, but I want to make sure it was not an
>> oversight.
>>
> Hi Alex,
>
> It was intentional. We can't easily call cpu_relax() from here because
> asm/vdso/processor.h includes asm/barrier.h which includes asm/cmpxchg.h.
> We've mostly reproduced cpu_relax() here since we're only skipping the
> div, and, as __cmpwait will be used in loops which load memory for the
> comparison, I didn't think we needed the extra div stalls.


Ok thanks for your quick answer. Actually I'm asking because I fell onto 
the issue with the headers and I managed to fix it by replacing 
asm/barrier.h with linux/compiler.h, which is actually where is defined 
barrier().

But anyway, it makes sense.

Thanks,

Alex


> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
