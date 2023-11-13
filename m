Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF12C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 02:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LcgHBXXt6qlEtb6kBhrUGEF3QwHbc8fbq+YI208e2Iw=; b=DVCc4f3aX3wCVr
	ckeN83X7Yn5bxuFk+IumXgFuUGTFw9UpOMKIiLYaq3xQ/IbDD/s2bwQYR5fsy6HwVbqQt/xZOFNL5
	Q34mR6ARnXp0rH43iq0OGH8t7wgtmzlcnrPC8mwvQm9hARsk1/YvC+o8w4BloNMFkwBjqDn7vKOrM
	buuM4X9N+2AhOVNiRbCybdmzxi8mlXHUle3fAOWeECil5TGbcneujKWEUm5bnVNaP8TjIbG+t4Xge
	aaleXdHJu1GvGWyMBADt0TkIXHuRPLtdLbbt0UI0qRpH395mOwEVIeBYtKF8kVJ7NUkAQ3VZFQWgV
	wXZUyX3usUwS18uzltdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Mmg-00D5e9-2J;
	Mon, 13 Nov 2023 02:34:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Mmc-00D5cA-1C
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 02:34:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so3977583b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 18:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699842876; x=1700447676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3x9HMy2KOCVDwBY1aKyWkU7yvsdzFHPBbEJCciD5yLQ=;
        b=Dukh0DJcJQ0jPwcZSfWFeJRAgHj138F86fRX5LqeqrkKmkrtbqWwSemMPT8u2SoCTh
         ruuC5717YkVZA1arwRPqj9O6IdqOYrVEGROALjt2T64iLEApjMFKFS+vOfoyEQ4UnWwS
         MQ3heDDewgOCOZkORk6lmL2Ak0e4uBoXA46LcMHR2dCM2bXBst17MfhFnhEWD+zc5hFl
         x4TCaGzHV+6xf74tRGP2xPyAx48Xg2Q20lHry9AQPoG5uBDSJy8AMDAAOhsajdU4jOY3
         1vp2J+38LVdV4viivyxfwv3Ztr5VZuYM1t89C4Zj3hmK21Dha8h5o+L6KBh6luSDmWF6
         kuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699842876; x=1700447676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x9HMy2KOCVDwBY1aKyWkU7yvsdzFHPBbEJCciD5yLQ=;
        b=qOxZuExrU1hV0IbhkXWdPWObuOwvYbS7gBJU0Nmk8u8Q/9/AVFdF97wKnNZY8D4/5a
         LjbNT1kMspX7ybiA0BguB5Zk8V80Bbtpz3EO9QSyvUEky5xYDSw4pSR6z7aYSPyzp4Ds
         z2nl+64bnFnNUgS3I4deh9W2nxaE0t/nWNs3VLlRR7vR8ZcN2UVBoqh6RJ0R+Z2AQTvj
         X/LZrci1k5pHHqJdeffxUfX+HWj/gqV/Xoq2Rbo8HziBYI3uOZt43PO5B7I+RGoT+DEZ
         nfSOnoWxmv3lJWdtASHxfV8Dy+c2RyNaEntayl8zmW1q0n12wCldKTYelyXUDT8svyQw
         uF8g==
X-Gm-Message-State: AOJu0Yz2jszQjgyQihFrOvBJnVziZxEreobQrDUpN4inClHCgTRaNEwC
	n9sFgdGtFuyD+U7oEq+1Fbn6yw==
X-Google-Smtp-Source: AGHT+IEnZh+aR0sLWPKOFMs80myLNe8uYYzars/PhN40NDuSuCYLfhLw30h/2jkP74tE/0IvSzLuEA==
X-Received: by 2002:a05:6a00:800c:b0:6c3:5f49:6da5 with SMTP id eg12-20020a056a00800c00b006c35f496da5mr7110474pfb.34.1699842876238;
        Sun, 12 Nov 2023 18:34:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id hy12-20020a056a006a0c00b0068fb8080939sm3015184pfb.65.2023.11.12.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 18:34:35 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Andrei Coardos <aboutphysycs@gmail.com>,
	Alexandru Ardelean <alex@shruggie.ro>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] gpio: sifive: remove unneeded call to platform_set_drvdata()
Date: Sun, 12 Nov 2023 18:34:32 -0800
Message-ID: <20231113023434.1186043-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_183438_408104_F1F906F2 
X-CRM114-Status: GOOD (  11.26  )
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

From: Andrei Coardos <aboutphysycs@gmail.com>

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on v6.7-rc1

 drivers/gpio/gpio-sifive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 8decd9b5d229..067c8edb62e2 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -250,7 +250,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	platform_set_drvdata(pdev, chip);
 	return gpiochip_add_data(&chip->gc, chip);
 }
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
