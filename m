Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B006CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6gvGkU9abAtmEnRtexI2fC4i9VQOu0/YKiitRdp6xA=; b=smla4JU9ad18u1
	jpp2bJBxfNbxNFMWQGoKK5nCkfxiJ98zIO4dzaxE8BPHBvw4nXN61YnlKlZU9IufLW+5u+//ROC++
	lydClwO9fBIA6EjuW3hZd1ekF74TQkTH/KwMXkHibEVrP4ofCAixezx+vpxL4+bYzJMxszw8o413+
	aruQM/9KMfzcmenhNsY0uojRxykfHnpYuX2T/ctsZwLLgsHdV8Xtn2tWcrPaXlyJe7Ad6gZOuVsFK
	AfbTQuioHqgMuQ9wICpMfAagHwSoeSLjSHeyLe6uFZXAtq7XtlyFHR8YZ8L1MIR2sW4YCviH5cHZV
	1uZIb6RGSgQCeT+PJjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQq-0000000CQzo-2ytv;
	Mon, 20 Oct 2025 08:39:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQo-0000000CQyV-1Z30
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 08:39:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3306303b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949594; x=1761554394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Der7FNf7I/75zOWZ+nH7KDaewc2YUf74Wn4YmPEFp9w=;
        b=iL29piZ3I/PD8jjmYPXSbo6HrecAi2vV/s6212tjjHhcU3I227bu0825aN6fdxrCLU
         U3iDbchqVEVPyI1w9NJ5aN5RS0zmkvPyCZYifHY+gw2bGkUVjrSo0N81L4hP4bCaVnLk
         c1ZO1TpEcvwHdlXSeCLePM3n3kGkQck+MCGtWykTDonRMqu7P110qsRl3rmVlznYXFKk
         riM0zZXKLR99V7xVheQRbVgsyjzxi3SSFBWyvB8OSKW3hISDT9mcyRReo3zaTQJUoe+2
         mqsov+y1xNYfoEHzQCf10s2NupzZ67/zu0Iegh2BzlKjuBL11TpXC9vMLxVr8Hn9I8p4
         pJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949594; x=1761554394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Der7FNf7I/75zOWZ+nH7KDaewc2YUf74Wn4YmPEFp9w=;
        b=k+gIuDeeBot2lOC2Q5hZWJT4klGHXgGnzkeAL13B5xB/nJ9O2os0jNu8fBAFefIAIe
         mpkVCmdofz+oIYllfyaFtEQvO+N/LViwRwxCkMWysJ0jUcGEiai1YqF8nWaiL/R6MowT
         JR7bYb6KNntWQc3gdGW6xE5WE6pX1pnVX8+zZBEG5zTOREg8Hx5YjKJXlgWGUnyAlZ2Q
         LVbAQKv/te9LQIdDudDE7R1J8GFJQTuk3T6qo/D+n/TD81x+SfwfBxBlItbt9ZqNmQGl
         8w2WVt8kanJeX7rbcnOU/jtQIQOUtw1z/rs4a8jqK7eqhBpa7q3SXYTVBULGqMzeKWza
         Yl0w==
X-Forwarded-Encrypted: i=1; AJvYcCXzQigQLoGk68GCidP2jmuuM3r3U1OJmXnLIYgDmJEwnHCYCQ35UiRoXgLrV1Y/sjuMz0C4tMr2v3wctw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLUvvbLb5vo2MLGyM3bYBMVGJO39sgaVx11tmGcLoTWwTmXky2
	pX2mNuYE3KWZsgy6tQCfaxIDkgrM3UxohHm1DIumdF0heJbtohq//ZLb
X-Gm-Gg: ASbGncsIZyqjA/nupjEm27nCsu/UQVlbyG7x1Xo/BTRhv0gYW4Rtnlr0uuvO1Q5sHPJ
	j+xqocbm7wjgc/RTCOOFXfvGca2qgcS0vpFm57YISs1FeK5qcEMJCDO8D97Xiu0ooGTlObYpbBw
	FYzv4Zwh1vJJOsSV20GL74cwLqbjGsaaQdQLncieXxZHbhZlAY1vbJpatQvungjWasUMQsFD6oG
	yxIRa90LzU2ToRv7HYnLJGmfCEDXcK3xcRlpXF4TPy0NZANRae98OQKQA6GcQmpfoMf0YfVa0k+
	YHKadS2U2Dams54dOSrUqfSnftBA1/D5D3d1OSWin39ZvaRzRzOiaodXR2g1q1B2yepMb1woZU4
	woe8XLI9m+INwd6guCAVcp369w2HJ7TgYfax0BCq6woVBVr3LW8zYEc1EkPsNe3vaf+9BCEVhI6
	XZp+7bTJOIc/RDS+NX
X-Google-Smtp-Source: AGHT+IH5hJNrWZcw8SGaOXSO92jouYGCNb4bb6h9USPjEKev2+BmrDNRUvPUZjLgcO+zgva54ShEvw==
X-Received: by 2002:a05:6a20:a11e:b0:334:8d0b:6639 with SMTP id adf61e73a8af0-334a8522be5mr16850362637.10.1760949593658;
        Mon, 20 Oct 2025 01:39:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:53 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Mon, 20 Oct 2025 16:38:33 +0800
Message-ID: <20251020083838.67522-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020083838.67522-1-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_013954_409912_6014F4AF 
X-CRM114-Status: GOOD (  10.32  )
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

Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-duo.

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  5 +++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi           | 16 ++++++++++++++++
 .../riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  5 +++++
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts   |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 9feb520eaec4..0e6d79e6e3a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -100,3 +100,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 42303acb2b39..1b2b1969a648 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -432,6 +432,22 @@ dmac: dma-controller@4330000 {
 			status = "disabled";
 		};

+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800b-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			resets = <&rst RST_USB>;
+			reset-names = "dwc2";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 4a5835fa9e96..aedf79f47407 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -86,3 +86,8 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
index 86a712b953a5..b1853770d017 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
@@ -93,3 +93,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
