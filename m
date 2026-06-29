Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D86C43638
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ5cJ5idgDNWjo0pkcrrt+cHcmmLvnTAWgCTKjL3o/s=; b=mhGh1erIeUT9dP
	xiELcyf+mWw44SC2Lpa9uWSAMyjlWo9k7sQuEMINirnKB3rji+klNSmQhuhkfaVqi5Ff91LMD68IU
	YeT1XdogfSIt2kBS7iQC3evuBXjWdQUJsIh0E7HSKICPi+OQ9QhWJp8QsGjHgJgA175cPi84z7/to
	EocohRSEqJSZ5ZdnbpGZhhD2qmw/vKL+LtKyFWX4dsIxxm3M3BnTQlnjAkAnolMpf8Wk4wK5TQyav
	YwCB+HPcBKX8A+qnYikrf07T1POCQQ3NzmgIwu77MCZzlAHdaMhzP/uzUGWNPvL0POGPwUZp/weeT
	3njnERm7TpmgzpasrbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5bk-0000000DlXG-0Bfh;
	Mon, 29 Jun 2026 06:36:40 +0000
Received: from mail-sh0chn02on2071e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5bh-0000000DlWJ-2cBh
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 06:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua5SUa+ks/6UeUyHK24DmUFqTXmwoHWCrT1f8+b37IWsjlrRdfWH8MkxCITgyVsIhlAEVUAPIiNG7c0NwbSWrctfrUvH+oLBV5PQ5/wdVKPKWqQhYtQjxhBL1h49ebl26TaJVlCth5pQERi1k08D8Zh9R5DucGwmnz08LpvDNVLGzOWeV6/YQ4kDJ1jr/CBZ3BlvbNIy3SkMKXp1df3paPrrpzsgllqsdHa8t696MKA/28SUgS3WwOo5Te0Z6EV6D7Jxn9OhUe0aRXelyZX7oI0QxVXBfwzTVY8ijazyCutHshowgL7njDgO56h6gf5WdKbfFCnT5KkxSBiUsloCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VdnYAOM9QWF8oQgpPMfG6Pv65YwsjbGqk9kYUAj4tA=;
 b=SXRTHBumi9x+GUmF6xsgJHrBUVwu0c68Br5/GfIGjRP7//Sq962ZZDJxO0j6PxNZbBWls5U7L4TeRHpZd1YxF2L1+WEqJCe8B7705y8pEwvJwHtxtOv/1AgkdAmakPp3Xuz4T1S6Mj75DLnUjHbOKutX1DBKDNsZARrGWKhECzzMXjb7gPMyogEyr+A3+QpJLo91/D3FQEGz9v4SYPHji4Q0o1cp9pd2Eu1670KKq9PzkeMx67OzzQDHb9bNATve0UC0ArfrKM4kN432OKFK+Wxk/7/UOPQGrGoZtcae5wwkU6U8zLog+ygv66Qxen1W3uJBebaoFmVAmtbjfmVZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1323.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Mon, 29 Jun
 2026 06:36:09 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0139.024; Mon, 29 Jun 2026 06:36:09 +0000
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
Cc: Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v20 1/3] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Mon, 29 Jun 2026 14:35:59 +0800
Message-ID: <20260629063601.63917-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20260629063601.63917-1-hal.feng@starfivetech.com>
References: <20260629063601.63917-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0025.CHNPR01.prod.partner.outlook.cn (10.2.0.214)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1323:EE_
X-MS-Office365-Filtering-Correlation-Id: f1368a24-851d-4c71-5bc7-08ded5a8b4ba
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|38350700014|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: H276cEY/MK6kFjn+w4t8mkszbyqRCfldDraDAPjfkev7FqXe8Acjc+wVwL1RMCBcwjP0AoaLuX0T3/ncZOeESim3iEavqlc6c3nCHcila2qM1wiG7z0dcmrO/Em0rAC/yyUktYkyqUfYoE3rS0K/1/J0c9bT427Z2nX/yvD1ya7qGoKF7s+ApZQKrZV77L5eFz+K4D7aA1zeYaQ/n2jx9uPIwfIuNVm9Ol291Ed5Sx4OjS1WmmwHGgj8jlIQjn0z870eYyDxSW0QrO8lXUetOSrfx8S7wbuA6K2/BA9DWiEDdhepoQ4XL0w9tLBFaZiUaHdfAM9ji/0vJb0bJHSopwSiGbj0lyO2hSlutOiQw8Ce3HMRuR0N0qEf/ANsarvv/lFTp+JiFBSgTnjQ9Hj5N+2QmYvE9Ec993GOzege+xz04xC+cgJr1bvXNNJHHFq8Z4J5Q+/av3oh0PVWazb5KLhiCzNJGbYQ+3khQZBI0uduIMo3EDNPaAjfQ3ShUSbtSDFCcYwTGGRjJARcep7KgVGC8t7cjwZp0ynEg8Kto5WFXyeZvM1mx4cJQuPhxWpz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZYqSzSGo58UcdCAaAtynd7La13Z6vIVhTp+/n7wKHfzgCuNi9hOKzTz9mMc1?=
 =?us-ascii?Q?9aBpCqzPiyoTB/QaFtkXalb3DYSNPQ1l+SCl+osBtXOJFJE6yrdd5BLb3/jD?=
 =?us-ascii?Q?vyvehaZYUFYGPOW4TD5Fx5toRkWdMB9m16BQRPKHT5C9Zc1dC/KHHBZfCdUF?=
 =?us-ascii?Q?Mb6UVINL9r5iXpcuaFLDsjTGKSQ9zHn/sMqEfBqro3qvBnC6cT8kzG+miA4j?=
 =?us-ascii?Q?Owsg++jpZZm3pJQtGCkkohYi5ZVTIdQQODeXGprBtFfh53ay6m4IfAO1x7Kd?=
 =?us-ascii?Q?+VAsExemijIbdDacbPsN7Mubgdfnaa7N7VnIVZSFgY6bHiNkJ88mGKgDulKv?=
 =?us-ascii?Q?n9DBUZT0uZ1UFDHCzpOdL3IY8K+6QaFLEpfjmXObDTpwPAJ4lldLBzcVeLFk?=
 =?us-ascii?Q?Yrsy+SxrpcIqUO8Yut3y7T+OblvosigqRZR7AJVnZT3bGF4/3fVTvvvVJ6Zn?=
 =?us-ascii?Q?CVvJxcKBJ35P4j154sweKg2pf0jnVuVZObF45t5F9iuJm9K3x6ta+kylaQqw?=
 =?us-ascii?Q?06LQiZp4SzpZ66y+DtwWc0Kr1voUpaM3936QT+gclf7pBY1jlUuzF0h6j2UA?=
 =?us-ascii?Q?xqvcRjjaHAlby7g13ed2Ibxkzjbxf5aSEwN7QqQ8o/Ytcc7GNtZaDrl4VqPq?=
 =?us-ascii?Q?ZrSiH2mmnCMoOSFu/ocAlqq3r5Mh3K2Gg+hZ9V2gsty+5bGwX92XySE2zNT+?=
 =?us-ascii?Q?lihOECdb2RgeRYqEOqpcURDDUMX03mujxuCFvMCOu7HcD9Dk18R7r8dyPYcs?=
 =?us-ascii?Q?aS1/WbvipuD5g8sROARN9n4UG+o9nxZa1HoKcUDOvRzsSuiFRajJyida/0Ie?=
 =?us-ascii?Q?Xm9aT4wdIl64zb9QZkAztk8wh0HTImIZTCdlQD1XdG+lv7zgCjmPeh0Ijnv5?=
 =?us-ascii?Q?9Y0la2P9SQa07qFj/heeBowiZO31FryX3+gNqWWVmn40c5Y09LZrISBzVNpP?=
 =?us-ascii?Q?7PWtSpZvXKINVxs5JUOGUAK8Kj5eJBjKqgWMxsxcgn4WWG2z1FpmD+9MTkKM?=
 =?us-ascii?Q?hS/99XBqBYj0fIp3OUmD/0dGB02yIuv6JyThXwIwNsSna01U6U3NZqUVtptT?=
 =?us-ascii?Q?EhzNPKE+2tftvHSwr/LPg4Shwn13jUpOiXh050stpbowqUIY9CQzSNJyner3?=
 =?us-ascii?Q?3fQCujkvcfMlD5WBJQ00uOM8+sP37HhVCw7Xlt3VZbkJ4COvMMZgyXzuY34N?=
 =?us-ascii?Q?I/XSuir7xHHuopuRqdbYTb/5JezynaAK5mtiEZXq4bFslkJTQqZ9jk2v25H4?=
 =?us-ascii?Q?PyRQzwkpBhpJTf0QltrMTOLnWMhKzlsPGprIckXJy6RrujeDafWrlEZUKQJn?=
 =?us-ascii?Q?ohmiL8SS/g4HBxPcSmqI+KJ/eByQb9HFoXHQsli47U6jO4+z+e4hEV0mCOx6?=
 =?us-ascii?Q?tDXkIiiZHCjStRCH4btA8E6tvxywkuniDYNi23/QHYfvkKhbQDmaxtC09nLo?=
 =?us-ascii?Q?ouRDd2HTuRUCBaO5Rf7VjNf2lMiZxx61kebWiktkKqNpc5k2u05cYY+w39/V?=
 =?us-ascii?Q?N48yOXJ9n+QUOPP15va7d8rJ4DAcntnI9/Jgg4LZzeuH9+1xZd8dc15z1nOJ?=
 =?us-ascii?Q?7RUlaavGJu4ptb3yqXPRp4xz7/8WrF9HAjE9AZnGeTCbc2/+t1kFx9rjDT9W?=
 =?us-ascii?Q?MsDBkdSsreEdl671k3j8GkWCFgNJ2Xy8bQfC2TuVNlooIO/suGPoJr1GDtYT?=
 =?us-ascii?Q?F2hzJ1HnZGJRGHWFizpl2YnRncAo6aMK1prwz7aBkS1h1FAqmfFq62zrvT78?=
 =?us-ascii?Q?Pi085cOrNiB/mD9HSbZVBkuUKGy6JWA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1368a24-851d-4c71-5bc7-08ded5a8b4ba
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:36:09.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnC9AGumD564JwwqzXH5WQse8EWp/FiLnSfPI27GBgOLP3PZ5GxXL4tpMmlxu6V6hXz+X/vvO3MZ0BhVN2rvIZoPRKOQvUh4UY2Dgfz122Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_233637_665048_F6765505 
X-CRM114-Status: GOOD (  10.29  )
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

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released. Add the jhb100 compatible to replace it.

Change the register size in examples to 0x10, since an OpenCores PTC IP
has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

I will maintain this pwm module in place of William.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
index 52a59d245cdb..42c5d2b6326d 100644
--- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OpenCores PWM controller
 
 maintainers:
-  - William Qiu <william.qiu@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 description:
   The OpenCores PTC ip core contains a PWM controller. When operating in PWM
@@ -23,7 +23,7 @@ properties:
       - enum:
           - starfive,jh7100-pwm
           - starfive,jh7110-pwm
-          - starfive,jh8100-pwm
+          - starfive,jhb100-pwm
       - const: opencores,pwm-v1
 
   reg:
@@ -49,7 +49,7 @@ examples:
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
