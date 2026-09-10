Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18FC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6GNHChqKFT7VWzTXUqsPlTvHRFn3kTPfbXCJ7LSb4k=; b=xKoPZ7rm4mZJTH
	hmcdSQv3GrXMVn6LZ6rngs1JZbt6Uq2R6fErqOJMSZcpy/KPIDJlGEp19xLkwDWS93YKKSDcUHp2G
	ViyX/U7E2806ypFQ3+Rx33FGSL3uCEVcLus6Fev/UuDRXQsQ3mhjBaLdgI/6okw8Iz0/UKbzKL0fz
	gI/5oALjVRnZ3Hwn3CWr35PQnNuPszAfVEKhjdr5S/SGcgN9Yw646nL9kdWJp86CU3X8/ymD9W7OJ
	ldDD/9hMlAs7oVDGZ2lGyMUJMDAT+SxUhmYhTTX9JBdtC/iqBkxBdRFsTpXWHHhaFw1LWDj6MVttV
	nCsIgGwJaVMrfo1wrDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4be7-0000000Dy54-0pVg;
	Thu, 10 Sep 2026 10:04:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4be5-0000000Dy49-3kg5
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 10:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=; b=n3XDgGKQde5Z7LOf9pHAcQ7Hj3
	WYd/Wuxjq5bDx5k9L9fSNr7Uv7ztDRqIBeEzM76SfSO+r41IK4oBmCzGnXhaTBep2wxFXUiTrJ4TT
	3+0ZgJZ12M/JkHlZiz+zNTeB7/uJls1rDqY9FBB5hG9tuStPOPz4Wsbof6RMuLCcoAVVuol+ikctp
	En5tNGBK+S6JrVnl3ngblzaMervkdrHVcgP/3yhpejm/Uf7w0FX8TTJ7vTlqrJV8jyRtUH4J7f/Ss
	KjDqMqL9OQ4mc/W53LV3Q+A4xxE7DZ2VpohugbQUzvtkZYvJvtqD2bw4scGX3QWUd+l1y1GGpfvU6
	g+lvBTBw==;
Received: from mail-bjschn02on2107.outbound.protection.partner.outlook.cn ([139.219.17.107] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4be1-00000002IW4-2YPH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 10:04:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh6rJrCBUzMZoVuNUkkmTI6T4D02XteZQ9/MjX6yFrVnF/xojUj+MGZ56r7z1x8Tbs2AoJLmAboUjXiN01TzNrNr5UF6AW92LB8Q0lTZjYtEKwIVqr+Hdes6VUfRwiSNjwyFWdQThwzevAioCQcqHTqDlavrnvrmooOMD4yCfpwR2uewScYjCaGvekr+eiXbdvLomYoK7x3FY3rX9h6aGEAQD+WB7D0y+MwM+L7797cs5ovaJb0h5T3gFvJ+8R1VtkMCajvj5Y8qtb39gXG3mVgTrNjOgVCBMkXkxqOmfGU4FHhFVjzFCQcJDzcH19R90yfNkq1XvvagxMnLpICklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsTRBD5By9lnAKnAtnF+WiK4mH+R20oalbMwPvliys=;
 b=YvavI5N/6R8wm8LK5J/v4en43l1gQLVY2GzXUyhMxJfyLWshbtYGlJa02kfGe74CDRnqkIOgNbb4iLegW+ocx9N7Xl/fHzHGSPNRp8gupOWFuKaMgK46uGwJQa9D6mN1qaH7lf05zUAPw5HC4piIH/DiYDScq8nIbAIF7OZiL+cJLhHUDzVTQNMuU7QAcZBiDReNfDuzk/27cRWhYLYF+dXcCkuc40CEtIkCygZUo8ONe9E9ghW1C/zPpUaKxJ6LoF4rxIYm/bi6f5vTftOpnb31gD1/MvgMFk6WEh0fQqvynCmTIErlSPBKBmRb2dRNDY8AgPxuVC70iJrYEH7oIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:10 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v8 01/22] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Thu, 10 Sep 2026 03:03:36 -0700
Message-Id: <20260910100357.130134-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ba223d-09c8-4a98-2930-08df0f22dbe9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: ujJq2Q+4A9nGJZfBPUv7+TyFXT7Ts2i4vTQC6YGh0XMUplt+dxXr+r16wewEYh5Un0mmig1TO2AnpNOQykacZ22ggGc8qaCbQz1/RWX6Xeh5J8utyi7/pBgqMmHtUgc/T/NFV4Am85ipUjd6qVvGqS0mjegR+5mQh5U5a4t165qQW5nKKQDZTQf+XDHfulP1V91tSxphSKqJgtkxwBokJVqmQHwFkGkggtU6E9/g6vTcEIZDg4nFBU4uU3T0q0xJwS/3f8a6KfFZTGtjfHGZ7qbP+lDQ707bLPxDbIqytCCS+Dbt4MKQEysN+4WWY3UeYJ77UdF29EOXu90lxeScGlwc+wY3/xbkjBm81bfsB7ns+RSwrkEWVRAuptpo52qSAOrgxEFSyOQvSilRig+/wnCwzlzWrAJnjj7JYXPyUM7AN5JpxAj2wfHafBNV+UBkPSPe4Ij9rQKyE3oqWuZM/Ew0XJmGPhbufFEn6LY18U/24FmOOv5VlWrcvC2OHjgnn3ZsKFmevoDl6Rhnl36qSsoVZ9xagFUXwYMfUbTyKEA4l3R7vtVvxhHlya43FK9i3KVfOreUNbSeLXimd/mPSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MSAIJp8yWxi3MieUL97WK77pOUkFo/GkER8mYx65lb+bWwlKGD9acE3P5fWP?=
 =?us-ascii?Q?kHfgE4kQq4tNCrFWKYO7mzzWEXHa3tKXJztrQLr5MB8M6omnayXK1gyrIA9W?=
 =?us-ascii?Q?CS736AlSf2oscGi1hiP1vjkIUDhi+Y3a0HoCNGl3dPv69klWtfJw97FjFojZ?=
 =?us-ascii?Q?cWALIoX7AZH6bFwbBsf48RC8uDD/Hnx/jrezu6GTQLYFYKKTSWJgl67D87gI?=
 =?us-ascii?Q?t9a4GHaVklStSKLqO3sb2KkTxemdQNo0zssTqZIQ+qLHH2Q2Ig+XK4XzOoUw?=
 =?us-ascii?Q?5ACQQIP3rNnzlClTW4nMxmj86LS4yFiYNTpXgJ5jDmPrWb/29x6NXo3QrJ/H?=
 =?us-ascii?Q?pOvyLBD03JUVKF723IvOxEElGdgorxZ8F+sgacExPjQNx1CcZTL1igCnhQG+?=
 =?us-ascii?Q?/egVStoqKkOFk7fDX/bgTi5OM6em8YMm4J7TFg7biLzpaj4xbCb2KTCbmDCy?=
 =?us-ascii?Q?w3zzOWGsRmSPjCi9bUbK67++vCfZ0YSeuqisSvH1T1xP1jLLvduF71kPvET5?=
 =?us-ascii?Q?AqQd8GIAKkhaAX2/QkVn6gCzWsvwL3o7zbpQFZ1+I1iNhVCAXx0QFqVMc+lD?=
 =?us-ascii?Q?mcS+j3sZkzR4a4tQ8frQp3gvQe2I0FgRCixU5QH/OWjD1DQ1Ras+NLbedCRg?=
 =?us-ascii?Q?vTAI4HSH4ykFO+MSe7OL78Wl5Y2B5gIBqcn9BUylEbcqIzETmaHiTyZZq2K9?=
 =?us-ascii?Q?eR5dO2RIVVLTU4+2OuTfn7JnJdlhKyx/dtc/+SZFIQd2iY0P0yWxskLfw4Az?=
 =?us-ascii?Q?7tQUXTe+KtVDKtgfmrg3FdHAwXAF070bCWrmxabixiHq0R0zQaGZC2bj2ZHE?=
 =?us-ascii?Q?mggjWc33QuoXrD2by4XqQjN8R8uiLlTt3PPcILfyn6bj2kR9dUcLiDJKgb9V?=
 =?us-ascii?Q?FPm5ulwyMUDDBq72UzI7E1JQDMet99mf+CaCekiUgMtyVYFTxPci28XqqxlU?=
 =?us-ascii?Q?A+pnjo6S9melETv5mXnC/wNyIQOHTnfMY3fV8lREAx+0xN1OfegwwKKLVMCf?=
 =?us-ascii?Q?JeD5DUWc/WTjcZb6PfcPWJ8CpMtXfO75G3hMg/U+VOnufdHZNhYbh86N0kJm?=
 =?us-ascii?Q?Ii1WlxT6XY5oIyO279lNg5kSGYuZ/oy3dTlVPu8CZK8N+J2HA7MNzOJ/Emx8?=
 =?us-ascii?Q?tqEHU8ucP7T//0evw1dik909W3iYBwMCD3MZbZOsCsyUMwRGiPRWIPbip4ai?=
 =?us-ascii?Q?wqft5hNgev9kgn/vdns7WmEpK5T+aPZmAgPMFJTk6fih0pHzhsbXr9KRQf0m?=
 =?us-ascii?Q?ndhjxkZ4izBCTPi0KhoGN1XKn7SGqfE93rdqwjgduNqFRCU/YxdbjyFsiQJT?=
 =?us-ascii?Q?VmWbdiZ5yzxa78eE0+Bx0hFkjhyzri2JQpOAiL/k3Ml5eSvuoQItMWAXUsi7?=
 =?us-ascii?Q?H5OXC/X72hgEJLQQRNvzYREY8WVdAx0P2HIep1jdLMoys2DakITKU3yqBxEX?=
 =?us-ascii?Q?tnClJSHFsglQwS7rF3wEKmtyPphEEJevUJ13IyV4MSqxqsnBIqJq7ncm+xFm?=
 =?us-ascii?Q?qG2Ni1AKMNOuJg7UkTySV3zsbptfAFKoU9YqottJNvYvHr/Ip/zRosy6mHGt?=
 =?us-ascii?Q?OFWSs+xhkrHkL3XVCnomo68AFu3BI16lj2mpX7S5Vwtl6unbWt9KsgaNYwek?=
 =?us-ascii?Q?drlEaysEXy30Nk0279JgOu7a7uczaak4rQ7PFS2S5tGWlL4hqZdttI+W5tlT?=
 =?us-ascii?Q?fwLQGSKUcaDMtbp1znnQ/yxk3U/He+XG1ERV4c/qfWN1BVZpYI0l2aVpuQ7p?=
 =?us-ascii?Q?sfkrUTS7twhd8AhZvAAYeQzeEM1C1rdzDb5Ny90gSrMULvRkofHG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ba223d-09c8-4a98-2930-08df0f22dbe9
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:10.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ym1LZ5LmGbRpQRcCaPgp1natmc/BB9xQueDxLD6VFmRWO9cHfbJcOMcpKuWwXAJ0QGX/uLk1FEG/VRsDXkNRcUG93wzAS0xz4PFr4uA0oo37RmKYfslVkbubuJrrBCcF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_110437_816695_CC0A5E52 
X-CRM114-Status: UNSURE (   8.97  )
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

The StarFive JHB100 SoC hardware supports debounce time configuration
with nanosecond granularity. The existing 'input-debounce' property
uses microseconds, which is insufficient to accurately represent the
hardware's finer timing steps.

Add the property 'input-debounce-ns' to specify debounce time in
nanoseconds as an alternative to the existing 'input-debounce' which
uses microseconds. Make the new property unavailable when the existing
property 'input-debounce' is selected to prevent conflicting definitions.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 97dbce8a261f..17a6270dce31 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -104,6 +104,10 @@ properties:
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
+  input-debounce-ns:
+    description: Takes the debounce time in nsec as argument or 0 to disable
+      debouncing
+
   power-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: select between different power supplies
@@ -214,6 +218,13 @@ allOf:
         input-schmitt-enable: false
         input-schmitt-microvolt: false
 
+  - if:
+      required:
+        - input-debounce
+    then:
+      properties:
+        input-debounce-ns: false
+
   - if:
       required:
         - drive-strength
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
