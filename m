Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C0DC48286
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pr8O70OKWWB2D3rdKYKpvcNOM/3ygU86/zuUd3jDLE=; b=oMFXa/cDj2MOVF
	PRFcC8Ttvk1uvmmH8ry83Reio6JtkoszTS3L2XrXxgvuiVuEbzM47VNQvcEAPzyVHlYkEO7wI6IXw
	gLmJzhWARFb2DNwSsV4iOrNPLffl6SMRv+9GFNMwlqP3vZkPm5VzWpj0IakLEE/NwCOfDvofNTsRr
	W3uQ1+V/e2qf6ziCUsD2JnSWpMjvTum+aP/vAu8MHaKifTXQckzw9XwZ+EIh3k6dTlZB7bNCEHEMJ
	YB1d6+zfaLUpvgVZv39hdSkm8SWKiyQDQzgGBb1fEKGTJJko4WwiYgCNmVALxTObdgprjj6danxs4
	HkWn5xKv/4NbVkA+kO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNF-0000000DE4O-0KkA;
	Mon, 29 Jan 2024 15:16:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNA-0000000DE26-0pDA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33ae5e7d787so1588057f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541390; x=1707146190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRPYmXZnIT01poufmeMRGZaKCj5tsIcmA7FhqBODKic=;
        b=aggT4tpZM1Wf0DKGeGMP5yOE4bd0ji991Mi6nLyndHU3KpAOh+gJhxnvYdaDnH9Bjq
         vp3ztRXgSCplpQ9L59Xm30ijQuZEtZfLFbUDiflIyH61iA/S9Kzjrbn+xjTVN4bH4ylZ
         k7kOU0pfdOSTgO1YExEVWvDVgTcoE4o0n3UE9miMxkl8cMsuVBy9PBlWqb6m+69Mzwpg
         ngIlrhCLLglpHdvkZEkoA28/6fcOacr9nyegY3MeapUa0Yw1x7zpp5Gzjn/UgqDyJ5eV
         AA1XxDO7u5tAd61EGEnc/vGzNqDzc+lhnGQoxSMrGerv6QVOSzl7lnRqEZ6KsCnpMUdm
         6Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541390; x=1707146190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRPYmXZnIT01poufmeMRGZaKCj5tsIcmA7FhqBODKic=;
        b=KuzbJPpt6KMR+PemfzhEmE5As8ITGR/ZxcLGNwTR9Lh8ncaBv+PaReFtT+d6Iypa4O
         znLdcnrUDDxNbTq+xASxAFW08e6TvmwigG1CmvzkoCC2mUmAq3oHK7wAeavqeSnTGRls
         4mYTMPFwscEAJZ2BUKqXgpELVHpr96xKioD2l6+E2EAt7nCPqZybM/UEcOvdpqOIRig8
         Y0JKpB7HOJX+zqcDI8pPVBwfOfr88cQbbXzE4Q1gNx41haOkiR5bqSV3o256Dn2XbB1W
         MARPCdhSGa8eWKc1t7EgrhZitNZtZigfMgoO1/EZxSCxXuxah8O0VSXxZfy7luzpBl+y
         KNpg==
X-Gm-Message-State: AOJu0Yz2OOe2eQ8hvjqejTAwad87Vtrd3su9EWRbp8eUi/rsCB6Z3xs8
	SWWX20NZZFfaMp+6OHP7/zdpV/3fg5ZzcyX96DH2zTuDPQDbgNwk
X-Google-Smtp-Source: AGHT+IEnu42aSb7Ky9qC9wvEJ1nW8oN4/7POsNlm7cXhpfdpi1cTjbNoRtxNqJjKC4KUjxXGypeXbQ==
X-Received: by 2002:a5d:4ad2:0:b0:33a:e791:d8ac with SMTP id y18-20020a5d4ad2000000b0033ae791d8acmr3430590wrs.12.1706541390428;
        Mon, 29 Jan 2024 07:16:30 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:29 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
Date: Mon, 29 Jan 2024 15:16:16 +0000
Message-Id: <20240129151618.90922-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071632_275394_AC55706B 
X-CRM114-Status: UNSURE (   9.10  )
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
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 76 +++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index d7a66043f13b..d2272a0bfb61 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -50,6 +50,82 @@ &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
 
+	irqc: interrupt-controller@110a0000 {
+		compatible = "renesas,r9a07g043f-irqc",
+			     "renesas,rzg2l-irqc";
+		reg = <0 0x110a0000 0 0x20000>;
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		interrupt-controller;
+		interrupts = <SOC_PERIPHERAL_IRQ(0) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(4) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(5) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(6) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(7) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(8) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(444) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(445) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(446) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(447) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(448) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(449) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(450) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(451) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(452) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(453) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(454) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(455) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(456) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(457) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(458) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(459) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(460) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(461) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(462) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(463) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(464) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(465) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(466) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(467) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(468) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(469) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(470) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(471) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(472) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(473) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(474) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(475) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(25) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_EDGE_RISING>,
+			     <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_EDGE_RISING>;
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
+				  "bus-err", "eccram0-tie1", "eccram0-tie2",
+				  "eccram0-ovf", "eccram1-tie1", "eccram1-tie2",
+				  "eccram1-ovf";
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
