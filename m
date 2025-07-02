Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6440C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xecL1PwcBC/7688kAOXTnfeSWN0RvrX2WIkp1TjPrtA=; b=aibnaAktqIiZDp
	62O//scaknosBWhWRSj+KUWsZkpfuRiLqfHlSa6QGSCDP0/sdHN5qrCWaV2/mnDnDNnxBJCzv4b1u
	3Hcc3wKwryPaTUu7eAA80fofbb4unPIX4XSueRCwJqwX2X474GS5jpI9gA8rCKSvI0gpt5h60ZixU
	K/NnyW/i0Dt8J4mkv1naGR79fcaNV5P+UsWwfklWrUxtH/WwJbKQUJLRRsZ5SxdX8dga5JlO6MqZC
	yu22SUDQGrLEsKeQO3beoPsZSkxBuGi0hXR8sNpoVUoADw6LFDDxRxWj/494V8O3y0F9DUpaYwywy
	Fjv+zbaYIsbVrs8OlEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwV9-00000008Ij9-1oO1;
	Wed, 02 Jul 2025 12:23:47 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvmC-000000089cE-2fjS
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:37:21 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6faf66905baso51644006d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456239; x=1752061039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=zA0OQhQgEDpJIDbDosTVVGoCLDtpzLUR0IRzzqdiraEVGM52a8Omf+xF289bgDloJw
         O7y42XRIl/rsQa6DuNdlHsu/+TGRITSsSTFpyjVxmPuUvPG6XIFCPwNE9JkK8kqCw3df
         D8DDlI/dVkudvJyiQJ1eqvjT8dCdseE6bIAVoxVdUuAEn+s5vcXs3hahgiXmc93Yohbl
         pfJr1pUu05xsikdEEYyFWJouuZrwWiujUh61d1n71hri91TMhcxU8oo1icW1e2W8QKn4
         LRlDQObpAcNGDUGWJPHoUZ2/PgyxWJz8vloWln+vqR4jc0Qkne2e07N5jOC564+CrzZa
         ZHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456239; x=1752061039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=oq2kzFC3ddzQ7ZiYhaVIDd0Gj1jnuPlchpXyiwkLNdC0k0iwI9nF+gEHHioKrrhJpJ
         CX6UQ9EAAFvSmw7FN8KRZsrrdC0NP8CziJM7PrMVQ3VRPZjHpp+YiRacfMJNjdrnXDVc
         1KK9FJz1LY/xcqP7d8sqmj1SIpOOBuHxpVJ2DWEwWTy/DTsemZ0bl7ZqFTEEExwUQ2EZ
         5rqVJtRukERC3FXLbQevsTLd4reNnDKZjexR4Ahvzqlv41+Tejlg8HENyIeBLHE6QAtF
         59ZrK06I6IlsOiyK3ToxZXlA7x9NmHRoIM0JD3iNbHp7Ks0qrdKvbQc/9i4gfqm1jjR9
         ksDg==
X-Forwarded-Encrypted: i=1; AJvYcCXWmqEeiiys9b5+ufekZO+1I/SrUhZcbq51RsPSmrIG8eIodVcnvsa+CYbexnKzSJ5lVNRrEXmunEi2yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKrSPmUBNA1rfGopaoItcUMXiDltyzUnZeNuyZ//BMJWqatOca
	hYwRBQkR5B5M09/2UoeFNnEYHazhxkZ9Usd9YPkx32CJgzRVy5o48IUC6taeLJIMqIM=
X-Gm-Gg: ASbGncurhgOBZIjIw+nMbL/v6XIatKwfqU95gWoIij/axve0ECrnxaHhFDufTrBAOx4
	IdWgCoR20O1mRzRs87mEjZNUt41ZfjnwU9WUIwISuR0kavlRcmEHNsrRMfsgutG0GYfsLRGNrt1
	5zgpgH4r14sjIS53zUsWQlZg5SALmMPjW5YFae2OYca1UvrsCc/0zWrUBpj2tmPKuHIo7jXr9Jw
	M6DPbOK7eATwX/risMl3lkv5j3vo8UF7u/xHACe9aV4gO2WAMX3Qx4L1OllApGMR5iDIQM9rOZi
	KI1/saDlMZJ+CB1tcWu/Udn/lkzYJtNAZBJzsVk6TllWAA2fh6zVCc090UzBa8xP2oRkwXbtf14
	YPeuvWz+1/xvHON2TA7P1rwmkCYOWfkjJ2IE=
X-Google-Smtp-Source: AGHT+IH3LET1MT7KHlQqUntAkhS1H9AgE3UHH6mD+JJGc/1gby2zMVvKDZcLFLc/p0vmKgudXAnAAg==
X-Received: by 2002:a05:6214:2587:b0:6fd:6e94:9dee with SMTP id 6a1803df08f44-702b1c04d50mr26220596d6.41.1751456239572;
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
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
Subject: [PATCH v12 4/6] clk: spacemit: define three reset-only CCUs
Date: Wed,  2 Jul 2025 06:37:06 -0500
Message-ID: <20250702113709.291748-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043720_673197_BFBE056D 
X-CRM114-Status: UNSURE (   9.87  )
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
