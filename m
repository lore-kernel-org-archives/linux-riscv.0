Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF73ECFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNNlgFga05MgNQQBJ3PhqSFbTQ9xKQtyWeDFvc83qWM=; b=ym7XG9P9uvTyiq
	krIixSnFitC5NswUIP3bwPgo4k9gUcPe468HzOHB0LaFwMMoQBAac0J2CtpEU9bw3XS/l9fAt7JPf
	lHEo0p+B9rTH8xYmxPZGUai7FX+CZZ5cRQ9iI1EOcb8trUBCtyB7QjVAZJWRvBKexDVzCTrob3hG4
	lKYv9R0YGZel/M5g2zxQlb2EZ82OQzVJpaLIij84DarI6WX92bh+PzVovDH9207btE7kP/ctrMJuy
	G4OXkvHV34MyfOt+uRCggB9epCipZVL5JeCfmQjd3Zp3bFioyX8PZYucgjw1KfRLkbn0x7MI1LGA0
	4CPAT5UV5ybd7shG+wGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQHDU-00000004lM9-0DhN;
	Tue, 02 Dec 2025 03:38:16 +0000
Received: from mail-bjschn02on20723.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::723] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQHDQ-00000004lLl-29lf
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 03:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xt6zoscws+9x5oN+FhQu5MA9X+jI6Vj/RVHxJoHp8cx6FGbmi70BGPAOOoSdJt9TCLb0UZe2FuzQPMKhNZfe87XKYEZDKoBMxSmUUqVOyG4H5WfMSdmGLADD03TNm/1sMxA4XLDq1+I39vkDOzitiqDIBZ53LCU8loYfDcbLAIs80ylQTwVtKJtQo5Dyz3+SSkTUV4GVz3qL1GRVY+oc76EEdLRaQHLBtcAi3dkgMariqrQZBDibMIjsj81lvodK5vgPHCoOuHizOEQvlzwjoE4pgWcxN4IGjVUEEZ04fLGnB0VIJ9w1GVss3o81oR/YvmBfZDhS1RLPZfoOLFvEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iatfrs3jQ+KuyGG8mPWLClDK6RvFlyEqF374ogMp7M=;
 b=EsfFDt1oyE+VHUCwg4QMt1dZ/96/vyyUJBFaodedvqLNGwsFx+9Fg1MzXYDFcM5X0ZRwBe/uXfWkDdZLrO9++Oem54A16sVM9jOxmGEVjfcTKzli6gE/RhIT5PKKgHjwJ85vlus3sRrOCVmyAMxzIittGAoalZcM27Nw2pUuxdVIGhpel+Nbzq5yUqOXsRweVEXCz5TCvmvWeNyyVjl7UdXtV0CaxHAdGTNgIHfP+ZERiGzVUOh6jCLOcOTm44u1HvjnjvJQ9JrXqd3C+1huVRdQ6fwLJnitNXIvnLojwge1BIHomtADkXSVnutxLaYfRWod3aNwixqu1uZEf+887g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1228.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:38:02 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:38:02 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Xie
	<kevin.xie@starfivetech.com>
Subject: RE: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Thread-Topic: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Thread-Index: AQHcXeD4WDMn2zfogkuoU7yPusoik7UNTRYAgABozmA=
Date: Tue, 2 Dec 2025 03:38:01 +0000
Message-ID: <ZQ2PR01MB13074FB41F2DBE15CE96855DE6D82@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251125075604.69370-2-hal.feng@starfivetech.com>
 <20251201205236.GA3023515@bhelgaas>
In-Reply-To: <20251201205236.GA3023515@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1228:EE_
x-ms-office365-filtering-correlation-id: ee174fe9-1501-476a-0981-08de31543214
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|41320700013|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info: 8JC509K6YOopHOYtyXkjLkTYoSKB6RFn1bkYja2xWaoWdzZKil7DJbIbPfbSgrY+HCFNi/nwZ2fgxaNIBHPAMi65i3qWLlQoGWqBywz48t7b2pBNvsqQmfZ6/KRyqajQXky7zljX2s6wzcCQeqTGpjuFb7SdLeqRFJcuJLs69qSWMjhe2NaVXQNckQ03ag4lDrGJYtoxpsgIboNQjlKFQdL7ymd010XxDHTXsc3UjqYZnWfI4w9Y/zCV/Y7aCxrmUP6bK+kttSKPIoESKyX9CAIF8AfQhuyOw5MwMR9XfVMAc+zQFVgq8K8knzvAOiG6/ltp2gPG93CqZo+QxZoYKmv3qpUK1PcKXWiethhgo2KiK4GClKNcwxSkQ/2otkmrB6C645XfcQaxmvfwC9cmhTNGLdYCWqHEPunmJigjXxIQ6jrw2bh67/yOpNbgANCqLQXRGwpjA68JuIGJ7uqwhQvv4xSt5RFao+6r4yLLe9fPnHXlRDWgQRj28tcbfDHv4Omu66froAM3gA+rm4b5y5j3CR5LocVAAJK7DTZPJJl3W5jwq604zOUw0nWr+gXa+20Ivzy7s7Ov6gJ411XV0822mWSsav9Dac+ofWonkvQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?SP+4VovJdea9c2Fw5C3B6uFjMO86gbZqTHR8fnmtySztp4Osyd+2QObxqh?=
 =?iso-8859-2?Q?cAbrtxD0r7vt9c5HSB5nSCUzBu9cVxmcnFO21Aq+IZ7Gl5stqgCgdG6wWI?=
 =?iso-8859-2?Q?PKYDGse26OIEqAbdXhgl+xjuxhcXus0Z2hqFOpzdp6YcXybv/VV0RIDwdd?=
 =?iso-8859-2?Q?yGcnTIM278FilZQsfitWtCegnr4oQE7cZk/PNAh0vJjcjuDTbmaMsHs+R/?=
 =?iso-8859-2?Q?gN5IuwW3VuiwzWQab+AkYTLZ/oLq2kK6joEmYbEJwSeH8HvWMsuBTJnIRu?=
 =?iso-8859-2?Q?1M9zCssroj5BbRYc7FFCc/jfoXb2XqgMvSWW7OP+IO2imxbf4R6gEeHMaP?=
 =?iso-8859-2?Q?GDuA6fdeea0DwvcDhFi5VoIBwoJHMSmU5HsIVtADWpPCVH4ugWwE2qp+hQ?=
 =?iso-8859-2?Q?/MJmHLBopALRWC2Yj+lh467jqmTRZPlQe/Cp/TYMBQe2TgHHTkpphLoKAd?=
 =?iso-8859-2?Q?FUFNkuQ/gib+1pwqZbf1vwFLbqVe/GLfBa5yItLxk16xZwOH+JbM6PCEqF?=
 =?iso-8859-2?Q?ZcCzkbqsRDJjtQA5lNHwyLtsX7Jhzf+tFI/IsnzVU7pw0s5eUi44JbAh1z?=
 =?iso-8859-2?Q?InsvGubFP0C1Dn0t8BDxeZb4DfrcB/ocs7cmonkF6gmbMRIRx0REF8BPEa?=
 =?iso-8859-2?Q?DK++DGRJImQLOPcyOE7G4a4hvqr5Q58YJKb1hRnXKxgNDpQkHQsdFr1uxF?=
 =?iso-8859-2?Q?2LiLgxlB5IEfi5B0kp3laJ191u0FBlGZOJ/mLiA2/aUIGosZHCfXguP+Vd?=
 =?iso-8859-2?Q?5U96+GmtahYlhfO/VQ+1sdFcSZVKnZdmg6BAQBxHuuUjVtC+AIDsltI8HJ?=
 =?iso-8859-2?Q?8SyxXic+v1/cfXLm7YjKE9lCkZcxaxinmnFZX2XK9lYIOMCW5x92jl/5BZ?=
 =?iso-8859-2?Q?VnnuBAEX4H/oK82b5cN5B4zXp/atAuNHeuoC4kQkL1LXKr88PqflP/9PkP?=
 =?iso-8859-2?Q?qVkmQ1AUc3JKMM1voPuq7kysM29coKrOZ3drhAUHtbUMu1sZzuQSp++rVw?=
 =?iso-8859-2?Q?FxfLLwJtOC7x3C/e9sk+tNEgf87qZRCu4ktd8TeZW8EuCodezfTMEmNmbM?=
 =?iso-8859-2?Q?AfmzdsxR5f2FjEF5WBh3SKR6rU/TIXzvnDmdKF4X9MY1aaVBuCEhUo/4Ry?=
 =?iso-8859-2?Q?NKsPirodrNud2ReU1G6u20KIjFYtVHPUsfS4X4jJAtode3Vnaf8S6vKw21?=
 =?iso-8859-2?Q?IpJzr4bMAzTyUCDNLr96S5riThwAOQblRGUmsIF3NFuNL51lK/l/9SKuj9?=
 =?iso-8859-2?Q?C4YlfkWtRuJoRVZCRUB6iKYVdRIBgQg6hZUx3FnpwG1V9lX8ULmww8IDfj?=
 =?iso-8859-2?Q?Fv8JWManpyt5RJCsJOXyVqP3Wmd4tV8VldTVSXsMK+CBkAzKnidWcPc7TR?=
 =?iso-8859-2?Q?SjQ17jlDfsqBwwc8owYq9RgHvc8qx6aGKKJ++a2plGnY6dXGrKzMajlvzA?=
 =?iso-8859-2?Q?O7iFj5Zk52BVQMq1nDA7pUjsr63UcQ5TwJVnRtjJOMreWviIIva5bq9odt?=
 =?iso-8859-2?Q?+Kv1QOG+PXnyG5BzYVEzgA+YWIUjx4TSM5f9bQkB4pHWT67tQaqR94SNMc?=
 =?iso-8859-2?Q?p7HRV3unSHmEspiKuf48H0DThX10JiN7/1Sfv8oS/ZYCSMXFBRVANzXWvs?=
 =?iso-8859-2?Q?gKYuaBBXyyICQUfIS0o1QN0Q1I3WuIPFZ1?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ee174fe9-1501-476a-0981-08de31543214
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 03:38:01.9898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsOzAyHdsKHxTmACZdlx+tPUpeBs1a2xsvJGzMCxdpcrTTyGbEipyHOG3dMDITpBDfEK62Gg5er8z4SOAddlHsP73tGJi+kngZ+jkvZIMgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_193812_582890_42951B8F 
X-CRM114-Status: GOOD (  29.81  )
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

> On 02.12.25 04:53, Bjorn Helgaas wrote:
> [+cc Kevin, pcie-starfive.c maintainer; will need his ack]
> 
> Subject line is excessively long.
> 
> On Tue, Nov 25, 2025 at 03:55:59PM +0800, Hal Feng wrote:
> > The "enable-gpio" property is not documented in the dt-bindings and
> > using GPIO APIs is not a standard method to enable or disable PCIe
> > slot power, so use regulator APIs to replace them.
> 
> I can't tell from this whether existing DTs will continue to work after this
> change.  It looks like previously we looked for an "enable-gpios" or "enable-
> gpio" property and now we'll look for a "vpcie3v3-supply" regulator property.
> 
> I don't see "enable-gpios" or "enable-gpio" mentioned in any of the DT
> patches in this series, so maybe that property was never actually used before,
> and the code for pcie->power_gpio was actually dead?

Yes, "enable-gpios" or "enable-gpio" is never used in any DTs, and pcie->power_gpio
related code is never run actually. Even the "enable-gpios" or "enable-gpio"
property was not added in the dt-bindings
Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml.

Suggested by Manivannan in the previous version [1], let's use regulator APIs instead.

[1] https://lore.kernel.org/all/xxswzi4v6gpuqbe3cczj2yjmprhvln26fl5ligsp5vkiogrnwk@hpifxivaps6j/

Best regards,
Hal

> 
> Please add something here about how we know this won't break any existing
> setups using DTs that are already in the field.
> 
> > Tested-by: Matthias Brugger <mbrugger@suse.com>
> > Fixes: 39b91eb40c6a ("PCI: starfive: Add JH7110 PCIe controller")
> 
> Based on the cover letter, it looks like the point of this is to add support for a
> new device, which I don't think really qualifies as a "fix".
> 
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  drivers/pci/controller/plda/pcie-starfive.c | 25
> > ++++++++++++---------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/pci/controller/plda/pcie-starfive.c
> > b/drivers/pci/controller/plda/pcie-starfive.c
> > index 3caf53c6c082..298036c3e7f9 100644
> > --- a/drivers/pci/controller/plda/pcie-starfive.c
> > +++ b/drivers/pci/controller/plda/pcie-starfive.c
> > @@ -55,7 +55,7 @@ struct starfive_jh7110_pcie {
> >  	struct reset_control *resets;
> >  	struct clk_bulk_data *clks;
> >  	struct regmap *reg_syscon;
> > -	struct gpio_desc *power_gpio;
> > +	struct regulator *vpcie3v3;
> >  	struct gpio_desc *reset_gpio;
> >  	struct phy *phy;
> >
> > @@ -153,11 +153,13 @@ static int starfive_pcie_parse_dt(struct
> starfive_jh7110_pcie *pcie,
> >  		return dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
> >  				     "failed to get perst-gpio\n");
> >
> > -	pcie->power_gpio = devm_gpiod_get_optional(dev, "enable",
> > -						   GPIOD_OUT_LOW);
> > -	if (IS_ERR(pcie->power_gpio))
> > -		return dev_err_probe(dev, PTR_ERR(pcie->power_gpio),
> > -				     "failed to get power-gpio\n");
> > +	pcie->vpcie3v3 = devm_regulator_get_optional(dev, "vpcie3v3");
> > +	if (IS_ERR(pcie->vpcie3v3)) {
> > +		if (PTR_ERR(pcie->vpcie3v3) != -ENODEV)
> > +			return dev_err_probe(dev, PTR_ERR(pcie->vpcie3v3),
> > +					     "failed to get vpcie3v3
> regulator\n");
> > +		pcie->vpcie3v3 = NULL;
> > +	}
> >
> >  	return 0;
> >  }
> > @@ -270,8 +272,8 @@ static void starfive_pcie_host_deinit(struct
> plda_pcie_rp *plda)
> >  		container_of(plda, struct starfive_jh7110_pcie, plda);
> >
> >  	starfive_pcie_clk_rst_deinit(pcie);
> > -	if (pcie->power_gpio)
> > -		gpiod_set_value_cansleep(pcie->power_gpio, 0);
> > +	if (pcie->vpcie3v3)
> > +		regulator_disable(pcie->vpcie3v3);
> >  	starfive_pcie_disable_phy(pcie);
> >  }
> >
> > @@ -304,8 +306,11 @@ static int starfive_pcie_host_init(struct
> plda_pcie_rp *plda)
> >  	if (ret)
> >  		return ret;
> >
> > -	if (pcie->power_gpio)
> > -		gpiod_set_value_cansleep(pcie->power_gpio, 1);
> > +	if (pcie->vpcie3v3) {
> > +		ret = regulator_enable(pcie->vpcie3v3);
> > +		if (ret)
> > +			dev_err_probe(dev, ret, "failed to enable vpcie3v3
> regulator\n");
> > +	}
> >
> >  	if (pcie->reset_gpio)
> >  		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> > --
> > 2.43.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
