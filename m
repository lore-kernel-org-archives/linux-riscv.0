Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB690C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T9Pn31icwGVl/i1er9ZiIjyPIehsRqzSi+oVMDt0V4=; b=yOh6xkcwGmXlwN
	+OgqMU61H5MaN17Qra7RD4J32gjWP7q3IdzFMICol/DB7wtEvkF5lKnVB7yUlazxftUdKIR2/+s3I
	KRnzBsSLslu6n2uf+2TMvNpk6Dqj0Tpgs9JEJDrJK20juwYxvJ/hxYr1eGtpkIKVlsZo8LjHiKhgq
	PmwnYJFZmgDFFV+gAb795QJ8GIgJQcqbjy2COoUF0NMv6Gx7kHynRbo0pqdjbeZEaDe7o6YYR8xRh
	l7VBipK2hYDgNGYBC9gxIcTtVQSlzMwjJ/hosVfBT1MdBpTxCxl4nkLv+KlMCnGlgKU/okwvV7vH0
	eOOnI60lGGrjVJpSglVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s76o9-00000000Tkj-2uGP;
	Wed, 15 May 2024 05:04:05 +0000
Received: from mail-sh0chn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s76o5-00000000Tih-3PKU
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:04:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ5+3y4x0zmR/cGc4A934b/k9WtvZX6PnyxtlD8XAL5LdVHJ6AUXx+CpfanfedWP8mEW+uUvwd+qW+vHfQolwlRPuaNXdtdDJHFw7mM6GhkWU2VsYXpoPSGiZliDtMC5BWhAepC+80Iu9EETrg5QuSpgktJVsPcq1OP2rnf7zF9VQQny+E4Cgmoupl2Cq/XYaNu5QTUMZl6xyiAaQa2/bgesBdEOiXdLiK14BkhoyrmRdesdhtsHJXwsgY1WlFBi9sdG/m6psAXZVAnG/NJJVI4bO4P5c0KDXXaMnYOBeb2pXVBl5w6I61+wzrHLOz9qieSs8fK26UZqt6Xwj5fEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxIDl4HLV9bJC7hy01jnyiv1VF4IpHjXIeN+QCog/Hg=;
 b=EPOxE1RtKZc6r0zhwvTZX3XiSyCzPCHnCfvlmrVvy0M74QYnefeSsguvdAaqafg41H/iMVkqVytklnTiCcRNZR43WKSR/b+Qu+bD5WZbc75WI0bOleyvjAwg+mp7P8a/eyNND9TmS9UdUj3AeJVHi44hZIuK+Ols0BAXR5FQiosGvJHQP6hzxFnYJ/2Phw08iUnd3aZul2hr3u/BNBnqny2zWsrmyvZ9EZmGKoKCl8EsX/jIieTKvQeo6/ybR0XY67u3w9BXiPIWP8eMYfVafrb9qHev8SubW6UE2n8MbSbSc09u2uGhDw0LSm3Qhjz/0BnVTu7ax8iyvB+TCc27TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0859.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 15 May
 2024 05:03:40 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c%7]) with mapi id 15.20.7472.044; Wed, 15 May 2024
 05:03:40 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	joshua.yeong@starfivetech.com,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/2 RESEND] dt-bindings: cache: Add docs for StarFive Starlink cache controller
Date: Wed, 15 May 2024 13:02:53 +0800
Message-Id: <20240515050253.38061-3-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
References: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0859:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f54616-0531-40a7-71c4-08dc749c6303
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dd0rNxqdOR7Uf2FhJ6niZHgQfVsZ3Z9lOCt8jkrAyjTScmEIv9yPH1RtzIyBwEYce4MW03b+EGOPlfaxil4whl0gjEEbqCZ5YMydsIOF8vW3+yqScFbslDIN5tuaTEC08oEVRPs5GNu43Nprxh1VBDIfjsKK3LNTEhOPSWN0ncMjK4VM9ieLFkMXNItqPYahpPJVM8gfjRhZipqyHMcdWgM/IhCbF21VBuShzYtofq37GDx+GYJ7F0qIvM7n3HAVD/a25+J9p3uZuzDeKZWf2s8Bx0cCuPmKUuiunmqrltcdaZBROUu+DiktxKrldg0cSuMa4YCRlfHj/G0LDbJ1+Z2f8+b6h8Qpb5EwBA1I0g2FBstyIbE/rfN2+OCJKIlE1UPqlj1WtuV97s7qcBksnH1JS6g4u2WQDNhlvTgK1u6GCde4DBRTFHFAR5aPTCbwrUzcXeOvvNB8d6xm90069fRL5pIYjzPUGPDPi/2E/KV9FXCaslU54Ka9E0jmsUIn6VyOZZRSS+XASd2IUDfaKZjQmON2f1Mj5Lqp15IYu2JjTP/Pns0ZPts9ftCK3gw0Bq9uL9wh/G4AzIpXvlEcuYNb1lqxb5LspU7bFonJhMq7J58/3oXvD22SZZyJWyOjkjPcNN1M2humYN/8NdSVFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(41320700004)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8kZM2It/6aqD8ovAOH95xDooWD2Xa04XroKSZWVUCQlihGklbhiIJEnB1PZ?=
 =?us-ascii?Q?kNOXWHH4pHm1fWsEq79zxJFGOz96gzkOS/iwvHVe7dkq6HNUyo9HT+vofRmf?=
 =?us-ascii?Q?MWOP3oIaMLXV15+R7mEnepOfHU+5PB1V5UsKPXkQ5CtT81t8hJMAlScY75uf?=
 =?us-ascii?Q?+Yehh4wyepX+hAXsZmZsjDkU6jeOKGLbWjWD4oBT58IVAV+YJIgZcYL4njfg?=
 =?us-ascii?Q?bDLaom6EXcszrjQsDAU0GjNoyEDTsPBtLV09zCPoHcT6mwsgp9SkHAe2VOrA?=
 =?us-ascii?Q?nmg8oLhaWOzHs3/0WBCqedievmeoUOnLlitOAJobZ7RHNotAEuLrLM/h7TDa?=
 =?us-ascii?Q?jb/zgW3/os0f/iAoON9RFQIMbugkNTyHw+VCLyvE1toAymciYZW8ECQxw69V?=
 =?us-ascii?Q?6i3JQbEVRsMT2mZlauF+LsIkpNkNX/Ea6P60Ppgu3RleZ928kxgaOA3kb6m+?=
 =?us-ascii?Q?yjKj2EXDkDIRAvM/AYyMVbUlFOUsE0LiTJkw9/crC9AGp9ltkXUc+VefdtiH?=
 =?us-ascii?Q?s0ZMev/F+u1oSnBgeLutXvllS1FIKSmc48EyLPa8skCG4N8RGCmp7/IdO6hp?=
 =?us-ascii?Q?0Xu3wTpY8C/0RCjLa2jP0au7lzE5V7NOcUJtrEBOIPxj9qITXgllW68ZIsph?=
 =?us-ascii?Q?yc60V58uIaG1YHXbFv1dUo7Ofyu++w5N6NhQejwvvg2zY53pDKmiZGf5x8rF?=
 =?us-ascii?Q?bykdo+PKDdHc1yQYK5eQmPGv+jsJfRu27vYW48WbJOqdNO0xiJcQmjF1FWkM?=
 =?us-ascii?Q?AfRcepEVM9tnT2PVekLbGhB3nFrD7lmMo9OEpnl+DrUCNKy/qMdSBf1zDUIT?=
 =?us-ascii?Q?3v9s9owpl5CpNV88K0exUr6whH8oAIHeOTJ78Lnl43rXJvskk1xCkKkQsGwz?=
 =?us-ascii?Q?t0gmxRv7P1rerTTfdZQ0d4MhLtdeCTfaVxPOPagcrMaVM8CrvQiQB+Fp2tug?=
 =?us-ascii?Q?J3wIBWbkQMxpRQfQ5eAV5i9gYAnJTHaI/XUJvyhTfC5XLbb1BvjUjM++sVUd?=
 =?us-ascii?Q?bbn8OIQXhhuzf7Bk8lWePLhm8RiIndkQljSxrgqLMXOoRH18bmOT04Hwvezl?=
 =?us-ascii?Q?LGQmbc+FZ598/P7zFugJocfiuoqgJqYOt7B5WWwyFKlWMLip3bKwkoyUI81I?=
 =?us-ascii?Q?2Yx7akvHJbWcVBVsTMfPrbhlLsMhMcIxrw7imirqJYYDv2eZA2id3az34cp4?=
 =?us-ascii?Q?4y05OMeWH7bB+2NXFeAx0jyXWwTaaUKfpJRNPXYA4ce1nQO30kHp92k7rU8H?=
 =?us-ascii?Q?HIAFeUo5BFXlhXe1xYja0fxqNeDpATSpmuiz5oXtyzj8GJzSNIdydmW035sr?=
 =?us-ascii?Q?TICDHy6XFo9fc8LZPRh98J0D+70vDFuBpSM9JdTydvBy9uAg7k0zCRcJ5XN0?=
 =?us-ascii?Q?XX1cPXlk49EEp4VlIL8/6twZzDOMm54Z9TPK3oc2FGLUb2g51uxwYbzOkkJ+?=
 =?us-ascii?Q?O3V+7LxyORyOUjfkX4Ge6kUdKOwmd/r6OhxStcT3uy39rNNpqmdtyj3bvKMq?=
 =?us-ascii?Q?9nvFIRIYKvCPxcZMJaJrMDetJUY5qKWln2ddaeqk2Y0drnmLCmAWc2s8uQp1?=
 =?us-ascii?Q?TAYdRotdUQyS+nCboj9h8583OaCH270FAVJeIPDC3+nO2l7ROX/dXKz/M2FH?=
 =?us-ascii?Q?urfSnjeMSp8PXq69r+JUotg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f54616-0531-40a7-71c4-08dc749c6303
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 05:03:40.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvqV0UmXze7cD4bYtjJbJ2AliX2NA8H+d3GC6vTHuVkTUs4/vXRQg9ovvbmVrea3knjulyCyF8FnDtFHdzQTTZ5/EkT1ztqgQu56ZfpL7rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_220401_880429_A6FBC777 
X-CRM114-Status: GOOD (  10.71  )
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

Add DT binding documentation used by StarFive's
Starlink cache controller.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../cache/starfive,jh8100-starlink-cache.yaml | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml b/Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
new file mode 100644
index 000000000000..6d61098e388b
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/starfive,jh8100-starlink-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive StarLink Cache Controller
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description:
+  StarFive's StarLink Cache Controller manages the L3 cache shared between
+  clusters of CPU cores. The cache driver enables RISC-V non-standard cache
+  management as an alternative to instructions in the RISC-V Zicbom extension.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+# We need a select here so we don't match all nodes with 'cache'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - starfive,jh8100-starlink-cache
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh8100-starlink-cache
+      - const: cache
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - cache-block-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+
+examples:
+  - |
+      soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cache-controller@15000000 {
+          compatible = "starfive,jh8100-starlink-cache", "cache";
+          reg = <0x0 0x15000000 0x0 0x278>;
+          cache-block-size = <64>;
+          cache-level = <3>;
+          cache-sets = <8192>;
+          cache-size = <0x400000>;
+          cache-unified;
+        };
+      };
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
