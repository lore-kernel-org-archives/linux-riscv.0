Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17290C982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 07:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OkXsZzbUlVVSII6D/T9xSMePkPZrpgFwhl1KwMwL7k=; b=onGBiQGiOr2x1A
	ZMJMctRIBwgXsoGukhEJj5qT/1ozoswmuI90K5tBZ4X1aWrlOhsdB9k/fUSygGIBqrTvjNufUmu26
	izRmZM5hkYon+XPWUYufeUMJKA+mwy9L9Rlsr4EZ6uEIubvf+jYsyT21CpEzySVmxSqOfSAmsBVuf
	I/f1KCej2Fgwv1MC4gCDGWLsk/IiScJ+3vL0lthe+LXklKYc5j+PglXkqCevp9QHNcVoTjhqWtxvP
	4TKuji0LGWQe2JiSVwjtii67YeOMDf3z7qCY1g0h54pqewzncRZzoFnpJ0VtaM2HInx1e0loyDzUu
	qTj/Mx2bFkencajF73Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H0M-00000007L9I-2npe;
	Wed, 23 Sep 2026 07:02:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H0K-00000007L9A-1q5t
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/UlDXBLxWjvyMWFTheGIWipH7hoQETxDmaK/xojEU/w=; b=JUOPcqIS6EUnmiQsGuxPX9ewoe
	9yhBHmpA6+6I10JJCNs9SPKnaZCiYjCqVbueT7xDKGN4SskJWs27BRRrrEnq7K+D17Y2OMDzG37ZT
	EUiJvdg6/Pff1f9cWPnADIpYmxD0SDQRA+HuO1wxfKcQCMM78c0lZZWLvFYdiYlVrKrVFLvAAGRyQ
	ykB1GsflOpE0VTHZo1dM3V8EnNDWITxqE+agjJDxmFN4j5PQcmqv+mIsLR9r/n43dXXTj9lnRfWdP
	gH4VN+RQ+X4KKkzEr/RzSyFrT2pM/iqdMEHAS7dusildJgOvkmoikfrt7joxGWIfAPeVoNnWB5x0A
	AVHF2RTw==;
Received: from mail-sh0chn02on20705.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::705] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9H03-0000000ERow-0XoU
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 07:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZcYZGbvv5FYwlSCu4zg/LMqklcif8Z9LLnMKqQRotRhGODhpODskWklCqB40CyIdEA63cSPiwVizvyEmr6wyyeA2jc59fmR6QNprF1QIkV6psooxNgdf7PCbTn9GJ801sja5O7pL38p2cK9+xOrIgiCzmLseBAB0QydXX994StFLgkHbFv6vtFFAJ2+EyHSVjvu7GluiHqm3Oy1bsmXmb/mq4pr7fnl2y3NCSDSesKrc7mHloK5L7/2TWbKH3CFupV6EpP3pV8CHkzF+UySXmwkhDFIcVnIGj7aDsipB1hBdRKAkH4WCOsCo3WMtAzJv/F/8DeceAi2YaYZQMr/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UlDXBLxWjvyMWFTheGIWipH7hoQETxDmaK/xojEU/w=;
 b=GgnXDxHZHzaV+gBWEr7wRK9mxTr6qh70T9wivs/qv3oCs+C/Ro5+GUQ4mCVVwIyVBpEkCaejV8gZDiODUCiIRf0cfJR2DA2OGytfYHA38ifJB5UbszFTLTOFdLsgqpgPMermRdgb7Q7LexJrEgm375Zfokq8B0XOMP3CwQJoalLNShV2Lp1iRJ7/afJ12xOOy2ga2V+W/KNNZFBFkPfK6r2cBcULomZVxkr61zjDnA1Ffa8r0jacXfD++n21Pj39XG4jrRE/ppVPsp6SO7hCx1ND4lqpkI7F8c1Gyt7XNu1S8O/PQjIZI+f2ddWJ4yu14QMDxF6HHOUnAEIjhW2PoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:01:19 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 07:01:19 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service bindings
Date: Wed, 23 Sep 2026 15:00:12 +0800
Message-ID: <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::32) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: dc86d43c-6d95-4058-e93b-08df194077ca
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|52116014|13003099007|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: pifWkAyKEzBRvsHeBp1YcyMHcWDIBea/fpPI5d1HR0nb/yhYLvbvYRhtuYATVV3k9jgWhLPTwvZT88akQnBcgkcp3f0Gj7z6hplJm59YiA/LobIwdwfFvDx1C5ALfekXe3yaloAAPy7ZqMOUKW1CX3oGLvzLujrRukyIgrGnNUMpQwZqXUHHKvMePUKYrUi3ikDocFqBtrdG5bxBUXC5vdC9yMdFCPmnfCV5JBjYNEMz19wBuBmsOWDzWL1wESzjhTMVmLPI7c7PaWGUq/1s+ti6DsDc/punjaZZd6Wh7l0NYBrGk3zeZafkLGyB07Hv2yPxJyHGzPSFEZak/wE+pliAv/a1g+t/6MnDTzw37BXDtcSAQIILrsFxx3ZjZ/WThJVkRgVGn42mAoqXuP0ZpGharA2zEvrHu1Fr4BI4MSsNLs7NuBNdqfpPgklaRBotzVpSWARUkheEmM3sehhROnRvGyd+YK8TcTNrr5zsshg3LqkhhxK8+jA01P/iGkQlf1ShGKZJpXjrYtIrisIeggMH9vUTPDRMITLTXFrkwpusKDbCA6/KZ0tPs3Ax4NSjMzhkmU+u7BMkgSIuyElcCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(52116014)(13003099007)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8aTTbtl0Yxp0tWlqWyfOTyy4yLiaytqcs6VPixwl+i+RfSxxq9jfEnaMezs?=
 =?us-ascii?Q?Ffq7X387a9QpMUdTKUIVAlPYHeWfDVkDMaOZEW4wyw6kIuLo9CmaLaHOFB2M?=
 =?us-ascii?Q?+Cvtnejj3PhvOg4cUA26IcCWsiKOR6tj8sRglqGLeSrbbeSMZiZPtEFVYBq/?=
 =?us-ascii?Q?jXO6A6bsTEBSBfMmrRAgRE/J57ILua80PGkI4zeAmNgU11Eb5waFpoY0MiZH?=
 =?us-ascii?Q?Pf1dyE3ZcUM43Un7r02S+pfi9Km3shhPtJ6+uDVB7/3E526a1y0a6tzYPZIq?=
 =?us-ascii?Q?tS6LboOfyz1AQJJUznbl0WlWhXiB7PozMBvyqfhO4pOqENuNoUlHfupAwT7X?=
 =?us-ascii?Q?efH4UhpWsKmLQ2YdtFhVqI1raMJzU8/9VJ2I5tFtaMj69/9j5+XMF4uN1Fp/?=
 =?us-ascii?Q?w6RC0lEzJDNaej4371kFEvJpT4xlQ1EgPv3GhWEq78HKrszTYEe6XTE2hWVf?=
 =?us-ascii?Q?mvj/E3JpsPcDLBnKzJoEzr+RjdYeof5u4BZ2EecO2fAdlLtPMiB+yOV3J1NK?=
 =?us-ascii?Q?UluCQUDlpzkyxrC4A4/TOj3dKBNJ2sI69ffviaQHha57Yk25oP8D1S6mp1MI?=
 =?us-ascii?Q?2I5AoCNusKu8ICsEUOFzTl3sQiboBMY2QFPb89N0jgukl5Gxu+kasDfLLXHB?=
 =?us-ascii?Q?ir0CyM9km1qMyO+tlX8PTMyivk9eFxxF75ci6MDpp9mp1ZbrIF9ty/A2xcTS?=
 =?us-ascii?Q?zG8yzllXxI6uSYt+Av5ffyFmBK9DSBANeR+Ex5w3hQpTnlcDGupzsGHxC0wU?=
 =?us-ascii?Q?vVsV7mbGgQZLuZRclts9r+ROoNhkgpnJwVnvyGrghfy6dvpOakET6u4ncLTj?=
 =?us-ascii?Q?X+Zt0sLM8NF86o7KkUvdUwmCuGmVeOqiyF+nc6P8r9VpleV956+lgmOt/1l2?=
 =?us-ascii?Q?/wTwefspFEd/Eb0bc45nhsWqtepDGzvc16jWVz8yk0oglB9VGhW4NXKiCu24?=
 =?us-ascii?Q?gSd4/It9SCPo/GpoK3e2gAA1H6IBYa99m+xCkRMdstfReh6HNH+EkRegXyq+?=
 =?us-ascii?Q?W9Xj2g/Y9bAREiH/fIx62Ve3flFYvZPmKLb2nBlGq/KTBi6SFv1/uRWv5I3e?=
 =?us-ascii?Q?WdCAJ950jyk+Xao76hgSZD6V3wjRuD3i9XV2OHL87sjMIZXX7q+Bmcz2icnb?=
 =?us-ascii?Q?B63uLiLKembBeiZGrjEOTYjGFnf9K5ySWeAgRE/OLGOg0ECDprX6n0AZnHF+?=
 =?us-ascii?Q?RKokdVynrDFp8JHc7RnulAnSF5yer7HHX1ISN3AHyLLLybrFdt3Bc3gXvBJE?=
 =?us-ascii?Q?AXCaPb0e7zdD17oCHRt+pFjp/qmCEzqy8EFawxrVioyZp2KeRbmVxV5a2IaP?=
 =?us-ascii?Q?CFw1ABSe7vDbgLSUkjHjgh19TD7YCiKJpwPR03cxG0Kvlgesu91UrMbXoCH5?=
 =?us-ascii?Q?N5cA51+h+T21Lih8zQE6H2UPSlb77S3RpYlnMxF183RWgJIHpZnMf96daOI6?=
 =?us-ascii?Q?HLMe18d0XrrnpFjw2u9+jj2uBdvZnDmE9G4+n5gw4GkXuGx/YamdB69Yw/fz?=
 =?us-ascii?Q?g2MCWpF7Xvu5uVHv818q7Q0M1YjGjdrxPWqSAcoHNhPWwvyiK8U8gimF9uUx?=
 =?us-ascii?Q?VjsAi17eMs0SqUA/661O9sdALaPcFF/RQH+HVme1TVzINUo8bw2L1AOwij9i?=
 =?us-ascii?Q?C2rZWyeu5YPqjuvmRARH6wMaUbIzOeU5VTHI7OsZURRurd3t6o2XjVnPR0O7?=
 =?us-ascii?Q?6oc8bt8JlvYIarPLSvfcjvZC6+edHedSEbr6JFK4DiIm7aaZ88UvPMWLYbCh?=
 =?us-ascii?Q?uds9i/uxWMrAij01JAAXXkPhPkKOo3Q=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc86d43c-6d95-4058-e93b-08df194077ca
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:01:19.1228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn6rgT4hIExpZZ68rcVYV7abO6wc3G+D57uGr63H+bxVNizZ74U1NXYKUALtUoAB4kKpN/Cz+VtTnxF+0c6EBokR9BTBUXIGxaTrCMN12bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_080251_375124_EF472BDB 
X-CRM114-Status: GOOD (  16.31  )
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

Add device tree bindings for the RISC-V Platform Management Interface
(RPMI) voltage service group, both for the supervisor-facing regulator
controller and for the SBI MPXY channel which the SBI implementation
uses to expose the service group.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 ++++++++
 .../regulator/riscv,rpmi-voltage.yaml         | 147 ++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml

diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
new file mode 100644
index 000000000000..8cc53879cdf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/riscv,rpmi-mpxy-voltage.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI voltage service group based message proxy
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines voltage service group for accessing
+  and controlling the voltage domains managed by a platform
+  microcontroller. The SBI implementation (machine mode firmware or
+  hypervisor) can implement an SBI MPXY channel to allow RPMI voltage
+  service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-voltage
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    voltage-service {
+        compatible = "riscv,rpmi-mpxy-voltage";
+        mboxes = <&rpmi_shmem_mbox 0x7>;
+        riscv,sbi-mpxy-channel-id = <0x1004>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
new file mode 100644
index 000000000000..6334ebd31dc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/riscv,rpmi-voltage.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI voltage service group based regulator controller
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines voltage service group for accessing
+  and controlling the voltage domains managed by a platform
+  microcontroller. The supervisor software can access RPMI voltage
+  service group via SBI MPXY channel or some dedicated supervisor-mode
+  RPMI transport.
+
+  The voltage domains are discovered at runtime from the platform
+  microcontroller, which reports the name, the level format, the supported
+  levels and the always-on capability of each one, so none of that is
+  described here.
+
+  A consumer names a domain in one of two ways. The first is through a
+  "<name>-supply" phandle to a child of the optional "regulators" container,
+  whose "reg" is the domain's RPMI DOMAIN_ID. The second needs no child with
+  "#voltage-domain-cells" on the provider, a consumer lists
+  "voltage-domains = <&provider DOMAIN_ID>" and names each entry in
+  "voltage-domain-names", the way it names a voltage power domain. Both
+  properties belong to the consumer, so a consumer binding describes them
+  itself:
+
+    codec {
+            compatible = "vendor,codec";
+            vdd-supply = <&volt2_reg>;
+    };
+
+    phy {
+            compatible = "vendor,phy";
+            voltage-domains = <&rpmi_voltage 3>, <&rpmi_voltage 4>;
+            voltage-domain-names = "vdda", "vddio";
+    };
+
+  A child may also say what the board permits the rail to supply, which the
+  platform microcontroller has no way to express. A child that gives no
+  voltage constraint leaves the rail free to move within the levels the
+  domain advertises.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-voltage
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#voltage-domain-cells":
+    const: 1
+    description:
+      Lets a consumer name a domain by its RPMI DOMAIN_ID, the single cell of
+      a "voltage-domains" entry, without a child node for the domain.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      Optional container giving discovered domains a node of their own, for
+      consumers to reference and for board level constraints.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^regulator@[0-9a-f]+$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+            description:
+              RPMI DOMAIN_ID of the voltage domain this node describes.
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi_voltage: rpmi-voltage {
+        compatible = "riscv,rpmi-voltage";
+        mboxes = <&mpxy_mbox 0x1004 0x0>;
+        #voltage-domain-cells = <1>;
+
+        regulators {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            // A node only so that a consumer can name the domain with a
+            // "<name>-supply". Its voltage stays free to move within the
+            // advertised levels.
+            volt1_reg: regulator@1 {
+                reg = <1>;
+            };
+
+            // A board level constraint. Equal bounds pin the rail, so the
+            // supervisor applies 1.8V and refuses to move it afterwards.
+            volt2_reg: regulator@2 {
+                reg = <2>;
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+            };
+        };
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
