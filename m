Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81791CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 02:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5GlJbBLjwRWttFb/+7LeBct0egre8nKljRW9AoM6rE=; b=XN0sEv6mWAKD6k
	/QvRt942Gmiaki084n17jQ1UsOmtsoBTr3evUqWRodplm2+bSUoTshumKyRwWYixknHo+k6kcms/p
	vCfLjnYnccwxS4mhYY2u3aTD8iL9K7xjkyyZoSwvBkwzw5FzOn8yc/CUaK3/p0XNPpU/IvCAfyB+f
	wwlQ6ff4mTBs6D9UZQVOBkSShIn2QjiiUEma+ItUG0dQLakZxkXaFPqu/YZ4bt36zhfqqPZSw4+fC
	LW3V4Cn1dNcOcwIdtVh0y8KokxgsfpqDDH2msjQrBHy+haXpMFjaEXS4GPFQ8YXBEHL5eor19mKp6
	05eLDILpbdxjIGq7A+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lnA-0000000B0Ay-2LzY;
	Sun, 12 Oct 2025 02:26:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ln9-0000000B0AF-0Zis
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 02:26:36 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7835321bc98so3102494b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 19:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235994; x=1760840794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfXUkC2C3C9BwOnkDvFBK7i0+SebLg1iuS2buoBW7lc=;
        b=d9oj3Cbqa6OVsN5vJ0UQmV2ndx9qoFVXcukSWhbI7+dj52mZwt4aaWqYaVlltJicbs
         PZxFMP4YzbXekpT50gCSpZC8lK6O0GIg5k3vYNcM2s0GKGWDl6tgJcNY3z1oN89YUYU7
         7Vixq1yoMFz0uw/CitdcTLrorLGS0YArz388tlj+3EZQQ6/7wIIVjiqSdCdvEEnZClBh
         76B5KiPsJzYghCJHt/W2X9FvCgavusPPw0Vsqk6Y2Gk3wXHm6AooMBTrzpmLo5kkWl8/
         3SQLj8+pWRs0fqRvNDYW13//m5wJo9jNLcvVk4JwpgGI3s8pz0Fx3hBDm7tDJQ2OJEd1
         YY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235994; x=1760840794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfXUkC2C3C9BwOnkDvFBK7i0+SebLg1iuS2buoBW7lc=;
        b=rAg6Q30b8aFWxDKCyXC9GFKPBUzQ9JdJLdWmM9YC8fxK7O7zSfoTi5Eg3PlHl+ZvTE
         Y9ZKnY+Ir2K7Gn2nLA76NMOlt3vxHmtRH3K1E4OUw5W+DDa7biPUBAMjM46cDWI1Zs0r
         w4o0ka6jfbKVxPb0Ebq6mXzgqGpeX607uBP9r98+AYHXCPHV2Pra4JrUD+O6EqULSeGX
         ZzyV481474fWlHo0YXEBIq6XNu7JcAPDt/uHJs3G/T3evS6KE45yI1Sf+vWuHnigIuPK
         y3aDW4Hid7LnR/INUQppfk26RSfErDXeRzzFwC8qpwAGZcvp0FFhUUckEv3e5RdNMd6N
         CzMg==
X-Forwarded-Encrypted: i=1; AJvYcCX1oCLGV6iFTVHwbS1sWmbc7uRHiphnNSrEOhtFKbH/OerdEuRYokrxQ3Qlnq19Yos/ZEBoOf/klTkIVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQymFXedbllgWnsEGawp4TOeEZk/bTt7zcjyCRszQJ7neC40/H
	r+Mi0MfPURy6aHNg0rMyLsvfiKMjL3O+HT+6lmqye/e6d0Z3TZNrRBBo
X-Gm-Gg: ASbGncttNcHhFXqtjUpclyMphe+yuDt5JWkeNt6cwjrEn3XJ91yGPw8Leol4ghgTi09
	YSOv5zu/5pLNhoYdfD4amYlsjjDqrFoaixa95t7pQ8o4PZnK8MAuLNTdReVAjGCAnp5vC+gUeLZ
	5N+jTuw0zjYv58rNnCgV6hMyOugk48WTHwt02vNTZRWCU60xbHwcWWvh8deVFbajF76sFmXw+Y/
	nC0isXP92Pzca4sr+6jyvcoh902jD2Ol3ybjqp4lLpNWQzCxYqk8f3+4knpw3GNnFMqH8kgjq5x
	e1gmc/755U+CXSDAmvR0r5KDB6UcXf+MDZYKAPOneVqRU0IjXPAOZHA31SHtrtQwRZqR1REYQnO
	W3ltlFbATROvZKOoMQZDFITGACi7DVIquwTNIly1VSQBMvWhcmXseVfrJ7JJwoca9jQe2
X-Google-Smtp-Source: AGHT+IHZ9NyGaDIFzKfo3jw9RHib9r8nk9b6aSs/8IZVATsbwnwanfHCirNVwYIHZT/pMIdteZPgFw==
X-Received: by 2002:a05:6a00:391a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-79385ddc9f9mr22273636b3a.13.1760235994437;
        Sat, 11 Oct 2025 19:26:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:33 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Sun, 12 Oct 2025 10:25:54 +0800
Message-ID: <20251012022555.6240-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012022555.6240-1-looong.bin@gmail.com>
References: <20251012022555.6240-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_192635_175220_8A0A7101 
X-CRM114-Status: GOOD (  10.12  )
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

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
