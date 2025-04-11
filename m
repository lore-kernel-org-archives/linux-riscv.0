Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B5DC369B4
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LqUtiOXbrjMd5lbNC5iFFW4ehn4QBNr8fsjXuvSB4A=; b=ZNh5GHPvbdTj4w
	2dNQl36y9502ENh1XwdA5Dm2HLsaOaFqP7JKu1zkti/fv86NKiUA1OM/b7Px8+SexakRxWPX7iU5p
	5e3WJ5f1Jai6D/53EzGfXS4vQ99sVDBFlzgdHgo9YoNvIvGc+DmM+ZxFW6v04DZYId884hht/0Ngz
	BaHLccgn6dPMPFoqail239YPsn979bzwGo3aSckz8o3MEvuPolAmk/BLjPBHVqeRe9sRH5Iz7cKG1
	BytCKVtGM2YnLbrIdMmoD+BCHmqVNihjsQKGyu3VIZ7kfqeejKPsiD2zfZ/M1qByKQBvDbuxjrzuv
	C82qiHrnl9NvfCM/ApbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESF-0000000DvHJ-3rTw;
	Fri, 11 Apr 2025 13:29:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EEl-0000000DsZx-1ubj
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:16:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2241053582dso26974915ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377362; x=1744982162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq/zLUOAjmqMOQyCH6CedvdIB7nhaB2p2wb10oaF0qQ=;
        b=L2zVwAmhH80W2d4ZM8cKFo0YQvzLUo47YB3Ep1Im3tlFKDnR4u6352HyNrFy1ydpAx
         EFu+HGyIOonWvDOzRE2VRdP0cdRpU9LkrshrMA2kjaSPxM5eFNboeCzeEHD8Wb0gVgGQ
         5Za1U6/LQzFWBUQq4xnrVNG3wcaW6HZJUh7PtXWV7Wrw2/B103VDuzusNE4/iqE+d5/r
         doyUSlU0OhFTaJ+bVNg+ArKFyd6KsfNtK1ckrDtv9hhwJVcGb6jx04RbkIRd/h/bVIML
         OwRaSlaAx8k2Q85K61vO/PQzLg3BWTVXQNiwsNpH3lBOwCTeaJNM/dV6DyvnQF3Q5H9X
         iJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377362; x=1744982162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq/zLUOAjmqMOQyCH6CedvdIB7nhaB2p2wb10oaF0qQ=;
        b=rdVGQn+vy820BwAXx7TvnZ7J9GUQsOw8YpJ9/cqgRgfPGOJN+au1iVfRZID8zLuXnY
         6iz5REXBe6je9v/yJ4uEPfU2uQdoXEQkGwrX0Ukwdz4FPZ8HETsoJeP5fC/TvEo+z848
         //WgvZ0V0a/3zPrd7u8/fc0ZydN373RIyXzNnI1r1xN10yiEZ2bCOIxeW9pZ69yKST+p
         BD+lz+zxjl+6BaZgEsZNZqB/fGjqVSOm+ldQTmg8ZoP60nauBOoMIEp1+0+W9vwEcdjD
         srLNE3CAaLtTD6Qm2ptPZRn+VhVgpEWPQ7ylUtj8CTNprFsj5Oi6Wq8qVChTZ2zBc5se
         9HNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzZIwwjDI+Y1oJ2rOyCyb9Sg+5X0QL8BknZLmcHW8EgxjDakToCG5ByHK/KD2Ekw8hrshEhozBc+XzwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJH6MdMVeotzKjGuw/QDgahVNgrq1YFov6wSGrv4HdxKD9DZX
	gE9rKzkTDNHfkN4TvaFa6yyJiibWzFOghtCSisDsCJvltGppExoT1nSOfI3HQT0=
X-Gm-Gg: ASbGncsME/51bmK/WeSApD5X6iSqdY+RFuCZGj/0JCnMCdsHsvY/WartqryT38cboN7
	vXZnL/S1OHR06/BWBp0AXYrZV6beG8E0NFicZRCiSDf6cnpZ/bqDzeTKvgnYrsPK0iISuHtOb3S
	xVXlJBRqwu9VwTnAhDO7tb+JBcI5/umt3pXowaS946VpVJkLNN0Ct7r4JVZnh8fi6yWjiOfN3L7
	nD/i/rd74f3ikEPoWf3S4fYW7oeVUT3UZx+FDCSvaHaNXkUzmNuTrmGsUDDK1f/ObUpZcHGJTId
	j4a3+OeQosKEBS8luEI6Znw2y6KyEsw=
X-Google-Smtp-Source: AGHT+IFYuzue8rTIhMXZdvGPMyvl0e8z93Koxv1rsyMMhwoJlET+hmldcsrrZX6b0qlRAdpPJUNnxg==
X-Received: by 2002:a17:902:f68f:b0:215:7421:262 with SMTP id d9443c01a7336-22bea4b40f9mr36467045ad.12.1744377362506;
        Fri, 11 Apr 2025 06:16:02 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:02 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 5/9] riscv: dts: spacemit: add PWM support for K1 SoC
Date: Fri, 11 Apr 2025 21:14:19 +0800
Message-ID: <20250411131423.3802611-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061603_491973_930BD259 
X-CRM114-Status: UNSURE (   8.94  )
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

The SpacemiT K1 SoC features a PWM controller with 20 independent
channels. Add the corresponding 20 PWM nodes to the device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0cc4b99c935..609135cb5282 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -556,5 +556,185 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		pwm0: pwm@d401a000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM0>;
+			resets = <&syscon_apbc RESET_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@d401a400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM1>;
+			resets = <&syscon_apbc RESET_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@d401a800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM2>;
+			resets = <&syscon_apbc RESET_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@d401ac00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401ac00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM3>;
+			resets = <&syscon_apbc RESET_PWM3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@d401b000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM4>;
+			resets = <&syscon_apbc RESET_PWM4>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@d401b400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM5>;
+			resets = <&syscon_apbc RESET_PWM5>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@d401b800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM6>;
+			resets = <&syscon_apbc RESET_PWM6>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@d401bc00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401bc00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM7>;
+			resets = <&syscon_apbc RESET_PWM7>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@d4020000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM8>;
+			resets = <&syscon_apbc RESET_PWM8>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@d4020400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM9>;
+			resets = <&syscon_apbc RESET_PWM9>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@d4020800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM10>;
+			resets = <&syscon_apbc RESET_PWM10>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@d4020c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM11>;
+			resets = <&syscon_apbc RESET_PWM11>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@d4021000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM12>;
+			resets = <&syscon_apbc RESET_PWM12>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@d4021400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM13>;
+			resets = <&syscon_apbc RESET_PWM13>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@d4021800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM14>;
+			resets = <&syscon_apbc RESET_PWM14>;
+			status = "disabled";
+		};
+
+		pwm15: pwm@d4021c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM15>;
+			resets = <&syscon_apbc RESET_PWM15>;
+			status = "disabled";
+		};
+
+		pwm16: pwm@d4022000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM16>;
+			resets = <&syscon_apbc RESET_PWM16>;
+			status = "disabled";
+		};
+
+		pwm17: pwm@d4022400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM17>;
+			resets = <&syscon_apbc RESET_PWM17>;
+			status = "disabled";
+		};
+
+		pwm18: pwm@d4022800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM18>;
+			resets = <&syscon_apbc RESET_PWM18>;
+			status = "disabled";
+		};
+
+		pwm19: pwm@d4022c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM19>;
+			resets = <&syscon_apbc RESET_PWM19>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
