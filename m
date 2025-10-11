Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D61CCD185
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4vD6TPeRNys+RVnNlGjILc5Soa7gMx6XNfok1Cz9jg=; b=h5PVK7pjk24M/9
	BcsiFlTvj/hZaR8pKoiJpiCKyh2uEN/Qmg8MKvXcJ17Ay94JLt5sncm6ReWF0ir6IaobQs8J8LlS9
	NzUc5WllRre3e69QtmcZD7wrIJpCIeVJCv4p32QwFz4JknYSRvCU+Dj7kCbpQGChLJfMbWyO5k55b
	7mGEJ0M/kq31uTk+NMIlSGb1Mpyo6bAiftpy3Qms8Dj/5Dz/PljakggJay8S97Q8Ekd4Isu5Yiv8Y
	t4CqifpR0T4Qo2yhqHXFX+66tJ0/irTyHsH+HVrPvc1xAuX2/oWFEyrp108aZv+uiwxad3hNpNweO
	draGOxeLkltFfHra8Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oit-00000009fNQ-3Nho;
	Sat, 11 Oct 2025 01:48:39 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oir-00000009fMT-3tbG
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:48:39 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-79599d65f75so27209706d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147317; x=1760752117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oejoysCyRvNZc8RubBVBc9+bEcKo+X21zvQu6th0wos=;
        b=hKopNO+OhjIRSsuzX68MyndgNuzMYJTHy0b4t/sItMzGqMQYAw6WxIUM/nO9Nh7THN
         R49aGKjAF6cQJCv1WDC/dYVLU90w/OkZoPalEUDXUYrHEYljPTReoSn3CpUqjyr2oovk
         U0/JZhqed/WSB2NsbsW2VNDZDwospyfWgntsyxrHj7ESv2ypmhMcF1ruoJ/fn9vaTbQt
         NF0Cq9RzAPS/yvnzJs3Sp/mTnEO1kNeqgaWWfFPeTEJC2BHS0X/0xXTW1bgc8pYSMHiO
         7wOvUnXfg0Sa+lWJd1XfpWMSLSzXI8/bGlmUKq82drXxoufOqiMuIJcEMfuPgNGoWLFQ
         QnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147317; x=1760752117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oejoysCyRvNZc8RubBVBc9+bEcKo+X21zvQu6th0wos=;
        b=iQUiLOWgckSGiMDlewWpj7p4PCUsv8U2s678dD4IH1IXMmaGKaF4K7VYDgkV6iDmUi
         maJWY4b6LAFbU0qUSZYpBxHZe8wdewm9FvpQl52n0gnBn/1F2kM2Msq/AB2So3S/C2gq
         pZJ2Mvz4Mdz9yc8krIBcba+c/LTgcHzDcpZzEDNrv7d+v0hjxnUAWfJ0ZVKeTGDrAYyP
         LPpCf1l0rKfZU0XzqHiIvsKz1D3l760GWAPTfhtFxDNNSPXvUV04P6oMneHWKjKVVbFE
         c0qnqpsmcemQHgWdllY0azrviZjm5SJpd06lE4rVvEmfxRTQhjM47A2+ia0bRMwlm9AF
         VFrA==
X-Forwarded-Encrypted: i=1; AJvYcCWnt+O2czB+IqUDKhUSmAJmFl/COaonhDI6DiFeAILTqRBy9agx0ovTbGFHFtUp8FCIMzeJDgVx2hdqRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtT6bNL9UzTDa6Js5zQ1yEYqBnabPtYKv13GzYXIjZn7PoSGRh
	MaYUIuig+oXu29hSlcXoyJlm5BEZt9RXwLT+BgLvaNTNjHLwUlihP1qz
X-Gm-Gg: ASbGncuj3q9xXZbaqv2+oKFSsGFpRWjItuF5y5WGveIV4BISg5AOHUBdEmNvnIYBWKB
	KIKPd9XnIcLRmWZsSAsDFcT/Ri233LbnFNecKygmhKZbHj0OYgeRxiR1JOryXw15ewYNQ5zaKEd
	/Cwnw11crpgVjpdxrJqIe07t/oQ3gG+YkzJokoHOmueus7/T2j0hINAde2sdBNTydI+odPL7RVE
	sYhAsdyLr8xMxdJ7grDviXg0rn3HyEC43r7svRflERKvP62sMlL5sUikjvIp6egQXqKPz1r7Cm6
	IRnZ5UobGUaIImpzY4pKfY0r7QoVsl4cWNbueM84w9aeXgpYdUTDyRIGQ/xQZxg/rIjdkI7d0BF
	e/Qv/rWXahTnYzjAgjDYE7Bgi7kb7pODVUknSejcJYX9/awK40sPCWIANsJjYt7lcXfAIFJ7YuP
	nF/+7EEpWYtQ==
X-Google-Smtp-Source: AGHT+IHiXqoUTtOihGm585f96hbBlUqNsgl2OSPoo3E8F3pjHpP/jA9kRegIoSfLchXG4S76xsmNEA==
X-Received: by 2002:a05:6214:2584:b0:7f4:e1a4:e2f with SMTP id 6a1803df08f44-87b2ef93367mr188420836d6.51.1760147316939;
        Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:10 -0400
Message-ID: <20251011014811.28521-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_184837_972546_2059CA2C 
X-CRM114-Status: GOOD (  12.55  )
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

This adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994..68aace728223 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..e9afad6fd106
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
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
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
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
+&spi0 {
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
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
