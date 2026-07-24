Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5937C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2dT5rqMB3XupoNhzlKQk7Lq3RlPSJIIqDI59TM0epw8=; b=h3f8MbWrq09I3v
	XX6XSCW12MFec4FHp1fkgsz0AOEO+wXhe6GOJlvzXtG97y+vD0tDO+nncXpQGExKuyfPas1KiVKfr
	0foaBQywc5+bOK6+32d8tWikbiWXUm86JjRBwZRUMqWIpTmXS4+ZhGjDF9MPqmQJmjN5nl+Qwuyvv
	BlUd30+9Op0ugMRuQyA6jYVwX8lPxaKIxEbZD/4IwImfAXOrPnORy3X2WXIM0F5seuoB7EJXvyZ/U
	/ahWfAFyg1FPVi13VbgiBkFUkDh+O2r+qlyGTgq3OYaeSjVLDbwFKMgteAA3lytdquMCJvl9Ivnph
	ceL6vItXxqrtQNHvk9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGPt-0000000GWsk-3FPx;
	Fri, 24 Jul 2026 13:58:21 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGPr-0000000GWsG-3bry
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 13:58:21 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-81062fdeaf5so13266237b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784901499; x=1785506299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOq8PKa6aIygrh3C9B6cO75yjjM9OGV5sf4Vbyk2dT0=;
        b=VV0uMVWfNwtFCyMIwQW34jWVBFSDdERogPpcKqWzAIy4uM15OKJSfobHftM6FP+2lT
         h+7UZkrsL/GoElUrsZG3GeMiD1rzxMSYfjkF+YvjM8YFZXAdNki0DpqcHpGdL/gaidt0
         Pn4XmASS95w2aUXbzTNR4xxm1uuZWXO7Yvai0q9GK287Txr0ozZnBCDSMttgspbtb2iw
         LOeneG69xQurhKIZ61hehmXtAkwRaVW4owRdBtL1M1NDMayU48LpKrd/SzR9WBUaErPY
         e/m6b7Eon3TIOF6hPHhywl7GZ1tYDiKfs9CRX+hkZG+NaPuKLLIPd7EJOP0KE6IorkDa
         1QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784901499; x=1785506299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOq8PKa6aIygrh3C9B6cO75yjjM9OGV5sf4Vbyk2dT0=;
        b=MFI0WuxLw7YglOL8CcorcoC61L64DRWhmF2s6LDnRCUAQzMeVdqcoJkrx3xQ5idmd0
         eN4061chKmSh+5MBo43/H3BL+8PPO3SLif5e5MMP+3j8GYqKtaq3ipcurECZVfp9gMMp
         wf17cc7jmCqY3XaJQe0uU3nAj4X8JvXLzkfJ+zBR4s4PMm5pL+Nc4LSJLVFxv/Ghifa3
         jdrg/c3u7gSpxKvi4saESnT+5vj77e/z5eAa8CKx7zhAs1ZTfcqttrJouIFNGdR2XyTu
         kJdwfu0nBkHG5PjyAKwaX85BEMJryytKCcSMUu9AZgWOOd11IbfJCAiTxWzTusCR4jlJ
         JEgg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8QFECN8eiWc06t1bHM/ARCYI9byDDVwi4DdJ4Iw34G1GxafLFEHksJHx2/OxoJHS8T+wlMiDYX1OsKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWVxEEqHYeXoI+XtrtyaTiiq4F80K4+X8PizCGVD0/djRDr1+5
	+yYhZ24/fcdxY6+2BymdGteWzDHAX6ZCWP1xzfR58rkrHE3aPablW68=
X-Gm-Gg: AR+sD12N8ePDeotZD5A3RGnbj2tL7KdnSv5msAzXvd+TVflOm42K6+tjYFOyeyCzl6x
	PSzux5aHFYQyA9BSldYjSmLhN9WXZ8R8ADJLzuPB59PU325baIpaFyCLsfFvEKlvEvVAEBRsDJl
	o3UWLCIuh9LEgiq77QQfVfFeaPA+p3GTer0sjN1LsXIRlwLDxulEhCLne/kVuH5pYJCqb/2q4WI
	ureVGOnpE3UJ9IEQJP1m7xIwjOKtt5Gl2VE1Gi1FUK/3ChsS22J191lFrMc/o8cJsSQfHqpObXr
	vs6JZoYeMW/Vgd1bmMMhqI/7WG1CHdfuzzpSSeqWCZ0hjjlt2rOKIUkukoB7HS+tAtwWyYeYWeo
	EWRynJPSDNTwIKCRY2KIyMan/SWOyDQLLAgPuFm2UmiMXXslazRcLuFK/0XblGhj7fSwcZkTuFw
	pT6iINi2WXVViQdjYqTD9M9dc5deA=
X-Received: by 2002:a05:690c:e3d0:b0:81c:2a00:aa42 with SMTP id 00721157ae682-81f63faecc5mr1632347b3.20.1784901498554;
        Fri, 24 Jul 2026 06:58:18 -0700 (PDT)
Received: from t-rex ([2401:4900:1a5e:93db:310f:3bc6:10c2:6175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f658fc799sm191397b3.34.2026.07.24.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:58:18 -0700 (PDT)
From: kr494167@gmail.com
To: alexandre.belloni@bootlin.com,
	dlan@kernel.org,
	elder@riscstar.com
Cc: linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] rtc: spacemit: handle regmap_test_bits() error return
Date: Fri, 24 Jul 2026 19:28:03 +0530
Message-ID: <20260724135803.81223-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_065819_911831_2DF0173F 
X-CRM114-Status: GOOD (  12.81  )
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
to check if the RTC was enabled.

regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
negative error code (e.g. -EIO) if reading the control register fails.
Using !regmap_test_bits(...) evaluates a negative error code as boolean
false, causing I2C/regmap read failures to be ignored and incorrectly
proceeding to read time registers from a failing device.

Fix this by capturing the return value of regmap_test_bits() and returning
the error code if negative, or -EINVAL if the RTC is disabled.

Fixes: a6de182daa2b ("rtc: spacemit: support the SpacemiT P1 RTC")
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v2:
 - Use ternary shorthand (ret ?: -EINVAL) as suggested by Alex Elder.
 - Collect Reviewed-by tag from Alex Elder.

 drivers/rtc/rtc-spacemit-p1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
index 43ab62494bb4..1de7bd995d29 100644
--- a/drivers/rtc/rtc-spacemit-p1.c
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
 	u8 time[6];
 	int ret;
 
-	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
-		return -EINVAL;		/* RTC is disabled */
+	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
+	if (ret <= 0)
+		return ret ?: -EINVAL;	/* RTC is disabled or error */
 
 	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
 	if (ret)
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
