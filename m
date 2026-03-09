Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729BF3C254
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gRRPi/AVMTi+wIq4FHSM9WDThSrTuv8QgKuAL5LCM4=; b=43VKsVBHEEBu67
	XF2QY+hRvO/rkDMRR5ZaYik/HI45M7PtLUbfEQNQrn4HVNAsgYyvpSYGck4/k9+ViXT9f2a9QLTW7
	Y3x9xncrcD8SWfem2fqTn3F+x89m2oorn0ixC143OvRel2h/Mart9C90pJLaWTeeelyNZT+vcuplA
	NrGerRqNeCgmhmbX1poHHsdqWwEgoiCQ0VxrjcMynnU0ahgepN211C3o95HQq+pZFhZKPLIlfiyJ4
	azc+xtf+c6fVTFObuFS7BKTIbP9tEPlafALWTBb4Li5R5UQ/4tKnFEg+AzcisFen0LNIeSlbOwk5F
	7DvDMysRc5N16lVexj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaYy-00000007O5g-3j3W;
	Mon, 09 Mar 2026 13:22:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaYw-00000007O5I-46af
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 13:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA87C40472;
	Mon,  9 Mar 2026 13:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3FCC4CEF7;
	Mon,  9 Mar 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773062541;
	bh=d5MLBrQ/18Asiku/cVf2NDC2Dc4/7wsqetgjS+f9zfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIpq8FKkp8gZe5TXhH+XWS6+eZZq3rrI20iVYUZPh7qAhdi/+gfhB7yVXBbU3QWCl
	 jbfq3r+nc0SvI/WEjbo0harlbVe5UVB6j82MfAmwC3kr2omqwF/tzGil/1IdPQOnxN
	 BMlm90MXkgxGi0xu3m1yGUY7OxzYunldqBcwSNJYdml75Jru/lHipdourq3OkgKLAg
	 zwaagSUvrIyJVXuSGmXSLp/n9M4VlvLgtoX6+82xEKOo84PEj2G8DYakk5oyo0N4yH
	 BofV2f9P7AevI5Nw8re7Mwql7zoP89UoaNaXpzPmErMOlinlIuhoE61RuEuO2QfPjj
	 FG5Qda63Vw3gw==
Date: Mon, 9 Mar 2026 21:22:19 +0800
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
Message-ID: <20260309132219-GKE302167@kernel.org>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_062223_080040_E06EDB80 
X-CRM114-Status: GOOD (  24.07  )
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

Hi Iker,

On 12:40 Mon 09 Mar     , Iker Pedrosa wrote:
> Add voltage switching infrastructure for UHS-I modes by integrating both
> regulator framework (for supply voltage control) and pinctrl state
> switching (for pin drive strength optimization).
> 
> - Add regulator supply parsing and voltage switching callback
> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations
> - Enable coordinated voltage and pin configuration changes for UHS modes
> 
> This provides complete voltage switching support while maintaining
> backward compatibility when pinctrl states are not defined.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 59 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 585c7eca6ebf253aac466dd37cef029deb63f692..8af117a8e271c04a80d8dc7bb5ce12075652dd7a 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  
>  #include "sdhci.h"
> @@ -70,6 +71,9 @@
>  struct spacemit_sdhci_host {
>  	struct clk *clk_core;
>  	struct clk *clk_io;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pinctrl_default;
> +	struct pinctrl_state *pinctrl_uhs;
>  };
>  
>  /* All helper functions will update clr/set while preserve rest bits */
> @@ -218,6 +222,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
>  			       SPACEMIT_SDHC_PHY_CTRL_REG);
>  }
>  
> +static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_ios *ios = &host->mmc->ios;
> +	struct pinctrl_state *state;
> +	int ret;
> +
> +	/* Select appropriate pinctrl state based on signal voltage */
> +	if (sdhst->pinctrl) {
do a sanity check, then abort it early, the advantage is that you can get rid of
one indetation for next code..

	if (!sdhst->pinctrl)
		return;


> +		switch (ios->signal_voltage) {
> +		case MMC_SIGNAL_VOLTAGE_330:
> +			state = sdhst->pinctrl_default;
> +			break;
> +		case MMC_SIGNAL_VOLTAGE_180:
> +			state = sdhst->pinctrl_uhs;
> +			break;
> +		default:
> +			dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
> +				 ios->signal_voltage);
> +			return;
> +		}
> +
> +		if (state) {
> +			ret = pinctrl_select_state(sdhst->pinctrl, state);
> +			if (ret) {
> +				dev_warn(mmc_dev(host->mmc),
> +					 "failed to select pinctrl state: %d\n", ret);
> +				return;
> +			}
> +			dev_dbg(mmc_dev(host->mmc), "switched to %s pinctrl state\n",
> +				ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
> +		}
> +	}
> +}
> +
>  static inline int spacemit_sdhci_get_clocks(struct device *dev,
>  					    struct sdhci_pltfm_host *pltfm_host)
>  {
> @@ -242,6 +282,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
>  	.set_bus_width		= sdhci_set_bus_width,
>  	.set_clock		= spacemit_sdhci_set_clock,
>  	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
> +	.voltage_switch         = spacemit_sdhci_voltage_switch,
>  };
>  
>  static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
> @@ -293,6 +334,24 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
> +	sdhst = sdhci_pltfm_priv(pltfm_host);
..
> +	sdhst->pinctrl = devm_pinctrl_get(dev);
> +	if (!IS_ERR(sdhst->pinctrl)) {
> +		sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
> +		if (IS_ERR(sdhst->pinctrl_default))
> +			sdhst->pinctrl_default = NULL;
> +
> +		sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
> +		if (IS_ERR(sdhst->pinctrl_uhs))
> +			sdhst->pinctrl_uhs = NULL;
> +
> +		dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
> +			sdhst->pinctrl_default, sdhst->pinctrl_uhs);
> +	} else {
> +		sdhst->pinctrl = NULL;
> +		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
> +	}
> +
how about creating a function spacemit_sdhci_get_pins()? similar as get
resource for clock, will more readable.

>  	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
>  	if (ret)
>  		goto err_pltfm;
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
