Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD7C27C78
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 01:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sitZtI5rsjSrSimV3YEMFLeN6hD+JBqyPps1A+7s3iE=; b=ql08syWfV3bndG
	1QE1mSjLrN2EgiCwbOT5qE0yyprZukzwcH8mTbawncPxmQGG9xNpZojHGMctRcmvYrTdlz9FX8TZR
	8GU0w/siKjIx4Y31r3wk6xkn2vP2N9l+48RdCJAZ6ReQ62P6XI+ispavy11Innae1QZ6y1jzfjQ9o
	Y8v/gfNJKwYanQ+RpFSk6v4o9y4WRDYLs4Ug93vFvrZObakUuxMmx/TGRNHA7yYHbhAny69vHVt+4
	G7kdeK5sGRJIcoZQeSIGWmPgTAG1xB8GbCKHfahc4lzm7B15CmhhLDBQ5c7XZQZhsHCuGDfhyoQxJ
	2/dr2Xj//yPRL3JUxqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHD6t-0000000Aimx-1eiw;
	Wed, 12 Jun 2024 01:49:11 +0000
Received: from mail-bjschn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::715] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHD6q-0000000Ail6-0Yzz
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 01:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN+WIZA4nHCXnvCFhZrjuwbMD93i7hz2oVTgBcKa6wuAc3WS9GbPQmaQVywJoIU7skIMrFFT4cOVrgPd1KRgw5c/qiQ66tH5YIkbFEeVQM6lGFgWTL6Sftuxs9IfMDX72LE7Wx7NkueWYKE5k5bxdv0FME8Sh4ZO3kDf5ssaJFmqsOVOIo0RAkX7Ls5KtT7tkhQarz10bVYQeGRuTBdws9t/KhXrLXk0epzNJLKhV3m5gcCYLlpdJzs7VI7Npq9vkq6lBKKpHq7JyDtg2CYpFJ6rSjCCeOzri2VvNgr7QZKKcDCGsKPY4Jsfp8Oy7wMQRngGuki23QQX1iLVCPlKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZOWGyYhl+Jp5HAj4A6YQPblAkBM6DKRwdTqd6roCwI=;
 b=bLCO5FfAosCaUJvBVmVrhgHPz8CnMMCylO/z7cpfADWHW23TbOJfsp8GpwKycT+wUBg4TYzKjo2TgLvLRv8PPHGnV1Xx5i3NHJaE0UecVQplxDeZwh72pq5WODUrPiI/cBscOHxPgzPpLENqfJvMNnmvg8CglHhuI1trZeWxz/f3PSeBBXWxpnNmzfWb6jf6Zuk2aFBblDPJnpBfKO2UnC9awfUTbDpE7Sy6QIh7mbf2xCQZRqaGRcZz2MR+qXbRO1dYhmwy328xkQXHmrToq87LluJ061tivOnIuR25d3B+PYuClgUImoJZZP1qccXNIIWDvJY3OnUhr5RPiP6LcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0831.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Wed, 12 Jun
 2024 01:48:55 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7611.039; Wed, 12 Jun 2024 01:48:55 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re : [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for
 JH7110
Thread-Topic: [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for
 JH7110
Thread-Index: AQHau6H4HWcv0PbsKE2MIzy9iFiWZbHCwFiAgACdwFA=
Date: Wed, 12 Jun 2024 01:48:55 +0000
Message-ID: <SHXPR01MB0863CFE4519C0D69E961620CE6C02@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20240611015200.40996-1-minda.chen@starfivetech.com>
 <20240611-irk-hypocrite-a53e98e6c394@spud>
In-Reply-To: <20240611-irk-hypocrite-a53e98e6c394@spud>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0831:EE_
x-ms-office365-filtering-correlation-id: b5943f68-2ab4-4e3b-e675-08dc8a81d18c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230032|41320700005|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info: REkP3XbPtL2E/iZ8LSMQ7A7ikRkOGvmrvl9wJK2QD9CLTuYRqUSojsszPhRrHwJdPlFEBc7pbKLsmpV8/46E5Q6sv3xcSr6xPPl+BEYOT6AtnuIN1cSWNZyq2DXCERaKpaOuVQG9S9okMeDGz/twtyThOoT1JKYxhBW3PEmosUhcvMYQQMnhLUdUh68HmSWMT+brd/OF0qfBMLUgvJBWVaQQwdjYZloQTuP1RTY/NON5ewSS2iBoi+1U//4HAo0D79T3xhg44tKucChQHr3jd+mTntBXJ+pTDzubfHgNy9Dxm3Nt6+pePd+JozpR5eEOpM86P3MHnSoH8lZszj/tZu0Ip9KEcSEjMIJ66YspSzBl8sizayvJQfRQgvOuUetfxOc3kMl7EcwoArsu+E/dMPb5U5FLHt1G6XWvDRNhmj4Gtz25UmtTHGaxNW49Z1wreFWea5WH7QMaSLDcM35WaWib/YHQh2IGe69twGphFVMg1Zkg+XXqVcuEjxgxqYGutkFdgdx5ZxnS5amlH4NEt+r0CmOQ/TsI3G8JoZ90FjkdZvSBX1U0jAYroJ++2ce9ePNeRegPd/efT1iQD/1h9XkUwQDn0B1DJe5Fhr8OPYF8UEUgM60VWQ5L8KuuFIC3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230032)(41320700005)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uPTxhKZcb92yYp2X/PvHQg9a06W1gfTstFujzB/G7KcYM+ThmZ9eRIl37wNZ?=
 =?us-ascii?Q?LiiOH3gU4i3IBgIv1BjWn/0QNdMPKXcz6gsll0z1Jd1LjIU7cmH3936jej7Q?=
 =?us-ascii?Q?DJkKfPfe7bm9y9lU/5tPdMjKJignka+cZlWvJCdp/rLYWgOlVqGyBrMkHEnu?=
 =?us-ascii?Q?At0zOUnVR1nCPzJvY4CDKUG/nlSBg8cwKkaXFtshbVo+74WRisLNJOOsuj0O?=
 =?us-ascii?Q?vnT0mG9D1D1LmW1+3kR0TwYzHNftj/XxnVYbC4dCugvpmcdnKaLPnvEi2XHz?=
 =?us-ascii?Q?dew7r5v6QiicTl3SCU9JomGd/0f5biXaFYFDTNm2Do9o7eAaZJKYygvOzT9G?=
 =?us-ascii?Q?MNaSFtUcYFgPRNP8UBBqWXM3cGN/nluRPLphXN7hTyayVtZCjqamUYaLiDG2?=
 =?us-ascii?Q?U0ZJ2kOrh4niUA5t/fSVMVd+ivsl9sSWXgtec/aMI7otU8e7Yh/v/pAHTKZE?=
 =?us-ascii?Q?6i2PC9dTzsG+CZrpjVYoIf9kDy7lPwxY5DXt+jm0VAVTVHA69h0gGWPwYZFa?=
 =?us-ascii?Q?wDf9+cnMowuDPIkGb9kcYA0XhjV4RHU2xVbbwPwar0edEJXceJ3pAwwb9/L6?=
 =?us-ascii?Q?qLh3JaguuIsM8FlD657iPna2UNZWyUPZqSQBy/HAMUF3xse90MtlEII6wzRh?=
 =?us-ascii?Q?CA9DOtXrKT74pN7vaIVakezdCq8coHxXJr50MocX6QF3wHGZsxr23a+pKEpv?=
 =?us-ascii?Q?V4NVL+s4s/IBmZBEwha3R/koboIq2HbSONTDIu+maGkTkcEtNqdWofCwfQkL?=
 =?us-ascii?Q?XFmIBzU82HupWOBkFmsx50Ko0bAom1QYb3moymxMYrXa2ieeoCPyzfEas4Yp?=
 =?us-ascii?Q?pkNajMrFKU1zNFEiuSe+atfTPt1oWZQN3kvIzJQS6Tosw4nlZDaRbWI1pkR0?=
 =?us-ascii?Q?IYwEi9BZa7gyr4vLqqLWGv/OI18Rf/HbZTwvqv5EKliHe891+KpCyj+yaac/?=
 =?us-ascii?Q?g9jp2tBK5wO+6e0PAxqj3hplWp7N3nYCmAWtnACVJMAHbGyM/ZTb9JT86diw?=
 =?us-ascii?Q?/VYrfgAuWkGpeJqRG6rmPFOV1QM7qooZgLLwN99fHqN6/j7TKjtJ4psNI5k9?=
 =?us-ascii?Q?+C52PPb89E/tSKkp69rHnKiaFgyV08fii8eRghd0tNZI1Ueg6t30VG2le0LN?=
 =?us-ascii?Q?W3wLGqc+W5XC1L/RiFO+NrCxLVZqBfT/4pm3TNE4lrSGUcXjYcVzphEOJDQW?=
 =?us-ascii?Q?+vxNtIgndyRj+05hIRdC/BacZi6C3IGcQs9NiU93w38gJMHfXU8VAFcZb2Fj?=
 =?us-ascii?Q?3KqB7zhOuxsfSLCylVfsNduLxXbGIgDnb8jLr8Mh173A5INz4wgKG8cYLu5H?=
 =?us-ascii?Q?zmCgmK8YRsyqfTaW8cHkBjwKyFzJbNNgY/tHMLeOi+exEolXbkczsi/mvMoq?=
 =?us-ascii?Q?PeFZ/x9o+epaprCUrySRMk2/ykJQmvjhewVlSc/Z3gWY8daOCB+KOJVpJDcy?=
 =?us-ascii?Q?EOSQDEGCZ36ITnnIyg8nvQMlzLDzSLQaDhwmP6bsDyh+bKGkzL8s1wql4/D8?=
 =?us-ascii?Q?aQm1wshAwXjwmMUg0iV045ucdHMYeQvPpHbpoLiLUJvyKOJyQ92/tWb0nLcC?=
 =?us-ascii?Q?z2o9xP3/fLwhZU1l/88rjsL2odRF+aW6xQCYpbzv?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b5943f68-2ab4-4e3b-e675-08dc8a81d18c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 01:48:55.0702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q57qnS4Gbh4lXzHTRoobpnCCGKxDl7DEzUIEzCQB+tJ2GwUWw5J9FfnX5NlyaxcPXOLxDpQfzk5BIYEBJLoZ4BduDUEXBBlOuHiEELCwyGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_184908_207234_9565EF33 
X-CRM114-Status: GOOD (  12.68  )
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
> On Tue, Jun 11, 2024 at 09:52:00AM +0800, Minda Chen wrote:
> > Add PCIe dts configuraion for JH7110 SoC platform.
> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
> >  2 files changed, 150 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > index 8ff6ea64f048..1da7379f4e08 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -294,6 +294,22 @@
> >  	status = "okay";
> >  };
> >
> > +&pcie0 {
> > +	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> > +	phys = <&pciephy0>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&pcie1 {
> > +	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> > +	phys = <&pciephy1>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie1_pins>;
> > +	status = "okay";
> > +};
> 
> Do all 3 of the mars, star64 and visionfive 2 have both PCIe ports exposed? I
> assume if one does, all does, since they're basically identical?

Visionfive 2 and milkv mars are all the same. Star64 do NOT enable PCIe0, PCIe1 pins are the same.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
