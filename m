Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892B8C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 21:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3R6sgMc7kRDa7cT2N2TvLWHvhDdEIgy+76HHrg3v9ic=; b=SB4PREVVWSub4j
	vknjTuCdX3pbGrLVPVIXLaYPEOkXZAXQ0ZGEs0F0Yrq5nipJiKnrwcUwI/vhqbYO+vgf4gsxTrTc/
	vAldf611iE7tketjvwntmlXNHvIpf9d8af3NblcxeChdNHmq1ESQgR/3XV3Y6ei2DbcHlNxhJIo7D
	aZl5hCj9UH7dW4X7Og+ehy2IthV/HPSA1Re5nPXUxMpndbTWijS40L1Ysk0djpfXkIRccWQi5ohFv
	pVs57KQRsKSE3dDDusZZO26T37j+NpO344BE3+Dr/Tdf83ORZL3fpqAiSUuc+9o1a+Jjq3wbwFh6k
	7RvQXdFQPjGQnZu1Zu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCn-0000000CkQd-3pbE;
	Thu, 13 Feb 2025 21:57:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCl-0000000CkPY-0EVo
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 21:57:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7f42ee3ecso282317966b.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 13:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483825; x=1740088625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG6py7yu0z9B7maNjhp2/7SOVI/QwUJmvU/x6WtNkGo=;
        b=I/MKdu9FMTmOa21mVMA8wRBr+uG/0TLA9cL19TkosLjVSMTogbR3REkXe42Cy/nOWP
         atV4cuJb1/keTbL5f9dKTEGTnWQWoua2r2ss8o7J4e/4ovoSFjJUaNdxzG7cT3ApfSaI
         qRJHXVx3ZpGlu8dRNZHE27y0A0LTCNhQXTe6tL5DPxXHTinW0Ey9KG32qrioVJn/zMnY
         BZ6ZTZTr/LLn8oQ7jbQ8T5Hsd9Ed7phtSwk00t5HORzXb8xg1O3HXtdkm7CQl8dyWN9W
         cbAOFF9mKE7DVyrO/4mglJnLE8eM+3S0lGAxTQyTOM1pnPQPSXMO3+eU2h+S3ZwYCAUA
         DD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483825; x=1740088625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG6py7yu0z9B7maNjhp2/7SOVI/QwUJmvU/x6WtNkGo=;
        b=rs2/1DoZY9TlraaD2rxdIQMurKqaMz48oGNfFUdgT82i5WE6o3cYlI4K/lWk2yVy8L
         WoUdXdQ0egtk72B2ENG0SsjhFw50b36AHpFgKP1FW83kpJvW1ZWfwfTUrUmr6IwnEiVL
         4UsFp3Dwz840OmxI9qedAbqVclVx7fqwiR1IfZEEtALjQSL8X4y8cOvulH70dqI0qLRw
         F0Lj1alNva2x4mXxaxiTkJlOEh8IfviB31O9AjlTiisAek6mRRsZpuy1aq1IjaG4+N/E
         k4SB2Bwlhyc4EwUxl7aCqysUOqXZh0osVk1OuE5gEVhOGo3yR56owQhCV4KzKbmNWqfa
         Dsnw==
X-Forwarded-Encrypted: i=1; AJvYcCWV9F5vLcJdBaHZy68wxmWHiaomuZ+/aSV7j5hd5rru63QX2OZyPdNdUMJDwsGw5SqxkO+HSm/dXPHU/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP5pcjngI+zsLFuhN0Bzl18PoWCY4LSOLRKM12uRuqjKBZeARp
	akYI+UGWXrnv2lqKbiOLnccP4X6t/UWo4cH47RHj/TrUQJhnGcDOaK3/zGNN
X-Gm-Gg: ASbGncsyrOeeyy6CaefoyDMQ+P4bLVLLALmKC02ZBk2gUT2sPNOyeM7wMOwNDqON53C
	h+uxUXt1YJcAZl2rFu6el7mJjX/DyYYIQdo1FbKvTgJNLU6VOvBqYKHajkj9GEyXBFCgxETmsfo
	D9TXuOt3Q8bJc9Qe/iFv4R+1aWdacLThB2xlTwDyBmqArtFUaAvgIRTGDPCIQj+f5yrmDPK5RUc
	qeYQnVzUjfInJqmQJ9/qotyn6/HeVwY/y3ZtxiQAsQfWB5FngXJEIEIBN0mo67XbXd0O11YjUsu
	LWe7jLzunwInZ75oA+3KmE6zfR9m
X-Google-Smtp-Source: AGHT+IGZkO+tFWVJ/XSuIahWDkoxtDrJAoFaUbSRaWC5deMFCkWx1eq6xUWev2dyvM2gpdCMvuD1Yw==
X-Received: by 2002:a17:907:944a:b0:ab7:bc17:b3ae with SMTP id a640c23a62f3a-aba4ec15dffmr550867166b.34.1739483825104;
        Thu, 13 Feb 2025 13:57:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 3/3] rtc: sophgo: cv18xx: Add restart handler
Date: Thu, 13 Feb 2025 22:56:47 +0100
Message-ID: <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_135707_094563_963B4469 
X-CRM114-Status: GOOD (  17.64  )
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

Currently provided ATF firmware for ARM64 Sophgo SoCs is binary-only.
To make Linux independent from this binary firmware, provide restart
handler triggering COLD or WARM reboot directly via RTC HW block as
alternative to PSCI interface.

Handler priority SYS_OFF_PRIO_DEFAULT of 0 is desired, because if PSCI
is indeed present, its priority of 129 will override the new one. On RiskV
side the behaviour is unchanged as well because SBI SRST handler has higher
priority as well (192).

Tested on SG2000 in ARM64 mode.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
v11:
- patch introduced;

 drivers/rtc/rtc-cv1800.c | 51 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
index 5c30f7388983..586d7195f1f4 100644
--- a/drivers/rtc/rtc-cv1800.c
+++ b/drivers/rtc/rtc-cv1800.c
@@ -9,17 +9,23 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 
+#define CTRL_UNLOCKKEY         0x0004
+#define CTRL0                  0x0008
 #define SEC_PULSE_GEN          0x1004
 #define ALARM_TIME             0x1008
 #define ALARM_ENABLE           0x100C
 #define SET_SEC_CNTR_VAL       0x1010
 #define SET_SEC_CNTR_TRIG      0x1014
 #define SEC_CNTR_VAL           0x1018
+#define EN_PWR_CYC_REQ         0x10C8
+#define EN_WARM_RST_REQ        0x10CC
 
 /*
  * When in VDDBKUP domain, this MACRO register
@@ -28,6 +34,10 @@
 #define MACRO_RO_T             0x14A8
 #define MACRO_RG_SET_T         0x1498
 
+/* CTRL0 bits */
+#define REQ_PWR_CYC            BIT(3)
+#define REQ_WARM_RST           BIT(4)
+
 #define ALARM_ENABLE_MASK      BIT(0)
 #define SEL_SEC_PULSE          BIT(31)
 
@@ -160,6 +170,29 @@ static const struct rtc_class_ops cv1800_rtc_ops = {
 	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
 };
 
+static int cv1800_restart_handler(struct sys_off_data *data)
+{
+	struct cv1800_rtc_priv *info = data->cb_data;
+	u32 reg_en = EN_WARM_RST_REQ;
+	u32 request = 0xFFFF0800;
+
+	if (data->mode == REBOOT_COLD) {
+		reg_en = EN_PWR_CYC_REQ;
+		request |= REQ_PWR_CYC;
+	} else {
+		request |= REQ_WARM_RST;
+	}
+
+	/* Enable reset request */
+	regmap_write(info->rtc_map, reg_en, 1);
+	/* Enable CTRL0 register access */
+	regmap_write(info->rtc_map, CTRL_UNLOCKKEY, 0xAB18);
+	/* Request reset */
+	regmap_write(info->rtc_map, CTRL0, request);
+
+	return NOTIFY_DONE;
+}
+
 static int cv1800_rtc_probe(struct platform_device *pdev)
 {
 	struct cv1800_rtc_priv *rtc;
@@ -205,7 +238,23 @@ static int cv1800_rtc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "cannot register interrupt handler\n");
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "cannot register RTC\n");
+
+	/*
+	 * SYS_OFF_PRIO_DEFAULT of 0 is desired here because both RiscV SBI SRST
+	 * (prio 192) and ARM PSCI (prio 129) will override this one; this
+	 * handler shall serve as a fallback in cases where firmware is not
+	 * present.
+	 */
+	ret = devm_register_restart_handler(&pdev->dev, cv1800_restart_handler,
+					    rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	return 0;
 }
 
 static const struct of_device_id cv1800_dt_ids[] = {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
