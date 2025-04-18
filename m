Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCBDC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG3slYx6eIb6mSZEGcawHjFcIRNEM2L5xjTR1TYQYdY=; b=W0XvII41n4rDLf
	PIawVYnZees8TWlQ7d+Vxs8aZXsfPC4OCN9oAyd5b2WavWBg7d9mP3zb/yGGbH8OCnlzmQ+EoPHn+
	voDbB4nxU8oCWftYZSY6NEBunxE0LNdGkgvHjeM+JASteP28vTgrs0EmBjGW+e3AU6GxyPE2Ex0+d
	zwWMTWTJ/2V8ROZ9tTkw0hzNZPltPSdW1jfiAt3AXb4k+KzZcaM826NVYClztnnvH+8zNYzOzsldT
	lDqtL013Uf46840i8zgVGPCDW9ki4j2VQ6j+R/oPICrDNJS/rv6+iw04Dp5+EZpMKzSk7Cbxw1pGW
	34yvFQIKp/LVsXQejSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8H-0000000GX41-14H2;
	Fri, 18 Apr 2025 14:55:57 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6e-0000000GWSM-3QZv
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:17 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-476b89782c3so21805261cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988056; x=1745592856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=L10/sx7YaziQd0ybGhunO296SZmGjpKTW4FGZCP7kw1YQ+XmQ2+HF6HpxQmiN7buBv
         XqDyVIGEnjrW0o2bERvKdkl/QJKRu8K3vxyAk6lnYOINCrqRYtQvHqNkdoYjUhtNtMQJ
         wnBFUwL3c08lqtqVVgFSuyNuNm7vLfOUR6fL6dQLeLSeHCShA5gZjqHXFg8aF3WesxES
         NkkO++ivBZhB04HL5Xd/pJiM/oXJKTb7x7nftzue7OAczfzP9N7vT+vFnKWftmaeo/ow
         +I8pMYdm+2yZxPDAMjQ1iddHjvBW5Kc3fA3fzBTsar1aeJ+6u3rzOtcMLFoOfeUxaJSS
         YcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988056; x=1745592856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=VWNyc18hbLGoEf/jfguDA22OIeMCJYzvTPMFKwkq++bbgfb3ARCLTHNSUIwPRvuNC3
         WzO1Q2VxJ5yi95aKIR3PWiKdXoEMOZut3epb2MPoZ1+8g62JNcwWj674j0hBTrQ5eSzX
         BXKqxEkHos8XYUVYTC4wx0Vh1b4DFnhLR/U2eT+jug29XkNHVQE85fmbSKMEmrFfN4lM
         FAN3FPXuIwuHHa2aPkK9g5UwpE8vaOHeO7y3aqRkqovnHwRqzlLSHU9T7/qh1TnvU0LG
         aIV1+xJqhHvwYPK8/LwHIlPQ6Alcxz748apExw+GUUnVIWzgpqxi+OOHdhrzTaqhcIv5
         BBNw==
X-Forwarded-Encrypted: i=1; AJvYcCXGwq3hSBfuWAxcQfRO2n6HFAB5meT7uXico8B8Upp2it7pFrFnP9jN+u24HwA6YEZivp7IVGZZTEs3jg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Tiy8SO5RG16LTrHrlbDzUZk05AA3yLXyyZyJQ5cJ6WBpEm8o
	UlGjQx7XxDfdJ/L1qgCsHhOqyq7dmDSvjnpV/MFO05PxGX2YOAv1TtI11RCyJVI=
X-Gm-Gg: ASbGncuPCJ833+EbbKLSOTVyj5h8j7xiOItIgIuaWVj6ZJosMNqWXbSN1kDcvUcuier
	+Pvkholn3kGqPRpsgpsa+7d3QlfAtUGyfjwPeGobGmuDIpF06pT7e9KoonELl7evfUOvNBbMafJ
	MHmGnrJltiB8O4+AFGq34OmW7WL+Bl1DRuDqRlPzmXMYqAMGrj4jQK5KtKbJZW5hwol0peBZSmg
	OflXPAP9+r0pa9FmVAoVYAXROfiSKmfJ/Voj9jVJ1GDoCql6Csh5s9bg51JHEGoNt1FNfDBFUta
	n3NXQsfHNZwcvuw39x2ZnrKzpUllLWo0R7t4C37VCklwLkO36LLHUNWAn12GGlTqi/w2/MgGxe0
	PRvv/UpQC60zjug==
X-Google-Smtp-Source: AGHT+IHNVbMfjIlfo9PHEWLdLnnlwobHS10wrAnQS7/2BfmnC2z46vdeRRFOkin5pnaA1y6blfUwPA==
X-Received: by 2002:ac8:5fc6:0:b0:479:be67:3bd2 with SMTP id d75a77b69052e-47aec3cb8f4mr50692481cf.23.1744988055824;
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 18 Apr 2025 09:53:59 -0500
Message-ID: <20250418145401.2603648-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075416_854225_A4DE7DEC 
X-CRM114-Status: UNSURE (   8.81  )
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b..491ab891788b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
