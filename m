Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6DCC52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeHapOZXaIOODF/69QwsaNDKydTYarU6XFdQ2b0r1T4=; b=Aov8KSOFdvGyXs
	PlOaIpGgYRvXj9WowgUJpMK2nnIsvn9TinhV0pnipi4/FM4wnb702iooETaKBpK1pHCr2xZYGWpNA
	MhnvPbBK1x/X+70uTn3FfHsaJNlqQM/LwMb7vQ2zMi+sAtgMjN8JgmI00gco9ph1Pi9EL6+eplIIo
	XppgTRFpLNfFkyhdx3mNOeQm7wR5ivMXk1bL5p++CqVv/Gg23pMAWOPJ1X9RQM7W8IwnjwP9cYNT0
	P16XOGUxtiPCNEsvljWrbJZZfNCFf2xx3Q6F5KVcxHMN9nRpKbWpsHheKclVzu60YLUcYPgoyqEfh
	dDqKnzp9mgF9N3uWsxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sficQ-0000000GoKz-0FSx;
	Sun, 18 Aug 2024 16:19:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfibj-0000000GoHT-2EY1;
	Sun, 18 Aug 2024 16:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A91A461008;
	Sun, 18 Aug 2024 16:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB6EC32786;
	Sun, 18 Aug 2024 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997898;
	bh=wH/q17EcEM1yaX/QyJjRxmoKQTkpYh+1vI+c83h+e30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctyjVRbNpRe4lev974iUalRA4DqpO46Do2yiZunEtwRcmp3yo0ZHP6kHW3VrFU+FV
	 Y4I1tIa4iTf9P+SZzFQpCvf/mSt68b1PGIzWBBf0Z+ufxM/mL+y1jH3m1lCi2mBHSL
	 acxPNNUBHzs0zHkl/S1n+yKJ01mzije5DlWPLPdSwF5BrpoJLKHFzmff/ikaCrVp/b
	 I2TnEjvvw7LFo8cBqIRnoG3dvxplAtjz5Zro+jyajxgpZv/odJfk0uUCEX8gTazYhs
	 5lT1QL5ZE2i317aWsnN2AOryK3AvXWP5Aj5gQrSdtWmnHmNK7EVBmw9ENpRxhLL8dq
	 dE+NsgFLVlhJg==
Date: Sun, 18 Aug 2024 10:18:16 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com,
	saravanak@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240818161816.GA173148-robh@kernel.org>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817074107.31153-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_091819_701060_119474C6 
X-CRM114-Status: GOOD (  28.40  )
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

On Sat, Aug 17, 2024 at 09:41:08AM +0200, Andrew Jones wrote:
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
> 
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
> 
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. The code removal also requires changing
> to of_parse_phandle_with_optional_args() in order to ensure the
> legacy (but compatible) use of 'msi-parent' remains supported. This
> not only simplifies the code but also resolves an issue with PCI
> devices finding their MSI controllers on riscv, as the riscv,imsics
> binding requires '#msi-cells=<0>'.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v3:
>  - switch to of_for_each_phandle() to further cleanup/simplify the
>    code [Rob]
> v2:
>  - switch to of_parse_phandle_with_optional_args() to ensure the
>    absence of #msi-cells means count=0
> 
>  drivers/of/irq.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index c94203ce65bb..b74a3f5fc4e2 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
>   * @np: device node for @dev
>   * @token: bus type for this domain
>   *
> - * Parse the msi-parent property (both the simple and the complex
> - * versions), and returns the corresponding MSI domain.
> + * Parse the msi-parent property and returns the corresponding MSI domain.
>   *
>   * Returns: the MSI domain for this device (or NULL on failure).
>   */
> @@ -718,33 +717,15 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
>  				     struct device_node *np,
>  				     enum irq_domain_bus_token token)
>  {
> -	struct device_node *msi_np;
> +	struct of_phandle_iterator it;
>  	struct irq_domain *d;
> +	int err;
>  
> -	/* Check for a single msi-parent property */
> -	msi_np = of_parse_phandle(np, "msi-parent", 0);
> -	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
> -		d = irq_find_matching_host(msi_np, token);
> -		if (!d)
> -			of_node_put(msi_np);
> -		return d;
> -	}
> -
> -	if (token == DOMAIN_BUS_PLATFORM_MSI) {
> -		/* Check for the complex msi-parent version */
> -		struct of_phandle_args args;
> -		int index = 0;
> -
> -		while (!of_parse_phandle_with_args(np, "msi-parent",
> -						   "#msi-cells",
> -						   index, &args)) {
> -			d = irq_find_matching_host(args.np, token);
> -			if (d)
> -				return d;
> -
> -			of_node_put(args.np);
> -			index++;
> -		}
> +	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> +		d = irq_find_matching_host(it.node, token);
> +		if (d)
> +			return d;
> +		of_node_put(it.node);

Pretty sure the iterator does this for you. I can fixup when applying.

I plan to tag for stable too.

Shout if you disagree with either of these.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
