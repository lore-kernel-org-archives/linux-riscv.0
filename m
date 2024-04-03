Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E87CD1297
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4u3XXKIKwOWWnIBvzvm+JeURJ3IwJFvRD1FjErUmWhM=; b=LFg1CtHhId7/e+
	OvEQst7pwu5wxUCHrgfiNI/DMlp/Rku/2OXS9KojcBOwpkOUsNuWdiLfsc1HCaSfjRVp7v/RnBen/
	kj8AxjHRWwV33roetePOXOIX16BB5KaL+d6zFWTNqTxOcBh7h2o0dLbEmNHvqasRBlafbD1B6Kvs9
	HgWyZ6X84w1CLmOCbfAFpEHazMDVVuHdSMpCS+djpJ/KTNgVswiCYR2a9RqNfNmoCrAwU0ZuXaFRh
	fgmLDwEYvtLT4SRH8ZHOMUsBzayc9rIxflPd5Znxr2qynqTkZNvfninXHEkhpQJIO2L6SJ5VsygO2
	aHXjEuwwPyX3RKFHG3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lf-000000006t9-1hht;
	Wed, 03 Apr 2024 20:36:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lb-000000006qs-0SAP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4155baa696eso1700655e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176597; x=1712781397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIhSDuKRxtReMhoBOeQdaM5SSml7tb0U0bOehxLDLJ0=;
        b=E8+ZBijY/sW0SOIwmg9MBiycM2mpiKN6A2HqBB/JQaQjGcOahlW/UtJV4SGtGJsPPo
         +4UdmVAT1JOdcYZb7gqifDtOn7MNtQGyVn2NVu/lT2VgDdEfG1T/iYphxXcxVue02yiW
         vip1dahdh3T2Q/0xFd5QwfTAQYd9NylCRtDgFKJixAW3MNJkDj01pxf7LKTakl1VbbrS
         ALTcAAxZZJy9TIGgkzT3L5IKugAN1PNmpUdLl/uSYQq5GmtV0NXeGv/NgO3ic1Q/kqAV
         jwW3IoL+EjRonvEp/VXbAf94ZmNCb0riZ0oPRc2/GWArcoAs7qeOP0WLLlyEOaMyg14e
         0AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176597; x=1712781397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIhSDuKRxtReMhoBOeQdaM5SSml7tb0U0bOehxLDLJ0=;
        b=btZJZbRHD7zrc3g2eIXkJxxecuhQScR80rMfPjp5VbiUEY37R8Eo3M15/Bx0kIst3F
         azVYKOurjXftu9r4UwIiMgPwmupRf1jBwRPNKG7WLefuDNQLHTaqKsv1bXKFJyYK8uv7
         b3bcT/vqs6bFMrcaxThkWGBTWLgwywmB616nQblzmqCrT84PeQPyJrK/bO02qNySpoTD
         hSbSwlo22I11XDTdK5W2PEXTUP0fkPZFUd5onHjmZGpGG+RlURCejjM4X0PX9+emOOBC
         KZ7F/iTORBNULPHTTt2jhVW5r4ipzuf5K0ZcgwohhiLq6eYFPJOVOiTNiAHiNXDvFxsz
         OVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7PcAx7qUImiiHSNx0ISPMcAFmcmRgEd9q00lOX7HtIOd8sRtlGUck6jKXuwbYtquofnHDwRkEj56DRLEaQiIpnMr/4Yakgn11FesmPYz
X-Gm-Message-State: AOJu0YwaSVc5NRPOBpWHWZcQtD+pCKqeSq7OW49lNwWgleJx8fOP3gnk
	ZRXqx/VI5rW0OxdT4llN1d1PaKFmW+S1Baccx2g0PZKr+3Dm9sSK
X-Google-Smtp-Source: AGHT+IEBf4EI90GwLyWaZhn9tNMQRNMUHp0wiyU3VQSutIIF0BpUCmJKhP6GflB/sJ4C1FaR3PGQ1Q==
X-Received: by 2002:a05:600c:1d27:b0:415:4824:3686 with SMTP id l39-20020a05600c1d2700b0041548243686mr471596wms.25.1712176596939;
        Wed, 03 Apr 2024 13:36:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
Date: Wed,  3 Apr 2024 21:35:01 +0100
Message-Id: <20240403203503.634465-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133639_193935_8853A292 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the IRQC node to RZ/Five (R9A07G043F) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped using SOC_PERIPHERAL_IRQ() macro
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index f35324b9173c..e0ddf8f602c7 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -54,6 +54,81 @@ &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
 
+	irqc: interrupt-controller@110a0000 {
+		compatible = "renesas,r9a07g043f-irqc";
+		reg = <0 0x110a0000 0 0x20000>;
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		interrupt-controller;
+		interrupts = <32 IRQ_TYPE_LEVEL_HIGH>,
+			     <33 IRQ_TYPE_LEVEL_HIGH>,
+			     <34 IRQ_TYPE_LEVEL_HIGH>,
+			     <35 IRQ_TYPE_LEVEL_HIGH>,
+			     <36 IRQ_TYPE_LEVEL_HIGH>,
+			     <37 IRQ_TYPE_LEVEL_HIGH>,
+			     <38 IRQ_TYPE_LEVEL_HIGH>,
+			     <39 IRQ_TYPE_LEVEL_HIGH>,
+			     <40 IRQ_TYPE_LEVEL_HIGH>,
+			     <476 IRQ_TYPE_LEVEL_HIGH>,
+			     <477 IRQ_TYPE_LEVEL_HIGH>,
+			     <478 IRQ_TYPE_LEVEL_HIGH>,
+			     <479 IRQ_TYPE_LEVEL_HIGH>,
+			     <480 IRQ_TYPE_LEVEL_HIGH>,
+			     <481 IRQ_TYPE_LEVEL_HIGH>,
+			     <482 IRQ_TYPE_LEVEL_HIGH>,
+			     <483 IRQ_TYPE_LEVEL_HIGH>,
+			     <484 IRQ_TYPE_LEVEL_HIGH>,
+			     <485 IRQ_TYPE_LEVEL_HIGH>,
+			     <486 IRQ_TYPE_LEVEL_HIGH>,
+			     <487 IRQ_TYPE_LEVEL_HIGH>,
+			     <488 IRQ_TYPE_LEVEL_HIGH>,
+			     <489 IRQ_TYPE_LEVEL_HIGH>,
+			     <490 IRQ_TYPE_LEVEL_HIGH>,
+			     <491 IRQ_TYPE_LEVEL_HIGH>,
+			     <492 IRQ_TYPE_LEVEL_HIGH>,
+			     <493 IRQ_TYPE_LEVEL_HIGH>,
+			     <494 IRQ_TYPE_LEVEL_HIGH>,
+			     <495 IRQ_TYPE_LEVEL_HIGH>,
+			     <496 IRQ_TYPE_LEVEL_HIGH>,
+			     <497 IRQ_TYPE_LEVEL_HIGH>,
+			     <498 IRQ_TYPE_LEVEL_HIGH>,
+			     <499 IRQ_TYPE_LEVEL_HIGH>,
+			     <500 IRQ_TYPE_LEVEL_HIGH>,
+			     <501 IRQ_TYPE_LEVEL_HIGH>,
+			     <502 IRQ_TYPE_LEVEL_HIGH>,
+			     <503 IRQ_TYPE_LEVEL_HIGH>,
+			     <504 IRQ_TYPE_LEVEL_HIGH>,
+			     <505 IRQ_TYPE_LEVEL_HIGH>,
+			     <506 IRQ_TYPE_LEVEL_HIGH>,
+			     <507 IRQ_TYPE_LEVEL_HIGH>,
+			     <57 IRQ_TYPE_LEVEL_HIGH>,
+			     <66 IRQ_TYPE_EDGE_RISING>,
+			     <67 IRQ_TYPE_EDGE_RISING>,
+			     <68 IRQ_TYPE_EDGE_RISING>,
+			     <69 IRQ_TYPE_EDGE_RISING>,
+			     <70 IRQ_TYPE_EDGE_RISING>,
+			     <71 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "nmi",
+				  "irq0", "irq1", "irq2", "irq3",
+				  "irq4", "irq5", "irq6", "irq7",
+				  "tint0", "tint1", "tint2", "tint3",
+				  "tint4", "tint5", "tint6", "tint7",
+				  "tint8", "tint9", "tint10", "tint11",
+				  "tint12", "tint13", "tint14", "tint15",
+				  "tint16", "tint17", "tint18", "tint19",
+				  "tint20", "tint21", "tint22", "tint23",
+				  "tint24", "tint25", "tint26", "tint27",
+				  "tint28", "tint29", "tint30", "tint31",
+				  "bus-err", "ec7tie1-0", "ec7tie2-0",
+				  "ec7tiovf-0", "ec7tie1-1", "ec7tie2-1",
+				  "ec7tiovf-1";
+		clocks = <&cpg CPG_MOD R9A07G043_IAX45_CLK>,
+			 <&cpg CPG_MOD R9A07G043_IAX45_PCLK>;
+		clock-names = "clk", "pclk";
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_IAX45_RESETN>;
+	};
+
 	plic: interrupt-controller@12c00000 {
 		compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
 		#interrupt-cells = <2>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
