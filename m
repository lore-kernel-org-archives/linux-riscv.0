Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF2C3ABD9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 21:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1P/R6+ClZ5cI6gaqjoZtN84WGfNeBhSaG5wPocDswCo=; b=F2LrIE32yY0380
	sCpPtbimq1WsF/iYMpSb0gaYMKhpFDNiXnHSnG8c1A3icQfVuF17RtdlRX1yLBc5so/Ip94cm8LGB
	GLDgvUt9HtC/xDrAJdPtKVE2p7S9jXuPYOtm6yO+Rt7HwkNcolphBaJA11AyufVVS9gOAQ8//tJag
	w64/4pDfM5/uWsEd6VaijsGVAi88ph1KjwUCJgAMvn4p9VXp/ROcqljkvLkeJDqNV/SYl31PKvD4Q
	6HxPgf6jwivhVvh9o64/ktKHQwV9OSzi0Lo5zWs+IjiwF/xA1+ggZ0j6Hic92n7zUkoKiRZs08vev
	9TNiCadr/IAZhgfE8lvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExaQ-0000000DbKE-1RaA;
	Tue, 13 May 2025 21:54:54 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExZU-0000000Db6M-0TZk
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 21:53:57 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-8616987c261so197528139f.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173235; x=1747778035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=3Sr3iz+JbW8n416wRwALXB4hWSUyn8va1+619PTpvp4ypfMKwYM06aJ5ylYdJDCrpW
         USueMLH/aHA+Gr/0MYxz1kn5zIBKldn1gbIb2w4S8HIHiZVNG2MPoldNLeDp2QO7YA1/
         mVUEi+nBHrD1A5+yQnKfPFsAHjeHHdbbmFUpyid18qAoJAStfUUZJloqYcDJDz3c0tMw
         OdJkTNxmEfdwJ9y50Y1DumNRmCUmU5EUjBL3lKVAVxMjJG0dtUScmzmsNFT1U9oFaSiy
         kvnIq2OB0V15cHFwOaenFsBIBZiUOKBPMhIv2hlWOuzopfTqSu3XSM8KwMsyUefI+hMC
         YMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173235; x=1747778035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=Nfk3IW40WASijY8w+augWd4V2wRGpPe7NFQMpHltpem5lZDgUKGqoJ54yEEGkyKRZ5
         n5tbFIMcl6zGDyzcuKavYHlykBEzg1wCGqi2uZ3wU/X0LK9JfeDwzMrcRwdtNbZOoF7c
         gjaXIhUKEt2wFiv7kfIv73XonGVZPGZQtBeYYvSln+OF0U/FXbdNYpJ2LYUoQZLRoilh
         pyZEbgfQkrI7wG1GGDj3NEWV6sNIQyDO1SIygVzctBxPee8jmgQIEkHU7poqyMw4XsOj
         qjqH1Nvi1sVxHGVBKvxQolyfvxHsxEMt9rusUa359EYtRZ6zWAJd3QlIAiXzDBqoM1gX
         OPyA==
X-Forwarded-Encrypted: i=1; AJvYcCUg2WW6vKVZUeuOYhLLvQ9lY7Z9g+KjHPYwTeYSDHTYhYqrsrM7RHBWhhVQRL/DQ2y/fIRsPEVyePBD6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gOJ2J44kSiUrkoMP8liZ+5V7l/UkF+LKIwDxKYJ8SpxzRddL
	EbNjN03IdAIgF2mk12RZNo61PBShux+zE/WMq/S5HKR0f0xEuciQ/lii7SataD0=
X-Gm-Gg: ASbGnct/7PtwtvnokJ1s5stjFkDZoZR7V1T9C2AJHCSmgf5KFBdvaLtxM01arLmmi/b
	6JrNqz4SJNa1vC9eMc7c/k/eTN7cywdirl3d+K4nOSQVpdlB4csocl1fwFvQs+zqJ8cIBxFn3Uw
	DTPtzWcoUtjUw8mibuTZf/q6bv+W3SiElmHqLGNB72uTXQ2izh8QBySWhrq9/mrs98eDKTRqjHN
	dptkaY+hfB2yVzGS6oEmwbQcUo4fbhvdLczyJSwKSWGqeiAGJsUrC+AyoBQSa/VXZeoDlfSTKXf
	r9SxLkt3rDIsrkDGl98eogbAYaOAXofuKW4qXtc8lCybgLcFpw9TVPT2I7FlQlB0dm0rXpnkn7V
	4nDGl8OWMC7kecBmUFcoBUwJL
X-Google-Smtp-Source: AGHT+IFgAAov0WDbucAa2d2uLkEZNpDggOUKIJvl7ysoc5mJk7YSXRkmxd0htIHYmS45AM68y0mEAg==
X-Received: by 2002:a05:6602:368e:b0:86a:870:67b with SMTP id ca18e2360f4ac-86a08dd24e2mr166204639f.4.1747173235161;
        Tue, 13 May 2025 14:53:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] clk: spacemit: define three reset-only CCUs
Date: Tue, 13 May 2025 16:53:42 -0500
Message-ID: <20250513215345.3631593-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145356_151670_3FC48FB0 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Three CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define the CCU data for these resets so their auxiliary devices get
created.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v10: New patch, same code (extracted clock parts of patch 5 in v9)

 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
