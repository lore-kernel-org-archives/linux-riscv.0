Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B4CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CkP7rDEl0ZsjFgHfpmmeVSPwugP1KV8tsvLtQ6JDyw=; b=xhexn2k5yyeIyy
	lI8MG38ERHJDZGAevJ870+R9OuEBlDkDAnvS1RTf2bLMKesUYpheDolBsfuqD+SXArMJTalGMNdwX
	gH5CgoB29/XJUcMqKetoDwiMXZ00dCG7V/fAMFifFZPzB6syl5b4UJ+Jc2OpQ6SThqCNYQcLRp9yd
	gVNLLnlNW9BZ3Ea/vhy7c1UqM6hc+pT1eQmyR5XZIGOW8icsMxmjMI0nLGQjt/CBUHNah2OBVTKFK
	EPts0EjH8IfyYN0e7tPyYY5ah48zTa3Y6oqfG0OkFHQURXTJIE/U5TlR4UslWMfVTCaNMYS7C4isJ
	XXBEHxT7Bt9LDQ5GPTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FQT-000000075ca-0jMN;
	Sun, 21 Sep 2025 08:28:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FQR-000000075br-1mIJ
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 08:28:04 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758443281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zd+C1azbDEt3Vz0ImeQyxblM1ChpI5F+d3T0ZRmmlY=;
	b=GsrVTsOxqKIg/ZCp3pN45SNUYSErdZ0EAY747oORQ2U7LzGsfw5uvTIi0jiCI7NAOCKL54
	RIHBqJYdv/bvoSRKFhNnscwonRjNHokJ440D0GhWFbsXdfeVYyK3AjOTawROhsM6kvBUg4
	yiE23i0txfBEim2aXazFWBtqn8xN/8T1WHebLcy6PTEkJXCJP+hnvjIRXxxMrN22m8njnW
	tDHtlxv+8dnp6KSQM7B9zfcImg8UTofoG8iOsTZaNLs2EXzt6jBIzbVm9XGZ7t49Slrkva
	+b/Glj7TJjRCv0UYdORckiCkNNQgLhI565BSK+RaDeaeZIjXy4/rmln5swsMng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758443281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Zd+C1azbDEt3Vz0ImeQyxblM1ChpI5F+d3T0ZRmmlY=;
	b=1Vt982O9XL6grD/TgQTBMrDh1K0kOl0pnLICT4p5yqtFxB1xxU9uQ9uER0HWNGToyNWAFl
	zUz66DO3CeeZpfBw==
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
 stable@vger.kernel.org, linux-riscv@lists.infradead.org, Jia Wang
 <wangjia@ultrarisc.com>
Subject: Re: [PATCH] irqchip/sifive-plic: avoid interrupt ID 0 handling
 during suspend/resume
In-Reply-To: <20250915162847.103445-1-lzampier@redhat.com>
References: <20250915162847.103445-1-lzampier@redhat.com>
Date: Sun, 21 Sep 2025 10:27:59 +0200
Message-ID: <87ikhc5hww.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_012803_606793_8E519CD3 
X-CRM114-Status: GOOD (  17.72  )
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

On Mon, Sep 15 2025 at 17:28, Lucas Zampieri wrote:

> To: linux-kernel@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Samuel Holland <samuel.holland@sifive.com>
> Cc: stable@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Thomas Gleixner <tglx@linutronix.de>

How is this Cc list relevant in explaining the changes here?

> According to the PLIC specification[1], global interrupt sources are
> assigned small unsigned integer identifiers beginning at the value 1.
> An interrupt ID of 0 is reserved to mean "no interrupt".
>
> The current plic_irq_resume() and plic_irq_suspend() functions incorrectly
> starts the loop from index 0, which could access the reserved interrupt ID
> 0 register space.
> This fix changes the loop to start from index 1, skipping the reserved
> interrupt ID 0 as per the PLIC specification.

s/This fix changes/Change/

And please separate this from the explanation above.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

> This prevents potential undefined behavior when accessing the reserved
> register space during suspend/resume cycles.
>
> Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
> Co-developed-by: Jia Wang <wangjia@ultrarisc.com>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
>
> [1] https://github.com/riscv/riscv-plic-spec/releases/tag/1.0.0

Link: .....

This [1] stuff is just annoying.

> ---
>  drivers/irqchip/irq-sifive-plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bf69a4802b71..1c2b4d2575ac 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -252,7 +252,7 @@ static int plic_irq_suspend(void)
>  
>  	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
>  
> -	for (i = 0; i < priv->nr_irqs; i++) {
> +	for (i = 1; i < priv->nr_irqs; i++) {

This lacks a comment explaining this non-obvious 'i = 1'.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
