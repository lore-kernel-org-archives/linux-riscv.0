Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC27E7B5E3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixOrBM/hUd8azB9WMl8brziMKBU+Y/ji0lxVkrRS8Nk=; b=pGB1RQq+8TAdle
	4lgBgc9gZQWKNMs9hboGJz0TBZzDYbF+ELK7qTI2fYEyjLCXIvl30BgTmLIYyzaFApukZ4OOiP7ic
	sKsijbSRPXk0/tpb+0Y1iKAwy3oBTCaxMg+NBSnCuWbUFoV8xTYJIEDkYVOH2hV3nEOQsAby+v6fS
	O/UtXZCBrFHxn0SFeTi4AwBEPR6aGehkw7DaE17bauHR52sKmFH76yn5WzUKW4moSUml2iFunEBbv
	p0NqSUJyOT3t9C0VRamNxdTcX6eVjjcfCjWKrjUK0VImuvUUlb6nt6qKgL/d5+D82DIeLT0+kkMRT
	NypYVbSGiLE/B9zk4u4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyM6-00H5uW-1x;
	Wed, 04 Oct 2023 09:39:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyM3-00H5r4-0H
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 09:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 62E0EB81CE0;
	Wed,  4 Oct 2023 09:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5C8C433C9;
	Wed,  4 Oct 2023 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696412378;
	bh=2KYQTHHdlxj8qqNgAA+KrAtJZX+1U+xrdvGAdks0XNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=utRM5di0La3cVCDAD+xziNd9r09uI+BdzTNkawHSEMsjrfMSGfdB9f8RbvFjsQA/C
	 cBi28Tr4ExoqyTA7H2xEFRkAFSRrC9M19/IF3uPaIHOUK7xb0gN8+GAelTJQe8LvLP
	 FsgOzK1tKxXwMKsZZ5XF8SG5hzhW6zWjj7H29K7h53DyvKcwW3oO9KUDPsXey2n7UC
	 UZLgRJuFdx1wQOtURVCRzYnTvBH8OTDyLH/rsFH0m4UoVd25uvp7DgZtfcS7+VmVJQ
	 F+ZM2UC6PGFlrzTeR8gbJ+mR0IKD2Pj96wn758sUIC7ysPapwJP8B1q9pXt8XPJ+Cj
	 FDSHmhO9UmFOQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Date: Wed,  4 Oct 2023 17:27:30 +0800
Message-Id: <20231004092731.1362-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231004092731.1362-1-jszhang@kernel.org>
References: <20231004092731.1362-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_023943_259731_34492110 
X-CRM114-Status: GOOD (  11.77  )
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
---
 .../bindings/pwm/thead,th1520-pwm.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
new file mode 100644
index 000000000000..b9c88f758a39
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
