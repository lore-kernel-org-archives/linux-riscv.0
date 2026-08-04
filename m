Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA479C55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 01:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dynuUroKDIwW9BSzenHEU3FKNUD7vp0gTIGjPiZld8Y=; b=sm0DM4wNMC4FBG
	F+8MQNOENOJT4ja0MK2v9Q1uIdxAalcmPu12d+Ab2OkTJ+rUKtf9PF1/qBBVYZUTlvgQK5Qpdami2
	vNeMrakjL7YBj9DO/pWk/PzvEZIEa9rlsIXjyQ+7NBznOPNSR7vs1qn/lYE6JqbT9zV+hFIUBYFYX
	lGMV3jOYnTLrV/WXgdTfK7PeFqVQmWZJG9dXK0FuWnUjGwnhMkTiLMVNeKP25Jnee5nefWpdcwPkC
	ihvMkcKzlyFh/7HKYeZ/QSurmUYdBWrjRGCfmYlokx/kyTAR3y1EoyHX4AkPxmC0A45pz/1iorVOz
	pG/0X9TMC97XcL1V4swg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3fW-00000000m2q-3zeO;
	Tue, 04 Aug 2026 01:10:10 +0000
Received: from mail-bjschn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71c] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3fT-00000000m2N-3bZV
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 01:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoQYc6/8O5AvqRcBSZjh3+pKW0Z/6HdVJNtxViN4FEtwkRW1ykNUNAiqLFv+AWap+loq2495qFDZTE9I581ot7HMQSAAawqF45yt5fqMg0gVjlY8N0+QrHVKfuO/vRdSlFSJNIcfCEToEmOUTpg7yJab3H0Dwm0s+IOh3WW1VRT9IXunXOQxI7HXZBEItvbucGs035bQSs/Rt2TZz7jeZqJB67Xv3YwrqlHQ/c9vx2lsI7f1b1JcDbgAuKEFv/gIN7KkxA7SumzYRdUreB+Xi/W1T815sKQllBIDzZhC2QT8zlPeOuHgh61wwA5kI9Ej0/4OYejl27PwXF0YeDVpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqYJ+ptJBHQqi+EOsfYeHf+hG9RvdZzsVz9d9EIh48o=;
 b=nhWlcVyx87kMGRtV/8r0Cf5FDwl2UjCy6yDFfCKDluNADscii6DA+Vf28hsiwEFb+UXnenWV6cnqHie46d5fFCClUhZOBkxow4J6eVDK+xfNz9/1AddcO5mXYBivZzjtNd2c6Xst6GjdsPm7c/T1VhnyyY/0yWL/Wq7N/2TywvW74zcxVaABMWFzqxg70YIsWArIvTJHD5pu+T/aFi1BbMYr7zhSIeFcwmuEsBuXcTU4fkJmSkKaWJWO1IZxTkPq4ENUzffwGXb9qE934Us8GDzD9MW7Kp2je2iZyT2bd9oie7w7ChlhPn5AsEmAXnWoQ7NHWfVFJwCVPavWg8xK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 01:09:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.017; Tue, 4 Aug 2026 01:09:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
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
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHdIYczihHpqGBQtEmjRJKnf0h+hLaLWBkAgAHAuLA=
Date: Tue, 4 Aug 2026 01:09:46 +0000
Message-ID: <ZQ4PR01MB12025A49B142D572311E5D6CF2D42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
 <am_CzLdCkMKeRv_F@monoceros>
In-Reply-To: <am_CzLdCkMKeRv_F@monoceros>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
x-ms-office365-filtering-correlation-id: da74adaf-49da-45ba-ed51-08def1c51311
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: WoITZwsjTlsdvoz8kBPJnztmZL158tmM4SPjQrXwbx1noemXndcFK+dPiL0jWMN1TigyA6DsUHtmOuRNebTnqR34iaz2Vv/wPFiWIcZXW5vQKst6Lne33myGeSNYqSYu2cggWE6B97bkxeJc7/DQMXTVG4nHNNREp0iNTo4BaRF2pWTzicMvFNRBMGzxJog5DC1YgrxveJrsAD6sLyXxgHUod+Iq1Ycbz0jvFcQhfriW0hDk0tEqU7q1NWl0QM2Fmz2dUXeBLZKinqpSdbugsQljBvU46A8+cLVQWGE9W4It9wwelBbe/A1JBJFioy3bFkHZzDrLOWf7XmLTnHjy7+8Zb9FcL4P0mCJXZfQCNd4VW2gl+E+gkDwbdzLDqqJtzmk765enerOVsNRpvKopLrqfaE4rvuOW7tHIs+dLOgDgTz06hhDIeawD5pXDMBro5xOuKS5bLv21NRiBJ+iTTQ6aogR0smLASG4lxPtsF4IRuMDTlrAb5tDHdNdOx6lzgftLjM/f1/WALrGnSUo60IOEnQ1Cklvs8ZnmWvWhXD64xBlRdu1WsegJwoBdpYPu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qQcls6Y8SNTAuUiQ+btrlYtkDKcdVwJsYS+vYwDWAo81sqPyNRIlN+4LUo?=
 =?iso-8859-1?Q?FK5wHNsNNCLr5GJLF1UyFDmQ3qSXiREvhw5MmimSjP9dMfC7GYECa0IMgj?=
 =?iso-8859-1?Q?FUA0BKGCr+s0baEBBASU9JSz68vnQ0u4/apEejHIz0D6dvzPNId3X3tThp?=
 =?iso-8859-1?Q?6cvO6OIuJZzLb+7RKHUswC/ZBzURV6PZmr7WIYu4oNOkkZMFzat3kA7Uf2?=
 =?iso-8859-1?Q?8e3uF/aBNsBMx7uroF01yolBE8bMkCU+PebBPWbVoRYwZWSp17PP5mW7g2?=
 =?iso-8859-1?Q?ntVTZ4dRWd/faEmvQMJvLFKU2RzDaYrGXnU8nqAIT5lCsxWBO64ps0rX5R?=
 =?iso-8859-1?Q?QktExU1Zt787jbmxaqnSjDv9uXVJBf8nUNILIuXUCqZtZDxRajvVCZ++p9?=
 =?iso-8859-1?Q?2sVZEv0+fz6lz1FKGI8+0XWljMZW3PtgxGU75yoXiiMIqSzZryB2P+Nyng?=
 =?iso-8859-1?Q?8HAlHV6+zsFFwMAv0xCRNkyRm8HnIZD4ziH/uwLj0vVxHvjMR+1hnZTeEW?=
 =?iso-8859-1?Q?jDsLX1fHhH/bXnFYrMfkGM5b1S92EdpL49sbIPsDXGagY7U0fovhrNovbq?=
 =?iso-8859-1?Q?svRo8SYqPkm6ivfjZdXXR1uazLdM+mGgiyKrsVWx8NWX2tw2ORr3Te7Zj7?=
 =?iso-8859-1?Q?Kfb4r62rh/U9ye1xkwhb7Pn4RQP9h0BVDVH7rYqZWFCInQOXkJWkaXyAvc?=
 =?iso-8859-1?Q?O4LCst52URGzJgfmpOcqpTOVw6k4rXyHte4jOk1hbv/XEE3s0QrTxU8iCj?=
 =?iso-8859-1?Q?QJPxCsntaQzbF+I0iMX3iOJx7OhMMl0IhTxbqdXCgjwcogdvDOp6D3Bk1W?=
 =?iso-8859-1?Q?qtVFEt17/Sfa2Cfn4gmXLZNBUrkhmr/GcgbD6SfZm6gq81kc1ncoeJXbVN?=
 =?iso-8859-1?Q?pOewQXOQejK4GEyHPXEzLcFssDcL6b7LAIwraU2VGm4QpdfvCwpXmQ82SO?=
 =?iso-8859-1?Q?9bmHTQjV8bzbJmf/jxe59hvx1OddbMfoCo13gAxK5FBruwyRmHddAAq31/?=
 =?iso-8859-1?Q?ZKRPAoWS+d/aUbYb8XoLT0P91RajnpUZ1PkX5krxFauLb0jQwlY3fcTnFm?=
 =?iso-8859-1?Q?EulN8cj3KcwKiZusXC8IB+1eRVv25S0QrstcmO1efeDrwUND1CiITjYWok?=
 =?iso-8859-1?Q?30kUNlh1Ghr4ESdHjOblVGVleQKqcsQh1xBn5MF1fyRsjF3260MLf7CIJY?=
 =?iso-8859-1?Q?pD2JiYx5XXOej6JHrT+xYEtm+uf7tfB/qQHRYc11pNRNIepX56fwYvx5hH?=
 =?iso-8859-1?Q?1ZUBGNly9IeAsAoZRaGmLbdf5fgDkwIAaDKIwhXjQQVFUkBOj4+0jCjiWl?=
 =?iso-8859-1?Q?6BY4+ruVgL2hrNVvR4k5scmdrZDNzEQoOtAX2cttsfodkeqByNxjGJJeQG?=
 =?iso-8859-1?Q?m1XNlBFG3Wjc+ZGVdlus76KyXnxFQdp5Sx0Fswlzr5lFFGaNKBSFRT6V8x?=
 =?iso-8859-1?Q?F3pvvNNqSMJJhVwY+mTk015+ZUFjxU3FalWEZAx3gPiJRSHSEQXE4fpK8x?=
 =?iso-8859-1?Q?/f0o8DOZyA7CaObSAldQrM0Dh4YvJmgP5Fypf/xX9MNZ3p3K7rUoqzYOqe?=
 =?iso-8859-1?Q?WocQTLgbrqi6RztKwDaep8xB9tU6U7N/D3Wq6CVrm8FoajL0/szkZcLp3S?=
 =?iso-8859-1?Q?D4JDtehxWFvitQJPPUU08BC33iHvUtIWpkgtARZwvkUdoSu5zFLD+8m1Do?=
 =?iso-8859-1?Q?BygLcUskNDywyb4l47Q1Ih5XRHovBalBcFFqD+mkxj5Mjt1W3d4q7D/Ntv?=
 =?iso-8859-1?Q?xChpH6TM7ni8QRa9dI4JlibRxY/ldJMhENXnQuJ3U/zT+TcMxaYIpqZ3Oz?=
 =?iso-8859-1?Q?uKn5tdn+5nRYg5dUDg2j60lEJ1Z4Nvg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: da74adaf-49da-45ba-ed51-08def1c51311
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 01:09:46.3827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfQtNLemdfAQXoW7XNZepwhyIqRdwb1PGM8l7njIKPsibwvr8mwBTXdMBa70R+a+8TpAbuiyXeGST+n7XxJ+1Sd4vcDgMaMUOwwX181Bfi+CqfVCXpRXgUpOlBQSX0Jh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_181007_902100_0A098C1B 
X-CRM114-Status: GOOD (  10.16  )
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

Hi, Uwe

Thanks for the review.

> Hello,
> 
> On Sat, Aug 01, 2026 at 12:26:54AM -0700, Changhuang Liang wrote:
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> 
> Please don't include <linux/mod_devicetable.h>, which will go away soon.
> <linux/platform_device.h> already contains the necessary bits to have
> of_device_id defined, so you can just drop the #include for
> <linux/mod_devicetable.h>.
> 
> This also affects several other patches in this series.

Will drop <linux/mod_devicetable.h> in v5.

Best Reagrds,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
