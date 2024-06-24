Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B20C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 01:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/3LrORaJW2GIDkTf1aJiUCQkysSQFtT+Y3GU9CmhZY=; b=spRVomC7yUquka
	emJ+/4WeRFn8V6BxnqXIpV4ymWvM/RluinLOw0L4GwjGHObmCrUao1a10MzoI5xWgK8fT8suxuIor
	vNSruwtpqGl8pS4gtjBjh+q7QjKW9eMOv5YQAGd33pFXeylZbLvbTB9na9yY1RSq5w9p+txu8RAiD
	HR8UMoQW9Xou9m2K117Sc25FCMtBZIP33MSR5Kd9vtZ37YaM4+bp7XR6rJS5VMzKsjbzxPU1A94/V
	bjjYYjbUObMgVmLXYZDVM4Z+vfhIS4dSJxZUEXA2HtphJR90JAXmCcP7Si61Vwp1KYi3BVvjpTJbf
	8HTI8ANdP8lRvokyOQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLYLt-0000000FAaE-0YWm;
	Mon, 24 Jun 2024 01:18:37 +0000
Received: from mail-bjschn02on2070a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLYLp-0000000FAYr-35cT
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 01:18:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afp7WCr2dU2qPlOJfoG0ioucqgdMlH6hXf6LCE66DNx5gCfGSUsBjOStIqBoCLmlXhOsuOzqbeUtGxRcwQhM86NUHcdbMS5TUy+KbTdbOFiBWLNo4r4wdgaM0ortO0Vh0eFtizK2B4qqhQB3eSBTfyXGCoh35P0V+f0QvJUFGH+kqUgwiZ8Nv/2B+epJLw+yBy4XoFV5a4/an5+vkItlSrJgoCM0BKtkz8Q/vEOL3Ms2taNOtJA/gE8n6flhDyeQODnj2oOMhIx4pBL1wn52LLQxs9UF/ZaRmwTLs10G+cqrQIHDpHbxXQe0dmKZUlKes9ywH/iI40twPH4FdR4eJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ccFXBpRGA+/68QN8IIqoms66qkKZWrcxP6EwEV5GSE=;
 b=HJc35M4R8P2bSeDB9rd2PMzQU0q8j0IVSWc7cosn9GxuKaxlrdTppeyZjcyqC05nnDRWeTgCxmYJmgJKQqtWct6uXOBpy9rbkV6VkOwv7GzBlFU3MIzuJr6VNR8H/rF8EI11OGVxNIlEv09cx8dtFFHs89NmUPC8KmGMrpcWxlZim4jSaHNAGeYOEBJDwCc7Q5Be+t3zlTlGpZDE6KUQEbZzpKcuIDL05C3Tm8FAJZgziNs4i01eCODeIhceKkUTSPmWKTVo3+UUFOy5qoTGoLYTbF6Ry6xzjF3OXbkpHWUJw4+O/o8HXpX2ox2W4s2q90t5+oxa2AAZyzPHuV5JDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0688.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:24::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Mon, 24 Jun
 2024 01:18:08 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7677.036; Mon, 24 Jun 2024 01:18:08 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 1/1] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
Thread-Topic: [PATCH v2 1/1] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
Thread-Index: AQHaw7QwWG05w0fAxkOjIdhdymYAabHTskuAgAJvCVA=
Date: Mon, 24 Jun 2024 01:18:07 +0000
Message-ID: <SHXPR01MB0863A47890F95A45559FD82DE6D42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20240621082231.92896-1-minda.chen@starfivetech.com>
 <20240621082231.92896-2-minda.chen@starfivetech.com>
 <20240622-festivity-salon-bbad348a12c8@spud>
In-Reply-To: <20240622-festivity-salon-bbad348a12c8@spud>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0688:EE_
x-ms-office365-filtering-correlation-id: 51e24065-2517-420b-e39a-08dc93eb8192
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230037|41320700010|366013|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info: fJh8mdf/p9F5AHHU3YSrK4I4Gl3kcDMerkcBSjrGO6rl0Aj3xoqYpJR/oI9ejjrPDrZwaRZTREEHYzUHRIEfYIt6txpgtWNZhHVbvTBNu8IPMzM6DF+RCLlyOfsGn+BagZiyvLm9Rp0SUVa/MPicymGbS0AURx6RPCGzMwM/4Ps8tlsPHhE4PziRbbqwhePMryuWaMLCs16Uct7mpKh8tM1eTgFUqB4ZsjGu8HA3+2vVxS1L0V3ES+aSNGpRmBntKrjQLbqO4yKWPM+w9IBbNLUlnHIORvm0BhwIwsook/s8FWiFZqe58jc01ueeqK3ntQrI/y80r/BJAcwygyk20LRcKxfa29/brdESQoZ8qzbZZGH5hFfzLPR8oo5IZ+Ew5vHnEv3RB0pZeteM47sRGh9rNq4N3NRcJvWey9XZIXPYKGQzoeyxlM5nI5DDfdjBSmt1kr0pPPBWTds/VwceK+asQ2QsrNLWxBbj/pviMibGsIaJuvffAKHhm9WlXy5usSDngJoR5y09seWEDWs3SbBcwKpRhL6sUrjdZT2kv38VoLT49TOgDYjoud3LF8aC6Hh+O1FQYq8DujWmeQ50+niupJkRxOi36f37NUlZ4Mf/kdX7jv3k5T8KYp6ODSZS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230037)(41320700010)(366013)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ap5E6nQZLTQL/C7iceuXunSEuPGHnh9hGdjVDgtL2rTT9qtarOwCseRiol5c?=
 =?us-ascii?Q?Dkey6r0k8+v97nwnih6j9G7pB2HWqSSBlzdydRjcQKrLXYxwZl8cBY0PFrc/?=
 =?us-ascii?Q?AFYgsUwkMSDLmyrzRdNrbv8VdlU1ZUB7CQtwRhVDx6j4NsELBqh9MtDztphX?=
 =?us-ascii?Q?F3Qb9quUYJxyo5kOjT1/H9l4LIju+e/lXCMGnpZggXq9S5f+x5mVwp8bvRoU?=
 =?us-ascii?Q?FOhv3pZI8ePKkko4q+xKY3FoblTF3neJAbR5biNIOT6W5RBarmaSwBGhUt0F?=
 =?us-ascii?Q?kQJAvHZwvq2c0X+3+ieOPvUMOIBHa/9baUiWenMxceuk4Dh73iYh7HbObbqk?=
 =?us-ascii?Q?FUZadxTvoj3N0exNCVXYYgYaJQ2lP8d/Dp69WwjTlJscpeXhc6ouMvQvZNSg?=
 =?us-ascii?Q?hRTBkIsZo9tsGGkeg7v3jZ49SchOMobxnHzgLm7Agf0HIH8VLIskUCs6FH0p?=
 =?us-ascii?Q?60r4Bn0BiV2LBnLE69M1hFfJByYP5o5EEsrJULKhbE+4wvrtyXoUnZ15nXfk?=
 =?us-ascii?Q?0jq2kGFFkVqRmNaUXEvsehHUXVcqZSV7jpMWSusa60ESp2XdW+EDY8iYkvxd?=
 =?us-ascii?Q?Mng71VXBN70Rf1eq61hqON5R38RG01m8aLrPmX8paaaID1xNvy9QxDB7k/8K?=
 =?us-ascii?Q?9eOL6jTMHABf489giZ+BkBHMgIdb7b0psFmVnyTKUcDT881YKtXYaGcYXIpl?=
 =?us-ascii?Q?vEAN5Ca7pOz/U9P6O3G0iL2FLaK5kvEjv16jGEn2DaRxKaQVG/UndPOn0jst?=
 =?us-ascii?Q?383a6n9hdErD+nVHlfIyiruGv2iWBbFXhA0Fk3Xyt+mTGsRL3l6eMQ/eA3MH?=
 =?us-ascii?Q?RJRPeMUOm5PxAcFrXt7xCqRMsd7rcE+l4eD3cTOrcXuOLT571uhnVsngi7eL?=
 =?us-ascii?Q?RaVg1RLwbzb/PefPBC5LOAKCX4e6kuMAVv/TdXaSxyfPgXPwd1nqOIzrgIbH?=
 =?us-ascii?Q?4EkC3m0Sg1KuFK9qndnNsPnKOzvwGJoHW88Oz4K7dB7AESQKBjm1Q1oH87Ek?=
 =?us-ascii?Q?cOxHMmqHiq3M6htnWE2nPMGB0gJOo5sEHGymtm/3PZho/AN9AtHbc+8rAeJU?=
 =?us-ascii?Q?7jD3K1mmgSqbdQWRPSekknjonsTc4uZ6Yu9TXYld3sj1sXvScNArbGQRZQvw?=
 =?us-ascii?Q?6iPtg3u/c9haRVcyV64S3Igfq+kLq5Vk0JaIQnciSz1iLRwbHRXAhZV0uU2a?=
 =?us-ascii?Q?kN9YDH6iWjuK51hM/lGBIpNLmNh23TADKNY36fNckAv5YblNeEiJSc3gNfFo?=
 =?us-ascii?Q?rIyYp3tEELit6fRp2tDvoKvs+3zOsjOxG9UHHhWFEQ1eeGyIX+/gE6HLGlNW?=
 =?us-ascii?Q?mjEJ1J1H1IDg1Y3abwiaQHrvYvWicmsyZGL8gzXTks872oXVTESGzEE0DClM?=
 =?us-ascii?Q?F5OFnsAMz9S8lWQ9ynCvUk6La1E9D4HfDMzTKGMGNGs5xPM2S0vQqP7mqedo?=
 =?us-ascii?Q?x5dG6XsHK1ZW1icNqw0oOpFFyugTSxvYDgL+U5zWQaoRSYY+PCp0Ahj+9VoZ?=
 =?us-ascii?Q?in0FFvhNIPtzX69MS0wgMJRPAIbplrDwvH6xnirMbuFNdwfiw1lw+cQD6eAV?=
 =?us-ascii?Q?Is3j5eM+RQCcnVQ94rRTK8gfRMhLnabYj+TwES5A?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e24065-2517-420b-e39a-08dc93eb8192
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 01:18:08.0047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OPWUvYrZUkLhALe74A+aiingdHRr22M1tnBMRZdN7N9h85Oa8McY9bEUZZEl6TKljDNFP7yUBYHLdLY6jIsi2Hvi+6N37+hce2B6y5x868=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_181834_005767_60678C66 
X-CRM114-Status: GOOD (  17.56  )
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



> 
> On Fri, Jun 21, 2024 at 04:22:31PM +0800, Minda Chen wrote:
> > Add PCIe dts configuraion for JH7110 SoC platform.
> 
> I think the commit message should mention that the star64 doesn't have a pci
> port exposed. If nothing else crops up, I'll edit it myself if that's okay?
> 
> Thanks,
> Conor.
> 
Okay. Thanks. 

> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7110-common.dtsi      | 62 +++++++++++++
> >  .../boot/dts/starfive/jh7110-milkv-mars.dts   |  7 ++
> >  .../jh7110-starfive-visionfive-2.dtsi         |  8 ++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
> >  4 files changed, 163 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > index 8ff6ea64f048..f91abc660ae8 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -294,6 +294,20 @@
> >  	status = "okay";
> >  };
> >
> > +&pcie0 {
> > +	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> > +	phys = <&pciephy0>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_pins>;
> > +};
> > +
> > +&pcie1 {
> > +	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> > +	phys = <&pciephy1>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie1_pins>;
> > +};
> > +
> >  &pwmdac {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pwmdac_pins>;
> > @@ -476,6 +490,54 @@
> >  		};
> >  	};
> >
> > +	pcie0_pins: pcie0-0 {
> > +		clkreq-pins {
> > +			pinmux = <GPIOMUX(27, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_NONE)>;
> > +			bias-pull-down;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +
> > +		wake-pins {
> > +			pinmux = <GPIOMUX(32, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_NONE)>;
> > +			bias-pull-up;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +	};
> > +
> > +	pcie1_pins: pcie1-0 {
> > +		clkreq-pins {
> > +			pinmux = <GPIOMUX(29, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_NONE)>;
> > +			bias-pull-down;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +
> > +		wake-pins {
> > +			pinmux = <GPIOMUX(21, GPOUT_LOW,
> > +				      GPOEN_DISABLE,
> > +					      GPI_NONE)>;
> > +			bias-pull-up;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +	};
> > +
> >  	pwmdac_pins: pwmdac-0 {
> >  		pwmdac-pins {
> >  			pinmux = <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT, diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > index fa0eac78e0ba..5cb9e99e1dac 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > @@ -17,6 +17,13 @@
> >  	assigned-clock-parents = <&aoncrg
> JH7110_AONCLK_GMAC0_RMII_RTX>;  };
> >
> > +&pcie0 {
> > +	status = "okay";
> > +};
> > +
> > +&pcie1 {
> > +	status = "okay";
> > +};
> >
> >  &phy0 {
> >  	motorcomm,tx-clk-adj-enabled;
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index 9d70f21c86fc..18f38fc790a4 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -32,3 +32,11 @@
> >  &mmc0 {
> >  	non-removable;
> >  };
> > +
> > +&pcie0 {
> > +	status = "okay";
> > +};
> > +
> > +&pcie1 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 18047195c600..5ac70759e0ab 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -1214,5 +1214,91 @@
> >  			#reset-cells = <1>;
> >  			power-domains = <&pwrc JH7110_PD_VOUT>;
> >  		};
> > +
> > +		pcie0: pcie@940000000 {
> > +			compatible = "starfive,jh7110-pcie";
> > +			reg = <0x9 0x40000000 0x0 0x1000000>,
> > +			      <0x0 0x2b000000 0x0 0x100000>;
> > +			reg-names = "cfg", "apb";
> > +			linux,pci-domain = <0>;
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			#interrupt-cells = <1>;
> > +			ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0
> 0x08000000>,
> > +				 <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0
> 0x40000000>;
> > +			interrupts = <56>;
> > +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > +			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
> > +					<0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
> > +					<0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
> > +					<0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
> > +			msi-controller;
> > +			device_type = "pci";
> > +			starfive,stg-syscon = <&stg_syscon>;
> > +			bus-range = <0x0 0xff>;
> > +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE0_TL>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE0_AXI_MST0>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE0_APB>;
> > +			clock-names = "noc", "tl", "axi_mst0", "apb";
> > +			resets = <&stgcrg JH7110_STGRST_PCIE0_AXI_MST0>,
> > +				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV0>,
> > +				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV>,
> > +				 <&stgcrg JH7110_STGRST_PCIE0_BRG>,
> > +				 <&stgcrg JH7110_STGRST_PCIE0_CORE>,
> > +				 <&stgcrg JH7110_STGRST_PCIE0_APB>;
> > +			reset-names = "mst0", "slv0", "slv", "brg",
> > +				      "core", "apb";
> > +			status = "disabled";
> > +
> > +			pcie_intc0: interrupt-controller {
> > +				#address-cells = <0>;
> > +				#interrupt-cells = <1>;
> > +				interrupt-controller;
> > +			};
> > +		};
> > +
> > +		pcie1: pcie@9c0000000 {
> > +			compatible = "starfive,jh7110-pcie";
> > +			reg = <0x9 0xc0000000 0x0 0x1000000>,
> > +			      <0x0 0x2c000000 0x0 0x100000>;
> > +			reg-names = "cfg", "apb";
> > +			linux,pci-domain = <1>;
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			#interrupt-cells = <1>;
> > +			ranges = <0x82000000  0x0 0x38000000  0x0 0x38000000 0x0
> 0x08000000>,
> > +				 <0xc3000000  0x9 0x80000000  0x9 0x80000000 0x0
> 0x40000000>;
> > +			interrupts = <57>;
> > +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > +			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc1 0x1>,
> > +					<0x0 0x0 0x0 0x2 &pcie_intc1 0x2>,
> > +					<0x0 0x0 0x0 0x3 &pcie_intc1 0x3>,
> > +					<0x0 0x0 0x0 0x4 &pcie_intc1 0x4>;
> > +			msi-controller;
> > +			device_type = "pci";
> > +			starfive,stg-syscon = <&stg_syscon>;
> > +			bus-range = <0x0 0xff>;
> > +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE1_TL>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE1_AXI_MST0>,
> > +				 <&stgcrg JH7110_STGCLK_PCIE1_APB>;
> > +			clock-names = "noc", "tl", "axi_mst0", "apb";
> > +			resets = <&stgcrg JH7110_STGRST_PCIE1_AXI_MST0>,
> > +				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV0>,
> > +				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV>,
> > +				 <&stgcrg JH7110_STGRST_PCIE1_BRG>,
> > +				 <&stgcrg JH7110_STGRST_PCIE1_CORE>,
> > +				 <&stgcrg JH7110_STGRST_PCIE1_APB>;
> > +			reset-names = "mst0", "slv0", "slv", "brg",
> > +				      "core", "apb";
> > +			status = "disabled";
> > +
> > +			pcie_intc1: interrupt-controller {
> > +				#address-cells = <0>;
> > +				#interrupt-cells = <1>;
> > +				interrupt-controller;
> > +			};
> > +		};
> >  	};
> >  };
> > --
> > 2.17.1
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
