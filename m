Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF8CCFC501
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/m8VUkCtpbzgYn86NkmOwO47f2s1hjIiBPfCkkMaYX8=; b=iGDXwL68dqWS/E
	W/tBSDIVK/k9+lKgHdJLYlQMwKhEvlifNw2/UYR2o0wzdddxxTN3NgP3sA6B3lO8mdg6yH7Se5asD
	oTEmtbrkB2j2u7T3f+eaQtKszt36D+5FBS85vo3YqK3WRdhFnVOME4PQd2kzO+rgPkhkO62eIM6zG
	8q2gML0CT8kUTgo7MRWLsyWYtDkd+L9wDwzNH+svgJywwF+EJSRYf/xQls+DuoBEpwe/IaZmC4Rh/
	zshkr7QKOX1hABNt6GMTqL760fVRZsoiuXxpWpK15YXkIZ/Wg/+6UopHXUvTbjmyGZgxf2yY2c6RU
	m10KAsQMEmiicjgZ4h4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FlI-0000000478Q-2Rue;
	Mon, 14 Oct 2024 07:45:04 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FfC-000000045Xg-2YeF
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 07:38:48 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 73092122FE26;
	Mon, 14 Oct 2024 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891525; bh=lPoc6pym9DSYQLknNxVyoHOgF8wwG7bJWhc07t4BUfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XNBqLfi7Mg3aScFk8JnEbvZBA21HfmeOGJM6Y7VVpBkau4Nhui0v5Ua2g7KT2t02y
	 MVNcJRLyiXuieb6NzLCgivi23CbCY1Dg+e+FWou+Wr05NGsVh03ghJpV62+srEXtcy
	 YzCkE20l18zZ7KZe+G0zvLYOMtzt3PsiR52HBDG6fArE1wJrGdsQ3+mko9tdnDgChj
	 lwMg/uL2YBdvRDfjwE/oadRfc/CQ/fqXsRR46QiEAY1jq0/afUKW0X1UAGI+qwU6/V
	 iZnqWI8//h8XfyFtFohVS8kLBXC7M/0ahs1LvUov4iKHXGb5IkjDIDKtrf7kR1y8O8
	 fVOBrP4+C6EdA==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7A1VF3tOUE2e; Mon, 14 Oct 2024 00:38:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 43A51122FE21;
	Mon, 14 Oct 2024 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891523; bh=lPoc6pym9DSYQLknNxVyoHOgF8wwG7bJWhc07t4BUfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGGDTu8OZMFmxGIKeJkuFmaktpuekIOPExp+WOYDAz88vgV8YsjRJ8UFgUI0Y1zsD
	 9GAZS58elqBBYecsSMI8iL/Aih6VvReW3q9jnb6DO2AyNLwhcNUlGXVxNg0d/XjlPg
	 mYoofXAGXxksWZu9f0sFMvF5xW8JtAg9SseNAbvL7/PREq53RPXrwTD153yKaT3+u+
	 Sv7tv2DRRQR+WwZYVE2tLgNXh1i2/zdTxi4tfPZtf5v9ry8fjGjsuUDxhp9zuPwpoV
	 uvPrWQv+xkfsvsRHXMa4xAWZa06yDwca9rxngnapls3Cp1lLihAa9A/bxr6NIS/ZN3
	 G1OBCpguG8UDg==
From: Haylen Chu <heylenay@4d2.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add Sophgo CV1800 thermal
Date: Mon, 14 Oct 2024 07:38:11 +0000
Message-ID: <20241014073813.23984-2-heylenay@4d2.org>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014073813.23984-1-heylenay@4d2.org>
References: <20241014073813.23984-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_003846_688299_1C6AD572 
X-CRM114-Status: GOOD (  10.61  )
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

Add devicetree binding documentation for thermal sensors integrated in
Sophgo CV1800 SoCs.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 .../thermal/sophgo,cv1800-thermal.yaml        | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
new file mode 100644
index 000000000000..14abeb7a272a
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 on-SoC Thermal Sensor
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+description: Sophgo CV1800 on-SoC thermal sensor
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800-thermal
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  sample-rate-hz:
+    minimum: 1
+    maximum: 1908
+    default: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    thermal-sensor@30e0000 {
+        compatible = "sophgo,cv1800-thermal";
+        reg = <0x30e0000 0x100>;
+        clocks = <&clk CLK_TEMPSEN>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        #thermal-sensor-cells = <0>;
+    };
+...
-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
