Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEE5CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X338zhdFTMGdicBXh0j8qEtQxtm9uCVc+ZTFof8yaSs=; b=d1avQ/4Wod6Ew4
	xNYL4dgDn38gVm/4v7i6Iu9gIBHLu+j7UjTEiklRY0mjCstl9tDkepfROw7UIHdZVqsw4Xz0YDRqn
	fREfJ2noa3CFN3f8+OqyJuHTpEoE0HEiBkJ6GhP95KJtkiOrH3zO0IrxUycrxMVGAYmxljth0Qhc3
	AUnU2LTT0DPE8Eo8fkLZ9EW3bJ8RGeB9miscE22NtTV1hvFnllHEw5oClIyt5hxmjM29Dg9P0Oy0w
	2j1NfF89dSI+7sX5yH9TrgPKR+lJ1tMeIvcKk3KeK+9Cx6icqr7xiVmKcWP74FPmqyId95vWolJHB
	+sfa4XDBMbhrD94cjruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSb2-00000002kWy-0VyU;
	Fri, 22 Aug 2025 14:18:24 +0000
Received: from mail-bjschn02on20707.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::707] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL0B-00000001fBD-0J9W
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 06:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekJat1GCTx7cQvx6ublZhDzVZ7//Ni1pt74l8LxseFcrpL6l9HbNv31gIIxMm19WRPe9dtVHzTTgPsdb+7SZgGGrbRVG+DD6zE3K0MZxHkMQGDtguHCfWbtNjZ/7VrASxVzVj/NQsmuw8VYif4ROrYMyVI26CTQiuAzXPCku2t3TR3DHX7TOnuGMmN8eMHMAnQU1Apmt8Rbx44AAk93PekfJ5J8vsCUFlakBwqY1a0tTf1NInjebI7qnNX/IMcjgV+xSxa1wXnNSdwOCyUvMlZ3F7b8owKYEv2t7s2EgmOP514Ssb9RFD0NUT+hYRIkWquodmTHvX+CJHj1zY59yGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+hhvWTekUeD61Z85ryEJE/Jj1xirMCylDaVg8k74OI=;
 b=bp0ruRXkfVpsWc8gnLI0TfB4IYgMYnRMk2iQuyqHYHHekzXsBQ9SzlDgR90jZ44S0LHNbFSQcN3LBe7YwVmKJZU+O5RIoaRH9aqgBX+QfmE6M3thCluNVPzuIdV/6vJ95AxLtUUQVdqiIynHqFPmfeLBcG7ID44NktqGX6djfGMVVeF5HFfXNSe+13m1Z//S9FCP07doHHopeD/saeuN8lZ2lLJ86j0FIhpdg2AB24IRfEhHF+XoSyAfknc6jBcuZjUV2fppnU4hHomzI7TXxTlrhJ7Q+yfycK82N7Qz7xIoO2T0uH4VLw3tH5fJV/g0Z0pwzlXMB1SLv5YQTAdoDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::8) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.29; Fri, 22 Aug
 2025 06:11:33 +0000
Received: from NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn
 ([fe80::deb5:b40b:39ff:86e]) by NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn
 ([fe80::deb5:b40b:39ff:86e%6]) with mapi id 15.20.9031.026; Fri, 22 Aug 2025
 06:11:33 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 2/3] riscv: dts: starfive: jh7110-common: Move out some
 nodes to the board dts
Thread-Topic: [RFC 2/3] riscv: dts: starfive: jh7110-common: Move out some
 nodes to the board dts
Thread-Index: AQHcEoPSE8mgXgq1Nkq82wiUiyiF0LRtNbuAgAD4CUA=
Date: Fri, 22 Aug 2025 06:11:33 +0000
Message-ID: <NT0PR01MB1312E0D9EE9F158A57B77700E63D2@NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-3-hal.feng@starfivetech.com>
 <ec1c2ad0-7483-410e-8026-b09eb5e33ee4@freeshell.de>
In-Reply-To: <ec1c2ad0-7483-410e-8026-b09eb5e33ee4@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1312:EE_|NT0PR01MB1070:EE_
x-ms-office365-filtering-correlation-id: 6f96dfd4-9f2c-4185-ff04-08dde142be50
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: cnzKDDp8JoSUwd+nrl3KlQPl90raoqzKaym2d/gLsLxWbAqUb1zL8C7NrRgLAsQ1l2pFQjODanxkozpKrYt5etl80vtQ40K3ZvNop7kqtFK+lCFMfKZu3ZGqrZgFfFhu6iRqZLa3tO+WAUeCec0JNDpwiVTHtS1iojTSqHbzQHwOw1OnVzPN7Jilk2AHJyerm8RsOA5kwTgKxl0hWG9yjGHRxxt48n9A63ZgYzD/O1d5V/oib8fp9kUhPjt4VlojcZy5T9OpG9Iubd38/OOAFnxyDoIywwCaqCOI1GvIyoxLgcFNDAeTMYVNpx/5xHd/cZ0C2KZpn8TBflrRPjdQiCeAHT5Ro9eO7LBK3xXqF6kupvpsmP2/wMoK+C6kTHsT01r3X5vnB3WRtpDweQ30pljRjS+mKNnCJO7KrdjgK20vd+olCl6t6mcs/EfzIWVkAhmD2cV+JahmuyhUNb61G86jDDvvWgSGyckiTYy8xTaGZdei5tDUr5kWiu0Bn+INH3VecbGz1M25JQJ1ub6dxKpAvjCVn/2pFmClHR3EOi2CSj2MbBK3o/tCexGNnnM61BGtIOQyXsy9nZpqkCBPm/5nAaajV3vGC8CO7l3D8xk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0RPeGVyKy9HMlAvazNDeEF3VC9EZHh4R3hJNjY4Wm9qc09QSVN0bWVQaHZi?=
 =?utf-8?B?NzlKVVpJOEVURklmcnlkNVJJYUNBNDNJM0lsVjZvOHJKODQ3Z21Gb25UYU03?=
 =?utf-8?B?czdVWVc2VkNnaFlwd000MzdzRG1HYUxVMmxubkN6RnBuUjVqN1BIRjBZYThj?=
 =?utf-8?B?NnVwSjhWQjUwOW41U0p1Ym1iTEFmdVozL21mRUY3eVBUQVRLNG13aW1jN3VN?=
 =?utf-8?B?emlOcitFdTFmU0syamQwaHlZUTNON1M1a2FQUmNmQmtFY0d2VjBQWGMxYjhI?=
 =?utf-8?B?dlg2R2ltbW1nTmtPTHBXYlNHR3kxRzVZenJmZjdkRjFwNERQNHVDVlFsYnlV?=
 =?utf-8?B?ekVHMEFEcWVzZGduNFBIZlZKenBxME1CT1BjWDh6b21Md2c5aC9pVWNSVWM0?=
 =?utf-8?B?WWVFYTB6TkE5VzNNNER3REc3eUdUeUkwcHZKeXNDb21LRlFlbUliTjZkSXpX?=
 =?utf-8?B?ZXdGL05IeFYyNExPa0pWUjQzdTB2c0xQOUZFLzVVNWFPUmNEOGlEOGsyZ0dx?=
 =?utf-8?B?d1lBOHk1alY5dTVoRHFyeWJuRG92aWs0SkJ5dG4vQUlWV1VYZUl3akFLQmo0?=
 =?utf-8?B?c1hDanBPMFM2S2JGUFhkVHdwNThKZFhGNFJ1cnM5NFVCQkhoak5BbjRTU1d5?=
 =?utf-8?B?RGVPVFo3V0VsS3BhcDhhSkQ4MTAxUkU0eDBvVTBmY0dwUTNud05qZGdSKzli?=
 =?utf-8?B?QllQSVRpOWdwdDJkRncrN0hNZHljNE14MmRtV3A1Z3g1YnpmSi9neHdxcW14?=
 =?utf-8?B?aDlXT1ptcGN5ZkZpUXBPbDVFQTV3VFNORld1RUllV2txMi82d1NvYkQxNlYz?=
 =?utf-8?B?eExyUStIMjJoQU9ENUZxL0xUWDhEV3IzaTBndFpIK3ZPUUF6L2RVNDE5Uytn?=
 =?utf-8?B?OVdmMmJNUGgyY2VYMkZ4bTI0akVyVGFYNHhxYXpkdXhuTDZIMkhtSUhhV0Iy?=
 =?utf-8?B?UU92SEwzc3FLMFB4UnVoV0RYM01GK3E3eGk5bkRXbzhQTkdURklaMTVmMlcx?=
 =?utf-8?B?UzdKSkVkQzBybnQveXRTazVRTkdTSWtHMVNTMVJEb3M1QzNobzlhbUpnemtx?=
 =?utf-8?B?Zndoa1czUjE3SVBhZURuTnZZMFczN2pzSjJYbEttWC9vdWVPcnJIZGhjUGUz?=
 =?utf-8?B?dGhiTk82cjRveVhtNXN4VmxURkYxSStCampPOElGOElVdVFGZVFMdzVqSGZO?=
 =?utf-8?B?L3pENmk5aWY5dzYvSk5FQm9BVFkyQi8rVVcvRTd4bHJ6SzRldGVIQ0p5NVhy?=
 =?utf-8?B?RzN4NGgxYkVPWU1Oc1ZuR05hYWlnRldVOG1VNS8wQXRDWUxaODJRWjZ6bXJI?=
 =?utf-8?B?Y1haeURLWVNHcU1VTm05WkZVbldUQjBoTUNBOXhybzJSQm9PUjBCUmhJVjFR?=
 =?utf-8?B?eTliT3NEVnRDSEtpaWhQdjZlTnR5VDUrK2piaXVXUVJESFhLR0RLd21JSGVU?=
 =?utf-8?B?QzcxakZTcWRrTDJFcnd1ZFZETTBzcUV3SXB1ai9jTGhBaU4zcUtTbmVqVTVV?=
 =?utf-8?B?NHM0SllGbE9rdHJIdTZyOWVnc25sNjdHN09hVlJCZk5VM3Z2ZDVsTXIvRWpu?=
 =?utf-8?B?d2JBTWsxVlJBSGVHZWRhczM0VmtINTdGR1lLSkpMOE5GYzZpYUFpdThEVmJO?=
 =?utf-8?B?bUtYQ2REaWxoSlpjOHVXZnE1em14NHRWby9ueUNhQXlaWnhHNjJXdzF1SVJk?=
 =?utf-8?B?NUY2Q3JGa3kzTzRQZWhzWUptTlJROUpVQ3dQYXU4YWpBMFcxQms4NUpEY1E5?=
 =?utf-8?B?OCtQZ1ZQTFNRL0sxN2ZrakxsUy9TdURzd1Y0cm12d055ZU9kb2FkeTVkeDhD?=
 =?utf-8?B?aVEweHUzTzFvK0xMUlUvSk9IeGVTdGl3NE44N0hLM2p3V00zYkZ1YkxHWWpP?=
 =?utf-8?B?SHkxNkhIZ01OeHhSdnY4V3NndHFCbFRqNjZxdVlGengreVQxbkplVHh4ME9Q?=
 =?utf-8?B?bmRRaDlVUzNHSnBraG52ajM1Q0V6dFptMjFCc2VBdnQ0ZE13elJHMGFIUmVa?=
 =?utf-8?B?MXpXd1JxWnlGZENBT3lhdTgyUmhYYnprbmF6aTZCbW12em90QURVWEZBUFRO?=
 =?utf-8?B?cUIyNWdXUkZ4U2I3M1lDbi9BbTlFTzRMeU1xQkxPT3R5SkF3amxuMWRuUkk0?=
 =?utf-8?B?RmtqR2YvQ2hGQ20vcUkwRWFBNTg1RTkxR0tDRm1EMk9qekFNT0JMT3FuRHZp?=
 =?utf-8?B?U1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f96dfd4-9f2c-4185-ff04-08dde142be50
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 06:11:33.3103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVqWRMN74qH5xM9DTWwAfM73A2ddiFb7vqqwELW11y7DVR7yjLnmleKiA4eid1FWr2GemazxuTCRd76ydwlAcObhgNx6bTWElszxm896uT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_231151_278049_BA513B7E 
X-CRM114-Status: GOOD (  24.24  )
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

> On 21.08.25 23:08, E Shattow wrote:
> On 8/21/25 03:09, Hal Feng wrote:
> > Some node in this file are not used by the upcoming VisionFive 2 Lite
> > board. Move them to the board dts to prepare for adding the new
> > VisionFive 2 Lite device tree.
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7110-common.dtsi      | 22 ---------
> >  .../jh7110-deepcomputing-fml13v01.dts         | 49 +++++++++++++++++++
> >  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 49 +++++++++++++++++++
> >  .../dts/starfive/jh7110-pine64-star64.dts     | 49 +++++++++++++++++++
> >  .../jh7110-starfive-visionfive-2.dtsi         | 46 +++++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 ------
> >  6 files changed, 193 insertions(+), 38 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > index 2eaf01775ef5..8332622420ca 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -281,15 +281,9 @@ &mmc0 {
> >  	assigned-clock-rates = <50000000>;
> >  	bus-width = <8>;
> >  	bootph-pre-ram;
> > -	cap-mmc-highspeed;
> > -	mmc-ddr-1_8v;
> > -	mmc-hs200-1_8v;
> > -	cap-mmc-hw-reset;
> >  	post-power-on-delay-ms = <200>;
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&mmc0_pins>;
> > -	vmmc-supply = <&vcc_3v3>;
> > -	vqmmc-supply = <&emmc_vdd>;
> >  	status = "okay";
> >  };
> >
> > @@ -299,12 +293,7 @@ &mmc1 {
> >  	assigned-clock-rates = <50000000>;
> >  	bus-width = <4>;
> >  	bootph-pre-ram;
> 
> > -	no-sdio;
> 
> drop no-sdio, it is not there in riscv-dt-for-next branch
> ref: https://lore.kernel.org/lkml/20250819-sushi-change-
> 1254c2d2a08d@spud/

OK. Thanks for pointing it out.

> 
> > -	no-mmc;
> 
> similar, I think we should now drop no-mmc unless you can say there is a
> defect which requires it. I have tested with Star64 and Milk-V Mars CM(/-Lite);
> if you can confirm with boards you have access to that 'no-mmc' can be
> dropped then we should just drop it. The correct reason for having this 'no-
> mmc' would only be if the controller has an error when receiving these
> commands.

I tested successfully on VF2 v1.3b and VF2 Lite without "no-sdio", "no-mmc" and
"post-power-on-delay-ms". So let's drop them. 

> 
> > -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > -	disable-wp;
> >  	cap-sd-highspeed;
> 
> > -	post-power-on-delay-ms = <200>;
> 
> I would like to know the reason for this delay configuration? Is it described
> somewhere in technical documentation or discussion why we have this?

The source of this property can not be found now. Let's drop it.

> 
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&mmc1_pins>;
> >  	status = "okay";
> > @@ -448,17 +437,6 @@ GPOEN_SYS_I2C6_DATA,
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
> > index f2857d021d68..5a2a41a7e8c3 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > @@ -11,6 +11,55 @@ / {
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
> > +	no-sdio;
> > +	no-mmc;
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	post-power-on-delay-ms = <200>;
> > +};
> > +
> >  &pcie1 {
> >  	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
> >  	phys = <&pciephy1>;
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> > index fdaf6b4557da..96f6b2f072d4 100644
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
> > -22,6 +41,36 @@ &i2c0 {
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
> > +	no-sdio;
> > +	no-mmc;
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	post-power-on-delay-ms = <200>;
> > +};
> > +
> >  &pcie0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > index 31e825be2065..c9677aef9ff0 100644
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
> 44,6 +63,36
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
> > +	no-sdio;
> > +	no-mmc;
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	post-power-on-delay-ms = <200>;
> > +};
> > +
> >  &pcie1 {
> >  	status = "okay";
> >  };
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index 5f14afb2c24d..d1e4206f1251 100644
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
> > @@ -38,9 +57,36 @@ &i2c0 {
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
> > +	no-sdio;
> > +	no-mmc;
> > +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	post-power-on-delay-ms = <200>;
> > +};
> > +
> >  &pcie0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 0ba74ef04679..d2463399b959 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -200,22 +200,6 @@ core4 {
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
> With that,
> 
> Reviewed-by: E Shattow <e@freeshell.de>

Thanks for your review.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
