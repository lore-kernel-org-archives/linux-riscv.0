Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6ADE9370C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyun0EfgmquGh64oYxJLaGIowIpn0gYzl592m6d/m+U=; b=pBE4r/y90NAR4U
	nT0I+jR0vwh+ShLG1qd72BIze6H0tykDPS604LhGRcNwvQEUoCptcoSgiLA6pwSNC/E5qUxQmj+WM
	VwtevyDFgv5PQfzyszRubyEev9BQHtNxMRhIhdhtUwahHDKyDtAeSCxqDomlM7FyzBFplAbLgvFZv
	na+5t6F8r3uBVzQ0iDmgeeJbAhOc2GY6IoN3dUysHnVv4Lt0E2gSmoVwO+PFpOmt5rNWADskvDZ3J
	GRwDuCxzu1dgOvkVCSnF0+RP598/x2OuXSldO9Oy3V2tOLKf4y/W+bUWppPDW7yyQNtfqdLotPOQw
	nPj7+OP6DuFuUBHYYtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoOEd-003Hix-2F;
	Thu, 05 Oct 2023 13:17:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoOEa-003Heg-0E
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 13:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 474D4CE2295;
	Thu,  5 Oct 2023 13:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB11C4AF6B;
	Thu,  5 Oct 2023 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696511860;
	bh=FvFYza5x9SIIDMnc6LuiyfJJi2ON+p3o+hoKtpoSL5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qi5hmaZIDtPlhx2c4ALDQ6HJp7a6DS5QaACOaPvXm9Peip64ktVO7rkq7sY2CqBLH
	 3jhSX7WGpwuu/CeP5gJMMec9URMsQS1vHw+aeLnGPuQMN5OPgiQe7H1/q2Q+FcGCVA
	 tPpIPk780sm0c0ffpNso4bodCzRqQs5DO7KygBy4di0vd8D5FUfdH71YXKpgdSQ2PF
	 l9wNoJRynwa13m9nISzrrenPgZINkDcbosYmPMdpKfuyWIBK37dCoJ0FZyBf8Z3mfZ
	 d8DzQCpSkWnppxRoKJ8+qoJRNkZw2wIXuqT65slTyuz+SpqEeZa4T+TE+R9IKYDYS9
	 jqDcq92N4O8Qw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Date: Thu,  5 Oct 2023 21:05:18 +0800
Message-Id: <20231005130519.3864-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231005130519.3864-1-jszhang@kernel.org>
References: <20231005130519.3864-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_061744_330341_31744CDF 
X-CRM114-Status: GOOD (  11.28  )
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

T-HEAD SoCs such as the TH1520 contain a PWM controller used
to control the LCD backlight, fan and so on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pwm/thead,th1520-pwm.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
new file mode 100644
index 000000000000..e75d8e9f24c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 PWM
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    pwm@ec01c000 {
+        compatible = "thead,th1520-pwm";
+        reg = <0xec01c000 0x1000>;
+        clocks = <&clk 1>;
+        #pwm-cells = <3>;
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
