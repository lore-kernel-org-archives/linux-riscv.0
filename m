Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69C7F5A8CA
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 00:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LVdHiFjuLQoFjwCkgamYCRE1XgRyTd/bA7jgSIeFRI=; b=QmJglcdkL6K0bh
	S8YzDZv6Mz5+lefyN7Sx9g9r9AXUgtkkJKUC+XTeybtu199xgSlqLFggflBJ9uapOCER+g+VAaIii
	arx7tXkjgxAz/htJWS/GKJRLhyEtbl31bYRkVSKDrcz7JR2UNXCg2AvhfljEEY7hP9VENkwUhY+x1
	bz+c5xQP5yw0B2e2Luel+bHIm3YxYzl1qOw0KGf7PzgcTk1gRTpryY56j38BtV9008hQK4wSQPFdg
	5RoL5slJanurds74T27i9RN1w7x5Hqv40UKjLLofR0/mS33Tmc5TO1ikXw7uKln/6fr4cIN0QPm+5
	Y1k0CX8FR7HeHSUJ0izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzEr-00000007sSj-0m1n;
	Tue, 21 Apr 2026 00:45:17 +0000
Received: from mail-sh0chn02on2139.outbound.protection.partner.outlook.cn ([139.219.146.139] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzEm-00000007sRt-1izU
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 00:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9RMSk0Chbq+lHJSRzColQEURS83cW3/w492wfCviTWssA7EfvRmh2nU7knGro7OCQW5XgGiKRcsiuFjvf/k8mHZ8oOQQ16iZsavwx8g4szjPwGG7TSB9H04ywezFv8ir8PVGjsNvClMehL3ksFpCna2l5oTzukP1P23XL9VnI6z/swpWvYNlb2Z2cMDeU3WXCxKgLTmkijAajLjVJe6twrIhDNpg149jQRcmGg3wbH4o1I5VAzza+SvmpW1s5iXgeWf2QX+FIEGS9N0712V2ZJ9YVCyDkVelS0EQ/ggBUmEozfApuLU1Cb3UdX5vyjK6LGpHaYNYr/GQquUo1xVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNfCfSuKQOr+VHKFCNm3dKNsQsNBeOZKy4LfQs2Wq0o=;
 b=mw2ITMcs55KhgsR0au0Q6GaIPZghJB9e/4JlxM/V1h122q9L/i7ikdfa9a8wFcqn/mJBQZYPH+/1mYp9nEkyrRh1k5xyeWdo/ALDAvx1nL/UuPl/YR7/slK+vdoz/lBEQnPdESvHofbn4NO58j79ywSHvb5bCpl7up/pE5kk1oFff8lQ+pekwJYQFqmUU7TrJByhh1wd10N3OY4af8uINDVkcuoFn0O/zgT01dXlR+x0ewDP8i1uG+qFr81130yPcff4OafFJshS0nVzrbT0fZsoorZ3D3FVb/vdI4+9VYtqL9BpxWTYSyYfFp9gPhOYA8EEr4c3eroWTk7d6q/WkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 00:44:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9818.033; Tue, 21 Apr 2026 00:44:49 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTA6?=
 =?utf-8?Q?_Drop_CAMSS_node?=
Thread-Topic: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Thread-Index: AQHc0MgysTuBFOJbb02mZ6cLoRETibXorjmw
Date: Tue, 21 Apr 2026 00:44:49 +0000
Message-ID: <ZQ4PR01MB12023B16CA8CBA1DB9FB1D52F22C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
x-ms-office365-filtering-correlation-id: 4ccc0d13-4237-4d78-d9b5-08de9f3f3173
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: MRQXRYnfgvXqCdVDwORAj5wORaB4ePkx9a09kVZnAqWSqzTOGMRQKRs8rgp360j3vM++xMG1eIBdcmjNyJAqVua73zBRvHNQtPIc9R/VSb7pZmxASeoha3f2TGmGd72JkK5HDTs7KSGBALW+Hk8eqUqJ5w4+OHtNHwOUFYu/ng6OIAh0lpuok9R9DF1KbrkWqhHDDXmw4Yn+SwIba3Fscryz+5dkqduxnnuFRHaVDMosRQTDmlzUPLIRow/J0wtn5nnVZzpUXLAGJfz7DkbBRGHho0lvaKv2JNKh3/zRUpinSTBk1hJ8aANp60/Z/PfSIjw8MiJXvxXCl+Bo4aEEBh6IYGYjv1kZkT0H1Ycbh2dH+7uzxcYXK2HaVlz68KVipjNY8CyiAcJyQDBs6l8YTZ+GH75FVHx9T6x6PXoqyDXRtLYSdT/SzJ8JQMrP62U3k9RC8To3wF5nReafJJnkmAhxEQ72tXa/jUTZOeY5pCWf7cJqUB8Mm/aEsxmIQDcyK2Iu7TU7vqphiuxPsScl1qOG7odS/64EL0ZhUUt57rVQRbuOItRxc1nFbLNB/ZM14nRFxJKqmh6rNg7gnPAU5yIubrPZeys7tlA8aii0QYI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3ZSbEIyZG9rSlJXMWtab2JST1pQdXZNSktkbFlQSG5CMEhqOFVSdnJHY3hT?=
 =?utf-8?B?TExKWEtaNVc1WC9odFhxaVBBL2NzTGc4eFVOQlNyNG1UQnl6NElLeVFlZy8z?=
 =?utf-8?B?U3RWSkMzOGhkbUQ2UytBaVUrQzB2RC92aU9uK1FaNm5VMjlqTzVERHhRVjZi?=
 =?utf-8?B?UjE0UUdXNzJ6ZUc1RXNVNkE1RXk3OWJjVFkzaUdobnBORXhVNXM2ejFwRHBL?=
 =?utf-8?B?Mms4MEMrMWZ0dUZyZStZdlNtZ2d2N2hZbktCZ2FkNjQ5VytjQmNuZXlWeXJI?=
 =?utf-8?B?d28vYnMzMStTTUh5dXVTZ0poUUp2SXFTRkxsSTk1RGtscFVmUEdGM1FyL1Fm?=
 =?utf-8?B?OW5xUjdzaURHSDhDM0JGcnhWMzBHK2hiaVYyUUt0TEdLaGtsaVFHM2VYRFZI?=
 =?utf-8?B?SG9EYUV1cWR3alZFTlo0N2duWUQ5WFN3c0x3ZS9uaDN5azdUR2NIcGJOcjZT?=
 =?utf-8?B?MVpoTUhMV3dqbXZ2SC9CZHlsRUYzYWNHOTFpUWYyaXQzd0dWOXhLQTV0OE1o?=
 =?utf-8?B?U0xySXRKOU0yRXV0YmxiMjdlODJDRVRsOVU1U2VnaytOR0pNWWRDcmNhbStu?=
 =?utf-8?B?ZTlkZmpTT1pRVWxFK0dVak10SXdSSFo5aFRzaDhvTXRlSzZyc1N1bjA3RUU4?=
 =?utf-8?B?ekoyMFZCZ0JqcVVyT3VMeTdFTXNZdVZPbnE2eGM5QnFsSWllZUpCWUFHZ0J2?=
 =?utf-8?B?MkpWRGc4bjlxN1RHeU1DRzh3TnZTS1drYXRYQld2SW5mY1JGQ01oZytaQzNr?=
 =?utf-8?B?NG9UZGc2T1ZOZzFVR0dRamlmVE12ckx4Ym5Kd3RiLytDYjhtbEhBb2cyOWJs?=
 =?utf-8?B?OTM1WTNkWEcxR0FNdTV5RkdMTVlKbWZobS96ZTJnU0NzRG5nQ0hyYzdqWkdT?=
 =?utf-8?B?WFYvU3d6SzFhbmRxL3BLN09lK0pxakNRV3BBMnJ1L052YXNVaHF4MWR2ejNu?=
 =?utf-8?B?bUh0K2ZjVHNxTnpFVVhtU096eDR4ZytIb09mRHVyRVpBSG1GUlJSY0ZBSVRh?=
 =?utf-8?B?VzNtL0pFaWxibkdlMUpveGZXb0NxS3NqSXdCNGNqdm0xNWhBR3VyQ09ib3Rr?=
 =?utf-8?B?T0hEcTcwL0pmdksxL1Mxbk9tYkwvVkszM1hqendMZitiSFg4K3p3ajRyeWpI?=
 =?utf-8?B?MVlEcGduOUtYalYyUmtLSjllUjZYS2dQTXlrcTRQQXJ6RHJwbkxkMFpOQ0RL?=
 =?utf-8?B?VUppNmRIaENORHJ2K2FxSUljdHBUNG1sbEZ0Q25EcmxVVGx4bjBTNnY1M0JF?=
 =?utf-8?B?VzlodW1xZ3lHVXJvZ1pQeUFoRUNBUEMxSEtqNHJYbTJBeCtGWDRidFpPUzdr?=
 =?utf-8?B?cXZoangyQVN1c2FmV2ljU1JIVlErRldUNytiNEM1dzdGS3FEK3NPampnUnNO?=
 =?utf-8?B?eDFDSXZkclZQODFrTU5GMDgxZE54OUZMNGdSa0JWRGpEZHZKRnFCTDR3THJ4?=
 =?utf-8?B?VWQxN2cyQ3Jna1N1aVdmdWtKNzZOWHpCOXh1WjFHd2tlMWNYcG11WHlycjVw?=
 =?utf-8?B?VUlFRTlYZ3AzK0xWZXlnZ25NZ3FNNWYxWUxqdWJnT1BwbGhzTWx2cjNKa3pF?=
 =?utf-8?B?TXlZU09odXhIcmFkYlZaeGduWGlXVzJwdUp5TTVPeE8yMW9OU1lOdUxyTVVi?=
 =?utf-8?B?SEkrTFFhaGFWUjQvM2NmS3BDemxIK2UvUzFBWnI2cDRyaTdHRmdKcmdiamtI?=
 =?utf-8?B?cFoxajUvSWFLdlNwcDdUYjdPZEhIUTlFRGw1M3FvV2cxdlNkYmpRbHduMDk5?=
 =?utf-8?B?cFQweVlqSFVlbjMwTTBYSUdoSlQzRWRFTFB2dS8zNUxFWlRWcC8wRW1WL0hV?=
 =?utf-8?B?STYrSkc4VWI5OVZOc0ZYdkVkTVFiSzh6MHlIcDFMTXVVYVNvVS9xd1hSRVJq?=
 =?utf-8?B?RUVpVkdFSmYrMkM4UGR4dTk0eHRpN20rdzJSdGNwODFDVms4SUZFTGhZUXR3?=
 =?utf-8?B?cVB0VExEQS83Y3BDYTVZdTBvUDRqZWYvTHpWcE5MUjRSdUd5UUkyQ0FQOEhx?=
 =?utf-8?B?QlpkNHU0MVFnc2VTRXU2L3J3Nm9PS3JOWld5ZkV4QlJnYmgzRU5YV3VqZDVX?=
 =?utf-8?B?WlFiUnJuUFFyM2VyRzl5QVA1Z2FKS0p2djFYUGt2Z2ltRzR0WjlGK1Q1V2xO?=
 =?utf-8?B?ZWxjUEQ4NDR3MUd2ZEtWTHQ5RCsveTBHOFNVeUh0aEowTjQxaTg1RXVtMy9T?=
 =?utf-8?B?OTQzYUNsN2hWcXVMMGpvNUMrVFFoZFRneVFweFFZNFNPQ1M4bHBsVFNqRWZI?=
 =?utf-8?B?VE8zYlljU3dONW1GZlBEeGlIbW5vM0QrVk05MHV5djBSNExweGFtZk5mRTBZ?=
 =?utf-8?B?b3lrZzFzS2ZxdGRMU2FYd2R4aGNBSjA2SVRJMTRMOWVGZDRQQkUyL0FSM1RB?=
 =?utf-8?Q?bWT4i7xQHezMF83A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccc0d13-4237-4d78-d9b5-08de9f3f3173
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 00:44:49.4105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHc12uNsjGAQNz6m3t/BQDw9Bj35fVVyHQFXiiEm4xSNR0S4B4r5i5QeCoManBbFAH8lI0MNJAWlGK9dP6HD1ltGjAcSulg4AjkhjOVKsfgVImfLvDuS+8ia1RdsxSG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_174512_455563_59E61195 
X-CRM114-Status: GOOD (  18.83  )
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

> The starfive-camss driver and bindings were dropped, as they were no longer
> being worked upon for destaging.
> 
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
> 
> Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss from
> staging")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes:
> https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spud/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> Ideally this patch should have gone in the original series, before the one that
> dropped the bindings which is now merged in mainline.
> 
> I've added a Fixes tag so it gets picked in the RC cycles for 7.1.
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 27 +-----------------------
>  arch/riscv/boot/dts/starfive/jh7110.dtsi        | 28 -------------------------
>  2 files changed, 1 insertion(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index
> 8cfe8033305d80cbe6179ed26601ca057ee00f16..a7a1c09a2c9075711f3a214
> a49618911fdc7b421 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -135,29 +135,6 @@ &tdm_ext {
>  	clock-frequency = <49152000>;
>  };
> 
> -&camss {
> -	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> -	assigned-clock-rates = <49500000>, <198000000>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			camss_from_csi2rx: endpoint {
> -				remote-endpoint = <&csi2rx_to_camss>;
> -			};
> -		};
> -	};
> -};
> -
>  &csi2rx {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
>  	assigned-clock-rates = <297000000>;
> @@ -175,9 +152,7 @@ port@0 {
>  		port@1 {
>  			reg = <1>;
> 
> -			csi2rx_to_camss: endpoint {
> -				remote-endpoint = <&camss_from_csi2rx>;
> -			};
> +			/* remote CAMSS endpoint */
>  		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index
> 6e56e9d20bb064e86b57a92d4cb05be330cca01a..9c3e4598747eb5541effe6
> 97044484715569a285 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -1199,34 +1199,6 @@ csi_phy: phy@19820000 {
>  			#phy-cells = <0>;
>  		};
> 
> -		camss: isp@19840000 {
> -			compatible = "starfive,jh7110-camss";
> -			reg = <0x0 0x19840000 0x0 0x10000>,
> -			      <0x0 0x19870000 0x0 0x30000>;
> -			reg-names = "syscon", "isp";
> -			clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -				 <&ispcrg JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPCLK_DVP_INV>,
> -				 <&ispcrg JH7110_ISPCLK_VIN_P_AXI_WR>,
> -				 <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>;
> -			clock-names = "apb_func", "wrapper_clk_c", "dvp_inv",
> -				      "axiwr", "mipi_rx0_pxl", "ispcore_2x",
> -				      "isp_axi";
> -			resets = <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_P>,
> -				 <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_RD>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_WR>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>;
> -			reset-names = "wrapper_p", "wrapper_c", "axird",
> -				      "axiwr", "isp_top_n", "isp_top_axi";
> -			power-domains = <&pwrc JH7110_PD_ISP>;
> -			interrupts = <92>, <87>, <90>, <88>;
> -			status = "disabled";
> -		};
> -
>  		voutcrg: clock-controller@295c0000 {
>  			compatible = "starfive,jh7110-voutcrg";
>  			reg = <0x0 0x295c0000 0x0 0x10000>;
> 
> ---
> base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
> change-id: 20260420-starfive_camss_use-7a229c330e71
> 
> Best regards,
> --
> Jai Luthra <jai.luthra@ideasonboard.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
