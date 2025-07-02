Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC6DC83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipRexymmW6Xft5wr5JCNwF4X3tT/2z4J5L5YNpkT9yg=; b=R8DYoy5fjJjML0
	ZSW5kyne7We9i+DXXwgbZOln+x85vfcYa4vN5zUMs6uITRP6DTXbp7wBQhPwcksioO6VvIOX7cihq
	Kb9IAcIk/SiVvja3VPeyYGwLt+A8zamG4jMnoZ3bfyJyyW7CL45zdPsCwZbwXgVfa2pjoxvDxopA9
	yHJ+NYVyvl0vSLCO/8rR/vnWVBQXfBxlcwY+xo58Hp8Ad3W0cJw0zsa58X2IzewK/dI5qi4PLrNEb
	kEdI/HHw87ULPzlMMhso+QcXhNuDe2KTMvjh4BM1Cb9tsm8KzdPdKIEP7bjknbkQZF2NwhNmwYo0t
	qZjuM+7bWtTWAn8x49YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyoy-00000008ghC-3VWi;
	Wed, 02 Jul 2025 14:52:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqf-00000008WbA-3fXG
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=468vL6f20bR8cbLJ5mItg8FGJ3SLduAhCDZLfy4Z39o=; b=SictxbGH8D3hAN5+/9sqBdUPdp
	d1FC+R+4r8Uxo0PgJ3227bv/IefB7JdiQlf82O5/wA023P6EQ8FFQIVu4HXJIDDb1w8MmmfC+NGPe
	+0I+kXXuJS+EmfbgC+Li8CzK/TsCJPBJsw6Zr3tJx1VMN15mup6URkqrxxrxSJfTkPZUi+xf4CKaA
	Qqj0gNdyUSum5oPIlFiq/jhrGcV6dwMLifyWpM1qvKQMLp4oSCuS/b6KUK/99XrpOfr1TqpNL/qNv
	xirud/1IlXbfw/w9QQiV755nfYjJ0TLtZXIrjRllw2W3lzZe0ckPwXzOS9qAA91oal2jgNVhBbQQx
	/Km8C42g==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqc-00000007Qbo-2r3Z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:50:04 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250702135002euoutp02dfbe63ed12b720b25c8966aed921c257~Oc2mCWu-z2739127391euoutp02C
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:50:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250702135002euoutp02dfbe63ed12b720b25c8966aed921c257~Oc2mCWu-z2739127391euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751464202;
	bh=468vL6f20bR8cbLJ5mItg8FGJ3SLduAhCDZLfy4Z39o=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=C0+Qr+mqf4k8gIstTe1+bzV1gTsP1a02tFAmBwCf5t2bHBcl4mLn3/ac3rrkMlUeU
	 /ybHzCbksqWeXnoHdJMnxPDC4GMbLjZyr6TZEmKmuwjqMy2WmnG88istB5Oqvwvb2k
	 JYm35Zfa8iQBccND6DJz385xTApB5RppJLLK0C/0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702135001eucas1p299eaebac8b9af1efa56184dcdfcfde37~Oc2lZC8XW1736217362eucas1p2R;
	Wed,  2 Jul 2025 13:50:01 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702135000eusmtip268970b957f85f5c949901625ea804d38~Oc2kQjYhj0658006580eusmtip2a;
	Wed,  2 Jul 2025 13:50:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 02 Jul 2025 15:45:34 +0200
Subject: [PATCH v7 6/8] dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM
 controller
MIME-Version: 1.0
Message-Id: <20250702-rust-next-pwm-working-fan-for-sending-v7-6-67ef39ff1d29@samsung.com>
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>,
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250702135001eucas1p299eaebac8b9af1efa56184dcdfcfde37
X-Msg-Generator: CA
X-RootMTR: 20250702135001eucas1p299eaebac8b9af1efa56184dcdfcfde37
X-EPHeader: CA
X-CMS-RootMailID: 20250702135001eucas1p299eaebac8b9af1efa56184dcdfcfde37
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
	<CGME20250702135001eucas1p299eaebac8b9af1efa56184dcdfcfde37@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_145002_833220_73BD637E 
X-CRM114-Status: GOOD (  13.22  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
index ebbc24f3ef4752cae1b1028939f58f5587074371..6e862b3850462af12c02e88ac0048fdecccd4c83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21502,6 +21502,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
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
