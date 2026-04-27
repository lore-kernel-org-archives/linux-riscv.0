Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE85FFF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5rIy/9rxXF6A1jU5NqUjixymSdscKHahe/L4v+uETg=; b=aQBfsaC8DKau14
	50FpTRK1Cstz+5qiR05cYmsV8g2763DbwE/Zq2sCQ+7ivTcTgZr+T3Rr9ari8FFvO7TwuqOoBIqYA
	ET7EG0eZKwFJD4EHOoZ0Fh1T7ordRnH1W5VWEAcOqXUkbH2c1OSQsoU1YX4EhZCHQpQ7QzSe/CAf1
	UtpIvJWddQAshRQRWvHJ9JWlg7XG3RD/z2xk5hRID3HCUNGXEMtHDkTEt9rPEPPMwiqAMcAUPt6So
	/w/0hX6hVOtDrV1eTS+Jhc3B5UU6Q+EQz09FSOSBKs2bMoJKBZ/2S+5ZqK0/tP6jaonilGjcnQ5SB
	8Ae5555n2X6vDUn3GPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGCP-0000000GLoX-3RPw;
	Mon, 27 Apr 2026 07:16:09 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGCN-0000000GLnd-42sD
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:16:09 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g3vxK61pwz9tqK;
	Mon, 27 Apr 2026 09:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6ZIoV8NyEqxJxOQGFAZMu0kTEjbJpCkm/yISo2WeSY=;
	b=aQvW6l7mWTbSdvBxLqKa03ir7+okL6YqcYeVhf3cjYrToXjGTVqnKaC69JRWY4aZMiHGgo
	lTADtbFYaRu+j22K8rfMn/EWvnan/R5pmamTpxBTXBHo0hcvWLBrgqaoethHvLQUPR8Iaf
	8Fz1ZlEQqqXkzYlgGFWgjp8IFFU2vf18Ij0V5YP3v2UXBZxTURXqZ2iCvbOsnl5BGPgaqk
	XSM/rGLrtISRZhObaqsiNz7wJB1136Lhk+NoCKDM9CNOazhFQlxQBaVLPA6+xnFU47Wkz/
	L+Fk8EtMz2dzCFYz46FYHXuak0hMy03nblyPD62lBCPgQgtO7YpurPqeB9kDSA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eF3jyJ5V;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6ZIoV8NyEqxJxOQGFAZMu0kTEjbJpCkm/yISo2WeSY=;
	b=eF3jyJ5V0x3FRCE7gbq4vNeywOSfSt2CEuN86+AsB+Hx0GTY1RDn8bsJte5bjTDavX+07n
	iVdI8q0MPC4LKcvpwfe2Mhe96kTypBTIpEFjytTRNDxKZTBXTZxv6QRUk1mTgGzFauUJyd
	e7iSAXpa/gItk51Z6xMcrSl4h6q/FOhEWFmSrzLXALJnG66ENOVtTjoqaJtj4MZ7Uco5+v
	clMejNE9DH5IDluGQBreZ5G3GEOLEaoy+8D9ap4uKlOYj7RDTgxCu6oWlpjFulU8XhtGvn
	/yVYrDpbvd4ams9vGMHi4gk0dYEd2jHGt2rlF3AwFl0WoSBUmo182s80RCWruw==
Date: Mon, 27 Apr 2026 15:15:15 +0800
Subject: [PATCH v5 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal
 sensor
MIME-Version: 1.0
Message-Id: <20260427-k1-thermal-v5-1-df39187480ed@mailbox.org>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
In-Reply-To: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Shuwei Wu <shuwei.wu@mailbox.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777274126; l=2550;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=UUJ+sQlUX0eKGbwjj7s23No22l4ycBNMxqdDXNrNx9E=;
 b=dmeyx6ZIhgdI5BY6CDdaKniHUOVN8OAuWqefmqf1d3SHOBPY0FNFqjlyHOB2LZij01cRhR82m
 Fa4gu0aBFxLBzYeEcxlKysbFAKG8ibyO/CXqkYYBD11RQGpbEzTfH/5
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: de908bd57847811520f
X-MBO-RS-META: uzdnzot9irjhq4qy9r8zxa5gqmy4rwp6
X-Rspamd-Queue-Id: 4g3vxK61pwz9tqK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_001608_160800_DDFDE7A2 
X-CRM114-Status: GOOD (  10.62  )
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

Document the SpacemiT K1 Thermal Sensor, which supports
monitoring temperatures for five zones: soc, package, gpu, cluster0,
and cluster1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

---
Changes in v2:
- Rename binding file to spacemit,k1-tsensor.yaml and update compatible
---
 .../bindings/thermal/spacemit,k1-tsensor.yaml      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml b/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml
new file mode 100644
index 000000000000..6dad76a7dd36
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/spacemit,k1-tsensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 Thermal Sensor
+
+description:
+  The SpacemiT K1 Thermal Sensor monitors the temperature of the SoC
+  using multiple internal sensors (e.g., soc, package, gpu, clusters).
+
+maintainers:
+  - Shuwei Wu <shuwei.wu@mailbox.org>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-tsensor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock for thermal sensor
+      - description: Bus clock for thermal sensor
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset for the thermal sensor
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      The first cell indicates the sensor ID.
+      0 = soc
+      1 = package
+      2 = gpu
+      3 = cluster0
+      4 = cluster1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    thermal@d4018000 {
+        compatible = "spacemit,k1-tsensor";
+        reg = <0xd4018000 0x100>;
+        clocks = <&syscon_apbc CLK_TSEN>,
+                 <&syscon_apbc CLK_TSEN_BUS>;
+        clock-names = "core", "bus";
+        interrupts = <61>;
+        resets = <&syscon_apbc RESET_TSEN>;
+        #thermal-sensor-cells = <1>;
+    };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
