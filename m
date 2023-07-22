Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37FEC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvNDScIbYfBveIh3jLvVQnHmEvOVKn73MVby1IclXEg=; b=MTXufqEuFkO7O8
	hajEPyQxh6AmQ03r5olS0IDJYJeLA3O3N/zkpy836NQWyXNPZPlU3b9IzhmVGlKhBo0Qssa+fjUtP
	qo0dQQds2q+O91fCJmtfGmLZbMk9LtXA0QjlGr8+i5YTn+zsvMKWKCYtiDlWPjV8R95+Rg+fd7/zO
	A1RaEpAIRbZYl9CsOU2Wqc0ekFA8SRA1sLM2uAsOY/njPJdddoYAV2Jzwe+fjQE2It7rbLhPEc6e+
	hV1N435OwGf745HInkuXvM3FwfobSn/BUqfmRE9mKn5VEa8E634AnzsrsQ9hkZVT6AgJkNEGoQ/OI
	N5bfSKODf7ELIklbc5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKa3-00HM6N-2q;
	Sat, 22 Jul 2023 21:56:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKZy-00HM4v-1G
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 21:56:02 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666edfc50deso2026178b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690062957; x=1690667757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNq3ooibllsS+ZhvG+WZ/pKEIVkHTikeXp8/+4bIvoo=;
        b=Zvk+6o3mp1GMdDNIyKe1pvP3sneiDUgo19KNiwhQKJTBanqA5dfWnFClpbKq9VmUNo
         pv02PcLdEqUqY23UQko7HUIIMRYxbSaiAbl3TUyD0ULBdJvj0QqBsC6iSkXLh1YC/CYg
         OIjlWFvCzo/+FadPASi0Vj7n4PFH5i1xMWwmKNiXaHoocIkChA1CVdsXaMR/tbI1+vVP
         5CRW8vdBGoSszfhffKJ+Jym7/Z0glbf8TOctSYkIJM+0+75SEmiBESWeGKxZssOWzuUY
         xxcXzbO9870E9RNfdNsFTIsDss38VHGj9uu+31lzXEgZNAehNv3IocH1DYKQjnNpw2Ay
         tAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690062957; x=1690667757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNq3ooibllsS+ZhvG+WZ/pKEIVkHTikeXp8/+4bIvoo=;
        b=iZ7DeWpBGbnOYcDWqurrebo7vdhzdbH8uC0XQ4EBCSFMlx3RQYVkeBWylJFc+ZUbZ4
         9DyBWp4QnTqc4cLmEQRROxOVwmWjIQWXU1/hDYqk4OLDv6CqNHXasYIZBo8CuNzFtJrc
         HGoDlx43x8uhorlTpZ9p8qNj85RXuPKEdLDMlb60/+HujR/geHJDc6jjF505F6J7hedU
         8rYplMWimSeo3zWGpgb43lDbZ+0v7PQAcQA+tzdSQ5IazLn42srHkM1Py2eiZ8luwr+/
         lGn8hfgkA9214W3FCTUuhjkJH+O18xvX6BZSU7s9nlYHGcXGQMvztZh/HoZJzrjtv2NK
         i1+g==
X-Gm-Message-State: ABy/qLYQtkguB9Zd/mtuI061CBDnVquI79Lh9C8RQaTQm558NJT5yFIS
	guvd7p9itjHYJoRc5h16h02S8JIJ8/yOtEIrVi1HNg==
X-Google-Smtp-Source: APBJJlETDgMMQUmKERqHdpjyeUGuasuXqwF3qVJ8DnTZ2PhV8XDiCClkTLr65ubbixENCL+6hzLcHg==
X-Received: by 2002:a05:6a20:8f20:b0:128:ffb7:dcfe with SMTP id b32-20020a056a208f2000b00128ffb7dcfemr8454200pzk.1.1690062957244;
        Sat, 22 Jul 2023 14:55:57 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2a8c:966f:392d:7230])
        by smtp.gmail.com with ESMTPSA id e23-20020a633717000000b0056368adf5e2sm5517642pga.87.2023.07.22.14.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 14:55:56 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Sat, 22 Jul 2023 14:55:39 -0700
Subject: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device tree
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690062955; l=2149;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=+rZmnfftb0bAD+1sg0Qa75JPTOTZrN2NaupHAuKG1ME=;
 b=H2Yel4vLh8WU569bA3DeA3vPh7RYAVO9fVFeX+pv6CgRHteYDElL8T7ZRggo6w6KgbsHdYgGe
 bPfhHVnoHYnDXNhKHEDTSLpb24s4Iz6Nz3LvykBGJ3h9085tg/rcVVb
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_145558_426775_F305DE81 
X-CRM114-Status: GOOD (  13.07  )
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

The BeagleV Ahead single board computer uses the T-Head TH1520 SoC.
Add a minimal device tree to support basic uart/gpio/dmac drivers so
that a user can boot to a basic shell.

Link: https://beagleboard.org/beaglev-ahead
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
index e311fc9a5939..b55a17127c2b 100644
--- a/arch/riscv/boot/dts/thead/Makefile
+++ b/arch/riscv/boot/dts/thead/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb
+dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
new file mode 100644
index 000000000000..c315e5bd3d2d
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Drew Fustini <dfustini@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "th1520.dtsi"
+
+/ {
+	model = "BeagleV Ahead";
+	compatible = "beagle,beaglev-ahead", "thead,th1520";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0  0x00000000  0x1 0x00000000>;
+
+	};
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&osc_32k {
+	clock-frequency = <32768>;
+};
+
+&apb_clk {
+	clock-frequency = <62500000>;
+};
+
+&uart_sclk {
+	clock-frequency = <100000000>;
+};
+
+&dmac0 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
