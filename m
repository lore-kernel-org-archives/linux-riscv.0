Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F09C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9hsf6vWEH44JgnDuEzIIYKvSOmunHdwve9F1ZCXpD4U=; b=quJCLKNqFF8jLL
	y4MpXpo3fixa96UXIutDqGHd0ytUSo3fUQzVs0oEg0w+Y9Z/j1uHtLK5T7f8bhgHMLFADPZQ8VVKr
	1UNpnF9rIHs9CgQjp+tBFUhA433Uz2QKQAkHYxed8p0T3PwmC84xNlbV+dV9NdwwpXlXXPQI83dZG
	pc1Yzi3YBkM+65xEIqJEJjJomg6hE8FVVTMZXFQY8I0V+DhDDVXe99zMbLVY6v5ZLDa7ZL05uL+WP
	jSubQCKVEpFAKNtlRIPZDrRcCR0AbMJRGlAZTaNa+DCNSv9JBOS4XRzEE2pS0PXQw1YTxGqoSmYhn
	0unThYEXrzr4UTJ/v7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAME-008CNa-1Q;
	Wed, 19 Jul 2023 16:48:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAMB-008CMI-26
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F288C6176F;
	Wed, 19 Jul 2023 16:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94CAC433C7;
	Wed, 19 Jul 2023 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689785334;
	bh=1HBKVki0O0wNw4bhjdzJwsp6wEBaBoJaQE76IJ1szgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=X7N2d/2yj1WdtbiS2soZExEPhMcqvLSQZB7JPhkGBwOS0KQAbfIVhRHHVOtWqE1W4
	 bqnZ5DmTLWWAcgya0/zqzoRPSuSBUYb1PPQF713srTHra/T2B0s4ao2xvIyXKYLbG8
	 1ogSJKWzjC0cPH91ZlqUuoTH7sifnzDyRqqY4lkbYtMnEDg/uRNZjra7JPNJa5xn5H
	 I/qkeXMNDlog4n3EmwXpZZ7/3WXAF4kjh/VD16ugzOUPOYSmBH0VjSyQAmJ/k+r6zX
	 kgeOcEHp7paSGLoPh9D7OmG1DZSiDwz9b2axobKpjT5hh+5px6AknnKCSIf5rQKixF
	 GEatizIpbiXeA==
Date: Wed, 19 Jul 2023 11:48:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230719164851.GA505840@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719102057.22329-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_094855_838417_C709F498 
X-CRM114-Status: GOOD (  25.29  )
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

On Wed, Jul 19, 2023 at 06:20:56PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller platform
> driver codes.

Rewrap all the commit logs to fill 75 columns or so.

>  #define PCIE_PCI_IDS_DW1		0x9c
> -
> +#define  IDS_CLASS_CODE_SHIFT		16
> +#define PCI_MISC			0xB4

Surrounding code uses lower-case hex.  Make it all match.

> +#define STG_SYSCON_AXI4_SLVL_ARFUNC_MASK	GENMASK(22, 8)
> +#define STG_SYSCON_AXI4_SLVL_ARFUNC_SHIFT	8

When practical, use FIELD_GET() and FIELD_PREP() to avoid the need for
*_SHIFT macros.

> +struct starfive_jh7110_pcie {
> +	struct plda_pcie	plda;
> +	struct reset_control *resets;
> +	struct clk_bulk_data *clks;
> +	struct regmap *reg_syscon;
> +	struct gpio_desc *power_gpio;
> +	struct gpio_desc *reset_gpio;
> +
> +	u32 stg_arfun;
> +	u32 stg_awfun;
> +	u32 stg_rp_nep;
> +	u32 stg_lnksta;
> +
> +	int num_clks;

If you indent one member with tabs, e.g., "struct plda_pcie        plda",
they should all be indented to match.

> + * The BAR0/1 of bridge should be hidden during enumeration to
> + * avoid the sizing and resource allocation by PCIe core.
> + */
> +static bool starfive_pcie_hide_rc_bar(struct pci_bus *bus, unsigned int  devfn,
> +				      int offset)
> +{
> +	if (pci_is_root_bus(bus) && !devfn &&
> +	    (offset == PCI_BASE_ADDRESS_0 || offset == PCI_BASE_ADDRESS_1))
> +		return true;
> +
> +	return false;
> +}
> +
> +int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
> +			       int where, int size, u32 value)
> +{
> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
> +		return PCIBIOS_BAD_REGISTER_NUMBER;

I think you are trying present BARs 0 & 1 as unimplemented.  Such BARs
are hardwired to zero, so you should make them behave that way (both
read and write).  Many callers of config accessors don't check the
return value, so I don't think it's reliable to just return
PCIBIOS_BAD_REGISTER_NUMBER.

> +static int starfive_pcie_is_link_up(struct starfive_jh7110_pcie *pcie)
> +{
> +	struct device *dev = pcie->plda.dev;
> +	int ret;
> +	u32 stg_reg_val;
> +
> +	/* 100ms timeout value should be enough for Gen1/2 training */
> +	ret = regmap_read_poll_timeout(pcie->reg_syscon,
> +				       pcie->stg_lnksta,
> +				       stg_reg_val,
> +				       stg_reg_val & DATA_LINK_ACTIVE,
> +				       10 * 1000, 100 * 1000);
> +
> +	/* If the link is down (no device in slot), then exit. */
> +	if (ret == -ETIMEDOUT) {
> +		dev_info(dev, "Port link down, exit.\n");
> +		return 0;
> +	} else if (ret == 0) {
> +		dev_info(dev, "Port link up.\n");
> +		return 1;
> +	}

Please copy the naming and style of the "*_pcie_link_up()" functions
in other drivers.  These are boolean functions with no side effects,
including no timeouts.

Some drivers have "*wait_for_link()" functions if polling is needed.

> +		return dev_err_probe(dev, ret,
> +			"failed to initialize pcie phy\n");

Driver messages should match (all capitalized or none capitalized).

> +	/* Enable root port */

Superfluous comment, since the function name says the same.

> +	plda_pcie_enable_root_port(plda);

> +	/* Ensure that PERST has been asserted for at least 100 ms */
> +	msleep(300);
> +	gpiod_set_value_cansleep(pcie->reset_gpio, 0);

At least 100 ms, but you sleep *300* ms?  This is probably related to
https://lore.kernel.org/r/20230718155515.GA483233@bhelgaas

Please include a comment with the source of the delay value.  I assume
it's T_PVPERL and T_PERST-CLK from the PCIe CEM spec.  This way we can
someday share those #defines across drivers.

> +#ifdef CONFIG_PM_SLEEP
> +static int __maybe_unused starfive_pcie_suspend_noirq(struct device *dev)

I think you can dispense with some of these #ifdefs and the
__maybe_unused as in
https://lore.kernel.org/all/20220720224829.GA1667002@bhelgaas/

> +{
> +	struct starfive_jh7110_pcie *pcie = dev_get_drvdata(dev);
> +
> +	if (!pcie)
> +		return 0;

How can this happen?  If we're only detecting memory corruption, it's
not worth it.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
