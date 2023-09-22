Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A3E7D0BB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgIj0u+H+gJcImBli6LH5tw7QgKKaAXuv56fCaxRMog=; b=n9uxPez2rK/Lhb
	92lv6gk6BMtjFX9cKirbZfnbWykOBk14kvioCaH6+clnRlskunLPfgf0QJNYuzr71YkbgV1OPVNXV
	4Y9qz6uMOh1dbWYKBKmcc+VCQ0kFxBib5fY1VB7AemXkWWsCH/f2SW7k2AN83sGOU3JPsNXmfUCTr
	RKkEDe78Tdk+0gsfik4d3af1TJwnHuKndkBqcfJjKh3xzpxhIVgb34PVReuGp+qms0nX6DXU/ldkl
	79vADXS/p7AQi0mNqz6wwsTlz6ZBtMWN8x8gnbqlAopgyh+ckpckqItetJLWBpvdqQ8d0jOkXkOGT
	eHg/fZUAV4vRe9rEU2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKB-007ad5-1m;
	Fri, 22 Sep 2023 01:51:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK6-007aZG-27
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:15 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690d25b1dbdso1449926b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347473; x=1695952273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPEbvkuSlI+waNlJffRe2ktpor2JpDqdyWj2rz7p8Wk=;
        b=d2rl4tXBALoyf4x+5l9FSf1dSq9Oc/dKiOVPnKzj/HYaA7QkthHxd5biSsEF6cfxd1
         3JnE0yyzreSDyZVJSnCFfEsedXJOECfDFaOrLQ3WP0qtP4/Q8YSjMkid3nFiRKjLyNIB
         PwSvm5zZygtpYMUPUB4hsTcGhZuOBh05fqo+Y7PiVgl7T0Gr8bWGPym16xMu44zwted6
         KogwYkCmgrFvmJky4S0nbvg8JQ3uTs6LMIV3cB28FNS+0A5ZMr3B5R3Keww7i11H31t7
         +o9XCWeS1fvJuwEOo51RPwWnj/0GkMH8RUaNZpZiPHhTsGrQl1xsgFW+rVF87B8PbOfg
         1Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347473; x=1695952273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPEbvkuSlI+waNlJffRe2ktpor2JpDqdyWj2rz7p8Wk=;
        b=K/cZR2ehOiUevfyFPpooQ/CoAQdaDc7GcL73TCzYpR6b0CuoPANxc7NHar0KKl/7P3
         9UcXOVQ/g7UqvzwJSo1z6DhOztOgS8ZOYvX1RPb5WLMg+sEWnfkRclBBb+BKg478u6mc
         uHrGyuM229YOTM2as0ISxkU5uL/LwKiWOqFs1G1ETQ1HxLmdXzpYgqlmQMrRD2TT1Jjx
         u9MdLC1eZWtuy9lEQK1no8dlnfREoxkPD3epDEGvEaQPHlPqCQOl4ClOo0fds8DvyfpX
         lIzA3i7IbH5Qnc5zzAYfu6akdsAq2FJ0udkwCtBuKNZOlx9MxdNAnhLn3RCBAXD/hwr6
         1cvg==
X-Gm-Message-State: AOJu0YytQQoFflM8/NXsvIceaPlOQeoYqOkGZ591SsNzzNn5oqgRmNUr
	0vJjg0CAqH1UlZH7t6LSBahlBw==
X-Google-Smtp-Source: AGHT+IE4X42yF1HXpuaoHL3ejmIEJ9fFuH2zgYBey6U1orqlaNK7fEzRXNdULELkEbDzi1O+u9EzjA==
X-Received: by 2002:a05:6a00:997:b0:68a:49bc:e0af with SMTP id u23-20020a056a00099700b0068a49bce0afmr8809508pfg.1.1695347473242;
        Thu, 21 Sep 2023 18:51:13 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:12 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:52 -0700
Subject: [PATCH 5/6] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-5-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=956;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=e7hYW7QNhal0RaNuGY3AGvE/4Ei4UdLG9Fj7V3U8VKw=;
 b=IYvBWMTKLnO4eGhXZDaLu7J6cKyV/rnBRhIPRir14soBubLYnpWwdB1YUX5SiQQsnHUuOHFn8
 opoUzD3CmAzChvQqTcQdMtI/oVbApUhunFrq/jQQ+eMCvA40mghGlE8
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_185114_695553_419B1835 
X-CRM114-Status: UNSURE (   8.80  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add properties to the emmc node and enable it and set the frequency for
the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..dde645789b7e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,6 +52,10 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -59,3 +63,14 @@ &dmac0 {
 &uart0 {
 	status = "okay";
 };
+
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	thead,phy-pull-up;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
