Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2220C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xc0/hEbXHC9aIdqggS0fOlF22uLaTIm4KOYZj8eNTxo=; b=uRBThJk3vsv02z
	H+AcUFcIb2pilDs2ZVrQ6/U2xMeIz9yytLQaNv5KpaAhIn4hLD9wZNbrgmQfr+pYXuktTBbTKlRoO
	UyPxlCZWsYaw+man8964v3gpzDJstIdoQZK6wV3RetlKOLr31KLjpMZQs770mgfVvWTPf2eiLBFsQ
	DUJlLKTnhn8NZ2xjchVNiwzI5k2s3SzK01iZn4SIZsbnzZ37hSeu4Oz/r9qkeDRvqkYLBP6iYXpys
	ohyihuen42ZZxHziltab7rEBPM63cAE4ist4JvywzJ4S/yqMfg9TVaDVeqezWqDkICS0nIVa3ZF4D
	N8mMFbgANh6YNzY44/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPOpq-002jla-Nw; Wed, 02 Mar 2022 13:16:06 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOph-002jgX-C6
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 13:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646226956; x=1677762956;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5tQB5Za/xO68AE5Aoc8d9KfXfiPf1NR8lIeD5ZedbLU=;
 b=Aj8BnbvbHmB6O4UgX+bAMiGOM6gYsLz9X5xvIvYEfGGzy7I4CQu99CGQ
 wPVX8ndqzbve+0+SgY1ACrj0dtaCBl7znG3AXTqwZ1m6mQ61tVgkv4Sxl
 jksc1w//MUMdTSX9yPVMgzFn2q+75bbsizJsvcJzA5JHw2ZVojNsUDjHu
 K6lqPzu/KHWosPyUCi27WYXo8UgATnL32qZkVMJ1h46rDBsQKy5/DELoa
 waxLiEZ5gYm2luOfPLqIg+gfzgA7EhLm+v+4uUsbgnjjYj8y0Ct1EYiOA
 pgrNun6o/PVdz8xgTRfPmRsmVHDeqspnpSGzn+1aBZDY3uwDTA/hBzwLM Q==;
X-IronPort-AV: E=Sophos;i="5.90,149,1643644800"; d="scan'208";a="199131183"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 21:15:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDWEExlXGR+LSuiqJdbO4Zc8Lx9+AQj3ZMx+SPEgM2KxwsTFjiI90bLuJzS1YyTqNxNfaypeocMOSf+tWlY3lIBBLMVb+9tIvkwYPRsDoqr3Zjm247+T+zHkZyjmuZxx4u6a9hc1Vie3pm2C4Q54o+BlshIIVmZbMFampl/CmIsH0C7Xh52L6bbrjetxMidehXq8f38CCaDXEFvYLWKHhY1hy12E//E5H6Bj6hEKsyi6br6Dc3mwWDizF2lcIXbuoHILAbrzGBG0A4xwMD9mvXCshcvmPeodIiyzgIuozJSdp0BVGKsKiw/nTPR8jzsca97Qe+jID0gsA2vcwTdajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoMng6lJw9R0W9GhZ+fB/mQdwGT8av9MV+vcng2cxvI=;
 b=NMfvUwJYyOZ/ROnw7ygDqT0dUJzKGRD/3UqXqKSZySdRZGrBInwee2fQB2eV06Ifln22dHYxG+kjDmGPZRtOibiQl/gHw8Cr2bkKSDpvxVYrq6+TFhZkv67AJkEVBHDUw5DjqvM4NC3kqckVOmyga7W3Sci0ZEQ4WfSuKLtBwckWGih+gU0yfDuwmmOuDNEct7ntf4ij2JIDx4jsx6Pa2GkpoZbwLvkmqPb6NLwGZaDGU6mtRwy/798fSIUqYCHKhnjqLL8a9lgGDe2GBvb7BKkOej5UDLPL+35eP7nQnwuQC5AKuP8A51OC0MKitXegengHSMjdyoy8zyzCaRhaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoMng6lJw9R0W9GhZ+fB/mQdwGT8av9MV+vcng2cxvI=;
 b=Rsok0v6//sf0EbyGDrqpU/0hArZv2HL21VKBitwsz+E+h2EfVbrn0UlTL5K1XFdziMjZjyYN0qOVivhqKKiqaha1fWTIIryop8+t9zOvLFtsFlKZhxwFIxku4S0qQnUQ1Y5bcir8VsMHKBUK/KZleozv/f+QYoin7wK/BpWSJfU=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by SJ0PR04MB7759.namprd04.prod.outlook.com (2603:10b6:a03:3aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 13:15:51 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:15:50 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/2] sifive-plic minor improvements
Thread-Topic: [PATCH v3 0/2] sifive-plic minor improvements
Thread-Index: AQHYLjejmoJ9N+RcakmElEgzNW5U2g==
Date: Wed, 2 Mar 2022 13:15:50 +0000
Message-ID: <20220302131544.3166154-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf970c12-52a1-450b-13d8-08d9fc4ec608
x-ms-traffictypediagnostic: SJ0PR04MB7759:EE_
x-microsoft-antispam-prvs: <SJ0PR04MB77598547F793D317CB2C0381F2039@SJ0PR04MB7759.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UF930HA9ddUS7PvlB3CifNNIV3RR4nmlEuLdn41VeodZTs1pS0zt9VUc8tSRXiPW8zzf2m5rfv8pb6yLNNf2CsuepzdmByOrhH6ikP2qj2dZz27efL6JgIescLm+fy4KTNky/o17v38eXD/6TkIRjLDbyay2mBfz2t3NoBc3XoCTF6xSJmcRvHUSM/of9a+Rc4wFLMFz0KsFiO+6yMmoJ+ryP+4+6rVJCal4DQ1hae6q+pZLbwZIjUZHSkRa2GrkhnhWUXO0PGS/cg6/rrU4rax/iFIwbm4cZKzOQ6EEfes1uUR0yRIlqC6q2jCFgQqssLim4uGIerIqJpQAskaUNU0MlMSfS/zSN9ci8KdBpS3gJw9Q8v5LF9QPvT8hRg3hksq4Bh6zHHv9k85UV1vMVTv4eyXTcMPy+r/vZoQdCrMvxidDy6F3DNJZ9nJjNRJyFzIT6lKyUFo10+KI3a4kF3d1oEQ8rZCXfwqWz4lGcDrDEa4j4TKWpw2k7AcKFUunKVLBKsCugYFBeWCQ9NvEodFhRoqQEoLdikOfDgv6rhiQFy5aI+4yVXqtjQlMBf39y5yw5lrkay4I3XOgI4hPMfo/VeKpvV9ZIbugFJRDvEdniilV7ppP4jhVJtZLEpASef8rEhd9YNZYDEaRNyYmOoPI2biRqNsZLcLMerEc2uhZmZGFeU8OHkqyLeKzGaujqLRH/vUf6HzfZ8/xKbifXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(6486002)(4326008)(316002)(66946007)(76116006)(66476007)(66446008)(66556008)(91956017)(64756008)(71200400001)(6512007)(6506007)(83380400001)(26005)(186003)(1076003)(2616005)(2906002)(110136005)(122000001)(54906003)(508600001)(5660300002)(38100700002)(4744005)(82960400001)(38070700005)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WnmmteZbvWp4HChIDAgmWqz0rL6kWyKeU8dIr1ndpwGoebNS/EXRIocsGw?=
 =?iso-8859-1?Q?3ZdlZuzndPfmuNDnOe5KAjqnHqvMDKkwmzPjLHgM4SKUsvf4Sz6zWa4rWm?=
 =?iso-8859-1?Q?48fcEDDEd1N43sbWNfTumThKVjJ7vvYFwNJHGRTP5sRIWHN6mfBxFItGum?=
 =?iso-8859-1?Q?PMKtvGCHi3bXmv4O9LX+ukTpytrJe+QkCDPnPBhvqpuwD6A8L8Y9b4YBvs?=
 =?iso-8859-1?Q?VN/xj7sbmzQYq26lRW1AHhUAZ6Y2XfxkskX8pMCybHuXOVGj5i57M19vkw?=
 =?iso-8859-1?Q?YaVGY9I9BglzarCPEp3693kOOk9AJFaleKlfZr2qS8ikqOClQqWrUO3H6e?=
 =?iso-8859-1?Q?Hd4rLTYhpv2WaO9Gkhr9FC0nkR8k0yvkDZg7uFbUX15tFzevTnamsNIrlU?=
 =?iso-8859-1?Q?svK/3iiDn60AKPiEEgmnLF0wTNBspkiDtB2h6vmMVwqL4uCcyucb6wEhK1?=
 =?iso-8859-1?Q?W0S013PbBB1V2sCLLO+wlRoWLGL38eqY2S3Omn/yFDrgVo58gIS/4mI0Hf?=
 =?iso-8859-1?Q?R7dY9a2OABrdvOke9wMOCHIDQ+0tRMC9fQO4ldzfLkDku+Oy+85LFx1q3T?=
 =?iso-8859-1?Q?QUZj4iELddK292Axrqyjb3jfZR5WZdb1JF+Sqoq5h1wZ9N86Y35VbU4HcV?=
 =?iso-8859-1?Q?Q77poLfN5E/ApGVa5Rhy4SehGv/n+ehbzYBNK9qUzmS94nGvVnp5Rpn6eB?=
 =?iso-8859-1?Q?3sBcTKgYwnVncWFKw6t3o/Y2LMTvgVqVg9gQIaRsL26oxEjN+WAEahfXO4?=
 =?iso-8859-1?Q?ur2n69rnwxrUN93UJdnLag3pSNC1eRPfAYsNyhC5cokyy7BsinEg+bJzy4?=
 =?iso-8859-1?Q?FPs0qse86lowdtTqV+D/FuiYNHxBZ+5sWJhJOKSuowetAG2sYdpgvgDKFN?=
 =?iso-8859-1?Q?EkpyEV9oqK41XMenwckYCty5D6SvUQdlIyPFFy0JYR+n+Vi9FrFrjH9aBw?=
 =?iso-8859-1?Q?NlWBMSxn7TP9ualo9l6pZxT03ib2apRp67KUay4XXOkZ0JBkHJjOT2gyMl?=
 =?iso-8859-1?Q?QctPrcB+GhhUff0P3HaLQHgrxgaOabpO+s6A8RnFwJyUuOV00h9r/a/SHK?=
 =?iso-8859-1?Q?mfKMvnJudlUdzJnMl3DYphTjy8FlyijidgFxPC+MFFQS0uIO/lecBisORD?=
 =?iso-8859-1?Q?8R6xYO0qwa0IJ2/DR9vDp9tzUwsrLgc1knkqiKEII7HFk+EEYMsXh+l5LA?=
 =?iso-8859-1?Q?nTKAcHchrTedCceDjSa8BL2f8ACTFy35iM669nD/8rxzXMe7Wnl23YFS0s?=
 =?iso-8859-1?Q?+QjtO53vwBmkEEyvFEPhF0cBYUxXbCcXkOW3C7sdXHdHCVD2pO24W8QerW?=
 =?iso-8859-1?Q?IqSiVnL6EB6NvuPcUW3iQzmwOYBMRPPI0Yf+ROikrSjnrwZpNtuQLdZltI?=
 =?iso-8859-1?Q?HUYN9PZsr0u1nkvQeNOX37Q5ia+Gu6Pdrv9iyaGXOEvtRlDes4652zxuqS?=
 =?iso-8859-1?Q?7VVFFbTL53nla0g0oJfTaEB8yXJmBE4dx6ASHymRDb75hcvam7E/p5Xflr?=
 =?iso-8859-1?Q?oyV/Q7O69sp20rSSqIGVBGJgZN6FuQTkAhPqmV6Ja6def2f1viFhnLkL7/?=
 =?iso-8859-1?Q?i/5NpUMjFlkuct1ON6ys8lgjrG+4eCeAmuqef10EKcNaJF2JSSjxBMByDu?=
 =?iso-8859-1?Q?QTCtnsdwFPk/2iOEsb4sGPjeMWmBzbCPCdwoO4NEV2QJpLBtK6Vv2yMHwM?=
 =?iso-8859-1?Q?YrDxq9nUN2yGJnXA0Q0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf970c12-52a1-450b-13d8-08d9fc4ec608
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:15:50.8296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /l0eJZd+4uuJ7grkpgk7VbjsaT1XQCC1BmAqrU7xobyAuFxg3blS3weupEuUen4pv9lWPIVgkDdBschzPVMXIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_051557_467887_48A3CCF7 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Hello there,

This small series has two small improvements for the sifive-plic
interrupt-controller driver.

Thankful for reviews.


Changes since v2:
-Picked up Reviewed-by tags from Anup.
-Dropped inline keyword from patch 2/2, as requested by Marc.
Changes since v1:
-Addressed review comments by Anup.


Kind regards,
Niklas


Niklas Cassel (2):
  irqchip/sifive-plic: Improve naming scheme for per context offsets
  irqchip/sifive-plic: Disable S-mode IRQs if running in M-mode

 drivers/irqchip/irq-sifive-plic.c | 38 +++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 12 deletions(-)

-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
