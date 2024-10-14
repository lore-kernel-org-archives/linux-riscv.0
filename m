Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD65CF258E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 01:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CnpSgD+T4Nl/WS6T+31F9uj/VLAQ5VjRnTn8fX3CWdE=; b=5D8oelKYfFOnL7
	IErzVbguRh8iLfY/Jbf7rOVFKUCJNUKbZ/IXOSaYwGnex0t4Wt6bBZVwWmn683CyoKiAa0xAhon+F
	nWPq5COVjvBfFv9k+v7Llsuq789SaX/+xWOtxTYdk2gHeL+x0pV2uSfEvu6A9Af5jiOGTTK0c3H+I
	XlgMlISeMrL4kUaYov2kynTN8HCaKJZ5IEzuSSb6W3RwL+QSNwje/7/3uMvjSD5jTTa3eo6JiFJNC
	XVuFc5kMp+PbCmgcyTd/mNdCkZ+bzTcfxeSe0tPgsI4NL4XOqK0uDXMusUX+gV01+29A/3neHW8+3
	5Bh+pLv+jquVBYaXoFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t09aG-00000003SXN-29nR;
	Mon, 14 Oct 2024 01:09:16 +0000
Received: from mail-sh0chn02on2072f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t09aC-00000003SWs-36Ja
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 01:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+JIQv7w+w/OLN3krxNHoVnRRvStH3yv3JcGmgO3X8/Elr5fIa6EaItdo0S8mlV5ZHCxK3KhEyXD7ZOldbAn0OCYEMOvhk2PnFN4P118Sl38N8//eB4aXENNwIKcq9+xDXigk8yVhOFsfzrJ5PMEtlJkeNB7zeKsuPRrHZAZ9VvlNEQWLYPwHQ83XXlmX8MsOsE1em7mZ7Bbpb3p0cZHQ4Y2HryAOPDIA/8ln5UEa0nKNvumnzVBTYl01eX4Wj6/36D8dsMhZD5SDb59DOozhwv6WbjkWsHEshaAi+PGFI93hf8kWRtrsNapalXg4DU7XRCG5FNAeS6j/QUZmw+hBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edFeEyUl3o36dC0SU0em86NpJu7PnB/92fdmiZ1uq4c=;
 b=oORN3CqtzwHV2J6aGUHXh2WEEtXhbWe2Vgwu8xaonp4iBTmPJK4ahZuhYXdhhwlP+avqCIzI7qKWR3URNtB8isdo63q1+gCv6r6YM66TUXNoSwAwVi0p58o6F1Yjr8vwBeKnKQtprX2HcTsxsaWQ4LcmoTc7w/jsll20i1Mi9W+FIxyHJpeWLPWhJLDT1vz3YPJlRlLygH35Uljo09GgQvnwFnp5/P+jtEvS1kmNiRJCn/NEtvBZw0X89fMr0KZG7oHvEF8V5d8oJt9qTAlJEjemnsN6eh9kP3yZM8C+mzXrCgoRjYduNZWhqJOJE9h5L0pWPcfgVzhINPrIegrUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0997.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.15; Mon, 14 Oct
 2024 01:08:51 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8048.020; Mon, 14 Oct 2024 01:08:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Aurelien Jarno <aurelien@aurel32.net>
CC: Conor Dooley <conor+dt@kernel.org>, Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, E Shattow
	<lucent@gmail.com>
Subject: =?gb2312?B?u9i4tDogW3YzXSByaXNjdjogZHRzOiBzdGFyZml2ZTogamg3MTEwOiBBZGQg?=
 =?gb2312?Q?camera_subsystem_nodes?=
Thread-Index: AQHaYuOc3DLoHtmcok6fGjHMmNfPx7KEj74AgAJUtFA=
Date: Mon, 14 Oct 2024 01:08:51 +0000
Message-ID: <ZQ0PR01MB13026F78B2580376095AF7E7F2442@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0997:EE_
x-ms-office365-filtering-correlation-id: 470d2b24-591c-43ce-1d3f-08dcebecc420
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info: TgKwQQkOo8y5b8kgBhBmAB1qxa1pJDk/mgC1Jkj2zAkLj/IQi//QxsB4IOJYPbtlNXDxKwbekr4iVde2qQbSt0K4TMMoUpppVtYUXZM5NNnFVWTuQw0fWy07ylVZQhIcuzezMBKKxlknrf+nonWe1liKhDTmPI1Xe3sYrh5Rjo86lycvSr9XuxDfT+qJzev5WbuXUSB05PQksMglgqXiEvpWFVx1T3RjOcYRBps6wFFZDbeZvXWzCqEIEQ1hPcdtMOuPSVH9+iaP7qQPAm3EZSKMMc2mt1XixyOm+Ks5wludDSR0QxyHr+wv/1dPwuWOKK9WJE/0beAeBY/vVmRFbVxWTEcdL5oEpWsgw6BYTEHwmRcGOLduK+3Op0B92Ll52j4b7M2YMZL1e8A8XCunVT1sSibkzAEWFqzYp9v1zhbIcI318LVJdJIaAsvV4PlYFqEDD+jXbNkQu74HQsE9TqWqZQic6eEwZIiPVZNCn4bxVy5zyNLYmTX4RCMZ08hKnZL7RKZkaW3k2zU6wWig+hJ5f90LRqH+tXVmphLNAasrKCTVM1EBfrhpf9ffVXVy2dD2sAAXOHdySX1/7zWX3Sg1QW521nDDhqqWsWRpvQ61y1zmTrQTbo19dZuz/s5x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?L2oraWNEelRHQ2p2QktWWGZGZmF5QXBBYWpXcmVJS0tDcVpGdjFQcXFkL0tI?=
 =?gb2312?B?NEsyWkNPcHBMbXQzdVBUSXljSndhSUcweEcyRnhiQ1BQR0w1b004MDAzUk1x?=
 =?gb2312?B?UU5kR3QvRW1IU0pCSmF1WW5WRjBTYVVqbUxvUGNFNUFyTW10RXAwQkFENHVz?=
 =?gb2312?B?RVQzdjZ2YVFtSU1LTkE1L3BSM1p4L1REVkgzWGZOVzVRVjd0MjdJejFXMFUz?=
 =?gb2312?B?TnN3ZG8rMnRFUENidzZra1AyTlFuVzlyeG5HWktubnUwajhMQkF2aDQvVjVq?=
 =?gb2312?B?a2Z4VnRKeU5pa3BPTk43VUxOMVYvb2JUNmVBU3l3TUprYmthNTFHNlBxQytk?=
 =?gb2312?B?N3poajNBVGFrcmtpLzRwdzBEakxVVEJaeTNBUWwvcldFR2VpYWhzT0g0YTVy?=
 =?gb2312?B?TEtUbVh4TEpkZTR3dUE4TFB4MUo0NGMxS0UwemVGOEh1Y0RSSzBJVnEyTFEr?=
 =?gb2312?B?N2NYUUxJR0pjUTZBenRyL0hoMzl0dE9xK0EvUE0wNkNyUm80TCtEVmViblRX?=
 =?gb2312?B?aUN2NENaRzZwOVVkazdtZGM1NEs0dFVpcjcxdlV5VmhMZE9hRXRJUTFMMm1L?=
 =?gb2312?B?UWJ0aUZHVis5dnh2VjByVk15eWpMd2syemlqTjBtMjEwczRQSHpsT1BDdDFv?=
 =?gb2312?B?SUs3NzF1Y2FQUWVlOEgyUmRha2tGNjA2azFTc2c4NmluQnFvcGROZnRMYits?=
 =?gb2312?B?ZE1TU1gwNFlXSmJKbzVDTWN1WkY3aVE5ZTBINE1UQVdqM0FWTU9JeXViU054?=
 =?gb2312?B?NnVLWHZQdC9VSnRHQTN5Smt0dzNacUFHWVM3MEgvVkYwRzZzOTFFWWs4Nkxi?=
 =?gb2312?B?U2daWFdPSnErYUF6Vks3dGd6dzQvbmRZTWdjcUhKc3QvRU9EREdqbXpZOFdk?=
 =?gb2312?B?citkZEl1NStkd0J5Y3pUbzZCdVE2TjB3MXZQN3pwUnZZU3RGK1A1QjZ5cUt5?=
 =?gb2312?B?QkMzcUpXa2crbG5lUTZrQU9oaXRjRVNVaHdMZCtrNlhtTzhWWXJWbWtyajVL?=
 =?gb2312?B?THMwUDYzKy9SSlZhYU9JeEFPQ25JanNrMmRGL3N4OUx1US83ZS9kdTNxUXBM?=
 =?gb2312?B?VG5oMVU4akRDSlo0RG9WaVlzTkxRNTBKSGlWTC9JNnFtQ2V2NU1TK2wxbWRo?=
 =?gb2312?B?ODdRWlRTYS9vZTMxMzZhUHFUcEJxTjdHQ3Y0bUxZbnpYcWFrUkNZM2pnd0ZD?=
 =?gb2312?B?ejBtbkRhUlQxTlk1TGE2Q1ZxYTlva0s1aVFkd0hpTG1yZ2hUUW9MUzNYYWRC?=
 =?gb2312?B?Skhrb0V5WTJmTnlMSVNURTlqRjBoQUtFWlNQWTc4bWZIUVNWSkN0Y3BVemxH?=
 =?gb2312?B?aFVSRkVBWTdvN3BhU3FXRnh5L0NEcGsyb1NhQ3VIWkJJdFh4VWN0NmxhN3Uy?=
 =?gb2312?B?R1orVUExaEllWE9BSjhyYjZLQnJYQVlFL08wQ3I1L2ZZTElSUjBPRVlhT05V?=
 =?gb2312?B?Y1RTMUdnRVF3S09Wc1VGZldsU3RWeXR0cnFUUWtTNHorbnVZY0FVY0l2Z05P?=
 =?gb2312?B?SFdZWHg5cnZ0SnJDbGQveGh4VWRacEwwQ1gxbzkybmVJS1p5N0tyRHF5Zno1?=
 =?gb2312?B?WnBxZnpiZ2xPQXZUREY4ZEszRGJoNGNDaGc5UGZZcDJBTkNBUVBuR3h3bStt?=
 =?gb2312?B?cVVETEpnSFU4NktIMld0L0xiVEZwR3ZhdGVGdVBYeDEybFpsbFRGbGxWSmcw?=
 =?gb2312?B?M1dzVERmV2ZnN1RCWEs1dXBwUFloQjY1ZU0zcllpUCtZNi9hTlByYmI3Z2lC?=
 =?gb2312?B?MndRY1hSUWpuMkQ4RkZPQVNub24rckhlZ0JXT1Y4T3RyNXdKUE0wWmhzVGpK?=
 =?gb2312?B?NEM4R2dEUEF5VVNmUUxkTnN4SDdOdVNlb3RqQ1k4dkpKVGVndlJJWjIzbk9o?=
 =?gb2312?B?dSsrQ3AvOU0xMnBhQ01NTTMvVkp6NlF4NmJtVmVPU2R5TWZQMGhjcW1TRnI2?=
 =?gb2312?B?VEpMM0VQUHJ6dW5heDZYM3FIczYzREtkVFc4ZC9iQll3THBOVm80QzFISTVP?=
 =?gb2312?B?NVh2ZytWT21SMGNTc3RpREVJQk9mZTFyNnZHUElYRS9tRzl2NzJPUEZQdkY2?=
 =?gb2312?B?Ui9PRnVyNnhEeFQrQnBPcDh3YVVtdVpwNlVTQVZyYW00Q01xeXQxMjd3ajJB?=
 =?gb2312?B?OXk3U3lXWlEzS0t6TnNmWVg1TmJwNVBvYzZucUd1b0lXQkNSVldmWUkyMmNX?=
 =?gb2312?B?K2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 470d2b24-591c-43ce-1d3f-08dcebecc420
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 01:08:51.4427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jffcDqtcYxzEcabYzpVIQOG/kRem8gJUzkpiAXlk+/EHpsqd5YlzmocNMeRWWrzavffEV2CNdcpNFkfZi8uppocNtVBdMHJx7YdG5qmaLJaSqBewhfvc2nWFLpfeKb+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_180912_809762_43941B5F 
X-CRM114-Status: GOOD (  17.30  )
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

Hi, Aurelien

> 
> Hi,
> 
> On 2024-02-18 19:27, Changhuang Liang wrote:
> > Add camera subsystem nodes for the StarFive JH7110 SoC. They contain
> > the dphy-rx, csi2rx, camss nodes.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 67
> +++++++++++++++++++
> >  2 files changed, 116 insertions(+)
> 
> We have been asked to enable CONFIG_VIDEO_STARFIVE_CAMSS in the
> Debian kernel, which from my understanding and given the device tree shown
> below also requires enabling CONFIG_VIDEO_CADENCE_CSI2RX. That said
> doing so triggers the following error in dmesg:
> 
> [   25.143282] cdns-csi2rx 19800000.csi: probe with driver cdns-csi2rx
> failed with error -22
> 
> From a quick look it seems there is something in the port@0 csi2rx entry. Do
> you happen to know what is wrong?
> 

You need to add your sensor node. You can refer to this patch:
https://patchwork.kernel.org/project/linux-riscv/patch/20240119100639.84029-3-changhuang.liang@starfivetech.com/

We suggest that using the imx219

> Thanks
> Aurelien
> 
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index b89e9791efa7..737ee97a3577 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -125,6 +125,55 @@ &tdm_ext {
> >  	clock-frequency = <49152000>;
> >  };
> >
> > +&camss {
> > +	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> > +			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> > +	assigned-clock-rates = <49500000>, <198000000>;
> > +	status = "okay";
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		port@0 {
> > +			reg = <0>;
> > +		};
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			camss_from_csi2rx: endpoint {
> > +				remote-endpoint = <&csi2rx_to_camss>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&csi2rx {
> > +	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
> > +	assigned-clock-rates = <297000000>;
> > +	status = "okay";
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		port@0 {
> > +			reg = <0>;
> > +
> > +			/* remote MIPI sensor endpoint */
> > +		};
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			csi2rx_to_camss: endpoint {
> > +				remote-endpoint = <&camss_from_csi2rx>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >  &gmac0 {
> >  	phy-handle = <&phy0>;
> >  	phy-mode = "rgmii-id";
> 
> 
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks, 
changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
