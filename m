Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5A5C46467
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 02:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDE9yTcZbaSZom4le4YVb8v/28L45sNsafR0PsHUhNw=; b=xeo7fx0gmcz8vA
	Rb2KsgrXGu8EBh+HL592KDWj6dmGSJz1riPcVH91f7X+WNhtksopHrrG3FxQahPKx2elWELY5C8ag
	lOaVQc3Sakc5SXvTZsN5rYMSyVKZg0jXCFO1ETluGzGdr2NzARrBj/TGv00EaKRhlocNNrIQnpNVW
	B23IzYMDdu3magllkrePXtweeQVj37xm/ZTgunYQ8VYFMEvzG47HNSK7N4wQDfwsMpXV/m2QyCvXE
	QniaFxyEEkKNxCkI1Qmhu2mQXwJwJ6s8IkcvYYMlzSvqWs0CEf80AgSoIuNKnMp+E3gkqsy+48334
	nnbhvyVzSJ3rRjrJMlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhPA-0086sQ-Dt; Fri, 20 Jan 2023 02:45:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhP3-0086la-NY
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 02:45:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A5B0324E102;
	Fri, 20 Jan 2023 10:44:50 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:50 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:49 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v1 05/11] reset: starfive: jh7110: Add StarFive Image-Signal-Process reset support
Date: Fri, 20 Jan 2023 10:44:39 +0800
Message-ID: <20230120024445.244345-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_184518_006324_DBF33864 
X-CRM114-Status: GOOD (  10.64  )
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

Add auxiliary_device_id to support StarFive JH7110 Image-Signal-Process
resets of which the auxiliary device name is
"clk_starfive_jh71x0.reset-isp".

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 580ec4ed055b..8c0befc26150 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -46,6 +46,12 @@ static const struct reset_info jh7110_stg_info = {
 	.status_offset = 0x78,
 };
 
+static const struct reset_info jh7110_isp_info = {
+	.nr_resets = JH7110_ISPRST_END,
+	.assert_offset = 0x38,
+	.status_offset = 0x3C,
+};
+
 static const struct auxiliary_device_id jh7110_reset_ids[] = {
 	{
 		.name = "clk_starfive_jh71x0.reset-sys",
@@ -59,6 +65,10 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
 		.name = "clk_starfive_jh71x0.reset-stg",
 		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
 	},
+	{
+		.name = "clk_starfive_jh71x0.reset-isp",
+		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
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
