Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CFCD2F7DE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3TBEq416319Z1oJoDy1kK4rZRzb7U3D7FGchhsj6vc=; b=Af8xpN32Hesc1l
	+rZW9jNo9QVBFw29R3rVaW5f6oFra9D6Q5kiC6GlSRTCb/FHHbaJ1BkvdTk3d4Wi4ZWjIHaRDAGLM
	YFY3yKNnUg7Nm4WqrRR6ELAXwH3o4y+Fo4SpU6Vu0IOoCpDxbGE3lqoFuCMCt6jQBUKro2iYFQT/G
	ZeEMh5u+uaU4SN/GvBxS/GuETwz2pvGEF02RPTd6Nukc1+Ttt7huw8Hxl1yuW0XtPqPWUSjvIkSzu
	edPfiIaBytNpznI+aSkbpUcBHfp5BxknoWzIha7+1szlyIEZJC1rnDfD+Z+L1mMfSWjd3pCw8e2hs
	ZtHSdXl06n5GRVYO5r6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GHy-0000000DYgl-3xmE;
	Thu, 17 Oct 2024 02:30:58 +0000
Received: from mail-sh0chn02on20716.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::716] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1F97-0000000DQua-2lcy
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 01:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/v4U1FgEV5gp93HVwRwO1WcAK9kYAM0LaAKs+Lu2eq3qqAFX6MvzBtMi1nTflFGsYIWSP+Dg+pJ/au7PNw2SoGx2Sjb8nES598TCoUheJ4res9FaEaWklF9FV4MRNW15lPa2ZvxtoXFcx6vKsYXIslc/lLeE2UHQ/pcVQoWtlBxzCil6Qv9+PE+8sLqvL43ZrF+ZFe4hqB1I0Y75g4xjyc8oxm2L/kTfspwToliS/RQJ9Dxm5HGTFQq33UYxGsF/l2qP5g3HIxy+Qoszgc/XumjofHibSiNAqdrUv8gfL5wRXc5mHloNjbLvXE64wMAU/k5qsYH4TMYL68hBLD1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSuFOGKm/krP4D1hWb3iaW8COC9iL2tsI07K1ylB/Bw=;
 b=kSbSV0Xk/0+Y5X5Zgz50td74Ad4M5SPBoO0CPBfYlwSY8TrNuh1fTM/ch9LkCL+GFI9HMWVBUO00BdXyCxCx6X71v+qH0YBHys0duQ/8XGnUE6Lhu/0iDyw8PGw0rmoa/gouEGkWm6PFrZpa3GKKDutXnc0dOS8RQ+M51apHYmlpsTlsjTlgJKxsaoQDPtcUeTk1Z9QcigDZaRypAnF16AGk8e2+DRNdhtYIy/eD0QBePzcr9JnlZIy3mrI3JiYOzDWSYZi+kP43cQ7EFX2ir3qenjWRur+UHEGCVu02O2EPrZU+KyfY8mg4aEYDO3Z09fOeZUeZHMYF8XtjlUjjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1221.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.29; Thu, 17 Oct
 2024 01:17:36 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8069.016; Thu, 17 Oct 2024 01:17:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYxXSByaXNjdjogZHRzOiBzdGFyZml2ZTogZGlzYWJs?=
 =?gb2312?Q?e_unused_csi/camss_nodes?=
Thread-Index: AQHbIAerDCyRJ1WJg0mmvQeCtV44grKKI3cg
Date: Thu, 17 Oct 2024 01:17:36 +0000
Message-ID: <ZQ0PR01MB1302A45C24808A6067928BB8F2472@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1221:EE_
x-ms-office365-filtering-correlation-id: 3bc433d0-7163-45aa-c274-08dcee497c0e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info: ecK10G+17k+OC3uplEgV+XF/r+X3dHtvKCZKoZfPBxW+1fIS33KSkR2qLR1VvaGareybGwf31VgT+AQShPihCRyi5Yz96HJRSXCQwse8tcUWvUX5dJSW8mpGwd4+Mdp/utyuw5WZLTXrOeuKX6lZYn7lL4XpN1twxbN4ypnOvbFHL93tz7qqfLIT7BYUJLmWUF8A4O/WajsOoNg2NSzDM7KanvdWhyvVFjIRcOAxaQjLEt/z2PIz+uyi+jO9xMV6I51e/icO0mLyZsrYGOFSlGe6P0jtX24twShCjurJKbZ9lt95k0W8iHUEorERI1YXYQrC1UeCeNBcpmyij4FuwT2UcOQB14OHRNrCnVkBKRdSutXZOgj0CTCwWNGUeKbb9/bycjvEvPzM8vRQfS0BaSGM5cJrIn03XNxQn+WrsqV5ndSM72tZO51juqsE2YdS5XxU3Kt6J/HzPKViIrt+BdsLhegNXkfRNcoJwm15EeYNisjuTjLmfWCgM5GzPPj/Ueog22DJOVBfb7YX0CAuhUiFwXhsY7Wqh/kjDN42J3rzsV0oBUYXImotql8yExBWFLnpI4PPgChc3eIJ6fD43OXpOH2MiwdH82/yOmRiv7MNevqpXql0tLOp90fDOV6X
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?a2R4QlVwcnZYSXp6WVk2U2plVjNFWjRYaDdwY1R3VnM1YjRhZmpEbE83NVd5?=
 =?gb2312?B?MHU4WnZtTlc0N1N3VDJYL01BUkt2dUVQcExTZXVBV3FUSnFTUDQ3THZLemNy?=
 =?gb2312?B?NGhZcFhrZkdyODMzK1VmUW1zNUhyZVFMc3dxQjRrMDFZQ2pwbTVYUEdLcW5F?=
 =?gb2312?B?K2J5bGswVTRIR2RSMGsyQjdEdW9hN2FqRVorV2ZYaEhhUFprZjhubXRSOGoy?=
 =?gb2312?B?a2VYREpxd2xSUlk3ci93dzVhblVvOVNFMnBxeVlnc0hvcVpia2t4NUhvdUsv?=
 =?gb2312?B?Nm9QSTZyVnFuTjdnOURYemxqR21uTU1iOGhJczYxbTZ1MVhLNG9CakVtbXFN?=
 =?gb2312?B?L1A1Y0lzMWZQaTZNV0F3ZnVYR3UwYjkzTmJJM0t5cTdoMUVFSDRrc2h0bkJm?=
 =?gb2312?B?aGFMUzRZT3JIZ0hEd0NYNzgrY29Pa2Uxc2QyeWJUeVp4Q1ZIc1g1bGd0YmR2?=
 =?gb2312?B?ZENOUGFhOVRCM21wUTZvL2pjTnUvSHpnOUpxVGdTeUk1VlpmZHhUTGgwSUsz?=
 =?gb2312?B?QjF3c01BbVIxTUlzZHArdjFrelp5SStmTk9oSUJhSUFmTWIwSnVXYUoyRXFr?=
 =?gb2312?B?VStjVmNzYk8ybDBZZS9XcytxZmtQbmh3MFdqZ0JNS1VkRFhrbHh4VlBGTllR?=
 =?gb2312?B?M25UT3V1S2pDVzAyNHc4VnI2elFtalZWOTNsZjJtQ3dqZVI1andHNDBnS1FP?=
 =?gb2312?B?dVdwMmIxT3JiNFZPbVFYOW05QVhyQ3l5WDlNZjl3a1lkbldWcUFTc2M4Wm9u?=
 =?gb2312?B?VGhERjROQ25XR2psS3crbjJYMHBVZk92Vnh1OFhwNG5LYUw2WDgyR0pCdXRs?=
 =?gb2312?B?OU5kc0FESGtuNjRiS3kxL3lyc0lTM0hmbUorUDQ0alExcGI2MUdxemM0dG0w?=
 =?gb2312?B?TmxEejQxeUkrWXA0aUpCc3o5WnhWQ2tyZFNURHRvSWVxdDlxdURxTXBITnFN?=
 =?gb2312?B?Z2lLM3JFa2ltbUxRNGQxSmkyYndPRDNlRUh1aTVSK05HaWU5RTNCa1lHY2Rx?=
 =?gb2312?B?VTFiaVk0WVQ5VjRpTzZsc3dMOFlIOFBzb3lGSVZLU3dXalM5YTlwV0VoZTZy?=
 =?gb2312?B?ajlabjgwZmRiQytCQjBrUDZKem1jZ01jSUJieHhnaGF5bHVRdWZLUGNiVGY0?=
 =?gb2312?B?cTgzcHI0TUJoUlJPQURlbFFFY3JIYkc5YlAwbzFUN21pSWZLenNzWXIvLzUy?=
 =?gb2312?B?UHBCUEYyNVBWRVgwSERGOXZVaU5vWWlzVE5xYzhBMUNGNC83STI0TkZoRFhC?=
 =?gb2312?B?ZTlNY3NOZVpqN2RaZ1hyS1duZXY0YzdVcXNmZ0VocXcweC9lcHBOM2p4cTl5?=
 =?gb2312?B?dnZsRzdrUzd0TEZDdExaYjRwUjZ5ajFZejFMWDNhM21HdkRQSWxaajFkVUJB?=
 =?gb2312?B?UTRucUkwWlpxaTlzaUorUENQSkhxMXZNZmsrZlhOWkZYb0RMdWx3WElXa3ZW?=
 =?gb2312?B?aHlsTTMyUnluQTVWdmdLTk0zM21XcnhnbHV0b1lWRXpOYVZ6OVpkdzFMWUZD?=
 =?gb2312?B?TEh2R090RndpYVdRVUhiVUo0MW11MFMwcW4vai9jc3ZxaCtCUTdzNmtWcENv?=
 =?gb2312?B?OWs1NTNHVzhxcmwraXAzT2VOWWNhNWtpcUtYSHNPdHNZSXVjeEhOakpoR0lP?=
 =?gb2312?B?Q3U1eXNEakFUTDlYRzZvL0g4QTRXczZacXJPNjRxTEdTcmVOR21sYTl3bTRy?=
 =?gb2312?B?Z1hqZ1Z4ZEViS3cwaFNuZ2k1ZmJqTC80NkZ4MGJCQVFXWkJXak11MGM3TTZM?=
 =?gb2312?B?bmZoSlRJSGpTc0RyNDFmYjNRaTZZVEp2M1FYTE5McEc1bVFOQTh5Y096bFFK?=
 =?gb2312?B?L1RQMjFsT2JDL01nQWxmcW9zdzN6MTVnbjZvUVkwLy9JS1BOdmxIZHVGUkRC?=
 =?gb2312?B?TDBlNDBNVmNITkdqaEVPaG90bEtXN0RKUVRWRmR6UWMzK2E3dkNOSTAzbEJD?=
 =?gb2312?B?enA0b1NhK0xCYzA2WUdZcWZaeUREblBVVUdsV2VmeDF2ZVVQV3pDZmZxQ1JH?=
 =?gb2312?B?NXE1VFBDNHB2Qno3ZVgrNkxZd1ZQb1gxRXhYK0xYdE1xcWtNcGZHc2xDZFli?=
 =?gb2312?B?MXBqOWxWMG1VSFdNR1FzZ1pqTy9NKzc3R3ZaSmd5eG1XWk1BTy9tampzUmY2?=
 =?gb2312?B?RysvNnNoSVFiL296c2FYaHd4N3AzMjhBdkVYSTBBRUpXUE16NUtsc20wblhC?=
 =?gb2312?B?RkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc433d0-7163-45aa-c274-08dcee497c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 01:17:36.0792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnhMflEo/WNHEixaGXb4Q8UZ279B1bcCmixUlzm6Z7kRTV80mES7Lqmnzoif+OgdCTQ1iz1Ivea/aNxBfLg7EBG897ZH1RFo6gtFfYkmi6/xMmmMQ1ghVGNhD6CibbBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_181745_723896_8D99D3AD 
X-CRM114-Status: GOOD (  14.40  )
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

Hi, Conor

Thanks for your patch.

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Aurelien reported probe failures due to the csi node being enabled without
> having a camera attached to it. A camera was in the initial submissions, but
> was removed from the dts, as it had not actually been present on the board,
> but was from an addon board used by the developer of the relevant drivers.
> The non-camera pipeline nodes were not disabled when this happened and
> the probe failures are problematic for Debian. Disable them.
> 
> CC: stable@vger.kernel.org
> Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera subsystem
> nodes")

Here you write it in 13 characters, should be "Fixes: 28ecaaa5af19 ..." 

Best Regards
Changhuang.

> Closes: https://lore.kernel.org/all/Zw1-vcN4CoVkfLjU@aurel32.net/
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Changhuang Liang <changhuang.liang@starfivetech.com>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c7771b3b64758..d6c55f1cc96a9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -128,7 +128,6 @@ &camss {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
>  			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
>  	assigned-clock-rates = <49500000>, <198000000>;
> -	status = "okay";
> 
>  	ports {
>  		#address-cells = <1>;
> @@ -151,7 +150,6 @@ camss_from_csi2rx: endpoint {  &csi2rx {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
>  	assigned-clock-rates = <297000000>;
> -	status = "okay";
> 
>  	ports {
>  		#address-cells = <1>;
> --
> 2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
