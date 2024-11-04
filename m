Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4538D132A2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsJqN9fMlMi2DEt8DVaAzjXNjcXsqLxfgKJRcMpXv9Q=; b=466SQ1wd1YjzBF
	0GP+DHj1EjFmwoaOF23+xHRF7DcAUQyiI8VZ2iScoGj1oTvZk0FL4rBsJZMvK9/hOpzUEOPWb1UwT
	97rbmpSQP6k6tmtCqbPJDA3kYlYn7IFfwnHSZKJX3t8qlWO2r/0LIAUJL1YH2HD0CYNSJTiiNly8L
	B8jiI7KjBlZgtHg4C3W+fWocwkhJxh4Q85D3y00MT4sezJTDQ7kiR0uE6P8xe5lfkS4GGaax2194k
	Bao6y4dvSkvMCX8/Eh0jYsJCqPezQ1FXdj0mL7cQDvyZhl1MZLw5HhLkFoJm89igxaOdfg5KZl7Vo
	4y9Pha3CUiW+mi/7PnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u6p-0000000DHfp-3FC4;
	Mon, 04 Nov 2024 10:14:55 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u0B-0000000DGCP-0UIS
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 10:08:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241104100801euoutp02cffa58bd16885428d295e7336a845377~EvAPrTBnh0806908069euoutp02B
	for <linux-riscv@lists.infradead.org>; Mon,  4 Nov 2024 10:08:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241104100801euoutp02cffa58bd16885428d295e7336a845377~EvAPrTBnh0806908069euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730714881;
	bh=bcy6XB4drLGQ91Hj3yeaQos3MgyWXtw63xNApEC7seA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cd5q0plcFNueqgll65yN1X41XmRyeQAVfB4EQeUV/VRE8YsPVSN3wSvPMv5CZJ8Ro
	 n9WGotm5e5dDDIFB10htm2E2V7PrIX7HN6LcL49O5R6PLqcgQy59rwpVgCFJdNz4Sm
	 nR6GD1wnAaBVXjNWdridveS9jQcYpcYGahFU0ffE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241104100801eucas1p228850508ca975c83127874328480e33a~EvAPHVMcj2552025520eucas1p2t;
	Mon,  4 Nov 2024 10:08:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 9C.44.20409.10D98276; Mon,  4
	Nov 2024 10:08:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241104100800eucas1p15817779e9a030e74878ae39a8a99dc1e~EvAOk-rnJ0077600776eucas1p1w;
	Mon,  4 Nov 2024 10:08:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241104100800eusmtrp1a693bfb6447a4259f8f128f1f450da8a~EvAOi4Qfm1037510375eusmtrp1r;
	Mon,  4 Nov 2024 10:08:00 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-a5-67289d01873b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 90.B7.19654.00D98276; Mon,  4
	Nov 2024 10:08:00 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241104100759eusmtip1149b48b0b8703dbe2267e639cd63e107~EvANmYUNa2283322833eusmtip1t;
	Mon,  4 Nov 2024 10:07:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com, samuel.holland@sifive.com,
	emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, christophe.jaillet@wanadoo.fr, Michal Wilczynski
	<m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
Date: Mon,  4 Nov 2024 11:07:33 +0100
Message-Id: <20241104100734.1276116-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104100734.1276116-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbZRjG/c45nHMKdju0kH7BhSnJ2CVS2LLEL+JlmqlHTZbhDTKd2oyT
	snBdy2UuJuugdoyVCngbnVC2LLQyGgycditXW7ahqx61BXQbXdAKobCLg8IYRpRy6tx/z/u+
	v+d73jf5aFwWjkmi9xeVcpoiVUEKGUs4L90T0kDTJnVG6y0JcvxlppDD3RSD2vsEDFkuCDHo
	uo/HkO+YDaCpviMEGrU1UShkvk6ivhkHhfzdX5LIOacnkf1CgEId8xYMhfxGHBnMa9E/vecp
	dFYYJpB+4FNih5w162pJ9kYoRLCD1WGKdZkDFNvZdoxkx0Z7SbbrzGFWb7+Esbf7R0jWxLcB
	1lf1C8XOdSazc4GOmN3SPbFP5XIF+8s5Tfoz78fm3fmznio5m3zw3IgH1wGnogZIaMhsh4P2
	u3gNiKVljA3Ahsp6SizCAB6fXMDEYg5Ab9iD37c0TgFxYAWwLeCPWm4AON99BItQJLMNjlst
	MZFBAtOBwcme1lUKZyYBrK13kRFKzmTBEef8qoNgNkCDkSciWso8CxcrL1Ni3no44P5hNVvC
	7IBLtWFMZOLhd41/rPL4ClPlOBndT5DA6sGDot4Jbd/MRt+Rw+khPqrXQe8nRkLUxXDcMRv1
	fghdxqGozoRjwtLKnvTK+5thR3e62H4OBlzzRKQNmTXw15vx4gZrYIPzC1xsS2G1QSbSqfAz
	Y+39UMHmxETNwtPGj7A68Jj5gVvMD9xi/j+3BeBtQMGVaQvVnHZbEVeh1KoKtWVFauW+4sJO
	sPIxvctD4fPAOn1H6QEYDTwA0nhKgrSZ26iWSXNVHxziNMXvacoKOK0HPEITKQrphtz1nIxR
	q0q5fI4r4TT/TTFakqTDXijMT+6femkh46uhm/7mRmnOpp0DidYrtyTe72efWJ5Z1Kf51+21
	/2xpj3PWXHtduzDsOGV/k9YpW952ed+aFo5ule7ufdHyWkv98JmZpJqHf+/qn7hnTs9JHK9Q
	vvtOpV1uP9Fz0R8M/jh26pDnt2n95yMJpVvC7qnQxqcPZObwa3d9XSzPrstt2FP++MtxD6Vl
	Zl8JBk1vVPQMkjOeVl/wYjN/rq4nXHnUOpr9k/PuiRJ5uanKdlvh78x+tMR0+up2Pis/8W96
	wjm8nLrPWvdt194nrx3g5anxPosrfSmoaDh8Ge+deGWzLu5VQ3L78eeFPIHn3XkZ7qtNJoLJ
	+tiwmEJo81Rbt+Aarepf0D1R2gcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oMczXSDTZ2Klhs/T2L3WLrwbms
	Fmv2nmOymH/kHKvFvUtbmCwuda5gtHixt5HF4tqKuewWL2fdY7PY+3oru8XlXXPYLLZ9bmGz
	WHvkLrvF+q/zmSxeXu5htmibxW/xf88OdovV566wWLTsn8LiIOwxq6GXzePNy5csHoc7vrB7
	7Jx1l91j06pONo871/aweWxeUu/RsvYYk8f7fVfZPPq2rGL0uNR8nd3j8yY5j89317MG8Ebp
	2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZXz8MJG9
	YLVcxfarh5gbGLeJdzFyckgImEgcnvmCsYuRi0NIYCmjxKK1b9kgEjIS17pfskDYwhJ/rnWx
	QRS9YpSYueAEWBGbgJHEg+XzWUFsEYH9TBKvzxaBFDGDFF3YdRasW1jAX+LpoyvsIDaLgKpE
	W88WsDivgL3Ej6ZT7BAb5CX2HzzLDGJzCjhI/Or9wgRiCwHVHDywhxGiXlDi5MwnYL3MQPXN
	W2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA2N527OeWHYwrX33U
	O8TIxMF4iFGCg1lJhHdeqnq6EG9KYmVValF+fFFpTmrxIUZToLsnMkuJJucDk0teSbyhmYGp
	oYmZpYGppZmxkjgv25XzaUIC6YklqdmpqQWpRTB9TBycUg1MxuufLW86/Wi7x1+Htabidooe
	CqkVV955qV1s+r5o1xPV+7rTJxxv2dvySfhl/vt/FSeurGo6f1TpzISpSoV3Tl9RdXQXn2X3
	7/60TOHMlCN7Ps+csmfO7eBXS3NNa3b23fH22X95qfITRxPZWBkZLh6p5d6804KdI4MSj+62
	8Nynca54HqN6/cIrQdPYZu8Leyi4K2QrT87OiSFqF1Z93qo+7bf9b/lbr9hMdxv8i1JaFKpx
	JO3kCc33Za0PI1f135ZeNPFPV+9zhylTzI7O28d26EPiLsb/BwtshFZ/WtG9eNoi0Vc2Z/Km
	qbMucN7TrRRo3CBs/HTzKtc13Kv9r3ueutuWcW72Ow47iz9H3C2VWIozEg21mIuKEwHjvF0L
	dgMAAA==
X-CMS-MailID: 20241104100800eucas1p15817779e9a030e74878ae39a8a99dc1e
X-Msg-Generator: CA
X-RootMTR: 20241104100800eucas1p15817779e9a030e74878ae39a8a99dc1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241104100800eucas1p15817779e9a030e74878ae39a8a99dc1e
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
	<CGME20241104100800eucas1p15817779e9a030e74878ae39a8a99dc1e@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020803_506989_0B1EBD2F 
X-CRM114-Status: GOOD (  16.72  )
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
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 89 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
new file mode 100644
index 000000000000..0971fb97896e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@ -0,0 +1,89 @@
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
+  clocks:
+    items:
+      - description: Clock for the local mailbox
+      - description: Clock for remote ICU 0
+      - description: Clock for remote ICU 1
+      - description: Clock for remote ICU 2
+
+  clock-names:
+    items:
+      - const: clk-local
+      - const: clk-remote-icu0
+      - const: clk-remote-icu1
+      - const: clk-remote-icu2
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
+    const: 1
+    description:
+      The one and only cell describes destination CPU ID.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - reg-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
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
+        clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
+                 <&clk CLK_MBOX3>;
+        clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+                      "clk-remote-icu2";
+        interrupts = <28>;
+        #mbox-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index df36684221ff..506cdea74694 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19816,6 +19816,7 @@ L:	linux-riscv@lists.infradead.org
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
