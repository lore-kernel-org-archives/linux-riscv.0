Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD18CD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1pyGAeKQO2IlKRn9PAwk/PJE1cYCMh/s6PxH8yVyLc=; b=lKJXcBvspdIs8N
	dk8Muw9+KGu97KldvTjFVX/sxwoyc3K9R6G1m2MS+Lu0nYUxMmPx998wjw+q5w3Gv7fUxxBMUD9Du
	WmPrLoCGgWo992aS4tSphnkvLMe+XpHIBoq3Zbt08+mrNdOHWkHeUNTe4XSZWKG303tBoUzYUP6pc
	sF6uaANRGLFB0aLxThcW0uNEIe6zDwT/UABJJKkgc1im2lUEumf7kjsdsdD8jkmQW1V2OU254TxX5
	hOtXIQSS8Ku/bBCtrR2q3MAWtC6IQH1yIRVAHD9m2xtvX7hjEzH8PXEZyB+7bTpSW0aq8SDvUClSa
	YitmBh0yjoi+uEGUY6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNb1-00000008yF7-3a1p;
	Sat, 30 May 2026 17:35:39 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNay-00000008yDl-3evb
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:38 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-91550dfc11fso5811285a.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162535; x=1780767335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=P52aMNUm0kVo9DiWhGanQHs3NK886266Z3Ex4dqofkhdFI1nIL/3saeQx6XiS0CCuZ
         QwLR+uOUpT49qfpL2Ad1h8wLsjMX3MIh53M8ylxkkyXd72kbpExbsqOa0C5O0mh71vP2
         Pt6Siz/S+/CwpQKeBmvIXHdydIaeXh9/TAwjw4cwD1q8dVyr9MbHWQENQMTCy0kktqJt
         sO+CshlWNHfAbxbRSgWzgGn2LwsUosvjsmXqsGCgdXFCLeu3BhGNdpwPkJnvkVXAxZLJ
         bcD+NxP94njCBMuvyd+GJMnxZppUGfnUtK8r/y6xJxYhBTGQjMW0ViRMUnRI60P2bBgG
         7lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162535; x=1780767335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=EHtTftbjoZ08VlOnrfPJd3938acUbfCB3QbTPXLlz+XhLK2JqnjiUXbxSZ4wdq3grq
         SbhaEaBQYt/du4GfItP/zPC62SkFAm/a3x+nNr/LVwI8egexe1p1PLCEwbCzk9ioIezR
         uHWg336hwwFjcNl2KwGO3Ws9O5MvDVZpV5Hulnh5iVFuehoNXgBjhWFalJAl3p42gaGS
         UX0HiQHXav0gruQ4xBUUMPzEQnmGG1AeooFy1k013GiNgY8BHxnOdRevgdk7cfB2GjTU
         KNuhJ1tt3KFmP1l2tdwjtHs2rSrGPQ+Tm145ELsNYTgWMNFojzkDbCwIqqi9rO9rjYFK
         zRDA==
X-Forwarded-Encrypted: i=1; AFNElJ8CN8HFNW3lghhgt/ec8tol+ZcYz7GIWs30LwK0srH1nvlgHSxxSfeobfDy18izkaqRVfe1pRPGIZuJTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTtBk4cBk6/qcOEzjE3Rym6cz6umlUuzZGyfOhTId5yDZFvNdA
	n7Sqoop4bwrct1CPeBoFp0jueIK8f5DNTlk+nZFRC+TOfYn1IeiKdBUV
X-Gm-Gg: Acq92OHr6gyRjhd+p//WVqEFzVB/845lK4PCUEeDQlCKL6mHFyRWmbVSUPUn8vmbYG3
	oPiElhvs/eaPdFXdI3etxJBjwPpNmQWJCeb8KKp2H7RFDipmeApdGsiqfulBVsj3DN2PRKOdJmY
	LfAFab9gafgzTIWTEXFrDi4GDQGezYBk48SOPVUKqEEKvD15fs67GJd3YNv98O1r+jqCBaag33Q
	FW8WurK0c2H+XMrAtlV69yDWpVe2QrSU+gTz3N19Ug0TAEEYdEVwP4da2Wtd1j+UiEcc3uEf6cV
	6Pb7bT2B8zIjUH8WbIMZPC0fYa4IlNL/I3BFKNWDL7/2Tv/Hb5hkvWCJLNagA8EV1RiVc+4PVoG
	UI47DotW1PeDFS8nh4rCoG65bYUKlDfBKByROqz3RlfnlYW7gfInYUvjfQFQmG2mXpI1xQcPp33
	HGlwq+XHwRyf56h2X8ZIEIvbsPVsRIqgCwhUUk7cqAUz6Y6k059Pw4+jSkOja9jbzkV84M20Eol
	jXkqQ==
X-Received: by 2002:a05:620a:27d1:b0:914:e6cb:1e74 with SMTP id af79cd13be357-9153d99de4amr681017285a.19.1780162535602;
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:47 -0400
Message-ID: <20260530173347.33533-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103536_933808_ECA8E9F3 
X-CRM114-Status: GOOD (  12.84  )
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
