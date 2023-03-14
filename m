Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25659C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8re5G8axLBUEjCYCAhPknzOXt6NZD42Kw0ftotYKwE=; b=o8gOIpjEwAgIm3
	BcUvL8TF8KEs9dHReJIf6wiol5lXvvAZ9S78GtjbwefVX3G4sjwdSkk6NG4EYTsCGhH/Fckuke1My
	/0d9rEJ9vcx/g3sSCjhfg06lNfsuR8TX/OgQ68FZKBYTjMCfjEiwL3PFORosGQRtpNAdUWWIsCCkO
	XbUeUYpN2Ia+UoeuO3SagR+6ur4pp8FJAe5KTu2K3/63AVp+QJ5Uifoad7/MvjNVQK4xL+31m5r7E
	N5pIKl2VqUcPVMjRVgWYIQA6zfApmuGjs00/IhhvRfBqujrxzouW6hpCbiqEM0ucNbmyN/W95Jb9V
	1scBdK4yBPXpe+1BaGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41e-00AAVz-2n;
	Tue, 14 Mar 2023 12:45:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41c-00AATH-10
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Mar 2023 12:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9zqqbscKFnL5Fiof/HaBfQmu7qtdyGOTDWU1EHdv0gA=; b=rMu3XX8DbHG2179U34E230az9U
	8BO5Vvtrw8dm1CAzxEw2+S5wjeYA25bO/9G35uqJZamQ09p3pVbjlaex+dQUyLoUE92/I9KlRKsEg
	qk9qlfr83ZX6g2pQkt+EwyOf08HJOhrJ8co3B+bclVZkwqRhhvprswxm9B5kdRywF2Gg27SCPPcHU
	yK5uoVykgC6rAho/In6U3L9Xk4IqARbxTnilun8e3NFg0kSBvOtbe2qjYhrIjhyBrIC008FV1ThH+
	ptfmIHvODu6uguwIcMIVoAt4RjeQE3hQC++QQCcIOSRdkVTmOF1K3iW8pIPEf7byC6ybb+eOQMLnw
	7ArtoKVg==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41X-001mgn-24
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 12:45:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7659224E20F;
	Tue, 14 Mar 2023 20:44:12 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:12 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:11 +0800
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
Subject: [PATCH v3 08/11] reset: starfive: jh7110: Add StarFive Video-Output reset support
Date: Tue, 14 Mar 2023 20:44:01 +0800
Message-ID: <20230314124404.117592-9-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124504_006874_8083E40F 
X-CRM114-Status: GOOD (  11.51  )
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

Add auxiliary_device_id to support StarFive JH7110 Video-Output resets
of which the auxiliary device name is "clk_starfive_jh71x0.reset-vout".

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 3aeeea8ee1ed..6ad535c41087 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -41,6 +41,12 @@ static const struct jh7110_reset_info jh7110_isp_info = {
 	.status_offset = 0x3C,
 };
 
+static const struct jh7110_reset_info jh7110_vout_info = {
+	.nr_resets = JH7110_VOUTRST_END,
+	.assert_offset = 0x48,
+	.status_offset = 0x4C,
+};
+
 static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -75,6 +81,10 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
 		.name = "clk_starfive_jh71x0.reset-isp",
 		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
 	},
+	{
+		.name = "clk_starfive_jh71x0.reset-vout",
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
