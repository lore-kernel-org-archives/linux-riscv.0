Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B23C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaMcakLOQaItZNQ9e8FwaHpbU0ywgvRgCRWqB3NKNIY=; b=lTUiJs+UxDAsVG
	6KHeLp06AuEf/nlzi8OOOK5oBICl3WMwvGBgvR1DdnE3ggqjPVovtVQmU0A10kX/C6+H3CESloFy5
	e4qTMsYaOgxuQCZ5GOzBP3OlKrgct4UXS44pLVmt62Epry0fdBIo/qkKU9WyXFK9SxWXztuaMSaZ6
	ybbboCGznEKJYCebQ4e9TupmfW4K/o0VPcv0C9+pJ5Tx6GEhMtE+biZMbsTezLXmVB1kAEmI5lJOF
	2fFxxZAJW6QL292L+xNtuOZTNE81Ox0KgKPlrxhGA/46Kq4N9ut4d5nMukQMCzSWYy0BrtYIkMb5J
	KtU8b8wykm/kxe6VNoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqx-002EOm-Tm; Tue, 05 Jul 2022 19:04:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqt-002EL7-EZ
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id f190so7580904wma.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQOVUNXHvwHVcucqUlVv6BnH7JR1aGPeK9i5YAi0Y4c=;
        b=SMCwI1AUdC5Z5umwrRWknLPNvbobCNRXr5gkynO1gpaKoWOB7NbxsldL+1F5GgT+GR
         DjGz9/P4VOH+zT0ApBC3nAj9SaYA8bl9PwDwpKYtJSvHPyBJ3rxIlwColLPEhHA6htoG
         BshgcauwhGltFavxv3m2/BquB79DYVejyEytpDb2+tww9WA7j3jyELnuVx0KxT5+xpm8
         q7n7J/XoBnMIEM5pjCg4ox5jYZ23uFdpqxeBwmOjjLvJQOm93XsRCkECL5jg+z9FG6Hh
         KqleVJwWfSle8KFpr53AMLL8i7toF5OjUZapP8KmI1oRvdPgl9ReB1pPTTl1uWh9Ag73
         0KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQOVUNXHvwHVcucqUlVv6BnH7JR1aGPeK9i5YAi0Y4c=;
        b=ckvHznZl/l/eCeEyzL2oujKld/CplaEk2Kp0b12zCK9A4E2FHlAqsnMjGUOV3iPToa
         owHdUCZRDkFtoPhrpC2abIjE1Er75AFyjYi32DTfzVDgoW5y24DK4pY3MOw485O+q9tJ
         UEgsg8KtgXHur4eo6w7UNrR4jOq6gGKtF+f6aJ8lUxj1exQQ6eyLuz4UtVRb03cPEniC
         rkXIbhRJqvVM1tpywL4FzeXtVOIPwiRFj2S8Q0N6WehbzED4xd1DKUMvLWlkN+uevVsd
         KFBSfjuWQysV9bJMnFkHyMQb1pXI/AvAZBurdWxVSkFn1XiOCephFJTB7ZZ3uM8DC/r4
         5QTg==
X-Gm-Message-State: AJIora+z2RjpI6KpdHPtrgphYFxoSekiyMTbCMEkW0qmo19uckrFab4Q
	RJU9zvMmgKv7RLrsGDrS1oQmSA==
X-Google-Smtp-Source: AGRyM1tZGLDMdvlgykupbCQXP9nd5v6//7GI6YZxCZExzQZtITUr0XqM8RF7qHZYbKpMoVi8K3BeLw==
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id z8-20020a05600c0a0800b003a19319ab78mr21659837wmp.158.1657047889777;
        Tue, 05 Jul 2022 12:04:49 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:49 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH 1/5] riscv: dts: starfive: Add JH7100 CPU topology
Date: Tue,  5 Jul 2022 20:04:32 +0100
Message-Id: <20220705190435.1790466-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120451_528995_546B1EE8 
X-CRM114-Status: GOOD (  11.23  )
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

From: Jonas Hahnfeld <hahnjo@hahnjo.de>

Add cpu-map binding to inform the kernel about the hardware topology
of the CPU cores.

Before this change, lstopo would report 1 core with 2 threads:
Machine (7231MB total)
  Package L#0
    NUMANode L#0 (P#0 7231MB)
    L2 L#0 (2048KB) + Core L#0
      L1d L#0 (32KB) + L1i L#0 (32KB) + PU L#0 (P#0)
      L1d L#1 (32KB) + L1i L#1 (32KB) + PU L#1 (P#1)

After this change, it correctly identifies two cores:
Machine (7231MB total)
  Package L#0
    NUMANode L#0 (P#0 7231MB)
    L2 L#0 (2048KB)
      L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
      L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)

Signed-off-by: Jonas Hahnfeld <hahnjo@hahnjo.de>
Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 69f22f9aad9d..c617a61e26e2 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -17,7 +17,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		U74_0: cpu@0 {
 			compatible = "sifive,u74-mc", "riscv";
 			reg = <0>;
 			d-cache-block-size = <64>;
@@ -42,7 +42,7 @@ cpu0_intc: interrupt-controller {
 			};
 		};
 
-		cpu@1 {
+		U74_1: cpu@1 {
 			compatible = "sifive,u74-mc", "riscv";
 			reg = <1>;
 			d-cache-block-size = <64>;
@@ -66,6 +66,18 @@ cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&U74_0>;
+				};
+
+				core1 {
+					cpu = <&U74_1>;
+				};
+			};
+		};
 	};
 
 	osc_sys: osc_sys {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
