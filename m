Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B4FC5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Artp7mRu6C7jjBDRY5zgoEo+QYR/XWSeT+oQEwc+F5w=; b=bwWFXA2s3BcGXz
	M1jupA22eSkRUQDaAY8/DNFZiOcb8i5DzVLcG1Onyd1up/645yqA8m9hXF3qMN+HuivRVYRQohLHQ
	8/mM+C9cHv1CtswXbjiX8mOCeLqBjspy54rz1Wm0gMGVTf36rwam9w8x97rJ5b5yk/QZTWvMuVrSV
	ykcOtE9vbyuZPsOgXORIYviB2+5cpuhgxz9Vmfi2ULKu6N0x+TKc5MXYYo8ISdp1olMvC02JNtT7Y
	oKbXX6fD2jhSZJPiNWycMvOm+FVWpJ4ThBKjGoPg2u0y4oqfGGWZVXKsOPopwwL6zgi6aaL6Uh63n
	y5/B9Dw/hqm4RowhEVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE35-00000004SwC-2Tcl;
	Sun, 25 Aug 2024 14:16:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0r-00000004SHs-09YE
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4280772333eso5433855e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595275; x=1725200075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vyI734cRrZFj0A/p/jgke1T1ninVILNTlfgxfQSwKE=;
        b=uY2C2CIq+AkR79a18RDC5srSsUyZMLlyhfG2f+od0VEhn+2kfnMeYltAYwn4Fm0YDf
         MqUzQ4yE2ijHGWGv1/UcswFzxVVZq/JDoNNAhJmn3R7rSYZdnd8yFXjxmYMWjokpWdSg
         ghBXJ7FJYE+CPlO+cGPbvPUf8mvW+waouEhFDV9jJxpChKN2Mx1rwcQ6apFZwagyh53T
         K6auAJyiwZl01zzBe8EqOKgu4gmm/7m0GrSF3J8YwocnACBRYAzN3yFriuXJQta38GAC
         XtDCF6F8ieByqgf0poJPWbcbDKEzv/AmGa8rKf6aqKLlzmpxH4adUMc4xaD8bNOxl3gM
         VnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595275; x=1725200075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vyI734cRrZFj0A/p/jgke1T1ninVILNTlfgxfQSwKE=;
        b=HHn9ZZTlaMQtUkWE379hmiXDpTVWMvq2/bpmOxoGe4sqassaVsKPkAv90ydax7dno0
         G42BpH/ef9Cp/bWAseJeL7kJflhSFt74ZbHWiMeI8j5M5B704HUYb4lYvCkqiAtlBJv+
         nzRyCNuPv07FauStrvF0bTOBMN079/1C7z89UbH1acHFMLCDd/7OJ5ZSaqTyjQatgxw2
         gfCBOlT82Q3PoqHol416OPf1fM2kg2iKmQ5A0QND0VwVRwdiE2mDZVM8iPApScORpX4y
         YwdqC5WI3wzZOjOUIUxt1TRJmkd5xW51A7OFRb6cK0tXXlC53JcHS0DFClevqoo6kdBX
         /AWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgUP4TM+rRDslvNQZYXxxAZodROWt2OtUHNUeeKJatMV/lW98HSjV1pp2TKJaERElt0KpTkZ3x5Y93Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf2DAUqzD6d7dwW15B0JZ9LaTycL591QwiQmcLOfKLVQr0R7FG
	4rYs9MabGLL+2ZMAAJv8lKJu02yeEADKfpny41MTrK79aAXXe/vnWmSs/ZyBjvE=
X-Google-Smtp-Source: AGHT+IFak5e9TgxMwRV1VQC3TmD/nC7hYru8uGqId4jYQGfP92V0mB5tath7X71OxrZX1Y6HIUhsVA==
X-Received: by 2002:a05:600c:1d25:b0:426:6ecc:e5c4 with SMTP id 5b1f17b1804b1-42acca0c727mr34083495e9.4.1724595275253;
        Sun, 25 Aug 2024 07:14:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 Aug 2024 16:14:25 +0200
Subject: [PATCH 2/5] reset: k210: fix OF node leak in probe() error path
MIME-Version: 1.0
Message-Id: <20240825-reset-cleanup-scoped-v1-2-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9pgusit1pxrr+A2/sS7UfW0KAIyXH2HmTDW6oahLzho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxD9ZG4S/H4bpvV+Ch6/rnPSqPk9mJsU/Jxb
 DPFQLvB6+KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8QwAKCRDBN2bmhouD
 19lyD/4x8fa4AOkKyveVLnoZhsiOq4/EM63MPkrJMxfB9Vfm/yTnK2uzctxkuWPgDgB076mY76k
 SaMnFfbFkK8VdlwXcAX/zFm0PBTyRXcbKk7Nv4u01b8rHPx9IAHCFOM8hIwGIa03i6XNmsL5Uko
 t42t2QmGdu6UFGT4kC9GKB5YbpDuZVYys8UZdPTYbwFScrCa3qRrMkZFZJZ8KP2YPGNtRR/F/Ua
 NqmT68ych37x5XciGnCF23o31YCm6nU5COwcDG6I/N7hWjqMt6f8ur/bRKEJeV/BJWFlK+Y2VHj
 2zhkkrX7jC/eVXDm8L/zrU+aIn68h7lrDNgOtp53fekgqoPoQ6VXqmXGzYpChSl8atweHp1gDBr
 Q0/uc0DWw/Nheal0uryPSodVR2zQ1iqMoCxEPIa/wPHNqOcPOxjFC4OLs2tBViG6jaTrsWuRQBm
 zpVBbKkvEGSsf9sPZoNLWnyG6k9DnsXaaNoJPRC6EFXmpGJPnCIFAFW1BLmK02AWvLJ1IfZmIv6
 Dem+z3xlw1HPDUIc1VjoTAXgLqUVqUFiSWXjd4jYqUtCtbvsNqp8+3iMCsvZAKJuK7RMKQGLwOs
 l3/2GQjQD7VfbOVodIn3WKUknAfKn67Gdhj0ML4V9Fk3gIyBj93OX8kSoSyTxq2vYb91N1LAfbb
 6ZR51YIOEl0TDoA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071437_133312_FB91A3CE 
X-CRM114-Status: GOOD (  11.88  )
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

Driver is leaking OF node reference on memory allocation failure.
Acquire the OF node reference after memory allocation to fix this and
keep it simple.

Fixes: 5a2308da9f60 ("riscv: Add Canaan Kendryte K210 reset controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/reset-k210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
index b62a2fd44e4e..e77e4cca377d 100644
--- a/drivers/reset/reset-k210.c
+++ b/drivers/reset/reset-k210.c
@@ -90,7 +90,7 @@ static const struct reset_control_ops k210_rst_ops = {
 static int k210_rst_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *parent_np = of_get_parent(dev->of_node);
+	struct device_node *parent_np;
 	struct k210_rst *ksr;
 
 	dev_info(dev, "K210 reset controller\n");
@@ -99,6 +99,7 @@ static int k210_rst_probe(struct platform_device *pdev)
 	if (!ksr)
 		return -ENOMEM;
 
+	parent_np = of_get_parent(dev->of_node);
 	ksr->map = syscon_node_to_regmap(parent_np);
 	of_node_put(parent_np);
 	if (IS_ERR(ksr->map))

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
