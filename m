Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A7C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWBZJ2Ilo4DX53zZfVKOlFiNQWDUnuH7YBQurZhFOho=; b=PhxNITlzuEXrC2
	wq0cEcrDHVULqUUVF+sN4Z7iXcXgmo6VenS7PvNFtDb3as+5Hj86A4VOTYTdsYBlwhUe2lQRLEJLE
	0kFFH3lBXhRdON26nuQXmammzRMUl9Xw4qfSDVZmtmIrMbzcGD86T1dLMsF6K1CKQNK2lwobjWONb
	aWMemRnME11zrliLJMubHmi2DOQLqMx6QxRFOmFEVn2Ni8l9aFqjk2VqliCaoR8h4O8AteGF9CPBQ
	ZT3qYjdw/XVPq8O+IIXJCHsQqwTFYgQCMyh0YdLXlCwMgBLqu+gPsQftLLvPcU/V/AqxBSkkqY3wG
	RXTEGIrsDfKgMzGv12JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjWm-0000000CSwo-3q0z;
	Tue, 16 Apr 2024 14:11:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjWg-0000000CSuk-2t8y
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 14:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91025CE10AE;
	Tue, 16 Apr 2024 14:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9EAC4AF0B;
	Tue, 16 Apr 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276652;
	bh=KrWX/mg6sB3IEZrckEkLG2wQSu4eyNuu4r2kX+Ke2dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imdJkKDYt4IFdH2ZckctnvXhpZbwxdxcgmUWwCvsrSIY1BBC3Zve/1ZAOnUB2VU7r
	 o4QWE3QJ+6HF2FSN6XVw50nGwR+64xUP/kb4KIAsCz1CUF/S04ZGbwS6f0cNjWe/6v
	 Rhj+mq5FCttUy+RNqV+pPUOjSwdGaS4b88AK/rycT+U6phHhDzlgDZf0O84XN0yt+1
	 e32QCFkUFHSakyxij42InYbVbscHOW6jZ387u0s5pPfaJqOT1VIUeRuM5INvBzmzCY
	 AXM8KInzJKNcTTY+bsVy+F9LdvQ2sltQNRfvKI1Wg3WsbTvJHSVVGU9ob7lxzLUD1E
	 RLYXnH8XFlEuA==
Date: Tue, 16 Apr 2024 09:10:49 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2] of: property: Add fw_devlink support for
 interrupt-map property
Message-ID: <20240416141049.GA2148267-robh@kernel.org>
References: <20240413091942.316054-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240413091942.316054-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_071111_141744_D544AF0E 
X-CRM114-Status: GOOD (  25.33  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 13, 2024 at 02:49:42PM +0530, Anup Patel wrote:
> Some of the PCI controllers (such as generic PCI host controller)
> use "interrupt-map" DT property to describe the mapping between
> PCI endpoints and PCI interrupt pins. This the only case where
> the interrupts are not described in DT.
> 
> Currently, there is no fw_devlink created based on "interrupt-map"
> DT property so interrupt controller is not guaranteed to be probed
> before PCI host controller. This affects every platform where both
> PCI host controller and interrupt controllers are probed as regular
> platform devices.
> 
> This creates fw_devlink between consumers (PCI host controller) and
> supplier (interrupt controller) based on "interrupt-map" DT property.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
> - Updated commit description based on Rob's suggestion
> - Use of_irq_parse_raw() for parsing interrupt-map DT property
> ---
>  drivers/of/property.c | 58 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index a6358ee99b74..67be66384dac 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1311,6 +1311,63 @@ static struct device_node *parse_interrupts(struct device_node *np,
>  	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
>  }
>  
> +static struct device_node *parse_interrupt_map(struct device_node *np,
> +					       const char *prop_name, int index)
> +{
> +	const __be32 *imap, *imap_end, *addr;
> +	struct of_phandle_args sup_args;
> +	struct device_node *tn, *ipar;
> +	u32 addrcells, intcells;
> +	int i, j, imaplen;
> +
> +	if (!IS_ENABLED(CONFIG_OF_IRQ))
> +		return NULL;
> +
> +	if (strcmp(prop_name, "interrupt-map"))
> +		return NULL;
> +
> +	ipar = of_node_get(np);
> +	do {
> +		if (!of_property_read_u32(ipar, "#interrupt-cells", &intcells))
> +			break;
> +		tn = ipar;
> +		ipar = of_irq_find_parent(ipar);
> +		of_node_put(tn);
> +	} while (ipar);

No need for this loop. We've only gotten here if 'interrupt-map' is 
present in the node and '#interrupt-cells' is required if 
'interrupt-map' is present.

> +	if (!ipar)
> +		return NULL;
> +	addrcells = of_bus_n_addr_cells(ipar);
> +	of_node_put(ipar);
> +
> +	imap = of_get_property(np, "interrupt-map", &imaplen);
> +	if (!imap || imaplen <= (addrcells + intcells))
> +		return NULL;
> +	imap_end = imap + imaplen;
> +
> +	sup_args.np = NULL;
> +	for (i = 0; i <= index && imap < imap_end; i++) {
> +		if (sup_args.np) {
> +			of_node_put(sup_args.np);
> +			sup_args.np = NULL;
> +		}
> +
> +		addr = imap;
> +		imap += addrcells;
> +
> +		sup_args.np = np;
> +		sup_args.args_count = intcells;
> +		for (j = 0; j < intcells; j++)
> +			sup_args.args[j] = be32_to_cpu(imap[j]);
> +		imap += intcells;
> +
> +		if (of_irq_parse_raw(addr, &sup_args))
> +			return NULL;
> +		imap += sup_args.args_count + 1;
> +	}

Doesn't this leak a ref on the last time the function is invoked? For 
example, if we have 2 entries and index is 2. We'll get index=1, but 
then exit because imap==imap_end. We need a put on index==1 node.

Look at my next branch where I've converted things to use __free() 
cleanups. I don't see it helping here as-is, but maybe when it is 
correct.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
