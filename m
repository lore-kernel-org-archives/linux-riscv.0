Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E936EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 05:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPfjnNt9S9fUVmyfVW6NL/xV3cMfEM4PhRFfpglUvgg=; b=prekK4XG298iGj
	X6PFJEgE1O3KgFz3X1knanuMHagFPsBoWHyKL/bfsTdkuO9jXNzzcr1L4PfzGRbkyE5kDujJtHJlN
	NResotM7uL5toH8Ry/EtwQ8oSmyKj6T6Ck1+z2aGQRB0H/ppIdSsCFHOPM9a7rZjG4ADyVPCPfEDt
	4KVq8YCqDuqMmdSeo8UmeG2L9aMLZckISZZX3TUYfpCvmw9KNT9A/oGWkCX2JLGDJgJBWFZgKviR+
	GtNLPH0YTx/CdntiJ+dvzIqJjk3t0TQvcqc0SyEGrLd4MPXyjlSvumsfYk1ZKDRIZFfqlHD18OyK7
	iJ3++AcF4WYpg4vQhVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3qd2-0000000661G-43y2;
	Mon, 06 May 2024 05:11:08 +0000
Received: from mail.valinux.co.jp ([210.128.90.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3qd0-0000000660L-0vob
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 05:11:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.valinux.co.jp (Postfix) with ESMTP id 61438A99CF;
	Mon,  6 May 2024 14:11:00 +0900 (JST)
X-Virus-Scanned: Debian amavisd-new at valinux.co.jp
Received: from mail.valinux.co.jp ([127.0.0.1])
	by localhost (mail.valinux.co.jp [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fd3innPWGCin; Mon,  6 May 2024 14:11:00 +0900 (JST)
Received: from localhost.localdomain (p10626078-ipngn25201marunouchi.tokyo.ocn.ne.jp [153.201.134.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.valinux.co.jp (Postfix) with ESMTPSA id 25483A9977;
	Mon,  6 May 2024 14:11:00 +0900 (JST)
From: takakura@valinux.co.jp
To: songshuaishuai@tinylab.org,
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
Date: Mon,  6 May 2024 14:10:58 +0900
Message-Id: <20240506051058.20386-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e34cd12-66d8-4432-780a-f08d03a2c95e@sifive.com>
References: <0e34cd12-66d8-4432-780a-f08d03a2c95e@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_221106_394220_B28550A5 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Song and Paul!

>> To avoid the deadlock, this patch directly EOI the irq regardless of
>> the active status of irqchip.
>
>Taking a quick look at the other architectures, looks like no one else is 
>doing this.  Is this addressing a RISC-V-only problem?
>
>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>> index f6c7135b00d7..d7ddf4d2b243 100644
>> --- a/arch/riscv/kernel/machine_kexec.c
>> +++ b/arch/riscv/kernel/machine_kexec.c
>> @@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
>>  
>>  	for_each_irq_desc(i, desc) {
>>  		struct irq_chip *chip;
>> -		int ret;
>>  
>>  		chip = irq_desc_get_chip(desc);
>>  		if (!chip)
>>  			continue;
>>  
>> -		/*
>> -		 * First try to remove the active state. If this
>> -		 * fails, try to EOI the interrupt.
>> -		 */
>> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
>> -
>> -		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
>> -		    chip->irq_eoi)
>> +		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>>  			chip->irq_eoi(&desc->irq_data);
I think this deadlock is relevant to riscv and arm64 as they both
acquire irqdesc spinlock by calling irq_set_irqchip_state() during their 
machine_kexec_mask_interrupts().

However, I think calling irq_set_irqchip_state() during 
machine_kexec_mask_interrupts() is arm64 specific way of handling EOI 
which is not necessary for riscv.
For arm64, its interrupt controller(gic) seems to have two ways of EOIing 
an interrupt depending on the mode which gic is configured. One of them 
treats EOI as two step procedure, priority drop and deactivation. I think 
irq_set_irqchip_state() is there to handle the deactivation part of 
the procedure.
For riscv, EOI only requires irq_eoi handler to complete EOI and I think 
keeping irq_set_irqchip_state() will only leave this possible deadlock 
without any use. 
So I think it's best we simply remove irq_set_irqchip_state() as Song did.

Sincerely,
Ryo Takakura

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
