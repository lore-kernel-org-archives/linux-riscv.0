Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6068FCEBF8C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5i6Tio/5+/21ZVNIJ+Kpt7JbjyIF/A1TixP7GpKlIk=; b=TXvfeOEpXnEqv6
	VnjOqyVq6jGKPcl7ME7LAREm2urgdW6AHNIFUSHJCi9eVCKYJcmOKYyXaPJlkbtGlZS0JcvS10tNp
	m2SksQlANwi2OkpuASsY8UQGx8q7bNdiyxZn+MFrZlsla6ENuj7pAa7SwwVB+yghYEUyjMz+S/BdU
	N3j/69nI+1Z00QgxsHEXYynRtYylNj+XPPXvQ+B4esTdCMCHHTc2MM58LDGETLmdA32/DRYWhy+T5
	BL1OIjg48pA0L/qqKgX+BgeStuyNBxEBRtF0pdm0VN6NiVrnkCbA0/gl/CVBWEzUTlhuQpKZu4AFA
	axuiROruZE9AYv2irf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7UU-0000000Ah6m-0vf8;
	Fri, 27 Sep 2024 09:42:22 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7UP-0000000Ah32-1iol
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 09:42:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240927094216euoutp015443d7a58210da86469b2d7da4bf52da~5EI5352du2889128891euoutp01X
	for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 09:42:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240927094216euoutp015443d7a58210da86469b2d7da4bf52da~5EI5352du2889128891euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727430136;
	bh=GsiL+zmUf4iNfXmNSt/xw4b33PJPFDrzW19XyB8f0w0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUoadWZe4ykswr5ZVkLsj6k+6cznJ7UGiSpN3oTprY4pu5RmIq+t77EJbvOZ2SbiJ
	 0rO4BcBR+cx5PPUdHWIHP0FcqkKvNGMFJt9avKBuiuD2tQny8v48v09t4pSOu15CjO
	 jDr2/BfgASbckws+CDbRHL36VoUBtFN0oKjBjAek=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240927094215eucas1p125b324f17a41eeb81edfcf20d6f7feb0~5EI5gF1UD0416304163eucas1p1W;
	Fri, 27 Sep 2024 09:42:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 89.A4.09620.7FD76F66; Fri, 27
	Sep 2024 10:42:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e~5EI5B6WpO0663506635eucas1p1D;
	Fri, 27 Sep 2024 09:42:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240927094215eusmtrp21d030cf43ea95c59dc8d23087474d527~5EI43dc262852628526eusmtrp2j;
	Fri, 27 Sep 2024 09:42:15 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-99-66f67df76a8f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.33.14621.6FD76F66; Fri, 27
	Sep 2024 10:42:14 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240927094214eusmtip293c23e7ea6fa25482333b480095e795e~5EI4GWvxy3254032540eusmtip2Y;
	Fri, 27 Sep 2024 09:42:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH RFC v2 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
Date: Fri, 27 Sep 2024 11:42:06 +0200
Message-Id: <20240927094207.1650085-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927094207.1650085-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djPc7rfa7+lGbw4p2qx9fcsdos1e88x
	Wcw/co7V4t6lLUwWL/Y2slhcWzGX3eLlrHtsFpd3zWGz2Pa5hc1i7ZG77Bbrv85nsnh5uYfZ
	om0Wv8X/PTvYLVr2T2Fx4Pd48/Ili8fhji/sHjtn3WX32LSqk81j85J6j5a1x5g83u+7yubR
	t2UVo8el5uvsHp83yQVwRXHZpKTmZJalFunbJXBl7GlsZSuYI1sxufs7WwPjFbEuRk4OCQET
	iR3vXjF1MXJxCAmsYJTYcPMuK4TzhVHi2PwrzBDOZ0aJaVPeADnsYC2dMiDNQgLLGSUmLeKC
	KHnDKLGkayc7SIJNwEjiwfL5YINEBN4BFV27DbaCWaCXUWLq3plMIFXCAqESOz8eZQWxWQRU
	Jda/WswCYvMK2Etcu7GIBeI+eYn9B88yg9icAg4Sn5e+YYWoEZQ4OfMJWA0zUE3z1tlgl0oI
	zOaUuPF/NzNEs4vEjAOdULawxKvjW9ghbBmJ/zvnM0HY+RIPtn6CqqmR2NlzHMq2lrhz7hdb
	FyMH0AJNifW79CHCjhJt/4+yg4QlBPgkbrwVhDiBT2LStunMEGFeiY42IYhqNYmpPb1wS8+t
	2Aa11EPi8Ovf7BMYFWcheWYWkmdmIexdwMi8ilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cT
	IzDNnf53/OsOxhWvPuodYmTiYDzEKMHBrCTCa3Xua5oQb0piZVVqUX58UWlOavEhRmkOFiVx
	XtUU+VQhgfTEktTs1NSC1CKYLBMHp1QDE9cUjjTF9ZvyLlzcvXb6wrzOvAp27rOrXks2/Tp4
	9LLI08aayY2vc15e8nPzvtc98f+n/PUn17/K1Vq6M9Yz63i380OTP68/nyp4GOojU3up2TLr
	6rxPx/PuOopvOH7luvs090QvQ+e97Jveu0xatevBb+l5KaG2i7ql/+bbT7Syt5gSW5IftufE
	PVWxit2PjHMLXY9995gi+yEm53hKZ+3y6SbBvtOedewrie+w+rREY6HiBrbZHvMmPbjek5jY
	VJw9Pf/njRWruq5Gvlwa3OBhZ7Pk2Llrn0+Wi5x9JO2jJqu3wOTQtQcilR7rFz88X+GzYUKl
	Yoiu7us/E58erFL4cnHtgmLpNtdHrf8SZ7UpsRRnJBpqMRcVJwIAiK9UN+IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7rfar+lGXQ8tLbY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1s
	UlJzMstSi/TtEvQy9jS2shXMka2Y3P2drYHxilgXIzuHhICJRKdMFyMXh5DAUkaJI/fXsHcx
	cgKFZSSudb9kgbCFJf5c62KDKHrFKLF8/kw2kASbgJHEg+XzWUESIgJ/GCWuP3vDCOIwC0xk
	lLg59z4jSJWwQLDEstn3wcayCKhKrH+1GGwsr4C9xLUbi6BWyEvsP3iWGcTmFHCQ+Lz0DSuI
	LQRU03F0PztEvaDEyZlPwOqZgeqbt85mnsAoMAtJahaS1AJGplWMIqmlxbnpucWGesWJucWl
	eel6yfm5mxiBMbnt2M/NOxjnvfqod4iRiYPxEKMEB7OSCK/Vua9pQrwpiZVVqUX58UWlOanF
	hxhNge6eyCwlmpwPTAp5JfGGZgamhiZmlgamlmbGSuK8bpfPpwkJpCeWpGanphakFsH0MXFw
	SjUwBR2y9nAUfqEqt8ViQkTCzG2Owto1myaefuxd/u5sitHUbI0oZed908wkXMvPGtssdlz4
	+Oia+YYZJ2+GuzS8Kj/rMpuB7YSdtZR5triB7PZortdva7R/riurepNZU7L1ycvD/VcsAxQF
	ZO7e1X6tW37H3FSLoXyNvvLvDZPacl4+cJf1f3Dr1UGrU2aVb8+8sLTcepGpuYb/7jwDmz8H
	Ap6Urf6ksuJa3IGj9ksDpevD5x5uWT310hKbUwEF909N2cD0b+q/BsdKjptL79sl7i9mfuZS
	pS1xsEbkfqhFs89C7UdiD4z4xHWLXkmlS15ld51RXLBFdcuWmzuLLN9uYwmW/ufW+CE3ujV8
	93dnJZbijERDLeai4kQAahoUAFIDAAA=
X-CMS-MailID: 20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e
X-Msg-Generator: CA
X-RootMTR: 20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e
References: <20240927094207.1650085-1-m.wilczynski@samsung.com>
	<CGME20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_024217_824655_9A2D8B60 
X-CRM114-Status: GOOD (  18.57  )
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
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 84 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
new file mode 100644
index 000000000000..b517d0c6eb12
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@ -0,0 +1,84 @@
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
+  thead,icu-cpu-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      CPU ID associated with the Interrupt Controller Unit (ICU). This ID should
+      correspond to a valid CPU core in the system. The value must be between 0
+      and (N - 1), where N is the total number of CPU cores in the SoC.
+    minimum: 0
+    maximum: 3
+
+  '#mbox-cells':
+    const: 2
+    description: |
+      Specifies the number of cells needed to encode the mailbox specifier.
+      The mailbox specifier consists of two cells:
+        - The first cell is the destination CPU ID.
+        - The second cell is the mailbox channel ID.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - thead,icu-cpu-id
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
+        thead,icu-cpu-id = <0>;
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
