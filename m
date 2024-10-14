Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F5D16268
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYEcXiLj1pEAMhS5GeUuYXsGraQywFcKZosmItFHVG0=; b=KER3658QKbAGww
	2A0zsEARKjptwsre+ay6VTvYrnnm8Yexx59ajS+lDvCHaNR2NqY8PvSv1sR2epE8g5kHV0UI7bWeq
	0mxv4uHJRio56dGeRN5KdlWT08SjTe37OLENBq+xBEE6YHoFdABhHnZM/ZpNJKK1kvDDfhssHE1I0
	hJvCDg4I3iq1UWtTaeMQbIZhpB+RCmc9zjlJJussHQqoktGrLuZ36wRY3JrsHMnInaX0kleGmljdx
	RodnB5j5Vd8aeQjLb3LzBMgfrZRw+gw+m2sEkBl6CpOP9sDutGc1nugNmUZfdFUBzsDnewya/+LaV
	Ym7nBBTcWZcW8Rn7xg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LHr-00000005K0S-1LtZ;
	Mon, 14 Oct 2024 13:39:03 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KHC-000000055vu-31Z6
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 12:34:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241014123412euoutp015177210879c941bd7a3b7c137ba6f34f~_Uc37uSIx0197701977euoutp01x
	for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 12:34:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241014123412euoutp015177210879c941bd7a3b7c137ba6f34f~_Uc37uSIx0197701977euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728909252;
	bh=GQU2M2AqVUewYz41HBufJWBvuI7ZTaMH2Z/fRWm2ip0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVdXlJbQWw9vRIJ+0Q8ZtkFqmHUvPWVP/+0itwforjA+/3cLSwu34MFedmL3njuRO
	 1q1DgO3Z6BzkT/YYGoly8xcfz+sW2IjoOrtn4L3fmHtqRuT6/7G3Iv9bdPgfclplwy
	 ex9FagvT/x+sxOo8CTm3vbcTBYFFU7939msYddjk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241014123411eucas1p1aaa9d8228d679dc57f84389090fb5cdc~_Uc3qNO290604306043eucas1p1h;
	Mon, 14 Oct 2024 12:34:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id F6.3D.09624.3CF0D076; Mon, 14
	Oct 2024 13:34:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7~_Uc3OegGg3230732307eucas1p14;
	Mon, 14 Oct 2024 12:34:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241014123411eusmtrp23a9c142f707d90a914143ed56ab0e468~_Uc3Nh0al2056020560eusmtrp2y;
	Mon, 14 Oct 2024 12:34:11 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-40-670d0fc384ee
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 90.31.14621.3CF0D076; Mon, 14
	Oct 2024 13:34:11 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241014123410eusmtip1597de6a30f7aafebf86ad70fc90d6a5f~_Uc2VEeRf0627406274eusmtip1l;
	Mon, 14 Oct 2024 12:34:10 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
Date: Mon, 14 Oct 2024 14:33:13 +0200
Message-Id: <20241014123314.1231517-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014123314.1231517-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRmVeSWpSXmKPExsWy7djPc7qH+XnTDaZ91bbY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i72vt7JbXN41h81i2+cWNou1R+6yW6z/Op/J
	4uXlHmaLtln8Fv/37GC3aNk/hcVBwOPNy5csHoc7vrB77Jx1l91j06pONo871/aweWxeUu/R
	svYYk8f7fVfZPPq2rGL0uNR8nd3j8ya5AO4oLpuU1JzMstQifbsEroze/2eZC6bLVryedY2l
	gXGqWBcjJ4eEgInErfMbWboYuTiEBFYwSmzctoUJwvnCKHG44RMzhPOZUaJn8TsWmJaDq58x
	QiSWM0o0nmqGct4wSlx+t4AZpIpNwEjiwfL5rCAJEYF3jBKTrt0GG8wscJRRYsO0p+wgVcIC
	gRLPH88C62ARUJV43HydCcTmFbCX+N99hhlin7zE/oNnwWxOAQeJJQf2sEDUCEqcnPkEzGYG
	qmneOhvsWAmB5ZwS1y5eZYRodpGY9mQFO4QtLPHq+BYoW0bi/875TBB2vsSDrZ+gltVI7Ow5
	DmVbS9w594uti5EDaIGmxPpd+hBhR4k9zRcZQcISAnwSN94KQpzAJzFp23RmiDCvREebEES1
	msTUnl64pedWbINa6iFx6ec15gmMirOQPDMLyTOzEPYuYGRexSieWlqcm55abJiXWq5XnJhb
	XJqXrpecn7uJEZgAT/87/mkH49xXH/UOMTJxMB5ilOBgVhLhfT+VM12INyWxsiq1KD++qDQn
	tfgQozQHi5I4r2qKfKqQQHpiSWp2ampBahFMlomDU6qBqYup+V5Yg87OXyuvXvieOn3axfsh
	s450swgoHm6Z9/3FjuJti0N1Reaul7UzX5SZErtDPo1RSPJiZ6zanqTT6fvCQ2bmqTTqmk7v
	Z8irPrnHNeRDh8yZyTvmeS/a7J96Tr/kUDtfxo+Uh/bnW732K933z+K1n6r9c9W3lp2aHndz
	du2++ob96VYmPa51fdFrm6Svuoh/uxwl9nvimi3ZLEHMzldmJOzvkXadZfT9/v5f5hxLVu8v
	69vvIPeB33et+M+qSmFv/ZmnXm1+PevV6XBOiZdmrx5x2JtrNYVedjYxOqAl29LQ5BH+aNry
	iHXsNa/kpno/kViwTEivzO+5wZqgd5N/+LZydwss8eBrUWIpzkg01GIuKk4EAO7pwoHvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7qH+XnTDS4t4bHY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i72vt7JbXN41h81i2+cWNou1R+6yW6z/Op/J
	4uXlHmaLtln8Fv/37GC3aNk/hcVBwOPNy5csHoc7vrB77Jx1l91j06pONo871/aweWxeUu/R
	svYYk8f7fVfZPPq2rGL0uNR8nd3j8ya5AO4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9
	Q2PzWCsjUyV9O5uU1JzMstQifbsEvYze/2eZC6bLVryedY2lgXGqWBcjJ4eEgInEwdXPGLsY
	uTiEBJYyStxqv8oIkZCRuNb9kgXCFpb4c62LDcQWEnjFKLFhkjmIzSZgJPFg+XxWkGYRgT+M
	EtefvQFrZhY4ySixeLY+iC0s4C8xYW8zK4jNIqAq8bj5OhOIzStgL/G/+wwzxAJ5if0Hz4LZ
	nAIOEksO7GGBWGYv0bnmLRtEvaDEyZlPWCDmy0s0b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PT
	c4sN9YoTc4tL89L1kvNzNzEC43TbsZ+bdzDOe/VR7xAjEwfjIUYJDmYlEd73UznThXhTEiur
	Uovy44tKc1KLDzGaAt09kVlKNDkfmCjySuINzQxMDU3MLA1MLc2MlcR53S6fTxMSSE8sSc1O
	TS1ILYLpY+LglGpg8g77tUqRZ7W/yYpPtldOP1msslB5tkerxpxna0PfRvMozZt/K6TI2oI3
	5g2bd1dL1qkmM/OpKZcZn5SKnN1Vm969dun6rYUs/V7/Gaeb8fOvqDgxNeT+8zmXNDdudZbr
	2MG5eN0Eqa1XuP/9t9u/r8Dp96LqjD8Hbuqkr7zjqX0xJk7H6W3PPpnpcivzkwwUb4uFJIZX
	v125RlTmy9yDEdoTWbrKix83B6Y+2N7lkBfEY+Miv8U5t8yjqlrK/LTMGs60aPEtYffbMg4x
	+jwVYrp17PWlfN95M3+VNLKcy3CcZSav8OPdSvkPHxa45/bPc91/sup+i3+k2omM1JX1iWG1
	0hdm/LnJMKVBNMtSiaU4I9FQi7moOBEApM9lcVwDAAA=
X-CMS-MailID: 20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7
X-Msg-Generator: CA
X-RootMTR: 20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
	<CGME20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_053420_870173_601CDC6C 
X-CRM114-Status: GOOD (  17.66  )
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

Add bindings for the mailbox controller. This work is based on the vendor
kernel. [1]

Link: https://github.com/revyos/thead-kernel.git [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 80 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
new file mode 100644
index 000000000000..12507c426691
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/thead,th1520-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-head TH1520 Mailbox Controller
+
+description:
+  The T-head mailbox controller enables communication and coordination between
+  cores within the SoC by passing messages (e.g., data, status, and control)
+  through mailbox channels. It also allows one core to signal another processor
+  using interrupts via the Interrupt Controller Unit (ICU).
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-mbox
+
+  reg:
+    items:
+      - description: Mailbox local base address
+      - description: Remote ICU 0 base address
+      - description: Remote ICU 1 base address
+      - description: Remote ICU 2 base address
+
+  reg-names:
+    items:
+      - const: local
+      - const: remote-icu0
+      - const: remote-icu1
+      - const: remote-icu2
+
+  interrupts:
+    maxItems: 1
+
+  '#mbox-cells':
+    const: 2
+    description: |
+      Specifies the number of cells needed to encode the mailbox specifier.
+      The mailbox specifier consists of two cells:
+        - Destination CPU ID.
+        - Type, which can be one of the following:
+            - 0:
+                - TX & RX channels share the same channel.
+                - Equipped with 7 info registers to facilitate data sharing.
+                - Supports IRQ for signaling.
+            - 1:
+                - TX & RX operate as doorbell channels.
+                - Does not have dedicated info registers.
+                - Lacks ACK support.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      mailbox@ffffc38000 {
+        compatible = "thead,th1520-mbox";
+        reg = <0xff 0xffc38000 0x0 0x4000>,
+              <0xff 0xffc44000 0x0 0x1000>,
+              <0xff 0xffc4c000 0x0 0x1000>,
+              <0xff 0xffc54000 0x0 0x1000>;
+        reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+        interrupts = <28>;
+        #mbox-cells = <2>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0655c6ba5435..7401c7cb6533 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19951,6 +19951,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/mailbox/mailbox-th1520.c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
