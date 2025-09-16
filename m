Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5641CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sb3VRNT1WB9F4ObNLN7mwavXWqD+g+8k+BiwejcCMQw=; b=3ccWFi1l7/d4j/
	XOJAS/SrAfwuvgUj0M+vy8eIgj6eSqYfDII8fZKZW+RB4A22+h1lBjjRr5fcYWbU1lqwYFBbcb3Qr
	paCLxMFbqJLOmD3daU6oMEpOVF3WI09s6o5fV3DNDpLKrOX2GJOx4QZlQ+cdIYwuEvA5sbl7E2c92
	u5cESq+MHVNI+1gihA1tVHahMmO4JuMafJa2iKBe60rhk0Iopl+dDOP9oQ/b64epmZM7pu3zn3t++
	w+7OoYTgPWZvhfbKZ1QICA/SKoui5vS4qvZrLTC7JnN/hzR+E+RvHvmJFvV2laFama/DnNG40BLwR
	+i+NHAzcdgNSbWo9+5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyPU1-00000006wdb-0k6u;
	Tue, 16 Sep 2025 06:48:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyPTy-00000006wd6-13MH
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 06:48:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e9ca387425so1665664f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758005284; x=1758610084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+tAo4VoGXmxIB6DBfAH6v8rnl1xLmXmwDgGYNdFUWo=;
        b=ml0YcGQg97Ba/2/1SdaYSD4MIgoCE0SfHRATZmPsz+lzczs001ocUWVGnfK4Ea7P6i
         wCepGMKCfWskH/B6G/Opk0W2TG9p+RK0BJclmoE24pHBuEfEkYcdLD3T5ZcmGSCFCdUr
         O2t9zk86IGN9zYT91i/E2RixWjrrZaoQQKPNkfkWRqyu78n2EY44+fqqszmjBuy8VQRR
         tIGD5wfbh7ufIpXU5U9/DfO7DcswxfBeNhs9V69+4wdcRoJb9iDCUCXIJXEAxm+yh/6+
         u9D5YL7GJEHCqweXvMOEBADHv7b78ttVFRx9AWnxMsQsbhbGgt/p+WXmqqysmKBfLxOL
         V8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758005284; x=1758610084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+tAo4VoGXmxIB6DBfAH6v8rnl1xLmXmwDgGYNdFUWo=;
        b=Lj98S6NWVSNkx5TfyBhDSmDPIJmmg7FLZf1vOH/FFDZc01U8E+hqiOcYHck5yx1Koo
         29CHxhd1kIamDgKO4aUp8xDozlgcYfhpOE9GqaWc904utJ4atn45ar0H8aXKRVYKulsG
         uMr4hjAOXWL2Swsb2w0BfyrE1/ZZPmHoDwHzMdAAmf1lHv74E5PDswxS0UyxETiPK6gF
         +J9GjefEFpujDQLprLf6OlhCDcSSUPDv0374FEeZIOxqAwZF5iA10CK+/45ob0c48qF5
         IOcbnT32v94vSxaQEbBPq+QAiHWhA/dGF3ISJUez2iEVlaeO2X2Si4u1s9WLsFXfmQx9
         r0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ua9mRApO6zLkKH5S9Nirb5YCtsBiTACeIPV8Wjl9FXipFehQK87vFd/jk8EeXUldDXTrh8Ah3Ag6Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxKpKNhRjol5oQCeY/cbZc2JdYku5xhtFGlidlDHVy80Q/z/II
	Ilj9uAtEt1kyNix5149/kzZ2hnFPDF2IuDeHmcFVxONlldVZOy2A6PcIItYN3HZEXx/Z7yQ0ClQ
	Okll/sWs=
X-Gm-Gg: ASbGncs6nlHaC2qsVX3JxZ5qaWOdN1i195WHbbZ8n5i933eALbyIo9lUiHcIWetgGuL
	fTHPFTi0wWpl4kItbo7P/F063feRmuG26ooi/7ZMmge+X6yv5wItYnZpSl+GOjLhcxaZ2rpDlJM
	6Ky9u+4NJU5iTMGzf40j/QKmsM1FgyKyHtSMF8hn7hMZ/g40AH5q7FQNynKJUvWIb53bwp9w47l
	MVHVL7bCrmQn0JN1ssK3yx6uCBXDSOlb+//fObQEF/Go9G/T1XwP2hz0wDkqyay9NUkkZDhFO6w
	VM9Q/IFFpOqgiPdV86+mlj8ZvEXxGeL1wa3khh/A7SL+mZegN79O9f4zVNYmLRFzhxLRb9ngkvE
	sBou+SsERo9F2MWWRdNcUm8IA406OTFVN80l6YKcs0seOY4vhNCU=
X-Google-Smtp-Source: AGHT+IGIwZaL6eOxPY8i2tbasRq97/i9+Lhu6vC4tuOQC3RyZlYOA3fBU42M6yAQ/jln3QAv3pl44Q==
X-Received: by 2002:a05:6000:3112:b0:3ea:80ec:8552 with SMTP id ffacd0b85a97d-3ea80ec89aamr4981748f8f.57.1758005283614;
        Mon, 15 Sep 2025 23:48:03 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7f27:d8d2:cb4b:f811])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c9d91sm203672575e9.20.2025.09.15.23.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 23:48:03 -0700 (PDT)
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
Subject: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
Date: Tue, 16 Sep 2025 08:47:39 +0200
Message-ID: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_234806_716247_905BC9B0 
X-CRM114-Status: GOOD (  10.23  )
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
Changes in v3:
- Added /omit-if-no-ref/ to pinctrl states to reduce DT size

Changes in v2:
- Split cts/rts into separate pinctrl configs as suggested
- Removed options from board DTS files to keep them cleaner
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 432 ++++++++++++++++++-
 1 file changed, 429 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 381055737422..7811fb485bd4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,12 +11,438 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
+	uart2_0_cfg: uart2-0-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
+				 <K1_PADCONF(22, 1)>;	/* uart2_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
+				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cfg: uart3-0-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cfg: uart3-1-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cfg: uart3-2-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
+				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
+				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
+	uart4_1_cfg: uart4-1-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
+				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
+				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_2_cfg: uart4-2-cfg {
+		uart4-2-pins {
+			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cfg: uart4-3-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
+				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cfg: uart4-4-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
+				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
+	uart5_1_cfg: uart5-1-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cfg: uart5-2-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cfg: uart5-3-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
+				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
+				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cfg: uart6-0-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cfg: uart6-1-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_2_cfg: uart6-2-cfg {
+		uart6-2-pins {
+			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_0_cfg: uart7-0-cfg {
+		uart7-0-pins {
+			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cfg: uart7-1-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
+				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_0_cfg: uart8-0-cfg {
+		uart8-0-pins {
+			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cfg: uart8-1-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
+				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
+				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
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
+	/omit-if-no-ref/
+	uart9_0_cfg: uart9-0-cfg {
+		uart9-0-pins {
+			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cfg: uart9-1-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
+				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
+				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
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
