Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1EBCDD1D5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gILXBfCjHZWt+Ut5zOzsY4AeQeuq+YP8E4lipUchJs=; b=RQIwrk/Yjt9HpY
	YrxbtoHC9Fqw+9DuvUNBaUf4/T6dTUpveqxREKG7fuqSs5CEZJdgp3JhWoNVea+J6aboEenw/O5uL
	GSgZjOIFcOc3kdWM7MhFhgAhB52hjMhvYh9uiI3XzJ9tkdSJjUQ1IwjOyUo3mLRUq9o+aZwgslq9W
	qu9dtUbxiGW3MvFcBMHEaZCUKExlUME7lsfa8axZ85cbveOplKvW2yGsnEuyNt4kSWO5gvN+5NCev
	xDIVLAO/RI65vCNryhTiH3VCT3ATS9D2Sjs1KOkpCLYl97/ICW/fxQaBBRZsYWZrv9m5QL0WDmHtJ
	H7oFj+bL3tP7wdDJakFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMRq-00000000gLP-1jgA;
	Mon, 30 Sep 2024 19:52:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQM-00000000g4n-0fRM
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:52:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b86298710so13086355ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725873; x=1728330673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NRnxFx/6PuIcATbIYTaNby2KfWgKmyVkRGZl/5vDNM=;
        b=LQuBMIMxwqCv6v1uByWAkocmM/DDX8MtR3KQtjeEFLRyGrPxKM1Yd3YOvZoAPesnzm
         Hh33bRc+GogMKP5Vxv/ZgX2AYMwgRGltf/0jBMNszNUVdFg9z0BdL/OLQko0tq3js3Jd
         1n/+qSqzOTot5f5PwaLG99SNMZoAkmtC6kUj68KfBVi+OHUeQcFD5r3KI8ZBxPGaWk0M
         Ss3ZMVBByPOF+tA9AZY3xown3m5OMy+Ewq/AR6zsv+lKTZRM2sZ/6Dt2XyDH2uZlAirc
         DB3rAnwpmTAafIZ7XCR71mSQnVqQy1K8norckh90wt23z4DBsSsoKNBRBo6WkcsQ8h+2
         yd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725873; x=1728330673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NRnxFx/6PuIcATbIYTaNby2KfWgKmyVkRGZl/5vDNM=;
        b=qTYz9W6fzxY4MnrTYQnZ9dmDCHgK7Tn1cRCLo1hADMrcZdZ4vgvjJGYzqdzR59xEA3
         KxE6fcdf8zUtsVFOG2gXObwNbsohpjFE+u3lCtuvpwgLXyqq+61xQtRId04pOZoP3xbR
         43HlowdshaTe8/CY7ofIiBpETE+K5ChCRcLa08e+iPzmlOhoDguO4qSSo63VCtf8YNss
         qTUhhD01WQ/c0QkZQLhwjLfmJClnpy2AeRlMINiwce8cnIOJRjM3mN09UBsIiHlHHsmQ
         tS2hlimVRwnkqJAKaYrI3fwg7PCMEDG6tpW4shMrP0cuvmJJMxEkYuWZUG10iSe5aT+B
         11UQ==
X-Gm-Message-State: AOJu0YxxcDyOEa1CPPvQrXUawWezhbpJfQr34k21csIWlXoYf3SC36in
	zIvnYQXqmKXkhlQFsJzL7dRLXWdmMQldyomnn8fXe8zYoLbD4B5hdm7ZkEw7EiE=
X-Google-Smtp-Source: AGHT+IGuWHV6QY4y662SIjG7e1FawYnwe5bYeFQsWhe3H7kSD2DKfvEjruI/eO2d633gVfYkMVb69Q==
X-Received: by 2002:a05:6a21:2d8c:b0:1cf:4da0:d95c with SMTP id adf61e73a8af0-1d4fa6f9a33mr20585388637.23.1727725873211;
        Mon, 30 Sep 2024 12:51:13 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:12 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:56 -0700
Subject: [PATCH v3 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
MIME-Version: 1.0
Message-Id: <20240930-th1520-pinctrl-v3-6-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125114_236888_CCBCD433 
X-CRM114-Status: UNSURE (   8.21  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index bf1c639072b8..ca84bc2039ef 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,6 +29,12 @@ &aonsys_clk {
 	clock-frequency = <73728000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -48,3 +54,36 @@ &sdio0 {
 	max-frequency = <198000000>;
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
