Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67CC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLYgizh7M6nsiOxMkcsjJgK+owpI5q58X2CKg9YprjM=; b=PoSoU5dMYd/8Bx
	wvDD9wbcZGzMveWT2b/j2tkd7jT+gT8FZxe8VM+0o3lcAybpyo+P+7nR9LP1br4we1zN+MRSfduzu
	q8WIZQzhquTpj2zPKRj0PJsmvXBsQ24mriDEJj7GzvRQXXTMaBbKbQpaaswvn7IGN9gPChVDbRdDh
	qNdyqR72/ToFafe33g/htcdcVpAskZz6jA0O9V4NNW8+6x1utMauOS4iZHz3qRxEKSPCNkDH4bPR4
	CnfZXYfU8FPvO0DWVEfoMIWndOslxDo0Kge5IiTMoLSyjp/YvwWE9FtDDnDoQcL7jtK8bC/WtIC8G
	RyD+h2gHJMv+lMQdc39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPJe-00000008GOd-1gwg;
	Fri, 24 May 2024 07:26:14 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPJa-00000008GK7-2Chg
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:26:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 886651C0007;
	Fri, 24 May 2024 07:25:59 +0000 (UTC)
Message-ID: <545a7f3e-436e-4fd7-a45f-4f800bd58b20@ghiti.fr>
Date: Fri, 24 May 2024 09:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [-fixes] riscv: kexec: Avoid deadlock in kexec crash path
Content-Language: en-US
To: takakura@valinux.co.jp, songshuaishuai@tinylab.org,
 paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 xianting.tian@linux.alibaba.com, takahiro.akashi@linaro.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <0e34cd12-66d8-4432-780a-f08d03a2c95e@sifive.com>
 <20240506051058.20386-1-takakura@valinux.co.jp>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240506051058.20386-1-takakura@valinux.co.jp>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_002610_769534_5B5A3733 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Song, Ryo,

On 06/05/2024 07:10, takakura@valinux.co.jp wrote:
> Hi Song and Paul!
>
>>> To avoid the deadlock, this patch directly EOI the irq regardless of
>>> the active status of irqchip.
>> Taking a quick look at the other architectures, looks like no one else is
>> doing this.  Is this addressing a RISC-V-only problem?
>>
>>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>>> index f6c7135b00d7..d7ddf4d2b243 100644
>>> --- a/arch/riscv/kernel/machine_kexec.c
>>> +++ b/arch/riscv/kernel/machine_kexec.c
>>> @@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
>>>   
>>>   	for_each_irq_desc(i, desc) {
>>>   		struct irq_chip *chip;
>>> -		int ret;
>>>   
>>>   		chip = irq_desc_get_chip(desc);
>>>   		if (!chip)
>>>   			continue;
>>>   
>>> -		/*
>>> -		 * First try to remove the active state. If this
>>> -		 * fails, try to EOI the interrupt.
>>> -		 */
>>> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
>>> -
>>> -		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
>>> -		    chip->irq_eoi)
>>> +		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>>>   			chip->irq_eoi(&desc->irq_data);
> I think this deadlock is relevant to riscv and arm64 as they both
> acquire irqdesc spinlock by calling irq_set_irqchip_state() during their
> machine_kexec_mask_interrupts().
>
> However, I think calling irq_set_irqchip_state() during
> machine_kexec_mask_interrupts() is arm64 specific way of handling EOI
> which is not necessary for riscv.
> For arm64, its interrupt controller(gic) seems to have two ways of EOIing
> an interrupt depending on the mode which gic is configured. One of them
> treats EOI as two step procedure, priority drop and deactivation. I think
> irq_set_irqchip_state() is there to handle the deactivation part of
> the procedure.
> For riscv, EOI only requires irq_eoi handler to complete EOI and I think
> keeping irq_set_irqchip_state() will only leave this possible deadlock
> without any use.
> So I think it's best we simply remove irq_set_irqchip_state() as Song did.


I think this ^ is relevant and should be added to the commit log. @Song 
can you respin another version with the updated commit log? @Ryo can you 
add your Reviewed-by when it's done?

This fix has been lagging behind for quite some time, it would be nice 
to merge this in 6.10 and backport to stable.

Thanks,

Alex


>
> Sincerely,
> Ryo Takakura
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
