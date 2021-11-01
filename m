Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5580BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 13:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9779A60FE8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 13:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9779A60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQUx20uhnJvlUGxhFVq/tDIKcqH/zjd1XIaxY/U46Fg=; b=YVwcbq4uh8t9zB
	dnaRbph0GUhCIanNtP+rwkk13ACWQOJ1gD/7nxY0sp8glKq8XTLfkLD5UpT7C+DrPSmESbX4+kvkA
	XIpjGLKIR4QMvzOJvABbI861+xOQXrW1Sesl40baURzbbTnJGZIFI91bJVKg9ykaxlt6RHBSzEbEa
	uYsImLbCNJHHRvCRTmxycdEqQ9qQHsgvKEHRZ0c6Yk4A3tACygGQxLZpTVNqIr9kFy8GgOcHeTnYT
	11vpLc0NUQIFsWdyBPrj9faedoDZsKywFv5htJFjy5KnYOr6aZihptzRZNOze4RRz0GfXG31eG9OV
	QDf7GT9lXDlSMCtnsStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhXef-00GUg0-TS; Mon, 01 Nov 2021 13:47:17 +0000
Received: from forward501o.mail.yandex.net ([2a02:6b8:0:1a2d::611])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhXec-00GUfJ-8K
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 13:47:16 +0000
Received: from iva2-4b68470c0b40.qloud-c.yandex.net
 (iva2-4b68470c0b40.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1409:0:640:4b68:470c])
 by forward501o.mail.yandex.net (Yandex) with ESMTP id 86C4D45C4585;
 Mon,  1 Nov 2021 16:47:07 +0300 (MSK)
Received: from iva1-dcde80888020.qloud-c.yandex.net
 (2a02:6b8:c0c:7695:0:640:dcde:8088 [2a02:6b8:c0c:7695:0:640:dcde:8088])
 by iva2-4b68470c0b40.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 J3jYM5vWaW-l6EK0A90; Mon, 01 Nov 2021 16:47:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1635774427; bh=962D/PuwhXZcYiC076wE1wmjc0fGppTG5dBkdPxfivw=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=E47ZEfNJIbWeG0JpbkXEFQvK+xQjrvlLF6n0u+aHGDF4KkBHMpCOwemuzs6tyF/La
 X70OC0bONK3wt4d4ek75KZKEbvX27v4GU+RLsif79UWoO1LKgDuAHwtmQD4MEnjf33
 9CA8d9lc22csWzGZZFXVBJ2g9474oagCckCaExOI=
Authentication-Results: iva2-4b68470c0b40.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 Srg9LL8h3E-l5M4RZm3; Mon, 01 Nov 2021 16:47:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Mon, 1 Nov 2021 16:47:05 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: guoren@kernel.org
Cc: anup@brainfault.org, atish.patra@wdc.com, maz@kernel.org,
 tglx@linutronix.de, palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [PATCH V6] irqchip/sifive-plic: Fixup EOI failed when masked
Message-ID: <20211101164705.4e07fdb9@redslave.neermore.group>
In-Reply-To: <20211101131736.3800114-1-guoren@kernel.org>
References: <20211101131736.3800114-1-guoren@kernel.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_064714_691939_6ADCBBF4 
X-CRM114-Status: GOOD (  28.56  )
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

On Mon,  1 Nov 2021 21:17:36 +0800
guoren@kernel.org wrote:

Hi Guo Ren,

Thank you for your patch.

May be it should be applied to stable ?

Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>

> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the
> driver, only the first interrupt could be handled, and continue irq
> is blocked by hw. Because the riscv plic couldn't complete masked irq
> source which has been disabled in enable register. The bug was
> firstly reported in [1].
> 
> Here is the description of Interrupt Completion in PLIC spec [2]:
> 
> The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the
> claim/complete register. The PLIC does not check whether the
> completion ID is the same as the last claim ID for that target. If
> the completion ID does not match an interrupt source that is
> currently enabled for the target, the ^^ ^^^^^^^^^ ^^^^^^^
> completion is silently ignored.
> 
> [1]
> http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> [2]
> https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
> 
> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> Cc: incent Pelletier <plr.vincent@gmail.com>
> 
> ---
> 
> Changes since V6:
>  - Propagate to plic_irq_eoi for all riscv,plic by Nikita Shubin
>  - Remove thead related codes
> 
> Changes since V5:
>  - Move back to mask/unmask
>  - Fixup the problem in eoi callback
>  - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
>  - Rewrite comment log
> 
> Changes since V4:
>  - Update comment by Anup
> 
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add sifive_plic_chip and thead_plic_chip for difference
> 
> Changes since V2:
>  - Add a separate compatible string "thead,c9xx-plic"
>  - set irq_mask/unmask of "plic_chip" to NULL and point
>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
>  - Add a detailed comment block in plic_init() about the
>    differences in Claim/Completion process of RISC-V PLIC and C9xx
>    PLIC.
> ---
>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c index cf74cfa82045..259065d271ef
> 100644 --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
>  {
>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>  
> -	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	if (irqd_irq_masked(d)) {
> +		plic_irq_unmask(d);
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +		plic_irq_mask(d);
> +	} else {
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	}
>  }
>  
>  static struct irq_chip plic_chip = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
