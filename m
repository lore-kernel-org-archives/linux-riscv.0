Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D138CCF9FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 05:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lG2uVDvklJUBxe0yPaBYZ+DjB1rvBqV0WTjjrNTW24o=; b=Y+30pVEBIe2UxT
	g31MOYog2n8Alh9JyXSe8NNaUQ7C3HitB0NMuEoEw7OHuqkpKgbXVWqDaLw54LwnzmrCDW6a0Eqqa
	3gViaA84H3ZTUhfvfeGvaw3JPatP+BMqXtKp8kaXTcvLEtg5WHZhqka7U7sRv/xXjKcJI8Adft6Ya
	DMx2d1eR/4YZLoM4poVMr8RYSrHCcwSE6ko0bphwo05GLlYMUqbZ1eSwowNPKMdCJQPQL/uBWWh9i
	1v8V4fD/KsA9Ea2udXPBACVgaJ4V7drzFI3bu38igbsAlZIJrIixWiG6Uq7E+U7xhZ/TgPie2erfT
	GZ37eZkX86l6yYd0eefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnLw-00000009F86-3891;
	Mon, 03 Nov 2025 05:43:40 +0000
Received: from [2406:e500:4440:2::72c] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnLs-00000009F7K-3XLB
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 05:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUT13ZicLg4X3Te8Fw85bw4Ef4lnKfEBM+17PRb1qSw5gJjD/jFM5WWdmlxqJx/AIh8AN9dJpaSmrljqSQwFrJT7Mz9eP5y5YUMRToZYN1u2ywh/H4hGaqWsxiN14durNKQJ4SsZIRxSlHsIu8QQMdHeRq/0gfVJ3tXJyXroGa9NjJk73vA4eBQDubbpf8Pa4MR+MmDh3CIof7XHtqCvOIgKwiNPjtecAkvwYC0e/iMNp/jjrWlbWsSSVxocen/DPDN57KcBLkD9QySEZSv6N8jzVyiJKTUHIto0Rr5nrfEsvaY12I+ygOBoNCnDA9ZqkDtTKAhSp57G7RHEoP00yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeXY72xunNGstOuo1t08R2DF5oWsCXyubVGACEvP38U=;
 b=fYUuxHzvO2MDKjpulrkqAIfddfeiIXGYQsl2i2alYM/PlRDuPmE2+fcNpAXU+tOvYMEZ4b+VHNiecoDHF1cx3iwRgVq1WIOOoQ48PNN46cpqXNgjiLOD3ckXdvsmbE7olc1qSPW7UVFC7HVXGpU7h20iKwgsP8VpjRZJexQYNf+qNQdD5JSXspInwyVm/DzpGmw9wEuSbqJ4kzfZqefuqnePaDVeLIEvIpgWWXHAFHZZ5NySYjY8M5b9qBu5p+1NFmWhOurcSxokVZE7SRE5T8r0cL/m7lcHZ+cC+dNiENCAdQRngkI6vHF4XMk7j4tPKEh0t4wope/w+iG7HnScYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1161.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 05:43:19 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 05:43:19 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Paul Walmsley <pjw@kernel.org>, Albert
 Ou <aou@eecs.berkeley.edu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 4/7] riscv: dts: starfive: jh7110-common: Move out some
 nodes to the board dts
Thread-Topic: [PATCH v1 4/7] riscv: dts: starfive: jh7110-common: Move out
 some nodes to the board dts
Thread-Index: AQHcPnMGLgoyKoUQVkqHe8PuZyz3nbTFYw0AgBsEhqA=
Date: Mon, 3 Nov 2025 05:43:19 +0000
Message-ID: <ZQ2PR01MB130777E3D480C7805A57F493E6C72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-5-hal.feng@starfivetech.com>
 <7e31b240-2ffa-4946-af85-aaa45fe35199@freeshell.de>
In-Reply-To: <7e31b240-2ffa-4946-af85-aaa45fe35199@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1161:EE_
x-ms-office365-filtering-correlation-id: 72de3b31-6ec9-461f-a7b3-08de1a9be4aa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|41320700013|366016|7416014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: 0McMzjwhzLQysbRh6rpBTaOTLG5cceti2NGNmFmGo+no4mS4M44qx2rUr/XnVT/z6kEz53TSJCQ20ySz48IaDbB266UErucnLIWZTxERUDgdtbchDeEN8FIS5fXfKF+jFeE9dW3Joxf7oaVIrHhdm4U2qvOJvmGUGUPlowpO26YHOO6bsxE++ojb7Qfccg4AyG2eT5qKRMWXd2oMP6jmJDBbFY8XRtqVMNUlNchIhZpCj0t8FwR5aFrS3WfsBNfq75GQvy8pHOhIzedRvK5iajQXG4XVFNAh6YXjH6Dj7Ueitlpd8thqAqCYZjeY6/XGifjti3wtsuqD3ig9ODTbDFz5kBPWbET9O81EdJCv+Pw9hYbAhOFtKW69qz9brSJuJTe7LB0U4+iPE3U/2Oh14FCAxRa4EBV4K5cb6oY1H6AfSGrjkJkeZBm6qD70rqYzgeZbDE7H6J9AyFIyqtfvggM/4UpOtE6ncMYI3jAX9Yh2zz5caoZB1Ilr2Y6CUOpHgT9FJ/E31SX3awi+sRutPnrHE6lWXfxVejdXwPuenLVVYLBamkcUXx2V7IMAouA/V0SlrjULGaB5WTng0EiyCif7jbHQGKDuvrN0RC2HPdc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(7416014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2sxWkxwdUYxNDNZajVhMGhPL2pLcDZjRFFwelowck9USlZJY1Y0S3g2L2sz?=
 =?utf-8?B?NWRuVnJMZVd5L0YreTZsYU1NdVhDcnVQV2p4Q0xhNnZwVGRDVTFPVE10Q0pw?=
 =?utf-8?B?V1YydEdQYTRSZHliaHFyckZnWWxEYS9OR2NXeVlXWnhjbXpoQXlTTHE4NGY3?=
 =?utf-8?B?OFg4NEVGRlVxQzJYOGcrQzAwY1VSNEk5azJLWS9KNzhTbDJVenRTYy9XRWJs?=
 =?utf-8?B?azM3Yk9wclltOFBuU2NoMmNiSnoydU5UeDRMQzZsVmUzaEQxb1ZsRHBDeWVC?=
 =?utf-8?B?RlZtVEdhR3BLdldWVzE2V0ZGRVhTeDV1eE1CUVFyVlI3MUtoeitmRjVqNDZi?=
 =?utf-8?B?cHp4NVJ2RnVuREo2dlNFZFVHVC85SEQ0UlBQVU5GYXdENUk0a3orWXpSVERy?=
 =?utf-8?B?U0RoU3lJQXJJN2JBaW1sWTJRUndZU3hlZGxMZ2xlaXU2QmVhT1BDTGVjQ1Rv?=
 =?utf-8?B?L3FjRG9udFY0NXg0clMyaVpobG9heE52TkRUemJseUUwY0dSYnJ2YkFsTDJr?=
 =?utf-8?B?S3Z2N2Vwd2E2UG5mdzI4ZG1yNzRYTlc2YkFQRHRtdjFUV3pFQkgxQk1ZWEk2?=
 =?utf-8?B?VzRXOW9YbDRnVEpEbTArY3Uzdnk2QytMa2Y5Z1p3SXE1dlE5Y21zdTYrY2ZX?=
 =?utf-8?B?OVQ3QkcvSzVGK1BCaTBwLzVmQWJ3ZmI5WWxvSENKaWJsRVVnNmI2NExhQkFt?=
 =?utf-8?B?ekxFWW9TL2M3K0VlRHZiaXd2Z3lJdXdPUFJpQlZSNnpRUDNUbGV2ZmlWSEFK?=
 =?utf-8?B?OXlmN3l6ZTByS0YvQ21mUTByVVNBRVh0dDd2TVdTUWFIU1Vod05SWnpSQXdT?=
 =?utf-8?B?Szl5NndHbjBsSjdyQVZBcGNMamtIdU9hZHROM0EvVWtuM3pjcUpweWJHQUVY?=
 =?utf-8?B?SHo3OXVOc1IyWUQvb3djRENCWFRzVFR2R3lqR3JlTXRPMjhqeUwxWmRYOURJ?=
 =?utf-8?B?SWJKaUJaL2M5b2l3VDZ2SkxIQXF2QjQzNXYyUXNSQS95clhkdWNTVGZnZ0xY?=
 =?utf-8?B?cUwxUHRoY25MNnNNZEFzR3NGdVNkblZOTFpMMjFyWjJhMTdRNUVxSWh3ZkJz?=
 =?utf-8?B?V1VPYVp1ZUU4Z01CdE9zMXdveWZtVHZHbytnamxEOFVjd0E4R1BHWFpMeCtN?=
 =?utf-8?B?TWsxdklZbHhaUlMrcjRwWXRmWXBzbGlIUFl5Mk5PalRWRlZxdWgrZndGSVJu?=
 =?utf-8?B?QUdoOFltR3Z4MjY4T2ZZdWlOb01Ma2haQ3czSzNSN0dJNmh6MVkxaktkaDZV?=
 =?utf-8?B?TlUvYUxCd0N1QzFrL2ovUTlDRzRGTUFsdThmSEhoalZTZDVUYTJmbHBwb2ln?=
 =?utf-8?B?Mm9pQ0tMamg3bG5JQ0RPWWNSb3RsYVlVdncxODdsK0U3ZFJKZEpyVHJGU3hk?=
 =?utf-8?B?N2tkRGFZQ093WUpMRTYzbDAzemdWeUVyUXViTGtFT296aG1zWCtVMGNHcFVU?=
 =?utf-8?B?NG9weDhtWEJPQ3dIOWtwdS9zYitXcS9jeVhLd0xFeGZUTGhkcGNUNElkYTBH?=
 =?utf-8?B?OEw5ckovN1RBckRNZE8xb2w1L3BTdWcxTUpkMFpkb3ZOeXNvdzFVbVZxRGM3?=
 =?utf-8?B?TnVuUkt6R0hQTHBQaGZyaktIWmQ5RG5YRUNmTFFVbUdkTFpUdGtUSXp0QlZ5?=
 =?utf-8?B?L2JaUENnNGhSMDdWTnNvdUwvK1R0SzBKYXlhSDV5S3JMaGkvR2hSay8zYzBi?=
 =?utf-8?B?N2hoUTF3T2FQRUlna2xQVlBDajNJYTgvbUN1THpVaVJjTzNyQUVUU1hFdFpZ?=
 =?utf-8?B?b24zKzYwZ0pzSDJIamlIQUxxWFB5djBwY09QTHNNSlhRTmNvZkpnSUNFa1pq?=
 =?utf-8?B?Ymh5eHhlc0crdG1CU2xhUzZYcG5XNnJRT1ZjbVNGMGM1UGFYZnZIZjZvVnVy?=
 =?utf-8?B?UDRRRnZXY0I3MEJkakYzN3ZpVW01L0orQ0Vhc1VxUzJocThsTkZEeS84UDE0?=
 =?utf-8?B?bkQ1N2tia01XSmsrT1hqeENUV3hUV3BOdjlKc0RkVU8vRHlVMCtOejJieXJX?=
 =?utf-8?B?WlZQNkR2WUdHeno4bXV5YmdWNGdMcVZndWQ5VDdoN0FYcVZRZHVrWkpNOW1T?=
 =?utf-8?B?dWdCVEdsNzlObXNXeHNINzk1T2owRjA2RzBkVW9SRFZKUFRIeGhmaWxWMkRU?=
 =?utf-8?Q?bmQ8X9O0RRvdoSQR28mXRMieP?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 72de3b31-6ec9-461f-a7b3-08de1a9be4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 05:43:19.1788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZfC2zavoqFT6ofOJU/IlGfzGDT4d2gAiqCM+PR327OCWROTNF5Shk7Q+OW4JrACzqjRlsJOI1KNRI2jeHNZBq4+VOa1Aj81WkuuTn7/bWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_214337_062977_F2BCA68D 
X-CRM114-Status: GOOD (  14.27  )
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

> On 17.10.25 06:56, E Shattow wrote:
> On 10/16/25 01:00, Hal Feng wrote:
> > Some node in this file are not used by the upcoming VisionFive 2 Lite
> > board. Move them to the board dts to prepare for adding the new
> > VisionFive 2 Lite device tree.
> >
> > Reviewed-by: E Shattow <e@freeshell.de>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7110-common.dtsi      | 19 --------
> >  .../jh7110-deepcomputing-fml13v01.dts         | 46 +++++++++++++++++++
> >  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 46 +++++++++++++++++++
> >  .../dts/starfive/jh7110-milkv-marscm-emmc.dts |  9 ++++
> > .../dts/starfive/jh7110-milkv-marscm-lite.dts |  1 +
> >  .../dts/starfive/jh7110-milkv-marscm.dtsi     | 32 +++++++++++++
> >  .../dts/starfive/jh7110-pine64-star64.dts     | 46 +++++++++++++++++++
> >  .../jh7110-starfive-visionfive-2.dtsi         | 43 +++++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 -------
> >  9 files changed, 223 insertions(+), 35 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > index 5dc15e48b74b..8cfe8033305d 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -281,14 +281,8 @@ &mmc0 {
> >  	assigned-clock-rates = <50000000>;
> >  	bus-width = <8>;
> >  	bootph-pre-ram;
> > -	cap-mmc-highspeed;
> > -	mmc-ddr-1_8v;
> > -	mmc-hs200-1_8v;
> > -	cap-mmc-hw-reset;
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&mmc0_pins>;
> > -	vmmc-supply = <&vcc_3v3>;
> > -	vqmmc-supply = <&emmc_vdd>;
> >  	status = "okay";
> >  };
> >
> > @@ -298,8 +292,6 @@ &mmc1 {
> >  	assigned-clock-rates = <50000000>;
> >  	bus-width = <4>;
> >  	bootph-pre-ram;
> > -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > -	disable-wp;
> >  	cap-sd-highspeed;
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&mmc1_pins>;
> > @@ -444,17 +436,6 @@ GPOEN_SYS_I2C6_DATA,
> >  	};
> >
> >  	mmc0_pins: mmc0-0 {
> > -		 rst-pins {
> > -			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > -					      GPOEN_ENABLE,
> > -					      GPI_NONE)>;
> > -			bias-pull-up;
> > -			drive-strength = <12>;
> > -			input-disable;
> > -			input-schmitt-disable;
> > -			slew-rate = <0>;
> > -		};
> > -
> >  		mmc-pins {
> >  			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> >  				 <PINMUX(PAD_SD0_CMD, 0)>,
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > index f2857d021d68..7535d62201f1 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > @@ -11,6 +11,52 @@ / {
> >  	compatible = "deepcomputing,fml13v01", "starfive,jh7110";  };
> >
> > +&cpu_opp {
> > +	opp-375000000 {
> > +		opp-hz = /bits/ 64 <375000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-500000000 {
> > +		opp-hz = /bits/ 64 <500000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-750000000 {
> > +		opp-hz = /bits/ 64 <750000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1500000000 {
> > +		opp-hz = /bits/ 64 <1500000000>;
> > +		opp-microvolt = <1040000>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	vmmc-supply = <&vcc_3v3>;
> > +	vqmmc-supply = <&emmc_vdd>;
> > +};
> > +
> > +&mmc0_pins {
> > +	rst-pins {
> > +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > +				      GPOEN_ENABLE,
> > +				      GPI_NONE)>;
> > +		bias-pull-up;
> > +		drive-strength = <12>;
> > +		input-disable;
> > +		input-schmitt-disable;
> > +		slew-rate = <0>;
> > +	};
> > +};
> > +
> > +&mmc1 {
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +};
> > +
> >  &pcie1 {
> >  	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
> >  	phys = <&pciephy1>;
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > index fdaf6b4557da..c2e7a91e460a 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > @@ -11,6 +11,25 @@ / {
> >  	compatible = "milkv,mars", "starfive,jh7110";  };
> >
> > +&cpu_opp {
> > +	opp-375000000 {
> > +		opp-hz = /bits/ 64 <375000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-500000000 {
> > +		opp-hz = /bits/ 64 <500000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-750000000 {
> > +		opp-hz = /bits/ 64 <750000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1500000000 {
> > +		opp-hz = /bits/ 64 <1500000000>;
> > +		opp-microvolt = <1040000>;
> > +	};
> > +};
> > +
> >  &gmac0 {
> >  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> >  	assigned-clock-parents = <&aoncrg
> JH7110_AONCLK_GMAC0_RMII_RTX>; @@
> > -22,6 +41,33 @@ &i2c0 {
> >  	status = "okay";
> >  };
> >
> > +&mmc0 {
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	vmmc-supply = <&vcc_3v3>;
> > +	vqmmc-supply = <&emmc_vdd>;
> > +};
> > +
> > +&mmc0_pins {
> > +	rst-pins {
> > +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > +				      GPOEN_ENABLE,
> > +				      GPI_NONE)>;
> > +		bias-pull-up;
> > +		drive-strength = <12>;
> > +		input-disable;
> > +		input-schmitt-disable;
> > +		slew-rate = <0>;
> > +	};
> > +};
> > +
> > +&mmc1 {
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +};
> > +
> >  &pcie0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> > index e568537af2c4..ce95496263af 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> > @@ -10,3 +10,12 @@ / {
> >  	model = "Milk-V Mars CM";
> >  	compatible = "milkv,marscm-emmc", "starfive,jh7110";  };
> > +
> > +&mmc0 {
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	vmmc-supply = <&vcc_3v3>;
> > +	vqmmc-supply = <&emmc_vdd>;
> > +};
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> > index 6c40d0ec4011..63aa94d65ab5 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> > @@ -14,6 +14,7 @@ / {
> >  &mmc0 {
> >  	bus-width = <4>;
> >  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> >  };
> >
> >  &mmc0_pins {
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> > index 25b70af564ee..af01d3abde2f 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> > @@ -21,6 +21,25 @@ sdio_pwrseq: sdio-pwrseq {
> >  	};
> >  };
> >
> > +&cpu_opp {
> > +	opp-375000000 {
> > +		opp-hz = /bits/ 64 <375000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-500000000 {
> > +		opp-hz = /bits/ 64 <500000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-750000000 {
> > +		opp-hz = /bits/ 64 <750000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1500000000 {
> > +		opp-hz = /bits/ 64 <1500000000>;
> > +		opp-microvolt = <1040000>;
> > +	};
> > +};
> > +
> >  &gmac0 {
> >  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> >  	assigned-clock-parents = <&aoncrg
> JH7110_AONCLK_GMAC0_RMII_RTX>; @@
> > -40,6 +59,19 @@ &i2c6 {
> >  	status = "disabled";
> >  };
> >
> > +&mmc0_pins {
> > +	rst-pins {
> > +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > +				      GPOEN_ENABLE,
> > +				      GPI_NONE)>;
> > +		bias-pull-up;
> > +		drive-strength = <12>;
> > +		input-disable;
> > +		input-schmitt-disable;
> > +		slew-rate = <0>;
> > +	};
> > +};
> > +
> >  &mmc1 {
> >  	#address-cells = <1>;
> >  	#size-cells = <0>;
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > index 31e825be2065..6faf3826c5c3 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > @@ -14,6 +14,25 @@ aliases {
> >  	};
> >  };
> >
> > +&cpu_opp {
> > +	opp-375000000 {
> > +		opp-hz = /bits/ 64 <375000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-500000000 {
> > +		opp-hz = /bits/ 64 <500000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-750000000 {
> > +		opp-hz = /bits/ 64 <750000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1500000000 {
> > +		opp-hz = /bits/ 64 <1500000000>;
> > +		opp-microvolt = <1040000>;
> > +	};
> > +};
> > +
> >  &gmac0 {
> >  	starfive,tx-use-rgmii-clk;
> >  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>; @@ -
> 44,6 +63,33
> > @@ &i2c0 {
> >  	status = "okay";
> >  };
> >
> > +&mmc0 {
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	vmmc-supply = <&vcc_3v3>;
> > +	vqmmc-supply = <&emmc_vdd>;
> > +};
> > +
> > +&mmc0_pins {
> > +	rst-pins {
> > +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > +				      GPOEN_ENABLE,
> > +				      GPI_NONE)>;
> > +		bias-pull-up;
> > +		drive-strength = <12>;
> > +		input-disable;
> > +		input-schmitt-disable;
> > +		slew-rate = <0>;
> > +	};
> > +};
> > +
> > +&mmc1 {
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +};
> > +
> >  &pcie1 {
> >  	status = "okay";
> >  };
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index 5f14afb2c24d..9cd79fe30d19 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -13,6 +13,25 @@ aliases {
> >  	};
> >  };
> >
> > +&cpu_opp {
> > +	opp-375000000 {
> > +		opp-hz = /bits/ 64 <375000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-500000000 {
> > +		opp-hz = /bits/ 64 <500000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-750000000 {
> > +		opp-hz = /bits/ 64 <750000000>;
> > +		opp-microvolt = <800000>;
> > +	};
> > +	opp-1500000000 {
> > +		opp-hz = /bits/ 64 <1500000000>;
> > +		opp-microvolt = <1040000>;
> > +	};
> > +};
> > +
> >  &gmac0 {
> >  	status = "okay";
> >  };
> > @@ -38,9 +57,33 @@ &i2c0 {
> >  };
> >
> >  &mmc0 {
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	vmmc-supply = <&vcc_3v3>;
> > +	vqmmc-supply = <&emmc_vdd>;
> >  	non-removable;
> >  };
> >
> > +&mmc0_pins {
> > +	rst-pins {
> > +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> > +				      GPOEN_ENABLE,
> > +				      GPI_NONE)>;
> > +		bias-pull-up;
> > +		drive-strength = <12>;
> > +		input-disable;
> > +		input-schmitt-disable;
> > +		slew-rate = <0>;
> > +	};
> > +};
> > +
> > +&mmc1 {
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +};
> > +
> >  &pcie0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 6e56e9d20bb0..a380d3dabedd 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -205,22 +205,6 @@ core4 {
> >  	cpu_opp: opp-table-0 {
> >  			compatible = "operating-points-v2";
> >  			opp-shared;
> > -			opp-375000000 {
> > -					opp-hz = /bits/ 64 <375000000>;
> > -					opp-microvolt = <800000>;
> > -			};
> > -			opp-500000000 {
> > -					opp-hz = /bits/ 64 <500000000>;
> > -					opp-microvolt = <800000>;
> > -			};
> > -			opp-750000000 {
> > -					opp-hz = /bits/ 64 <750000000>;
> > -					opp-microvolt = <800000>;
> > -			};
> > -			opp-1500000000 {
> > -					opp-hz = /bits/ 64 <1500000000>;
> > -					opp-microvolt = <1040000>;
> > -			};
> >  	};
> >
> >  	thermal-zones {
> 
> Emil, for your consideration:
> 
> jh711x.dtsi  (formerly jh7110.dtsi)
> 
> jh711x-common.dtsi (formerly jh7110-common.dtsi, cut opp table and paste
> to jh7110-common.dtsi, cut out mmc definitions pasted elsewhere either to
> "mmc{0,1}-card, mmc{0,1}-emmc, mmc{0,1}-sdio" dtsi snippets or duplicated
> to board files)
> 
> jh7110-common.dtsi (includes jh711x-common.dtsi, adds opp table)
> 
> jh7110s-common.dtsi (includes jh711x-common.dtsi, adds opp table)
> 
> This makes sense to me having two additional dtsi files of the CPU operating
> power points (on what is apparently binned silicon) to maintain for supporting
> 8+ boards. The decision to split or not split out the mmc/sdio configuration
> into common dtsi snippets is less clear to me, but we do have examples now of
> all the uses (card, eMMC, SDIO) on each of the ports mmc0 mmc1 so it might
> have some benefit; for sure keeping these assumptions about mmc0 mmc1
> functionality in the one '-common.dtsi' is an obstacle to adding sdio module
> configurations.

I agree with this suggestion. If there is no objection, I will send a new version
for review.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
