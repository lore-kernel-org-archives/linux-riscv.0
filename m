Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB20EEB587
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPMTyXyTMVpROLMJm4q4EVtdPCq1PnrVlUPjEajkv8A=; b=CIdsNNhXavyw9s
	hGI7Hr1LztoNkai0EBVEHPapLTwp/RFI8yLZc14RKVnbmA7BIB82fCOFMZ7nduvIgxyLSlHFQspd5
	fG9Gi4Saq0YY0NwykKi1vq3tVi5XV8mtXreLvON3mJfcsO45NzqhI3fZhBRMdHGIPhnv3tt/F5/uM
	/GvDHdrls87qan0lqr5KCxr5VNbsfhESMtxVQUJbfejxnEqw+Qpi0WVfJhEKtbwanu4NIUEBf8MgI
	JIOH8Yw11J2H0Xptkj5XJ1l5V6z7FtQivSYt/UT+lImDd66ufgF8niucjegpMxaIw63JPZnVqgF3G
	ruTiAsfYGz6y+PUD94Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohDY-0000000CiZJ-0jFL;
	Thu, 12 Sep 2024 10:38:28 +0000
Received: from mail-bjschn02on20727.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::727] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohDT-0000000CiYY-2VRX
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 10:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ3/MJVBO2Aqx9T9Rew12P/KY011590YfpK6e4monCro1moLYDIno2I8JDjb1FZ+L6wspuSaaPcsK/2Vm0ZmzXracgkdbt4AiBIgfH8/2QyGhT4v78kzkJ0JouFoLQC7id9qomktsoLr8JX/EYfgoZSmDwVxP1nWOwAsx8OLby2fZK3UfpuvzCAthZMNW1KUl7vF7Riu/D2wVXq/xKtiK2FSavj03VjKwqCHH87ZyIqys6pO3gcQ2wdJJVS+iRc8ehCC9Qhb87qTCO8eYGtp8IKZS3QEiUCi+RWW+rDqThAAB2cSk5J4Tj35o81KCptdp31Uwir4nXW3xSKcjqEtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHQUC0HLi0AdBiexunFutsgMAjpj7TgMuTlRo9dZ6PA=;
 b=bX8OtSBS6PpxwajsbAi3Z4TY5Al361jH9iGKzspKt+f326tJ8ZEpTcH+ghBEST9VMtWwz/1UGUSkI5YivULGGn5vKz3WawDDAVgBM84HWZnLUAKk8TQ0nUnWy4L2qDAFFgWv26crb54+LvLPNYnGI6Hh+0teyqaNIv58rB1QbUkzun6oG+xHAOM4+zKVKyUoSCrD6kpXemj3z58K6KVnDn4Ho+tX/1RjwUwEbawK3oiDbol1GTsnek9oGRunQJ89fy1xUMvqpic08CLSsD1Y3TbjB2VBu/J63ggqpS3J6qecbAVs9V4NlswCv8/5RVnCOK4Z67f4YSlsdTc3ya48kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::10) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Thu, 12 Sep
 2024 10:38:17 +0000
Received: from NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn
 ([fe80::2f21:816:8fe3:e6b1]) by NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn
 ([fe80::2f21:816:8fe3:e6b1%6]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 10:38:16 +0000
From: Kevin Xie <kevin.xie@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>, "daire.mcnamara@microchip.com"
	<daire.mcnamara@microchip.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
	<kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHY5IDIvM10gUENJOiBtaWNyb2NoaXA6IEZpeCBpbmJv?=
 =?gb2312?Q?und_address_translation_tables?=
Thread-Topic: [PATCH v9 2/3] PCI: microchip: Fix inbound address translation
 tables
Thread-Index: AQHa9Vf2RPNmxyZqn0mZxLezldc8ybJUB3gggAAMcSA=
Date: Thu, 12 Sep 2024 10:38:16 +0000
Message-ID: <NTZPR01MB09857A795C29C720658BD69B82642@NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn>
References: <20240823122717.1159133-1-daire.mcnamara@microchip.com>
 <20240823122717.1159133-3-daire.mcnamara@microchip.com>
 <SHXPR01MB08632D4FA056118612EA675AE6642@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <SHXPR01MB08632D4FA056118612EA675AE6642@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0985:EE_|NTZPR01MB1018:EE_
x-ms-office365-filtering-correlation-id: 24658081-ac15-4084-6054-08dcd31702fe
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: naIPQtDBGwqUpo/KOSwA370Ueqsb2dvu04EesFwEW/PdofDnkJzRYBJnXVVZbSMS9digOtgV4T6tmHMWkQJc9KKfBDIZDYZL7PHYnp3cM6MvRZfvS2QuwVoPi9Slrklexiw0xX9DlIWTqwCLRn2ud4FrdIM0xax+lOvvXtae7D/DrxjLKN5W8Z/p+qRL4gnd50lG0HxuRHABFZkFZJk1i17OzqpdH8OZFvmiKeaDgS/aZwStNLWgCbSPHu7K2PeGAxqAwmtGix9buFz5AlbaWgHO4NsQnwZfjPnFR0FTQEUQioPfUBr261WZuJi4wTAD/UbKME+t1mGqBhNTior5qWJbc6pejW11vtXqsRxzTaaPTQ0Bw4JnMgjg6TzVvPd68QMilPdIpRc0vvRAMJUK4gXnhx7wHLGj91jrqVbSqGoslKo1sLSIESbPFfQxH7nS5hj8mCzmi3ODvBwV7uPa3UepwR/jr/iUYbXY4sAuPem84frAcdhhZrwHDY4jmGwsS0JkliQLpQIXInt91CtqxZaivNeqf1Nfg/bySsfEr2G8e5nkLkN90Tu3aG1hkeLkU/0zvedcOX262miST1u0ZTnctnKbXn2rijw3z5GUsqmiSpgCgGESmQPXhoIVKGoA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RllHb3dVdHJWV3g4SUVNenlhSDZtNjRmak5OUTFoWTFJS2JIRXVtU0l1OG9Y?=
 =?gb2312?B?UjNHYWduUHgzdWVJQnAram10dzJjR3BCM3VXQUxBQzhoTzh0UXdmWXJOWlY3?=
 =?gb2312?B?bDVIa2wwTDdaOFphTWZVMW5vekxRcjFPbE1EU1oveE91SWRzeU9mZ3hrM1Ez?=
 =?gb2312?B?UHFjNkxJRWs1Q2FaNTdrbWhJc2NHZU5wY3I0T0NObXl5R2dVY3p3ejZ4em9G?=
 =?gb2312?B?NXRIbmQ3bmwrSExjVDErS003RVJaUnNNUXZwdnBzeDgrV1pmQWJBNTlXN2FV?=
 =?gb2312?B?MDJIYUZuYitBMjYvR3ZLNFZxdEpKQ2NQb0tzZ3dGOElKNk9SbVNFRmVvZU9P?=
 =?gb2312?B?Ly9PeDgxS0NuQXhLYWljcjdGUWsxS05VckhmYzE3TFVWSTFlTHlWZGNRaVpx?=
 =?gb2312?B?ZUhiRWVRc2dnZGU0dzNvdEFzQkZTaUR3cFNweDBWa2NXRzEyaENTTnpiME8v?=
 =?gb2312?B?dXUvVkVhTk4ycGNFcUJ5UFA1eGpxWkNMck44Y0VodzJYU1daKzFmVHRhNUEr?=
 =?gb2312?B?WDdXeUo0RE5meVNNOUV5em1lTkFJNjh1MjVTTFZSYnlLbDFkUUlvNmIwemh2?=
 =?gb2312?B?OUdhUVpYY3hmZzlucmZjYU9ObUhGamNhUGhLRHVrSWlFZkU1UEV3aEM5U1hH?=
 =?gb2312?B?SVdVc3hJdUpjL1RVeEFUeElSaWpwQkxPNDFFSEZzTGJpMzByVk5nTXdVbXJl?=
 =?gb2312?B?aGM4VUJSTkR2cEcrTnNpTWtYS1lKWXRXRWxPMUhPQUFxTUs4dWZxMGhkaHJp?=
 =?gb2312?B?cWNUV2hBNHJDWEp6dXJwanROTC90L1VoMytOZWdtc1NXbU1uaEQ4azFya0hE?=
 =?gb2312?B?bEdJcEZBdE9MdDgrQWUwcjZGbmRrVjd6d1N4MENmS1VDNnp1WHV4ckNFVjFm?=
 =?gb2312?B?Ly9Eei9qZ1lwUlhPR2RjSlhNa1IyR0tQN2V0TmJZTWJ0US9kL0tzY3pyRk1q?=
 =?gb2312?B?K2VSVjlHdWNtc3NuYnZjcjBHcDRtbGp1QWZScXdFUm0yeXVyaktsQ3NEbk1t?=
 =?gb2312?B?cUdOazVlVmZDWlpkQmE0VnFndWZia0VCa3V0Q2QwRE91d21BYmNqeXdFOHdm?=
 =?gb2312?B?THpoSXJ3Nm4vcWxXVEc3ZDVYQ1hIM3B5NVd0R3hQck5KY2k3YVlIei9RRDJt?=
 =?gb2312?B?WkJjVndPbDRHQjJTZVNPK28wbnR5THpNN3RXdTdMK1VuNGR6Z2piL1JNNGMz?=
 =?gb2312?B?akVTOE14RzNXOVhyVnAybThSZFRRK1BWd1RMVVRwZDZ4ZVNObXhCYkx1WFJR?=
 =?gb2312?B?byt3SUxwTS9USnJKenNMR1pUWGtobTJ3T01wdzE5VHBhUGJ0ZGcrQ2J6SlZa?=
 =?gb2312?B?Rit1S083MVpRTE1PdVdiS215S1hleUgxMnVBVWh1b0RBN01tYVJuZFdlbFMx?=
 =?gb2312?B?bittbGFYMTQyMGpIOUNPNFM5L1Y4UDBrRXpBSGtoLy8zd0F2aUJzMWpCeC9o?=
 =?gb2312?B?VjZ6ZHJkUmU1eEt6b1MwVS9GZktjNU84RUgveENIcDhpbFEwZmRsNW5jVVhE?=
 =?gb2312?B?eXNEdG1jd2xoQ25SUTZUSnQrRHNtbzh3WDlJbGJJL2NPYkwxaGx1UkR1NjZQ?=
 =?gb2312?B?SFRINWt3Vno4VDNpdkpNY3o3MTVvTURjT3JSOUtyZEZwOXhONW9BNy95WXV1?=
 =?gb2312?B?MnJLL0k4b1krN09VREgyeEduZUVlUXFCTE81NEM5QUJ5cElONlhwTVV1L3pU?=
 =?gb2312?B?K09NMG5JNE9jYnpIZ2diQldSdG8xanViUXV2SVRMemhHaGtxLytyRmw5N3BQ?=
 =?gb2312?B?ZDUvbjhjYlp1MmJNMW0yc0lUUVB4aUJBRlJuSkZCUE11TFdzdnlnTmVkaFIv?=
 =?gb2312?B?azBXNklRUHo5Y1JPdEF0UkxPREUwcDRWTEltei9xRGhzUEhTZWI0T3RRS1c2?=
 =?gb2312?B?a1h6OXd3MFl6QjV5cmhCQWNDeGtnQ2REd21BQ0pmUjJpL3lmSDhHYTVPelUr?=
 =?gb2312?B?WFFQeDJsREJpUVd6T0doRUt3Y1hyZ3BZVHNuOVM5N2VxZXNUdldVcHh5cjZ6?=
 =?gb2312?B?WHJPaGdQNEJvWXBZSExvZzNRazVIcnkrcW83czdwOW0rNHdyb2tLZjVmcXUz?=
 =?gb2312?B?WFkzbEhxcHljRWxSVUZYWDF1MUU5a3RBb1NnMDlncDQ3cDJaOWcyK1BMNWJz?=
 =?gb2312?B?NENSQVhHdWN3dTE2VzcrOGpoVDdPcVU0V0RTY3FOQi83cGdXSzJJTktnVVQ0?=
 =?gb2312?B?MXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0985.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 24658081-ac15-4084-6054-08dcd31702fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 10:38:16.7235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nC8pZnnMgc+/AKmMn7Ga8tAq3EGNzuNc47Nd97ftdFjliGT5Q/JFaEmEwR9Q3tR0wKtD+/DPNyyNGkJ3fhkV4avHUvdXqozZqA9FtlU+/qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_033823_826636_F30DE361 
X-CRM114-Status: GOOD (  28.50  )
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

> > From: Daire McNamara <daire.mcnamara@microchip.com>
> >
> > On Microchip PolarFire SoC the PCIe Root Port can be behind one of
> > three general purpose Fabric Interface Controller (FIC) buses that
> > encapsulates an AXI-S bus. Depending on which FIC(s) the Root Port is
> > connected through to CPU space, and what address translation is done
> > by that FIC, the Root Port driver's inbound address translation may vary.
> >
> > For all current supported designs and all future expected designs,
> > inbound address translation done by a FIC on PolarFire SoC varies
> > depending on whether PolarFire SoC is operating in coherent DMA mode or
> noncoherent DMA mode.
> >
> > The setup of the outbound address translation tables in the Root Port
> > driver only needs to handle these two cases.
> >
> > Setup the inbound address translation tables to one of two address
> > translations, depending on whether the Root Port is being used with
> > coherent DMA or noncoherent DMA.
> >
> > Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe
> > controller
> > driver")
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../pci/controller/plda/pcie-microchip-host.c | 93
> > +++++++++++++++++++ drivers/pci/controller/plda/pcie-plda-host.c  | 17
> +++-
> >  drivers/pci/controller/plda/pcie-plda.h       |  6 +-
> >  drivers/pci/controller/plda/pcie-starfive.c   |  3 +
> >  4 files changed, 114 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c
> > b/drivers/pci/controller/plda/pcie-microchip-host.c
> > index fa4c85be21f0..e06251523560 100644
> > --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> > +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> > @@ -7,21 +7,27 @@
> >   * Author: Daire McNamara <daire.mcnamara@microchip.com>
> >   */
> >
> > +#include <linux/align.h>
> > +#include <linux/bits.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/irqchip/chained_irq.h>  #include <linux/irqdomain.h>
> > +#include <linux/log2.h>
> >  #include <linux/module.h>
> >  #include <linux/msi.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_pci.h>
> >  #include <linux/pci-ecam.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/wordpart.h>
> >
> >  #include "../../pci.h"
> >  #include "pcie-plda.h"
> >
> >  #define MC_OUTBOUND_TRANS_TBL_MASK		GENMASK(31, 0)
> > +#define MC_MAX_NUM_INBOUND_WINDOWS		8
> > +#define MPFS_NC_BOUNCE_ADDR			0x80000000
> >
> >  /* PCIe Bridge Phy and Controller Phy offsets */
> >  #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
> > @@ -614,6 +620,89 @@ static void mc_disable_interrupts(struct mc_pcie
> > *port)
> >  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);  }
> >
> > +static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr,
> > +				      u64 pcie_addr, u64 size)
> > +{
> > +	void __iomem *bridge_base_addr = port->axi_base_addr +
> > +					 MC_PCIE_BRIDGE_ADDR;
> > +	u32 table_offset = window_index * ATR_ENTRY_SIZE;
> > +	void __iomem *table_addr = bridge_base_addr + table_offset;
> > +	u32 atr_sz;
> > +	u32 val;
> > +
> > +	atr_sz = ilog2(size) - 1;
> > +
> > +	val = ALIGN_DOWN(lower_32_bits(pcie_addr), SZ_4K);
> > +	val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
> > +	val |= ATR_IMPL_ENABLE;
> > +
> > +	writel(val, table_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> > +
> > +	writel(upper_32_bits(pcie_addr), table_addr +
> > +ATR0_PCIE_WIN0_SRC_ADDR);
> > +
> > +	writel(lower_32_bits(axi_addr), table_addr +
> > ATR0_PCIE_WIN0_TRSL_ADDR_LSB);
> > +	writel(upper_32_bits(axi_addr), table_addr +
> > +ATR0_PCIE_WIN0_TRSL_ADDR_UDW);
> > +
> > +	writel(TRSL_ID_AXI4_MASTER_0, table_addr +
> > ATR0_PCIE_WIN0_TRSL_PARAM);
> > +}
> > +
> > +static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev,
> > +					struct mc_pcie *port)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *dn = dev->of_node;
> > +	struct of_range_parser parser;
> > +	struct of_range range;
> > +	int atr_index = 0;
> > +
> > +	/*
> > +	 * MPFS PCIe Root Port is 32-bit only, behind a Fabric Interface
> > +	 * Controller FPGA logic block which contains the AXI-S interface.
> > +	 *
> > +	 * From the point of view of the PCIe Root Port, there are only
> > +	 * two supported Root Port configurations:
> > +	 *
> > +	 * Configuration 1: for use with fully coherent designs; supports a
> > +	 * window from 0x0 (CPU space) to specified PCIe space.
> > +	 *
> > +	 * Configuration 2: for use with non-coherent designs; supports two
> > +	 * 1 GB wide windows to CPU space; one mapping CPU space 0 to PCIe
> > +	 * space 0x80000000 and mapping CPU space 0x40000000 to pcie
> > +	 * space 0xc0000000. This cfg needs two windows because of how
> > +	 * the MSI space is allocated in the AXI-S range on MPFS.
> > +	 *
> > +	 * The FIC interface outside the PCIe block *must* complete the inbound
> > +	 * address translation as per MCHP MPFS FPGA design guidelines.
> > +	 */
> > +	if (device_property_read_bool(dev, "dma-noncoherent")) {
> > +		/*
> > +		 * Always need same two tables in this case.  Need two tables
> > +		 * due to hardware interactions between address and size.
> > +		 */
> > +		mc_pcie_setup_inbound_atr(0, 0, MPFS_NC_BOUNCE_ADDR,
> SZ_1G);
> > +		mc_pcie_setup_inbound_atr(1, SZ_1G, MPFS_NC_BOUNCE_ADDR +
> > SZ_1G, SZ_1G);
> > +	} else {
> > +		/* Find any DMA ranges */
> > +		if (of_pci_dma_range_parser_init(&parser, dn)) {
> > +			/* No DMA range property - setup default */
> > +			mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
> > +			return 0;
> > +		}
> > +
> > +		for_each_of_range(&parser, &range) {
> > +			if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
> > +				dev_err(dev, "too many inbound ranges; %d available
> > tables\n",
> > +					MC_MAX_NUM_INBOUND_WINDOWS);
> > +				return -EINVAL;
> > +			}
> > +			mc_pcie_setup_inbound_atr(atr_index, 0, range.pci_addr,
> > range.size);
> > +			atr_index++;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
> >  			   struct plda_pcie_rp *port)
> >  {
> > @@ -656,6 +745,10 @@ static int mc_platform_init(struct
> > pci_config_window
> > *cfg)
> >  	if (ret)
> >  		return ret;
> >
> > +	ret = mc_pcie_setup_inbound_ranges(pdev, port);
> > +	if (ret)
> > +		return ret;
> > +
> >  	port->plda.event_ops = &mc_event_ops;
> >  	port->plda.event_irq_chip = &mc_event_irq_chip;
> >  	port->plda.events_bitmap = GENMASK(NUM_EVENTS - 1, 0); diff --git
> > a/drivers/pci/controller/plda/pcie-plda-host.c
> > b/drivers/pci/controller/plda/pcie-plda-host.c
> > index a18923d7cea6..2a3cc2544200 100644
> > --- a/drivers/pci/controller/plda/pcie-plda-host.c
> > +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> > @@ -8,11 +8,14 @@
> >   * Author: Daire McNamara <daire.mcnamara@microchip.com>
> >   */
> >
> > +#include <linux/align.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/irqchip/chained_irq.h>  #include <linux/irqdomain.h>
> > #include <linux/msi.h>  #include <linux/pci_regs.h>  #include
> > <linux/pci-ecam.h>
> > +#include <linux/wordpart.h>
> >
> >  #include "pcie-plda.h"
> >
> > @@ -509,8 +512,9 @@ void plda_pcie_setup_window(void __iomem
> > *bridge_base_addr, u32 index,
> >  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> >  	       ATR0_AXI4_SLV0_TRSL_PARAM);
> >
> > -	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> > -			    ATR_IMPL_ENABLE;
> > +	val = ALIGN_DOWN(lower_32_bits(axi_addr), SZ_4K);
> > +	val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
> > +	val |= ATR_IMPL_ENABLE;
> >  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> >  	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
> >
> > @@ -525,13 +529,20 @@ void plda_pcie_setup_window(void __iomem
> > *bridge_base_addr, u32 index,
> >  	val = upper_32_bits(pci_addr);
> >  	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> >  	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> > +}
> > +EXPORT_SYMBOL_GPL(plda_pcie_setup_window);
> > +
> > +void plda_pcie_setup_inbound_address_translation(struct plda_pcie_rp
> > +*port) {
> > +	void __iomem *bridge_base_addr = port->bridge_addr;
> > +	u32 val;
> >
> >  	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> >  	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
> >  	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> >  	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);  }
> > -EXPORT_SYMBOL_GPL(plda_pcie_setup_window);
> > +EXPORT_SYMBOL_GPL(plda_pcie_setup_inbound_address_translation);
> >
> >  int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> >  			   struct plda_pcie_rp *port)
> > diff --git a/drivers/pci/controller/plda/pcie-plda.h
> > b/drivers/pci/controller/plda/pcie-plda.h
> > index 0e7dc0d8e5ba..61ece26065ea 100644
> > --- a/drivers/pci/controller/plda/pcie-plda.h
> > +++ b/drivers/pci/controller/plda/pcie-plda.h
> > @@ -89,14 +89,15 @@
> >
> >  /* PCIe AXI slave table init defines */
> >  #define ATR0_AXI4_SLV0_SRCADDR_PARAM		0x800u
> > -#define  ATR_SIZE_SHIFT				1
> > -#define  ATR_IMPL_ENABLE			1
> > +#define  ATR_SIZE_MASK				GENMASK(6, 1)
> > +#define  ATR_IMPL_ENABLE			BIT(0)
> >  #define ATR0_AXI4_SLV0_SRC_ADDR			0x804u
> >  #define ATR0_AXI4_SLV0_TRSL_ADDR_LSB		0x808u
> >  #define ATR0_AXI4_SLV0_TRSL_ADDR_UDW		0x80cu
> >  #define ATR0_AXI4_SLV0_TRSL_PARAM		0x810u
> >  #define  PCIE_TX_RX_INTERFACE			0x00000000u
> >  #define  PCIE_CONFIG_INTERFACE			0x00000001u
> > +#define  TRSL_ID_AXI4_MASTER_0			0x00000004u
> >
> >  #define CONFIG_SPACE_ADDR_OFFSET		0x1000u
> >
> > @@ -204,6 +205,7 @@ int plda_init_interrupts(struct platform_device
> > *pdev, void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32
> index,
> >  			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> >  			    size_t size);
> > +void plda_pcie_setup_inbound_address_translation(struct plda_pcie_rp
> > +*port);
> >  int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> >  			   struct plda_pcie_rp *port);
> >  int plda_pcie_host_init(struct plda_pcie_rp *port, struct pci_ops
> > *ops, diff --git a/drivers/pci/controller/plda/pcie-starfive.c
> > b/drivers/pci/controller/plda/pcie-starfive.c
> > index c9933ecf6833..55e84bc79eca 100644
> > --- a/drivers/pci/controller/plda/pcie-starfive.c
> > +++ b/drivers/pci/controller/plda/pcie-starfive.c
> > @@ -355,6 +355,9 @@ static int starfive_pcie_host_init(struct
> > plda_pcie_rp
> > *plda)
> >  	 */
> >  	plda_pcie_set_pref_win_64bit(plda);
> >

JH7110 SoC has RTL configuration about the whole range of inbound address translation,
so please remove the function below, the setting in the below function will cover our
original RTL setting with wrong values.

> > +	/* Setup the inbound address translation */
> > +	plda_pcie_setup_inbound_address_translation(plda);
> > +
> >  	/*
> >  	 * Ensure that PERST has been asserted for at least 100 ms,
> >  	 * the sleep value is T_PVPERL from PCIe CEM spec r2.0 (Table 2-4)
> > --
> > 2.34.1
> >
> 
> Hi Daire
>   Could you please CC Kevin to this patch-set e-mail list? Thanks.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
