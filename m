Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308B7EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWhlOLQYQEsAu1UeC/AaqRWatb6D3pWw+HbeFgLvbjA=; b=hgKHn5xfATNbgl
	bdhXy55pcDqEtT6ZDD/pme3Fh+mmtLXqXUtm9Y/+oznKpXFYMNnAfIBIhUGOSayBHvWb3+tjUXKeU
	S9ZeMRhHnNQp+gKfD79/q/HJYONmJgIfrnvrblPmbeI8F7gE09geU/dpEUQkXzqtduHBboDCc+KkQ
	oo5Nyh88CwvlDWw4qtDMI/f9E+WUGn4acm9Dxfvz0qWBgoqsgcX9dd+RP1hCvhyXUroj3kLpI9ozq
	8eEaH3RDhUxGK8mHZ0rbyu8DBmhDIvq6JIjdT70zfVkmu+S4JZJdjN1QjdGNoYZMZ0wXithbQc5Tc
	2jxeULgzCScKEiViqKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1s-00H1PC-2f;
	Wed, 12 Jul 2023 09:21:00 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1n-00H1Ai-31
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:20:57 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1A3B424E2E5;
	Wed, 12 Jul 2023 17:20:14 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:13 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:13 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v7 7/9] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT resets support
Date: Wed, 12 Jul 2023 17:20:05 +0800
Message-ID: <20230712092007.31013-8-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_022056_126553_D40948AA 
X-CRM114-Status: GOOD (  11.31  )
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

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
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
