Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6659CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EObKw8yW2KDR+0hTOG8sPaHlUeJa5+ThFGOXyPCTixI=; b=RvQAH98H7hemTb
	4acc4x6EpLCfykUpE6+KstnBUX++Gpb1MzpX+bxXy5u+XnkTWXnvpj3zQeis45RMiVS5TPzPDU5aP
	2vfe9Bejs6qAxgN42s+Ju2cwKe/+4WVl1/vn+Kwu7CMRRhQHcohjsknXaJo3xxudGuc2jNEtHjUGj
	f3w96U+kcWXhxFfEg4+DLoP+m2ju6oHBHnTEnJfkdE86SFmdcYNunNwDp3XAHHMhdR9lO9EvOxpqV
	BBn9BpG2xEBictZudxlNc5AiRvQQhUzB7DgB8rzM5/ClScqaRTsJw9XvhK3bJLfJ2Dkb/mAW4lrER
	+AF6pGhHci/mZ6oQUwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Oj-00000003uAj-3VOg;
	Mon, 15 Sep 2025 11:29:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Og-00000003u8f-0S8V
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 11:29:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e9ca387425so1035555f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1757935763; x=1758540563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=soW0jnL8WPot+9xDRD3R6Vi9tfo4BYG43zuH0Mb5i5w=;
        b=cddK5+2V4GtioSFJVerNF4YkYa3/4ysyfTSOYMXZw2L7WaI5bGUU4BXUBIXBn6bXNB
         jgm3hdW5IpZgxafl1qPahpsHEdEY+QR1xqEYc2uq3ZJ+dmYaAoL49iwQBfKxpfAoU8b3
         b85yfntzXwkQXBP810QympfOjpcww9F4IfthhSoF4oXnzbKhwq1xtC9AJZpN4zfCApsa
         1CrtTQT8YU4PF203NOZkgmud1VD9kUOcADbCDw3v96mC8ojOtxPXcBmb7UAIjuEZu3ni
         Zj4RXz2nrevjYIqhXZEfRIAsEhHmNSmtciZRiydfFDw1I4VAhcZSVWxxI3ixsT3NopKd
         cQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935763; x=1758540563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soW0jnL8WPot+9xDRD3R6Vi9tfo4BYG43zuH0Mb5i5w=;
        b=aSPKIso6unPM8X6/mtMHe3Ul4FyheAbeGTaRz2IpQcS0a7n8lg0NXk6QjYED+9pO1A
         S9ndqKJL8NGaO4x3rQkBB0vzz8HNQAQQoXcNmUJy3S5fE26daCPFIqp9hL5yfSnUzjLI
         7gTQDmsqsOKi8WEj7elSWn825tslGl/kTibVEXhnW61VrD94fUdYJUpMejBTq4Rv9jeZ
         eom5dr+oK2G2p2TmDr2Oz5sIgrYIjuAIXj443gxl88elgpsjyDOW4gHodWv40Jc9INoU
         9MOTguyq27R96cekV7Js6T/B62CvcetlSbklZtrcutTXMpvWkJckjjhqFyoPdAfCPkpX
         75uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy87bLBDvfO9UupOpFUxv/ihiQnJu5W35kDluFlJFO9fLanK5vsRbiP+VZMqGMSwWtyqaAiIpLLkMtUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkX1iFOJgKzgMCdZKvB2Ua5QUC+sNBEHcyNg585/R39AWLvt0S
	/Qyn6ssnZKGZdfkwuuFEXRmiJKEZbAelcGDe5bb00EIgRyo/xyv1euqjanYMAUEtgLQ=
X-Gm-Gg: ASbGncvW7AKY6hhL4f5zeaJBivGJ16lQPwubivcT1aMKKo2XcCstkB9nmGJZxPMoY0F
	FCnG3K38lYUhIJitTsWdykCgqh4Q4GV4ms+FAuRSB1DeMhaN2N4TIiHI7gtzr5jNk70IQunijBi
	qQ7b5N3W7iGzxH9Nygm8M2rCSzISVynRtlXLECuW9IliNgfwR+saBMIhvUv/PxCc2zl++AZxKOJ
	cLNj8esSnrJFwn5x+++te/vUH8COhffV1gw4myhtdSafzw6jUvs9t8ObsB0A0Q9Xy7DtbgjKFU6
	jP1ZJztiwjzFOLMD7cDGxUWkqPwjzNzisD82opb+LwUk6HFkgOvquPr+QeS9xrtB7MxyjF02gxH
	Jh+Hkxhu+QtnYz+wADVQ0YAAbvEL9ZRK7ttjtQZsqAhTokgPAvA==
X-Google-Smtp-Source: AGHT+IF5Raa4GGsmgRPEVW/a/w+92KHvjP8UOvE2mb8YOib/5XzFtVE36lbSCNtod9NBJ/bMJKOmyw==
X-Received: by 2002:adf:a1ce:0:b0:3e9:4fe4:2632 with SMTP id ffacd0b85a97d-3e94fe45e49mr3994188f8f.46.1757935763050;
        Mon, 15 Sep 2025 04:29:23 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7cde81491sm11874635f8f.42.2025.09.15.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:29:22 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
Date: Mon, 15 Sep 2025 13:28:45 +0200
Message-ID: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_042926_282620_D97990E0 
X-CRM114-Status: GOOD (  10.08  )
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

Add UART pinctrl configurations based on the SoC datasheet and the
downstream Bianbu Linux tree. The drive strength values were taken from
the downstream implementation, which uses medium drive strength.
CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
hardware flow control conditionally.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
- Split cts/rts into separate pinctrl configs as suggested
- Removed options from board DTS files to keep them cleaner
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 389 ++++++++++++++++++-
 1 file changed, 386 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 381055737422..8f87f8baaf77 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,12 +11,395 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	uart0_0_cfg: uart0-0-cfg {
+		uart0-0-pins {
+			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
+				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart0_1_cfg: uart0-1-cfg {
+		uart0-1-pins {
+			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
+				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
-			pinmux = <K1_PADCONF(68, 2)>,
-				 <K1_PADCONF(69, 2)>;
+			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
+				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
 
-			bias-pull-up = <0>;
+	uart2_0_cfg: uart2-0-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
+				 <K1_PADCONF(22, 1)>;	/* uart2_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
+				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_0_cfg: uart3-0-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_1_cfg: uart3-1-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_2_cfg: uart3-2-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
+				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
+				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_0_cfg: uart4-0-cfg {
+		uart4-0-pins {
+			pinmux = <K1_PADCONF(100, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(101, 4)>;	/* uart4_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart4_1_cfg: uart4-1-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
+				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
+				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_2_cfg: uart4-2-cfg {
+		uart4-2-pins {
+			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_3_cfg: uart4-3-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
+				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_4_cfg: uart4-4-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
+				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_0_cfg: uart5-0-cfg {
+		uart5-0-pins {
+			pinmux = <K1_PADCONF(102, 3)>,	/* uart5_txd */
+				 <K1_PADCONF(103, 3)>;	/* uart5_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart5_1_cfg: uart5-1-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_2_cfg: uart5-2-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_3_cfg: uart5-3-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
+				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
+				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_0_cfg: uart6-0-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_1_cfg: uart6-1-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_2_cfg: uart6-2-cfg {
+		uart6-2-pins {
+			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart7_0_cfg: uart7-0-cfg {
+		uart7-0-pins {
+			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart7_1_cfg: uart7-1-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
+				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_0_cfg: uart8-0-cfg {
+		uart8-0-pins {
+			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_1_cfg: uart8-1-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
+				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
+				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_2_cfg: uart8-2-cfg {
+		uart8-2-pins {
+			pinmux = <K1_PADCONF(75, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(76, 4)>;	/* uart8_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart8_2_cts_rts_cfg: uart8-2-cts-rts-cfg {
+		uart8-2-pins {
+			pinmux = <K1_PADCONF(77, 4)>,	/* uart8_cts */
+				 <K1_PADCONF(78, 4)>;	/* uart8_rts */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart9_0_cfg: uart9-0-cfg {
+		uart9-0-pins {
+			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart9_1_cfg: uart9-1-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
+				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
+				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart9_2_cfg: uart9-2-cfg {
+		uart9-2-pins {
+			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
+			bias-pull-up;
 			drive-strength = <32>;
 		};
 	};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
