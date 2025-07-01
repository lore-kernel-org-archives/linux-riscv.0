Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58E9C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb9SWCuOync1aPIWmtKNWNjb9GK29sORKjr5cg36ujU=; b=2fWwnCLJ3qlE8b
	1QWN/zaEBBgz+cGBdtYIFGovNsNt1+rviWhRe7zvvJo2hVRogNO7VYZ51/1IEM1tdSUQQhIZIsTOQ
	L1Hiro4YgnBvlsv4CiRSM3mS+D+EmgwAHKLeA4A5V7gax9+tzoxMxG7HTcttP9r7iNcDcytI8uh6s
	Hs77xFt43RpFvqdQ8NcwllOQtdOBcQvbvcCCPjhdHSRdJK4nlpOmOZvO/Kixo/6LO8241scWZsPZn
	GVHxYMBg9o6hDmU16GPxECDkq7tlBMKViSVQlLKMS90YclMhlagc0irUZhWem1QbeNHMbCXKUg4X2
	njk3m1I86JY4kNsPlmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdK-00000003o4q-0mtV;
	Tue, 01 Jul 2025 01:18:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdH-00000003o3p-47HO
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:18:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2353a2bc210so23341335ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332679; x=1751937479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=ki3qdPiYRLRuA/RjWJvf25h207KyfxJbRt7tVcHBhcPH7v5WMPp0Xxt/ESCsX2Tm4K
         MaTBQduCeZG2wTgak897aa9bsQVKmY70whEF4inwoJxSbdy23RJbxLMsHgVA+UMCODg1
         5mH6XeAkGyQsBQrkX5v/XUNIUz748Zb4XJrXtM26Mch/MRujp5/JW7pF1rO/s8gsvq8W
         ti7Gd9NHy4jk7/TCPxGAiWmdxWUFan+eWdv5CTJ43YCzF4jELkL0DovMcCv6wdDL9tgu
         GSTt1vVEJMNxwXeB89ZnvKI21PxwB9cMDiiU59RpMSLzzLTkntUnBmLdZGIPjoHLBguq
         TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332679; x=1751937479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=r15jxYgXgeohpebmU32UtGzB9MP0jhyYMPSzEGGRfiMzNVkBi34/z2EDeVp83Ui/Wl
         5KbX7UXEBFHP+qRGMuoeI/+GO84v6OT/UUQ4xuDRJdapovv9ivcg+0xeKn3yYZfYC53v
         peC/SE5Xbo8p2yXD5Gcs1Nr4lqTy2maxqlitT1ZIw75ZHozFlSodgFbUJB/HcVJU/jrj
         jjwJYHDEDSr4Sb8nEbhaIHBW4toK5oZ37q7n0KKqklQnUXJzozZvJMXSlid+xnRFfmqd
         1J0fdC+ZcqGqv3C3PR+BDaqfuXf+ix0/QCNQqpCxgwlDc4htA2bUiwy9PSs8YfBrsSx+
         dqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYbyq7edDtMU0luAekvuhyKMXxjvZe/wbPTIxWq9g0XQL7Z9uB8Nu+PV/DA3QBxgcPmtbWFg7MMWv+Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyuEMBDs7quY8b+4VGdrtYPATQCu/Ke53hrcfk9WbR0gENBuLm
	cwCmPGnKbZmo+3MpGpGl0+TsB0+CX2iFCik5N/1bnsj5Mrl4LcsgXKEwTCcpWb+IWoA=
X-Gm-Gg: ASbGncvQVnRyLggfhH3RhVylkRYiLRJ0/7T78iNSI4If6cUiQkhMaItnuAV+AsdTERQ
	fNxHDLGNGV6oztHg19PQv6oesvLAg0NKy5h+vp+DSYH1ItPmcCb7S6YXGBGcNyMCWebYyBQsIuh
	/oxJvmUpwedAMX4K+kUBQoNrU9LBTrqdY9BiFhepYgtCKRuqdSWJGojTvaUpph0eDE+2sbpK2So
	zPMElYIUTDM1wb+gafJ1CKgzg6UbMeQIqLO9zQymfFf6eXG+q44+EIn6r5PLdrDmiPhvIDotmnf
	on1de6YFj7v9Ar/YuoAl9326BFY6+q8M7yL+c30qlnpEi3wkupff+10ZMBX2Yg==
X-Google-Smtp-Source: AGHT+IEPm2Op+KWjehC59VQnKMDkBVgZ/YpPUASGIk3XgNcj6OU/ub8JMgiDzUUFauKHKc2q4eWCfg==
X-Received: by 2002:a17:903:b86:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23ac3cf5f89mr243983855ad.13.1751332679204;
        Mon, 30 Jun 2025 18:17:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f0b91sm99104865ad.53.2025.06.30.18.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Tue,  1 Jul 2025 09:17:28 +0800
Message-ID: <20250701011730.136002-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181800_019899_8B5A5AF9 
X-CRM114-Status: UNSURE (   8.57  )
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..3a82cc40ea1a 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,33 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009800 {
+			compatible = "mdio-mux-mmioreg", "mdio-mux";
+			reg = <0x3009800 0x4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			mux-mask = <0x80>;
+			status = "disabled";
+
+			internal_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <1>;
+				};
+			};
+
+			external_mdio: mdio@80 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -196,6 +223,8 @@ gmac0: ethernet@4070000 {
 			clock-names = "stmmaceth", "ptp_ref";
 			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
+			phy-handle = <&internal_ephy>;
+			phy-mode = "internal";
 			resets = <&rst RST_ETH0>;
 			reset-names = "stmmaceth";
 			rx-fifo-depth = <8192>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
