Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0C1C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGGigu7U0ImHcepqqO1pP6s5UumhWg+UxBYKxf3FG4E=; b=DITQEu2Wg/JovU
	zejuIE0J6FUZHU2mEO4811nFfQWEzaKkbZkVP//UOakieHSJ+c0eNCmGzEBbtkuK6fwYXl/gUY5PW
	c4cEfsBIymMf8VOMBhRdYsxIYzRyWz66wgNs4VyM4QZKjE679qeFUYffwocWZmtrqkBMmF0VWp5Lx
	7GbQOR7CCGUZQ7//xkUmZ/XCHE/lysPVaLOZTHPb/XuHMnn89/gBf5fIpBC6bjNIilsPs4d5FGGFe
	v+76aNGHr1zAg9qKGwGy/pkbJAQFYn5kLSKK3Sg6yVeSSJ0hVOm09NFuvMji2FDbeK4u7G0uWwvoY
	GKlaWqucfaR0fREhb9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3V-00000005j2D-1Qlo;
	Wed, 26 Feb 2025 23:43:09 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3R-00000005j00-3f1z
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:07 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e672a21b9dso4031656d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613384; x=1741218184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqQoHTg7agUCd14WEWX/oWRFNn9TygqwW0Esl6cK8GI=;
        b=JMUZ5Axo3qYsrPTXSALrIzmm4RYFlZ/UfvjTfEKxgu6OSlcJrC5DdxJ1Uw/FT6UEYS
         49TC1br9FXrC3FoWfQ7CdjrsQWKCjyC3lAgASDkMpJ5RLmi8SITqaJKFfBfoTTLyeTjI
         O9EuNyzdjkK3/mGdUUDrQ2N9SKNSbK+EuKO11vnX9KJaR06XjBJWd5hxH/4QL5YAe8hp
         631WdOu4l/lsmah3atmF9/6xBk3WY73FY63CNuH5l3YAeRfjZ+SzP15X8QYGVeplpoBR
         HfUuoBIhPESyJpgY45gfve0XT8ZLQbAGNcX8nWtRmEKMvMh4nxa7Vzo5+uOel6fFJpx0
         gESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613384; x=1741218184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqQoHTg7agUCd14WEWX/oWRFNn9TygqwW0Esl6cK8GI=;
        b=iiU2AiIFQ1h+j10hstBJfYkQ770B9WPj9sA50Xr8TfrhClhq4k3J7KMIWdjizq1SKZ
         w/Zh0g6eUrYTx3kt6Ri+ysJ/XxjjvhjuZMQ1Sr3PJ/RU4gX7pr4YUgdAByrxsWrTWpi6
         rhLk0sA1YPAxMGLyfwKLOUT+QFJWaY9Ol9oq2Q3HCvBCfvr4nTkn8P3PazHDbw+bBWqy
         18PalGPj1CPYqMinRA36oooY6XqEyNi+vVV72A9HBGAuQSAGDMyzRUHxYZwadyNs3UtQ
         w+QwYJczWWAmEZqL4AJ9t6U7q7vy3iCGX7igcXPvWVafjYd20Ts7ECMsaKl/o5HcfnFt
         0BRw==
X-Forwarded-Encrypted: i=1; AJvYcCVGQfJ8QtQ7O18vR0phdbI/Uyf1ayefDVjmA6CaN1ZzcU0MC/pfRWNEfDe9u0vvwzKmgUcaQqAfYH3DqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7I5NSrcwMidPTYmDBQWkRn54DQ8Ey+POl0jsyGCf9EeEazq9P
	l1Uc6bpWqflM4dXyzKHs5UaX8DSsS7u6tthVKZyhU6oo/piF6zQW
X-Gm-Gg: ASbGncuBjSNlDRHm9TgBBsb9IP2r8qAa9NcQYlS85hs+16cqgfJOwUb5eU71ExJZXYR
	RwSTL2l4I3EVCDr79eDxrEv0Kar1POCDXx9aRT7AjjHOtDZyJ6C+cdwRUuom/npOq8FA2u3nIME
	SBgH85XUyQsBV18IdgABhLtkLFayioXflhL9Iz980VO92aYFZw2CbK4hZnLdk8WR/K3Q8sRDW+G
	A/b53qQJr4OHYngPR62B++W4i/NZ1fr7ekI0rwiTrabbhLSo1/t8cNZHxSRpSK4NLnqw8pU9b4d
	9g==
X-Google-Smtp-Source: AGHT+IGamOlB8L5DPR7KmoFMGsjzwDrX/7GZPr5d7+DS9KT5p5K9ctOUhXRuQL0MoiV6ugPJfD161A==
X-Received: by 2002:ad4:5ccf:0:b0:6d8:8109:a547 with SMTP id 6a1803df08f44-6e88689b91fmr79086796d6.22.1740613384532;
        Wed, 26 Feb 2025 15:43:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976d9f19sm2383616d6.98.2025.02.26.15.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/5] reset: simple: Add active-low property support.
Date: Thu, 27 Feb 2025 07:42:30 +0800
Message-ID: <20250226234234.125305-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154305_912160_EA2F7F9E 
X-CRM114-Status: GOOD (  12.57  )
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

Introduce "active-low" property support for the reset-simple driver.
This property allow users to mark the reset device is active low
without adding a new device id in the driver.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..4b08f8d70942 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/reset/reset-simple.h>
@@ -190,6 +191,11 @@ static int reset_simple_probe(struct platform_device *pdev)
 		data->status_active_low = devdata->status_active_low;
 	}
 
+	if (device_property_present(dev, "active-low")) {
+		data->active_low = true;
+		data->status_active_low = true;
+	}
+
 	data->membase += reg_offset;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
