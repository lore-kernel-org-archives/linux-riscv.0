Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F4AC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHCIU7Tq7Yt//ABU++/zccnfIz5iY+QHIxC9FONZv7U=; b=UiOHN0/ARQ6sxD
	gWfsyIgy3VL6pmd4kB6aWoVzj0gPi46+vE+J28Cf8nSkd2uPpUmBX6q8Kz/aEhvwZH/60wOuXwPPy
	lS8KfNBgWKOvsTFrqD9lExSSX1hDyLPOn/Bm4FYlnWnSC2UPYCzK4UmrXAE/DMbIX/aqJRrn35mU9
	2y21wnBhgwVVZ4WiEIriwkJVmxXAW0+pyTwVrp+P3lo6xbwP2T18qUpspUCFlgGdMYHdMU/fLkkao
	i5vW7Z08KEPbd0g6MOgmQjuQGeHM5XzbByHqhOPY3YqmSSTzdY7p4+5tPmM/smEWLRpyihs6pvW+C
	9ds39iOTPw9df/3bTwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3ku-0000000DlV9-1B98;
	Thu, 08 Feb 2024 12:43:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kr-0000000DlTz-3wBB
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4104ebb050fso686805e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396227; x=1708001027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdJLmKQ65BMtsSQC9cqhbiLHAUPTKIBgtUh7WrB9pSE=;
        b=Qdu/VpgqZjvghSiTcuG3vsNahnqkew25uNRG+HYp4x9rKa3zPGTW28S6HSddLXPicR
         32Pl84V0yRMHObdpOBfR+XQGXHnxWd8GyMBgUhQxlXK7BfrB3O3LzvuQNKD+OVyhJ/pW
         5D1zXonJy0v9wFxkGC2B1TM9so0jztd9MPW5Vbp+6HTDOVDeF4c71nHoMnTxRWKBdKGx
         L7eWocaGozvM3zPp5I1kWE6/SqK7PcwnxuIKWxcgnQE2nw05o3XhYdTikCxh+N0WR/MG
         GM5p2aR4jl39eLzXtOkCtKzphBth3y3/VOpmYp1/PqnSox71Mg860rRUZJXvYReS2z3+
         I4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396227; x=1708001027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdJLmKQ65BMtsSQC9cqhbiLHAUPTKIBgtUh7WrB9pSE=;
        b=qkyVbDCmVh0rAdHcW3N2FId3TVMcpZqoG+3rvTJ7yPbYuVkRy4AFtGDGeIUzEAdTt0
         iUkjcvJhUfMtQj+3CLMqSZs1eZXA19OCRVCNcr9hOEvEfWhioXZ4jg+8V4fUovTwyMvS
         U5g7FBAlVcAprhzL42QOMwgxahWSwtjuWk5/IrUaSmsBYbpd8bKBcc+epf7wP2bPTB2H
         dPyKp3debRO1ACU48u8U3nZrj3VTswb9tPDNvkcVGbeIHIPZi+I0oTMIj0pzUYXF3eNo
         MoBeyex5GFqJGyOIUtEK1gocRkpdtsbB3A7X4Whe3dKUdBOtAxsoWJnu/+UrxS01idub
         Wn2A==
X-Forwarded-Encrypted: i=1; AJvYcCX9ejX2Rnss2URaChtyNk5Tr0AQz5WO2Q5faC8fux9pvhDFCfKAWWIx0y+arRmDFdUhiJA1PCcv5qpaJXrkjeBb+Dqgywd7wgAS7NPcFrj3
X-Gm-Message-State: AOJu0YwLLQzSchhqPSSsKBtHZdpB2uAjDW5IYZl62/o+nJlDKBKyO8kq
	ITJ7zPcKwsy/NVoOVK14F59QFFWNra8uU2FGJE0ydHhm7YVUPQG8wHxhBIsbovo=
X-Google-Smtp-Source: AGHT+IEjy8hQ+TSiHVJKiUqNNydluQHd6TNFcWITSFbJ7yO1R4sQYbtx3f8HLiTkAgnMhX1JsqcKMA==
X-Received: by 2002:a05:600c:3146:b0:40d:484e:935 with SMTP id h6-20020a05600c314600b0040d484e0935mr6819781wmo.12.1707396227293;
        Thu, 08 Feb 2024 04:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv8f4Ko9nDmMnhQcD+XqT4xiktMTJPAPIzXZALmF0IeJIKbHi21a9P1UYargWoyYD35zeuFwvcORn0X1aUKUSIvHJs9z6sKCp87goXE1fkaNg3tNdgRbZfUe/9mTr1qjKLKiTaGY6vvQDcopC4+Gn3xmWyOi1Eey2+ccLr2dT9TWvpj6gWW4Z4ThI0xeiOHHpYVLTObPcJz/S7YTYodC1alWrFJUgmQcvm8sB0x9KWrKaYuK9yJQWrKivcMp70tZWkBOuA9A7/baO/+IwAVRx3/El5I+NK4ksm8C/I7pZ8JNtHKXAC4yPHIWP3rLpAtVAfah3zuVqTfl956yTEvz/dnfESGOYSt61b2WaqlJ5oDL3JjJgq7To/aB2Z/ft/Km4tgbLJHzlKm8wPfgDE0Ic9uAIjoH9BVGMgUX8T6EP+LCWuV+pAa67itNIFupr4vbRM7kkC1v8cpdPu8S+FDH2TM5zGFmpDVftKzjPXu2ssz4WJs7EG0JTeUfmHHsgy8mKGOiJ5TJegROJop0lEU1CmR+RfetLNIES+eNYpKaeqRwaLV5bbykE4PLIyHv7Jkfk=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:45 +0200
Message-Id: <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044350_004939_5AB8311C 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2L (R9A07G044) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g044-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 0bb17ff1a01a..e209f96f92b7 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -217,4 +217,62 @@
 #define R9A07G044_ADC_ADRST_N		82
 #define R9A07G044_TSU_PRESETN		83
 
+/* Power domain IDs. */
+#define R9A07G044_PD_ALWAYS_ON		0
+#define R9A07G044_PD_GIC		1
+#define R9A07G044_PD_IA55		2
+#define R9A07G044_PD_MHU		3
+#define R9A07G044_PD_CORESIGHT		4
+#define R9A07G044_PD_SYC		5
+#define R9A07G044_PD_DMAC		6
+#define R9A07G044_PD_GTM0		7
+#define R9A07G044_PD_GTM1		8
+#define R9A07G044_PD_GTM2		9
+#define R9A07G044_PD_MTU		10
+#define R9A07G044_PD_POE3		11
+#define R9A07G044_PD_GPT		12
+#define R9A07G044_PD_POEGA		13
+#define R9A07G044_PD_POEGB		14
+#define R9A07G044_PD_POEGC		15
+#define R9A07G044_PD_POEGD		16
+#define R9A07G044_PD_WDT0		17
+#define R9A07G044_PD_WDT1		18
+#define R9A07G044_PD_SPI		19
+#define R9A07G044_PD_SDHI0		20
+#define R9A07G044_PD_SDHI1		21
+#define R9A07G044_PD_3DGE		22
+#define R9A07G044_PD_ISU		23
+#define R9A07G044_PD_VCPL4		24
+#define R9A07G044_PD_CRU		25
+#define R9A07G044_PD_MIPI_DSI		26
+#define R9A07G044_PD_LCDC		27
+#define R9A07G044_PD_SSI0		28
+#define R9A07G044_PD_SSI1		29
+#define R9A07G044_PD_SSI2		30
+#define R9A07G044_PD_SSI3		31
+#define R9A07G044_PD_SRC		32
+#define R9A07G044_PD_USB0		33
+#define R9A07G044_PD_USB1		34
+#define R9A07G044_PD_USB_PHY		35
+#define R9A07G044_PD_ETHER0		36
+#define R9A07G044_PD_ETHER1		37
+#define R9A07G044_PD_I2C0		38
+#define R9A07G044_PD_I2C1		39
+#define R9A07G044_PD_I2C2		40
+#define R9A07G044_PD_I2C3		41
+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46
+#define R9A07G044_PD_SCI0		47
+#define R9A07G044_PD_SCI1		48
+#define R9A07G044_PD_IRDA		49
+#define R9A07G044_PD_RSPI0		50
+#define R9A07G044_PD_RSPI1		51
+#define R9A07G044_PD_RSPI2		52
+#define R9A07G044_PD_CANFD		53
+#define R9A07G044_PD_ADC		54
+#define R9A07G044_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
