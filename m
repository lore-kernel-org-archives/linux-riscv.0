Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF9D116F3
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KBsfrXz0I5qDadiUv3k184iBCTzxX/ZxmQd3fbNjpoM=; b=38uWGhDgNDTZr/
	EfW/IAOI7lSfphL7MyI30JDkMV2WbnJ4XgHmKZRagS9G1bNYctqkuOuXxKVmb/NPL/XdT+NG0+5X+
	REp/amezvbFJkmuwmah8CMS+EBxHzu5QT+xMxn5Pw4GMlL80SySJy34LMLiG5rJxFQT6dEsnz/+MS
	1DSFwhoG+BJ82YRWreDmEBuFSP+UCJoH7Fn3KhYG7KFzb2F6ODrefI8D83FXp0YuXBv8vxPgqHlj8
	kC7E1OPHBhXUJDs+H+sHyenwVFlPKetRff6AjPceb1eHYGFdPCoxZ6id4hKWNOOaSwNA8fHRHexhb
	MrdBzPtuPnGMqiIDA+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAt0-00000004ViP-2KSz;
	Mon, 01 Dec 2025 20:52:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAsy-00000004Vi2-0HYL
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 20:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3537439B9;
	Mon,  1 Dec 2025 20:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CEDC4CEF1;
	Mon,  1 Dec 2025 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764622357;
	bh=NfUf5GelDLoSxFZm9Aq5VnHYa1989YAat0QJXEF+m1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=flM4qaUtRnVkA245t9hWpzI2WtWTW69oK283WqPcLVlPcVRBC8VVXtARaL1n1BBYa
	 3s40COrlLhU6Nm61pQBCxfJGKVp0KrtKP7H3Iboto596cplV0whgs+D1f74O1m6cEh
	 x435DaCiChed1BgzkqsQBSanWcecFfio5HAbEQGpt0lF9r4wuHdd1sTi4qgrRytT6E
	 7KZv+M64NSKvLqktC0vj13JaGJtUaxNkTSJSiPI33XmnenZfGBp3227bmicDm/TUkr
	 ZGc7wyChoCp3+sB6qW2KPkQJHzp/t8c0a/I4HDsMvrQsU4DSE8GQ88zrhwoVeUGF07
	 usGTycGmGlGYQ==
Date: Mon, 1 Dec 2025 14:52:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Message-ID: <20251201205236.GA3023515@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125075604.69370-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_125240_155649_E183E2A7 
X-CRM114-Status: GOOD (  25.85  )
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

[+cc Kevin, pcie-starfive.c maintainer; will need his ack]

Subject line is excessively long.

On Tue, Nov 25, 2025 at 03:55:59PM +0800, Hal Feng wrote:
> The "enable-gpio" property is not documented in the dt-bindings and
> using GPIO APIs is not a standard method to enable or disable PCIe
> slot power, so use regulator APIs to replace them.

I can't tell from this whether existing DTs will continue to work
after this change.  It looks like previously we looked for an
"enable-gpios" or "enable-gpio" property and now we'll look for a
"vpcie3v3-supply" regulator property.

I don't see "enable-gpios" or "enable-gpio" mentioned in any of the DT
patches in this series, so maybe that property was never actually used
before, and the code for pcie->power_gpio was actually dead?

Please add something here about how we know this won't break any
existing setups using DTs that are already in the field.

> Tested-by: Matthias Brugger <mbrugger@suse.com>
> Fixes: 39b91eb40c6a ("PCI: starfive: Add JH7110 PCIe controller")

Based on the cover letter, it looks like the point of this is to add
support for a new device, which I don't think really qualifies as a
"fix".

> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/pci/controller/plda/pcie-starfive.c | 25 ++++++++++++---------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
> index 3caf53c6c082..298036c3e7f9 100644
> --- a/drivers/pci/controller/plda/pcie-starfive.c
> +++ b/drivers/pci/controller/plda/pcie-starfive.c
> @@ -55,7 +55,7 @@ struct starfive_jh7110_pcie {
>  	struct reset_control *resets;
>  	struct clk_bulk_data *clks;
>  	struct regmap *reg_syscon;
> -	struct gpio_desc *power_gpio;
> +	struct regulator *vpcie3v3;
>  	struct gpio_desc *reset_gpio;
>  	struct phy *phy;
>  
> @@ -153,11 +153,13 @@ static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie,
>  		return dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
>  				     "failed to get perst-gpio\n");
>  
> -	pcie->power_gpio = devm_gpiod_get_optional(dev, "enable",
> -						   GPIOD_OUT_LOW);
> -	if (IS_ERR(pcie->power_gpio))
> -		return dev_err_probe(dev, PTR_ERR(pcie->power_gpio),
> -				     "failed to get power-gpio\n");
> +	pcie->vpcie3v3 = devm_regulator_get_optional(dev, "vpcie3v3");
> +	if (IS_ERR(pcie->vpcie3v3)) {
> +		if (PTR_ERR(pcie->vpcie3v3) != -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(pcie->vpcie3v3),
> +					     "failed to get vpcie3v3 regulator\n");
> +		pcie->vpcie3v3 = NULL;
> +	}
>  
>  	return 0;
>  }
> @@ -270,8 +272,8 @@ static void starfive_pcie_host_deinit(struct plda_pcie_rp *plda)
>  		container_of(plda, struct starfive_jh7110_pcie, plda);
>  
>  	starfive_pcie_clk_rst_deinit(pcie);
> -	if (pcie->power_gpio)
> -		gpiod_set_value_cansleep(pcie->power_gpio, 0);
> +	if (pcie->vpcie3v3)
> +		regulator_disable(pcie->vpcie3v3);
>  	starfive_pcie_disable_phy(pcie);
>  }
>  
> @@ -304,8 +306,11 @@ static int starfive_pcie_host_init(struct plda_pcie_rp *plda)
>  	if (ret)
>  		return ret;
>  
> -	if (pcie->power_gpio)
> -		gpiod_set_value_cansleep(pcie->power_gpio, 1);
> +	if (pcie->vpcie3v3) {
> +		ret = regulator_enable(pcie->vpcie3v3);
> +		if (ret)
> +			dev_err_probe(dev, ret, "failed to enable vpcie3v3 regulator\n");
> +	}
>  
>  	if (pcie->reset_gpio)
>  		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> -- 
> 2.43.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
