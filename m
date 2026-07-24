Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC77C531CC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PhREH/7O/ox1J/z6DwVz2uasrzbbr2ZbZJbKvz3+Z0Q=; b=R37v+u9xSufU3b
	g4vCIqsdpvkWM4SrWltyqIE+Bg3mbb6Ln/uaq5GMQaPz7wy729l19ShejskzmzVFYiCiRVFh/w0Qi
	ak0nM9b7Gxcr3ZEll8QHkgDmrRec4BNWUo/mfEPjkMg+UpLpDC3ALBcHd+tJdUUTD+Dsyyh641asi
	uHHxtYWqFmCVDEK9qebX6upZynIpVkAtJVw4rS6ArIc0O3ko/gb2yeHjRL5DYiZvJgy0EwvAQBAUy
	C6Eocz8DGaNy+SgibjZfU9m0Bn08n5n2Mht9PNqLqRZ68x4sR8J68/NVWzHyNgJfAm2W6FNDkbQmJ
	DbFaDjGjOL+OWmwjY+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5ru-0000000FOxm-2d9f;
	Fri, 24 Jul 2026 02:42:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5rr-0000000FOxP-4BAE
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 02:42:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc97653887so15753705ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 19:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784860950; x=1785465750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4bvXbXayEnCzzJXqVJPK7lahyeIFGKn1fz42KqQtbg=;
        b=cHTJG0W57Znaj9iYfVEo3wun3w57pssdyw7CcA3WVyu1t+MCdV84eqfuqzHgyjEyu1
         0tcNoG/uE1n9EKx8BRZDCNc/6s+fIFh63B6PBOAcOy8i3uwRa9i6Tv3DFAroAfAmHLMS
         LR3Ul9L2xITMJGhgNRMb/6IIQK04EXx9Pm23P4bSL3zoSWBTGnXYCHynvw2tWohO4uL3
         9Dx1Qs1Drs5cFOrjS5V4+hlVqykEhxF3SrvgaBQgyjF0AhRnpapCigOM6STyVI68VCTr
         vSMMkGdWc0WRBZ4oOoxKMS873iOMw8/s3HuXm78ydB43v22sQC71orh9c/x/7HWnOoyV
         XxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784860950; x=1785465750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4bvXbXayEnCzzJXqVJPK7lahyeIFGKn1fz42KqQtbg=;
        b=fGfLsTDhALoaQdf/rdaBfckB9blB76LSW3sIdr3tGkuZekt02Ci6RFUiPgcL2J+5cW
         qAdDFcymt28BRke+UBxfKTsJtTGlxPj+Kb7HfzdKQudOQ2Qt8hvNognmpO4bVw8epnQB
         6PP1ziytt96XjcFRgibxW2QMKxJ79wZorWf557o6qEEHHa62+aO0JzyoWO2hmAO689Yw
         wzhzfw362eULcomfgWIbGSleNazOZfPxDZUSekuOGrCO97GkOVoL9Xq/wM9/4ZJBWvo9
         nOArGTOnADDk8Aj48qKuowdUsT3WOt8KSiAtzItTUn6HP+XCwkLu1sEafc8iMPDLgpj9
         7PXw==
X-Forwarded-Encrypted: i=1; AHgh+RpYRow3niUxQwo6lumamd9Zb9sq6w9X6GsujKA9SHiVq5T1H8ZnxBcABmw2sE1K+2B68dvfwg+xAABDoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwufcZyL4Q2UP7douAvNKicXZZUhCm/trvAeu2XtCJKWF6ER7K/
	xXeTVFCqr2+8D189UHCas8KwYorqxjmY3L5x1lZ8GrUhjjaIcIbM4As=
X-Gm-Gg: AR+sD12oaKwb3ZbIsYB83oDLELcQbhXBfhyISQ00PwLwbWHR3cVpDqLUYY8JLgSwUXu
	w2RXTZz5IM/lRTXZpNULL/MW0p0F2jwWny5KXbRMgf0pwiq/Yh0z1VvovIUEzKp3w3Q5HHSw3IO
	YgsB6sTgL4lq65obM4nQ8bbRUpS8rHzIhCAeAxOOMSZjylJjHJ/lZDInVpxh7kh/fMn38YCh64V
	QtE4etm/eyTwLf3B3c+lx52L8pifMY4LI7c0rqpeXthtRjKcOJ8NWhpOV9VT61Jbdb1ryEJAN3k
	crADQ29DWvmrC4p8SWi2Y2N2i0pgFag3j9Fqx8cKqQa7YnUk8jtTwYJ4zJ5D0LNt5M+5bEhlKHe
	R3cx9+/XZ6S/US/tEqd1QoZrdBbO5EyEiDPXpTiGQ8icQ68bafFIQoWHyqcUYwnLGnFujcIGyyq
	Zg7tTAOXg95mvh9ntb8ldE5O5miYo=
X-Received: by 2002:a17:903:2b0d:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2cfa71d9468mr61759585ad.17.1784860950411;
        Thu, 23 Jul 2026 19:42:30 -0700 (PDT)
Received: from t-rex ([2401:4900:7b1c:a30e:8622:dbfc:dd30:d90d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm24761728eec.28.2026.07.23.19.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:42:29 -0700 (PDT)
From: kr494167@gmail.com
To: alexandre.belloni@bootlin.com,
	dlan@kernel.org
Cc: elder@riscstar.com,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] rtc: spacemit: handle regmap_test_bits() error return
Date: Fri, 24 Jul 2026 08:12:20 +0530
Message-ID: <20260724024220.10113-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_194232_062322_FC2A5072 
X-CRM114-Status: GOOD (  12.17  )
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
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/rtc/rtc-spacemit-p1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
index 43ab62494bb4..c1820c920ba3 100644
--- a/drivers/rtc/rtc-spacemit-p1.c
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
 	u8 time[6];
 	int ret;
 
-	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
-		return -EINVAL;		/* RTC is disabled */
+	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
+	if (ret <= 0)
+		return ret ? ret : -EINVAL;	/* RTC is disabled or error */
 
 	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
 	if (ret)
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
