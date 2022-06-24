Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963CDC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IfxYE86xN66Fg7lIuAWZil/R6CraD3DQ3rLhjxs9j54=; b=SvuWx8CQ7072GK
	s00hMh+jEwmfK2cXAzXixqYnNQPZWNLIUjoZH/Qa+esqbdRKXMEB2NUpvwnmkJKrjXyl/HFNyrWno
	YBxQQH7EQlg0TkLuPlRCOY4ZRTa1nmz1WOc51JuP/e++kPWQB7UabPCGviR+Vw4bm2upqtHaOxfaW
	eb5eOqLyNrYvInEfLWhbvcAfp+ydCp8sVtGAbv+b6LDZ6ZH540kxFFjROQJQuh0SsUpr91vPgQf4Z
	4hf86ARMcc0qtFEDkrIQ2CZ8mTToVdfcZqWpHdBt3Yw1E3H6GAn/a5dXIKWwnJswGXYseSzv4PV0u
	PbKhnukhfXxrVV/ZeuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mn8-0038Iq-7y; Fri, 24 Jun 2022 17:08:22 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mn5-0038FP-SX
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 17:08:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id q6so5885975eji.13
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 10:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3kbilczJ8RqirddUQQRugRdMnYuaeBC6YottAZodwA=;
        b=HRBaG764wephebWOC8/49MIYVztpToSxXeB0QsyV22rOgy8GG7+IV6JbhsDyVBO8Gv
         fxdW2KYjaM16uOxKmVZSOuAJAKR/kFTEs02n7ITm9uXnV10YRgVgu9jfruDqQiarOpft
         fxeakHN0/TAdKp1Qml2w6Gd0Szlu+Ln1r9h1el/0hvvNw7PblN2PimBFJPmH9TzJ+AXp
         lsywsu8YIyLROyBxAZPk0rjDc1yc7bTet143kWB634CeJ7brnl+opM0bkpYwWfF9p/ra
         PHvm2mrFQm+eR3dnUFyfvTbOKITIJdV47k4+pjsbbk/qAhDoowIx0Z3+JOFbDRAlgyq4
         Q4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3kbilczJ8RqirddUQQRugRdMnYuaeBC6YottAZodwA=;
        b=iaT3/3grJzlGxR2+afAoRhUBdpV5iEaU4YnmMALbKz8Uq9u01DT4svL4JN0V3g5dRh
         KcsABE0TFDBBwy71jlRxgzBjcal62mOWknq2FzXZhBIqMWJhdhsk2kp3j7vaeDQKVyCY
         X/AcOq2bhXXcnc49drLNktAEgEjdoiZjH3Re92QLPw3w4zl5JMfpGTxBwLGki6+Jlaf+
         EeddgR6xopH3+RzmZhtqwwehxVe4pavaAJlU9vj66GvBtMCkW2p8mhoCHo/uGAsHKDzE
         3YjopJyFJ8lPwo/73j/lyMr9OetgwEx1P7ERfXMUmayEgOZNMnKqryU0nEMmTAn3g5SZ
         Y/7g==
X-Gm-Message-State: AJIora8BCkGJ0zRuDqhxvKE/y686JlUjbxCzFnon300a5+rkvD15vcAA
	79Po9c+zafRQE+8E7jzOFSjpcQ==
X-Google-Smtp-Source: AGRyM1uof2YdzllXeIBAMDcOip+DoGmlHYw/RrLhxqqbIl9BLXRgli7t/mzBKTyj/GlSUCJJRAzFSQ==
X-Received: by 2002:a17:907:9727:b0:6fe:d943:312f with SMTP id jg39-20020a170907972700b006fed943312fmr14178971ejc.263.1656090496153;
        Fri, 24 Jun 2022 10:08:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906251800b007262a1c8d20sm1433742ejb.19.2022.06.24.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:08:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: align gpio-key node names with dtschema
Date: Fri, 24 Jun 2022 19:08:11 +0200
Message-Id: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_100819_994853_2BE1B16C 
X-CRM114-Status: UNSURE (   9.61  )
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

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 6 +++---
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 039b92abf046..f72540bd14a3 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -35,7 +35,7 @@ led1 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		key0 {
+		key {
 			label = "KEY0";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index b9e30df127fe..8abdbe26a1d0 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -47,7 +47,7 @@ led2 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		boot {
+		key-boot {
 			label = "BOOT";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index 8d23401b0bbb..3c6df1ecf76f 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -52,7 +52,7 @@ led2 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		boot {
+		key-boot {
 			label = "BOOT";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index 24fd83b43d9d..03c9843d503e 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -46,19 +46,19 @@ led2 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		up {
+		key-up {
 			label = "UP";
 			linux,code = <BTN_1>;
 			gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
 		};
 
-		press {
+		key-press {
 			label = "PRESS";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
 		};
 
-		down {
+		key-down {
 			label = "DOWN";
 			linux,code = <BTN_2>;
 			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index 25341f38292a..7164ad063178 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -23,7 +23,7 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		boot {
+		key-boot {
 			label = "BOOT";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
