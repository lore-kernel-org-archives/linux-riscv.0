Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B2CD11DB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 06:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZF8E8e5ujOaGsDrFJ/zBvcdnPA34hfrieMN4kqOgxKo=; b=HIfbr4rpuUz5vS
	l59b5HMrFELlMo5oxyPJwE9yF0QZfMOWQB61DuD3qAzji/61GliocuKCwtOiAejdOu2L/VolTUiHM
	/gEbS6inBke2lfWuVu4g6VlZVVOTwRTiyPeCNnPJJHN8s1uqHFT5i8q92nA7uM4VV7RX2ycL4ubrn
	81tYf4cCiT5zgN5qD3/N6O72qRTfUA9R8CxzZ9YIkrNIok4JTIiFR2brrwyjG/9XTLSQvy7mDsHv7
	vE3hKydeqDO+lIgqqVLHL0mZUDU57qs4Gu2p6/G4wpaMmk0nTClkBfyBqMhnFR8lnTpWOPKfsj6vR
	ZYIAfeheQCNpOBMtAGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYCy-00000005z0o-0XEv;
	Fri, 22 Mar 2024 06:16:52 +0000
Received: from mail-bjschn02on2070b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYCt-00000005yvN-3gNx
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 06:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcBJvyQYSwKdW2NVJKZZKLIfsAo2tzz6MWW+Yy34Zqqn6ep76+/ny6efvCHAGZ78b0Dt/+D3YRgslYnHFgxDyJOarM65Zqfp3HUu8Q3rUWvOENlSDPS8nOhwOVjd3IK5Nr8cX7J76zhtdjtmafVziene9bUXNZSe/t3V4ydvBywBpofW2fEcptntiKRrh1h7Y64T3JRiAoFDng26u+KMual02piH9i2Vt4jzHJ+XioKEvB/DdgKdXW3dqXfDGeIXzZDT5Vt+zmchV01o4brTnPwLG1WSHKE8cckgpvH2jy02K6ne/PuGQsdw/PIrwNMC8hvclQntFLOgYyawQYxj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvnnpZ3T7YWC/9/HgkXHvBh2skTnzDORRxgvrmLm97g=;
 b=igK2d+nC7ocLK+mA93jrPh0YF9F8HkFoMIwvQxYI7wxFOvhq5b9+QC7wOwrjdzZw/+NAvZXk6UQqO+a1JiR6kURRSedUkLcUfscdsM/AUl8ufw+81WlPsBg6Fj29qJ6Nzh+aBFuIG/EGSNm7Tfcqty9X5duZeW1KVd3Za3HzvuI+dIMNgbLJJFeOEfn4MG6IW2SwBQqx81JzyWkIhiVTkOqBVWKEKbmNbV29WDk12mWWoGg2PUYZk1CObnalNGljcw1PZYlDJAtjSqJ9Jw1afRdbpuMi4F2us1F+ChLNqHo2a/TZ0g/NvTG8QHtOf8v7RB/W4w1LaHqu3s5Wla33rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0762.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 22 Mar
 2024 06:16:21 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c%7]) with mapi id 15.20.7386.031; Fri, 22 Mar 2024
 06:16:21 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH 0/4] Add StarFive's StarLink-500 Cache Controller
Thread-Topic: [PATCH 0/4] Add StarFive's StarLink-500 Cache Controller
Thread-Index: AQHaddaSJEIIPVgxR0SxXGC7jf4tALE8DDGAgARDxYCAAwMvIA==
Date: Fri, 22 Mar 2024 06:16:21 +0000
Message-ID: <SH0PR01MB0841F41082D1B638C6CDCCD1F931A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240317-viral-handcraft-12b2519ff1be@spud>
 <20240320-implement-finishing-136eae51d659@wendy>
In-Reply-To: <20240320-implement-finishing-136eae51d659@wendy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0762:EE_
x-ms-office365-filtering-correlation-id: 5e7f5b3a-a17d-4c15-f0b8-08dc4a379813
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMjjakDTnCB83n7cwwZfcYohkMudiK83WBXgfSMNNkJsDolKRRaRqtY/WOmQnHjA7lH/974e4MgtWTBUtnW8rDFAwsoI4xiQWMj4lXmCeensaMbr37VUCWDEzqVnfpMhTUZdmHh4iEGjpl7UNfwb2JfPkS6nrEo+ud442ksjNz5/zK6z/Xkksx/18fwsNJLbVpIsYQAu5ysZMoOEjcKMERMPpdK1+yw2OQvUOJTsMX7B+r7urfHtkDljVHM058pM81hDCRu0c96JyQexyyG/bbWFM2ixvp3+MspcxLM/9Zz4i6u9yhNygFYEA2ECH0tgVH4BgZHWTIJOQeDuuckUH103zhSjFEvfF0R6xTw1wLEZkHBpIGhl8EhK1kYwBloGQ9tvxPKpoxA7aZuS6L9kuJzTIGKUNaInf8RAUQcpQh/O0ATJ5j4k5JcB0k8/PC4sB1/m8qWYuFhrsbc2WQi31vaDLBTjnPe5y4iIBJgkl4IcLExHfljvr2Tw1GeJIWW8UtkB7bDWIEfINftbH3W8Q+PH8euqC80wRrOoCi5agFD6OcmnBlh0VnLOyhxgH8eJuTC40CL/EnY9pSWDyekWLZ8Dw6e+c/TmFJ4NQYjqpIVVgqitRg9m1xlbeXX8gKyU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/59rrD5xFJmH8GVBXl8lgrxd8UDf91Uw/VaT103Q/O0ktduLlWG4mEFN2QKW?=
 =?us-ascii?Q?pKqsdWDlJCoOB+VGG9e0rJK+EKOGb5+Nf28IhBD+8Wl9iiuDRaYHnYtTUWxa?=
 =?us-ascii?Q?PBFNLA5Y+0oJ/spL4TLukMOycOlKxac0+TPYWqXt6Bemnr8utmag5fOsxWdZ?=
 =?us-ascii?Q?mEwJ9eEMQ7++gFZAMQ4x5umbFWfw+wLRdZy9eZzyIa3eTqU8K6wBe8dXdkiy?=
 =?us-ascii?Q?jW725LyLMnR9G6vt5aIZvVWm49OeG32Scp54hY2ftrcJ4bJRSYApjWWdnZ8d?=
 =?us-ascii?Q?gaR4vuhMpoZYUrq89zUWX9JWOk61/FmZq45PjjPr1mGzvFFy0vNXS6vg9mZe?=
 =?us-ascii?Q?aDtVJOqfY2ZenYIKFBeVgg1OlK1VV607RISyK6Oen5WoJeJWwOBu8fK7moT3?=
 =?us-ascii?Q?1Y6jVf1ZvN5VD+U3M72wb4AN4ROfz6v0gO5HmetNg9XuS6i+5lGiBpL/HKmj?=
 =?us-ascii?Q?Yk5Q24Rn4uNt//cCgZMaeRMFU1Qubvn1tJqFstmnwI05IxQUzENHAw8IGXlx?=
 =?us-ascii?Q?De9Y18StpxOD6fVRrfnjuGiuCLCB6rIIw9JfsbIMv4hUrC5ySpKr3rGhE6hr?=
 =?us-ascii?Q?7yktny3EUvMn64CBiQk9TimfEnSsTKjGh4kGl9Euod0arZhoNJ48NfTBviWg?=
 =?us-ascii?Q?FRCS3yuAz+1PDRrz0W5I11wmLG3A01YologAi6JpbP+EOalkUh4mydC6D5IU?=
 =?us-ascii?Q?03T+iYWZhlh3cLYcFMKOB84WM4HiSR+l51SkbpowsOQSTzUys0WdBmYJI3W5?=
 =?us-ascii?Q?Q6xwDSh1hFFlMrburuj3SpdUEJ9bCcaosELO5YZBmMQjyWHoFhczX/2P5LQl?=
 =?us-ascii?Q?jrjpH1555WyfsdsyyLdhas6XlA3zHnY0CZCUvF7ltJm31FtRKIyHiOhlBdqF?=
 =?us-ascii?Q?/1jfwU/b1reqviETWghuSpLKCE8RTcqEt9/Jh/kPuwBYu8yF8lKC7MAxum39?=
 =?us-ascii?Q?Z134HYpRUqdRfi3W1wycesflO9Rk80pEY7hw1O4DsWCApBL+ZeXYwpyQh749?=
 =?us-ascii?Q?M/BK2PU6boxfz/RQ7qMoY/RP28CLGYOdKBgjmjjLb0UyGQq+Fcl5LmWt9byy?=
 =?us-ascii?Q?4pBMTkfbcVbJWmIKSkuL3G67rQARKEgJ6rmVwEj9Su7C0Xl6OemIc26e7NeD?=
 =?us-ascii?Q?V2lLfhVe4kF/FRKKqL1RTsP2AGNgLFCSt33WDQq/bq5MVpth2knigMHoYige?=
 =?us-ascii?Q?yBzJwvbMl1o2HZkT5+TGSnGNNF7Na01l+m2EtWQEQ0PZ4AEk+x6MO5012yQZ?=
 =?us-ascii?Q?l9wfyIbm13CJp5dpyYFjWYFaIJLbNmmpZBvsAHe4ugNfYlboo8Kcg2I1ZKeS?=
 =?us-ascii?Q?ClU1liGZY1bG9S7ZpcwmEKtBDofc2Q13TMbQAg2Fe5cUYzJjj8OCFUPRtAxG?=
 =?us-ascii?Q?ixJrL5LiZMVDICHv1wNVJ7XU99zQu//J1T6nrmDg9kvJ9lV806pWy+QYw4VB?=
 =?us-ascii?Q?bW778BairnQrORTiURK+Vjnf1aZoVKwc3dyLc1R3ZIM/APRrcveG49cGMEON?=
 =?us-ascii?Q?5+T+ApYgznzLEDJDc6HUMb7TVVLxUuPBnrC8wh7cyph1AzuNallugFxN+1oH?=
 =?us-ascii?Q?D3P8mqIr4WG7HuYvPgqf1opLVxk657fANf6jrzKHQM7BRN2PC0CquM1LphXU?=
 =?us-ascii?Q?5w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f5b3a-a17d-4c15-f0b8-08dc4a379813
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 06:16:21.4757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Tpe3vOz/Zo/HGPG7v/FTYslGaGBPl6u+jzvk3vB7LBf4a4/DOnT8+2tglx4BHxp21MwmmF99zC2u+m/RSFImT9gMZxetxbC6Iw6BCGAG8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_231647_958853_7B8A3416 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, "heiko@sntech.de" <heiko@sntech.de>, "prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, "evan@rivosinc.com" <evan@rivosinc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "jszhang@kernel.org" <jszhang@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "guoren@kernel.org" <guoren@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor.dooley@microchip.com>
> Sent: Wednesday, March 20, 2024 4:09 PM
> To: Conor Dooley <conor@kernel.org>
> Cc: Joshua Yeong <joshua.yeong@starfivetech.com>;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> geert+renesas@glider.be; prabhakar.mahadev-lad.rj@bp.renesas.com;
> alexghiti@rivosinc.com; evan@rivosinc.com; ajones@ventanamicro.com;
> heiko@sntech.de; guoren@kernel.org; uwu@icenowy.me;
> jszhang@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> conor+dt@kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; JeeHeng
> Sia <jeeheng.sia@starfivetech.com>; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH 0/4] Add StarFive's StarLink-500 Cache Controller
> 
> On Sun, Mar 17, 2024 at 03:01:05PM +0000, Conor Dooley wrote:
> > On Thu, Mar 14, 2024 at 02:12:01PM +0800, Joshua Yeong wrote:
> > > StarFive's StarLink-500 Cache Controller flush/invalidates cache
> > > using non- conventional CMO method. This driver provides the cache
> > > handling on StarFive RISC-V SoC.
> >
> > Unlike the other "non-conventional" CMO methods, the jh8100 does not
> > pre-date the Zicbom extension. Why has that not been implemented?
> 
> Stefan pointed out on IRC yesterday that one of the main selling points is the
> ease of operating on large ranges.
> 
> > How many peripherals on the jh8100 rely on non-coherent DMA?

JH8100 integrates in-house matured/stable CPU but it is a bit dated today.
However, our newer generation of CPU should already support this extension.

Most of the peripherals are coherent except mainly multimedia peripheral.

Regards,
Joshua

> >
> > Cheers,
> > Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
