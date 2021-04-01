Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC484C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 08:54:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC6B610A5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 08:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC6B610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=aXT8kVSZwFoZ5x7hoTGAOk0KZFDANmbJNFeDYQKqNE0=; b=TdQ92tC6P9TEv9sHmxVZhWB2u
	URCV/ZlXJ8OlpBKuNxqv2FRxXqKmwQktVxzdhjOj/PZlzCmGtuDOaZ/CZ3wXoGvZ8y0Rv6gZWc1/W
	pzgCB3pnjx4+ituq+qiCb6xUyYPEM2hozbd06GgmdnFNsXRMIGXhd7fnSDo4Qc1b2G1+ppWNJ7ZSQ
	kDaxvv00NxwX8PhTv4F8hTHbgeyiEHKXlGQhs5VhSrVrfUanXGU9+exXJmmozNOer3BnGHQDMPncj
	ntdDXofcp/0lL7ihSEeqbnEY5QVluNUUpLqevX74/xnYwcNWYOZQqE1IGHhln8faKJ9M1xf+aACyq
	TJv8GuTIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRt5q-008zec-GF; Thu, 01 Apr 2021 08:54:22 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRt5i-008zcp-LX
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 08:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617267281; x=1648803281;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=wgjZQtRHIQ90PgYH5pgmaoZowg6Xz4++KCSz9IX7RiU=;
 b=nFnf6vk0SxS0aeglLm2gpUGSQprorQq5X+pP7TJZHiQ2vIeiPypRpuzn
 noWWkmnpbHhTJoM6zVFoBobX8liPj/17AeGCjpSERAnmt+MN4kct4QgWK
 c54XH39lFWLatBPdz2nf4QyOQkfaClBz944IaXDlZHobbCcJyNR5pALr1
 Wo4UGjlm7WGxSXcFbLSrtyUjm5DCTPnMEJj2DFyI90wWpNQnDu9HK89ue
 wirPTn8tNt2QwSmfV6/H0W+UgmaB7G5XKl1F8t658yZU4nzkO6jQ6gfty
 LsvQ0cH9XFQT+KxcPiOFna830srxSAB1dZDfBKgl6jDnzqlF5XzQVmkEb w==;
IronPort-SDR: gKlwEDsGmSo+at/HAdkGsAvaTgN5s2SvhyRbxKZP7Z5g5VAvGCAKo1719o7+gJ4ar5JZV/H5WC
 NWge8TBDzk4DyX8dFsBnNQBjlc13U09wxY819KEEx68KbCEda7AzAieD2BKWbUVqxctx5Wlt4F
 q60O7TGNr7/Tag05rkf85oGwOWOZt6cz9XrjGvdQOisfrqMLFpDyNs6tEuaiQkkWBrk8YIxBQH
 jhzqhya2YTGSWSIJJMDmlK865O6bstsOD8R1ZFmEgNwOhBzDiUQbmSM8exeAvnSNmS2LLs7Whp
 1UE=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="267949969"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 16:50:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwM8J6cdkGrhWsk8QdeH6sNqHc/vVBxmwpQGZ23KmWd2ra+eqIg96S10scypvMCuLcmOz50HX4teuhVHJ/Rr9RFwN4pBGIH260ilj+vOewugbWr7CUb2sDY5mx7s2BMyY5rrPp1H3f67VlXk5mcn/2/hRqVq7CSXBCGs/URY5hbQ/Ops0dFtn2VP0/k43QdWSt9AuGvWHglZ9t4YpY6AH7K7KpfGxqQaKWqIY4HGYb04Ow6D0vOd3BHe1o3qJn6Ik0HzYGUj3iX/g9S1AvuMAs1ciNiBhKo56Z9Bk87EQiM0AZEjemIAsK5tENguNRv0Qj2soy8DRLfEyA537kIMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbShSv/r3BiVflw4Dv7elU7+NfmyITITjavesL6I684=;
 b=VqP+Nf3MHwelSeW2pFlcWf5/aMumQm6DJBR1xB8pdqzj9upj7n/tO2mERZFpb/M0YnkvfaNnbsRdgSsDy2347gkPkoOQitREuUC7Yew4ho8kWWiFJQgLMt3OG31yuhLPQ2yS1wOLVocJF4DPFI9FoQrUHj/o1v0ejDTHlLM/x9ZGOLXNWaZN0SiOL+YEyjysHVB+kElY/Z0Qu70KuGJjUtIJ6vkgKCOdhY83rxQUITc4mHcDtGgFWW4SG5/g8Cg7tASz/N9bc+aUKlv55B2fGobfoId4md2CArB0DKQ7DXl840U19cnNG/Y1Gmv3mQPHfG1BeQw2kTBTxDUpUnEa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbShSv/r3BiVflw4Dv7elU7+NfmyITITjavesL6I684=;
 b=OpJwSu4ydCRTbKSYP6T1pSeB0de2kWgRkx1YIukBb9aKMR22X2pZ70HZekrhHhSDct6tRLrkE3lPnbvScjHhH8RF0NMQKqogaiJHaw48aSIq22xXyb7R4KukVr2WleshrXXu2+ekz/HCX4CBwf7uN2V+DmgVjdsAz+jJFBLxA4k=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6894.namprd04.prod.outlook.com (2603:10b6:208:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 08:51:14 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3999.029; Thu, 1 Apr 2021
 08:51:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greentime Hu <greentime.hu@sifive.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "hes@sifive.com" <hes@sifive.com>,
 "erik.danie@sifive.com" <erik.danie@sifive.com>, "zong.li@sifive.com"
 <zong.li@sifive.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
 "sboyd@kernel.org" <sboyd@kernel.org>, "lorenzo.pieralisi@arm.com"
 <lorenzo.pieralisi@arm.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "alex.dewar90@gmail.com" <alex.dewar90@gmail.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "vidyas@nvidia.com" <vidyas@nvidia.com>, "jh80.chung@samsung.com"
 <jh80.chung@samsung.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>
Subject: Re: [PATCH v4 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Thread-Topic: [PATCH v4 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Thread-Index: AQHXJryVLlFTcA0IMUCQSslO/VnpAQ==
Date: Thu, 1 Apr 2021 08:51:14 +0000
Message-ID: <BL0PR04MB65147AFB577E2087BB36414BE77B9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
 <20210401060054.40788-6-greentime.hu@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:c833:f159:51bd:bd52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bca90344-e5e1-49b9-0ee9-08d8f4eb4ea0
x-ms-traffictypediagnostic: MN2PR04MB6894:
x-microsoft-antispam-prvs: <MN2PR04MB6894F1455F28DDD8FE8B1C94E77B9@MN2PR04MB6894.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xSpGR/bmdG+Jk3t5J3IGgjJjajMPOxCnlnBWWAgrO4eA6lb1i548Q1Wh/d4Dj6JROFiStOwGC6PiLT5Sp2WW1seNVlKzBd2aXZF2SJu9Z8VQdqskkqFC7aIEvXgytmivRnWq05Cf7po8FnIXTbXRUgK6qTUrEjwT+FiONImHxdAg9fCfxl19e0HcRJ+HDOhUwqyoAIjB+6p5y3CIBr49PW4mU1z1osdzxVlU2yEGe4Bz+MGI8JMU5aHPT2C6S0UqXhasBLWEOxKWkCIGTf3DgAEpc4v+hH8gGxjNtTuAUx9CzQrBDxu6NbbqIKs4zHsJejOSK84PAuBtugJOpXMIkdD95G69OpuLMgVmBMKXevS79DWqNVBqWOooczDfsCQBtmIu+Qg0Ji9IXksKHW6s52DKY4MuygoQusfYa7NtU640U7BHXKzA0ZnpwjdqlAiOzH08z9GwuUmL8K5cTZWUXoFIemwjpEwAv1OG/k3egyfjN0QGUdvex6LrvgZweOtGnuxqQcWL1kt010qhF4bTtgX+4rjShmhJxXwGSQYuUz0kF/oYR+R6Odiq1+DTuQihqJijpWu+DlzaFnoLFW+DUibuC9ywlbIOqFPM4jz3xBCguMD87M2odZ6rn7KsfaVxgTY/dWdpehSkeKG+q6ADqOy2wFIs9+kpkA5W5tpBAHCIs2lSo+pNTU/+34xC4B4qZ+xFjkj0u4Lqh2LqnDBW+e/QUMTQ+JiiXYkV6r5iYXcRW7gbCfX75iBMxvph5ya9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(186003)(110136005)(76116006)(8676002)(86362001)(66556008)(8936002)(7416002)(478600001)(66476007)(66946007)(7696005)(91956017)(66446008)(30864003)(64756008)(52536014)(316002)(53546011)(9686003)(71200400001)(6506007)(38100700001)(33656002)(55016002)(921005)(2906002)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?usIJvPeXyAX2irWqKZu4r0l2IeJmYYPvwIav57+7fHsezA8N8JP7eZmform6?=
 =?us-ascii?Q?pdXsoGAdtx7iDJn2Czv/rOj5+IkijHyV7CbWl4alUH0p3cRgt31l76N7+QXH?=
 =?us-ascii?Q?yNV4G/JxeH9HQCBiw0PkwRxxlRut0GeVYXmCS+oIku0PlBPeNzTOOfmuAAu+?=
 =?us-ascii?Q?l+QX/e4/CARaF/t62S9+I5Vc2bvVPzcLSthilJQGgKdqJQ13MUKH056WxOYf?=
 =?us-ascii?Q?DGQxqEu5lEL5RvAyXJP6fyune/aL9LJyINZue4DybhIzoXdOvOspfXaVsgJP?=
 =?us-ascii?Q?r440+3KxNb2y/f1TNLkpWgvA0Wiuw2c88M8UHV6dEEdNTmOdAsKStC+Zvnn2?=
 =?us-ascii?Q?oIC/+/zYRWEyIjtt0/CCD5I+dnn9/WeOdFuf/8CSe2YnFAZYTSEwjGj2A296?=
 =?us-ascii?Q?rHzkh5+fQg1siwYl74AWWkKlk1GQIazWwGXbsraH+3k+4xO1BCMUJp/uS3q7?=
 =?us-ascii?Q?nbgk14Tz3AcDRszG6HPurxlBLQd4dlKOm6tWQSgl+9nWbwobSpd9O9Ppf109?=
 =?us-ascii?Q?Rq42GqWniw6x6Q6F+UBIJWX8EH0PHh4ckKPEuBgePKuQJAKR5afF8vGu47sg?=
 =?us-ascii?Q?Jp0iQ1WRhbE9RaBOGtR3/J2Y/eww5VPeuP4eQY001y/HLAijIwSeW48GT3jp?=
 =?us-ascii?Q?A26FnkTdw10JF9LAJRLx34/xxJ1Idz0jlQqsuvooQYqKlahRfgpSqCPa8G33?=
 =?us-ascii?Q?5GiQ0fjlfSRRbWGlOT+NCOPBJtp80Vexrzb54/kDCkuI0baY+riweBbVQdfy?=
 =?us-ascii?Q?ORswmHKwQAugb/+1ha2BKJ3c7YxNJcD5C4lBtVU6CrB2A2t+tNpdbq9ymwjw?=
 =?us-ascii?Q?fAYloNK1Fje9l6BQh6cHhrBfzD8s448IYlp4ArM0zLvQdyVtyJVyVF28vQlN?=
 =?us-ascii?Q?/3KcOFwPb2FMjIA9Mg/3lS3IlvBTJ5dTT3qxKXZWmVqpb+Pc+2lOJau/X2WV?=
 =?us-ascii?Q?1urwqy+T229q/6SnwiKmWDarNmedvzSaSyFhQWVlKCQAiQQX5FwxB+hN55DA?=
 =?us-ascii?Q?sh1ZHuNJPLT7V1HJboqWdejkgURuNISCD2IHR7aSsdt+Gz64d50MdSRYcvkl?=
 =?us-ascii?Q?D8jeI/QmgyIFDEJonpQjXFnLDORCZl29g4/0qmb6Hg6g719T7ozXURgmUoJ/?=
 =?us-ascii?Q?31iS9sdPxVgH0g9Quu8NlRW04sUSGyIOeCKSEKqpz5frlQmc0bSYTpZvImo1?=
 =?us-ascii?Q?tgOg3HZ7D1znn0N51Unxz6VjCejOhvfvDzcjjXsE+LDJvwrDNHVYZieb5i1G?=
 =?us-ascii?Q?Ngm9WkqeHz4W55z5tLHZDbPj9zKRErf3use/E5bWuGaFef2K0JMLPZce+nl7?=
 =?us-ascii?Q?0cNPq37lIMbmCFGTY/nU+FsD4vpR2C4vA3iLqtv9oXEZIWbLv5tSdxvl9zqZ?=
 =?us-ascii?Q?vgHkZuQsGNhIq2trpRLpAH2XJ/8kt5gLBcNqlfGSvlc9P54uMA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca90344-e5e1-49b9-0ee9-08d8f4eb4ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 08:51:14.5723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wokpHxf31FKtdaKDH/XAqmm31ipdrh6XByRCGER+Y52myqkEshLTXDJDJpbzNn6Y42ANmRQfFvGaC5qQjRQVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_095415_665563_E0E8F2A6 
X-CRM114-Status: GOOD (  17.24  )
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

On 2021/04/01 15:02, Greentime Hu wrote:
> From: Paul Walmsley <paul.walmsley@sifive.com>
> 
> Add driver for the SiFive FU740 PCIe host controller.
> This controller is based on the DesignWare PCIe core.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Co-developed-by: Henry Styles <hes@sifive.com>
> Signed-off-by: Henry Styles <hes@sifive.com>
> Co-developed-by: Erik Danie <erik.danie@sifive.com>
> Signed-off-by: Erik Danie <erik.danie@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |   9 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-fu740.c | 324 ++++++++++++++++++++++++
>  3 files changed, 334 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 22c5529e9a65..0a37d21ed64e 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -318,4 +318,13 @@ config PCIE_AL
>  	  required only for DT-based platforms. ACPI platforms with the
>  	  Annapurna Labs PCIe controller don't need to enable this.
>  
> +config PCIE_FU740
> +	bool "SiFive FU740 PCIe host controller"
> +	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on SOC_SIFIVE || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here if you want PCIe controller support for the SiFive
> +	  FU740.
> +
>  endmenu
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index a751553fa0db..625f6aaeb5b8 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PCIE_DW_EP) += pcie-designware-ep.o
>  obj-$(CONFIG_PCIE_DW_PLAT) += pcie-designware-plat.o
>  obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
>  obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
> +obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
>  obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
>  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
>  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> new file mode 100644
> index 000000000000..ebbcbda97490
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * FU740 DesignWare PCIe Controller integration
> + * Copyright (C) 2019-2021 SiFive, Inc.
> + * Paul Walmsley
> + * Greentime Hu
> + *
> + * Based in part on the i.MX6 PCIe host controller shim which is:
> + *
> + * Copyright (C) 2013 Kosagi
> + *		https://www.kosagi.com
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_device.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/resource.h>
> +#include <linux/signal.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "pcie-designware.h"
> +
> +#define to_fu740_pcie(x)	dev_get_drvdata((x)->dev)
> +
> +struct fu740_pcie {
> +	struct dw_pcie pci;
> +	void __iomem *mgmt_base;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *pwren;
> +	struct clk *pcie_aux;
> +	struct reset_control *rst;
> +};
> +
> +#define SIFIVE_DEVICESRESETREG		0x28
> +
> +#define PCIEX8MGMT_PERST_N		0x0
> +#define PCIEX8MGMT_APP_LTSSM_ENABLE	0x10
> +#define PCIEX8MGMT_APP_HOLD_PHY_RST	0x18
> +#define PCIEX8MGMT_DEVICE_TYPE		0x708
> +#define PCIEX8MGMT_PHY0_CR_PARA_ADDR	0x860
> +#define PCIEX8MGMT_PHY0_CR_PARA_RD_EN	0x870
> +#define PCIEX8MGMT_PHY0_CR_PARA_RD_DATA	0x878
> +#define PCIEX8MGMT_PHY0_CR_PARA_SEL	0x880
> +#define PCIEX8MGMT_PHY0_CR_PARA_WR_DATA	0x888
> +#define PCIEX8MGMT_PHY0_CR_PARA_WR_EN	0x890
> +#define PCIEX8MGMT_PHY0_CR_PARA_ACK	0x898
> +#define PCIEX8MGMT_PHY1_CR_PARA_ADDR	0x8a0
> +#define PCIEX8MGMT_PHY1_CR_PARA_RD_EN	0x8b0
> +#define PCIEX8MGMT_PHY1_CR_PARA_RD_DATA	0x8b8
> +#define PCIEX8MGMT_PHY1_CR_PARA_SEL	0x8c0
> +#define PCIEX8MGMT_PHY1_CR_PARA_WR_DATA	0x8c8
> +#define PCIEX8MGMT_PHY1_CR_PARA_WR_EN	0x8d0
> +#define PCIEX8MGMT_PHY1_CR_PARA_ACK	0x8d8
> +
> +#define PCIEX8MGMT_PHY_CDR_TRACK_EN	BIT(0)
> +#define PCIEX8MGMT_PHY_LOS_THRSHLD	BIT(5)
> +#define PCIEX8MGMT_PHY_TERM_EN		BIT(9)
> +#define PCIEX8MGMT_PHY_TERM_ACDC	BIT(10)
> +#define PCIEX8MGMT_PHY_EN		BIT(11)
> +#define PCIEX8MGMT_PHY_INIT_VAL		(PCIEX8MGMT_PHY_CDR_TRACK_EN|\
> +					 PCIEX8MGMT_PHY_LOS_THRSHLD|\
> +					 PCIEX8MGMT_PHY_TERM_EN|\
> +					 PCIEX8MGMT_PHY_TERM_ACDC|\
> +					 PCIEX8MGMT_PHY_EN)
> +
> +#define PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3	0x1008
> +#define PCIEX8MGMT_PHY_LANE_OFF		0x100
> +#define PCIEX8MGMT_PHY_LANE0_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 0)
> +#define PCIEX8MGMT_PHY_LANE1_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 1)
> +#define PCIEX8MGMT_PHY_LANE2_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 2)
> +#define PCIEX8MGMT_PHY_LANE3_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 3)
> +
> +static void fu740_pcie_assert_reset(struct fu740_pcie *afp)
> +{
> +	/* Assert PERST_N GPIO */
> +	gpiod_set_value_cansleep(afp->reset, 0);
> +	/* Assert controller PERST_N */
> +	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_PERST_N);
> +}
> +
> +static void fu740_pcie_deassert_reset(struct fu740_pcie *afp)
> +{
> +	/* Deassert controller PERST_N */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PERST_N);
> +	/* Deassert PERST_N GPIO */
> +	gpiod_set_value_cansleep(afp->reset, 1);
> +}
> +
> +static void fu740_pcie_power_on(struct fu740_pcie *afp)
> +{
> +	gpiod_set_value_cansleep(afp->pwren, 1);
> +	/*
> +	 * Ensure that PERST has been asserted for at least 100 ms.
> +	 * Section 2.2 of PCI Express Card Electromechanical Specification
> +	 * Revision 3.0
> +	 */
> +	msleep(100);
> +}
> +
> +static void fu740_pcie_drive_reset(struct fu740_pcie *afp)
> +{
> +	fu740_pcie_assert_reset(afp);
> +	fu740_pcie_power_on(afp);
> +	fu740_pcie_deassert_reset(afp);
> +}
> +
> +static void fu740_phyregwrite(const uint8_t phy, const uint16_t addr,
> +			      const uint16_t wrdata, struct fu740_pcie *afp)
> +{
> +	struct device *dev = afp->pci.dev;
> +	void __iomem *phy_cr_para_addr;
> +	void __iomem *phy_cr_para_wr_data;
> +	void __iomem *phy_cr_para_wr_en;
> +	void __iomem *phy_cr_para_ack;
> +	int ret, val;
> +
> +	/* Setup */
> +	if (phy) {
> +		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ADDR;
> +		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_DATA;
> +		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_EN;
> +		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ACK;
> +	} else {
> +		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ADDR;
> +		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_DATA;
> +		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_EN;
> +		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ACK;
> +	}
> +
> +	writel_relaxed(addr, phy_cr_para_addr);
> +	writel_relaxed(wrdata, phy_cr_para_wr_data);
> +	writel_relaxed(1, phy_cr_para_wr_en);
> +
> +	/* Wait for wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for wait_ilde state failed!\n");

This is a void function. What is the point of these dev_err() if you do not
return an error or process the failure in any way ? Change this to dev_warn()
may be ?

> +
> +	/* Clear */
> +	writel_relaxed(0, phy_cr_para_wr_en);
> +
> +	/* Wait for ~wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, !val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for !wait_ilde state failed!\n");

Same as above.

> +}
> +
> +static void fu740_pcie_init_phy(struct fu740_pcie *afp)
> +{
> +	/* Enable phy cr_para_sel interfaces */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_SEL);
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_SEL);
> +
> +	/*
> +	 * Wait 10 cr_para cycles to guarantee that the registers are ready
> +	 * to be edited.
> +	 */
> +	ndelay(10);
> +
> +	/* Set PHY AC termination mode */
> +	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE0_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE1_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE2_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE0_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE1_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE2_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
> +}
> +
> +static void fu740_pcie_ltssm_enable(struct device *dev)
> +{
> +	struct fu740_pcie *afp = dev_get_drvdata(dev);
> +
> +	/* Enable LTSSM */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
> +}
> +
> +static int fu740_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct device *dev = pci->dev;

No need for this variable.

> +
> +	/* Start LTSSM. */
> +	fu740_pcie_ltssm_enable(dev);
> +	return 0;
> +}
> +
> +static int fu740_pcie_host_init(struct pcie_port *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct fu740_pcie *afp = to_fu740_pcie(pci);
> +	struct device *dev = pci->dev;
> +	int ret;
> +
> +	/* Power on reset */
> +	fu740_pcie_drive_reset(afp);
> +
> +	/* Enable pcieauxclk */
> +	ret = clk_prepare_enable(afp->pcie_aux);
> +	if (ret)
> +		dev_err(dev, "unable to enable pcie_aux clock\n");

No bailing out ? Without a clock, is this going to work ?
If that is not a problem, then I would suggest a dev_warn() here.

> +
> +	/*
> +	 * Assert hold_phy_rst (hold the controller LTSSM in reset after
> +	 * power_up_rst_n for register programming with cr_para)
> +	 */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
> +
> +	/* Deassert power_up_rst_n */
> +	ret = reset_control_deassert(afp->rst);
> +	if (ret)
> +		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");

Same as above.

> +
> +	fu740_pcie_init_phy(afp);
> +
> +	/* Disable pcieauxclk */
> +	clk_disable_unprepare(afp->pcie_aux);
> +	/* Clear hold_phy_rst */
> +	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
> +	/* Enable pcieauxclk */
> +	ret = clk_prepare_enable(afp->pcie_aux);
> +	/* Set RC mode */
> +	writel_relaxed(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops fu740_pcie_host_ops = {
> +	.host_init = fu740_pcie_host_init,
> +};
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = fu740_pcie_start_link,
> +};
> +
> +static int fu740_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_pcie *pci;
> +	struct fu740_pcie *afp;
> +	int ret;
> +
> +	afp = devm_kzalloc(dev, sizeof(*afp), GFP_KERNEL);
> +	if (!afp)
> +		return -ENOMEM;
> +	pci = &afp->pci;
> +	pci->dev = dev;
> +	pci->ops = &dw_pcie_ops;
> +	pci->pp.ops = &fu740_pcie_host_ops;
> +
> +	/* SiFive specific region: mgmt */
> +	afp->mgmt_base = devm_platform_ioremap_resource_byname(pdev, "mgmt");
> +	if (IS_ERR(afp->mgmt_base))
> +		return PTR_ERR(afp->mgmt_base);
> +
> +	/* Fetch GPIOs */
> +	afp->reset = devm_gpiod_get_optional(dev, "reset-gpios", GPIOD_OUT_LOW);
> +	if (IS_ERR(afp->reset)) {
> +		dev_err(dev, "unable to get reset-gpios\n");
> +		return ret;
> +	}
> +	afp->pwren = devm_gpiod_get_optional(dev, "pwren-gpios", GPIOD_OUT_LOW);
> +	if (IS_ERR(afp->pwren)) {
> +		dev_err(dev, "unable to get pwren-gpios\n");
> +		return ret;

Why not return dev_err_probe(...); ? Same for the returns above.

> +	}
> +
> +	/* Fetch clocks */
> +	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
> +	if (IS_ERR(afp->pcie_aux))
> +		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
> +					     "pcie_aux clock source missing or invalid\n");
> +
> +	/* Fetch reset */
> +	afp->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(afp->rst))
> +		return dev_err_probe(dev, PTR_ERR(afp->rst), "unable to get reset\n");
> +
> +	platform_set_drvdata(pdev, afp);
> +
> +	ret = dw_pcie_host_init(&pci->pp);
> +	if (ret < 0)
> +		return ret;

You can simplify this with a simple:

	return dw_pcie_host_init(&pci->pp);

> +
> +	return 0;
> +}
> +
> +static void fu740_pcie_shutdown(struct platform_device *pdev)
> +{
> +	struct fu740_pcie *afp = platform_get_drvdata(pdev);
> +
> +	/* Bring down link, so bootloader gets clean state in case of reboot */
> +	fu740_pcie_assert_reset(afp);
> +}
> +
> +static const struct of_device_id fu740_pcie_of_match[] = {
> +	{ .compatible = "sifive,fu740-pcie", },
> +	{},
> +};
> +
> +static struct platform_driver fu740_pcie_driver = {
> +	.driver = {
> +		   .name = "fu740-pcie",
> +		   .of_match_table = fu740_pcie_of_match,
> +		   .suppress_bind_attrs = true,
> +	},
> +	.probe = fu740_pcie_probe,
> +	.shutdown = fu740_pcie_shutdown,
> +};
> +
> +builtin_platform_driver(fu740_pcie_driver);
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
