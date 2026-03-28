Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3903E10F3DED
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYr/PnfeHdjitYDnl5GasVIQ+IqsGpScmEOHUtTzeLk=; b=Pk2ymdYeNgGMqH
	Mz7GVIdD5kOCmApQltdVH1M9mUuPpbcKNeHkb2bkjMFVNYlLCV48cmLe/iXf+nPzAti9jeBfWdM7z
	SwN2+0H0IrV/qlV5c2JguhZWplCQlbrj9p6IlFJ5xmdjzpNssAIJcPaxYi03YtHUX9SSYuGAsUOer
	mC/YcIeMRkQDdImtJcj9zeCB5A3shW/LE2bkBLW21jxOfjAba+oHNVdrK7QZsfPxRLV98k+9ZZXg0
	+FNToJxsl86qHE88qTuIj1t/fYjJTCjybJwDmfAMq5ZmheMURXTYo/bE43yv41c0qVlCE6QVPHuj3
	d/TlIG/c6HoPxlfz+e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbo-000000099po-0AVk;
	Sat, 28 Mar 2026 17:38:04 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbj-000000099on-3M7K
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:38:01 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-50b2ebca625so28149811cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719478; x=1775324278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=N/gcsoNdHPWFmcAXpyVjRM/fHd9G+yuHqtzVfxWyFXuSzDeozi24NfC1TFwZ0q32f4
         ALjSgfaeH6CitpavBTIpd4OE0U9kTza9b1TVv6fgPcDz6e7lrfKFUBJhkA2XgmJ6pWl8
         RfJ+3akmiqm8wT73O+WGMkF/U2JJe1f3Q+4yc+6yfOeezueb7n9YlsNYtpqtb2neoky5
         gGM+A/0PwbB9TmaGkkqeuIU9TXiwZg3lhj6lh+DdBTV1mFTDshcK/ezyqL6IkUuUZq8T
         oBh6P5tjN0zB7D3DIVbFCpK9VIuZoUNOKln4FRYLPO69f4zMPPn4Br3trqbZEafNH9QF
         1syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719478; x=1775324278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=JlODKr3S1Mu2RfEtrar3RQvszPzpkn+GONANTwGG6OJNjDJW+fKbpDziY0XzpN0Tru
         nJUXv4Gnfbq+2WyEuA5DnkE5CL4lGj+2SUXip4v9txxX8080BPBg+uCtKANW7NGcWpBF
         EiSTTxY/uVPDmedkj5wF/tXquflysiXWj3cde9CR6w3sllAXpT9fDHD/QrKmNB6YDQbv
         N/OeSFWwifQAlIDcAYisEBiXoMLFk1SkUE0T1rOdNtAGOITw+BGWpw3rZb7ycpblfjjN
         /VH/wuv9z5JS3WTt9xOESEc+PSh4JfSdogoavboSO/p9XSBfJuWqioJDhfD1ZCovXS5+
         juxw==
X-Forwarded-Encrypted: i=1; AJvYcCVc+iul9qELKry3pTRsuUNaVANInOkNHLwAR+Kr3jns/0VsM3zWbjXSaH9eXB6TjZ6Qx6U68BKm6LVbRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1DOo/Ano1iqMfzYJLM8ClN7KTxGeGNxJmhAHWJ58/3lQ0pOK
	+xJww/uopEU6Rt3yPjx30R5IK4XeQtfZp3JvItTGb6w0NBvXbQxjvbG7
X-Gm-Gg: ATEYQzw7HRpRbCVjAfiRpNQ7hdoV4WQFmIpIZ2JUxllScnebotJ/Yyzt5tweHeA4nN+
	TwKXzEE6f80eP97ywQwsv5cw8EiNGiUVbdtL2uFHJ2X+mLYunyE8ZxZsIxPk/REKHtP35K91tOX
	U9yc6RU61ciSPoK8oD7cbZrYC+yju37yf60GxV48THfi5DJ3mThSIuhyUPGkpliavJ0XVVfK7KX
	7vshY6Q1+BicpQI7hD8uXlpWI7tNjOaSX3S71v/5AmuB7YW3j1Eutkk6VvRcnSCGWVtG58UQtrM
	n+LHN3eNv51pB5mVKqNV6woxgek4qzOzqADmKIzptfVci4a8VBEelm0Ja5iCwEs0HlPMm4M5tbQ
	kjtxX5huXpV6eBOnJL7Sym/0g7P/WGe+1PUwUdRI9ejmri7n5fI2mFio/frV32hPheb7lrMCuRB
	/e+OgbbFZsX6V4Y1fcHz7LfcpRd+jOQvrjqnkEE2w7CwojE3lkRb83emvM
X-Received: by 2002:ac8:5e06:0:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b995b5a1fmr123076451cf.42.1774719478554;
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:50 -0400
Message-ID: <20260328173450.219664-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103759_846322_63EFCA8B 
X-CRM114-Status: GOOD (  12.56  )
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193b..58cc6b70d8de4 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..4ae44b40f9edb
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb {
+       dr_mode = "host";
+       status = "okay";
+};
+
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
