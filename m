Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E746C71132
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=598y7ez3oR2Ket6MueocVct/PlqcB2xl09zLVgRnK54=; b=Tm+KSEFA8VMRc9
	QsXNDOupggnq03GA9gHrlLGny+9B1Q5qEuUF8O/dKRBJhyQKH3jwFCGz7+z0Mi52xEL4l6RFGG0sI
	wj/HHFcVMI3oGUB1u1dY0STlGaqjSE5mpsQ87fCU2FD3GZ/TbbEgpIMY9BU2Vs80zW32tFbhCC3Vc
	6Xj+rSJU0xoVptLadut9LXElvycQGpuU6HV1J8puwMFOQdFP/zBRmL3dGJ7+DrMw4ewfWpuzSUlRp
	x/WL3MRUOR4r0/AmHUDhWi/4ogYSlzxlXIGATjEfQsRnxkhKZQb4nhlgzT3EkChZjcL+6kxvZ5qWa
	17w8bk7Uj1SBo6uY8gJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0lS-00000007GnT-1hRv;
	Tue, 10 Jun 2025 15:19:50 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyTy-00000006qZX-2aNU
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:53:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250610125336euoutp01a44fb07cb56788c8c33bb8b8f1d5fd22~Hr5DN_UHQ1190211902euoutp01i
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:53:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250610125336euoutp01a44fb07cb56788c8c33bb8b8f1d5fd22~Hr5DN_UHQ1190211902euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749560016;
	bh=U1BFpz8AOqtpZK/c00oYQ7184+LbfCfDBOBEZyhBjmo=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Vp0arjpSECjkGuyFfYsyHv9k46HHqp7GO5TEWqoYOBVF2hfU5egay38O3aelpbi8C
	 CfVz7cf1Uw7lbJi0MsZauu/RyldFHsKjGefTNsWSk8rc96DdmLnHmI1CBDwQNQ7laB
	 F+QabDpeytOY5vhsroB6zf2wMQByZ6f8yqwKZMAo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610125336eucas1p2ea5eaa740364b6db5007e0849465402d~Hr5Cuh2FN2039520395eucas1p26;
	Tue, 10 Jun 2025 12:53:36 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125334eusmtip140b099d5ad8a6eb3335aba01d06715c3~Hr5Bei-mr0192501925eusmtip10;
	Tue, 10 Jun 2025 12:53:34 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 10 Jun 2025 14:52:52 +0200
Subject: [PATCH v2 4/7] dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM
 controller
MIME-Version: 1.0
Message-Id: <20250610-rust-next-pwm-working-fan-for-sending-v2-4-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250610125336eucas1p2ea5eaa740364b6db5007e0849465402d
X-Msg-Generator: CA
X-RootMTR: 20250610125336eucas1p2ea5eaa740364b6db5007e0849465402d
X-EPHeader: CA
X-CMS-RootMailID: 20250610125336eucas1p2ea5eaa740364b6db5007e0849465402d
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125336eucas1p2ea5eaa740364b6db5007e0849465402d@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_055338_943753_89CCD523 
X-CRM114-Status: GOOD (  13.16  )
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

Add the Device Tree binding documentation for the T-HEAD
TH1520 SoC PWM controller.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/pwm/thead,th1520-pwm.yaml  | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..855aec59ac53c430adc849271235686e87b10e6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 PWM controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: thead,th1520-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SoC PWM clock
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      pwm@ffec01c000 {
+          compatible = "thead,th1520-pwm";
+          reg = <0xff 0xec01c000 0x0 0x4000>;
+          clocks = <&clk CLK_PWM>;
+          #pwm-cells = <3>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 966ce515c8bfefdff1975bb716a267435ec0feae..c8a4a2d4f55af213fa6ad2911f972990210ec950 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21311,6 +21311,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
 F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
