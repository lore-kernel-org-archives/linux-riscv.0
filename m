Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A69CF855B
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGRHHwuLEreHPDdC3hij4YGzcdvo8cMnoZx/1nAQaYo=; b=hKa/dZaWG4MKum
	NPBISQdGJeoQ4oxPa1RIYPkKGoXruuTtaSTYjhrSol+r837kCSFOU/W9mhppBYeo8cTymjhtcZLsM
	dI+VMiMPHgAwomnVhQHPAWFTJN60wBVjzfCbyIzfBmdMvySdcDcvaaiWeRRxpJsYieQ39aoUcogSO
	WQcXokirmqsyAEPJbfkVQjjyJI76ztQlu0CpTseszryyKzRE2uCyXDlRxomKg7etUixXy2CNBgy9v
	C2YOST37ecTJ/E+wMe+oMEp64A0IeX/bzVZqA12SqUg6bHUpiFscBm9gW2kimy4hrd9pC/2R+qOZr
	tZgDCyT8Gzd1h9kDd8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03M-00000006M0R-2mY7;
	Thu, 20 Nov 2025 08:30:08 +0000
Received: from mail-bjschn02on2093.outbound.protection.partner.outlook.cn ([139.219.17.93] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03K-00000006LzI-41rI
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 08:30:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajJi4iiasmNYErJOfYhc1zk9Aj8vIHEJRWEbbj/DuJhGWImMq//EhZxGYOdqa8/UmYcGJ/BQo5+5HyyShPxI7rOqXR0DHpMcQT0BLV1eA/XteLjeFe+0XBiEppTNYSlWQLI5iU0y29c6aFbQJ66o30irfLGW7CTA7zxMCLkzxja/22bQT84uyzgBBxDjI/WlS/7UVyxJlsSDdgGKhakegPxD9DbLHzF9P2udWIF8q0C0uJPB3QslgjfB942S5u9gOsdWXasHEczSXZR9LUWz7kYaNcBDE3fet2ELE1Aoo44fWJ5vEjeF5TADBcazELv3NSWrd/5A73fK4s31K3PIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrdOIBe6XTVZYCkuYgFBIwODEgTpoZey6Uz/1VHRgT0=;
 b=WvW6xHCJ+oAER2KwlkOYunhKNJWeCfKexld9pPDw8C9Z1Hf4fuoSDPJ/Bqxj7SHbKlFitpHUegO8jVBeBg34UrV3M73yUmoryIK5IEs6FM84e0z1t5G1oTf4lW9ZUm0iM30SV62NYJvmzCTAFGFQQBwmpuijvSCkdXczQ9+F6YUkAlGCa4m+uvCjnVKykCDFY145I/ApBsl4suu4ExurISq8dSJgDDgO/RLoZDCNPkB9GKs1h20HuGyIhrOLS+3a3kbXjKcWi+N1mtx2oag9nCxqVMTzjfUmChz2VGQ1AGex6M6HbZwrKcW/h0pjZMuTCqSGkk5cOvu5CpA6vsZxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1275.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.24; Thu, 20 Nov
 2025 08:29:57 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 08:29:57 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite board
Date: Thu, 20 Nov 2025 16:29:43 +0800
Message-ID: <20251120082946.109378-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251120082946.109378-1-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::20) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: 7706e344-6b00-45bc-9619-08de280efcfe
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: C/LjBxSrfAxI0oAz9I+MmDgKeCf44+1za6VQVKMG8sBHhoWOQDhJdepsGXIbJj0l5pvXnp2stTO5UrvYrashszJ4mdMf1SG5yGQbe13vQQKha2DcOwmkof6/FNvE5mxSlShqqFuDx8GlYf0s6rMIUkYqpfP75zXAUHp7pM7Brqb+s2B5aHOdsKuh3ekjlr7r9B+b3iPDipBhWK27gyl01VOhmFa65ECSsdUac1jRh0TVNm2nFYw604CATFk6Yma1SInwWMRhIBGHEa+zCZNNlK929nP1QQl9Xg2SiF756JsJl6LogL+fJ0hvelp8KMLfTsD6RHr0cWLLVUOtPsf8Tq12nyWBlz3iRLB/G4EzGTvviHFMCnCRpAC3E5SCn+BpjiWF/EgaAjNwyRG+fVz6bv7wu0WkGd0OyLfzaX4x1dVAL+GwNHkbIXlHI5+tlfdDJ/dzM0JBVufoPR3ooANcsvzuuJ66o5tONzrtlcqEES/1zEIzdoK9YMBGP9/bjznqzp3IBd8mZ6HDJWuiQDdboYlfqLUZIQ2JRlBYhPZeYk9AKGkzlh8ujQuJEQDpvKfj728RFvyJNDDJ//WGRLhtuatobNqjw58emeZargw7fz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZdogE4PgGy2gcvTojfJNWg0Xn74wB1RLT0sMxwACYa+RSeSOSRRbtrLWrzLl?=
 =?us-ascii?Q?tZHypjnVDxGLrmNdPObgHykeiQJ7kH8QnnuXWTsizJgCHo1D0bg+bizjLpG6?=
 =?us-ascii?Q?ydZM8WRolB9KlhEwWjKKtulFSDgkTUwGki/OfDivZSSz1M4NzG/mgYuWNcpe?=
 =?us-ascii?Q?AWuPVAXZwtDeGTMzC6gu7kRzpsYPZhUlAWfjeNGQOee8wIhJLy23jlZ1WQCa?=
 =?us-ascii?Q?lwIz4ChD7GitoybFYQaSkqUs9nfc4ZnAspRUNRZ7wCCS6m6aHhfy7AiAja5a?=
 =?us-ascii?Q?iBfxKjDuJxA/SdmJ9mS4dLzSz6wjo2yxCW3pZ9jp2zS07R9atjBdkC9QJazy?=
 =?us-ascii?Q?LKOEE0sBBBBdrE5G/5CeQ0Evmc4tv/Ril+3CPodZZ6t4Cdwx6Hw8RD7e9iVK?=
 =?us-ascii?Q?5cohU+dHwH8ThHPICSbdgMxq71qjxgY6dbmrcS+wXZweeEm0q8lNurBScygx?=
 =?us-ascii?Q?HrwPW2cNhSxr8SOszEVnfVs80+LIXA8Rl/x8eek7KPik+vciujZtdlCs3JJ8?=
 =?us-ascii?Q?rBpraW00Zg/N/yPXWr9gBaaGuHjv42ZpTkEvzPjxnGz0xQcjfqdoD7/v4pyH?=
 =?us-ascii?Q?sJ9gmZenMRvOm0MIng4wBy+LygxWE1p2G9wK0sMAoA7pBUEziUZnF/mXj14n?=
 =?us-ascii?Q?4DcpJnZy1LMIYwIWI/Y/8cWckL81Jo98y//766py62cDgn6atEZES1tsedMZ?=
 =?us-ascii?Q?ORzeyYDeLhcAp6s/iO3DonHjXdQvAQWGXymsWheGaUOzxNlioZu2NM7HoIS9?=
 =?us-ascii?Q?x8YLE+9+XQiOI1AlnbzlCv7vjlzpdyHu448H+oJ5ZPErFIRU3d33gcO6mW+i?=
 =?us-ascii?Q?JrbQkHIZUhMf594i5BBJiLvjZa4S2e1/CIqqSL6hEBLHMdphpBBBSf7tJvR6?=
 =?us-ascii?Q?lw3s6hJjxp7OBz4ceLLoV9XjXH5Aq6nF3zrDt0e/u2IorE+uKLbKD66PA9Rx?=
 =?us-ascii?Q?eUjOPAMcdO3/hQ2ii6bYk6RzW5T8ye29m7vo4Lu1xJ+EqJOFCvzGPGYaa2m0?=
 =?us-ascii?Q?Q2S3GdgTjSUT0PBLASvJ2SoajQqZQt2VAmKWWyFJINpLOkEyomjkUJ/MJGWP?=
 =?us-ascii?Q?eVLyrLto1cBK9wrD2LGbsVUI+eCNjkzYe6mdxJGJf1XIzjIjy9NyKFT8sqrA?=
 =?us-ascii?Q?ddzvXm1ZxaXzWx9+PZE0xmG8z0RZmCPos35VrQRcLei42K+Soi0VpSZUYvpw?=
 =?us-ascii?Q?Q+qNJb/0GonmRVrxIiyNgR4oFIRmqjyeGCYL21G3s6O1HX84AH7Kty9VZiZI?=
 =?us-ascii?Q?9QD+HZcLQQOzDtLWQMsENdvqzbEM24MeRMgf4E3ce/X+aNeEAycUTctUJBrY?=
 =?us-ascii?Q?JTkHcloekdxzrqXNSFz3nU+Mfj6UJP8nZS9ZbJ+/bwS/qaD+O6srI1qPcxYe?=
 =?us-ascii?Q?pg+Iru9nXrzKwikImvCZPdRWAm/4OZaE0kS0rNpsgiz/RS2e/6hQvHToD8C1?=
 =?us-ascii?Q?ntGBXl8U/cdl1qAc821vOWalt6GaF09AgKww0T1wMsd9x43QlslUU1Bvir4B?=
 =?us-ascii?Q?1QX6o/kwI53RIXwj0xwf+hiXWYfQMACsqgiaZG31aHSMasPBUC1hUFVgN5xJ?=
 =?us-ascii?Q?XTB1ETBNXatjYn1N3dPZS+5XkJ6OybR8uAeU22EVG5RoOYjRjpdMpXFbWvom?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7706e344-6b00-45bc-9619-08de280efcfe
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:29:57.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90SVI6MPP1bSEXuFT/0KUm4RLuxTmsECV/F0VPSEuFVlYUXwRnT9vTVC9DHlnatD4z1xWKWeT4exOMjLCiWTB7inCSKVqTF2omZ48F29kVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003007_000872_9DD18CA3 
X-CRM114-Status: UNSURE (   7.55  )
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

Add device tree bindings for the StarFive JH7110S SoC
and the VisionFive 2 Lite board equipped with it.

JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigrade
and up to 1.25GHz. Its CPU cores and peripherals are the same as
those of the JH7110 SoC.

VisionFive 2 Lite boards have SD card version (default) and eMMC version,
which are called "VisionFive 2 Lite" and "VisionFive 2 Lite eMMC"
respectively.

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 04510341a71e..797d9956b949 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -35,6 +35,12 @@ properties:
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
 
+      - items:
+          - enum:
+              - starfive,visionfive-2-lite
+              - starfive,visionfive-2-lite-emmc
+          - const: starfive,jh7110s
+
 additionalProperties: true
 
 ...
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
