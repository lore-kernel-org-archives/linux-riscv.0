Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF94C7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8lnOp9ZLCh83Ceu0NMFvS0ZClBhxC5yqjg2dEg6VxE=; b=zbZOcp+qR+7GKU
	p+D7HHriurU21d5BVkvzHt4erfIHeToJGGWj/O+MhNzDbCHfikP+AnG1HOcF/a3SWqEsAMdChf/0W
	pSqhSAIf5BM/6ZcJVPKhPvZfqGlSlQrWoUKG2/oGeBFcxLay7LpXi/0JC06rqnokThZjt8fUDdEwT
	QwoBvbbIdMueWsA6yRP0i+i3kvisoZmeqDpGpbXvDLZ+59W5cgknaN5/c0Q2azZhvTAUrznx9Mb9Z
	SfZRdCeZH8+JL0+FRRzxPNeHY+cdGxsOdXRfbo7QOe/3upIQNYJVgnVAAJdo5oi66fUr/AIEbGVOC
	gg6IlmTxnOg5oWUr4LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KNC-00AAKN-1f;
	Thu, 08 Jun 2023 18:28:38 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KNA-00AAJ2-0X
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 18:28:37 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33b1da9a8acso4322825ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 11:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686248911; x=1688840911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6AjDwR0ptMSx+JUF8hl+KxGxvEo5Yse4u2Qkil1oAQ=;
        b=ayX7uANSb39CD+qcxZcsr3kmjwEPfrHYzeXS/iEfjBVAUFW0o0fxKh5mT6R5qNHaZA
         7i4X7M4YY3noYRgOhw/6d8wNn6gK1E2hVGdPrUTA++T8VDCbjze0QyN5Pf/EbALI8CHL
         adkvryikSNmPh6x/Snqk4G6fjObrAcHgVhzF17qe/uu31Y/L0mRZi//E6mwJNAdwZ8eE
         1e2g0dFF2shsHf284ACz5IU5BJtkxh8QqayJS7osp2KAgj+keySziqUF7hUDVEe5OLly
         Wu2i3KNcjxLmUlVQDo+rg6fiFSoFtm6K/g9maBd+vqb7YgyUEYXFoP/i6k0U2v5P87eu
         dL/Q==
X-Gm-Message-State: AC+VfDzRRNSHUg20v2D3J06edfawRWuBS8/eaa7NtWh6tMaIvHP6Q1Bv
	D1GIkWVYTmy5xju8jJh2Gg==
X-Google-Smtp-Source: ACHHUZ6ZgczaCvQ9WREBX6XZ35ncxDkUp3kUdO8Gb7NQSIE0NE4s5OeN57L3IH1YqN0JwR5VbNdOZQ==
X-Received: by 2002:a92:c908:0:b0:33b:abaf:d493 with SMTP id t8-20020a92c908000000b0033babafd493mr12283395ilp.16.1686248911076;
        Thu, 08 Jun 2023 11:28:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l15-20020a92280f000000b0033842c3f6b4sm541876ilf.83.2023.06.08.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 11:28:30 -0700 (PDT)
Received: (nullmailer pid 3198330 invoked by uid 1000);
	Thu, 08 Jun 2023 18:28:28 -0000
Date: Thu, 8 Jun 2023 12:28:28 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Saravana Kannan <saravanak@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the
 interrupt controller DT nodes
Message-ID: <20230608182828.GA3183987-robh@kernel.org>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508142842.854564-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_112836_203246_206FE3C3 
X-CRM114-Status: GOOD (  20.36  )
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

+Saravana

On Mon, May 08, 2023 at 07:58:33PM +0530, Anup Patel wrote:
> The RISC-V APLIC interrupt controller driver is a regular platform
> driver so we need to ensure that it is probed as soon as possible.
> To achieve this, we mark the interrupt controller device nodes with
> FWNODE_FLAG_BEST_EFFORT (just like console DT node).
> 
> Fixes: 8f486cab263c ("driver core: fw_devlink: Allow firmware to mark devices as best effort")

It is good practice to Cc the commit author of what you are fixing.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/of/irq.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 174900072c18..94e1d9245cff 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -535,6 +535,16 @@ void __init of_irq_init(const struct of_device_id *matches)
>  	INIT_LIST_HEAD(&intc_desc_list);
>  	INIT_LIST_HEAD(&intc_parent_list);
>  
> +	/*
> +	 * We need interrupt controller platform drivers to work as soon

If it's platform drivers/devices you care about, then perhaps this 
should be done when platform devices are created.

> +	 * as possible so mark the interrupt controller device nodes with
> +	 * FWNODE_FLAG_BEST_EFFORT so that fw_delink knows not to delay
> +	 * the probe of the interrupt controller device for suppliers
> +	 * without drivers.
> +	 */
> +	for_each_node_with_property(np, "interrupt-controller")

This function only operates on nodes matching 'matches', but this 
operates on everything.

It does make sense that if we init an interrupt controller here, then we 
will surely want to probe its driver later on. So maybe just move 
setting FWNODE_FLAG_BEST_EFFORT within 
for_each_matching_node_and_match() below.

> +		np->fwnode.flags |= FWNODE_FLAG_BEST_EFFORT;
> +
>  	for_each_matching_node_and_match(np, matches, &match) {
>  		if (!of_property_read_bool(np, "interrupt-controller") ||
>  				!of_device_is_available(np))
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
