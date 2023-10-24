Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE3FC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=M3Bit1jiEsDyNWIL/T+7MzJ8I3wvSmkZOlBgaMrGNu0=; b=yA9w+ot8+Xcqn1
	b/Tozi8SM97FQNOuwjqLDcjXcK5iuvFJyIb5a9tnBp8clZQaB4YnZrZPuRfwXn1drMj8NYDL5u/7R
	bjFMrVCfqCEe4Aqe0Qm5PWRvRLmoMnBT2ancLvRYdyNpD/c32yfqHwojSoIF7UWBWouCVVd5oyopY
	Rk/rfJgiH9qORn9Mf+3Yyd27V/IDwjqXzIIxWnqPByEAnCN3lTTNgaYX3VyTRIKYucGA7fNVIExva
	pLDBu0eep5hsioAO75ROOFMiLv+w10WBlOxJc9JZnCzF3RVAV3sXs/+iz/h1PfpXMN9E420w8QwkG
	EMqAQ3jL8VIhdxSxxNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLaQ-00Aca5-3A;
	Tue, 24 Oct 2023 17:53:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLaN-00AcYk-1f
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 17:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3279CE2773;
	Tue, 24 Oct 2023 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBD1C433C7;
	Tue, 24 Oct 2023 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698169976;
	bh=KUF7e+OQ3Cmah38SMoodhEwyDPQhM9qKHEvTf9JRMLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=szEiV2H2y6V69DSMmIjRsYCrp7HLNV/OYuRJb36ATW03CYFhw7JwfTZ7CE3WiiunT
	 IoMGGD+iW3gjfdM5coQnjSmuYY57kaitDfZG+vVWYuEmpF/W/TrEudTZP5J3hDKRpz
	 nTzMTiUHC3esNZ+ZqhB+LxOwRpxcbNgCohlcUegpEXuT3LncyOCpGY3CCJUvOThe/h
	 hyN+7Dv1qPOApEdX2Xif3Rbb72hl53NwpT/I2Bf0OHRQZaNG0VYw8ZDsqi4wy2zq2P
	 ixonxQTg+4Y7pKbQo8XdnBSzp/FiAHOgGLpH/jRqE2WRPdazUQFCecbe7oiv5iB+zU
	 xqeGovmWrEOTg==
Date: Tue, 24 Oct 2023 12:52:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v9 19/20] PCI: starfive: Add JH7110 PCIe controller
Message-ID: <20231024175253.GA1662387@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020104341.63157-20-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_105259_927066_03B807AA 
X-CRM114-Status: GOOD (  30.37  )
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

On Fri, Oct 20, 2023 at 06:43:40PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller platform
> driver codes, JH7110 with PLDA host PCIe core.

Wrap all your commit logs to fill about 75 columns (as suggested
before).  "git log" adds a few spaces, so if you fill to 75 columns,
the result will still fit in a default 80 column window.

> +config PCIE_STARFIVE_HOST
> +	tristate "StarFive PCIe host controller"
> +	depends on OF && PCI_MSI
> +	select PCIE_PLDA_HOST
> +	help
> +	  Say Y here if you want to support the StarFive PCIe controller
> +	  in host mode. StarFive PCIe controller uses PLDA PCIe
> +	  core.

Add blank line between paragraphs.  Wrap to fill 75-78 columns.

> +	  If you choose to build this driver as module it will
> +	  be dynamically linked and module will be called
> +	  pcie-starfive.ko

> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -6,14 +6,26 @@
>  #ifndef _PCIE_PLDA_H
>  #define _PCIE_PLDA_H
>  
> +#include <linux/phy/phy.h>

I don't think you need to #include this.  In this file you only use a
pointer to struct phy, so declaring the struct should be enough, e.g.,

  struct phy;

You will have to #include it in pcie-starfive.c where you actually
*use* phy, of course.

> +#define CONFIG_SPACE_ADDR			0x1000u

This looks like an *offset* that you add to ->bridge_addr.  Adding two
addresses together doesn't really make sense.

> +static int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
> +				      int where, int size, u32 value)
> +{
> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
> +		return PCIBIOS_BAD_REGISTER_NUMBER;

I think this should probably return PCIBIOS_SUCCESSFUL.  There's
nothing wrong with the register number; you just want to pretend that
it's hardwired to zero.  That means ignore writes and always return 0
for reads.

> +	return pci_generic_config_write(bus, devfn, where, size, value);
> +}
> +
> +static int starfive_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> +				     int where, int size, u32 *value)
> +{
> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
> +		return PCIBIOS_BAD_REGISTER_NUMBER;

Set *value to zero and return PCIBIOS_SUCCESSFUL.

> +	return pci_generic_config_read(bus, devfn, where, size, value);
> +}
> +
> +static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie, struct device *dev)

95% of this driver (and the rest of drivers/pci) is wrapped to fit in
80 columns, e.g.,

  static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie,
                                    struct device *dev)

> +	domain_nr = of_get_pci_domain_nr(dev->of_node);
> +
> +	if (domain_nr < 0 || domain_nr > 1)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get valid pcie id\n");

"id" is too generic and doesn't hint about where the problem is.
Update the message ("pcie id") to mention "domain" so it corresponds
with the source ("linux,pci-domain" from DT).

> +	ret = reset_control_deassert(pcie->resets);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
> +		dev_err_probe(dev, ret, "failed to resets\n");

"failed to ... resets" is missing a word.  "Failed to deassert
resets", I guess?

> +	/* Ensure that PERST has been asserted for at least 100 ms,
> +	 * the sleep value is T_PVPERL from PCIe CEM spec r2.0 (Table 2-4)
> +	 */

Use multiline comment formatting (also below):

  /*
   * Ensure ...
   */

> +	msleep(100);
> +	if (pcie->reset_gpio)
> +		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +
> +	/* As the requirement in PCIe base spec r6.0, system (<=5GT/s) must
> +	 * wait a minimum of 100 ms following exit from a conventional reset
> +	 * before sending a configuration request to the device.

Mention sec 6.6.1, where (I think) this value comes from.  Eventually
we should make a #define for this because it's not specific to any one
PCIe controller.

> +	msleep(100);
> +
> +	if (starfive_pcie_host_wait_for_link(pcie))
> +		dev_info(dev, "port link down\n");
> +
> +	return ret;

We know the value here, so return it explicitly:

  return 0;

> +static int starfive_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct starfive_jh7110_pcie *pcie = dev_get_drvdata(dev);
> +
> +	if (!pcie)
> +		return 0;

How could it happen that "pcie" is zero?  I think it could only happen
if there were a driver bug or a memory corruption.  Either way, we
should remove the check so we take a NULL pointer fault and find out
about the problem.

> +static int starfive_pcie_resume_noirq(struct device *dev)
> +{
> +	struct starfive_jh7110_pcie *pcie = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = starfive_pcie_enable_phy(dev, &pcie->plda);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		starfive_pcie_disable_phy(&pcie->plda);
> +		return ret;
> +	}
> +
> +	return ret;

  return 0;

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
