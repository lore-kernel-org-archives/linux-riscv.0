Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD24E7E371
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1pyGAeKQO2IlKRn9PAwk/PJE1cYCMh/s6PxH8yVyLc=; b=agMQZvvkWElEx5
	MnJrG9OJB07Smluhcx5PoTrHTsVLg35LVjieJ67CqQ4AB0wRtraAgjusV68fXTIKmnwHc7GkZKYM6
	W5z1ptK1UiT0D9uQYvr+bzsIsjMPSrviufTFbPMnJSXILmfbepvXMm3FRPq1pavA8Xin0lsDdqUPg
	xmq8Fim3JQEOVHIK/oX8BNsHva+SWDjfeIWMiOWLP/ky1EJjOiH2xlwhk9WqfowAMtxv7T9EGAZlu
	wyT3XsV7j23MBQLP4ZPXfoOpGq5apfQM7gDwkjXAT71eubqXFhbHSDsf4bNv9w3LPudh5QN2Ewbfs
	3xEG4oi1ICkKm1XJJS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVW-00000001vpP-1y2z;
	Fri, 03 Apr 2026 11:16:10 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVT-00000001vns-2ojO
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:08 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cfd44fa075so246781985a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214966; x=1775819766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=d4k/r+71f1a9F4Pft2xmU/yYRpz6In5XnrsM5eW3Nh4wGtFrzw9szdmaJq0rKuDpIQ
         m3orxD2qJ/Cd6YbEwlp+ZC9UtHA42g9gkuW0rd8LgnyVwsSuu7mr0K6TG1gAAhUUIW2/
         KtbiYaVYgEcrxNlYT16aHebd/WsP1Tev1z+OGSta6lmB2o6bQMhLxqOkG1S5YBreVwOE
         l1D8uAJ/8Sy+LCRCdjDu8OExvuvvbER8+8fd3wjx5sq+C9UZbuwRSE3vxx+/kdvxf4aS
         G/IL8hZcrutxvE+w6ZnKW2883IsSx50fxVznDhtwpbcJ9taORJK27ddlbT+08rjkQF7r
         6UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214966; x=1775819766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=f+3UAftjqvcIcj4wHmPXFMmLicyFI+6Vuay1Kt4O3kHnek/5LZnpFZlKnS35xXdhqq
         /RzudTWv46a/DI1Kd2X/VSkd0rh3w1I2T9DUtjiHUuPRBwEv/X7ryZuKHsqoRAYs81iz
         tk+dqYHi1hQqyRTJqHJlos+PiHa9k36o52XWwBV7OcqhqUkcyGFKwZxQhkb5qEZ2WvsG
         3++sUFOXwcRNaUYd5jP1FcD7VMWnInEgmBlqt0EYIFWAdTZ8xwbflkqSsBGc0/XodRgY
         wRW2cbumIs6KzpA2IfDUz8pPqtBlsuJk8F9wScvC5VdQorF3QQO/hZ4zaVRzYgoJk/NY
         sekw==
X-Forwarded-Encrypted: i=1; AJvYcCW5RToP6H+m1gdCAXDpjY21s2+SqoKqQA7RqD/j1YUfCHkS9re6hoIDjOzDL0i4tGZyzNebO1NSvUAVvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZlwMGYm9nRhBxPb15dU+XdO11ml3GCl2MIsb84+kV/RbJ+aom
	4oBVg0uTXd+iPXOq62NuRJEh2uRzaqrk+X1SUwT/l4QxkdGIWyS/UKJR
X-Gm-Gg: ATEYQzwRw+GM0IJCVq8j30xoqdlGtohfwsshv1dRdXy1S8orXTUJJbidFbopntcTAxa
	8pwd8u3afzxoVh2S5xjogBJEVuGwJrSKG2UGeZYjbF8AHYEGrwrbFMKX6ZxTHY5vkn65+evQ7Hu
	9QIi977Wuo6+KENZuAoqC9zQZn7MJZ1MydinMtF4/ahvjhqIW0Ebi4tuhZagi2Ez31upbhPnc0y
	HeRZJVCnSncfHSmyL2kcuJsF00E1XzA9AK1rXK1IXZJUfjy4KtU43b0qeyfwTZM7OWxWTNV6U8S
	HLB4sDO/wkmIcE14hp0jnLKFUIPLTCOKqZMoWnbJpk9z+iJ2hCTnCwa672XMbENfoCyvJLVYOep
	yzS9RPpgGfiZHA6uo2GMfPiuRuGUVh2SD66jeancY3YvPeWiY9CoODzM99IpLXl1aoPPsiXdyUc
	eWU1e2opVoFaA9oVT3qOPV94MPqz8P
X-Received: by 2002:ac8:5785:0:b0:50b:4bfb:1653 with SMTP id d75a77b69052e-50d62cc15d3mr37333391cf.41.1775214966031;
        Fri, 03 Apr 2026 04:16:06 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:05 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:16 -0400
Message-ID: <20260403111516.379795-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041607_718430_A29036C2 
X-CRM114-Status: GOOD (  12.45  )
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
index 0000000000000..8632470f43ab0
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
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
