Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E94C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 05:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6CA6112F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 05:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC6CA6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V6unGManM3Upx6FipGXa90qm8Jv9b6oAnHch0F5kazQ=; b=LQtxXS6QwCduOO
	Q+4WZQjFCYudKJzj7SKGzkZ/A+ywbmvj/KKnArP9PJpGT4Ow8ERyS7+cN391Z4VJobqlUlnrWoE3M
	RASZS7jtOXYZdmid2WaFb3V0Gzl74Zwe/TE+rtHZxjhcPGwxnIWOck9G2epg/DimUxEhwMzv0psHT
	0EcLUc0ID3wKAEASOtfd6Fx60qzKDUBRmIRnYQVc/zsVmO3h3SloOa5TBDiyD8U+asC8+ANtLzLsH
	QyKyI+lgpzrh0bhR36KS6XAj5E8CtgccIqMRs7xC1xHkpCZ4riGUEqbwBWuTR0DusbzrSpo6/D2EA
	HsfNunEqnIWdK6Iuyp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSYPw-003dzM-90; Tue, 21 Sep 2021 05:34:08 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSYPr-003dwr-0s
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 05:34:07 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A0B543F335
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 05:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632202438;
 bh=4TlmOAh0qvfrJHzkziGZmFRzNpkDVdW1XKcgak45JvA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=QWN94aAQgo3rr+u1rMCevkE+8cciJY+XPqCS1sUA9hI7sk36rUiH2AtuHtvHuXfyb
 HSwjIESwL76ja81jHDLqClkJ/NLVHgUirfzYSb+KIzTQYFqMTc/AwjKa9OOan49D12
 uenWaPGrW48nwkAmAJJD3tUrEX8CfV5K20/YO4up0LH4CK69whBdPPZK3T2kK3rZqo
 D3jwEDrxhulxZ6kOODheKEhSnWDEdb+HIMBMois8qM7cRjaXWxesvEW4dq2ACgGid0
 evUImPKdXuraX/sLlYAK+mqVE90uDAuInqhES1Omjlbh/jWIVlsqeyEs3MBMNPQsLJ
 uEaYSTzAo/lng==
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so7830287wru.15
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 22:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4TlmOAh0qvfrJHzkziGZmFRzNpkDVdW1XKcgak45JvA=;
 b=GCzTvYUURdbCJ/upkBpBuG6+MVgz7qMTIbniQ5HBsZU3zSXTXsyT0rhdLUV76xdyw3
 VwRMPB1BBLErHN4VsscNWcXq/A/U4Z2ExLB33w9LxPaNPTSkJcrjFjR5MaaSqSR2SJP+
 CAjs0ahyIl5pJAGSiHcXESQJCY8vQSCQ0G87CDPDcyeIt8Aa0AFZrtaKr5jwCeVHlx8n
 Yjq37nLS/PdFzJO/Nt11wTTR1JfugToENZ6old9rYq2+HkPnIK3Fo8SZsK8tN+L7L148
 aMR0mcRZe2mwqGKTTEXMwfaUvj6iqXWtUFZIAZfH6u8ws5VXz4r3A2RZ358Qb1nEqoDy
 VOQA==
X-Gm-Message-State: AOAM5332R9zwRKpCqa9dSfixktmQRWZWrpacxVBptOL6vNg89C4ryfLg
 NEXXHdl72VRM+RikZD2+fjeHj+Z0UiTfwdBSLpZBXDHi2qDCUUJ5zADgKVZ/Ml8ofhqyf+7/HTy
 O2Y+bG9X8O5TwpMuazUAMCFdmYkpxhhqTyzWxU0vmKR97HQ==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr32536363wrw.433.1632202438285; 
 Mon, 20 Sep 2021 22:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF3PO09jHj58NiTJqHfOrLXT5jsJwmpB/B9bxrhespbIkwIBduu1BH34jEqXy490KPwWbh4g==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr32536349wrw.433.1632202438172; 
 Mon, 20 Sep 2021 22:33:58 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id j27sm1447809wms.6.2021.09.20.22.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 22:33:57 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Date: Tue, 21 Sep 2021 07:33:56 +0200
Message-Id: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_223403_346588_11312DAC 
X-CRM114-Status: GOOD (  14.73  )
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

The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
notifier that will execute a small i2c sequence allowing to reset the
board.

The original implementation comes from Marcus Comstedt and Anders Montonen
(https://forums.sifive.com/t/reboot-command/4721/28).

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
 include/linux/mfd/da9063/core.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
index df407c3afce3..c87b8d611f20 100644
--- a/drivers/mfd/da9063-core.c
+++ b/drivers/mfd/da9063-core.c
@@ -20,6 +20,7 @@
 #include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/regmap.h>
+#include <linux/reboot.h>
 
 #include <linux/mfd/da9063/core.h>
 #include <linux/mfd/da9063/registers.h>
@@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
 	return ret;
 }
 
+static int da9063_restart_notify(struct notifier_block *this,
+				 unsigned long mode, void *cmd)
+{
+	struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
+
+	regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
+	regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
+	regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
+
+	return NOTIFY_DONE;
+}
+
 int da9063_device_init(struct da9063 *da9063, unsigned int irq)
 {
 	int ret;
@@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
 		}
 	}
 
+	da9063->restart_handler.notifier_call = da9063_restart_notify;
+	da9063->restart_handler.priority = 128;
+	ret = register_restart_handler(&da9063->restart_handler);
+	if (ret) {
+		dev_err(da9063->dev, "Failed to register restart handler\n");
+		return ret;
+	}
+
+	devm_add_action(da9063->dev,
+			(void (*)(void *))unregister_restart_handler,
+			&da9063->restart_handler);
+
 	return ret;
 }
 
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index fa7a43f02f27..1b20c498e340 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -85,6 +85,9 @@ struct da9063 {
 	int		chip_irq;
 	unsigned int	irq_base;
 	struct regmap_irq_chip_data *regmap_irq;
+
+	/* Restart */
+	struct notifier_block restart_handler;
 };
 
 int da9063_device_init(struct da9063 *da9063, unsigned int irq);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
