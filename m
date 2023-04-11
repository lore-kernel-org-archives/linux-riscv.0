Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0BFC77B70
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNMeNQYBMDV2bYZ2d38tbAbcbJsO24ojv3UZ+dout0Q=; b=BfRN1R2/SWxz7O
	t0V52GhOnDLYmk9NYi5jBjo/3R77U0LSbmCRZhTgEdQ6bkl7kFBIp8HFIPuBiue3CXPy03aO1oROl
	GxTWH5o7RqReMMlS1nZKL19SLPAGY29PMomxwnlDFR4vK2qLbxmB+Pl/ChLZ+5s2mqQpiETPngJI0
	/RyvFbfqy+O3l9UTHjlvuxjQGbTO9yD1on/mPgo0/cHdkaGTCbLCViP8/hPSZdX/s5j9WJcsqKZVT
	Luq0i1Qd4lofC3w1JCrfl8p2v/nVUEXNcyuyjlC0ozBhuAQF9Xqdf/N0YzM48y7cSU8amW/IFpW9n
	jz4SdhGGBjPu4qj6w7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEUJ-000Atz-0z;
	Tue, 11 Apr 2023 13:56:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEUG-000Aif-0I
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 13:56:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8781E24E1D4;
	Tue, 11 Apr 2023 21:56:05 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 21:56:05 +0800
Received: from localhost.localdomain (113.72.145.176) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 21:56:04 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v4 01/10] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT resets support
Date: Tue, 11 Apr 2023 21:55:49 +0800
Message-ID: <20230411135558.44282-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_065644_369037_14A5AC28 
X-CRM114-Status: GOOD (  11.14  )
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

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh7110.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index c1b3a490d951..4eb2da4a22c4 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -29,6 +29,24 @@ static const struct jh7110_reset_info jh7110_aon_info = {
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
@@ -55,6 +73,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
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
+		.name = "clk_starfive_jh7110_sys.rst-vout",
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
