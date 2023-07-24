Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC123EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 05:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QYL8qrk6uaCmuI4/G0h4fLtWISwZWPeLUiZ6fe/qDiM=; b=Pykjok6MXWiIEq
	QIYw24BveaYhHUB5MrfVRhMt/9fgJbAA/phO+iPLNf1nrCEm2uSzo2nnCYo5eX/RJw6yS+8howGj0
	Sc6JwM67WJut7SJFX5Ge/ajoZEAfR4Gx1ZukappbPt4tF+idswLa86ctiK5wCNKU/4GZ20Hqow/GD
	t9G+vUOM1HVWTh2iNjARIgzmgm+KfBfCR4aMjZ4eIXE80ggvm+JXu186jRzMfZYuEO0pe1cZAi0+n
	4NXvqtajnfwGRFTVI05ApsgT+cAZIgasfoijFhS1Uj1iFZqcBjl3oPownjrMl6qNNbB4mCigREX4h
	OO0Wlq8RhedwsHyjrcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNobd-002txo-18;
	Mon, 24 Jul 2023 05:59:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNobX-002tv0-0A
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 05:59:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DAA2D80A8;
	Mon, 24 Jul 2023 13:58:46 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 13:58:47 +0800
Received: from localhost.localdomain (183.27.99.135) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 13:58:46 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt
	<palmer@dabbelt.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v1] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT resets support
Date: Mon, 24 Jul 2023 13:54:40 +0800
Message-ID: <20230724055440.100947-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_225935_295908_58983E8B 
X-CRM114-Status: GOOD (  11.49  )
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

Add new struct members and auxiliary_device_id of resets to support
System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
JH7110 SoC.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---

Hi Stephen,

I found that the PR sent by conor was missing this STG/ISP/VOUT
resets patch:
https://lore.kernel.org/all/20230719-trough-frisk-40b92acb485a@spud/

I resend this patch to make the CRG drivers completed.

Thanks,
Xingyu Wu

---
 .../reset/starfive/reset-starfive-jh7110.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 2d26ae95c8cc..29a43f0f2ad6 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -31,6 +31,24 @@ static const struct jh7110_reset_info jh7110_aon_info = {
 	.status_offset = 0x3C,
 };
 
+static const struct jh7110_reset_info jh7110_stg_info = {
+	.nr_resets = JH7110_STGRST_END,
+	.assert_offset = 0x74,
+	.status_offset = 0x78,
+};
+
+static const struct jh7110_reset_info jh7110_isp_info = {
+	.nr_resets = JH7110_ISPRST_END,
+	.assert_offset = 0x38,
+	.status_offset = 0x3C,
+};
+
+static const struct jh7110_reset_info jh7110_vout_info = {
+	.nr_resets = JH7110_VOUTRST_END,
+	.assert_offset = 0x48,
+	.status_offset = 0x4C,
+};
+
 static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -58,6 +76,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
 		.name = "clk_starfive_jh7110_sys.rst-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
+	{
+		.name = "clk_starfive_jh7110_sys.rst-stg",
+		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
+	},
+	{
+		.name = "clk_starfive_jh7110_sys.rst-isp",
+		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
+	},
+	{
+		.name = "clk_starfive_jh7110_sys.rst-vo",
+		.driver_data = (kernel_ulong_t)&jh7110_vout_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
