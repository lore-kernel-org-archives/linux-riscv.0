Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E57C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTWMteu2RtvIMWUpJwwNxds9Xb5nI9EKfDb0KLFsJLk=; b=DE1CoiNXTUBbSg
	+jc/eWXQjusFJmVTEsCeHXO0p+464CozveEnlIGJgAn/Z0Z2du+xAX/ZkENRTlKkQU6ixSqtBGeiC
	L8sfdofNc4B7E7NB4k8wPPKM9IGSBfqIshT4vbEUFsK5e4m6SV9u9kQs45d4Ln94ZRVNtxE3Gw0pl
	bMzScpf+6mKPGbYsebDn7CHjwAWcajCFeM8ywsaB1cN2k7NRHi+sNeO2cnm4HAUbZDaFrkdmxdcSR
	A9wyyME/pKckjaIGyIknX6FjblucLoseWaRuQcERTPRHEEsR/tIaOoPmCKNnUdIbR5zXf0vwux43N
	4zlK5es7V6TefoDSlqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosb-0000000H8xC-2Q21;
	Mon, 21 Jul 2025 11:40:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoHU-0000000H1kh-0i80
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 11:02:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoH0-0006cV-Q3; Mon, 21 Jul 2025 13:01:34 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoGw-009Xfi-2H;
	Mon, 21 Jul 2025 13:01:30 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoGw-000EXA-1x;
	Mon, 21 Jul 2025 13:01:30 +0200
Message-ID: <d178cfb17e726597e2b4d4c49de5040646b9e55e.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/2] usb: dwc3: add generic driver to support
 flattened
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@ieee.org>, Ze Huang <huang.ze@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 21 Jul 2025 13:01:30 +0200
In-Reply-To: <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
	 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
	 <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040204_205966_5A8286E8 
X-CRM114-Status: GOOD (  15.24  )
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

On Di, 2025-07-15 at 15:50 -0500, Alex Elder wrote:
> On 7/12/25 2:49 AM, Ze Huang wrote:
[...]
> > +static int dwc3_generic_probe(struct platform_device *pdev)
> > +{
> > +	struct dwc3_probe_data probe_data = {};
> > +	struct device *dev = &pdev->dev;
> > +	struct dwc3_generic *dwc3;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
> > +	if (!dwc3)
> > +		return -ENOMEM;
> > +
> > +	dwc3->dev = dev;
> > +
> > +	platform_set_drvdata(pdev, dwc3);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dwc3->resets = devm_reset_control_array_get_optional_exclusive(dev);
> > +	if (IS_ERR(dwc3->resets))
> > +		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get resets\n");
> > +
> 
> It isn't enforced on exclusive resets, but I'm pretty sure
> resets are assumed to be asserted initially.

The reset controller API doesn't guarantee this. Whether reset controls
are initially asserted depends on the specific SoC/reset controller and
also on what the bootloader did before.

For example, there are self-deasserting reset controls that start out
deasserted and can only ever be asserted for a short pulse [1]. Even
the shared reset API only assumes that the reset line may have been
asserted at some point before the first assert() [2].

[1] https://docs.kernel.org/driver-api/reset.html#triggering
[2] https://docs.kernel.org/driver-api/reset.html#assertion-and-deassertion

Whether an explicit reset_control_assert() in the probe function is
needed depends on which assumptions the driver can make on its own (on
all platforms it is used on).
For example, for some devices it may be enough to assume that the
device has been reset at some point between power-on and probe.


regards
Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
