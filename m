Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63114C27C55
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=totnoaq1osxmNulTvtNl09QHX3VSNbMvN59KM3RhPLM=; b=I/kbyVVcOWJaob
	Lxz85dqdsQsG7DsJK0pLkz2xX62gTYftu2siOB7CoOx0OyL9roXrjeNxcmBKUfMymPcCwInMpEPX1
	fF+g4I61ETSXY8hijA861fGzh+y608Ktg0kwrWOoBV/16z0aUWXBFQX7iSdBUtm6YYZ6PqWgR26KI
	sWlNEG2sdbzOVmu2B/pQBLVNYQvFnNMsfMJLZaQ3rLMJgbbkok7RumxxSJjRCeOJgFeV5l8jb8hbB
	GeS+bIw+C1mNi5m3lcYJqDXsWeXrXtRlv7KMiIqzX7UQyRJ4jhS8b8Ghi1nEtELixgOx6TTK4eiIi
	8nI/zGmqJ+z4mlXSsC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGJN9-00000002gxo-21hv;
	Sun, 09 Jun 2024 14:18:16 +0000
Received: from mail.valinux.co.jp ([210.128.90.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGJN5-00000002gxC-1tV4
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 14:18:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.valinux.co.jp (Postfix) with ESMTP id 5112AA9C38;
	Sun,  9 Jun 2024 23:18:05 +0900 (JST)
X-Virus-Scanned: Debian amavisd-new at valinux.co.jp
Received: from mail.valinux.co.jp ([127.0.0.1])
	by localhost (mail.valinux.co.jp [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAkmJ4iE8ZGW; Sun,  9 Jun 2024 23:18:05 +0900 (JST)
Received: from localhost.localdomain (p10213112-ipngn20001marunouchi.tokyo.ocn.ne.jp [153.220.101.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.valinux.co.jp (Postfix) with ESMTPSA id 0047FA9BFA;
	Sun,  9 Jun 2024 23:18:04 +0900 (JST)
From: takakura@valinux.co.jp
To: alex@ghiti.fr,
	songshuaishuai@tinylab.org,
	paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	takahiro.akashi@linaro.org,
	takakura@valinux.co.jp,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [-fixes] riscv: kexec: Avoid deadlock in kexec crash path
Date: Sun,  9 Jun 2024 23:18:02 +0900
Message-Id: <20240609141802.6976-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <545a7f3e-436e-4fd7-a45f-4f800bd58b20@ghiti.fr>
References: <545a7f3e-436e-4fd7-a45f-4f800bd58b20@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_071811_647891_BE082078 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Alex, Song,

On Fri, 24 May 2024, Alexandre Ghiti wrote:
>Hi Song, Ryo,
>
>On 06/05/2024 07:10, takakura@valinux.co.jp wrote:
>> Hi Song and Paul!
>>
>>>> To avoid the deadlock, this patch directly EOI the irq regardless of
>>>> the active status of irqchip.
>>> Taking a quick look at the other architectures, looks like no one else is
>>> doing this.  Is this addressing a RISC-V-only problem?
>>>
>>>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>>>> index f6c7135b00d7..d7ddf4d2b243 100644
>>>> --- a/arch/riscv/kernel/machine_kexec.c
>>>> +++ b/arch/riscv/kernel/machine_kexec.c
>>>> @@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
>>>>   
>>>>   	for_each_irq_desc(i, desc) {
>>>>   		struct irq_chip *chip;
>>>> -		int ret;
>>>>   
>>>>   		chip = irq_desc_get_chip(desc);
>>>>   		if (!chip)
>>>>   			continue;
>>>>   
>>>> -		/*
>>>> -		 * First try to remove the active state. If this
>>>> -		 * fails, try to EOI the interrupt.
>>>> -		 */
>>>> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
>>>> -
>>>> -		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
>>>> -		    chip->irq_eoi)
>>>> +		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>>>>   			chip->irq_eoi(&desc->irq_data);
>> I think this deadlock is relevant to riscv and arm64 as they both
>> acquire irqdesc spinlock by calling irq_set_irqchip_state() during their
>> machine_kexec_mask_interrupts().
>>
>> However, I think calling irq_set_irqchip_state() during
>> machine_kexec_mask_interrupts() is arm64 specific way of handling EOI
>> which is not necessary for riscv.
>> For arm64, its interrupt controller(gic) seems to have two ways of EOIing
>> an interrupt depending on the mode which gic is configured. One of them
>> treats EOI as two step procedure, priority drop and deactivation. I think
>> irq_set_irqchip_state() is there to handle the deactivation part of
>> the procedure.
>> For riscv, EOI only requires irq_eoi handler to complete EOI and I think
>> keeping irq_set_irqchip_state() will only leave this possible deadlock
>> without any use.
>> So I think it's best we simply remove irq_set_irqchip_state() as Song did.
>
>
>I think this ^ is relevant and should be added to the commit log. @Song 
>can you respin another version with the updated commit log? @Ryo can you 
>add your Reviewed-by when it's done?

Sure!

>This fix has been lagging behind for quite some time, it would be nice 
>to merge this in 6.10 and backport to stable.

Sincerely,

Ryo Takakura

>Thanks,
>
>Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
