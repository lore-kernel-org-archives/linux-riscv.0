Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E8C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50lij7XhUsNScE9488rculuCvAZdAO4OKvqeVKTrV5Y=; b=1ul32nhrKWZqdQ
	0TNndCO/1aFa+EwH689EFxDQNln2NZXhUf1F+NqXKUB+RFyJ7QFEXm5uWqcH/xyB53VdeuAt227N+
	0I1iqQivFSY/+RV1eG0pbQ4AMBn4Vu4tI2Fe1XYR4TjAN95yDHxL6tB+jW56qfgXeNUTgBs8zEBoo
	nV71a15SGN8vzpdGsu5XksRBC5rAHyvxmkpKmm9AQFXke13sNh8Kj0fJYYxQqAqIBEOCQ3SFXyytr
	NF1Kn56qUS8JPew3HYqPCRBsrXemrS3dzoQT62QS62ajwwLsxpF5XtoRaGNEp7WEMv29QRx7T1cgM
	N8g+pQRbIQNmnJl5x5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9b8Q-00000001gEE-0Tz6;
	Wed, 22 May 2024 01:51:18 +0000
Received: from mail-sh0chn02on20717.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::717] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9b8L-00000001gDA-1WYB
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:51:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILXuluOBL1WAGeMJdokhAx1tuixve9VSdWUQLVquwZZae0COvnfDnsjrLsXEhoAyRVs7egjJiMm3wq8d1SYCUJNfIY0N3XCigARg7xXZQXl3N7jzacmAgGvTvdiXgZNku/4tW4RmbApa5nd/p0+YE9DLYzoDoOREKofExGJlVpr44VFgup+h3p6ZOQOjJJiVbjUx/whK6YASeuVWLCm//dngP6rW4dYKcsXRM+vChSiO0N6+eCTX8HXfOCDHKKWPVpLzinvCSi7JuU9zfkdZxx1Fs/52UG28+KkjMGIRIX5dJDmgwGHJax6ZZdWW1nE7VSKvYq9egjqdiDM1sgnmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4yoTHtbsPHnMLh+Cb5EiK9S4L+2OX7IWth7jFWKZh4=;
 b=EnZQCe8+sogd7UzXAqQimThRRf8xdkUfso/dpF2Omn+TeGkuN9CtqeS2Tl4bgiUZ6BQUQU4TJxv2o7UxKgImZQtDAavEpCLyGWBoYAzCZHZzB1VDJueHglLus7Ir44QE9BkEBS9pj+eScZxm2GLFDKjcHgUxs3P4+ZuWTdxF0XS1U5rwmd5/FYOx2bi1d5XI+BTDhuUUZvIjjKDuurOFmSu6xzsX7VfPLEiIaEnm1DmOusR5SqN3Ey5esPh7zXbn2NnkxhIH49OFPYIKoKrc4ORjJEfMYy5efUr4stkpE/mkT830X5H+mj5vp7yQIbB33UCZd2DpYrW4Nxb0xspIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0830.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 22 May
 2024 01:50:58 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7587.035; Wed, 22 May 2024 01:50:58 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley
	<conor@kernel.org>, =?gb2312?B?S3J6eXN6dG9mIFdpbGN6eai9c2tp?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Kevin Xie
	<kevin.xie@starfivetech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYxNiAwOC8yMl0gUENJOiBtaWNyb2NoaXA6IENoYW5n?=
 =?gb2312?B?ZSB0aGUgYXJndW1lbnQgb2YgcGxkYV9wY2llX3NldHVwX2lvbWVtcygp?=
Thread-Topic: [PATCH v16 08/22] PCI: microchip: Change the argument of
 plda_pcie_setup_iomems()
Thread-Index: AQHagPDzrxFwM5ned0uU5e4g9ZRYQ7GimIiAgAAs70A=
Date: Wed, 22 May 2024 01:50:57 +0000
Message-ID: <SHXPR01MB086351396027D8A443BB6068E6EB2@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20240328091835.14797-9-minda.chen@starfivetech.com>
 <20240521222121.GA51329@bhelgaas>
In-Reply-To: <20240521222121.GA51329@bhelgaas>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0830:EE_
x-ms-office365-filtering-correlation-id: d7625557-c0c8-4ee4-24d8-08dc7a01a021
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjSItgXDQoOttq+iEjows3gNg79A7LofiMuZfH8WGsT3ERkiroz9z259iUUu+raXgLZ0alY4yXKYP8dv6DdhPFZ8dCGeLkXqvTBJns0R7Y8LKHMKiEBRyc8mRdwa7EgkY1Fi1zw0f7ZT4yD/B8uJFs9wPNqhfYN4BMXu3HzDuhRTnY7Zf2NKKndQTe35QIFaYloOAFzhzMKwUKUHcmT1TEANrXEbtQD5owXzyx1hLihBg3TInFkOhZYS84I/LR9SGFjpbwZlE7RaufvjfaVhxbaePq4KE+2E1TIesQIMgFdLDfVLEqBVnu9sy/9H+VFjeOF214+8q/baqxzCUEZmyaeEhD68gsB6C1Vbe6Jxr0vjPXpAgDCeAZTgy8IzpPCT665/Sa2Y5Lxf5J8IqrWXFXs8rw/jLkRxiQWJvQJFOSe+JzBLil968meU3mKqyLQ2X1Ff7mTB+fkPDfmKWgVZkz3PmWlOXHtxyWwPFsQBfCu+cFV5yMOGq1NJW6AVdQQLKoLjMYLh90Q5oB500Xp6nDCGgbhn5nKZ2IZR8UG03JIrpJnQ9CNDnx1LvozgbCFKbRr+joEAdOh+UA8OO9QlbIyIekDRnBlUGQSR7oFLU9ycFzyF7BEIegsvwgp1HwSt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?akRRYnB2UllvVnZOWERpVDJielRjK1doQTJRS05qTHQzTzZMVktSZk1nUVRx?=
 =?gb2312?B?NWxvbTVUdlJxQ3I5WERIQVdNRmNzd1JTNzI5czdrRHlFalprRDJzQkIwZzRH?=
 =?gb2312?B?SFpIalBLRHhkZnl3cXhrd1lpVlJJRjNnbytOc1lUaFdLdTJOZ0N5bzFVcmV3?=
 =?gb2312?B?bTNySzBLSHduOWpXWldXNzVia2s5M3VsMWJTVmxOSnY0OXlGYkNhaFF0czFJ?=
 =?gb2312?B?N29aWnZhZm1QdFdpV0NwRXRSZ2hoMDA2VC9ldHJGOXJkcmhXVkpJNFhCbzBq?=
 =?gb2312?B?TkowTkpScDVoWlYwL2VaRTJCeE5JL1hLTllIZ0dEZjdiRGozQWk4M3lCWHNl?=
 =?gb2312?B?ZDJKTmZWbTZqTkVhemNkMlZYVUdPd3FQMzFtQnB6L3RuZVR3SGh4VkpsNE1h?=
 =?gb2312?B?ODFKUzZRRGpOUkt5S3RjeXAvWGhPVmZwbUJySHVIOVVubjkwTnArQVdqcFRR?=
 =?gb2312?B?NHA5VUpldmp5ZU5NdWVycE44UktUU3NxSklRWHZ2bVdwRy9Ecjg4NStTMHJO?=
 =?gb2312?B?SDhrR3UrL2hxdGZBK0FXeDN3c2gxSzMxNWFTMEJLRW9BQVREWTdXTC9kUnd3?=
 =?gb2312?B?OFN1aTMzUXpMZk8zVGRDYVU0OERiNFRhQ0JMc3NrUmdsTmliRW1zQUdJaWh5?=
 =?gb2312?B?SVNDSVpRUXZtaFhCaVNQNENEQWtNNm8waEc0YXJXTk04UEI1eFlHWWJOMXpE?=
 =?gb2312?B?RGwwcGVLOXZIcTFyRDV5a0RKdUl6eUluT3l5WEtxYjM2VmRpaDlJcnVCSUhz?=
 =?gb2312?B?UFhpdFJkSTlWVCswdzNKcXZUZGVLQ3BxUkttQmlFVDF4M2pabjdkakQrMjhX?=
 =?gb2312?B?L1JyM0w1QldoQkxxdDFUNmNGQjdwQWdockpvRXJBYzBuSnZqQk9odWF3bThx?=
 =?gb2312?B?aEwxZzlxTlE1ckVsSHRnT0xGT2VGTW5ucHAvcnV6SHNUSlFTUHpoOXc0azRD?=
 =?gb2312?B?SVRia2tJakZ2RWlScWd5UStabVJiY2tTa3pTSGNrMFNHbEQ0Uit6S09wT3I1?=
 =?gb2312?B?clZzRkJyY2xzVUtZMEx5NzNsTUpDY1YwNmtKKzVMREpGa2hCRVJxMzBSY2J2?=
 =?gb2312?B?WktjcXJnZDJEay9YcUY1UEs2SHQzbzh2cWROby9vR1d5K3dkd211amZJclZr?=
 =?gb2312?B?d0todHpjKzY5NDlsNmt0U2ZtTG5TeFNEQlNJeStPNGptaWZ2Q2M0M3UzNnhz?=
 =?gb2312?B?UkFmWFBFdTFrc3V6amZQbERhYjBwSXJVVVVyVndIYmxuU1RWQjNZZDRWcXhV?=
 =?gb2312?B?T3JRYkNFTE5LejJaVXRCNnRDdEFNNGduTDc2MmZScnlPMHhRU2tCMXNMV2Qr?=
 =?gb2312?B?eDdkU1lhZ0YvYXAvck1OeWlPYTJid21vZlh2RmdxalFBSVBtWldmN1JFNGpS?=
 =?gb2312?B?OGpzcnFyeC8wVVJ1T3NLNVNqNmMrVUpvYWx0T09oMFIzRnQ0dURpZ09pY0FJ?=
 =?gb2312?B?N3JuL01aYlNpeVNJeGNQOEs0SElqUmM4TmdpbHY1Y1I0N3k0YlRVT1g3MzB3?=
 =?gb2312?B?ZDErc1V1Z0pWRXczeFpSUy91NUJzSGV0a0FVcHc3OUVRcWlXbFV3NS9tOGxI?=
 =?gb2312?B?TWViNjBmd3Z2R21tcTdIWkc0NGtPTml1aCtIQWFKT1lmRzZFQnVxVE1Gandt?=
 =?gb2312?B?UktIYUJPaXhocWU3VGxMMm9zd3pHdmJMbDV0bEJrMnEvTWx1cjdUV1pUQlQ5?=
 =?gb2312?B?S1dRemJWaGxsT3ZKbGlJbmJxYS84UE1UOVR0UlRJK3FFOWZuTWxEM1Yyd2xE?=
 =?gb2312?B?WG1VK2hlTVo1RWhCRkhVMm1IZlMzYzBsaTcyR1ZiajBuVng2UUFVVzd3MDY1?=
 =?gb2312?B?L3c2bHBzMHEzTDJMSkw0NHNOTXBjcytVeTZDdUpQaGRQTWNubndiT0FUK0Vv?=
 =?gb2312?B?ZGVJd01oNS9zc29JYmxleGFnT0psd2doTmZoRDYxamdCcHU5SHkrZFhYbWta?=
 =?gb2312?B?b25YaTIyNWhqVzNnMFRGMEIwemN4cmRNR2piNk9VNzU1Nk1KYUxzWCtYYnh4?=
 =?gb2312?B?QjduRlZ4ZEhEK0NFS1h2Rlh5VVZyZk9xSFU1djhuSyt3SWxjVXhMclVsTmtN?=
 =?gb2312?B?U3I1WFFCSE5GSjY4ektKK1pRMGpFcENKWncvL2N0QWxKUm1UVmhraUVQVXJN?=
 =?gb2312?B?RHgxbkROVjdKVDlOSVFQbnRCQkZDVnVSZ0lZditlLyt5cFdUcHlCQ1dDVEV0?=
 =?gb2312?B?MWc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d7625557-c0c8-4ee4-24d8-08dc7a01a021
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 01:50:57.9362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xjs1hc/OVRcF6vNNAHD9WA4HkMqkzQhJXS64OtBzUS3gQxByz06vQk6dlIupmXhlK2lBml4k33/aZ8qkIH+2sxo96Go2sRotsMZkV/ARUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_185113_538416_2A16F6E2 
X-CRM114-Status: GOOD (  29.76  )
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
> The patch is OK, but the subject line is not very informative.  It should be useful
> all by itself even without the commit log.  "Change the argument of X" doesn't
> say anything about why we would want to do that.
> 
> On Thu, Mar 28, 2024 at 05:18:21PM +0800, Minda Chen wrote:
> > If other vendor do not select PCI_HOST_COMMON, the driver data is not
> > struct pci_host_bridge.
> 
> Also, I don't think this is the real problem.  Your PCIE_MICROCHIP_HOST
> Kconfig selects PCI_HOST_COMMON, and the driver calls
> pci_host_common_probe(), so the driver wouldn't even build without
> PCI_HOST_COMMON.
> 
> This patch is already applied and ready to go, but if you can tell us what's really
> going on here, I'd like to update the commit log.
> 
It is modified for Starfive code. Starfive JH7110 PCIe do not select
PCI_HOST_COMMON
plda_pcie_setup_iomems() will be changed to common plda code.

I think I can modify the title and commit log like this.

Title: 
PCI: microchip: Get struct pci_host_bridge pointer from platform code

Since plda_pcie_setup_iomems() will be a common PLDA core driver function, but the 
argument0 is a struct platform_device pointer. plda_pcie_setup_iomems() actually
using struct pci_host_bridge pointer other than platform_device pointer. Further
more if a new PLDA core PCIe driver do not select PCI_HOST_COMMON, the platform
driver data is not struct pci_host_bridge pointer. So get struct pci_host_bridge pointer
from platform code function mc_platform_init() and make it to be an argument of 
plda_pcie_setup_iomems().


> > Move calling platform_get_drvdata() to mc_platform_init().
> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/pci/controller/plda/pcie-microchip-host.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c
> > b/drivers/pci/controller/plda/pcie-microchip-host.c
> > index 9b367927cd32..805870aed61d 100644
> > --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> > +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> > @@ -876,11 +876,10 @@ static void plda_pcie_setup_window(void __iomem
> *bridge_base_addr, u32 index,
> >  	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);  }
> >
> > -static int plda_pcie_setup_iomems(struct platform_device *pdev,
> > +static int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> >  				  struct plda_pcie_rp *port)
> >  {
> >  	void __iomem *bridge_base_addr = port->bridge_addr;
> > -	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> >  	struct resource_entry *entry;
> >  	u64 pci_addr;
> >  	u32 index = 1;
> > @@ -1018,6 +1017,7 @@ static int mc_platform_init(struct
> > pci_config_window *cfg)  {
> >  	struct device *dev = cfg->parent;
> >  	struct platform_device *pdev = to_platform_device(dev);
> > +	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> >  	void __iomem *bridge_base_addr =
> >  		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> >  	int ret;
> > @@ -1031,7 +1031,7 @@ static int mc_platform_init(struct
> pci_config_window *cfg)
> >  	mc_pcie_enable_msi(port, cfg->win);
> >
> >  	/* Configure non-config space outbound ranges */
> > -	ret = plda_pcie_setup_iomems(pdev, &port->plda);
> > +	ret = plda_pcie_setup_iomems(bridge, &port->plda);
> >  	if (ret)
> >  		return ret;
> >
> > --
> > 2.17.1
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
