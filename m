Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F67C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNRSxHskDYGEbcc+IeTAWfR7w4Yu58AW2J21K0Tv1mI=; b=ITqR+hGTphhmi4
	N2mvGIWTLvkBmLql8bDM6PqiXNAuidqViLIicdh5mvVHsT+ywhg7lsuqbbVekMe6GgB95j6XVrEbS
	XIhyHGZtW5a1y24jwohXUTpWF9ioqoQMlHOT+YGGE+/V6umovofl3cTvZIMw8THQlWhIm7WqaiDeR
	pKQBZavDOUlN6feMBsE3HaRuVTKE6BMWUwnhOOVM4vJ4Ly//MteX02YVFJlOI5JsLOIKFaOQupqOO
	yEq4p3Y253hEMO8Nwd0aoJOEu9mECW/1z1N3HK/8tKpAHcY4pPmFF360oV8W/Ei6aWFU6CtKWKYFA
	5jJxmeJxBR2GUvI9oMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHGx-001TMg-36;
	Thu, 23 Mar 2023 09:30:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHGu-001TKz-2o
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 09:30:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pfHGP-0005UF-IQ; Thu, 23 Mar 2023 10:29:41 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pfHGM-0067Mm-BG; Thu, 23 Mar 2023 10:29:38 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pfHGL-0002ek-J2; Thu, 23 Mar 2023 10:29:37 +0100
Message-ID: <2c99725a0bf259203a5b00f4c752eeb1b6596f59.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/5] usb: cdns3: add StarFive JH7110 USB driver.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Minda Chen <minda.chen@starfivetech.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
 <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Date: Thu, 23 Mar 2023 10:29:37 +0100
In-Reply-To: <20230315104411.73614-5-minda.chen@starfivetech.com>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
	 <20230315104411.73614-5-minda.chen@starfivetech.com>
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_023012_915312_791909CE 
X-CRM114-Status: GOOD (  16.33  )
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

On Mi, 2023-03-15 at 18:44 +0800, Minda Chen wrote:
> There is a Cadence USB3 core for JH7110 SoCs, the cdns
> core is the child of this USB wrapper module device.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
[...]
> diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
> new file mode 100644
> index 000000000000..a99f98f85235
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdns3-starfive.c
> @@ -0,0 +1,305 @@
[...]
> +static int cdns_clk_rst_init(struct cdns_starfive *data)
> +{
> +	int ret;
> +
> +	data->num_clks = devm_clk_bulk_get_all(data->dev, &data->clks);
> +	if (data->num_clks < 0)
> +		return dev_err_probe(data->dev, -ENODEV,
> +			"Failed to get clocks\n");
> +
> +	ret = clk_bulk_prepare_enable(data->num_clks, data->clks);
> +	if (ret)
> +		return dev_err_probe(data->dev, ret,
> +			"failed to enable clocks\n");

In general, it's better to acquire all resources first and only then
start interacting with them, and to order all devm_ calls before non-
devm calls to make sure cleanup is done in reverse order.

In this case you can switch clk_bulk_prepare_enable() with
devm_reset_control_array_get_exclusive() and simplify the error path.

> +	data->resets = devm_reset_control_array_get_exclusive(data->dev);
> +	if (IS_ERR(data->resets)) {
> +		ret = dev_err_probe(data->dev, PTR_ERR(data->resets),
> +			"Failed to get resets");
> +		goto err_clk_init;
> +	}
> +
> +	ret = reset_control_deassert(data->resets);
> +	if (ret) {
> +		ret = dev_err_probe(data->dev, ret,
> +			"failed to reset clocks\n");
> +		goto err_clk_init;
> +	}
> +
> +	return ret;
> +
> +err_clk_init:
> +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> +	return ret;
> +}

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
