Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B8C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJFjPxUETTREzqKei/IRalLsEM6jcgucts4PrreekMI=; b=vtvlfCVAuuOu2U
	cbqvO9VLdTkORQg1X4Oh0FDi8WSzj5m/zF70Q0zbrDpcYqmv/1VIzPhFAVL+38uhYgIpzWCbImLkj
	HZBzvAzVE1dvPCyvr6gLE5Drn+ke7Hx9O6pD3gwRhNUvOYkXviFeh0D8bqips6tAIebrMSubfy3iU
	kUGhaZ8yxZ7YwlpdYc3qwCwZtk1Pcl5LjFMqiRurEnHkeJRKOUT8YHfp/7QyG7+Oacvt1Dz1/SnNA
	ze2UjyZ+rSa9mIEw4ehCOHn9txMUtjeXI0aSKmcf7twrtUg+/1x9BSlNRC5Crq3rjjKwZKrccftDy
	jxQ1w8J/gE3VxIHO8zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3ku-0000000DlVD-3nta;
	Thu, 08 Feb 2024 12:43:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3ks-0000000DlUa-31Fs
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40fdc63f4feso16583345e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396229; x=1708001029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fOhTxwLR2CTPTSVgD2JffQTM0OmlAEFcQjojvDRSHE=;
        b=X5IwI2s2TFowpNZdJ0ZKkOJE1pVjr6VHpGEmEjCH7qzpdNF0AP/RV7tK5feia05W77
         ov8pglzvjbOkMHLcTjBBqSbwODmYlDQCnvM9I50TFwYXeAdn3O1W8jPOo8ui7nXcC2Fk
         izw+XphngIhILIFAerVAW+f2VBO2/KAY7Qd2xo1QsTGFI0dBssE03sS8mS2AiiXOQjrX
         lCcAS1Aoh2K1+Cqtmj2gdfSdpZ4Jrx7xp4OzdbDR2Q9CZtIG/kP9equHudCJ+aQmLMZC
         zQlg1DICUA7ToYZG78/6bEFhJRieQn/BTiBzpcrOcgzK3/fq1jS9fr9JLsV/7Vmb10Sz
         M5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396229; x=1708001029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fOhTxwLR2CTPTSVgD2JffQTM0OmlAEFcQjojvDRSHE=;
        b=tMVlUBPuScXsrwzEupDW9mfom2BMoLwa+DX/FLlQoxgNPXTQpGi5RsdxDyvR3l4B0L
         RNJ4ktCX9boTzrnOghaYG7eOP6SQgt/FEgxh4tjRobzfIkrQ0unNoCQ9T9Hv9duw0RqA
         Ptg/T1ZyEsas+oY6Rr/ZB3O169w+q5cQG2Y1EOyzIrYp7vBP3x+KH5n3b7aUv7Ypg6fh
         APNReFtfu/9qETJufmILYRgXnyrXgq+WZCHfFWwhXIaZDzmgjKBCf6umM7KWf95kE3MY
         0q53VwB8WcA6W3KiDba0Y/Y1L8PciX169gN1QhVTr4uwUGvfhD9YeFTGVSnzgW9t9ZgH
         /vHg==
X-Gm-Message-State: AOJu0YzEHOHdoDzluvF7eyJstT9T9SgkTRz8FzyBot8nkSiOki0FNdHY
	5OoxyMuyzRnSHZIG3sNzepPNHf8YILCqmOoiCByHaje919oj06stnyKO78UBIGc=
X-Google-Smtp-Source: AGHT+IGZ/OcDn9XPGfMMCWWCJdAhmDANv8WANS2E3UnxPczVABByOOstT6S9Z6KhZwZJ2T+fQBSfSQ==
X-Received: by 2002:a05:600c:548f:b0:40f:dcfa:49eb with SMTP id iv15-20020a05600c548f00b0040fdcfa49ebmr7243377wmb.38.1707396229587;
        Thu, 08 Feb 2024 04:43:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBGegHiGd58BcX1RZ1tU2XrzC4XJ2uIY56GpOH5CUKNnLUQ32L1rzWwPkYY1gRkvK9QOZlvuLRzSwUwfoOtxf3Yn/CGM5hrvd+/mlPXAWQB+uYAjQJf7GdRedlZS51D8gwnJmiPMyRAvORjBw6l0GaTn2Acb+jKzY9hK9ytAm37t3EkZZJ7huTI+mFTZv8dgfclwL3dnOEfVydrTyDo4ogdUWpaxKujw18RtsDAH7vyReJbGYbGgds+w/e3EZoLFYGD9voFY1qdM3V7736ARiEtIKRWUwBqUvjD8bjXLIOjtBlfPOwVoNXvgszzeIYSfVQnHdDQ8CI48DICoefkYbeJUES2qdexQqIG6+YpeBB2bEIqkU/j2Jb9BErQyE5oxRbXEYa2yjYbJLgtm70UJ3FXn76E64liZPIV0HEs+/W61fZRiCuLS5fvxuEno6bjXAOD+dIyy7wPvcuV53AlXBLAGfAwCFbibz0cHn7o/XRnoJBO+EXNTZmAPNLguOFRmZ+X54ZI4/Svre1rJWyymuxZseki5Z3e7P1w2pOVC6jqRuYyJggIMlUZHmYfO793sc=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:49 -0800 (PST)
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
Subject: [PATCH 03/17] dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:46 +0200
Message-Id: <20240208124300.2740313-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044350_787295_039B9BC9 
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

Add power domain IDs for RZ/V2L (R9A07G054) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g054-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g054-cpg.h b/include/dt-bindings/clock/r9a07g054-cpg.h
index 43f4dbda872c..2c99f89397c4 100644
--- a/include/dt-bindings/clock/r9a07g054-cpg.h
+++ b/include/dt-bindings/clock/r9a07g054-cpg.h
@@ -226,4 +226,62 @@
 #define R9A07G054_TSU_PRESETN		83
 #define R9A07G054_STPAI_ARESETN		84
 
+/* Power domain IDs. */
+#define R9A07G054_PD_ALWAYS_ON		0
+#define R9A07G054_PD_GIC		1
+#define R9A07G054_PD_IA55		2
+#define R9A07G054_PD_MHU		3
+#define R9A07G054_PD_CORESIGHT		4
+#define R9A07G054_PD_SYC		5
+#define R9A07G054_PD_DMAC		6
+#define R9A07G054_PD_GTM0		7
+#define R9A07G054_PD_GTM1		8
+#define R9A07G054_PD_GTM2		9
+#define R9A07G054_PD_MTU		10
+#define R9A07G054_PD_POE3		11
+#define R9A07G054_PD_GPT		12
+#define R9A07G054_PD_POEGA		13
+#define R9A07G054_PD_POEGB		14
+#define R9A07G054_PD_POEGC		15
+#define R9A07G054_PD_POEGD		16
+#define R9A07G054_PD_WDT0		17
+#define R9A07G054_PD_WDT1		18
+#define R9A07G054_PD_SPI		19
+#define R9A07G054_PD_SDHI0		20
+#define R9A07G054_PD_SDHI1		21
+#define R9A07G054_PD_3DGE		22
+#define R9A07G054_PD_ISU		23
+#define R9A07G054_PD_VCPL4		24
+#define R9A07G054_PD_CRU		25
+#define R9A07G054_PD_MIPI_DSI		26
+#define R9A07G054_PD_LCDC		27
+#define R9A07G054_PD_SSI0		28
+#define R9A07G054_PD_SSI1		29
+#define R9A07G054_PD_SSI2		30
+#define R9A07G054_PD_SSI3		31
+#define R9A07G054_PD_SRC		32
+#define R9A07G054_PD_USB0		33
+#define R9A07G054_PD_USB1		34
+#define R9A07G054_PD_USB_PHY		35
+#define R9A07G054_PD_ETHER0		36
+#define R9A07G054_PD_ETHER1		37
+#define R9A07G054_PD_I2C0		38
+#define R9A07G054_PD_I2C1		39
+#define R9A07G054_PD_I2C2		40
+#define R9A07G054_PD_I2C3		41
+#define R9A07G054_PD_SCIF0		42
+#define R9A07G054_PD_SCIF1		43
+#define R9A07G054_PD_SCIF2		44
+#define R9A07G054_PD_SCIF3		45
+#define R9A07G054_PD_SCIF4		46
+#define R9A07G054_PD_SCI0		47
+#define R9A07G054_PD_SCI1		48
+#define R9A07G054_PD_IRDA		49
+#define R9A07G054_PD_RSPI0		50
+#define R9A07G054_PD_RSPI1		51
+#define R9A07G054_PD_RSPI2		52
+#define R9A07G054_PD_CANFD		53
+#define R9A07G054_PD_ADC		54
+#define R9A07G054_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G054_CPG_H__ */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
