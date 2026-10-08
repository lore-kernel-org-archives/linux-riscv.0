Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFADDCA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6FZSzVFS5mFltUAwqy1SPAh+MqdGOg3VlzDwiPUreQ=; b=BRff7/79qAvp0v
	WKkqtAbbuPEy4MxwV7n8E8UmtWhMjIRH/hCK1WdCnTc7gIBQjNv5fuGKz2GpgQFdD1KU0Lvn9uWx0
	zOikzn71RV/efD3S/8ccChMOc8nV1Oa7T6F1N/yZfTrVbGexdH2o9u5fLPmFXfamyxefoJpv51Wzu
	9aIMSuorA5hS36el+1lmt/ycpsR/hiyGdbmNUD9DITqqWsxe7H7wf6zQRPJTWmwBKikCkYvYSXr+t
	iTBhg5MfVTptS/fUOHTKUR80S9ekLGx+tm2SiU0aPGxbzha1uewOiJQ9ZrlcSk6E0ujGSsgR29ytJ
	CJs64C6KoGul+cO4fOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnKK-00000004M43-1aAM;
	Thu, 08 Oct 2026 12:34:24 +0000
Received: from mail-bjschn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71c] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnKH-00000004Lwa-1yGe
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 12:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azf6sBSo6r2Z77NKxVKjb/BQxEk1BbEyj8y9v6bJB0oK5W71540jDNAuLkhEwOvY+x9z6Tp8gwK1ubuIotGWnHrbKyo4/RVhZzNVcDow60CR25v9bVze/fY7fDsN9xZuDlVUI0n/PMHZaHXwP0wFp1t5youo/V9N3hqeOlFXUyLqSW9IKHBuPn5ZVZp2Mds+esOQIrWVjI9XUsCL3/FTG7mWwSi3WCrHjCpokYclUXM4wCimhDVtvIwPCy0Ja78Qaji24rLMYQlFDkly/L6jccBg3juqBASHKi0aPoHBYc3cO+bc7XZ7V9G5y6Lnj8H40DACAoVMH12VKmV9Pvzk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctwYu//NWF9c+L4gnn+ugNwjZyRsf8K/CbyxauIZwgU=;
 b=Lhk3QkJKZU3JrZEJkLsax9VGwK9XVXRjBmVxnL75y8k/e52YfUTLL0Eepf1mMRGPPM2rnJdIHwjaJFnWpP7jq2s5K2cEf/tlAtExmTlWula8FVNOX7fD6/02lu8NytJX1KaNYpGTgpAr2iFaoPb3R1WroUDdpT2OWIB0LR0uNTRVupF3YUL3Hh3k+QxJogN6hNgflzGhMuaay5iWRllE5BNHB8EitFOgsw7TOfwllV4BLxqlaeYH7gdaZNo+BecWOPSxkMyFTiQTGecuVZvlbf6gLM5saIi10b4dt+jPLt+cr4t01pPO9UjnMBOATAxBKn96FuYzH3iDtI5bJFkTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:59 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 09/15] clk: starfive: Expand the storage of clock parent index
Date: Thu,  8 Oct 2026 05:33:32 -0700
Message-Id: <20261008123338.11081-10-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd0f663-7d13-4765-6feb-08df25386d23
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: nrg7JFap/5WpS4/0Q4OVPI+gAIbK5/GgJ4kvXUvyOgI3AROVxFV7pirL+GUY2wqJUrBhGePQnTShtwj/2Bzwmr05iNTVwZLQBjjhWownv6xenRn/FnSvVZHTaIzy9tFZft/DNSqhOoAfn6YdFzHLnxJJsh03UFE/lqrr4xIZs02ubYYSdtSqsmy6XmunhmhL7/aFxhYl8R3evob5iue+iDOwxDu/39UJZ/lrzAfY6YvrRsWFUkqGWQK9JZCSj/1ww7vT0Wwxrz3qE+Exhw+A/rstacMGk/SiwrhGR28wTWUbKWeZsndIxYWP0RJ3yJJvpw4Dg1j+yBabYYalplY7vpOFuvtR4k0dUggH2oo3qtX4vUzgrUwqkLMzEIowslhwjZbUsRb8BpBvMkU/Kl95Pjqjsh7iRwiVoU7VHvVdT0cpZ9KV4019xBZAlRQ4/4TDWG6Li3Q3438AvDEty0+EydWGRrpMGBZ7zKMSo6TdmoBnJp+B9Sk83v7HGpeb9buRIP+30c4n3QvGtfOA2v5O1/514/HP630VdBjAfKy80BXN6DJHgO0RwxXeJCkcqfpT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6xARV/tMfraYsls7SI9LPzblkp/wg7O8ELJujNOY9otyD4ZW/mm2KIHIOvd3?=
 =?us-ascii?Q?r0TOrrpWFyzOSfLDrFnleerMrifXkXXMYZJGsXZ2twa2AyL3xB3FrtiTrjuT?=
 =?us-ascii?Q?tB21W7labAnd8tQf4B5Fu19sxM2pzpCFU/YwZFevFNUjbgQvQ/UDkkOqyhst?=
 =?us-ascii?Q?CcY0CjabovDgTDprxjv3MahlmsRZ7tFivVKVsflK6q0wab1Cn/jzncXohkpr?=
 =?us-ascii?Q?NdsA/IeevUP5lwcKHfXCPVOItHyyvgx6BNiKedLL74bnLkNLXxj3tHPp56S0?=
 =?us-ascii?Q?t38w2P7KRU/w5TOgMtb3J41JS1I44zoTijnL8VYzaFjdp3RB80M/yJCpC1JH?=
 =?us-ascii?Q?RbUWZSYIz9zrqhcyZFGEhNxwuYc6IpxaeTv+ODt5a1ydo3uNdwpg+qPj8UZX?=
 =?us-ascii?Q?5Vb2qykyABjeY4lw8gFtcEnWneylGIiMS0upVZ7/cWz3quIcK9VUjUUcu21e?=
 =?us-ascii?Q?uwqndhrNTOsSz7LHkbBh1p8bJbYw1nHE2LJkKO5lP5RZlJsWtu/UuW8/dct2?=
 =?us-ascii?Q?OMmNzfTv1o46kWwjR013vXpiFaePMOvPH6FNYfgfT6DXcau8Iu/0uMBB1evu?=
 =?us-ascii?Q?FTVVMIDtAGe9pKNpMw28WbJeF/v9aHsHhW/SpGvYLudOzDezQV9ziygsVsUE?=
 =?us-ascii?Q?a5rdbodZzMCeFGlEJiMD6ujbZ+fvrBF6ucSx5V0sq+v9W950UsPxmiCg8EQA?=
 =?us-ascii?Q?jVTnp8iDEmIEVgH9TzKdossK9Q4U9tx9hSVcUL6/568SiNscaMLSDR0Z9tNL?=
 =?us-ascii?Q?Btd3hO4au2dFPYKq+jr5PqORsydj4xXtDY+JivUpYpnBWPxyCIY4lA/tLaE1?=
 =?us-ascii?Q?Uq1NzL5MZBCohhupMvdIkvW+wAlMFu0ujkgLpGKQKn9fq0VNKDbSeDUQ2WhZ?=
 =?us-ascii?Q?wNaUd/o6ZpCdJpbKY1G7NxSG5xOs5EQ03QBfNKDKRoaXXUiZDToCq2aXsIpp?=
 =?us-ascii?Q?WG79DXcTxDTQeGUXquN6FdV/ysbY0x2GtwWWJJRvdPJw7nMnXMwZQHbRxnMS?=
 =?us-ascii?Q?k9b3q0ZNZMdFGCJQqLSsGE/bP0ohlb0jZ67wqeDENdHc/qq8QN3TLUNeb+bY?=
 =?us-ascii?Q?UL+cQqzELwZSWs4IDwPpg7OeTFXoL6pbyAKlNeFechP7DArVSwETru7RzP5e?=
 =?us-ascii?Q?03g8Nm2N9ohDtj+XAnNbBP07APhJpxdJOeYtApuMKo268NTkzQ6FhxHuKPde?=
 =?us-ascii?Q?EcLFZQ99/+htG/T2wKUBUToTdPyDf9kdDwPeE90b3yXKZH8Qe9gVxTKGNnhe?=
 =?us-ascii?Q?dzHEF63jHT7X72598eY4KDFPo5Hqpk5L1jfzIvM1afZjV2KHNC6LlpV/eYtI?=
 =?us-ascii?Q?XH4RGVIUe9LAMb0cMFqj1K8EZORpUF2jPDTiGBpxU/N8BffF33ot2oCSEU9y?=
 =?us-ascii?Q?exc17Pqgml/eIjn18gLT3UFagQ+KyzQN3Lq0HHwKxzlenfUBCHT7fl2/NDYH?=
 =?us-ascii?Q?Cy9jeCq1AtpNFBdkc3ITflDqKzd7mMUtW/Ma6ka3kFrHn3o7xng0httazWms?=
 =?us-ascii?Q?sELZEtwnXI+igYjC1ZewnuWNYNEqJToTeHuiTnTmeXeODJc0871iUeqvJuP5?=
 =?us-ascii?Q?T6JEK2qfy95GZudNTTe5HhKK6hW1hwJ63PVBGmTGxmGZq268v41AE6V8DH5f?=
 =?us-ascii?Q?uPMPkZX/URKO6v7m4MkSBUWIYLfEj7Qo3g51Q7txnUlBGPY5lHhiiUMqYksx?=
 =?us-ascii?Q?p/ppC+WczJWLaW+daAz13a7wulrUj2yyjH+LComgALgS9F8m7A4ej75ch9dP?=
 =?us-ascii?Q?sCgqVFC+pRojsVQ5hNuJqlwzOtsAsfsRRb9a+nEfuGvquztv0VUP?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd0f663-7d13-4765-6feb-08df25386d23
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:59.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryrmLfpjEYdIGiYB6Oau9P3axP1PBFEe/j2WS2skLklsL3pku755OiqY1QKPcf1ioojoKpL/DjdpCd5Yyn7C/MYEaZIONMySKkgG0GT8OKZJ7lcNRpzQjpd0RTDeGGbv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_053421_542096_527D33F3 
X-CRM114-Status: UNSURE (   8.94  )
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

Expand the storage of clock parent index for per0 domain, which parent
index over 255. So change u8 to u16.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 4cb3c2ef9525..198f6d005415 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -27,7 +27,7 @@ struct jh71x0_clk_data {
 	const char *name;
 	unsigned long flags;
 	u32 max;
-	u8 parents[4];
+	u16 parents[4];
 };
 
 #define JH71X0_GATE(_idx, _name, _flags, _parent)				\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
