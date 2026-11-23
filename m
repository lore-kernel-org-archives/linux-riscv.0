Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A85606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 03:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUxIpgLv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mq/LAbhDKrOPp7s5BU+9YqdV3XgmXus9yhUv7/MSY/s=; b=DUxIpgLvcYAYvoZK2SbrD2fAIL
	DBPPJR7034Xdv/kuI8l3iv116v0vrZjhgCKwP04zFS24ev/PPX0Zkat5OHw5xOURYiGaUvpb//g4z
	iU1YTgCTCTv3TFoYK9S9wRlAKcSc10i+CIEFHFbtE90ENE2oKyRUZ1wTcvfVDnAYeHZzdIAsObouS
	zTF7QAyYKYI9c98lY9E3Y4IpdZlfdLcthsyUl3p3CWmFD7XGF2HdVDLAqI1xVWd+KF0/lSjyNKRAa
	oSXIvA0ffRXzwyKbGefAcIJpSsHR7SLuVlnzBLb1S9AHcqjPjZzBS0q53HD9NKgyk7sIIjS+UFcFC
	WA9tJ1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKWM-00000002BjM-0F9X;
	Mon, 23 Nov 2026 03:15:11 +0000
Received: from mail-bjschn02on2072a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKWE-00000002BhE-003e
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 03:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVvSFzgPetammyBwlevfr16HVaiB53mX9gyvEu+SN/tp69ADcy9TyvPHswv6ozMkSNW+/2EzamVsAUqTAzMpnmzvIHbWY8zTdFQXaMuXHb79NXkeVA7PZnU3F7A3mQP5uZ73DlD92XToYBSWVnp4wOAZ/uo5tu9FjKHuiMUHFIatrIInaCFWa5xJjlwrlgOjJBl9XGqLo0ukpmbADAtGyk/b9wfOtwcY62Sixb2ix5Qs+G91SnfKyP/TWEDBTgDx/HC0cicqeKD/IBuIF5/OM7H/CITJ3QGvAmV5Uq6wEJ8zZ0ye5K47vHcFTLEeyLYBmAm18go0rWXVjKZPzNZMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSd6C4xO1YZ395Te9Gzj1wSUeBxODnJJn+nUgxBV6c8=;
 b=dFCfrixqrGfkOjlff67cu9ghc+wqAHOYof2TsNBoIpPrNnLFkFZA9nZQHWvypaXI9hSAAkX0/wg4RqbPpP5Ts07BiJp9Ug8wsN9w6yR54ykH2WafTDlRd4Gto7IUCaGHHLY9JYojEbx7XmV1gkzqbiztXYRofQmWJuJ+DOSKq6oHlYnZ3jzuV6Tm8336nUAJGYAGZ4NuFy3IYlwwJFgCH0if1yVKdrJPnhfsHbU+bKe0KDWxtwsy6oHU30/VGkK77/Olsn6+ML++q5zbb2nny9iO0kGIPY6agxtgELzUzLhrmEVPmVT9HLiRe09Lwx8TJNoms8bNX5b7nVycJ0BFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1040.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 03:14:36 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 03:14:36 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Maud Spierings <maud_spierings@hotmail.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v25 1/2] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Mon, 23 Nov 2026 11:14:27 +0800
Message-ID: <20261123031428.20536-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20261123031428.20536-1-hal.feng@starfivetech.com>
References: <20261123031428.20536-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0021.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::9) To NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1102:EE_|NT0PR01MB1040:EE_
X-MS-Office365-Filtering-Correlation-Id: db8f30fe-10bc-4c0b-57c5-08df490fe73b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|52116014|18002099003|261009223027099003|22082099003|3023799007|260925021911599003|260925021311599003|260925022911599003|56012099006|261102123227099003|261028144727099003|261021123027099003|261022105027099003|261026121527099003|261022075727099003|261021121427099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: YRHZgGfJzIAkyQNbrFlDG2xD+isBqvN1WBKxFBhWC3CWUJ06e9TU+pBgL0q3W7ftcFOIUG6gTidHAtYX0Zo5bZvoEL3Tk405DpK/0x+0MV2YBEWyRMXZY7GibbxiSHP6j9SBTKCyGLQVf4nHDV9lEeu8urRKa83K8Ipjlq4ZpwT3d8Jfh9UbRbDfRl6GxmAQMJAaSKlabm6KDfASXIyYta/KNR22sOwIDETFvpyZQQe+GqhD1zk981jgrLsWgho3yXlfcATERjnVYk/kwHc/fcGSUYySKtielItihEdLTa9RrW83G5A1vA8kBGJ0e9ZVBOsQvnrVRMbm4+YgxUtkRDig/VegKdaLTq/+8Y2S5u37yEnZCYLXqhTEz9IRAIwLOURYLUSTt01C/WrjUmSA/z+G/aCIP0gL2po524l1z07d0Gppv5o9QRCbuvuCDfGaiq6aReFwKEpEN/R4vB/oIdVwfOlAq6YMZK4kYH/ok/2P7hUnioqdC+SqEQzvwNNKebfKITw1aoNL5JyfayjxU9LIZAoKoH+d9vlo+NuAggPWcpNWoPvEaw7i1+H2+L9A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(52116014)(18002099003)(261009223027099003)(22082099003)(3023799007)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WCtCmNNBENo2AYtNmtawgEUuNqmFxBwqIxKaFPfafFybgeKUPD8DX5+NkoAA?=
 =?us-ascii?Q?WVwlIXc/rW1V5IDvkVR8SP85kFRwrY1KJOrD0jWBZtecUVJgUatnL4JgDBxu?=
 =?us-ascii?Q?SG0z4F9US3eahOUF+Q/1enVX6UxvvZU9rw0gHmkMHkgGzu0WpdTLV5p6ccw3?=
 =?us-ascii?Q?WfC82KhJc9GKk5yS4PPtGxKZ1DRFbNs/gaGOUTWTwimboyJAm+6m2YxRhMY9?=
 =?us-ascii?Q?yu05cZk9T1sB0jqyYjPQSxNPxEkDbQ+k/nlMdjsx7hO0cmussMewm5lGGkm6?=
 =?us-ascii?Q?FYdrwSSoZEXsexdRdm8BiSSlmbQWIBZXFY6qsi8feVf+ZAuawRiIZzFv5Z1B?=
 =?us-ascii?Q?cHPJ7dm4R3ss3OrxknBjClkWVlNQT+19BonbEVgR4AgDzGHqWUfsu8yEpI+h?=
 =?us-ascii?Q?ZlKrFQBzqHiSea9+VgKRsKLXrtoC5+2NC/YLKvfhyaJkUaN1yaJXkQTOiDZF?=
 =?us-ascii?Q?3A6woC6ulv96hGHWBNHVtOb98y/ZuZsd0/8aiXErOayDuz38hproDQaC+SFM?=
 =?us-ascii?Q?rjSj/zzmKKW4F9Pjn/jL8gJLg2kyjp9tVxgmXMO5rCyaGnsy7dmsRD/1EpE2?=
 =?us-ascii?Q?k3G0fxWgri56KT6s+9S4pFB83N2oVOofnFj7A4LVl1MYHjBXe65ecLHF+Pbm?=
 =?us-ascii?Q?eAyVYbf82g0+Cw74KSxJVRRHgkUFy7jxIG5ouVFCVMLaR5FaOQAb6O+0HTce?=
 =?us-ascii?Q?nDIcO6NGa6udUo1GUaJiBZbpoY1MvHVUgwQiiKTKRcyvippkC4mYdV48caHw?=
 =?us-ascii?Q?XErlTdHeljdLsnXjNMKnSi1HsdCfzO8/sG0pjyT/KyJLXnFGyoU9NMb3MM8Z?=
 =?us-ascii?Q?g0pP7+5cBFpkIcPbHZrq1dVwm2DxEwMOgIqwgh3uzmgZrGUISWaQSNMwASdi?=
 =?us-ascii?Q?RMfggbBMOBxvsG1vqxnZYoaALtuAClw42tIyEv0Xx7kKSpJgjOSvTTTSI2d1?=
 =?us-ascii?Q?x2qISQaS3ufrxRnUaXHqjSUm34C2XJPG6PyogM3BalYfoY6bBscCpPsk4o7c?=
 =?us-ascii?Q?UDagbXgWJm99CvQst88gyibc4wdx7xeDl23vpQGqEyxGbpET2J+mLad+GtKQ?=
 =?us-ascii?Q?cTdE7z+jyulIGqIXgWGqO962t2uBH7Cbo0/Gveamt181pQ3ht01p2A+KGBKN?=
 =?us-ascii?Q?K2DLTP++DfGMpoK6Ibp607f4Q+sp8T4S4tT4Byk3zA5sENbteUlJx1BeNp21?=
 =?us-ascii?Q?J0ZkPG99ThGIJP3vzME67rpN7ELlCPjUGEXGScrHPOf/y/6ylkhC/5mgbMmI?=
 =?us-ascii?Q?Ag81EJpDOvEvxAigJ3fE0ZvSudR7NC5PMiNVZF8vVeqP10JJwojjlADhcjtX?=
 =?us-ascii?Q?izmupnudC3T68sER+FJSEFIFQEpzMqEMj4OJqTR9MWumExRIqm/IVaIIXYjf?=
 =?us-ascii?Q?8CdITD65kSvmfIcFzrw+OngO1U28+WBViWdW8zyrKWiD9TDUCW95pvQEX3CT?=
 =?us-ascii?Q?YcpvI5ZNVt/wR2LNSYGhuIHuLChQi+g5/+8cmbeUkWtC6+igLZ9fResAJi2U?=
 =?us-ascii?Q?LrfCUDXcmYbTsininn/+mOHOcbH01X8EzO7gSkyC7csQoyOTp/Smr2tj/J4Z?=
 =?us-ascii?Q?d/87PQHn+4B9dRnNMSqo6r1iaJ0EB5dydDIfottCcbU97v1izDBxysDWuwJr?=
 =?us-ascii?Q?PKfnuEHG1omlMRaY0jG/Je2grOGxq/YCY5Med/GZf1QvATO1EIQxVs4k1WZn?=
 =?us-ascii?Q?qp+Yow3OwXn2xih/VyAP51NzENu2yvLkFeNg7tjMt8QAuQVuDnK3eeh/eHFE?=
 =?us-ascii?Q?cNgkj5ooSbWz8B/lUnMDakiZ4rJ58V0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8f30fe-10bc-4c0b-57c5-08df490fe73b
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 03:14:36.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJvRADYq8hkpOVcCTPJdD13KakhxtXHx7KJBpnjR2cIJA0OKkB5gWXNObSuJmVg0IpS2AYjC3Kx/o9oZfmTtQ2oueZ7ApJmwRo5tSSlTe7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_191502_044936_E61AEF6D 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released.

Change the register size in examples to 0x10, since an OpenCores PTC IP
has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

I will maintain this pwm module in place of William.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 2529085831b0 ("dt-bindings: pwm: Add bindings for OpenCores PWM Controller")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
index 52a59d245cdb..b15468f97b59 100644
--- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OpenCores PWM controller
 
 maintainers:
-  - William Qiu <william.qiu@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 description:
   The OpenCores PTC ip core contains a PWM controller. When operating in PWM
@@ -23,7 +23,6 @@ properties:
       - enum:
           - starfive,jh7100-pwm
           - starfive,jh7110-pwm
-          - starfive,jh8100-pwm
       - const: opencores,pwm-v1
 
   reg:
@@ -49,7 +48,7 @@ examples:
   - |
     pwm@12490000 {
         compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
-        reg = <0x12490000 0x10000>;
+        reg = <0x12490000 0x10>;
         clocks = <&clkgen 181>;
         resets = <&rstgen 109>;
         #pwm-cells = <3>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
