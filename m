Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F993C2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nN52LrkG9REqYEPL6GfWf8YYE0KZzV3cnFwnJFRrSH0=; b=4BHfrH+xQ2XYQs
	74Nm3THQZsHXWejT10TH9Sh5HBPvCM7UXmeSdKtjKb3OcvZEKokCnTM7x65jGPAgbbzMVj05xsEML
	H8iFl8S2/lIyUGTzdpoJlK1GITqeS2MEmWUCVQv9gsgD3oSfhngt2NMK2BRaTMvbkFfxv/74yOc93
	5AvdFZ/79wOTI7xMp6inH/ko4dPvRbPO5ook4DLwlVaTgqJh6TkK/9IOcobePT/jQlHwbPokhHxLa
	y4yr27eJX+zvSnvxQn9SquL4hrItS089tw7oKkIO4TzOYrXE3ENYWvJjYzKMKyMaoVjCB5lZZRll4
	lhS9QeO3G5vi8b4g+RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXOF-0000000Ej8o-2xRF;
	Tue, 18 Jun 2024 11:52:43 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXOB-0000000Ej6q-3q5s
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 11:52:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47927E000B;
	Tue, 18 Jun 2024 11:52:36 +0000 (UTC)
Message-ID: <9268589d-9ccc-4cdd-9de2-5019407ef313@ghiti.fr>
Date: Tue, 18 Jun 2024 13:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
 <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr> <ZnFqDRXRjoHMaJXW@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZnFqDRXRjoHMaJXW@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_045240_227503_99DABACF 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Andrea,

On 18/06/2024 13:05, Andrea Parri wrote:
> (merging replies)
>
>>>> However, if local_irq_save() is called when irq is disabled. The SR_IE bit of
>>>> flag returned is clear. If some code between local_irq_save() and
>>>> local_irq_restore() reenables irq, causing the SR_IE bit of CSR_STATUS
>>>> back to 1, then local_irq_restore() can not restore irq status back to disabled.
> But doesn't that represent some bogus manipulation of the irq flags? cf.
>
> config DEBUG_IRQFLAGS
> 	bool "Debug IRQ flag manipulation"
> 	help
> 	  Enables checks for potentially unsafe enabling or disabling of
> 	  interrupts, such as calling raw_local_irq_restore() when interrupts
> 	  are enabled.
>
> in particular, raw_check_bogus_irq_restore() in raw_local_irq_restore().
>
>
>> This got lost but this is still correct and needed.
> You mean because of the mentioned rtl8723e example? are there other such
> instances?  IOW, why do you say that the changes in question are needed?


Simply because the scenario in this driver and I looked at the arm64 
implementation which restores flags unconditionally.

But if that's considered bogus, let's drop this. Sorry Xu for the noise, 
and thanks Andrea for pointing this.

Alex


>
>    Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
