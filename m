Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C06C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmVWmf40KsYsuzTu8vgOdwnbxKRAkKVVr9iEO1g1jPY=; b=nrbYPANWUscRED
	DNQv6bq6R+/pYM+AO2sltr4EXNbxcvefTIPe/0+j5a3nvFkc/b52fp2x8UKM7JQSnfzN0vppOOy1c
	3lD2oRGhD1KunHGPdZZOCUmEwuORDc8uphynYYw8XHLbjnK+hoq6gcdqbUzLQooq3B7Oi4EC6KquI
	2+6SohuCzCMhhNogRWTB9QyUmriHubQvFUnbAS0bjadawoc3XDR/cpxreXjRl6hDiFdctlSlCDBVs
	aARb+mzjM0897sPV4982xOxrbKPHS/vr83S72QJbFMhysJxbSYpB4aKrTTfg/d8jSvb8o+vHgO5aA
	fw4LK4ayTrHcNuWcsHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFo7-0098Cw-1f;
	Wed, 19 Jul 2023 22:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFo2-0098BX-1E
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 22:38:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 320186185C;
	Wed, 19 Jul 2023 22:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CB7C433C8;
	Wed, 19 Jul 2023 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689806280;
	bh=EYIsH0FwwvOCjfNVFrFmOo04loqux7S4hzWOngeGK28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2ZZlkaqbXqF5tCghFIQGbme+X094m6Q36ydxZchLOHFmaoFOxrTqy3gTmsntLEf5
	 40k1+d//K6T+P96Ud5fThiaE37vYNP4ib2jS8rgwNxSRD7qfnHQNSf+ssRSncrdRxw
	 q3nnYllnDdl4NTIos9eUrE7RVICCv+PhuhqI/WQSC6kzkVIDK/e841OpV+ZDsUGWib
	 vNvIhkE0qe20iOcT1LfrIkD7/DP2L1rwnALZsSNX8o1CpevEAtmgdYjMnYfbohFD6E
	 iFl1IZ0bArsBaQuBEjMYCBu/mTC6fczJSwdEa8oVp41EUGFboEBxWZm1ps8uFj7wQs
	 lGCMrdQHjymCw==
Received: (nullmailer pid 897856 invoked by uid 1000);
	Wed, 19 Jul 2023 22:37:58 -0000
Date: Wed, 19 Jul 2023 16:37:58 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 02/14] of: property: Add fw_devlink support for
 msi-parent
Message-ID: <20230719223758.GA892809-robh@kernel.org>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
 <20230719113542.2293295-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719113542.2293295-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_153803_787302_1F189EB4 
X-CRM114-Status: GOOD (  23.23  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 19, 2023 at 05:05:30PM +0530, Anup Patel wrote:
> This allows fw_devlink to create device links between consumers of
> a MSI and the supplier of the MSI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/of/property.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index ddc75cd50825..e4096b79a872 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1325,6 +1325,37 @@ static struct device_node *parse_interrupts(struct device_node *np,
>  	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
>  }
>  
> +static struct device_node *parse_msi_parent(struct device_node *np,
> +					    const char *prop_name, int index)
> +{
> +	struct of_phandle_args sup_args;
> +	struct device_node *msi_np;
> +
> +	if (!IS_ENABLED(CONFIG_OF_IRQ))
> +		return NULL;

Why do we need this? Sparc is not going to have MSI properties to begin 
with. I guess it saves a little bit of code. Though Sparc doesn't need 
any of this file. Or maybe there's a better kconfig symbol to use here 
if MSIs are not supported?

> +
> +	if (strcmp(prop_name, "msi-parent"))
> +		return NULL;
> +
> +	msi_np = of_parse_phandle(np, prop_name, 0);
> +	if (msi_np) {
> +		if (!of_property_read_bool(msi_np, "#msi-cells")) {
> +			if (index) {
> +				of_node_put(msi_np);
> +				return NULL;
> +			}
> +			return msi_np;
> +		}
> +		of_node_put(msi_np);
> +	}
> +
> +	if (of_parse_phandle_with_args(np, prop_name, "#msi-cells", index,
> +				       &sup_args))
> +		return NULL;
> +
> +	return sup_args.np;
> +}
> +
>  static const struct supplier_bindings of_supplier_bindings[] = {
>  	{ .parse_prop = parse_clocks, },
>  	{ .parse_prop = parse_interconnects, },
> @@ -1359,6 +1390,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>  	{ .parse_prop = parse_regulators, },
>  	{ .parse_prop = parse_gpio, },
>  	{ .parse_prop = parse_gpios, },
> +	{ .parse_prop = parse_msi_parent, },
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
