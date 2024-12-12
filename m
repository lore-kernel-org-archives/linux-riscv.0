Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6311E7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fszgVbzEhO5GYlcZ62VEMspHzKd95yb99S2+vyjy+Gw=; b=tMhTcuESOYuD05
	tUbK2YAsAprX23Zu7GOQ0T6mDJZmRg9a7npPh+H4lxoNprniYqQEk49FyCXH1eEbBSZw1Rgv3kOPU
	DYd1/Pd8krCFs35slI0K6NbsqjWL9hyq0mqjnXypD+YxQOs9qz4A9NShuNf9LPGQfPh1jo5DfP49N
	w3Bk9Wy8xOL1Cd1+OnEt19r5++qXwnySaiqCiUJtYgjbjxBaWVY5PfUd1Rh3XWToArrxCpliH+HBz
	B7xnWM3aPqy6b9O4t2yipbQKn/m9TgiuST8NaJYwwHN4hMhqE9ZERqWKng6xhOxXFW5k/pde3U1O1
	awmEdwyGN4d5IZdHBp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpEZ-00000001i1C-09Fp;
	Thu, 12 Dec 2024 19:52:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpDR-00000001hrR-12TS;
	Thu, 12 Dec 2024 19:51:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734033074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yKDQJpTRFu3+KgGxhqTH4mLREYb5/OF2yZ5YcR8q86M=;
	b=EwQQl462TwmW12Fa0HrvaDXIO4Vr6mVq7kh76oTpOl6+58IJ2zr9OSR6en9SVBe7n48iqz
	zhtQ2e/Z8f/736P10Y0VQufETsZRK3MpkdN0vf58KJXqtjmebUGdjFir0gy9igmKALcH8l
	G8xx5ZEcbADAeOjONhxC7oy4L5Xumm0GAWn4Ev6JIhEBhjHGpdqKta0ZjO6mUI2SvlwNmb
	bFDgQtONNCdzTWIP4y4oPLsRmipJFFHUPevPVekcN3MdkrcAe2CzuhfE4iMqgoAd2SMykQ
	o1oqKzkpNzggwVFUlJu0k6JYhFhHXcOdZj2BJNYPXfZ6IM9ZBpAnU7t6ojjzQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734033074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yKDQJpTRFu3+KgGxhqTH4mLREYb5/OF2yZ5YcR8q86M=;
	b=nRSIBmKOJsIWm1vKA+byWzwCOqL7uTD6Gwqh/fIzqbH0RwijulwepNUt7Ucc75lS3yjWOc
	GawF7JcNeJdOrwAA==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
In-Reply-To: <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
 <87r06gq2di.ffs@tglx>
 <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
Date: Thu, 12 Dec 2024 20:51:13 +0100
Message-ID: <877c84ade6.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_115117_426004_3A54B311 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12 2024 at 22:11, Anup Patel wrote:
>> --- a/kernel/irq/chip.c
>> +++ b/kernel/irq/chip.c
>> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
>>                 return -EINVAL;
>>
>>         desc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
>> +
>> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
>> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
>> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +               else
>> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +       }
>
> We need similar changes in irq_domain_set_hwirq_and_chip()
> because we use IRQ_DOMAIN_HIERARCHY in RISC-V.

Grr, you are right. Let me add that to the base patch.

>>         irq_put_desc_unlock(desc, flags);
>>         /*
>>          * For !CONFIG_SPARSE_IRQ make the irq show up in
>> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
>>         trigger = irqd_get_trigger_type(&desc->irq_data);
>>
>>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
>> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
>> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
>>         if (irq_settings_has_no_balance_set(desc))
>>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>>         if (irq_settings_is_per_cpu(desc))
>>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
>> -       if (irq_settings_can_move_pcntxt(desc))
>> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>>         if (irq_settings_is_level(desc))
>>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
>>
>> +       /* Keep this around until x86 is converted over */
>> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
>> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +               if (irq_settings_can_move_pcntxt(desc))
>> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +       }
>> +
>
> These changes in irq_modify_status() need to be dropped to support
> the above changes in irq_domain_set_hwirq_and_chip().

Why? With CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS enabled this hunk is
compiled out. So nothing is modifying PCNTXT here. That's the whole
point.

Thanks,

        tglx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
