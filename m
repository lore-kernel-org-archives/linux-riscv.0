Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A96AC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYE4IH9FZRRmrwHn7B5YNWdPaTbI0cwkIbwfksnkAA4=; b=sCk+m8BfGb3NBJ
	ETd1aqr/+CTOwESa3C3VvXwjT8JDGwtwmui45g1cj7wLRdhrOsrF3I1TLdoCRyo2fi+vxg/IYbK+0
	jk+PZSR9VdwAvIYxMqHSrctKKXN8QSZ2k3Lr4wONI9/cwyChkGGlIvc+M+wsipurM/wd/J8Sen7wc
	dricmWPW2cSONVaT2KGgJxUiv9Wr/3CezvH34lXgoqXARLFOaEue1vfSNQ7peWfaYOTuo++St2Wvb
	5lAt6Z85uaf+ykUEuK4aD51qf8Vu+AUEjZWYps31u9pb7QlzoaGtBOtrc6gkrAfWoP2C1i7mbqPQh
	VBHBn3EajfGXEZW/d/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXyt-00BTk0-1U;
	Fri, 11 Aug 2023 19:39:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXyq-00BTjQ-1R
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 19:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C78BF638D0;
	Fri, 11 Aug 2023 19:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC39FC433C7;
	Fri, 11 Aug 2023 19:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691782767;
	bh=KlwAT+8owcpMdnQoWuulieq8nFxzS2oyPEO3DiXeFW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3nihHLjbHFVoqzDHPMTR4ppsDou+K/fjjJuT5oZdZMs/DYOIS1/IwrEUdK5EoDrN
	 JeHk9ib8CYs5KMnBmxm51fYJAZKclwJqM5Lx90sZk0+LY+h/dzVZe78pBRPAPoAOLB
	 3vOc2yoXidHXB0O/tDsEFbgijkGn5nAbzqJwmpAEUAM/TUBKfR+HAQGycUJbcsZWWP
	 5I/chqhcVJFEXjX6EdiUT0OppW+ZkTmOzYpxR32+5gm0B/+9lf3tuYxS6E2Fkp7ZaH
	 CNr98EKkPM4glQLedBrXXxlgprlRTUnrsdCa8Ia6/NWMg/MTkgKcr9ITk34gxMEK+D
	 8M6XHbiI449Rw==
Received: (nullmailer pid 4003553 invoked by uid 1000);
	Fri, 11 Aug 2023 19:39:24 -0000
Date: Fri, 11 Aug 2023 13:39:24 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 02/15] of: property: Add fw_devlink support for
 msi-parent
Message-ID: <20230811193924.GA3997669-robh@kernel.org>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802150018.327079-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_123928_588010_8A229BB7 
X-CRM114-Status: GOOD (  22.04  )
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

On Wed, Aug 02, 2023 at 08:30:05PM +0530, Anup Patel wrote:
> This allows fw_devlink to create device links between consumers of
> a MSI and the supplier of the MSI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/of/property.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index ddc75cd50825..bc20535deed7 100644
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
> +	if (IS_ENABLED(CONFIG_SPARC))
> +		return NULL;
> +
> +	if (strcmp(prop_name, "msi-parent"))
> +		return NULL;
> +
> +	msi_np = of_parse_phandle(np, prop_name, 0);
> +	if (msi_np) {
> +		if (!of_property_read_bool(msi_np, "#msi-cells")) {

Use of_property_present() to check presence.

However, this check is wrong. #msi-cells is optional and assumed to be 0 
if not present. There's another flavor of of_parse_phandle_with_args() 
that allows specifying a default cell count, so I think you can get rid 
of all this checking.

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
