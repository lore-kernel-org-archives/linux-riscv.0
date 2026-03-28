Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581AF10F3DF2
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZX38q1a1vh4pS7h0frt2R+wtjk9MxUqcg9FwsIDUB4=; b=SG2SAriCEPmjrF
	ml75YgMEUW0ePi+P9a5NNRf/yvP8rrK013G5SOYsru3WyY/R2ui3hCAdErSOslX7qjtd1ElPBgEjQ
	sGfKczRcHt3fBOkgIuE/DrrgDDtMUR4ZIW8Ot/I0PWSxokXHvquQjsYqnSCjA6giAaoryl6qllA7m
	4ZvazhmeAJy4qfGV4q4PmYwC0v+i/m1/lCoTuyVLEhCPvGbI4peXO2SusrWPGhdNzVnlta6XeerZK
	TUdNxYZgmhiQbJaD6xMyx5O+3oiPiIkhDxXINXtP3Kdl3S8G0NRTJOUR5U4RftESqkqgtJ8TOolMY
	lm7uw5ovfy3otEUda7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbf-000000099my-0XVz;
	Sat, 28 Mar 2026 17:37:55 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbb-000000099lE-2NhF
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:37:53 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cb4136d865so400788085a.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719470; x=1775324270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=Ds6JXVrE6zOmKHGlyl/kn6Wyrqj4yjDzjUKm84AOk9ynHcK7GH5uodZiAVktFoyS24
         whSSM514PpEsCjuJWSObrZmILJNWsG1vKKiQ7BaIWSz0CrHo3M37PmCPC2F9peH1vzlg
         vS9PZt/F+s3d+WkQYVZ1ZmvZowXWuYdd9AYEEb2R4MnL07q/djlS3wAyWTJ3HfI1lDzg
         s1lZXlSPop+J751Y+0SKygMjVAxV3k7wGmOV69ZyKVu+Up7PsgSqcFY2apAZLwhSAioo
         qyXlz3lmUUJskCTQt9LoOwRP+2vIskq1L1TtX59NYbg3TYXYPOKVky+nkS7/eFVKvw4+
         pB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719470; x=1775324270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=cea0QbW58oiNe8LLULr2GpDLpjIUOnIgNfddia0UcT18Fhft+i63s0Gj7VlOiCzTAJ
         PIG1G5dhuva2SXzYcY2A/rCUAgR6NC3FVtGoHkgJY/Wkri3s2qali7OU6udIne9K12Ly
         HqHy961sSHfYWKUpPCfDXPKoR0TmmuWLGuzNOUQwdLjRe+cLfON0ku6z1UmvCsfPW1K2
         Y2jUSSxIOa9fVopzTzdTGhEaO6zep1wkJbjfFVNQTj6MUfqm7S75ZlT6PDjTfL8r0EpS
         nL/hxXqjcNBLXHxfAjFRWN75X2keVwM2lGL2vFZRMdgsLBlFoX1d/4AZY0/fUd+VjDsN
         CDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7WNBUu4ZxvNcE7yyn8IiUF7QGZg5xwQZHInpcizWpqK4Y43xYbONfl+4Vib3cEXMwS/zueXoV9V91mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLVtWb+MEYLIXWtwjrs0akXA0NEKjt6pu+3Ce5M/I5uR4Zl+Hq
	HxI7NS7qBAoYCOiLhplwOJvSmNm/whKgMgnAB34IZMR3b7oLyOqYGDRK
X-Gm-Gg: ATEYQzx9xy3EIjIJAgNA8MUV7ZWYoFCu/RqXFLCafM3SbG/8aDm5AICR4rehcjWpCnX
	sYQkHE3Rl6IsnziuSjri4s0KRVtuKnA+k98w+r5JslSFj7O4fFH+tKuZnadkLqpzWyjmpJmXcM0
	Q3jhpFxSbrUt7fXU6mE9XlwX4gPdxKhK75/yXH17Jo4kJBK+tcJ1fZqc4OMSO8rRy3NGNk/evD2
	UeJpuQeezy+in2mfDJxZQBjkuo0ikjToU7PSsob8GFrhbcSpZPuz7rtIulty9VT1tbL9yE7fX6O
	0ljvyAiMZhDXfi5pgY07FTv2q5OKlN8b4ArebxNofg8ig/3TR4xzwCA66FsdJW9PBrA6hzY3GnB
	4rAClGxx+7sIWzQtg9Kj69oJBYccC557nCX8yVkMDitPexV7nHVC0kOkEdsMlr7ksUWxfx8BwRS
	uiiAaHyQPw1/FM2g6LLMoZGGVEv0xu3lmVZqQJ5xM11ZuNELjUvbiUchYfweQCfGat3dc=
X-Received: by 2002:a05:622a:1e1a:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50ba385b769mr93585621cf.27.1774719470058;
        Sat, 28 Mar 2026 10:37:50 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:49 -0700 (PDT)
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
Subject: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:47 -0400
Message-ID: <20260328173450.219664-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103751_854447_091A41E2 
X-CRM114-Status: GOOD (  12.61  )
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

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..4ae44b40f9edb
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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
