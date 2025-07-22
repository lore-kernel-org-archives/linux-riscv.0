Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E43C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KPja1ABhxtt0V9ogWItRcWhJKyY2FRxF+YWrrNV3biw=; b=tUGpCkZam05NMC
	CMyo3+IzCHVBzxyFpqATnqAXvRHgpqLSoEkr2uF5xF06zmk1ZhH9TBqxUG7IBbgdmop6b88omZfGQ
	3uWQG6Nc8zuwp+Tsb6BQxQEjnsJQu5M4uw4gTMcNJTD+3csuHDcTdLGB9SvNgr8cfHoxB/no41ZPx
	GCCb9GmYvLTYfBvaMGL3/URyfEZp8LtKuW93AXchGKTGUSKBr4k6VYSzrOtbWi3AIuJ9RIDjnu7c7
	GjRsHt0VQMn3/nG31fG7/5vdI5d6W1m5A58wU8FdxZ6n1QK+fU7sA332oTdGWzeT5VUXIbXCOdeLm
	nXkoDxAhVwyM+ZMHHfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Qr-00000001eIO-3fHc;
	Tue, 22 Jul 2025 07:29:01 +0000
Received: from mail-dm6nam11on20628.outbound.protection.outlook.com ([2a01:111:f403:2415::628] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Nw-00000001dYZ-0vTR
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:26:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXPxTFvdyZtQmSwhLO0vN0JlsuvlKNlYJxjacvmiCQjaJJ1WfF5CHRigf1fyZP1jcyEBVqpEFXllrMOd2Nywa4Hsl8kiLZjwgCdsig/ljKUeW5xVw9n0fEnJyzGdTd5G12qqd/Phl/70sc02bQoSV26uf3K40W2cUoCFbZ+cAqLmdzdl52UqblkT9/kh4ZDYUyYCEE2iGrnHSqpt7roBTEWsXFLswj/Zw7g/6S5HO6mczn9Dm1uqS3WreHTdecV2BTR2WqGbAj+gJk30xAXC1RyDmcMIgV8oil6c6jv5a5u7/7EQ9SldHLsEB5lGI1dlU34wnlMfc07jN5PO/pcxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4m973f87rAnFx+476yGwWLsRPKf/joapI8NGgSARr4=;
 b=yGjT8Hx1cIlVU1fm7/mzOn0NahXJTthqBoEnEVqx9jOk5Eb0aoqhN4UmhhG9S+9OXwsiIiudNnbtK4OqEVojs0SLyzKXATiadF9qocCgMlCqbWQCtLCy7nR60zL0YQfH79CM0GRQPjSFJk0LOTh3RV5Y6He7VCzr7UTrmPzV6BTyPVBwbaL6qGxVuh165ISM2mg0ZmsFY4c2UXlugU2TuWi/9QFAGo5V4p6P5mCvfqgx4jvL5MC1YKMunrVf3faXUdsfJ7esfyltcId/8aJCLDqOwhuwbzcAdkgZVE020dTrzX0wwMXQFrYK99/Sb66o+ELFZ+H4BH8lWn8DAXK6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4m973f87rAnFx+476yGwWLsRPKf/joapI8NGgSARr4=;
 b=0FAJ0XmKpRvVTtEDubSTb3EBWRu6RViP+ePf6yI2lo/bUcDPo//CBMPb1RcLf//MqZtileXvHVlHvvkqFYFSi9D+jzdS31QuHzRK/G5wu834ylWM/KdNj0h8aXSKxY3no+4VsLBHj6IhJ4mF1FXf6H5mwJLZmjYzW8FHVkVRxB4=
Received: from SA0PR11CA0086.namprd11.prod.outlook.com (2603:10b6:806:d2::31)
 by CY3PR12MB9702.namprd12.prod.outlook.com (2603:10b6:930:103::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 07:25:53 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::a2) by SA0PR11CA0086.outlook.office365.com
 (2603:10b6:806:d2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 07:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 07:25:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 02:25:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 02:25:49 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 02:25:49 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Conor
 Dooley" <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible
Date: Tue, 22 Jul 2025 09:25:40 +0200
Message-ID: <adf316c097ae416eb8565f2f1d67a98c413a71d2.1753169138.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=michal.simek@amd.com; h=from:subject:message-id; bh=Xuz2Ss+fAKb9JcXWY/ctb4XzXc/RczkVynZwN2Tt4uo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWTU23x7Nl98zUaLNXNUZ5wS0q2yfBzhJfLmwrycByu0r C+o+OWad5SyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEuksZ/mcqhsxwabosWPl3 Z0bjchVOVdVXyvMP96Rz6ZzvPbL1+W9Ghs29qU1fE96wSR7K0jt1WP5ef+/8G8fDdphPDnxQZij OzgsA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CY3PR12MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: eb20fe11-62c0-44e5-a361-08ddc8f0fe19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z3g0lleLBZlfPtEl8NPLh7Yq3vmEMu7tefM8iFNZDrUJTQ98tA8wCW1rZhI6?=
 =?us-ascii?Q?Tx1c+VEwyfN0r0knh053gR1L6DmORYIIt2uwoqco+xFk+in8EDaG4FgwI6bS?=
 =?us-ascii?Q?z3MdUdrDUpEtzca+BE9EzpExVvTL5V3i+i+BQu95dQD4lH5rLFQxIsvaNGlT?=
 =?us-ascii?Q?ikioKzz5JkiKp1jfAFNGhxlr8CrTTWiC00UW3fdtbT/SRzLKJ59gitarKsCz?=
 =?us-ascii?Q?SyBRNbOA+X6s0XiMppRb1BSLB4kahxcUwGD6UdAJCfjCa419YI3xHpW2adU9?=
 =?us-ascii?Q?fpeZh6Pv2GtMdJvkH1Rm1u00HX8lsUUeoiffc0UPkKIEqdQnoVBr/V6ktKQS?=
 =?us-ascii?Q?NgZiAfZ0vBaO1z4uuRNCrfuFKjLR4Xr6n9ZB0baT1rGMrh0eZJaIEwWHws4J?=
 =?us-ascii?Q?WtoLDbx2TLIkdxD2N6ypxIXwAAgvewwXJmuNl85MWY6UM6LepeTZkCwsu7Cs?=
 =?us-ascii?Q?KrpEMnylOfEmEylziLqLSjNyFfcA1LWOBDHb3dEPJLWTzfPR1iQpB8ZB9U8Y?=
 =?us-ascii?Q?0fmU8rzVaxijFM9B6JqKS7/p1w0btsxkfnAstnQiHoiF3O1ihqxsZ+XAf02T?=
 =?us-ascii?Q?nPpkbPEOO788AIRs+0V8BFT2AwfiJxGfTIRd3KGiRJuIndKrWqkOZQEQAG74?=
 =?us-ascii?Q?PfR4Rs/q/b8MbBEyU/DXUXr9TIUMlfcLxOOIZt3jBh68YJfgiBWoLplDFXuT?=
 =?us-ascii?Q?ksOjENX7fOhOEkcAI93Do8Vli7rv3QZ4QZ1sUA+bGsmZVBB0r00iquYCIkSI?=
 =?us-ascii?Q?AC/ReqwqFM1E56LlEMoIBdtT4O/7d4qK9H2tOiWTht7SpwTtxtEEAG9MHPWG?=
 =?us-ascii?Q?w5DHWaEFPEW2ibN8j1rKV8oJ5lOAIbZeUPJ2S/wLJBzaJu5dlPteNVq4EnbW?=
 =?us-ascii?Q?zo0rjH4+2GUaGUiYZza/L0tXCJ56Z6DwEDx3ajUekdrF6hkX88WYTsE0IPg0?=
 =?us-ascii?Q?k+/oIOS1+IxzK9+2ln006GCmNXgfAz51LNC1H06KoUSL/6QS7LECD26VzPHu?=
 =?us-ascii?Q?6byw6kCc+gcfTOiOJ8v6MTkFW0H2SpJbvHzrr+vFTyB/Ts/T2gne10vO92y8?=
 =?us-ascii?Q?qITAos3QeIycOJizNGI5KG3IcF3+v40Bqqfk3y+afhsLcFRPVcpFEwBBShpc?=
 =?us-ascii?Q?UNusbzEeLmQW/C9PymM0fhLn9OMDBiUreIYx0r2yWxGdtTapYpATvJnx0TJs?=
 =?us-ascii?Q?7MXCKVcX50Yai49+aQYphqH4gWkQI5nWL4iw+2FVJ/2o6KDSDUxa+7EmyvTK?=
 =?us-ascii?Q?cG9VreWOA6ENgP3CCWs7MuVtz6LqhF3T9kgFmH6AUVngjq1rHiaknyWidPPA?=
 =?us-ascii?Q?zPXj7Kv3kz+btSGDDF9jn/TjrAUirDrGNsZFB9aEgAIa6eWCshJJjiYSFxon?=
 =?us-ascii?Q?pjzE4tQqjjph8o0FbS42VMysan51PcxpIYMK6CrTliGiVTuZ0e8i/YKpGdb6?=
 =?us-ascii?Q?35WUrbTlq5cbJRFoajJeSM6Z8NmcaehosDbh0mR+2nGeWXjv7fHueU6ErLkz?=
 =?us-ascii?Q?ggLP4fahLM5muxeElXoqUgqt+J3XXQlT9g+q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:25:53.6628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb20fe11-62c0-44e5-a361-08ddc8f0fe19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002600_258515_F149CEDA 
X-CRM114-Status: UNSURE (   8.45  )
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

32bit version has been added by commit 4a6b93f56296 ("dt-bindings: riscv:
cpus: Add AMD MicroBlaze V compatible") but 64bit version also exists and
should be covered by binding too.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2c72f148a74b..1a0cf0702a45 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -45,6 +45,7 @@ properties:
       - items:
           - enum:
               - amd,mbv32
+              - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
               - sifive,bullet0
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
