Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EC6C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:41:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D59364E56
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D59364E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=5+gB1wcd3p2EDHkQqChQEVKoI15C0QaYeilD2OsLaaY=; b=rSKG29lUTvI5HIJTOTU4NY+vv
	d6aMFgzirJuqWpzG7PNr7e47JIJbsUwp2Nczp8snRML3J65axvi9n5HV0XJ7qPdMdeui7vKRDuM4P
	eGpLFuVRiCY5xvsgfOMWxGhycCHtjfRZJ8SqwtCSfZQmXqg4TTKML6MJuNkmRx8LVMHrNvXr9HiLm
	pZCJSe1tZMLtKOdnyEwplSz36SLPSY+cIzPJODaqLxXh+JPGlX/fDbn1fX4FYLbYOAqci2/zrAb3j
	jTX8lsWCUIAtSTmOiM/5h2NWvUwXbQ/KsqZ+RczDFa0dU3z0uduFaWxGubgW3LkXjsQf7EMe2hJtp
	FE6dAS4Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FDT-0006bQ-Bh; Mon, 08 Feb 2021 22:41:11 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FDO-0006av-QO
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 22:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612824066; x=1644360066;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=bvxZMnx1gZmPmk8gW/eQ432fZIpeo2SujEJ7uI8g0T4=;
 b=QAHRonTJz7mzDKPvh4fIDGZQr5vUqGRZPCt/4Q0ZLuvXx3KwbRdyjaXU
 P6Hdie3+ptzkK1coiC/H1Gqiz4QH8y4SWSkLbzixP3SinrXBB48H/nZN4
 vOlfMcvAdkkpoG25GG16JgwnQD5gVNkgi8JB1xpAb5xvO1+oEZpIa4zPe
 SpLUtYonRf8USPtZyyjSHyAPxJKieqvSlq7cG/8fAFmzv6kjZXOOA/q0r
 YEIiSNwqtBWy767Cqy6H5q5vbTaQ/P5lr4FK2NwRMbs/KlIZl79Va9SnW
 BapWuU1jUN4ZfPIx771KhMpKnxziDsudncchJewykc3GDb94R+4le/tu1 Q==;
IronPort-SDR: WwRgrDBljoyLphKkjbG2ar0A0HdQy4u4/Q05u4OMpKi6PDKosnAH7tDngcRxoPm9DeV1GaqIEq
 6nCW/cEZ6Nnu1xhhHt6ElXhuSmUg3a/O5nkc5WMumVyYYZXeRbwGnqLqkNv68ivxC8a9gkC+2e
 8QFFI5qpVDIdOwG6/ppCyj77j0IX1M0RBZl5PAHJHJJHMcFwt3jnhKA/sRXdFs6luQoLZiZ0I7
 qHK1Q+1wn+zDFvkv1rz+c8y1HmBdWkYGNb/yw3sU5wzyXI+BVk8QbtfWM3dW+ca3Zxkfzh1eAO
 VuA=
X-IronPort-AV: E=Sophos;i="5.81,163,1610380800"; d="scan'208";a="163942966"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 06:41:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg3WjiIlA9s3sV++3y5Ve3tXa/oLB1eo2pL60qE11Ph44HW2uzojegs/QPy3bS/tCVDl0J6qekbOJCk6a7nQmCJ7D8rUcLGciRNXN/EzfVBpIXWr52VTIYk04r2QbPJMYYkeumAzTOLLg0IfkmFkjPOsDQ2lx7cSOBKwZtHj2Iy/XFoKUSj3W/WlblQ+Xjp7xNT1naX8HtJSP6nYb8lkFtxbRY/pAPn069dRLVfIEaCj3bqUhvq3DbRI65sCpEipIppo8w3y7CaJFQ+HBwI8dWKM9XTCqA4nCE+lyZnFlyBEN5oim/aWIIsjkMtpaTMTmDHyTsog6OCKqNWtZq0D8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4sr2TqAZu5gLhEL1EjjwkcWWtSMOsiTlDDXUxMDJS0=;
 b=WedvszXzGhp+AWpFPjug8PSLCKwDqdJeV4KzzkWwVHsxWeWKMWtYkqE+NYap9OAKYiuZU2OZUGWrYdNGNtGp7Fn7nURlJoAGaADelkoG4egjkZhkrm9Y+RXMPYroQW3Y5mjoCRYLNzRPVA0qlwgJ0nT/vs6ZCBNFAC3UIPqqWN5InoUmT53f6+b2JD/DrYi+fIUWDWYDgQYda9Pa/n3J8cfOINB/H+3E5lu958WGifs4FrIP+Mf357Ri4IOCuRAiMlK5/4RStu9g4syVXUlJdExDGv5f61OVwwV8z9rzEFfxvxLGvWGHgdV2ghe08442XibD0LirS34qXvhmFkBRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4sr2TqAZu5gLhEL1EjjwkcWWtSMOsiTlDDXUxMDJS0=;
 b=n74BNna01FeLpK1S/cvxpGHH/+1HZXfXRUNAlYpAUYIX2SOKAGq9qzoiWBa5xDDnc445knQbPzxoH63NIfv69NsR79MxB+BmHgYvt1Qox1Da0WkxFoYWlJjfjlTZF8hc+V4sL0BLZjC2KNYP+8Rr8r6HfeYnngZIB2fzrBLyCs8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4915.namprd04.prod.outlook.com (2603:10b6:208:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 22:41:02 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:41:02 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Rob Herring <robh@kernel.org>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW+4xeGC09t/jMzkSSVnIpB80beA==
Date: Mon, 8 Feb 2021 22:41:01 +0000
Message-ID: <BL0PR04MB6514AA84D6D2BB8E8A920F71E78F9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <52dc2537-7668-4409-f35b-bfddfd09059b@gmail.com>
 <CAL_JsqJmpMf-bf=HxfWXLyYxzOH23O50QW6_TdjU0qukCW6Fhw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f420:fabe:ea5e:e152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5fd08c8-f2db-426f-01c6-08d8cc829cc2
x-ms-traffictypediagnostic: BL0PR04MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB491570A24D35ADBEBFC8D5E1E78F9@BL0PR04MB4915.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0wegGNSGMwE3d9CDQJPdX+Fefo7tn6tyYEmVxK+oumPIZaIv8dPJjiCJR7QybOPaeT831g9zyw5aXGgYiTT60DZVzok/00pVeSYqP6VcVgk5G/EsjX2t7LU9vPJp7IzmlYswfAz8DFfOhCHr4+K2iCaER4QL+OMozZj8vaurBznsb/LK/7ILvo7D88sx/ej7Fvo9V1spIAFKRvGYCa43aLmucb67Pej/zrMNufaS+oRuZ9c31Yyz50fUqR80DC/045LLQQqiW33QYAk7CEnciOpwvAyr55KQhARiWP/Jly0+3WWta5/amjKG0v5MqYO6UKopOkYhHL1uBpsW2SPvhxs9X+cMH8jt61akahb1vOpbk6mznVLUz7f77qvBbQFAjd6BZ086c/3wX4mNHoy9+pNvTXaOUkHko3PitdEBnukxa7jEkVD3OekoO0zfeseXdAImAZqhjOvCBmIB1CWXCbLDBeT22wG8CG/gwLIaOmTcLEY7kctl9uiPZDj1iXDK4qZK5MmyhBlx1qRUKch5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(8676002)(71200400001)(54906003)(316002)(8936002)(33656002)(110136005)(53546011)(6506007)(4326008)(5660300002)(76116006)(478600001)(186003)(91956017)(86362001)(9686003)(7696005)(83380400001)(66946007)(66476007)(66556008)(66446008)(64756008)(55016002)(52536014)(15650500001)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gauBojiBleI7BCVSSUJLYUertmEx2mntKmUWd0Tut4dptkpbHbTBJL3vW8yv?=
 =?us-ascii?Q?zT6lt3Gp9WClkrKWJjkSo6fS/M52j5RnAZ/MS6CloPLfR8mwZliq3pWW6LT0?=
 =?us-ascii?Q?x8t5CCpC3zH9XTDLbWSM73bpzMTq5Fc5o7G+SRDD+VDsRspG6Ja3QgHH8zp/?=
 =?us-ascii?Q?iEiQB3HRksjtL0nhNVqDIY4WozBTyAaK+ltGvlAPYhf3R2691TaROQ/5vVVZ?=
 =?us-ascii?Q?SNG8ecJdXJANjYK3jFsQ3JjWkPockzkcMevgvLbnozp2LPfmLLK/wr0bpE6f?=
 =?us-ascii?Q?BfrFsCdipQ7NyA+Cu8ORnGBiXGVoRLEghd0BHntDPctOwde4T1yxvZnj/0IT?=
 =?us-ascii?Q?OJaPL26NCjyQXXYemQhlRShrRwMwiy7tJbjArUTBPkmWXAsXKP37PCghudae?=
 =?us-ascii?Q?UWnHWQAIYb3gF5mTtVeNWXnUK/Nln3W//b9btdFXcTm9QY8SqHavt+RUSZpa?=
 =?us-ascii?Q?s9OWQQrZBW13dLcMGup81v4x31lIRnQamxB/oDVzuRpzVfI7hYEGd16ACoMy?=
 =?us-ascii?Q?n6jsqOhfqgSTnG0pKWzgvV19LvPpYhXBUPUi8bLVBPkWS/U/ymnl/eXM2tlS?=
 =?us-ascii?Q?NVpjdB0zvasxWmA/yPBnRsP5HFaR1coRqt1EhUYRueuQ0f4DgaiUKvICL2tw?=
 =?us-ascii?Q?V5/8y+Brl7f1CiANzO6bawUgYiyR9TTUngn+y9ubMBCv5IToT5ATG8sXg5sM?=
 =?us-ascii?Q?WjrlOCf0L/5AcILZ73JUd1+HuXdj1R9bzfsJhb0wBDvCprjYMbuIrQWILWeH?=
 =?us-ascii?Q?UUx0cnU+KrZ0HO7CcE/8HDNO5887m9I0HynhVBKdm8AB3I7yb41yqNEg4z+i?=
 =?us-ascii?Q?yT2qZC4Vd/msRuGTXfGT6yU/Ar2TpEtrogK/FpydoYg2g3PT3a5LcMyNMEB9?=
 =?us-ascii?Q?REc3D+aBKDmrkS7nBcvsSs50C4S0i7kENzJrysRx//cLFOHdI1ELiDbBLN2v?=
 =?us-ascii?Q?dQWZtRo1gF7OOppLpdVCnpBls5O5qeC0fgBIKQjnKyvvsfksMTj71o62n52L?=
 =?us-ascii?Q?pLzZ7yAjzHr8PkiYvkzj/zKyXXK36fFdHWUIJPPQbz0bFB5HCEoot2Xd1U9a?=
 =?us-ascii?Q?hi5WUmeCv2zqSptyGDmE3paK+vcLnEwivngrlJbq1lghyUDQb+t+Z/zlfzD5?=
 =?us-ascii?Q?VrapFQwE3PvbHIA9998Sz0U1eLNoqofDp34B4j1VapNjM89GEVOSrJ1OsL8z?=
 =?us-ascii?Q?DV7CaOY+XPtPCLCxKsPOW1imBkIAqUcBU9OyHEkKuEpCj/xnizLTODRkJmOH?=
 =?us-ascii?Q?XYjFzQXJwktvgFgZbgqTn2RjyWck1y4XgGiN+eSyhoB2p71Q1Dxfkg24Kx3D?=
 =?us-ascii?Q?MrM1w2qurM6zLNP9N8Upq25+Uqu2Q9nP98J+yMffa7Ga8vZCZe0UhmaC7SHz?=
 =?us-ascii?Q?sITNqv1RV+jat1HDBDhQYxTN91HygxDxAVZlx6vdJ/32tb/oqQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fd08c8-f2db-426f-01c6-08d8cc829cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 22:41:01.9226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIjV8IDlvA+FFXc0SbNMRgg9qFRBFKhXgOUnDz7nvBYjHI7CgJCXMF8IpWIztEs8C4QEim5moHBkRv3ETz6MsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_174107_343519_1DCBD8BF 
X-CRM114-Status: GOOD (  16.95  )
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
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/09 4:50, Rob Herring wrote:
> On Fri, Feb 5, 2021 at 4:52 PM Sean Anderson <seanga2@gmail.com> wrote:
>>
>> On 2/5/21 3:25 PM, Rob Herring wrote:
>>> On Fri, Feb 05, 2021 at 03:58:20PM +0900, Damien Le Moal wrote:
>>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>>> all peripherals of the SoC, their clocks and reset lines. The device
>>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>>> configuration option. No device beside the serial console is defined by
>>>> this device tree. This makes this generic device tree suitable for use
>>>> with a builtin initramfs with all known K210 based boards.
>>>>
>>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>>> removed from the dt-bindings k210-clk.h header file.
>>>>
>>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>>> U-Boot support for the K210.
>>>>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> ---
>>>>   arch/riscv/Kconfig.socs                     |   2 +-
>>>>   arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>>   arch/riscv/boot/dts/canaan/k210.dtsi        | 535 +++++++++++++++++++-
>>>>   arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>>   include/dt-bindings/clock/k210-clk.h        |   1 -
>>>>   5 files changed, 554 insertions(+), 53 deletions(-)
>>>>   delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>>   create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>>
>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>> index 6402746c68f3..7efcece8896c 100644
>>>> --- a/arch/riscv/Kconfig.socs
>>>> +++ b/arch/riscv/Kconfig.socs
>>>> @@ -51,7 +51,7 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>>>      string "Source file for the Canaan Kendryte K210 builtin DTB"
>>>>      depends on SOC_CANAAN
>>>>      depends on SOC_CANAAN_K210_DTB_BUILTIN
>>>> -    default "k210"
>>>> +    default "k210_generic"
>>>>      help
>>>>        Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
>>>>        for the DTS file that will be used to produce the DTB linked into the
>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
>>>> deleted file mode 100644
>>>> index 0d1f28fce6b2..000000000000
>>>> --- a/arch/riscv/boot/dts/canaan/k210.dts
>>>> +++ /dev/null
>>>> @@ -1,23 +0,0 @@
>>>> -// SPDX-License-Identifier: GPL-2.0+
>>>> -/*
>>>> - * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>>>> - */
>>>> -
>>>> -/dts-v1/;
>>>> -
>>>> -#include "k210.dtsi"
>>>> -
>>>> -/ {
>>>> -    model = "Kendryte K210 generic";
>>>> -    compatible = "kendryte,k210";
>>>> -
>>>> -    chosen {
>>>> -            bootargs = "earlycon console=ttySIF0";
>>>> -            stdout-path = "serial0";
>>>> -    };
>>>> -};
>>>> -
>>>> -&uarths0 {
>>>> -    status = "okay";
>>>> -};
>>>> -
>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> index 354b263195a3..63c1f4c98d6c 100644
>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> @@ -1,9 +1,11 @@
>>>>   // SPDX-License-Identifier: GPL-2.0+
>>>>   /*
>>>> - * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
>>>> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>>>>    * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>>>>    */
>>>>   #include <dt-bindings/clock/k210-clk.h>
>>>> +#include <dt-bindings/pinctrl/k210-fpioa.h>
>>>> +#include <dt-bindings/reset/k210-rst.h>
>>>>
>>>>   / {
>>>>      /*
>>>> @@ -12,14 +14,33 @@ / {
>>>>       */
>>>>      #address-cells = <1>;
>>>>      #size-cells = <1>;
>>>> -    compatible = "kendryte,k210";
>>>> +    compatible = "canaan,kendryte-k210";
>>>>
>>>>      aliases {
>>>> +            cpu0 = &cpu0;
>>>> +            cpu1 = &cpu1;
>>>> +            dma0 = &dmac0;
>>>> +            gpio0 = &gpio0;
>>>> +            gpio1 = &gpio1_0;
>>>> +            i2c0 = &i2c0;
>>>> +            i2c1 = &i2c1;
>>>> +            i2c2 = &i2c2;
>>>> +            pinctrl0 = &fpioa;
>>>>              serial0 = &uarths0;
>>>> +            serial1 = &uart1;
>>>> +            serial2 = &uart2;
>>>> +            serial3 = &uart3;
>>>> +            spi0 = &spi0;
>>>> +            spi1 = &spi1;
>>>> +            spi2 = &spi2;
>>>> +            spi3 = &spi3;
>>>> +            timer0 = &timer0;
>>>> +            timer1 = &timer1;
>>>> +            timer2 = &timer2;
>>>
>>> Don't add random aliases. Really, only the serialN ones should be here.
>>> cpu, dma, pinctrl, timer are definitely non-standard.
>>
>>
>> All of these except for cpu and dma are already found in the kernel.
>> They were primarily added for U-Boot.
>>
>>>
>>>>      };
>>>>
>>>>      /*
>>>> -     * The K210 has an sv39 MMU following the priviledge specification v1.9.
>>>> +     * The K210 has an sv39 MMU following the privileged specification v1.9.
>>>>       * Since this is a non-ratified draft specification, the kernel does not
>>>>       * support it and the K210 support enabled only for the !MMU case.
>>>>       * Be consistent with this by setting the CPUs MMU type to "none".
>>>> @@ -30,14 +51,14 @@ cpus {
>>>>              timebase-frequency = <7800000>;
>>>>              cpu0: cpu@0 {
>>>>                      device_type = "cpu";
>>>> +                    compatible = "canaan,k210", "riscv";
>>>>                      reg = <0>;
>>>> -                    compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>>>>                      riscv,isa = "rv64imafdc";
>>>> -                    mmu-type = "none";
>>>> -                    i-cache-size = <0x8000>;
>>>> +                    mmu-type = "riscv,none";
>>>>                      i-cache-block-size = <64>;
>>>> -                    d-cache-size = <0x8000>;
>>>> +                    i-cache-size = <0x8000>;
>>>>                      d-cache-block-size = <64>;
>>>> +                    d-cache-size = <0x8000>;
>>>>                      cpu0_intc: interrupt-controller {
>>>>                              #interrupt-cells = <1>;
>>>>                              interrupt-controller;
>>>> @@ -46,14 +67,14 @@ cpu0_intc: interrupt-controller {
>>>>              };
>>>>              cpu1: cpu@1 {
>>>>                      device_type = "cpu";
>>>> +                    compatible = "canaan,k210", "riscv";
>>>>                      reg = <1>;
>>>> -                    compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>>>>                      riscv,isa = "rv64imafdc";
>>>> -                    mmu-type = "none";
>>>> -                    i-cache-size = <0x8000>;
>>>> +                    mmu-type = "riscv,none";
>>>>                      i-cache-block-size = <64>;
>>>> -                    d-cache-size = <0x8000>;
>>>> +                    i-cache-size = <0x8000>;
>>>>                      d-cache-block-size = <64>;
>>>> +                    d-cache-size = <0x8000>;
>>>>                      cpu1_intc: interrupt-controller {
>>>>                              #interrupt-cells = <1>;
>>>>                              interrupt-controller;
>>>> @@ -64,10 +85,15 @@ cpu1_intc: interrupt-controller {
>>>>
>>>>      sram: memory@80000000 {
>>>>              device_type = "memory";
>>>> +            compatible = "canaan,k210-sram";
>>>>              reg = <0x80000000 0x400000>,
>>>>                    <0x80400000 0x200000>,
>>>>                    <0x80600000 0x200000>;
>>>>              reg-names = "sram0", "sram1", "aisram";
>>>> +            clocks = <&sysclk K210_CLK_SRAM0>,
>>>> +                     <&sysclk K210_CLK_SRAM1>,
>>>> +                     <&sysclk K210_CLK_AI>;
>>>> +            clock-names = "sram0", "sram1", "aisram";
>>>>      };
>>>>
>>>>      clocks {
>>>> @@ -81,40 +107,493 @@ in0: oscillator {
>>>>      soc {
>>>>              #address-cells = <1>;
>>>>              #size-cells = <1>;
>>>> -            compatible = "kendryte,k210-soc", "simple-bus";
>>>> +            compatible = "simple-bus";
>>>>              ranges;
>>>>              interrupt-parent = <&plic0>;
>>>>
>>>> -            sysctl: sysctl@50440000 {
>>>> -                    compatible = "kendryte,k210-sysctl", "simple-mfd";
>>>> -                    reg = <0x50440000 0x1000>;
>>>> -                    #clock-cells = <1>;
>>>> +            debug0: debug@0 {
>>>> +                    compatible = "canaan,k210-debug", "riscv,debug";
>>>
>>> Not documented.
>>
>> On 1/14/21 7:06 PM, Sean Anderson wrote:
>>> Here it's because "riscv,debug" doesn't exist. This is the "debug"
>>> device as described in the debug spec. AFAIK Linux never needs to
>>> configure this device. It could probably be removed.
>>
>> No objections here.
>>
>>>
>>>> +                    reg = <0x0 0x1000>;
>>>> +                    status = "disabled";
>>>> +            };
>>>> +
>>>> +            rom0: nvmem@1000 {
>>>> +                    reg = <0x1000 0x1000>;
>>>> +                    read-only;
>>>> +                    status = "disabled";
>>>>              };
>>>>
>>>>              clint0: clint@2000000 {
>>>
>>> interrupt-controller@...
>>
>> Yes, this should be changed.
>>
>>>
>>>> -                    #interrupt-cells = <1>;
>>>> -                    compatible = "riscv,clint0";
>>>> +                    compatible = "canaan,k210-clint", "sifive,clint0";
>>>>                      reg = <0x2000000 0xC000>;
>>>> -                    interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>>>> -                                            &cpu1_intc 3 &cpu1_intc 7>;
>>>> +                    interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
>>>> +                                          &cpu1_intc 3 &cpu1_intc 7>;
>>>>              };
>>>>
>>>> -            plic0: interrupt-controller@c000000 {
>>>> +            plic0: interrupt-controller@C000000 {
>>>
>>> No, lowercase hex in unit-addresses was correct.
>>
>> Do you have any authoritative source for this? When I was creating this
>> tree, I didn't see anything about what case the addresses should be in
>> (and a quick grep for lower-case in Documentation/devicetree doesn't
>> have any relevant results).
> 
> It's ultimately up to the bus definition, but the DT spec may say
> something. I don't recall offhand. For most bus definitions we have a
> schema enforcement and dtc has some checks. (Though I just noticed the
> simple-bus schema allows uppercase which is an error. dtc does not.)
> This case doesn't get caught because there's not a bus definition for
> root node. IMO, it should be same as 'simple-bus', but there was some
> debate about that when I added the dtc checks.
> 
> The other cases should have been flagged by simple-pm-bus.yaml. You
> all did run 'make dtbs_check' on this, right?

Yes, I did, and rerun before sending any new version of the series. No warnings
at all show about anything.

> 
>>>> +                    otp0: nvmem@50420000 {
>>>> +                            #address-cells = <1>;
>>>> +                            #size-cells = <1>;
>>>> +                            compatible = "canaan,k210-otp";
>>>> +                            reg = <0x50420000 0x100>,
>>>> +                                  <0x88000000 0x20000>;
>>>> +                            reg-names = "reg", "mem";
>>>> +                            clocks = <&sysclk K210_CLK_ROM>;
>>>> +                            resets = <&sysrst K210_RST_ROM>;
>>>> +                            read-only;
>>>> +                            status = "disabled";
>>>
>>> Your disabled nodes seem a bit excessive. A device should really only be
>>> disabled if it's a board level decision to use or not. I'd assume the
>>> OTP is always there and usable.
>>
>> It's disabled because there is no driver for it (yet). Though see below
>> for the reasoning behind this.
> 
> No driver is not really a reason to disable. Why force a DT change
> when there is a driver?

We can omit the nodes that do not have drivers, but when the drivers are added,
there will be a need to change the DT. So isn't it the same in the end ?

> 
>>>> +
>>>> +                            /* Bootloader */
>>>> +                            firmware@00000 {
>>>
>>> Drop leading 0s.
>>>
>>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>>> make it translateable.
>>
>> Yes, there should be ranges.
>>
>> Though I am not sure that the ROM is controllable from this OTP...
>>
>> Perhaps it should be its own node.
>>
>>>
>>>> +                                    reg = <0x00000 0xC200>;
>>>> +                            };
>>>> +
>>>> +                            /*
>>>> +                             * config string as described in RISC-V
>>>> +                             * privileged spec 1.9
>>>> +                             */
>>>> +                            config-1-9@1c000 {
>>>> +                                    reg = <0x1C000 0x1000>;
>>>> +                            };
>>>> +
>>>> +                            /*
>>>> +                             * Device tree containing only registers,
>>>> +                             * interrupts, and cpus
>>>> +                             */
>>>> +                            fdt@1d000 {
>>>> +                                    reg = <0x1D000 0x2000>;
>>>> +                            };
>>>> +
>>>> +                            /* CPU/ROM credits */
>>>> +                            credits@1f000 {
>>>> +                                    reg = <0x1F000 0x1000>;
>>>> +                            };
>>>> +                    };
>>>> +
>>>> +                    dvp0: camera@50430000 {
>>>> +                            compatible = "canaan,k210-dvp";
>>>
>>> No documented. Seems to be several of them.
>>
>> Correct. At some point there may be drivers. But there is no
>> authoritative information (memory map, list of registers, list of
>> interrupts) outside of source code for this board.
> 
> Then you should just omit it.

OK. Will omit the unsupported nodes. Sending v18.

> 
> Rob
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
