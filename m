Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4483CEFC39
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBNxp+c4wmUxZ3R66GnVz3YS2MCELTxH7gFjcAIsGJE=; b=WOEWShaYfoJryE
	XZb12eQipEnS5w5x+/fFjZ9MMr983gPIr+qPNsai+p7yADQ8d088rkqoC/Y7nSy1FE/04Sj+TOMZS
	3UxA47S800k736/C4uUI+pEZ8G0UCElClYou+bkdS5dQfKsd5Mj6jSp29ZCAf6wrWzjYlSyHcczyF
	bd32eiUf8EWtRsYqOuxDmyOcPMpsy50ErbZqpfPl5v7TdpWakP7O3q0QZN7lfop8XDwNs9wNqEJeM
	S0Hho3KV3LKyUuyBOnnDzCTNnz5NL1onccOg7fHYiKJm7H40CIM20Rao04Ddh8c6QEjQdEo5LdD/S
	ZNU3X+QBqvrhJ6qrsxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syEOM-00000006iW7-1O0l;
	Tue, 08 Oct 2024 17:53:02 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEKe-00000006htc-0pQu
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 17:49:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241008174910euoutp01f72e39457b88db97609abd79bdb448b2~8i4Kh6wVw3186531865euoutp01J
	for <linux-riscv@lists.infradead.org>; Tue,  8 Oct 2024 17:49:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241008174910euoutp01f72e39457b88db97609abd79bdb448b2~8i4Kh6wVw3186531865euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728409750;
	bh=h38ZzOt+MNeWw22RfON/ofgv8+/U5drLlCfkv9A99U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hm+q9Sb7+dnCF5LBg+f1t0oi/CSLhF6znBqpGzQ9eHPln3IuSyJwAPzFzg+vN7lO9
	 fLUoG2rlsWRgktFZArfU303r345NLPFCpjfbg0RLBCeylG99AknCDBKTOTLQ79wf4C
	 sgk/FFgmw1KD5eZ62uVdl/Z1KacNQGn4LnAS+/J8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241008174909eucas1p2938e7fcbdee372fe9222c89c54a852b3~8i4KHqJeP1811618116eucas1p2n;
	Tue,  8 Oct 2024 17:49:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id B2.43.09620.59075076; Tue,  8
	Oct 2024 18:49:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241008174909eucas1p1b34518ef9a643313d41349f476f0659a~8i4JuKbo21985419854eucas1p15;
	Tue,  8 Oct 2024 17:49:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241008174909eusmtrp277bbe3de3776ed917e75452169c545fa~8i4Jtmz4p3011330113eusmtrp2Y;
	Tue,  8 Oct 2024 17:49:09 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-63-670570950519
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.40.19096.59075076; Tue,  8
	Oct 2024 18:49:09 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241008174908eusmtip29cf97b6fe82c4f2bda706b2320637f45~8i4I7Gn_R3222232222eusmtip2L;
	Tue,  8 Oct 2024 17:49:08 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v3 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
Date: Tue,  8 Oct 2024 19:48:51 +0200
Message-Id: <20241008174852.222374-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008174852.222374-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djPc7pTC1jTDeafVLfY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4orhsUlJzMstSi/TtErgyLj7pZC+4LlMx++4S9gbGG6JdjJwcEgIm
	Ele3r2HqYuTiEBJYwSixqaWLDcL5wiix4+Q8KOczo0Rf/xRWmJY/f7YwgdhCAssZJbruxEAU
	vWGUuN7WywySYBMwkniwfD4rSEJE4B2jxKRrt8GWMAv0MkpM3TsTrF1YIFDi0/+5bCA2i4Cq
	xPxDX8G6eQXsJCZe28YIsU5eYv/Bs2BxTgF7ibe/FkHVCEqcnPmEBcRmBqpp3jqbGWSBhMBs
	ToljD3qgml0kPmz6wQRhC0u8Or6FHcKWkfi/cz5UPF/iwdZPzBB2jcTOnuNQtrXEnXO/gI7j
	AFqgKbF+lz5E2FFi+eYGsLCEAJ/EjbeCECfwSUzaNp0ZIswr0dEmBFGtJjG1pxdu6bkV26CW
	eki8nDyPbQKj4iwkz8xC8swshL0LGJlXMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBKa6
	0/+Of93BuOLVR71DjEwcjIcYJTiYlUR4I9YwpgvxpiRWVqUW5ccXleakFh9ilOZgURLnVU2R
	TxUSSE8sSc1OTS1ILYLJMnFwSjUwBbewJadlOmwIbHOeyD15c+Flrk2vOCbKbhR+4LSo7Ld7
	6vcrM3v+LLr8uFjvQ5uQhoznjtePH2wTvsB7UXndOv6dc+zleA6Jmv1OrG7wXH7UhmXCpLt3
	O7yZpnpo1+lNbggvT7pbZytw9POZpj7RDR9vXJh7mv1l8y0500lPHt6YqSi6fsfFFxNt9VY0
	V/M9kDNK4v08t5MjpO3GnYt9b40/nVRx0untUD+gJ3Bxc6y/TPvLhJuHAlYu1LNxCXkhVGQR
	yL723bV+3ZbJx+Z83fWmQ4tB+smCx6EGSyY8y3ISbH7xbTtP91HeTQd0rbZbrlfd6/u6sFec
	5ffc2HW3X8V1lK49I1j3R9Pi45JVl5VYijMSDbWYi4oTAc/OH27kAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7pTC1jTDdZ1cFls/T2L3WLN3nNM
	FvOPnGO1uHdpC5PFi72NLBbXVsxlt3g56x6bxeVdc9gstn1uYbNYe+Quu8X6r/OZLF5e7mG2
	aJvFb/F/zw52i5b9U1gc+D3evHzJ4nG44wu7x85Zd9k9Nq3qZPPYvKTeo2XtMSaP9/uusnn0
	bVnF6HGp+Tq7x+dNcgFcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2
	Kak5mWWpRfp2CXoZF590shdcl6mYfXcJewPjDdEuRk4OCQETiT9/tjB1MXJxCAksZZRYsbKH
	HSIhI3Gt+yULhC0s8edaFxtE0StGiQOP74El2ASMJB4sn88KkhAR+MMocf3ZG0YQh1lgIqPE
	zbn3GUGqhAX8JTYev8UKYrMIqErMP/SVGcTmFbCTmHhtGyPECnmJ/QfPgsU5Bewl3v5aBGYL
	AdUc2dHHDlEvKHFy5hOwzcxA9c1bZzNPYBSYhSQ1C0lqASPTKkaR1NLi3PTcYiO94sTc4tK8
	dL3k/NxNjMC43Hbs55YdjCtffdQ7xMjEwXiIUYKDWUmEN2INY7oQb0piZVVqUX58UWlOavEh
	RlOguycyS4km5wMTQ15JvKGZgamhiZmlgamlmbGSOC/blfNpQgLpiSWp2ampBalFMH1MHJxS
	DUx7cqVz/MP8b0/gXdqy6b7u+69RcrwqV+oP2C9Lv5q38PJr4axnKu02ooYdzTHb1+3kvDMn
	vd1fIcS3wPjqkshDrAvVvdTevQ3oFrE8pxpd0Pd5xssV14I1va2XLzz89YP79/NTjDdG6nwS
	CV6RoMTsMcdP/tmBLvt/ikzmDIHXU29WzX+pWLM5b9XMmdcMPnB61F0ruS+QMY/ZeXKgosus
	e1rLqkpLlHdOUL9fLnI1SoI59uTkzu0xM3X8WdwKxB5V75CKOO53JPQ554olXJ3+d+WZOn4t
	Xfyr6OxGox+9j/6LnOpOW7f6p9FhG/5co98Lbgj7cS6cx52wL/KyTL25vvG57XK1rjcNWi4l
	6CuxFGckGmoxFxUnAgD187SpVAMAAA==
X-CMS-MailID: 20241008174909eucas1p1b34518ef9a643313d41349f476f0659a
X-Msg-Generator: CA
X-RootMTR: 20241008174909eucas1p1b34518ef9a643313d41349f476f0659a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241008174909eucas1p1b34518ef9a643313d41349f476f0659a
References: <20241008174852.222374-1-m.wilczynski@samsung.com>
	<CGME20241008174909eucas1p1b34518ef9a643313d41349f476f0659a@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_104912_670892_E2020E4B 
X-CRM114-Status: GOOD (  17.86  )
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
---
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 81 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
new file mode 100644
index 000000000000..32c265f39c29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - '#mbox-cells'
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
index df4d7be6cf35..a6028f850a25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19943,6 +19943,7 @@ L:	linux-riscv@lists.infradead.org
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
