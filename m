Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA45C369AE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdQdkBx2UHTQsGzFRrmp6FAAJwm7uMsYWMH2EXwm4ls=; b=JJCVv0MAHdxdnM
	VUT+5QZS2qEE339GaycxNHJfBKoQKJViGIq3+McRLfKUASBJe0b4AUfPbuslOcwrxIZBfUPhuBOi0
	BpUOwmo7crmBmQ+0TISIguNYJ40Ae8jO3cgZBmDw2Wo41uTD1wbLPOhroJexvUQ3SXU+jo35B/Vpo
	V2g3KXbQCTK9F9nuHfAkyxv58MjZmwAOBmfjslv1iLIUIq8FHbMk8FKCixCNRo8rsdWpbIUmQzQes
	0f7CRzJkF/HpFTrULc0lrP6QTG8nDCf/KumJ+bjesVihnSw2PaaEVFMlIagdEd1c18syiO/bDwRgm
	WZZ1UykxVENs2AJwqKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESD-0000000DvEl-1HcT;
	Fri, 11 Apr 2025 13:29:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EDu-0000000DsNJ-1Vxq
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:15:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224100e9a5cso21677505ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377310; x=1744982110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=DTZ3cbB6y3y29CvQFyJZvu6enzzznX+u4cSXDwXPT/co+2p/evdtSsfLdVh1pLpNVw
         05YqqSo+QG8+17sp7iN/nUiTrn7l5k1WSYCAoN9C5q32QfapjWbdSS9D4l09UnQ/MtHX
         L445etMqL0ao5gVLFBS/GAdhj0D3pDqFkPKLDGwV0PqqkSKnWxWYbXt8p6sS22qC9pgH
         WKh6eiNc9oTU/iCef9qWTziawCWC+N0cZpAMb3i7J46fIWf+sulcy0TkLhnBn9lvB9he
         LK2jwHjvHwmw3WiYseHrrFTJtZGAHL1meMcAyAzbPTJv6ZiRNyzwmIz+vNpxLCaD4xap
         WKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377310; x=1744982110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=E2Qd8XURGZM++aHqWgZYfoKTex0W/mFSxorA+LL2/RGmRATw1gM+U/DEYWn+kbJ0j+
         cNYBuPr7lgfK6/orsUpKcW++F6fZdnJL5UpNW7ePenIxtE8kgwYFR2PtUJ8n6wym0srT
         w3/ZUi17fKmbwQ9CmpPU3Rhnj3Qd1MKS1laI0jYHw846beV0EYirdARRatHJV5xydofJ
         LY2IPMTSzrVWo/BO/0Y44llGTozOdFAaVOo7rD1NwoTxorsgGQ1/zQFEnAK9dBz45EQS
         xvNee37za5xvLLNJ2U/eBvPhKqG/1pPjR1PedHlWOORnMaeFGP08PSeDyA4uE8gcF3X3
         lsGA==
X-Forwarded-Encrypted: i=1; AJvYcCUPeXgmYIowwZUrGT76+XA9rv9wnFhCOtLC72Lftrro8VX4Y4Caq8B01mJhUG0a3WESfj09/v5b3zwFRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbM7Qak5PJH/FJK/U7Du0uyVAXW6Y5Lo9ppEA1ygWkKXuNUGzT
	U/9pbmRimoLsBRtWq0yQwfxT+qMDO5sIZF9WJQSmAPL9QaEDggoeqwv447Y+X/g=
X-Gm-Gg: ASbGncvZ0EwnRY1+7ATC1qZerDm/ogyqAcqcSGlSYDZl9Ggcid9MFtg4QJbxPWEBvKN
	LpYfSdBf6eIqv834Q2T1aBpMbP1eqR6qtgjxQ0RlVqE5oyUUOYYPO4P5w1YbVCZR32LxL5ZYxDr
	psasSsGRiSfn1vaN5AjJWPoOqdP5CqKUZcn7wqxS3uyKkXGR6GifXKfeRpVg1wbWFtiNQDXNPHW
	Nz/0BhvwPtay+wj9Dg6BqdFiZPqM50n8cDTXiVx5GxvHAaRziwa5nkHeeG/BQcxECYrEPVMhZCB
	IRpaL7KyDQbOReCbQRsmqTBlvjAvZW8=
X-Google-Smtp-Source: AGHT+IHIndEecRT3AvZxYCriHYkwaE37vFsVhEAY5FozYiaAsXwZj9EbWpr4y1scyShWVdTuh6BCLg==
X-Received: by 2002:a17:902:dac3:b0:223:66a1:4503 with SMTP id d9443c01a7336-22bea4bce88mr32987205ad.30.1744377309837;
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/9] pwm: pxa: add optional reset control
Date: Fri, 11 Apr 2025 21:14:16 +0800
Message-ID: <20250411131423.3802611-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061510_403944_7CB1B4B8 
X-CRM114-Status: GOOD (  11.70  )
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

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/pwm/pwm-pxa.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..dd9c6af0f672 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
 #define PWMDCR_FD	(1 << 10)
 
 struct pxa_pwm_chip {
-	struct device	*dev;
-
-	struct clk	*clk;
-	void __iomem	*mmio_base;
+	struct device		*dev;
+	struct clk		*clk;
+	void __iomem		*mmio_base;
+	struct reset_control	*reset;
 };
 
 static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *chip)
@@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	pc->reset = devm_reset_control_get_optional_exclusive_deasserted(
+			&pdev->dev, NULL);
+	if (IS_ERR(pc->reset))
+		return PTR_ERR(pc->reset);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
