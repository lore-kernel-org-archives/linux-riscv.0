Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1546C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=td6gc8prLkvx/+7e8J36rpceWFoPFDGtvUXa3wjBmas=; b=wN/mtLqcdKa8gZ
	WiaXTuFZGYrVQ1qcBzMsxjp9Q0Pnf5849MAcVarZWisSXKIP18WBak8OQ6wfkjeBSYjiaAsF+wdE+
	YxChvAXp/UgvVjxPPUHA8v3naLHDyN+vtLkEV2knqAxX1NocO78LXlWvtKbtWs5/AytP3fHH0CYm0
	gxdDpXW6hBn8ILfIvpSCE+0strTRNuGvZNL0ELk1s43RizVybG0HHcGbtpcij3MRIea5Dedv0wnPX
	ze2/TJaUOdU5kb41RBsqP7skT/u5LN5yPfmEVL0Vnio7UwTGfqSUA3rklru4z1XZ3Z/J7XWnfPXDJ
	CDQSbX2tKwYUZEvCq8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satsg-0000000FGKQ-38Hr;
	Mon, 05 Aug 2024 09:19:54 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satsd-0000000FGIv-4BDc
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:19:53 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3db1bc36bc2so2553736b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849591; x=1723454391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTqIbxxugoDxIZS+wlCgd6QZms9qOuPLg9XDgZyFHpw=;
        b=LscWM81Bf8icZiFjijDMk/92rK4is0vOp5Ts6xP3Nq6oX70U6Ng7CbtCJ3ovzY1mN/
         RWTQlqFH58GcEGDtg8ZUe2elguzEtQrPYTwX3Ek8G1WoahJNDPB8vb2cnTO9tYsmKLRf
         tgcoriFQoYrfuutfYoqxE1zayvI6jr+XF0CXKSNnB8oZOlWw0CZbahIFIykEbzd9Gizw
         YJI6J9GdsiTqEcw3fr9YLbjIG64LVf+xveLs9hRTG1FPMnG5GgP1Ezn0B2Lb1kHt6yVv
         Aozg0/z9zWA+A4txhO+Kxrrbx/zmSiz7DYY/F0/2k6vNhcNhX5raQlQTqGfhRFhg+iAN
         /4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849591; x=1723454391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTqIbxxugoDxIZS+wlCgd6QZms9qOuPLg9XDgZyFHpw=;
        b=KkQ+1vkkrfFGth/3P7teSGJpfhD7FtupSuV4wnWozb//kTX8OuT8lsrl73C7Lz4zPf
         1dg12a5eEb0hWEE+Q65A/CE2V7xkatwi26oITGUqcGEFuQwcstsKOSTjjEVTb2mFvp4J
         4g+2GhxWllVScEYO5BOtT0dfOIRybYjsuW0Bgg+akzrLHFb5Nzhee6B0DhyVEltG5PLm
         lAjod53a6U/n+c6PZ3ItsatmgXav2C1wqi2kLeQsqSXSZD7RpzUk8xypw5nLqcK8OQAe
         INaoHylGnRblCTVF/QaUDy8eeGfCtaBnH5jrtfN+1lGuIIbBT2s46WcwM6HYxoTedqqU
         JvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfJRgVT/asqoMOYestvu4I1a6YevUSkl8xMQY/1Oq6bPE702/PtkOAUvfSVAUmQeRPYv7w+VOL/SA+ikr/nM4afdO/AngwB2K+j8kltBBT
X-Gm-Message-State: AOJu0YzsOikTqN0DRZPK1a+Mnmxb2R9gkO6CWB9uWSqBeArxZ6cNgBzt
	npqcNu46/HSJlCLSmpnVJLW6eA5qKJicekS+x8zcCP4WcFZ+T1Ap
X-Google-Smtp-Source: AGHT+IGQn28apZPLjY/cEqCd5i6fKpWv0taDd9wpuFCfINNuy5KX2wH7As+1leEZiltafu5WJpLcAA==
X-Received: by 2002:a05:6808:f0a:b0:3d2:95f:da8c with SMTP id 5614622812f47-3db5381638dmr5222260b6e.18.1722849590714;
        Mon, 05 Aug 2024 02:19:50 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a31d9dd1asm2875838a34.9.2024.08.05.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:19:50 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v6 8/8] riscv: sophgo: dts: add mmc controllers for SG2042 SoC
Date: Mon,  5 Aug 2024 17:19:43 +0800
Message-Id: <03ac9ec9c23bbe4c3b30271e76537bdbe5638665.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021952_066709_B429B772 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Chen Wang <unicorn_wang@outlook.com>

SG2042 has two MMC controller, one for emmc, another for sd-card.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 17 +++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 28 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 80cb017974d8..da6596e9192e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -26,6 +26,23 @@ &cgi_dpll1 {
 	clock-frequency = <25000000>;
 };
 
+&emmc {
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&sd {
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 34c802bd3f9b..f0ccefecc9c3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -399,5 +399,33 @@ uart0: serial@7040000000 {
 			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
+
+		emmc: mmc@704002a000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002a000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <134 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_EMMC_100M>,
+				 <&clkgen GATE_CLK_AXI_EMMC>,
+				 <&clkgen GATE_CLK_100K_EMMC>;
+			clock-names = "core",
+				      "bus",
+				      "timer";
+			status = "disabled";
+		};
+
+		sd: mmc@704002b000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002b000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_SD_100M>,
+				 <&clkgen GATE_CLK_AXI_SD>,
+				 <&clkgen GATE_CLK_100K_SD>;
+			clock-names = "core",
+				      "bus",
+				      "timer";
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
