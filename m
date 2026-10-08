Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EA7CA600E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNldc5x56hayYBkAvWjxXRhxgQE/+QUWxl7+24GUYOo=; b=toR2r/BWJtjC9x
	29MgNW1D31YyZ3WeG4L6NYwiyLuOKkpYOkh8tOM32I6Fp9D7UHOE13cuVfFopqXYOiKtoN5VVpybN
	CS/sK6H/apZXAPOYoJ98ZaMyPVkIArve2NDT38dtpAOkeSDN8xicobZEDljzK6qXcCGwNqV2IaQvW
	KY0cXCsjxQQ7jcBWXLl5XHv+8PG/kVwf1Uz2BQjI7MRIUvxgdLCxFTWu9+Hb6OH2NZv1Q2D8WdXTn
	qa7j07aAIr+fRmH7scOiBmhl6SCxJI1/WFFgkS6ZsxykqMpgMBpR2n7M7hzKAmYrhxLvHKriGCygv
	fMAouPbcKws2JApBYEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkBW-00000003yPB-3RRT;
	Thu, 08 Oct 2026 09:13:06 +0000
Received: from mail-sh0chn02on2109.outbound.protection.partner.outlook.cn ([139.219.146.109] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkBT-00000003yNF-2tmw
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 09:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNGsVcMpzQ6eSfAt7Wxu/4/PH20xcD/3ebC54G9GT04hV64m/IMm0v6D9x0/MSsdLaRrNIyOepA+ZXzFLiE2W+nh0h4vsQo3iOGXTNUxIbxO/zwjftEw3ct8XkPEgtSKdT4kGJDxJtkZnJ/zmhpSFZsIqFxbNQN8XF0sXn/Nnkwo2jXg05mDZGIGMgvonZPOEqx9bh0V4YT05h37pr+1yeMevciJEezqWl7u8jo9SFqxCzu95p4P+F8KeERpy4bgvhlIlZxNuWozw3FkRvNBPejsaj5BCwVu/wao3cEwM7AjlonLlsz/loL8gE4M4j/676aSQtKkFCEiCQ0wGdz1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzjnaYVEQ1K35KHsJmr6Gt8XzZz+jCtDwEef7wnhxLE=;
 b=FqNwBbtka7mfPd+jmjY6VOAIC1h8NjBSMmQQRX1FIelJaTSxuaib30Udwer2Z1oLtMjUkBGf71G2PdaEOdJE9yeIFYwQirSZTLWRx/Owz1TvPE/zRvnDPoq7cCosZRnvxfl19qKeGeYBASP7Y0Qffr4+AYibbCqoL/lzczNwMYpGXIJzAuuvjHyLTl9vYkBBzaFMjjibxNnmGfsbdzM67NM3e7Kumch5gYiibH3BfCKVchtEFs16tzwVj9oIwnFfFmRErHnVh1uYluf9DVq08Azyy0KVbKlvBQi33JbS3WF2YLfKpuF/RCJ+/jhN1Uez/oOJ8hS/QtypVLA5reKxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:f::11) by NT0PR01MB1309.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 09:12:18 +0000
Received: from NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
 ([fe80::6da4:f1ae:9ce:9a24]) by NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
 ([fe80::6da4:f1ae:9ce:9a24%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 09:12:18 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	ulfh@kernel.org,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: riscv: cpus: document performance-domains property
Date: Thu,  8 Oct 2026 17:10:27 +0800
Message-ID: <20261008091032.2832333-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008091032.2832333-1-joshua.yeong@starfivetech.com>
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::9) To NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1325:EE_|NT0PR01MB1309:EE_
X-MS-Office365-Filtering-Correlation-Id: 581f7769-8e92-4607-7339-08df251c4097
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|921020|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: f0CYZBUXFpCaCtQ3haQz3JIE3iIahNcLcosLR1Rc3v1hs8iDppiDZE/GnfbkA85iOmnMXaGDnMGCrEwfeTvC/mPqeA6xH0SWgAIQ5eLyRoewTmHFtIyxs6Yij2SMzlOtcgwJks9xtKUww87N3UMBP4RxoBjWlMpOonZr5WWnoMyESWbEQXrmHf9dw+h31hLTX2ttLfnCDxqCtrs7OguFkSX1ZTbjNT+iWEVAOHLTej6iLDC+ZDN2+2e4afz2C41omH+/9tQ+SXW3z7umyDRDQ+xbz7P4IAddWJR3rQgxAYb6xcFvnTIzJcNIHYwObO/O18WkJzV1zZtcsSJLtCntXj+QkmycuDDseVVfFWjHk+dHkyx9A6GHHyK2LTbcQSk2yAr5VBWVvje1CFM8p4S3PCnSyhacK3RjI55xYBym4eSS6jwUeajod7LW2XakbgjMfbfpOiN2+tPb7tTxqYoVVCy/oeVSp8w7MIROoIF7gU6ow5a7sPy6o+DFcQPgoYnjo7PSTABY+5IAbNWB2BDv+5PAin8mNdv0z09bQB1yfmP0GL5NRroRDpKBj309iYWljOsKDIEQWXQJAqZqqZpBiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(921020)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k80h61myy6s13iNGnwPPEmnlENoYg2vYzcO8Y7Fh0xB3ok65s9Xii9h5EsKL?=
 =?us-ascii?Q?pFulzwOYY7Qakf3r96USheUOL1VJwYx5xgCzppkD52v3JPLV2hEGPv8psYZg?=
 =?us-ascii?Q?zP4HHBOPBKCFrD5DgZhZ6CYxOob45pMT0FKsRrtDvPhIEbWgLGFNI4Qbgoid?=
 =?us-ascii?Q?6NIvzo/AkysXBPXm7sGCQK1ilm2ckg0uygxHltgKAN6zKmM53+E3rVjgIwLj?=
 =?us-ascii?Q?nrQzkz4GBMatwX7kIOgUEQHSZich0PspXbtW2B1Dfs9TZtqhYt7WCQYTiRH6?=
 =?us-ascii?Q?ByDqfNFwI1dd0MUuP7ePPIqhk5RQipDsplzw5XnO0+TqkmUowUYVepMA4zSg?=
 =?us-ascii?Q?zkgUcOxFfh9UvD0wK586g3PCkIOJIgQDt+nF1qgNogCYeRDrh1E5n6yqoJYr?=
 =?us-ascii?Q?OIhqmVVpBzRfgfRB+21xBTtZdrpcvpA+oWssaIpbica2I+8qP8zADP3Nk0KX?=
 =?us-ascii?Q?FjmZesgOH8xUs4Nh5fr7j9SQxyecooBtcUAosafQQ8xTucbwFAcD6vpjW/1Y?=
 =?us-ascii?Q?HvMJrmRaW8VYgjlUfP5BxvUkon4O8kAY7u1JBr5fEhsNYFoALAjcp689GwMV?=
 =?us-ascii?Q?KRpK09rjGybSxhHcyTFK2JLKPNgZeT8PSMKuVImkYDRlXmkHRkurgn+us0x+?=
 =?us-ascii?Q?zbqeM1YySuqDxepupsvgxIXylNTKdIWfPpmbZbvPBB3mKiSLhQxjigRxQEHi?=
 =?us-ascii?Q?E9cz1BxFxL8QBh1a8bTSK460MV8i781uYQxc/7JVk3tMV50YWqyuWjus4xHz?=
 =?us-ascii?Q?Mfoeu5ykwnV0pUEXaWEmvcSH3Uqkm/X5/X6LOB7jqF7voNjoMQz4S6Pd6hbQ?=
 =?us-ascii?Q?2iUdTvdh3uHfSQz6tE8i/ef/6NS74k/XSdgYHomSjtTKoj1LvfFS/TzGVpPQ?=
 =?us-ascii?Q?EFViKYNws/01Mo4bxTiZKbXYSJr5dVYB0jq3r9P1u9AHYwskZ/zzM6TvUmzU?=
 =?us-ascii?Q?o7uOJ7uFQZHQAjrKYaUd5IrkTNv0WYBmt15Dj52+9u02FfVoFD/GL0nciJZ1?=
 =?us-ascii?Q?J4NhwbXfk4y+fZwnhFg6aW4oDpO6+b4lyjlwSGKTDMe9tSULHgPzNPDTzmZl?=
 =?us-ascii?Q?rltUODJAJpZJWqdGld1HpeLexWPkgaeb9zEjERt4B0MtwDxIDNz2jvA4iHCX?=
 =?us-ascii?Q?iyEhe5NcZn9aVNidrMTVRERxLKu1umcFniSHPeRRZ1rgvu10XQHr+9FwU8t6?=
 =?us-ascii?Q?4nqjXF4WWpLNKv9aULWr4NIJzU6XobWi8LHuKyF8fqJpkED0B0lTqRcLgiRO?=
 =?us-ascii?Q?shDI28JmOtoaK0yCEYq0K2G9lkgEugBxCEp49vLn1G7FMlzEHIlvzKojMweK?=
 =?us-ascii?Q?AAFZkCD5I3TkeS7ZtnjqzhXXovyMR08squDBOdg6RLipNQu7V1w7c8SZ6cXS?=
 =?us-ascii?Q?xqhb65NBBphEVDaFuR9AOLw4/VOnhdOsF8e7xUE5RUAevlDB2dh4lQdVO+lH?=
 =?us-ascii?Q?mx8jLe29GhJh9bo+upemsbLOGcx4pLguYZa8kKmhqKu44gD3R2HVzPzwm0i5?=
 =?us-ascii?Q?iwp5mU7vK2sBqhwhGMa1sI4yKMfTfKDrU0HZ2TSQ2iA96DYt0dy/0vx+IpX2?=
 =?us-ascii?Q?O7aeUbeajQS8+vbvSljuWYFLzlXSH9/ea0I/ZO6X5l72AEDewCvhLhCNYOss?=
 =?us-ascii?Q?pATfsUkNCs+HPHp2o3WGZ8+jQxKagZkPpAGxITpTTEB2JL+zqOKseTvSUIKY?=
 =?us-ascii?Q?JyT1DzrzEfhUwxnMW/h+hZciQdO0JaljtbbYfta/+gC1/hB/teCwpV5d14V2?=
 =?us-ascii?Q?ceMa7/El6sJrM/7FXFtBjiKBuhL0VX8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581f7769-8e92-4607-7339-08df251c4097
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:12:18.4541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P9/xM80PBqvu4D9M2caO2zwbjAtaJU3YFlLcpNHAzCii0kUdSFydWc/Z6puwevXTMeGMNpJuNuyup/WzowwPjizoc+Nb+8F4L1aFgJ0MR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1309
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_021303_727382_05C6C0EA 
X-CRM114-Status: UNSURE (   7.32  )
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

A CPU names the performance domain it runs in through the generic
"performance-domains" property of dvfs/performance-domain.yaml, which
gives the property its type and serves any performance domain provider.
The RISC-V CPU binding only allows the properties it lists, so list it
there, with one domain per CPU as the Arm CPU binding does.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..f21f003575b6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -144,6 +144,9 @@ properties:
       DMIPS/MHz, relative to highest capacity-dmips-mhz
       in the system.
 
+  performance-domains:
+    maxItems: 1
+
 anyOf:
   - required:
       - riscv,isa
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
