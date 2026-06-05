Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600FCD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 05:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaFReyWSKRKDrcJkeNYLkmu/tdALS8q7ctBrAgmi/Eo=; b=S/zo3bsCxWIBL7
	obrZupyYmyO69+6SHxMB33iyVznDp1lFAG0pHTC2OsDl1s3HpPHv2+lCFl3+Gsk2/YgummvL0pCpq
	cjlGlzgK2WxVfEz1Z63X6eve0wp+LTEu58SJwNFzzLwu9ZdyI+Gtcwhn2rxV7Vukk/ghwEZtRJ9Zw
	iKg8Yz33q1tEXMylI75JCYa+6fCsSv0vZ6iKqRp9m6qOAzW+YIvl9LDOtmHyk1Gh9g8CTUsN6Borb
	DtvRv1yMmZo9/iMiI+xT8H+MHabFPq7rbQl6O078ifBCsdTCnP4p/5+1kYTqEffYyZwpEoSU6aojy
	4eLLmiNXgqfEa+QU3RAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMsg-000000005zV-0hc5;
	Fri, 05 Jun 2026 05:14:06 +0000
Received: from mail-sh0chn02on2099.outbound.protection.partner.outlook.cn ([139.219.146.99] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMsc-000000005yQ-442J
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 05:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2gZ/m0yp7pRQapUHTkd6P39Hy0p7GwE30iTJKhtYSzlUW8JOklqwXejBgjK7ypWzhD3fdjgVdgQEszfsTfW8fpo7O83VfKIJToHZ8x0COl4CmEW6Z3Z7wcEcuUJ5FBuRM/n0QtEi3WpM+52xgwoc1Pk+Eg1rLHn2fcdppIr+WjSQyInhsRYSeo+xcgzMei/0w02vLCXbQ+5V3Sdd7npzFZXmeGUQDxjJKjFIeQVPM1IynEhzrK5Mc7SoiACVNPxpLrY2Zxi9Mf9BjmT+dBrjP2Q+BdIx71uN2VEujGHBeXnznJmR0Ij5nXskMAjkzetKG+hJJrIav12MW1kuwSYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6G25yZMse2l4vDeQL+cwybm1IYx1cQBMYExu1ZE7sE=;
 b=TAmKhsAcruUs2dxcRqqUo3Gz0V/Vpf2wM4StK2AbnFIdwqzdaMC8csU2anxFKkWIERtxKze5zLHqBemmzM39c7WrkobRmzmlI/XbYE95tRdjbWf3TXi8UKs4fil/Ecg43O66upXWuzhqBlCUMT3x2i5ame2s1d32p2xEEPaVpUejUYW1g3SkIg0iLX7gC25VwnHXeIhk/d990vQ4uGZ8FdY9xzIlmfadU5U4LeFO7HKAyK25DyMxPdAk5RMf0Trc5arba/ig8Az6rQjBH+QQIURpQ4C29H2RnNGUq8pij0rnc4YXkAsA7QbrKhb48V6o2XNnwJUKkTk7at2Th/OhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 05:13:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.007; Fri, 5 Jun 2026 05:13:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHc8x1i0QxsrZUKB0iH+Mtg4VCWKbYtCeWAgACVJWCAAQO6gIAAyx9A
Date: Fri, 5 Jun 2026 05:13:38 +0000
Message-ID: <ZQ4PR01MB12021C09262AEBEC976D7642F2112@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
 <20260603-groin-valid-a1d4445f7a6b@spud>
 <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260604-sprout-zips-c2c29e26fe1d@spud>
In-Reply-To: <20260604-sprout-zips-c2c29e26fe1d@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: 93cce37f-55ce-4bae-fe0a-08dec2c13400
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|4143699003|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info: 2BiEhI0fPo+zFLzNbMN0oQa1oWpqlJJCrrMf3S2AdR/vBerzqyVL6k+pr5TEm1wNqOLBkp8548BMfEL+TRGmcPGym43FI+2QNWWZqZx8FHnd3RqEXqXFNppfsziCyJTpInVf0cxX9UvGv1GOD9U2JaUE4UFwaA0Ip3S8T73ZRgGAz4bq0DYmDKs77CRE3Ne+dKAUnSGHsUWuQbZrDhqvv2ZCo1pvm+QnhN0AEwkF3FiuDv26KOIUBmqm9xLKwbBOOftY/QTPlVRzPHejWZK50G/9xd+t/fC/bn9VXKYld1L+RI7R75eZ1QJBDO3epawgPsh83HGGHwqw7mTa2kKmTzEAq2HFGQBNdX52eIvae6MTEypq7xREqbHTZKsiZqB2j3ondPvQm5wMClWYWjCoZlUB4d2utuEn1/P6sGK8zh2RsjQBvJHJQI5/fMp8+kmti9TS4oo6cIBnpgAwAOfukR5qZrB/eFJYkzAD+a84wBXaNdhXo8v/utxwUt13kz0iwkY1FZFOwzqrle+PcHF55B2JSs3ufa0d4WisvaTRYJGzWClAph6pHXfca1jZKCNO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(4143699003)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LfbR13eyqara5TDp99QbxZon3kg+F7dTDbZ6Zz28/PkjtSt4HHvf1gg25Co0?=
 =?us-ascii?Q?oAppAuZeIye66k5SEqNHUP36rwqAXdKTZvegcyiITF8i3OH9WiTQvoY1tL/Q?=
 =?us-ascii?Q?hhCxEh+8hW7k+OIvHjxYq3Q6FY0ZG1rcCtiPhMLrFo/ZEWxPf1X/icXoJq5S?=
 =?us-ascii?Q?7jTUxZgm8rIkg8nX3G9BLwdZ6lXWqT71nPu3ve2mmzdOzKbVpEW6ORK7Y/hF?=
 =?us-ascii?Q?AUa6a9OAC0ApmFMta5ldkqBHZa2YZ1WV/V9YfFzXRAeNEN/Lj2AxfAYIgx8Q?=
 =?us-ascii?Q?94AfJgTkxX7ixIMXbEOEaGpyyBZze5Ou0IbpFlDAmZuBTDLDhtXTmYjjfo1K?=
 =?us-ascii?Q?nBHk4WyKITHkZqppBt+94El625K4R6b1hTynue5AkKBdma5e8Wama/c2Sgyq?=
 =?us-ascii?Q?0lRBVRI2SRy57yZugtMYo23X9WVH0A0jBjPPYaq8GYBvqW+Bzfb96zOTJu2M?=
 =?us-ascii?Q?L3AwvYJfoan4FyRv5e9gtv72cgUxsZQBdxUffQd4SXhD5Ei9Uy+jYeMGR8M5?=
 =?us-ascii?Q?dUC9dprpSPiEQsXcBHPswmorcgzhZihta8vl/Yl8qPRrmQU4P6lK3MCDOOgC?=
 =?us-ascii?Q?82FCIHKaKKMKV8I83OdovK617/8Yqv9fuWD5iHTwEsOwQht+8F7hiBgeSwTu?=
 =?us-ascii?Q?5KOdwKq1jxMQEoPx8pigeR8VANQZnx4sR9L/Ot905UpdhEhBsEMKyHSVzXui?=
 =?us-ascii?Q?AVSHz6hqlxYa3xp82OKeuYHMOGMC5NR02pklNYSL+7nm/j6DxkUU8lHN+sZu?=
 =?us-ascii?Q?UsIztDmES1YpIKKctqtXAd9jnVx7VQ7XMTbXWSbhON2S7lvsbVbSK5oUR6RO?=
 =?us-ascii?Q?bTzOizW0VPSXaSKSiEexffAvPyKyIpVlMGkkKp5F5Mze+Z+Jk2tDDrtnCUWP?=
 =?us-ascii?Q?qj2bHTTu7J44t7vcCLEIeyUsPVEg9esB31wtY3i85o+eKnoqY5UlvCOccvHX?=
 =?us-ascii?Q?1oZY7eGi8kCXqw1tvULa7kTBDw615nDKUSaCkF2ZdRLPQfCQdI3/uy8HLh0T?=
 =?us-ascii?Q?xFbgb8+6a/LKn4KXO/rsS4vjNPCVu9zfxxmISHHn2QgezSUbu8faTxnWVnYk?=
 =?us-ascii?Q?+B1xjoici3tuUJNI0NVcmkrZ/sdd2kxL820HmTpBj3jg56mZKUZ5QK4YC1pH?=
 =?us-ascii?Q?bEm0bT+QD+pYOdithpdIiebXGAjLhfGa3hQeg2TOtMkFF9Rz4GlZoK7YAf0N?=
 =?us-ascii?Q?biGD9W9Ud+F8B+Dz4ghpLXw+C7zssDr67E2jr/Vm/JVQv+3QfrJySi5BeI+3?=
 =?us-ascii?Q?KCZu15Gamfl6Dn2x0FPRnQJnF7eAi8n5aF/F33419u59u3RNE544oqbNlq7q?=
 =?us-ascii?Q?SeIrBzbeA54P2AmB3WuWZXmbYF4dXGvtSDKqk3dp0s6XMn1DFqDfj2pQ7dPa?=
 =?us-ascii?Q?4W8Of4KVGf6MrY1QM0cmSHRJwZJcAVr3XgERLuZih1YBOR2QMJmRovojiPSJ?=
 =?us-ascii?Q?RPpE4JanWnNJWxoXA64R2xjw+9mlatEDO1l5U4DycEnsMYqKpLonMR6UdEot?=
 =?us-ascii?Q?Dx9Aihr7qbV7uzHt5XlQvRuazSCmHKmYMIuVtomsHcbxKoPSS5kNwFK9faZK?=
 =?us-ascii?Q?B66ZMeJRL671ZeU0uCTsoMhG8M8N4VbWw2atelyAeJ/A0X2f9asdFuG0VbmE?=
 =?us-ascii?Q?DL6cT/7+q4QI4sA5XxStZzmAGZXNRG1NZVw9fc9vKdA+gC+scw/gZKBpo1oI?=
 =?us-ascii?Q?1tqiubWOHTNvTYIWogmlyIpC9U7fQqsBqwxg0aCnOzaHQjYQwUv5CsJ7QjPg?=
 =?us-ascii?Q?/0XUBNqcF9H+e9pvNMBPqwuhjQAOli8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cce37f-55ce-4bae-fe0a-08dec2c13400
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 05:13:38.9903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svdPdoIK1jO7AjzW8ZRCLFO/BUZBVZPtK6eDKaU9nwED8BTQzn9R6tVIT8i4SdB0SfxSeztuLg80i98TpRa+3zR779nxpFgJnZPXPvjpQ197eS6cizNPUOCPM+I+jWc5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_221403_010874_F8995A1F 
X-CRM114-Status: GOOD (  19.27  )
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

> On Thu, Jun 04, 2026 at 01:37:00AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:
> > >
> > > > +          slew-rate:
> > > > +            enum: [ 0, 1 ]
> > > > +            default: 0
> > > > +            description: |
> > > > +                0: slow (half frequency)
> > >
> > > Half frequency? Slew rates are usually measured in volts per second, not
> hertz.
> > > Do you know what the slew rates actually are and could put them in
> > > here as the real units? Or is it just "slow" and "fast" in your docs
> > > with no precise numbers?
> >
> > Yes, there are no precise numbers in our documentation. I will remove "(half
> frequency)" in the next version.
> 
> If the rate is actually half, then you can say that. It's just "frequency" I was
> objecting to.

I checked the documentation. It doesn't explicitly mention "half"; it only describes "slow" and "fast"

> 
> >
> > > I've got no questions other than this, so once this question is
> > > sorted, I'll be happy to ack all the bindings provided they're effectively the
> same.
> > >
> > > > +                1: fast
> >

Best Regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
