Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=T7JTDih0COH1hWgty/dA9U/JewSIcF0jNPZwUrgYhRY=; b=VIT9X8IJwvHpx4kXZ3Q7zrt/As
	4vnwBDLc6qQCtH1MsaGug6OsH+1TccdTjxXPfDV7g79YvTQ72twm21QKr3ssYuSfhSOJMSE2w+xhf
	gN+XiYbuoBfRQ+r/9btwwkmVX6H0ao6j2BA5iHCueKsfMksXv6VdDfIwsvA1Ls1zjYCPz86RDTxIn
	4Uuj97aNhzwet8gkib74KsYI+W/JM4xPH6Hwvo6VrQfc2/NfnsYoQlb3NvtktHKaYt87rH44uoqAa
	jmgGg1hrxlR3lMAxyS3oOIhLBUIJHHCHFpmiq/INR3HkOvElI7AtFTRFEAyEMIUUkL0koN43+M3mH
	kQup/Xfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwkk-0000000HPQl-1AVR;
	Wed, 20 Mar 2024 14:17:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwkg-0000000HPQ2-1NEu
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 14:17:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dd955753edso54978045ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710944229; x=1711549029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2EgfvxxgK+wJvZtFaKjr7t9HOODvH7M/KpVWvGGTzE=;
        b=w9z+mMmADT1VsMh9K1BmucSe55P6W+/1eYeHBuytHqBnRXOrFMDSSrIon2rOF/1Shf
         gUN3gcBqlhB4JOL5f1MhgaMXoJhzJHCGjg0egVjc8htPrnEnmwPVt7sdsCb7uahDWxHZ
         2ulivzI5o46Mjt5R4W0ZZ4VfqaYWE/Hg/HQrNOHKktta7+FrAuxFb76wMwd5ErcTqJ3m
         pka0m1O9+7Y6vwtP2SAn2TiCuxTBQHykHGsW+nKlFdnJOIfRpPIVlnKfgbBKExpxJq2Z
         FQCiLGt3ukqFkgCDNXn76GSTNlbuwp32IKew536kkIzML6MqceX7fRkQWpTyuJfX4t5R
         dqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944229; x=1711549029;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2EgfvxxgK+wJvZtFaKjr7t9HOODvH7M/KpVWvGGTzE=;
        b=ef/+xrqrAe6gaqlUdnMl591PWojouKieIy/U+HMnKA7ibIGjHlx/Y4ghaBnlSkb2oE
         DsxPZFJXYJPXXh0gAU4hvOOOcrQHAN8c0LtNjlK56XegqQ9FIBUXTL+ZpvwB5viVORqB
         /pBbIaLW+y4ePcmj2SEe/iMftzRu8Zek/LbXnam/K7LOXhZga+mwLHBgKoYrX6qSBHFb
         tgY8P9L/z+XxkTDRdATVylHAB9HQW8xPxbw36I2LGq0zXn211kUTuJeRDfzQI0epbwQ6
         cVbWsQVuUmjo4PiWdikncsiRp7SZmLRVkE+1pw7CD5Z6i6k31vqi8cOkmtuOUogSXzPb
         AdRg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBxvAESYKZzzWCyew6Cb4XANLtAVg1SIqivwqGk3RXPmfqitxA64UHV2ZguKM3F4L6K9lscj7h8bJY5gyE1cLBq3jApbPNU7H+0xZLGYC
X-Gm-Message-State: AOJu0YwtWAJNEGKollEZ5Co4nz4FYTKOeVXmlLxjM40YzvSpeMWZxtnU
	HnL8hodlriDsItunIlTc70L89LwokJjUXIpw9PvRBZsf1yNh6VFuseb3Xiqsxic=
X-Google-Smtp-Source: AGHT+IGycrYcZflVp1sNbYxQH6AqEecSt6Yeb5KG7ltM7bagqWpsCCfgRrtVN3eRcOSSKhXrIi+/+g==
X-Received: by 2002:a17:902:eb8c:b0:1de:ddc6:278f with SMTP id q12-20020a170902eb8c00b001deddc6278fmr17506092plg.0.1710944228449;
        Wed, 20 Mar 2024 07:17:08 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090282ca00b001d8edfec673sm13539227plz.214.2024.03.20.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 07:17:08 -0700 (PDT)
Date: Wed, 20 Mar 2024 07:17:08 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Mar 2024 07:17:06 PDT (-0700)
Subject: Re: [PATCH v2] irqchip/sifive-plic: enable interrupt if needed before EOI
In-Reply-To: <87wmr8hd7j.ffs@tglx>
CC: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  samuel@sholland.org, Marc Zyngier <maz@kernel.org>, guoren@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, namcao@linutronix.de, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-2ab049d5-bab9-4d62-8d68-a7159a987f12@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_071710_503442_912EBD88 
X-CRM114-Status: GOOD (  30.91  )
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

On Tue, 13 Feb 2024 02:26:40 PST (-0800), tglx@linutronix.de wrote:
> Nam!
>
> On Wed, Jan 31 2024 at 09:19, Nam Cao wrote:
>> RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
>> explained in the description of Interrupt Completion in the PLIC spec:
>>
>> "The PLIC signals it has completed executing an interrupt handler by
>> writing the interrupt ID it received from the claim to the claim/complete
>> register. The PLIC does not check whether the completion ID is the same
>> as the last claim ID for that target. If the completion ID does not match
>> an interrupt source that *is currently enabled* for the target, the
>> completion is silently ignored."
>>
>> Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
>> ensured that EOI is successful by enabling interrupt first, before EOI.
>>
>> Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
>> operations") removed the interrupt enabling code from the previous
>> commit, because it assumes that interrupt should already be enabled at the
>> point of EOI. However, this is incorrect: there is a window after a hart
>> claiming an interrupt and before irq_desc->lock getting acquired,
>> interrupt can be disabled during this window. Thus, EOI can be invoked
>> while the interrupt is disabled, effectively nullify this EOI. This
>> results in the interrupt never gets asserted again, and the device who
>> uses this interrupt appears frozen.
>
> Nice detective work!
>
>> Make sure that interrupt is really enabled before EOI.
>>
>> Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> ---
>> v2:
>>   - add unlikely() for optimization
>>   - re-word commit message to make it clearer
>>
>>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>> index e1484905b7bd..0a233e9d9607 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
>>  {
>>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>>
>> -	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>> +	if (unlikely(irqd_irq_disabled(d))) {
>> +		plic_toggle(handler, d->hwirq, 1);
>> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>> +		plic_toggle(handler, d->hwirq, 0);
>
> It's unfortunate to have this condition in the hotpath, though it should
> be cache hot, easy to predict and compared to the writel() completely in
> the noise.

Ya, I think it's fine.

I guess we could try and play some tricks.  Maybe hide the load latency 
with a relaxed writel and some explict fencing, or claim interrupts when 
enabling them.  Those both seem somewhat race-prone, though, so I'm not 
even sure if they're sane.

Anything with a PLIC is going to have pretty poor interrupt latency 
already, so I doubt it's worth the headache.

>> +	} else {
>> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>> +	}
>>  }
>
> Can the RISCV folks please have a look at this?

Sorry I missed this.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case anyone was worried, though I saw it got merged so I think we're 
safe there.  I'm always a bit lost with the IRQ stuff, I didn't even 
know that race condition was posisble.

Thanks for the fix!

>
> Thanks,
>
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
