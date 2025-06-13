Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A1C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xecL1PwcBC/7688kAOXTnfeSWN0RvrX2WIkp1TjPrtA=; b=2zUQ4BT9A0ajsu
	0G1SzcU7LBPdJZTvbIyKblc5hr+WmR1eu0bXddldzVmomtN0qijj/A1loYxz7l7J3sGXTPFCerwxO
	u8l6Elrce7xY7ikixb9lFXg+wK1Hu9vWTg8sNI/FRWKY8co3jstgvQhYWJPPFJEyPX7ggmHu56hI7
	dVfCeq9XRScgv6bfy2N2Jnh2g86c7r8P3ZNo+Dwutv0NIfBI9u/xsq8dVFoM5V5vKiPDxYY94f7Nh
	4bKp62I377d5nOOp7Kg7fmd5AXc5KPEILBzBPud/7i7Q7C31xWJ0VQlbxGdicPKwcRYeM1fGNNYVa
	Yo93t13rR0V7UlhIz6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxY-0000000F1ft-3RIl;
	Fri, 13 Jun 2025 01:11:56 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxU-0000000F1co-386I
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:11:54 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2eaad5eb1easo819874fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777112; x=1750381912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=qLh21fU84Ruc+fQ/5vxbvRj9ceUZCt/Rabkv4+5dHvZBaa5mpIh7x1UKoKDBY+mJ0g
         RZqmhhAUPk6zOL/D+Bht6PdDKB3tP42HKrTFvSNuRtT06TjWuf7dapOBWqrtHMC5hR/O
         KfZoBYtxeSTJ/8VoNzgZveAEJxnhuPk7AVQEus3YPDpM/mgXRVD/CjH31XGIR60A9CAl
         PIxVKRHq6A6gAWm8CBONr71VBQVn1bOIu6DMb6FybWYp7x6JnQb/Odb2U4E0WBV2/izp
         dOBaYejtw+VM4JgZQ1VkoZbggC+0Gcwjz60VXZGy5aYIoKw6OPdLkp3zsuIAe55/f88v
         fh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777112; x=1750381912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=E7GfU9qHnYd+KRsipSzL9OGGwI6WVmag96+4TmGu8M1Xikl1w5dD4mijgdLC34Ea9J
         dUne1FEG1Rgo1Q2MnsrGI/vnV9UyOfL7jmoJP/Z+5whB6N18Tnb/Ih5tboomRzyyFOE9
         dSFM0Sxs5LE/zWkD/ds/RmwsFftDwB8x6y/v4CwkqMe9XX72n+p22L+NdN+Qw8IVFWO8
         dwpznVzdAmT0sQJzaadT7DZHrK9Mvzk3HQbEbTT08RDfxJDRnku64H7JBHYqQ3XyMj6Z
         deSItKaGtsUfwL94poYc6LZcUzdq0Ja9neoXwcrOIuG8FmnsS0vCZco7OD72G4wFU6k2
         Dpeg==
X-Forwarded-Encrypted: i=1; AJvYcCUMoEVgRAIraKJXCybnjAVbzPtsrHmBNgcwq899RUPFYE8M1IVHdX0qILS3AiZIK6EY/6daPoQooqHExw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1tVHj13dsuWsI38hX2EbzvdSKptI/qeGz0FoSboM7eJFCCLsR
	gYHCJn/qqM4eOVS5iAUeEI4eYWdlVuervaL1D6zK8cbYsI23UtzDJ1JxJdrL8/x8ZfE=
X-Gm-Gg: ASbGncuSljA2fu99Pq2yxQQTyWVa2XrWZ/URw5QgO7Y88E80Ivw7yiD8FblD/GLlkOE
	RLU3sbowqaPNT/CUnkEGgqrVms9yw0YlXTVFPiUovL2G3yc1PE/ZwbvgTaAG4iA8YTlS5Q5G34j
	42md0jWfQqUQyVVC/Ppk2cBrqIY+FPSRZSko+3Tj3gu6b7Z5SqaInzr5HuQ0T2/lcF36l3Kll5r
	cJM40IvOQAqDen0dSzIsWfEaRnqg+6s/4YHxf/kKxsbVY9LyXEbmuNqW2R0hQHbVYUWM1p4yQNt
	eWQ1280ivOuXhNjMCDHmSJtuuImWzQsGrPlnUdGPny2sLJcdxx5Qk7MV9Idhpf+NEGZ6C7vzWsF
	M07XMOm6PBnApmJKnGEcRL7Oxo96gZlo=
X-Google-Smtp-Source: AGHT+IGLAOVwGQtHFMenQ5Pjgus0rfvs97TiY5MGJ1T6U7O3FKYbF5dGtfPW1aRPNW1u/ydyiJ4KnQ==
X-Received: by 2002:a05:6870:8091:b0:2e9:95cc:b855 with SMTP id 586e51a60fabf-2ead5157caemr853318fac.34.1749777111937;
        Thu, 12 Jun 2025 18:11:51 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:51 -0700 (PDT)
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
Subject: [PATCH v11 4/6] clk: spacemit: define three reset-only CCUs
Date: Thu, 12 Jun 2025 20:11:36 -0500
Message-ID: <20250613011139.1201702-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_181152_792918_F716C31D 
X-CRM114-Status: UNSURE (   9.01  )
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
