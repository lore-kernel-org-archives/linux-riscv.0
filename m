Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB64C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 02:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aohTTRuIO0fuVVw8wmdRs9YbkYTry7iqTuY0uexBnOc=; b=vIXq/NKhp7oEpt
	o9Djpk4wsd8BWHyT1wz7cv3Zz0esf19Y8Ke+WXPNxnaxwD+WuI1Gd2Qkhy5IwTlf+HENp9ZckvaJe
	KCyEE2nSoiE8b3QJl9WxnmkkUHFJGO3aUc/C6/ZlL7H8fuwimK/KwEmWLWnJFUq8mKai2k5cSVa+C
	vl6LRKknGE6sXfDjPwTpR/WIAIau0oOr3W1vn5h4dITGxwWM9AL1PXqTvN9uQukspaxyGmEWhEgvZ
	e5b+ZXbKfmMG7p1/jyVu1V2LL+ESocdBuuKMDNGUrc/9aMiIWZuufb5Kfug2siieTxvnwYCFFaEZR
	nCDeCYpvTWMs2nkWfAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vUD-00CV17-05; Fri, 02 Dec 2022 02:09:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vU9-00CUzi-TD
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 02:09:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669946944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chh0G08/xLk5pzy1L0Ry5SpkFEB3qVhaXDAsS5cW5fs=;
	b=L0E7sVyXw6Jblb0n5un5BreQdt4t9bg+f6AbFVIwch5tO/p7/v/6ezmKLmT+d0U7IIXZX/
	YlAgyNIpBX7wL5RuPYhq3r17HBE4V/2WMiOEm2ux+QUFGqsXHevHU5fO1iB5N5ieUJhAkE
	ZQd3hk+wmotVsMxBsqpZwocbPbR90jaz3dVjR24pYwOGG3+Cr3Zkd3xkmGmbUaQXbapxhW
	bRyPfurZkZ/mjwGxDXVkq6cBDF5NAfSE4BaiZ3ypdhh/LVXAwzifTXapMBxyAgds6DxpdI
	HiMvuPGCu7yKRJ5X1CgoACn7mnXUtGkBhX6/lMqoHTffsC6OqFPWtGJVQtfF1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669946944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chh0G08/xLk5pzy1L0Ry5SpkFEB3qVhaXDAsS5cW5fs=;
	b=Lwd+x2kzC4/ZmsV/t8MGhzJYxEo68p+5PgJlbQB65r9+GRtwHW0l3RjbRPJiu+Bo6gYCi8
	cEfMNp0XEBWYvtCw==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, Alistair
 Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 3/8] genirq: Add mechanism to multiplex a single HW IPI
In-Reply-To: <CAK9=C2WN57hHUz=3SDruyWPdAobn+QP8uGwugjPAobeFG7dBkw@mail.gmail.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
 <20221201130135.1115380-4-apatel@ventanamicro.com> <87v8mvqbvq.ffs@tglx>
 <CAK9=C2WN57hHUz=3SDruyWPdAobn+QP8uGwugjPAobeFG7dBkw@mail.gmail.com>
Date: Fri, 02 Dec 2022 03:09:03 +0100
Message-ID: <87h6yer1z4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_180906_108129_19D7649E 
X-CRM114-Status: GOOD (  11.03  )
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

Anup!

On Thu, Dec 01 2022 at 23:30, Anup Patel wrote:
> On Thu, Dec 1, 2022 at 10:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> > irqchip driver and it is shared by various RISC-V irqchip drivers.
>>
>> Sure, but now we have two copies of this. One in the Apple AIC and one
>> here. The obvious thing to do is:
>>
>>    1) Provide generic infrastructure
>>
>>    2) Convert AIC to use it
>
> Mark Z already has a converted version of AIC driver.
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-mux

You are submitting generic infrastructure which is supposed to go
through the relevant maintainer tree and not be funneled through some
riscv branch.

So obviously this very maintainer asks the predictable question and also
wants to see the Acked/Tested-by of the folks who maintain apple-AIC.

How is that supposed to work without integrating this patch into your
series and without having the apple-AIC folks on cc?

You did not start kernel development as of yesterday, right?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
