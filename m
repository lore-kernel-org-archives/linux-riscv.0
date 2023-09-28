Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B3CE7AFC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fax6rc7zEABQaSHtEjVO/WFR+1mHZub1DMZ7LxtBA0k=; b=UBxWeUcAQrbB+8
	93mOpI1pAI+q+Sl4yOaURT7HOCg2lKhBRFBCLC8IlhEdqIDUw+eA011lMpIVz8Pbg0pfJDnghdf2J
	v2BV5Y1nn4H4BBEYWFkKh3n4cxdGIuuZ5HulKdu4UqximfTXaDUR89QEF8d2nlZihhoO8zmt/iDnG
	4i13jixiCOWBCGRJnvGhgIKG8TBxknO6fHxJ1gKue+/cmiJeHKapzsfSC3ZS/GLFwQJQg0ppGdmtD
	mQR5C3la8UcKKlEDhivvl+o0GEUFvqBnz33mSmxAyR3EnvicxI71Ae/OmiSCu9/IoXaI9cW9NzqY8
	yoj1xzpRxfrW01B3dpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlubV-006PFV-1v;
	Thu, 28 Sep 2023 17:15:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlubR-006PCz-1o
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 17:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 703D7B81DC3;
	Thu, 28 Sep 2023 17:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81242C433D9;
	Thu, 28 Sep 2023 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695921300;
	bh=kPaMMTfGtPFnEBE78lki4GvEmVbGnWmgp2jahe8ssow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRIO/tqPvZZaLyfasZtL28uvq5784eqAJZHcQYoLpV/QWRMlqYEZPmusgmDFmcur/
	 CySTWyS6IQMcCj1MMI8ET0MKNq9W0t/1YMHDLjBKHWJRjMNHjISuSAItaLEO3rSp14
	 BIPx0K6rTDH87+f6C2DJtRvJ8fOnvuGb97qCl8SaaZDFH9aamtbJ2FQFtK6thH6S55
	 y5G+Yo82NsmELSWy/pWHcVr2+qR+rSZtUeal/kObh9B2z9/UK/L4KvK/OHScqLKKnX
	 kYXsuk3igncpknX7/H46rJALXCnpnD3MWNlSF6QsU1SCCt2T4WZTgA6M8aV1ss1AQS
	 SF9IVmNxLclZQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Date: Fri, 29 Sep 2023 01:02:53 +0800
Message-Id: <20230928170254.413-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230928170254.413-1-jszhang@kernel.org>
References: <20230928170254.413-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_101505_744091_B35D21BB 
X-CRM114-Status: GOOD (  11.65  )
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
among other things to control the LCD backlight, fan and so on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/pwm/pwm-thead.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-thead.yaml

diff --git a/Documentation/devicetree/bindings/pwm/pwm-thead.yaml b/Documentation/devicetree/bindings/pwm/pwm-thead.yaml
new file mode 100644
index 000000000000..8a7cf7129321
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-thead.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/pwm-thead.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD PWM
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
+    const: 2
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
+        #pwm-cells = <2>;
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
