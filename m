Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0377C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTV4HrssScXzezWN+7XhLk65yoeqmASM2NgNci+pf8g=; b=Ho8rf+pl/skEcY
	dSn0OSlNWwIwtuWfYGrif+DrQvjqsTdISkF2BdqxhHcVoFqCv4FTMxapLbRyFKM76UNruYfxkp4hn
	sKGb3RpQF2ppc53qZG5obLubrFQcvMivVgp+QnDehMF3EopILp1DtKdU1NjmlciAoTrwZzszJwyxK
	y7pj8PkaEAYGCE2sBItgVs8EEeaXPvEn7adFPQb5ywdncbZQwY5z3hEKw//vqq3rXjhqMN79CfyXD
	rGk+mw6/BABOPkM6OFvMO2XmejK0IYEYtc+9Zed7q7yu8I/UOO8fRU3WVbRhwtGYvW4EHznxHKink
	LKF43UTDH0dKBlXcnkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnZ-00BkIi-Hm; Fri, 19 Nov 2021 22:56:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnW-00BkGC-LR
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id n85so10520935pfd.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1TdlIUtILM24Fc2UXh8s4SrJCWxmjGMPvwtQIlJ5JvA=;
 b=k2ZKvdwo7VNV+6taHj2fBaQjreLV5crFPY+WVis2Pge4ac9Mzc5G3ZwcQ2XI/toKiz
 xam+oXmu1ckuI1WGKNF52sYPFOef+cFtDEKM64+A07/pj7L0kVuLGq0fxswUolb3I+uQ
 63K2txyOMIhP4wl0SSck86zX9pkqMArenANzIYG2NlHiORlmes/+5wFuI7i023zMWRfb
 ysvBVueVKaeO/PAwCIX79vc0EvIhEvRVrKP4kX4oMm8J6Sxx8pIWqpxZV/zZsHCdW2IN
 btGSnFt2tNg3lWvXuzUMoFkk1BG5YuwYXyvW0eKWf/lKAjlgq1f1yyD/C/01PmBK/Ub3
 33ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TdlIUtILM24Fc2UXh8s4SrJCWxmjGMPvwtQIlJ5JvA=;
 b=Ai6UK8lMXbx2KVR7IBNQjGU0N9q4iAihP/RqksoCJt3dMElc3ZZtYyjBVVLIcayCV+
 GH4/uVPiDfWWMmSpG6KM7w0AnCw7Fu8ylrxD5A15mfKxtEWcHf/3LzhNpksW7aRYI+vE
 QQIhccmTw/yAmDLCwN4nHhr0ZcPrgLAlNyQgGVx+c5MJb1txCT3mPcU6LdhRkc0MdL3E
 iEKyUlCGD6KE3ECogTdmpdsGIzsKkzYkdWRhP3P1WAfNGBQmr1o7Hhfia3aFoucPw17V
 Y4td3ORv0zQQtroBF9fdhERCSbgw2r1LkiPkwpQ2SidTk4rGOAhAPCOFREn5SHKzP9Su
 kxWg==
X-Gm-Message-State: AOAM530QXxUkliNhPSyKu6UN4MxEuhHS81A+D7weBRE8glDhH3PNtEFM
 tUzPsIXkRXOV4mhvGn8NHfCxxGjJD4Q7uteC
X-Google-Smtp-Source: ABdhPJzxs/PXuLiHQU2pcYAU1NtTrlRYL9Jvb4fvqk3t4JTK6e+qbvibiIGhHAjqqEhI2g7tePcFdg==
X-Received: by 2002:a63:844a:: with SMTP id k71mr9951068pgd.101.1637362557132; 
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id x18sm618413pfh.210.2021.11.19.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:56 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 2AAD7900956;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 2/6] riscv: dts: sifive unmatched: Expose the board ID
 eeprom
Date: Fri, 19 Nov 2021 22:55:38 +0000
Message-Id: <589539cd08e35c35b269a769caeac40b85ffd01c.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145558_740609_6386C1BF 
X-CRM114-Status: GOOD (  11.09  )
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

Mark it as read-only as it is factory-programmed with identifying
information, and no executable nor configuration:
- eth MAC address
- board model (PCB version, BoM version)
- board serial number
Accidental modification would cause misidentification which could brick
the board, so marking read-only seem like both a safe and non-constraining
choice.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

---
Changes since v2:
- Fix end-of-commit-message separator so change lists do not end up in them.
Changes since v1:
- Remove trailing "." on subject line.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 305a086e5207..cf8937708829 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -58,6 +58,16 @@ temperature-sensor@4c {
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	eeprom@54 {
+		compatible = "microchip,24c02", "atmel,24c02";
+		reg = <0x54>;
+		vcc-supply = <&vdd_bpro>;
+		label = "board-id";
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+	};
+
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
