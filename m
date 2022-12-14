Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F15C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx0RQrsWttW3AVXiaipOfKgm8ZJIrK0zdFLV4PYyDZI=; b=AzLVvl8QdloamF
	ZaoGtRxGdBSa5xhl5j5NZ/cmxchUfE39voN1aDSzzGsUO4Z/DXZ0Cmpdu+mDZ+BJ20ie3AS15U26e
	6/d6IGeYJkIZx8VI8IbicCdQFj/6zuKKa5IitdbPwd+/8GIJyReqYZ/viuTH6sBL0zGE+LAqolKoB
	8vLBvd4Uus/HXzHmlWpEA2pKgM5heZsYfDNNr8LgIUwZD6KGZgvf/XjaJvagW44EqAbCtxvmaJYkQ
	R5SnyVparKFvAuhhWtSIiUOTxK+WqmdaUpyGECmuD1VvPmputYpvtx3R+TvqpTo/cQaJwdLiE/qU/
	gFMaj29qtVlUzJjO2EXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ZU8-003H7w-Pj; Wed, 14 Dec 2022 21:40:16 +0000
Received: from mail-os0jpn01on2121.outbound.protection.outlook.com ([40.107.113.121] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ZU4-003H5X-Hr
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 21:40:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXDEFKrcRpCmuGstw6UKUb8G6v8oYqPDEdObDBh3QQ+SywebGRCR/5zUyFoPLct+z5Onv8p17Vf4m0ViDtt+bvA3QphMfZwH5aGtUIgrZ0OqCI/IXciRpsx4wx3RlOFtCCb7CrpFaw9sISVPKK6oEV6BwY6ZFBPGovtd+A+RizdB3zQtuIfGFTUJ5cNgxHJP2hB75Hvo5hgvpyzz9TmoAiunP5vjQ/WF+/uO5eWvYHhClxpGeJoW95Bxzu5zz175poJhHJtGFsqVkQp2zAJWTOOrVjLWfKvWFa4qMXQotWsk0XqS3dpeHmh8CZYq3z5E4/lMnNF7G4hEyw0pI4D7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDnbvkTvLA82KFdAJvpfcQ/Z6to5w94oAseeHTZM8mc=;
 b=jTnGv2tk4rpGdrmxslEimkJlc01+qO3wlot6qJaPlOgcPwYF2tjb1mz1bbqupdyMt2EP0C2HtODAs49JLd/oZ7uJPXtqfbwCV4GxhlfIoGd2cTrRkhcbM8LjzQUQamMj0ldEcjAfSZcT7EPQxXCM0RRJDahir2GbCqjUKwLwtP0vFL5nnvft9RfuZsKoxTIuJjP8jroiQGtYlK0yktUf7y7WPn7gCdxRjD2YLfMR4iL8h8Y2cKc5x1yFl4dyuKq1meso833t8mjtha1mn7yBqLosvL0OUNZ5w59pgRu/+Kc43LJQWm5mBiebKsW/2qoT1rpFoIH1WKjP5JefaQGJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDnbvkTvLA82KFdAJvpfcQ/Z6to5w94oAseeHTZM8mc=;
 b=Wov118ZgwAGQl34R57Kl6LNyB/6wybPQYjNULwxNrwm4JN87UdmMwP2w3gxqqibmGu6G8gQOj7fBlp4Fjj+8rfdQQl+blO/ZFKhZ2ppe2ee6nGeHxfbwgB0zaDAYuTw+ApoLuk3jeR9mq/zxZ/llTefyU23iEpzABWqjP9mAIt0=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TYCPR01MB7845.jpnprd01.prod.outlook.com (2603:1096:400:182::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 21:40:08 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::f472:84ae:c3ff:90e6]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::f472:84ae:c3ff:90e6%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 21:40:07 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Robin Murphy <robin.murphy@arm.com>, Conor Dooley <conor@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Thread-Topic: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Thread-Index: AQHZD/TEl8pPFAVi00Odphb7AlEWFa5t31KAgAAJSpA=
Date: Wed, 14 Dec 2022 21:40:07 +0000
Message-ID:  <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20221214180409.7354-1-palmer@rivosinc.com>
 <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
 <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com>
In-Reply-To: <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TYCPR01MB7845:EE_
x-ms-office365-filtering-correlation-id: 19eb94ee-ce3b-4a1e-c48f-08dade1bc518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uIT80SkGy1C0yO9vjsLiokwXfLINNG2ChX9V+fqksWcWEI1QKHVErYvwXMDjrLgquhRi+UFb2XlI37cm7nWlakykoJkWibkK3lhncBtx+DLn0quwFDGPRmySbXWg9HVMYiQCv9daL0I/+46nStfI9UJdfxawkDYMvn7Ec71gBTJpAvefvtckWWamFXGf7wiM9dNn7Y0h6WCqJUsyugn9jcenDGWl/f844YOH7OgaqC18gkm6LoL4/EGB/9Laeqeg2Z0fphwfsEF6gszpNCbzsjJtCxGngSyddVrkV9F1XaKxiBSRV0zAiaqQzl966H+vjUMur6kkte84YWviExWhl8Dbz5WLwQTV0fZCbG5Y/xhb4ZL8zQGE4mM77LsBqtylZYj3/CGsdZt2e2DE5hCKdydDmR4koUHNiGFaIb4pMkbkUxGFrw3LTowh4pnrnI+Zy6gLetWNpRTdRomB528M7Wwzt02u5YtH7dtqIG1lEs4D2A/WEqkt1XFA6FoGtGNaRvtfKWqsPkOI5HSyIraLUL8dWXL7iEUSkiYaX3kz0O6KZoEPKi2s1uYhwHyvQ+i+XyRwUjciCzKabewkMMA2Ai2PvgtgCTH/bQJWZ74uAASyt0ck9kHpY1dZIlN8U44m3eQ1wQyZFvj2EXRmjXR6jE5D2l4H6Le0Pduu6fo7VdeYruvndKYAQy2geGxFxsApKuimpHFByIbo70Bnm2Bg+I93m2Ank7EEHkowmsEA29c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(2906002)(4001150100001)(86362001)(55016003)(33656002)(122000001)(7696005)(6506007)(53546011)(26005)(186003)(8676002)(83380400001)(4326008)(966005)(66946007)(66476007)(64756008)(66556008)(9686003)(76116006)(41300700001)(66446008)(52536014)(5660300002)(8936002)(71200400001)(38100700002)(110136005)(316002)(45080400002)(38070700005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?5dBP9cvGHj8jmgkmc/gY1hHXytme8d/YKcAL07jIV8tSebZPzTH2nV2GzhCo?=
 =?us-ascii?Q?lmD78Etinp8a4RU38lHQPd3KvRQIZjN4pGfVmYMjExkff1sBinnJWsq8NXpQ?=
 =?us-ascii?Q?++v3CdqJJImAkajQPtcfgXswc2V5cp4Z0RvImoXZTQ2sjou2E6tv8wllzeYD?=
 =?us-ascii?Q?mSfUHjpoFLwPpQaQNwo5wgnVmkKKf5XZu8HE4IXkpai9fBGoowDcTdjtg9sl?=
 =?us-ascii?Q?66mz+n5GeYd8bdW4S6FJtUC9nlayB+sHifWuVoPRU4ZyJZA95p0ruNLD37Sa?=
 =?us-ascii?Q?RZK9V6fX0ZrMUweOw3K4GtkYyIUVBRiNUlj4tW7ogEvt5bRhciUTN6kK2VG9?=
 =?us-ascii?Q?jP+pa5lrgGgv45d9LPOTGUmqFxz7zuTg3c4nz1Nobwcf0FpaTcMWpo94+auz?=
 =?us-ascii?Q?/C73AUPXZzJ+r9XxyrTnt6vly6oHzLuZHCxRkqd2yzre/3lQStKZoUSLKCvi?=
 =?us-ascii?Q?q71MhEZ/Qxg4n138nZJftM1Kes5SckdyDBXY0kyAGwkfIK1MkHWIo0oVfQ0o?=
 =?us-ascii?Q?It6qXXNzG2fUIDD4Qy/xpcKuysSXEmjdG1y9BDrRWMESh4b1jslDs7tizeRm?=
 =?us-ascii?Q?YrB7sKPm2xAtPx29rjYmyBvQHmCSt31thQiQAvehDDlYlLxus7d0sOcUy1FY?=
 =?us-ascii?Q?cuBNFBpNZpcqHBs1N6/CZ0HewZ25QY6Hk437UayX+zQBQ+qtQOEMwj3HWI90?=
 =?us-ascii?Q?ETN8cVlYGkpE9l6zEcCh3WGQM6DSp+VwI51YuHRsVO5JbtUTDyKw61OfHZdV?=
 =?us-ascii?Q?muVjfLhaGEkbdkwh/D9bTp/0lKrIl3naoaWdHxEk+bwFCEdD+MsypwCol8CH?=
 =?us-ascii?Q?kUYAfUkDYdtbUY5XAZXnxvI+HgBRm3+mIeidk9thl8zhFmNL14O/E3NNhZwQ?=
 =?us-ascii?Q?XfWPjURUbWPmxkCutx6YJ+rimIHk2YXn81FCDiXvP4xgyg6mDOHvYDI1vtFr?=
 =?us-ascii?Q?fwUvFQ8BZd0kyt0javw+qljavpkJaUeP+t9EoFm8LlGMN16j3O3yuWhHvhfD?=
 =?us-ascii?Q?uU3EHHyrAFIystixt+VK6K4xAJ9/juqAuPDlY142WGFn1iaqN/QYXmDb54M/?=
 =?us-ascii?Q?+ZTUjXl9/KMFa5pVCA7wtTIHt/qLAU0yd4jBXU9+Qmq3Cq1CNf2zKAtuRdHF?=
 =?us-ascii?Q?/AJns29UR3AMeUNpoh3E1eN/aEG3J4GHDQ9dJ+xw5edZEpp7LWTV9pQn5SjB?=
 =?us-ascii?Q?UPyX0iTeQUt0mBN6FH5N/0dbYkmQ2jepQJS9QD5fr2Ah0kYOu7YxtMqzwbzw?=
 =?us-ascii?Q?HSwQF4onGFgkHtma+plx09pY9Iaxk/ZzhhXpvsy8jO3AgZwfpIme1a9A3MZL?=
 =?us-ascii?Q?j0GWoUNOsAEzBF7hwa/iZ4LlFJv9RYmKWrlOMRKkRlwz36AU8Z0J4G2O+15x?=
 =?us-ascii?Q?3dRAGWTgEMG59qynvyvtsf/hUmYYF4k8eIOWXEh1tOD7PS0YMLL2bZIjEY1L?=
 =?us-ascii?Q?j0PX67hCPOTHSjOHdEPErkqj18kgR7zrMRSpOMQzABiYYMGn23iDHjqspNKb?=
 =?us-ascii?Q?ZGdPOkVSXKP4lW/f8Ll+vwBBRUS6xGaMB6nYy53QD9+e3FU29T24xcEweui2?=
 =?us-ascii?Q?eRfkVjj7MWy5ws8GsOfsJQHcIG5pZ1Cr0EzUAyEK6uYqJ51neC5HjQrinFEJ?=
 =?us-ascii?Q?F22aMdodFxiZZwYY6JQR05U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eb94ee-ce3b-4a1e-c48f-08dade1bc518
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 21:40:07.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyQqY0jS3wR1u2Ylxt4859PFdumgAh5Pqvhp5/5U3/tJlEeT6O7d1CEItflolXeRRq1VnqJmaJt5RaUCKxtZvMjRe1r9Qgz9YLhM4VaJlTraQiw3pDsOX338re/aVZ3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_134013_201543_A171D797 
X-CRM114-Status: GOOD (  16.25  )
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

Hi,

> -----Original Message-----
> From: Robin Murphy <robin.murphy@arm.com>
> Sent: 14 December 2022 21:04
> To: Conor Dooley <conor@kernel.org>; linux-riscv@lists.infradead.org; Palmer Dabbelt
> <palmer@rivosinc.com>; arnd@arndb.de; iommu@lists.linux.dev
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
> 
> On 2022-12-14 19:46, Conor Dooley wrote:
> >
> >
> > On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >> Without this I get a Kconfig warning and then subsequent build
> >> failure when building allmodconfig on rv32.
> >>
> >> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> >>   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64
> [=y])
> >>   Selected by [y]:
> >>   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] ||
> >> COMPILE_TEST [=y]
> >
> > This here is your problem afaict
> > I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
> > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Fall%2F202212142355.b7vf3Jh0-lkp%40intel.com%2F&amp;data=
> > 05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7Ca51ccd27ccda45e7
> > 53c208dade16c553%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63806648
> > 6632283001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FshRCpnIoU0b
> > c38MYnesotcgOV4JT%2FXVOidbDMpAWbc%3D&amp;reserved=0
> >
> > I hate selects, just ignores the dependency :(
> >
> >   && !GENERIC_ATOMIC64 [=y])
> 
> I think the existing assumption was that ARCH_RENESAS implied !GENERIC_ATOMIC64. If that is no longer
> true then please feel free to adjust drivers/iommu/Kconfig to suit.
> 
IPMMU is not available on Renesas RISCV SoCs, so maybe something like below?

--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -283,7 +283,7 @@ config EXYNOS_IOMMU_DEBUG

 config IPMMU_VMSA
        bool "Renesas VMSA-compatible IPMMU"
-       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
+       depends on (ARCH_RENESAS && !RISCV) || (COMPILE_TEST && !GENERIC_ATOMIC64)
        select IOMMU_API
        select IOMMU_IO_PGTABLE_LPAE
        select ARM_DMA_USE_IOMMU

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
