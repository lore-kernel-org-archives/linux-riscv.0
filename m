Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C620C48297
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgPAQHQjeb8sC88HBHdTsXg5eJ9R42f7Mh0zeSOm6hA=; b=u1IuoUahj4nMYP
	C5al4Mon/YnrJ28LG5SHWkgxRFzPCA56Al+zuX48gvlPVUBd6g9miAFg6daD9vIYzq2MpMnUYm7UP
	ycfmjWHcM9Hy4CX0N1QHF+awPW9K3F5vs60iZqsybbPPlGeibbUb5zt4jQdW5ndKI6JJn7CROBkiL
	iP8t725kzV3sLCXVtSLGsbJ74xLT5b3OrSzS9WAd7y2Kgbbupax8fyYhPUnGF21LgxK2ddWb+onsw
	YcM0u2p89BryvekUEaMwaEoGgr0GjtScsPCmSD3Cqa5BrNp6jhtB4nXtrBBAtIjukfXt17sNiD6f8
	II+j6rF4ctjwgNvAyxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNV7-000000087is-38QK;
	Tue, 06 Feb 2024 15:36:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNV4-000000087gl-2PG8;
	Tue, 06 Feb 2024 15:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5EA6DCE1370;
	Tue,  6 Feb 2024 15:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CD6C433C7;
	Tue,  6 Feb 2024 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707233799;
	bh=j9C+lBswAShvcb5jDe8vo+UB5P1oAGzctN0185Tf1GM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EabWkIzzJ1ejuCSKuR7Tu4rv3kKcfeaK1x/Y5wysz33fjtha9SzsGdfB7//PYSnHh
	 xw18kDhot9J49SfviCYLfpQP6ZvmKylpf8eZKnmARq+lUaSci/dOHlOwYeWQy3ERIP
	 s3Zj+FGKjrIZQ+iHZT+M8Oo59xkiYWMUSYJxGhSWl7USlFdE9kJnPvzSJBxqRHtX+g
	 OCBwSAbL8Zn4lzePfhwwNYQ0qxM+7NuEkuU4U692NbN+1kHoT0zpxyr1nIRe85oajt
	 bbLcZhphGWvnBcDvlUxbjau5IQyLpd2S6aNZwjo/0N1aK8oRTVGM3DuGlXPRzTcA1Z
	 1ajhiD2cdt5dw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 19/25] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
In-Reply-To: <20240127161753.114685-20-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-20-apatel@ventanamicro.com>
Date: Tue, 06 Feb 2024 16:36:36 +0100
Message-ID: <87le7xy58b.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_073642_810861_7E67C286 
X-CRM114-Status: GOOD (  13.95  )
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

Anup Patel <apatel@ventanamicro.com> writes:

> The Linux platform MSI support allows per-device MSI domains so let
> us add a platform irqchip driver for RISC-V IMSIC which provides a
> base IRQ domain with MSI parent support for platform device domains.
>
> This driver assumes that the IMSIC state is already initialized by
> the IMSIC early driver.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

[...]

> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
> new file mode 100644
> index 000000000000..65791a6b0727
> --- /dev/null
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -0,0 +1,371 @@

[...]

> +static int imsic_irq_retrigger(struct irq_data *d)
> +{
> +	struct imsic_vector *vec = irq_data_get_irq_chip_data(d);
> +	struct imsic_local_config *local;
> +
> +	if (WARN_ON(vec == NULL))
> +		return -ENOENT;
> +
> +	local = per_cpu_ptr(imsic->global.local, vec->cpu);
> +	writel(vec->local_id, local->msi_va);

Change to writel_relaxed().


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
