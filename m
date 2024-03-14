Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2E7C54E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1huGF42X7ZmAt8PpVdg618fFBuwqk9VCdrDCjhQF274=; b=sxXap5cqUOH+A3
	kNDy671Bs/xJ6HxGb7UckFJH1NfelMOhwXvCpYH4CUalvaef5bNaEDWVGy+79ya1rfDOse7ia397X
	ETcx47F7ECSgeIm5z/A+K7DAtDWvMRZPzr3hqGuiKhNxfbc0QiWRRAOsIhXETKAcLczt8Xza1UJS4
	sJ0ZpUZ8pw6Kl+yIyx9H0Mui1yZNnkvoH8uEJnKHrPBNVcGs+blwsvpKUulDTkulqcL84RoyHVYlo
	M5C93IwI1W8qIBw+ONKItZkL9arpHRyVlKuz/dcpqvw9+/8ar8bok6UcfcjSA5/+zyEhOeWa/5zbV
	PlxiIIaTVuTYUt7wVuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeKh-0000000DBgG-2UfW;
	Thu, 14 Mar 2024 06:12:51 +0000
Received: from mail-bjschn02on2071a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeKe-0000000DBct-1ndG
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 06:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKEgXBP5U44G1klIsXyjdwOztF6KhUWyMtf+H7tiessRUYVXFR7ZeRrk6VtV6uzx9Sqh9vKN3U+bjiysJcx4H2Ekp1uvr3CtbMsAbdQ5KTN45R3OduFtfH7j1poW/jm2THrWZX8Pj63tQlOg6fEyKGxzR6b19VFHXH84CED+p48uqry/httILezl7aWf7/97ar+AiDJ7r/NUZIMTMBfhv/7ZbgtJN+T5a9mo0SaGzmAQU4DxQolt1ii6MkyACp12Klf1vU8XK26Bdl8ziu+eHRPe3YXiM7tuvwEDy0ItXE0zrbjIwMPW5MysBW9PWDX3EuTOxSh1/O+7jw9NHDrQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Up0MHIoIRu+8GF/6KPeb8yOAl80wqLgHl0l3i4nGxQ=;
 b=YFf3G8PwSLyEdXobOE3GpP8odhTUJOR1YpnnRsvun/UWUXOJGvKrUuSgRuVrqSMtw0M13Ztcz2p6Ac8iqGDsx+3hcgTKUErVzgxgzBcyzEDNwLM8WUrtMjDILM5YM9MX9JSEIvT0X31Ksz+I5FobK1KdzlEY/i52yOS4H0BQTMHhugKX0mhlLvTnXZlewpGETZtSpH1s+I5UkGHoECgXZYn9/YvEPYps97BmX0nUTRHc53zHwK7HCtDFordHkD/JoJWK4jroR0vME7u3aLBLQbgKj7niWqcSPk9O/zrx46Tw5SX6X3xUPneMvU1r2EIEh4xeAwz/hnlKr+aAsvhiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0711.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Thu, 14 Mar
 2024 06:12:40 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::a038:3f49:b470:9207]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::a038:3f49:b470:9207%4])
 with mapi id 15.20.7386.017; Thu, 14 Mar 2024 06:12:40 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert+renesas@glider.be,
	joshua.yeong@starfivetech.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	conor.dooley@microchip.com,
	alexghiti@rivosinc.com,
	evan@rivosinc.com,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	guoren@kernel.org,
	uwu@icenowy.me,
	jszhang@kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: cache: Add docs for StarFive StarLink-500 cache controller
Date: Thu, 14 Mar 2024 14:12:05 +0800
Message-Id: <20240314061205.26143-5-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::9) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0711:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fab0cb1-e899-42b8-9c16-08dc43edc0bf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5p72sJLznyvOW6snsHQh0uS2Qai/xWwik8ScFehXVeOmeaFLdSqP0Kn9aFj+4Ihqur+4tSIJbicZAsewWanE5rVa2rD1ut4t7RY53BT43tr06BdhzgYTV9cikmn5qrVmRLNzYPqnDraC6s+bVf+PmwxBlHq8oKMdVztYlEFGWJ/JLKL/GLhy2UekIPDJwP4RiK39StwbrqBxnTTjGbN7iqPCqulhH2so8LIV4EL3pDUsF6Hul8PDRere9J5vsbqiVxE2icGo2sgMWjj9c07aEcKnvPDEWaYHjweOEAnqZHZZncor+Ei/mrjqYe+ju/KoOwwkUxld9hTLRq0t/6pseSDzEEmK56Pv/iYe6+EP68VRwd4eOPQJD4BRphKqjBBVBZU6k2B0R05zL4TX8ShDqE27toiqwrM3+DJRIaEswygGPdCZCoc73q9pmy7/YeYsH1+5ck/Te0WAZbE67zKj9p5OcgpCSrVpZIjeOcwdH+ZFzpqlFGI7gTgBSMRNmikUkYlN+1FAUWGG6gbkG5SPosgOc7dJIT9zOAPPEl3TxTYHFCqsHq6ZJNY+YLkuZZuAC4IkUSFYJekuXDNOFNbAwUvbsN09i9ibh3LytFcZ4Mm9cdEIz9eLk0zxg20ZSxHZcsLe8qy6TJRRS2Yx930bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34hi1Cgbk+6sYQRCMq+88NitFUNkqH/fLyzIlh5aizAYcoqcLe0W6Chs8zPD?=
 =?us-ascii?Q?6FCUQ7qsNjbg5o2FT28aOGPxZUW8Sf3RHJbYVZRSkSXCucFl7L2ekN+pzj5T?=
 =?us-ascii?Q?AwTjnTb1Qyyc6WdrSdHR6KKfHxsJZfhHC+4TLUqjZODPXbNbnn0TPxdaYfGF?=
 =?us-ascii?Q?XoQkkOgEC7N1fsumU9idA6Kc/Qtky2jFNOb2Vc6XCiwiiN2/5J/BNiWtGb3f?=
 =?us-ascii?Q?d5hBb/D7Xim8w+qsW+7fdZZ4xQuvM2JNOlGKnLvMfUusAfnwn5WfzvyYn7Yv?=
 =?us-ascii?Q?deYNuZSg+YB2EFO7mTnizwjX90gjBQMx0O9I/GR2sp9KJfjqev6qHq07Ol1s?=
 =?us-ascii?Q?mDxcAcbfJ2/cIHcrB/y0Sj9bykJZoDtCcTAt+5RJfTCaYYGCKjTN1ABqu55t?=
 =?us-ascii?Q?hO7hVMgFC2E1GFdp2AIXqIylVLlYPNvSertukSBwT9FpsrkSc93a0DyFgHwV?=
 =?us-ascii?Q?mzP2VU+1XukpAwJlsIbdVT+z0eqXHILaUsWVKhhFJdw8cWh407WImJwdTxzy?=
 =?us-ascii?Q?sejDny6CT/7VhfYrdOhRi8n4ElS6bvE0fvNQtZFZpOjRcsBvSL4qbvbMA/H0?=
 =?us-ascii?Q?0gjLMXA/tIwR79R0l1e8rtBAmTVXTQRdzEUHaHvd9uI7pbwG1p2Tc1R8rxoU?=
 =?us-ascii?Q?rn50qSYNW8HbF1ujW8iXDOLt2BWKUm381dJUlA0+n6RiNTm4G/zba5YvJ/4u?=
 =?us-ascii?Q?sAmPM+/ExQdkKSltf04jQn0TQPS13JBupe7CUmfiaAar5LsohT5dAXiSHwXn?=
 =?us-ascii?Q?tmyWvw7FPx8noURlv+sWrcHgi0joz8TsRf/i0EAqKN2z0BSNLiHo9ELvRhRh?=
 =?us-ascii?Q?3jpXyYISD9By9w9AcWapSzssF0/zfn4AuQYSNJPtqm41eUFY11QHLsLZMuGP?=
 =?us-ascii?Q?zEABA98xE3iplrGrQPh0n9d3i4jN0c6mV4H8vKtjsNdY2k5fCI3+X8iuPJgO?=
 =?us-ascii?Q?GAuJQ69WM1GxnKSmdA0aL1pTD2iR3SMFLsnjwX5fJApNyLqB6FFl81cOtWob?=
 =?us-ascii?Q?47ipKuNI9BP8bUTfZXAMBB5W9uZpTj0rIDjYqohsgp5/azykuCNP1YA1ub+P?=
 =?us-ascii?Q?ROJ/Pa/62TVkaxtEP7a0kneZQpkxWFek4zL6ZyI1dxf6oCC6qQC9kqvi5SVH?=
 =?us-ascii?Q?AxU2lA/G/nzxnWEo38lcAiSU1fZ4C6xmdyM+IMGMvBexJwZ9zAsfGUffsI6g?=
 =?us-ascii?Q?87eh+Lmel1AW8Dz2frY48D7kHcJsLZgXQjwPUDM+O0inL08YDSD5iLzRYOe6?=
 =?us-ascii?Q?2oYkVmgKMQsvQ0nw9KaOiUaL05vGtQaUagNc/H0eMY5o1Cjlgq8gSUw/RLmQ?=
 =?us-ascii?Q?b491oHAyUjBSot/9o3SZAceo/UUE++6FTG28+ZjKbUIegVGz/LYmhHGfuLd9?=
 =?us-ascii?Q?dLIa/mCcouVxQWDeCVmQ4gMek3J47pc5PNuni/OZ1Q6NBruhg3HLHw1DFVGG?=
 =?us-ascii?Q?BRGkZN7sy1oMmHmI7+3LYfZRR41sjkb1QOsJNxUE2SCirteG3rfW91YB0HDe?=
 =?us-ascii?Q?Y6l5sNCmrBVz03vBxujbT0UEWYafPBhDSOniEY1PdmSlXb6G378YzxduH/7m?=
 =?us-ascii?Q?rM2WGwVaaEVFMtXMa2AOs42Bv5/x5d+87bqoFOFBqOixg6WBtYjpKHJ6RxuG?=
 =?us-ascii?Q?l6bxLlSTdY0YbhItVz1576Q=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fab0cb1-e899-42b8-9c16-08dc43edc0bf
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 06:12:40.1001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIOSGwWNTfBIgfRGjPU18uo2XvJ0O/tiNAXOa/XkVsoV75woDK3C5ZEb2S+Azjj/X41VWWuasbUEJTDg5iR0bFGU3c4Zu8Y1iF+3gJ07SzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_231248_498043_6114149D 
X-CRM114-Status: GOOD (  11.23  )
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
Starlink-500 cache controller.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 .../cache/starfive,starlink-500-cache.yaml    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml b/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml
new file mode 100644
index 000000000000..97ddf7db39e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/starfive,starlink-500-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive StarLink-500 Cache Controller
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description:
+  StarFive's StarLink-500 controller manages cache shared between clusters of
+  CPU cores. The cache driver provides mechanism to perform invalidate and write
+  back functionality to the shared memory.
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
+          - starfive,starlink-500-cache
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: starfive,starlink-500-cache
+      - const: cache
+
+  reg:
+    maxItems: 1
+
+  cache-size: true
+  cache-sets: true
+  cache-block-size: true
+  cache-level: true
+  cache-unified: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+      cache-controller@15000000 {
+        compatible = "starfive,starlink-500-cache", "cache";
+        reg = <0x15000000 0x278>;
+        cache-block-size = <64>;
+        cache-level = <3>;
+        cache-sets = <8192>;
+        cache-size = <0x400000>;
+        cache-unified;
+      };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
