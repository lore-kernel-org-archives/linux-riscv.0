Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6308CA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ERoe2T6FPQeSF5gEr1XMjwHTXEVFjVGA3L7a3kG4jC4=; b=jwknCOuUofnrcg
	OGW0zLcCwdPjTi5+my70qy5EKx6DQ+lE+SUHzQ3dHJhh8Yoyv7ln+dSmjMa8LGxNa/LuYw+uBo4P6
	8OdBot5nY+653Utsgb072xIeVfojP8E9+9oppn2gI4Y99kVNUIIdiEgkd/xPtZOHh+GWVc+/GQI+Y
	NsigQQvhDjvMfEPO446H49oMwQR8jy8s5YUgc1TYjmhVXhGv+gurvOl1T1VpAi5D38MdUHOYzn6ha
	ixqV+exgWhgf4+0lVEaPRwwlkecFbudJ7HABH+MHJDeQ15nNfF/bXIPmUDavShNDGEBqptjbuZqtf
	LGqfaD048z5pi7+8ocAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym8w-0000000ANz9-1XLT;
	Wed, 17 Sep 2025 06:59:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym8t-0000000ANyU-3sH3
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 06:59:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so3481244f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758092390; x=1758697190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7h2V7+XLJsHOcDetA21NTfGsO1i/U83vyv69RqPpe0=;
        b=aeToJe9mOLGA/e/H2QUo9w+fxjfCyIgYZPHfdXQyvSkPiHB/8Qj240N0V/g0aAqB+S
         C70fHb/IBnF8Pqzgf7UWjGGZQIo1w6gUK03I90pW1epoUYJXwzTvwul/9TIs3fiovhmj
         8Q8KGENKuSnkcddqEOKyVOJK8CQ60fpf6mPer/c1UTbBd5x+tM6i8X5IMFddvcBCuy+L
         rjufvlRhFYDYuxdnm4WAqz/H+TUtFpgYarc71pnpFvr9AEk/PCFbDwrQafsUJq4Zmz8c
         IITdnVUXejKpr3lf1axXHoZNnWZXj6uNORaRANZZ/HTkI/oAjZfhzWXscISMMfUwOEbb
         jjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758092390; x=1758697190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7h2V7+XLJsHOcDetA21NTfGsO1i/U83vyv69RqPpe0=;
        b=mSAAB+d5QHr6KX3JgA5PnznQ0OjWbaKpAgCzlI5h1QfnYrIi7huxEJlmDAXOTP2nnz
         PflvVY6rskRgpuMC0fkIneUkpmPUD/dqEQCOFfh8natKXsVF/wmFTAKXyTdINRX/4nGx
         CukSlTEI25n86PiwYnfip2NzOf3vSRhgCLWxNVJroEnuyXwMaAezjejg/W3HE700ErXk
         iE7u8ef4Gjq/RMnLHseyFPI1u58BE8D92vn1AEEFkVnUYLvS6Xiixctxg/EBzuIKwU3n
         ULKMUnWyQCyPzEeubWvj6kx2zCnOPuNQOyt1FopYzjiLvJ6vWosbT6pxgkWm7Vfu5iBp
         Lzzw==
X-Forwarded-Encrypted: i=1; AJvYcCVPiS38xzxCxM1idJY9szl+z8Oj129cSjiScF95i+kIiDLIEui/7n6gjW77jIgz5EJCAcHnloz1taRkQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZCkL4kBsL1X8Is3tC9HZcxhZnSOZmY+CMjWQJv0I5ROl+761H
	M7d24KcmSAa6/VKfw86bCuI5hiZ6xQGxrtjmjpUij6n9vFyJtH0TGqXnS++zzXOxqHc=
X-Gm-Gg: ASbGnctVxZopG+aos11rwjPz90CSZOy6g2cPA/gZ8u98/j0IXXQ7EB/rxkWUSk0BYwK
	Ox8Oa7skudukhYVi0VjP9gqrRNdOfJ+J3YzhGqK1lhWAEh1YS0blK0ktG5c7fUIM0Iqq3YIqfUo
	Bmv26Jx1Wll1ulvnt+sHx2AuiXJpR+Y8XFfCcgjZZaNVKsUM8aMQUK0ei+krqqfUVsVQHuX3/fX
	WLgtvViiMBVPCPm1hKJmPKC6Pr1BB8dxB722A2YiGZO/0Pb5BEEtTDYysxJ+FcanOEC0qL2qeoG
	VS5G1nVd199Cv2itf32WjoarBAGzSlKOvPpvqBXtc/HP6oiFgV6iNwF6TvmUnbBM8gIZhNrwiep
	dlyC3PE3iVPlKmC/tdPjfkZxIUP6bXgzPt9rsRvfi3nGC8NAfG0w=
X-Google-Smtp-Source: AGHT+IGge/PYhWtSCfabX/nrs/mY9m1ICW696JLt4kj2wQMv5DZNSfWYfAOgO/3DRfIWxtWOVhPBTg==
X-Received: by 2002:a05:6000:288a:b0:3ec:4e41:fd97 with SMTP id ffacd0b85a97d-3ecdf9c8a38mr781809f8f.24.1758092389680;
        Tue, 16 Sep 2025 23:59:49 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7e645d1fcsm19202809f8f.48.2025.09.16.23.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:59:49 -0700 (PDT)
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
Subject: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Date: Wed, 17 Sep 2025 08:59:07 +0200
Message-ID: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_235952_023131_B3931884 
X-CRM114-Status: GOOD (  10.78  )
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
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- Explicitly use 0 as bias-pull-up value

Changes in v3:
- Added /omit-if-no-ref/ to pinctrl states to reduce DT size

Changes in v2:
- Split cts/rts into separate pinctrl configs as suggested
- Removed options from board DTS files to keep them cleaner
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 430 ++++++++++++++++++-
 1 file changed, 428 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 381055737422..44e78764f491 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,11 +11,437 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	uart0_0_cfg: uart0-0-cfg {
+		uart0-0-pins {
+			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
+				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart2_0_cfg: uart2-0-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
+				 <K1_PADCONF(22, 1)>;	/* uart2_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
+				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cfg: uart3-0-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cfg: uart3-1-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cfg: uart3-2-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
+				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
+				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_1_cfg: uart4-1-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
+				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
+				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_2_cfg: uart4-2-cfg {
+		uart4-2-pins {
+			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cfg: uart4-3-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
+				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cfg: uart4-4-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
+				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_1_cfg: uart5-1-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cfg: uart5-2-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cfg: uart5-3-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
+				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
+				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cfg: uart6-0-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cfg: uart6-1-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_2_cfg: uart6-2-cfg {
+		uart6-2-pins {
+			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_0_cfg: uart7-0-cfg {
+		uart7-0-pins {
+			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cfg: uart7-1-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
+				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_0_cfg: uart8-0-cfg {
+		uart8-0-pins {
+			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cfg: uart8-1-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
+				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
+				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
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
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_0_cfg: uart9-0-cfg {
+		uart9-0-pins {
+			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cfg: uart9-1-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
+				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
+				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 
+	/omit-if-no-ref/
+	uart9_2_cfg: uart9-2-cfg {
+		uart9-2-pins {
+			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
 			bias-pull-up = <0>;
 			drive-strength = <32>;
 		};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
