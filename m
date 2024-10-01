Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF33DCE7D10
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHGunUZZH75XTFc0pm8tZXOrB2OkOcjf9ygAh6g99R4=; b=WTq+uVmt2HQQEX
	lg4QAXnKwg5Z5JL40Odumk5PoANWexbgJBS+HbiArwfLGMicMpR6cK3H5+2qQANZ99OWn9fFGOSw/
	AOW+Kd7/SXU1IbsfWpA8LCHNGw6cAjXolWDjVUuyGw7/uu3FBCexwpp8aN60mSJE5ZJ5bbpwvDhIb
	fHhpBOoMRdy+veKlyooanjyZdTJQcoFyBKexdS86eYhL27SuIG7q1BaoWiMQWg14CdqwV906deM6Q
	CFCB+2cx51Xa1HqCCVEMtNfTcoj/65hiTYaK6FG2ZIcRtRqWXbfm4b28ElzH4s5KId3qQBNB1okAd
	4T3v2rRVaeTJXjnl9pGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svatt-00000002Ubv-3kTR;
	Tue, 01 Oct 2024 11:18:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svasw-00000002UMh-3G3g
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:17:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DB1E240007;
	Tue,  1 Oct 2024 11:17:38 +0000 (UTC)
Message-ID: <a29ee3f5-9f2f-4278-94be-72f05bc9cf6a@ghiti.fr>
Date: Tue, 1 Oct 2024 13:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sifive-plic: Fix error codes
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anup Patel <apatel@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_041742_987627_5FF94F2C 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Charlie,

On 04/09/2024 01:36, Charlie Jenkins wrote:
> Set error to -ENOMEM if kcalloc() fails or if irq_domain_add_linear()
> fails inside of plic_probe().
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202409031122.yBh8HrxA-lkp@intel.com/


I found the following Fixes tag:

Fixes: 4d936f10ff80 ("irqchip/sifive-plic: Probe plic driver early for 
Allwinner D1 platform")


> ---
>   drivers/irqchip/irq-sifive-plic.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 2f6ef5c495bd..0b730e305748 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -626,8 +626,10 @@ static int plic_probe(struct fwnode_handle *fwnode)
>   
>   		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
>   					       sizeof(*handler->enable_save), GFP_KERNEL);
> -		if (!handler->enable_save)
> +		if (!handler->enable_save) {
> +			error = -ENOMEM;


This is correct.


>   			goto fail_cleanup_contexts;
> +		}
>   done:
>   		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
>   			plic_toggle(handler, hwirq, 0);
> @@ -639,8 +641,10 @@ static int plic_probe(struct fwnode_handle *fwnode)
>   
>   	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,
>   						   &plic_irqdomain_ops, priv);
> -	if (WARN_ON(!priv->irqdomain))
> +	if (WARN_ON(!priv->irqdomain)) {
> +		error = -ENOMEM;


Here though I found drivers that return either ENODEV 
(https://elixir.bootlin.com/linux/v6.11/source/drivers/irqchip/irq-gic.c#L1210) 
or ENOMEM 
(https://elixir.bootlin.com/linux/v6.11/source/drivers/irqchip/irq-imx-mu-msi.c#L229).

Before the commit I mentioned above, we used to return ENOMEM. IMHO it's 
not a big deal as long as we return something different from 0 in that 
case, I just mention it if someone thinks differently.

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And I would also add:

Cc: stable@vger.kernel.org

Thanks,

Alex


>   		goto fail_cleanup_contexts;
> +	}
>   
>   	/*
>   	 * We can have multiple PLIC instances so setup global state
>
> ---
> base-commit: 6804f0edbe7747774e6ae60f20cec4ee3ad7c187
> change-id: 20240903-correct_error_codes_sifive_plic-4611f59291df

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
