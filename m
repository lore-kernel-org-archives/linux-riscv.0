Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BBCA5FE2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNCVWwZR+gQA02vfGf1BOvNgXbjd4dG2py7/HN981hk=; b=R2BWhd0HhIj8m0
	g8W1tzOOEhiU5c8NaRwmtNAdeMucXnPlXEM25z9F91ZmOHR0fqXl9bd29fwUrYm6m1qu0aemMLnNg
	72TrouvvsTbCggjX8XvrQjKRdFj57/H/JVzJG22WHOd99r1NPkB22Qx92VpUX9FdWayjLscemInYO
	0Py2zf2GIEqCg3C4/Oxqx7uxqopn2RxESDLzeGWwH9mTtT84d3h+vsseQu2Wd4L3IjO7JFDjjHe26
	THfeh+Rm9FwvJcmq82lYH7AbyROMHwMqPWgpFXeriDnOEeqMrxrOw19LHav73CTjvfTXVKEL/2pXw
	m1s4kzEez2zGmWzdUOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYY-0000000Bgha-060k;
	Fri, 02 Oct 2026 13:44:10 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYT-0000000Bgfb-2rUd
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 13:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfoDfPHt5YZQ9sDt5TFhI6djlgffMq6mofJ/Mjiw2+rZzp/FBqpzXlQNIbWjA7xoIu20nwKcoZle/F1OIQ1tHUptbbEx08oQG7NUa5yFQ8i3AhViKRH04UCHttQk912hFr/TV/dKADaUjBo6lC9WOmUVfG9P2PEiP25XoAhnw9xXsqnBxvYyOwjpcIgM0/hZviTcGnjXm/O5zjNFw/QDBLcttFWkSs15O/uE7fXxdfhh34TuUC9HthZ/7vw1yOsKZOoqJJTN1GZZGL3X6kFpVxtchGVkwPGdCjSiqvYFDpp93MF9WtE0ARZjdZp/uagqWz8PP3/JRETAf9/R1B3gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2Nl9vv+HdeF+Ugfcyo/DgjdlAoBl+ON+iDokH+QzyA=;
 b=hZYRYBesV8cEKy+PG8w7riOhCt9g109OMobdc4fApeRbTeCJ7jUWI1di+hbP86uhOrbjmdyX7Qepym/+B8LwKn4Q9FTLIX6oZFQ7DMU20sKSuN57TMiNqZTHc1+B11MFl9UHJXA2oUjOgOdDgEpNHMz97X1zFYUwostz6+TDSSvRs/F+aM8x/LesmYM2f8HQv2Vbyn3RdUwfLunlbYPpIlV2QJ5pyEOMu/iX38mneZ+Y/a1AxIrZn7ezn0qf4tblFNoQutbXX6s0gA7RV3MqZDtFZ+sgQJpB/o6fYCZaMUGzbCqIKS/pk36fUlyOtX5wXziTuy4o4ltGsKnOc1P+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=dabbelt.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2Nl9vv+HdeF+Ugfcyo/DgjdlAoBl+ON+iDokH+QzyA=;
 b=Ik3MIRlcxczlIZCgOZsJy3f7DLCWiU2QY8Q+OQBxT6ua8d2q2kMPQVQm3p7FeXmR4qmj3AyR6dZ7g1J5Yp1NX4PpIhQ2sE6eTHqhbJ1OgsOrFCrVX4gtDkuPrbe53SWfR+iqrrbbrhGuD6B2W+Ytpro4Zuhim8K16WawNM6pXWs=
Received: from MM0P280CA0072.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::30) by
 PR3PR02MB6170.eurprd02.prod.outlook.com (2603:10a6:102:63::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Fri, 2 Oct 2026 13:43:58 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:190:8:cafe::2b) by MM0P280CA0072.outlook.office365.com
 (2603:10a6:190:8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 13:43:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:43:57 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:51 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com [10.133.4.42])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1DD75121E;
	Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
	id 0B35B305D5A9; Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
Subject: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Date: Fri, 2 Oct 2026 15:43:32 +0200
Message-ID: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAS1v2oC/yXMQQ5EQBCF4atIrVXS1ZjBVcSiUTPKgklXE4m4u
 zaWX/Lef4CyF1aokwM8b6KyzBGUJtCPbv4yyhAN1tiXqajEj+w4BMUwUmENvp1xlJPNOiaIp5/
 nuPgHm/axrt3EfbgrcJ4XGnQKQnIAAAA=
X-Change-ID: 20260918-fix-dts-th1520-7a0a14123be1
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kanak Shilledar <kanak.shilledar@axis.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=wWoeQYvfHmNX/Ps/po+LEsDyPXVS+UCzajdGNoWYZdU=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsjav5WP5767pl28QH5Vx8xl5RJ7jxdxN554efu6jPDOV
 wkH9kkJd5SyMIhxMciKKbKcM9oevT/5n+4caadLMHNYmUCGMHBxCsBECq8x/DMv1vfdLNiu58S2
 PXeHluaLLdLqeQ15/cvTCj5HG2gJ/2Bk6FCYsaBxQqKCS9B7nvVBm3oWR0wJSWA2KWXeWK0338S
 GAQA=
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|PR3PR02MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d955bd6-05fc-4410-3165-08df208b357f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|56012099006|11063799006|10067099003|921020|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 99nEczohE6pbD7xcnZHi0rwJ2ho2vYWDlNl8H7LZYSC9PugD6GKyLZ6EOzf2EzMnCv/B41zdmr9iGuKDhUyUv+JL3r+Vp8B7MlvW3hizDcGMLeekMorR1f1ipkMvu4NpEUtD0DLSvzIjckHij80tRIkBz8/JsuP8IYaAaAwTrwEu7W9c5ZEVxOLvgXHq6v1G0CKwAfdoCjjDxQUGKG9jpdABmJHzfprM7YG1l/miVKRhn4Mpxq1GUfnxCQWOy2KNB7toPAfSEK6Y+jyw1xV70N2kPTSHdEGLcs/hHdUzRWQwdazCNSGlzPckA98xy/276pvdzcjNJ57WsgIHjiCXYfx1zDflncivq6CIHzIiiwGXHP8nvpCWn8xx+9LzlO5R3XmVtGghii6agLGtM2KlcbDN85dH3gv8G06LVgyC7MRYgeE9wJnpVZM9LP5K4zojM/SIypVB0UeccgQQIH5kVPPDZSzW6q9Gzynse3yTNI8ftLs95xhzfpQxqYuy5RF1MZafXZF8e7zcVdORijZ6yRrFAm90eLDsf7tS13z4/AVLvoChUJSmCncUheX4cI5vC9/QnWpGkK54SvLAm+xzpddV1IK+8k5qpW+4D4geVA+s4/eQQEgHNjUKsj2EKtzQNQxMxx6ta5uarHX10Ggd+UEl5rGtuLsE6tQMQs45yPAgbLviU2QsvsuDke/+7eEfet8+kXInt7lclFjA6pk0sSEdUxEKchT0JbJXqcTsu9iQQvS/dMpr/Bt63gAf12m9
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(921020)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OnzRiqxm7alGmEmmVOaJO5dAE+KOUk8k+t6sXhuLSinoRH5I9RccUbajkXniofX/LEJKmPHyRJ58aQI0lKDNSGHHjXPy2JWuZ11lepIo5XW44xnypZD8JffVYSTbD2V06+n/th2xFHA8fEr8WpcdwL9I9wr62U7BaRT5x/OP0w3abG+T0qkSEu5RMxN7+3u/tXLEVCoJtPWZvB1jluUut3DRMWvp/FQipxmip9u5XL05VoUuymFYAFRWWh8bM07hZoSkRDofPl3f0w5vQJYJMJgIkP8MGeM42ssoQXxdWrhBjPYlRWXf2yRJ1AHjZJzlpAdX8LLsMsaoB+Xv1Q6ekgdE0c1qDoFRPWasZOk7kxOAy6vwF1vvFNZoSCsFYQOlKWnpYmiFAdhuGdtQiRt2vXSuhDVHYZn7ZTL5bCeJDZxVvyNJhHBZceWXdM7uCYiZ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:43:57.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d955bd6-05fc-4410-3165-08df208b357f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_064405_750769_AD988905 
X-CRM114-Status: UNSURE (   7.76  )
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

Fix almost all warnings thrown by dt-check-style after krzk's updates
to the tool [1] when run under the strict mode. There are still a few
warnings remaining which are documented in the relevant commit message.
By doing this the files become easier to read and maintain.

After this patch series only the following warnings are thrown:

	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-order] child node 'oscillator' out of name order
	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-order] child node '32k-oscillator' out of name order
	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name] property name "snps,wr_osr_lmt" is using discouraged style
	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name] property name "snps,rd_osr_lmt" is using discouraged style
	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-order] child node 'aon' out of name order

These are left for future work as they create a very large diff.

[1] https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
Kanak Shilledar (4):
      riscv: dts: thead: beaglev-ahead: Cleanup with dt-check-style
      riscv: dts: thead: th1520: Cleanup with dt-check-style
      riscv: dts: th1520-lichee-module-4a: Cleanup with dt-check-style
      riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with dt-check-style

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 119 +++++++++++----------
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  56 +++++-----
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  90 ++++++++--------
 arch/riscv/boot/dts/thead/th1520.dtsi              | 108 ++++++++++++-------
 4 files changed, 208 insertions(+), 165 deletions(-)
---
base-commit: 3cc5a8e8ee39edbd9c918f12342c8fd4a177a47d
change-id: 20260918-fix-dts-th1520-7a0a14123be1

Best regards,
--  
Kanak Shilledar <kanak.shilledar@axis.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
