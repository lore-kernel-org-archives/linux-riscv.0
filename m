Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA06C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 04:03:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C4164FA1
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 04:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C4164FA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=VzdiM9W95KTS4gjV2J2+sYX4YHkYm2LK5/SaUNkyKxs=; b=txNyf5NnUIt87+u7JaBFLYW5r
	Q3KJvBJ/3gy+nbooVhd/TXC1EscZGjwC30y2rC2+j3VShnC8UK/KnJGdtmWBjrAReeZbFmzZtZ37M
	BXg3pmNwIgm6/MJxUCopKzSQGG9cAr0qZbjKegUpLjt3C+gfwzCUXlYibE2DdTTMJqfJcSgoP+GHU
	4VU7VoCvNoAp7QHDuDZhVc9vOumgia/NxmFIYueq8lbsmVDLohyb204h1B5z0vkx2gfS1cOaSDajJ
	WfcSoGMQ12tCVKWOtJebfjaeMJgXXHuRpdQBLB0g8/IGR7bKX/UZQ6y1STn98hhcFrkUSQeqocsd/
	kIEz6Blqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7sL7-0005VA-O7; Fri, 05 Feb 2021 04:03:25 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7sL3-0005Uk-UV
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 04:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612497801; x=1644033801;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=IDH5M7viuUdm+DVpv9qjXssirnumsLw3YBx4lCRoEIE=;
 b=ej0Asqp9HePf7+bgbGtVWffX5uJXodW4pDazEzUlLHh1auSWToMKe+CN
 sXsHyPuHtO8qXIM90AcZtnh4n6D3dX3n8sgsEjNNUDad9V2Tdjz0kblql
 afoplZ9na0GBvrToPPhNakrxtr2YtPZ+b5inLd5v2iiji078TdDK197vG
 wLw80ENmV+upGpTvhp5HmfD00kAtTTGsX+v6Jee4PWX2BO4TEKQ673RBr
 0IazVoxtMlWlc8f1p4RIOzQuuFcM6czZtvulmILDhSYsdoITusycgwCtI
 A3DJAEAIa/b51MmQvIbDsvShbJii9afTRb+eQrjiRXcPaJLEvTY+T5GeR g==;
IronPort-SDR: LDEm2zyMOTVshaQVYb3WaN/2tdblOsw3220Qz5k8/k6GfVq/2rzOSqtZhWJckvc2pBMRjtJCpC
 PWS/1CVVqpGlti1W68f+/tg75b7GzEKJPTteWT+VauQgVtMCczLf1T8TTmh0dW6SfwaqtCu5pB
 i1ZgLoB/r0a+vPNZykGVWs2acIODr4mOrIy0xpNl5obnITYk/+p2YbzT96LfLR8l5FzNPH/Kc+
 oxLJvXLBhHz/oz2ygV+K9fuF5MDeclnNCpLTYagNTyef0HjOpIGyK7EZLCoJT1eVFyBr7ki+r3
 o2M=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="269629746"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 12:03:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdST8U5FGMi8a0tmgXi01mcNjmXggbziAOK3IxKn4h66fPJAzBJ0fGyV/7N5o9MUXzVmkBxZ5X0N2pPyh8Mqzx/BhzkjB5GCHSdyVDetSM/wNiwZFanZe5pOYAWU9UHa4rG2u+V/KPFuzK7PgFWw88XSVChSlCV1wOJGd9j+P5u2dqPz5d6CtxOOVlM81L/OxM/qwmSgqKK51BbrtSJhNP8JQ2WvzZhISl0+lnl3JDeSl2jm5SAgNZFoXli17MAC7+EM7Co79fihz4oC2LKome/CP/G0komdX06zsV1A1QfshQwaheN8xe//0nYtNUqDZX5jX36xIPXAbDHzOiVJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDH5M7viuUdm+DVpv9qjXssirnumsLw3YBx4lCRoEIE=;
 b=bKVsEaCsBWKN4kdEky0xBCsNIMiVfAaW3M6B7Gxe0TunKnrejn3B43hmuA/PeqCI7SSiPezWyFDk/36MJtntiEqWpt0mr2iyDHyVr1g07AHRQFbQm+RE9RWznVcchpIMKZlPCy15YIDqP3CkDclrEkcbSSnBR4OqZV+Db6+mIJC8xyB9LczGZHcM6Ymo/nY9FIQAM1wSHSPKG/tk/2epvrs1iL34dfwqmBW9Tq/S94V/4rjTqQGIcW5zmdHMgitkhNSqs3FJaNSAlJN9eOhSreYWAkKSP92l2sbisiLcDqfF/o713yDZB096qrwOLsAf4ZJOXw/u4jUaEmvHVey0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDH5M7viuUdm+DVpv9qjXssirnumsLw3YBx4lCRoEIE=;
 b=qrX7Fb7JHbXvohE+ToIZUtNg549jFKG7EzRU52C1ZuKepMKyVC5gaePXmDFVH2tUeta/5jIT890L0u3H4KalEgdCVLH92K1vUxAhkdb+WM1x2CXhk5h90W7DyWX6bDiblnkmzYS4eZfcdhwP9VFrTC8n7QroCzETq91L6hMMDX8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB5091.namprd04.prod.outlook.com (2603:10b6:208:5c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Feb
 2021 04:03:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 04:03:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v15 00/16] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v15 00/16] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW+ixjjaWLK6o6nUuFKP56X14aYg==
Date: Fri, 5 Feb 2021 04:03:15 +0000
Message-ID: <BL0PR04MB65145996E85F7EAD51C2EA07E7B29@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-d37e3acd-9523-4a5b-8c07-a89dcd0962e5@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:50f7:ee01:712b:bf92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5326149-875a-4f5b-a465-08d8c98af6f0
x-ms-traffictypediagnostic: BL0PR04MB5091:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB509139446B4147D50002DA82E7B29@BL0PR04MB5091.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yKJAmmgdfWFHDZqjlPewq5NS92AR47MaAE5QLASbe8mrOVfV57jicVt/mAKqlKw/hCyMrZYd5h9B/acaAlI2faosDV51HV9U3OMZtsezYPwaTecXs2Ul7yA+OnUn39wgDZx9eeJRk4xDOWsZ/u1fpbU4AIHNeqK7LbCKs9BHB1Ou4BUos6R0uhbmsPerkMI43qAN1lAogNgBWORIQ+wheFsXdvsGdoVz8uR2HdXYY9T+WdQG3we7HpLXLi6f3pwx1UBVT9jAk72h2M9px90vjFr0qxynlFMxEVqlpidEoLuJN/QQ2oRoGq40rUVqmKlX//6shgLHAD+OtjJnv3myo7/XHKyhpyvEbeFT5JZqCK6OB1KSudX9EkULfw0CpSMY4q/m8wWJSTPqZH0TQ93R/H1/+DvNr8Ao+bq7TVO0ipTTbfz/tIhHS0L+Yxx3uF2MxOgD4/Jwo9aNPyWB+YxjwzzmDQH09w05ZFXlD2HHfw/gob1qfFlcMGtK87qFXBtV9m8rjly4bf8bT99B94KlRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(55016002)(6916009)(5660300002)(4326008)(9686003)(8676002)(316002)(6506007)(53546011)(76116006)(7696005)(71200400001)(54906003)(83380400001)(64756008)(86362001)(66946007)(66556008)(66446008)(8936002)(33656002)(186003)(91956017)(478600001)(52536014)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mzKlGMyGRfM45LY9DOECfE7a8eGoWXbIsF2YcS6gFVBpn1VMnSyTTwmjkI+g?=
 =?us-ascii?Q?qIj84tCs58bjWiuLZw2wVyNekJ5tfP+3or9fh5erxSvXvYnjhQQElDCLgURs?=
 =?us-ascii?Q?qWYAaBZK7JfHHqW84xskRkyzvza1RwCH5+Se/AyoB1SK0NGMq6QKKKuD+8eW?=
 =?us-ascii?Q?b70p3UOvp8lJ1pFd6ctxLdQq5960UUqfHr7nIY+IOB+QqrGcgGd3LVExSBjj?=
 =?us-ascii?Q?aD0wVTZZ/IE119RZdckWWKciWSB2bJ9n5c8wTr4ZEJXAVHM6HBjJGJTOJe6d?=
 =?us-ascii?Q?eDj0CSlPjG8jlDHWqlnIykV8QkrJ5GY6KOlMoAEq3p67Jc8pxSxOVesU9MuK?=
 =?us-ascii?Q?kyBjX1GlfYUxJfCr++EWLRAUbSaA/frdHgW/HTVNcjgv6AtErpxt6HL6H0E5?=
 =?us-ascii?Q?SPBbOID3TrNAb5VFy0JONnJwHJeNTz5v34yrsW/YueWee9ZBh+GYpr1vGWVX?=
 =?us-ascii?Q?BR/Q2WOO8UDxtAlJEpLyjU5mtNAKx3RS6SCwqWwJ8uy19STPcQxmUgka0ueV?=
 =?us-ascii?Q?+CDxDYCTl7Lc/+hN8v+EGHDP1dCSYgff/FvD8jBKSNAhgrnp2xYnxEjaz/aq?=
 =?us-ascii?Q?VQ7ORvq/VgW7zunbh5ugnLTc5OWnBeJEOBrj7Yml8Epf+6KbJPmjkwHX+l9K?=
 =?us-ascii?Q?lIBcnYjZoFtUP2xoVGxK0d2IVfh5U0mxb6tUHMuMXDdFRP8+cc23eHixVzzj?=
 =?us-ascii?Q?RPN3gOSi6kVqMwo7QbGV8ju0pRwTra91cfqEKxi6vEK2vviD0Nq9Y2OHG+lF?=
 =?us-ascii?Q?ko9E1seXEQ7V+6u3zu/UNpkZTfBQiK5/IPJPnF4+tV/xptSgsaL6Vf2HKEiT?=
 =?us-ascii?Q?FL0pfYm9i5OLAxWD6xC/22Kky3io1yXag48Cto4Frthhxg2C+OqF76v2vgfG?=
 =?us-ascii?Q?Vznue/rCpkT3C+BwujX2bfWL+96btW3c0zYQGfxwdhPleiiGrM8+y7DFBl88?=
 =?us-ascii?Q?MxM/LEr4QEZfBxU7eADL4+1DMTiuGRMciW6FXnC4XVEmBrGMCy5LKyrpRQHF?=
 =?us-ascii?Q?+yXk9EanGzE7dOK6wt4FgzR5n2Rhkcr/+jthq3uTWX5KSdE56BAnA+zTsVl5?=
 =?us-ascii?Q?O+2AwcdHNglJCKOOMnIDKLWSrwaOv8BQv/AWwEf35aLkBSBdzr8XJ15cJcvq?=
 =?us-ascii?Q?ULDJX984elz08Ojq1GUdldtx9uNyPdV7E3tQIISdt3ufczuEvRXVtjTgaKKf?=
 =?us-ascii?Q?vsbVH9kUFc2R4pifxklIP1IYgAzVXuGcHvOJ65Wokp/uM5ZMD+jV3TApVezr?=
 =?us-ascii?Q?DmCY1P2Lg2pWRckMBb/ktVljxlwWbNfIB923ldJh+wNXZPGxywIMmD8L0vcJ?=
 =?us-ascii?Q?URz0XjFepap2muNr+f1BVjOG8L0lKjVQcfS16Tk34DI43rMprBz+kW+IbxmN?=
 =?us-ascii?Q?a+J7N3jvXbwsCVoyMvH+bcD8SD7HYRpj9fI2xYTzDBINBpsHiA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5326149-875a-4f5b-a465-08d8c98af6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 04:03:15.7356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ckhQ6jtkL0Y1ADg7CFlmNwf77043Wl4da0Cz5Jp/0smmf/G5Z9vO8L9gIQr1yHf9UYvjtrHwa3btHLke1KJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB5091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_230322_757250_6D2529C7 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/05 12:44, Palmer Dabbelt wrote:
> On Wed, 03 Feb 2021 04:58:57 PST (-0800), Damien Le Moal wrote:
>> This series of patches improves support for boards based on the Canaan
>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>> already included in the kernel. These patches complete it, enabling
>> support for most peripherals present on the SoC as well as introducing
>> device trees for the various K210 boards available on the market today
>> from SiPeed and Kendryte.
>>
>> The patches here are the remaining patches not yet applied.
>>
>> Patch 1 adds the SoC clock driver.
>>
>> Patches 2 to 8 add and update device tree bindings documentation to
>> document the K210 device tree files. In particular, patch 2 and 3
>> define compatible strings used for the SoC CPU and for the K210 based
>> boards supported.
> 
> Looks like Rob has some comments on a handful of these, so I'll be expecting a
> v16.

Yes, sending that today. The sifive gpio bindings doc update is still
controversial though and still missing the clock driver ack from Stephen.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
