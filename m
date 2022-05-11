Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987FFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dql0ItSfszwY5idfjy88TFKfp20Zzl1pGm26Zzptbk0=; b=dfBe20h+cfPLANSRtqeqfnAWLB
	JrIHFzTQsaHYF8UXQ5IDfcXUPd7L3WiuxdfTnq+SSebFtX7ip/pfs8eqBpbd5NThqaUWKroOEuIvY
	CLfldIZwNo6wwABor/JG8/Gs1lB+fOE2qHLg1W4pLw+deMMdAGusnvAeh3SVHgOrQmw6uu5GMf/gL
	PwuCV5iqcxD7iHvc1dSd3RsCM99eHOVFS+CuMVhgAQP9VAWtWOgJHt0UIWfqDiN9zTIm0tY8isjhB
	0kKuzfrKLtd5VqbIWuk0p/3CN/clRz6AbH8YIu+hrbeKdWgpjRIB/Wz0uwFXFvwzvOHlkBwcyR2h2
	mbXPRBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noj9f-006Fxo-On; Wed, 11 May 2022 10:01:15 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noj9Q-006Ftn-Mo; Wed, 11 May 2022 10:01:04 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EA6415C003F;
 Wed, 11 May 2022 06:00:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 11 May 2022 06:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1652263254; x=
 1652349654; bh=CTXGRB6J4UHHbNMGL8dlUECvcdCemTh+syQxorNFVlw=; b=W
 Tlf7lfchZr6MIQCALPkhb0QuqeQ/GU5qWpPfBypfWy+w4/QAI8stDg1tuSzosU+q
 fN9dXyZxORZn6YOdmr88sSN+5dMMg4TfdhwHodMEOfqMuhQjnpvURuBcFoStEH6s
 DmLfiTqvgemtlRTSp0Ou+UzX0sTj2oOncK/uH8CEJTBxRzfffQn+UayzVSKV3h8O
 YE+EJFTI95Nzo7yEG6v281RvWxEug8YRmOuXwHLpjv1O3qTbGUoCcERi3pxg3Af1
 nhWB8qPxQzFSJg0E5O70OVE+sFLPfrobZKSE/dTwHb8gAg7jf7pWoxLVSR2C7beE
 MZU3FmCKdtZELS/0iBwhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652263254; x=1652349654; bh=CTXGRB6J4UHHb
 NMGL8dlUECvcdCemTh+syQxorNFVlw=; b=xJh9VccWyAyxpC4q4eFJF0IqR3yUH
 Q1DgGClFBKUHJiYl+E2bcJktxP0X5LNDielnCaZMZIZj/N761NnGJHmeT6wPVP9p
 frt+4gg1E0kHtCEXZVG7CHSb+MqnYEyDcju0EtqJlJd68LIDaaDOOt1/v7YqwWS5
 M7rVSsxxTfGQp7T4y0Ar7VnB5V9wxh5ahplumivLSRfHWbu2RqW7Anul10HQ/cO7
 L9tw3N02N8zWPyc70ElZWK+oMcXaq2xj979KFlcYmG5uqGnSojHmtZ5VpSOILrDS
 xlI8Vt1GFV+Xqh1R1buatRzA6T8KVO4hy3tR2mAE3qPgPShNu4ycbaEbg==
X-ME-Sender: <xms:VYl7YqFf9oeWr8ePgcHY9WDYJ4gVwbYw20wR6Cj6_uU8eImCR1uEyA>
 <xme:VYl7YrV5M0wsUxkC_mTI5w8wmuQL8k83y3WcCg0DTk7G2VHMVPWMNX2B5hzdNk6mX
 7aRwZ8ZK3xy4ViP7g>
X-ME-Received: <xmr:VYl7YkLIf9GvKYmjI3rX4UoQJI5C3MRweS67MgCS-w6PjjaRJmxPehvK_Dw6tfyfRgIoEj5-zoLLLyor2STlHyQpVYx8G-A7Zl6uHf99YI_jqgdJ8RPx2UWd8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepieetvdfhjefhvdejgfeguedtgeetjeffgfevtdejudekgfeukedt
 tddvgeeftdfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:VYl7YkH8Dh-U1u4uJWySu0DaMwYIEh7lYzpV9oM8A8ZikyDL68Mbvw>
 <xmx:VYl7YgWSM9bVnI2kXiPyi1FqoTnAAxaa8dATNrw44dag6Dny71TKmA>
 <xmx:VYl7YnNGqPyPgyZxc8T1cCghtvJq1l3w8F1BXoDqQXXrOiRmIMI66w>
 <xmx:Vol7Yht8YJOmetYn8KxVwAVLbBHq-geXImqAfk1mKLOevLO4UazNfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 06:00:52 -0400 (EDT)
Subject: Re: [PATCH 5/5] irqchip/sifive-plic: Separate the enable and mask
 operations
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Florian Fainelli <f.fainelli@gmail.com>,
 Guo Ren <guoren@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220509034333.60017-1-samuel@sholland.org>
 <20220509034333.60017-6-samuel@sholland.org> <87a6bp7ke2.wl-maz@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2b063917-17c8-0add-fadf-5aa42532fbbf@sholland.org>
Date: Wed, 11 May 2022 05:00:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87a6bp7ke2.wl-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_030101_370836_678078A0 
X-CRM114-Status: GOOD (  28.94  )
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

On 5/10/22 5:27 AM, Marc Zyngier wrote:
> On Mon, 09 May 2022 04:43:33 +0100,
> Samuel Holland <samuel@sholland.org> wrote:
>>
>> The PLIC has two per-IRQ checks before sending an IRQ to a hart context.
>> First, it checks that the IRQ's priority is nonzero. Then, it checks
>> that the enable bit is set for that combination of IRQ and context.
>>
>> Currently, the PLIC driver sets both the priority value and the enable
>> bit in its (un)mask operations. However, modifying the enable bit is
>> problematic for two reasons:
>>   1) The enable bits are packed, so changes are not atomic and require
>>      taking a spinlock.
>>   2) The following requirememnt from the PLIC spec, which explains the
>>      racy (un)mask operations in plic_irq_eoi():
>>
>>        If the completion ID does not match an interrupt source
>>        that is currently enabled for the target, the completion
>>        is silently ignored.
>>
>> Both of these problems are solved by using the priority value to mask
>> IRQs. Each IRQ has a separate priority register, so writing the priority
>> value is atomic. And since the enable bit remains set while an IRQ is
>> masked, the EOI operation works normally. The enable bits are still used
>> to control the IRQ's affinity.
> 
> This is pretty neat.
> 
> My only concern is around whether implementations do when changing
> priority of enabled interrupts. The PLIC architecture is conveniently
> silent on the subject, but that's certainly something that can result
> in total crap with the ARM GICs, for example, because an
> implementation is free to apply this priority change on an already
> pending interrupt, or not. But the kernel really wants the interrupt
> to be masked once it tells the HW to do so.

I think this can be expected based on this comment from the PLIC spec, which is
the only place using the word "mask":

"The PLIC will mask all PLIC interrupts of a priority less than or equal to
threshold. For example, a`threshold` value of zero permits all interrupts with
non-zero priority."

> Could anyone please check the RTL for some common implementations?

The C9xx PLIC explicitly checks for priority 0 in each gateway:

https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/plic/rtl/plic_int_kid.v#L152

and also continuously updates the IRQ outputs based on comparing the arbitrated
highest priority interrupt with the target's threshold:

https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/plic/rtl/plic_arb_ctrl.v#L295


Other implementations appear to do something similar, continuously computing the
highest priority interrupt, and comparing that to the target threshold:

https://github.com/chipsalliance/rocket-chip/blob/master/src/main/scala/devices/tilelink/Plic.scala#L187
https://github.com/lowRISC/rv_plic/blob/master/rtl/rv_plic_target.sv#L92
https://github.com/lowRISC/opentitan/blob/master/hw/ip_templates/rv_plic/rtl/rv_plic_target.sv.tpl#L58
https://github.com/pulp-platform/rv_plic/blob/master/rtl/rv_plic_target.sv#L92
https://github.com/RoaLogic/plic/blob/master/rtl/verilog/core/plic_target.sv#L126
https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L96

Those are the implementations I could find. Others may know about non-public
implementations.

Regards,
Samuel

> A way to avoid the above trouble (should it exist) would be to
> disable the interrupt when changing the priority, and then reenable
> it. You'd still get the simpler EOI, which is what you really want.
> 
> Thanks,
> 
> 	M.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
