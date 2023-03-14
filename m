Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92FFC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQ61oXrr3XE+4RUuQlDbxzWllUp8kqSO/sKWzxGi71Q=; b=KVc18O078NxU4k
	2/nRCgewAO3omRuGcM/AfLDyQhxg1FPoTq03pRshey+9gS0EE4ruxJ0UbVd0wINzMUuYGxnq3KjAq
	Uf3yvTo5R5GwU+MfupimQ5xor/hnycgHFK0rRVQEcpXG1FiTxMYnwaB5wlx2e7/KZIHjy8xZ9jSAp
	Nog9Owalsqe0TOw4Kboa2fjVGEgTWeQSUTU4g7C5hnRsn0oqCt1gNMylkpNeHvvw5zw2+gQXKibW5
	b8D+9BiQN9JCWfE+xUeWwbtmfHpAl7Owe1E2lwx9+HmxZaegOftJM29BXBVulUcqHUfRj7u/UlAU9
	4SG4wmwuNPo6DYqvFfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41v-00AAjy-2c;
	Tue, 14 Mar 2023 12:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41u-00AAhs-1O
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Mar 2023 12:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6jC1NYDfhdwNPbK2t1fRr8fHVJjWzBhNxh6fKg2DpYY=; b=RyFEmmL1kcBKh/H8kGUJ+KJCFw
	BGe1bn8oGMzPI/n5FzJEKBmq10dq5TXXhqhNBTfRoJDL/o60EOqolenfRStdvTH1kFZcQ8TaEHRZv
	vwG/U16U0UF3nd2J7VKzCbERhC2WkF54asJUZEa62xr4TlgtxcGfWvj9en7t5mzyX/o2HG1FNDNB5
	bEu/F7wcfSy0O8f/Emh/J/dbz2/kIdwdlmHjRpvH1ZsrzdZrMfYYp22bgIrSDHIp+HM7ViPYjRRbu
	/W75N5FVH5jgfjPiOTvF65zcHQQeEpSQ7fiCRfZmYL2QmUSHu4xtSeUW4tGqlLwnn6mAiuIx0DrTB
	YtrotRMw==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41r-001mgm-08
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 12:45:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D7DA624E3C6;
	Tue, 14 Mar 2023 20:44:07 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:07 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:06 +0800
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
Subject: [PATCH v3 02/11] reset: starfive: jh7110: Add StarFive System-Top-Group reset support
Date: Tue, 14 Mar 2023 20:43:55 +0800
Message-ID: <20230314124404.117592-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124523_406337_D79959FA 
X-CRM114-Status: GOOD (  11.71  )
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

Add auxiliary_device_id to support StarFive JH7110 System-Top-Group resets
of which the auxiliary device name is "clk_starfive_jh71x0.reset-stg".

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 4ccb3f72ca83..2dc46d91a244 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -29,6 +29,12 @@ static const struct jh7110_reset_info jh7110_aon_info = {
 	.status_offset = 0x3C,
 };
 
+static const struct jh7110_reset_info jh7110_stg_info = {
+	.nr_resets = JH7110_STGRST_END,
+	.assert_offset = 0x74,
+	.status_offset = 0x78,
+};
+
 static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -55,6 +61,10 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
 		.name = "clk_starfive_jh71x0.reset-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
+	{
+		.name = "clk_starfive_jh71x0.reset-stg",
+		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
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
