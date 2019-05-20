Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB806C072A4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:21:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9176021019
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVeAMgKt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="i/P9RCiD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9176021019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRgh1bcz6DQoTYk5V3+a1g0yilWTXPv7hkoS3MyCIyA=; b=fVeAMgKt5Q/+Vm
	IWH4Gh/1DhJtvviQPOZnTIXUt2m2xC0OxqYAB3sCN0TTBXlUy6YySaHfyHD6Ce+hUXwloxRtENVHe
	AseQWLl7l9wpbZhN+rAL6R3kRMTQ2hdnOLKKWd5SG5lhdbfbs5HB03KSXsmVBu1NJxNdoGh9CQYpG
	DvghnrKNxERKZ6ki8atKx4QgWLzfS9GZVI7ascEe/AIbnSapUj0RPCCL/4W2veULUu/nUghTVLya6
	w7xhDi9cWO9BWwgfWyg0rqjfnG4JjJ9qnqDhSTMhb+Fy0DqPe9g12gRNJTvvww0hSRND7OxglbeXD
	OC7EFe7BhaygIopuMcPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShIE-0003WB-PU; Mon, 20 May 2019 12:21:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShIC-0003Ui-8F
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 12:21:25 +0000
Received: by mail-pf1-x444.google.com with SMTP id z28so7174084pfk.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
 b=i/P9RCiDrUaIMpMf95McN8b9avW7QYLVIOKO2jlZMWKcLY/05ZW/xSzalEe2ZC2ium
 J+wLdgoANMLVAvwplbq/pkBi7usMO3QjlXEvjQ1Gs64ly9KvlZ2Pu3yKn0WT9pQ1InKG
 R1rSPrKmyTWs7h7zpnUHeqFD/UGsn7zMLBkG0+sA8QG5TWQx+b/Hhc7sYBOavOW+U/5g
 HAV8eBw9nk//Dtx3Z7BXuyrBpbg/WceaNIs1kK0+QG6MJCaEtEVuGWGx9l8EESebrOmm
 OahLLa8h7oaqtfm3NLAs/DeCR58Cf7obmOOgqP4+fbTPnkqwyR22Fqs4fG7q30WWpok+
 pJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
 b=npycCvktnkaiadxffORAHPFdjWSjZQG8J+Fkw0ue8o13kurGS/cD9sHezQN1kz3Ec3
 TnLiskLrnO75byHs4Z4yuC3n4iSk/e0KdoplLdg7FnyQ0kmG/zx/m9Cbnvpfbse9W5fW
 4KU9WGeogS8S3cmUoGEF3qqhxKOl3C6jq3jmC3+v4AlWtY+5HtFV6x+jfJHroWHHisTY
 XdJeAbDXWEwDx2Eaqg3YPwNco5jZd4T6lF7BBlOlYJeIh5Zxqips4ITQUmD9g0CzxSdK
 vYvSc/9/GBggjvg9/+ppEYf6pYIJM1PjmfH+jTEaGpZWbu7B0wCI3qMZOQN+jzEGAJac
 EI8Q==
X-Gm-Message-State: APjAAAXOHWkgSjNpaCu6hTjRptDHsjfMEold/HhgBIvMQv4OOTIfEh3L
 65HOeOtoeRPapzz0fA+k1SHtHg==
X-Google-Smtp-Source: APXvYqx/aDaf41fZIhhNQijCLymVj8l2tADUtw/HunCGJBDhenLRfcPSr+pEa51noxzJs7l4d1SCNQ==
X-Received: by 2002:a63:8741:: with SMTP id i62mr74826207pge.313.1558354883537; 
 Mon, 20 May 2019 05:21:23 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 n27sm38137077pfb.129.2019.05.20.05.21.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 05:21:23 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
 andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
 sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] i2c-ocores: sifive: add support for i2c device on
 FU540-c000 SoC.
Date: Mon, 20 May 2019 17:50:16 +0530
Message-Id: <1558354817-12034-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_052124_295307_5A70F4B0 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Update device id table for Opencore's I2C master based re-implementation
used in FU540-c000 chipset on HiFive Unleashed platform.

Device ID's include Sifive, soc-specific device for chip specific tweaks
and sifive IP block specific device for generic programming model.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4e1a077..aee1d86 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -85,6 +85,7 @@ struct ocores_i2c {
 
 #define TYPE_OCORES		0
 #define TYPE_GRLIB		1
+#define TYPE_SIFIVE_REV0	2
 
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
@@ -468,6 +469,14 @@ static u32 ocores_func(struct i2c_adapter *adap)
 		.compatible = "aeroflexgaisler,i2cmst",
 		.data = (void *)TYPE_GRLIB,
 	},
+	{
+		.compatible = "sifive,fu540-c000-i2c",
+		.data = (void *)TYPE_SIFIVE_REV0,
+	},
+	{
+		.compatible = "sifive,i2c0",
+		.data = (void *)TYPE_SIFIVE_REV0,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, ocores_i2c_match);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
