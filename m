Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE24C44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZFpyf9vI4XBJjWRuqEVJgAYpnu1ZprcnroT+Ow71Xc=; b=gSR7LF5cK7TDt1
	L/lpKwjwflU5N2s+TuQTt/WsxPrkKqRxwWxT+DFiTQ5XcRHzuI/Z/csZSpAwUT75sfVdTH9wtneNu
	o45Kn8FsoagQDYTDOLo3NHRsTQXXR/LlV/lHUx6XKJQZrI8hYHihbGu3CcBmdUJzo5+Ch/x4E3yzj
	mKl5lzu5z69dx3G/MeeFI/urfY0F2bRMikZ08ED47JWM3WPY5QXAxjHiyUCmjYcFVSQ3QvisuczyG
	2tBd/u9aPv9aGTRoQTbp+GVGA/5LO2tg62wy8tPLcx4QkXqQEH3ftjgHyDrgC2NSiODOOpy7kOrW7
	rKnTbsnCMaybJSPnJjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpw-00000002WFz-41iy;
	Fri, 17 Jul 2026 14:46:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpt-00000002WBp-0auA
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso8771870b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299604; x=1784904404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10KlgQy9N9MJdDXX/XSsz8Ezi+ZEbWPgqyBT/h/8Ao8=;
        b=a90rEbFDnl6UjnpIXwsNJfpKY0mTs5IGWNRq1NfbI6jNsDRWZPoMJHX1GSOnlR7NO3
         EBgSyuNSNnPdARi/NkQ68gwlWe82NGHxoTh1yXXvHA9sh7qK20BxqeCsfHwhWDrOQ3kB
         ZUPLx8yT3HfkBC7TAZd9npeThcXkQ859khYkV+hHWrhIeyV8aLjTjHW1TO7E8H0Pfdw+
         d1DgyGmbOf30kIcYna13u/AMtlCj7J6p8kmnElJ0gaR1q+GVDArR60mqA/g4pVKjl4Un
         GKjxar9Y9yZCPVcuT0M6Dtv8EeEAF6EEerRezToqdOwYRxTwjV+02MrymYPGSMSmjAyU
         4wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299604; x=1784904404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10KlgQy9N9MJdDXX/XSsz8Ezi+ZEbWPgqyBT/h/8Ao8=;
        b=VLNp8fRTtCB0/ewvurFXn+Q8AgdzkyUr2QcS8WyQk6F1d+dOXdDOXMx6UNtN17mdid
         qY8AwUx8kkcgYTsD39+B4RHA7HiV47guWUdm4oH6wZ+JaQs42QrP/E7wB5UyIqdnd71T
         OX0TeiIc1kGsa8bwOIyqtXDbSQdJpXoL6W/B0ieSHIRCbyU+7Bo78YmtxOYI4Bmcniup
         CWkLzeKJnotvsrJiunFCjYl1axemyWPL1W8NZ1/nLurtuDEGFq57WiPvI5DRuBOZE+k0
         rO5eL0mlLu05AY5WIBAiJMQuNPwRAvnv3lR7uWNGXsQYj35NzWW0VTxsBMcKHZt1G2k9
         Dpvg==
X-Forwarded-Encrypted: i=1; AHgh+RrXC2sduHlnlaD7DdEnGCMw+6kDn/QMOMeHPbFmaxkvkEE5jg+0PYLGU0R46K7mwtCLp07i0Tfjv4ccxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz34ItufnfZZoj7cwynHf/PB721gKLhD04jckflb/s7DnAx7Djt
	I44+FXHterfHyswraeG3xjMo89c2uATM9V7iiCZgVptfG3vJ+sURoGc9
X-Gm-Gg: AfdE7cmE4Tn5xbiZO04dz19M6NZI3MF6lXMGBPFMb29t5M6aDnrytCC+YbgCvgEOos6
	CG1VCHbj3J6iwFEpMx9QGVZbQeItBpwkhtDKOulceGxE1fA5scfgncKQlp1bd/yQ6M2hXaVY91k
	unpG0ZdVtCuNovEbpARJJpWfzScsgycdo2HwwmMd7xZmkTuHf0xPoF3pscSzDfAQWXjQHx4tAkJ
	nT9vMiXy6Sa9h7y+hqoteToH4Vn9fQfF8XMfn8fpAmkYTR0cEAxrTikqcVIeBB99/b5oWZLU+T3
	bnSrjKJMuVmikz7WzqkQtLo2uAwZ3ad4EOf4RJNYkkfU6Vb2mgEUNqsLh4eosliab4D2nsI29Sz
	BtsxhP4jvgRrogEOP5isbQ3SykW5kdqN3pFQ0x/UIH80jBgmGNUFxNnxXBfj/ZsjYVbEDmHs7Gv
	0rzw==
X-Received: by 2002:a05:6a00:a8f:b0:848:4424:2b83 with SMTP id d2e1a72fcca58-84c2954238bmr3024749b3a.77.1784299604142;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:43 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:27 -0700
Subject: [PATCH 3/4] riscv: dts: spacemit: add SPI controllers for K3
MIME-Version: 1.0
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-3-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=YAX4yrYf2N460ZM8PKjQ0E9u10cSDf5RPLDAQ5nktPU=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAzzUWNTaXHChqds5Phn3jjaTnkwxyqfGomF
 onOANxxQJSJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpAMwAKCRDN9pw2gLgN
 2ArQEACQlXLAyc0T7YWC/GlKp300rT+YQAKiyjUXrR3fagaj7UYOhGbbnJtWO+ghcEsN70g4HB7
 YhdRvGfH0TEkn9bSfCto9LINj3OCteLSYyClNXNyct2bV+z8HI9+WEguuVI1CKya9psbziK4x2p
 sq9xUN/mw+D5iAXruA6Z9R4QYSzBebu+6qKSMgfWXIznJRDRZ5DSMq883sYYRxcTaCmAqhqzHaP
 AqCGZ32BpIY8NiXfU2ksdoX10yM5MC6dWwDS9s/3LhteZefD8yjkylTU1M355RdLrdH23fd/XFu
 MHLr+SolRt3ZZPDdJT7P/z97p+QiI/fApiwBL4N/Iy4CrZyel4/cr78I2d6s8cQpCe9xWwqdArr
 vuGT5FA9YW+yAhs3JQOG1/zgi7pWf3sQ1X9MFlGzMC/QX2DpZNOMcaovYa055kVrvhaYlaJ4SRN
 0c+ig7XnB+Sjuyug95atqE3nmEmDcGaknPg+YQDg/aFauhdu/M+MhyDUCiGjlyaD+1Y48oPKTV4
 fq1AIzFOe2c+HwCmpSvXgZfiks//9nD3zs4lmXy400hJTElkxuP1vBtrQJMervvRlSW67csi/8C
 65oFmebChpmj2IRZfhXC+12itoIphkFhsyH0vybr1Bi2s9+WGNG0DENf0j4EKU3dgS1ggKdPE4s
 BqW8Ce04JNqI/GA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074645_233389_496F1B4E 
X-CRM114-Status: UNSURE (   9.59  )
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

Add the SPI controller nodes for K3.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..dc44b5c77d41 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,8 +5,10 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
-#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+
+#include "k3-pdma.h"
 
 /dts-v1/;
 
@@ -927,6 +929,21 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		spi3: spi@d401c000 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd401c000 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI3>,
+				 <&syscon_apbc CLK_APBC_SPI3_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI3>;
+			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP3_RX>, <&pdma K3_PDMA_SSP3_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		pwm8: pwm@d4020000 {
 			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
 			reg = <0x0 0xd4020000 0x0 0x10>;
@@ -1081,6 +1098,36 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		spi0: spi@d4040000 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd4040000 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI0>,
+				 <&syscon_apbc CLK_APBC_SPI0_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI0>;
+			interrupts = <283 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP0_RX>, <&pdma K3_PDMA_SSP0_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi1: spi@d4040800 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd4040800 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI1>,
+				 <&syscon_apbc CLK_APBC_SPI1_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI1>;
+			interrupts = <282 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP1_RX>, <&pdma K3_PDMA_SSP1_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k3-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x10000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
