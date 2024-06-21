Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61230C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wAuUk20J+kwAFsr9OBjq2b/JFerJ8LOIxCcUiUFwBj4=; b=k0YoljPHMyFlBV
	UHLmSYLiUBbfZ6VczxgzAAKnJTlhMsIS2sQvxMF+QCPqpk+a0B+Yxf9+VqDbinKOG9ZS3E+TNvQfg
	yvM5ya2oYxCcEm1dm+q2eKN+Wd44NQATQqb9QxhNNjXa6fGbyxQiiDyD+O+sEGKTjNS9asZKfCngp
	pRe3ruVgXu4MK5iSR0AiyU7HSsC7QmJBmnueWRcCTwjdD+Z4q2okm9pHx/V5SO+CddgLW0rCeTlQB
	Xrn+zlZFnmla1d3caA5kqLwHQrmtdsNcD8ZApNzHxp4nQqxl316kNbE0IIH67fznfmw3Zi8amhLsT
	hrzSrgjPl5NFkBTkvuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZY0-00000008K5I-2BsJ;
	Fri, 21 Jun 2024 08:23:04 +0000
Received: from mail-sh0chn02on20728.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::728] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZXw-00000008K26-2G7o
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGjTScVJI4iEnz0iNF/L1oT2TK0lwArFWT0Fe/ZQw18QUTQiMrtoLYB9SodkllPu83xp6XicC/O3gTwJ7b0Cf9piLL7WDB3vKdxhf01R6sXplFs/PA4jHFlvNKxGvGbyEDjBLQWop5cQZ+QC6EdmZjSjboBXgaxu5F7LhjXMylui2cXVm6SWwRGO/Y0W/RciPB0jK+mg4NgVBCY2v8CY1x2pYzKyY3pUi+DD7885/WgFNcjmAgLBt7YvOo5HdZasfzlnwjwDbDAy2ZCwnF/jncnqY4e7VedRoLfaVIBrrb8CTs2nZ2xhWnNoGNCJuxELu21LTnpQbjb1/rBcdmI8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEj7Emiyz5dvsIIrBiVW+/4imeofSTztYvolrRg71Io=;
 b=I6hMhLW5E+5PLAe8Zj1gjH/i1Prz+MdzHKRgJ98+9EwXpnmWPrYx/tHKHCz5fonNDJjwVgILL1bL4ZR578c21lesOQuYYdrVGSa95mCQXgBy7Ra81XcGSjXjsWFW6Pi2plPEPMGXpRYDFPDeZ4BzVAz07ZvF958tz+o/1pmztkw+uYQjLVyHpqL6FVOdQ6+0e9R9SlDOIO8TBgauZqDa1doaNxc6JUfYKf0JlRNbGh4LJJg29PIce9lr2LSvW0WOoB4sUdn0/J0zCxpuqIo528AG2VCwHz82ucKd0mGm7nRuenTrHwRHvsUnTiNsknZZmGrvX3s8elt/2cEOuGupTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0751.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:24::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33; Fri, 21 Jun
 2024 08:22:42 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7656.033; Fri, 21 Jun 2024 08:22:42 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 0/1] Add PCIe dts configuration for JH7110
Date: Fri, 21 Jun 2024 16:22:30 +0800
Message-Id: <20240621082231.92896-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae306b7-5db4-4648-e4bc-08dc91cb5202
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|52116011|7416011|41320700010|366013|38350700011;
X-Microsoft-Antispam-Message-Info: NF64Cte/iVl/jy+9/S0pafs935geiwWiVXZvexufuV1GTV2BBSTr5YH99V+/lkLwWVlE2J84h2Oz7Si6lt7AsdsXskOKoD9qWJVMarTl/aiCO6dxWGr5WGbKeXdBVbw4vNHmxSJIx376kutY9556puO5UDwOICkoDI3nuYiC4nykkucEGhynbFjBQdNjBAFr/eUvn8qYwDnrbmaV2+aBpdmSEXv+6OJXZE/4CqILcDNya3KH0ZwYQenuceB1NPUGX4NSrCbS51O4A42ymveRCdmDQt6l0/1G5V3QaZbZ8O96bP7iJm5Utb2O02qquSAHyCi1nzwzt59KtaGE21p8btUWeIZYSb1XyZtdWk/EHVhp65UtUaDTTUmy0HwwvgDAYbRQSYuLIO99Y+HQ8DsGcpiypxw5uEy66Q2oUhPyfhR1gvA1K4lrioOS0HvCTZAOYvP/vj/rYPgX6cyiWoUQgFAHD6EPvvdCIGQUpqqGXskHqioRLPs3PMddQAxuNvKbMQ0Y94ZrYLfkfnk95MT614Fwjk0q5VX5K/o7m9rIYjTNR/x2dMgf2C0oFeIXjD+P4nic1HYeg7eys/W9jlVd8k6f8XMRmrHWIzHpuQFHfbXXphBvd8ZNagWY3Rap4w/I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(52116011)(7416011)(41320700010)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?amKZeAqG/b1HjkjDmk9rBp0kGciDs9+LlQXWv5CsJUIMTwdM6I85RE0W5Gu2?=
 =?us-ascii?Q?PoEeJReM0nX6qsNwwSIC/wS4sJMskiZ1Lrsj+mSlhwjdfaGDR8uwHs4HIVz6?=
 =?us-ascii?Q?e4VCin6IPObz1jLSJurPgFE9msQQBZLn2iKiBUfH7Da/812fqUIKiUNpsFSP?=
 =?us-ascii?Q?vKZGI/YcdQ3Jxj6Pn/N4a8FZLX7H9VpZlC9PBWdEsDiE4v/s7+CclXS02oHi?=
 =?us-ascii?Q?vrlAYKf6/cqSv5kTKFD6h/Cy1/ARQMDc9xoGVOKI+GLY0dXeR2fWUGJIA+rR?=
 =?us-ascii?Q?szqkKqwoBsUoBqmcdqpS/HcKwX9LLq308noJg3b4x0Hpm3Bs7a+DCdq00TZX?=
 =?us-ascii?Q?CVwttStosRdp/bi5zgqD8B3NRR0Tyl+pq/UoFgBBa0awANPKvL7s57fC5NE3?=
 =?us-ascii?Q?b4rCPIJn+W9SvGilTgN6HHkc4nzb3ivYJvwTd1wy3G1XGjsw0UdP494X9Cel?=
 =?us-ascii?Q?6Ct91Mm2Fi0BWkQixkp8l1/Cwi54cNnHPvVz48AN20Zhl520zlp2A5hRutkc?=
 =?us-ascii?Q?wf2ePqipLmTkj9Zxcbnqd5TZHWF3VchbCZYUkPJqe1gt96rJWX6mM0mxcta3?=
 =?us-ascii?Q?iDsZXmjZ0y6u3eRyb8FYxj2+cqgqe433ZRrwknX0Rwi4BEXbDYLCl0nCN6eS?=
 =?us-ascii?Q?TZBMMStR1Ged9uNB/RPbip7GLhu9WdsP2xJoIA+GhT6bIAG7+dpKhNqx6sZ9?=
 =?us-ascii?Q?VoxCcFxkl5hd0C2K+LzHZxgJgVVenXeu2XfXuURdkvY+dOEljRgg6nep1yo0?=
 =?us-ascii?Q?OvZ7YvBYobVU/nw4njX2Lu7W5YzZ3//HFQ6ENty2McvBMJ/aiGFKP07olxAs?=
 =?us-ascii?Q?yeMN0urUn8ZLGdsGiDTplhF/KjpdMIBqxjVBux+VTNN40IoRjxTKfX9IR9yF?=
 =?us-ascii?Q?uDKE3Q/q8JB4T6YMLeatIe/2AE+BT3oCWiSpoMy3zyRki0HP5uKDbe01PL4M?=
 =?us-ascii?Q?fxP3wIqtpdSwuUnJqSM07P4ShqgwX2btFM2JcFAFwqFu22qkYoPxdQEt3abK?=
 =?us-ascii?Q?Etp4l6WyaPF7ta2LRLLe6ndPr2VVlYx7y1TsJCqoCBKaTD55n0Aaz/bhkubV?=
 =?us-ascii?Q?bHug6X89nd2v1MKeayauANtpxIOwE7dyX2nHL2GluvSiM/OOmyBhIv6qPVFA?=
 =?us-ascii?Q?EygLkcfZSoQGQyvj29rL4+ZTxDlgVU4B0AeTAeXoayac0xH/yi7/upzyK7z0?=
 =?us-ascii?Q?xX2A1YGgBTaiXT9vf618SWwEu0rPvbvLsYeF+L1Ciwu5MoRbRMnKtytLH9lo?=
 =?us-ascii?Q?c2XxiFEuHGH7r00bn18LdiXiLzfWDdKFKDNVV4dd+uuAlASqgxUZon/nurtG?=
 =?us-ascii?Q?Rvntz7ZWeGmfscnpLoyrNt7YOd45u/Dtfmigzqglv95LiG7XBOd+nbJOqBIP?=
 =?us-ascii?Q?xPEvC6J6wzuiZ80nFHaj3Dj5oJseHB5mivFaGtw1JG/lMD6WoY3Ti87dNQaI?=
 =?us-ascii?Q?/t+V8TSyhkfI4R1mYksry0La4UJauFiBMfuEg7/BAFl4wRzOxe/5RHT+cQbu?=
 =?us-ascii?Q?w4Vr5m0oqsX61uynaIAOMrnRZ5CMt5MUYlARx0OskZ+gYwLDM1W4ley1SzKi?=
 =?us-ascii?Q?HaoZjPbguoZcqbqkxTYjEbZlBDbM+JwLec7oa5UsWX8PK2shT5VtR7u1FiOT?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae306b7-5db4-4648-e4bc-08dc91cb5202
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 08:22:42.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFHKM7r3l9gMxW1w05o7VxI0Tg2uOvto2jnRZLotldoTkD3u9UwYCRUz448h7YYUrBeXFV2GRt40F1W614d40FqN9O3q7varKSMUfa+vZnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_012300_606764_ABEE1E92 
X-CRM114-Status: UNSURE (   5.10  )
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

changed:
    v2: default disable pcie dts node. enable it board config
        (milkv mars and visionfive 2).

base on v6.10-rc3.

Minda Chen (1):
  riscv: dts: starfive: add PCIe dts configuration for JH7110

 .../boot/dts/starfive/jh7110-common.dtsi      | 62 +++++++++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   |  7 ++
 .../jh7110-starfive-visionfive-2.dtsi         |  8 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
 4 files changed, 163 insertions(+)


base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
