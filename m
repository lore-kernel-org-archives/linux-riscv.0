Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A675C35FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HM0OiD8nOIyKXHOi8go877ZWuXtVv+DTjB0llz1XccA=; b=abHrHaq3KnPIBS
	8rpnAerEn4aiR4uz5FfXXgVHNf8pqYbRCoUfdmPJaI2Df66VbMXEPLfcAKXZj6942NRBMZ3NbezU/
	Et1jt6vY2gvt+0L+wS6onyCqtpje1PcfFZkVWNX2RbD+KoYk5tXfEKg8ezuqUsoJzwpec6vugvHoA
	8DS4HJwZcfocYHgfAH7/1Rea053sMg/aiz3E2f2HYvlWRqVSSjIrd7WjAWW3NESHywqf773TZLt+P
	PKxswsztYRPiekSSZnm9wsw/qj1GvBnkVvKnPFE6aH08K+81A9PcMu771J3+fda6iBi85mSJZQ4WJ
	LZhBz/8vDZk2+wW/bDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZ1s-00000001zn2-0rpQ;
	Mon, 10 Mar 2025 09:02:32 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZ1k-00000001ziA-0mqQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 09:02:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250310090218euoutp0180480614fef1d56af94c57eb74234f34~rZY1P0glO0780207802euoutp016
	for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 09:02:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250310090218euoutp0180480614fef1d56af94c57eb74234f34~rZY1P0glO0780207802euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741597338;
	bh=QlOPvGKaMPU/idJug/zylqhE7fvuqnxP/B0lxZPddds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CGjpLjrhg8y/z3a9e6bcpvc2VZ89s5gpeJ7R3QXQf3KY9rzj20wotdOokLIb7ziOS
	 wzdLPp0KAJYrEjAAxUgDJ4gmlB5rrUo9NHkxKCX5npCKF27VWvQuHY/qT+0pJtkVwC
	 OphXZiNP0Q0Cjund6vpDgvdWdjrzl6RYAHMxrllI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250310090217eucas1p100fc3752de49bb7a7b1ed0e67e1cf273~rZY0wb_bE2282522825eucas1p1F;
	Mon, 10 Mar 2025 09:02:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 03.86.20409.99AAEC76; Mon, 10
	Mar 2025 09:02:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250310090217eucas1p2051d00809a53d8daca663c8ef8d78dc8~rZY0UoIW22912429124eucas1p2i;
	Mon, 10 Mar 2025 09:02:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250310090217eusmtrp25434d7b666433bb05eb197ed40b200eb~rZY0T27pH2373823738eusmtrp2Z;
	Mon, 10 Mar 2025 09:02:17 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-c5-67ceaa99e909
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.E5.19920.99AAEC76; Mon, 10
	Mar 2025 09:02:17 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250310090216eusmtip224d54353dec5bb0b78398c86006803f3~rZYzQVSZl2674426744eusmtip2b;
	Mon, 10 Mar 2025 09:02:16 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: firmware: thead,th1520: Add support for
 firmware node
Date: Mon, 10 Mar 2025 10:02:07 +0100
Message-Id: <20250310090211.286549-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310090211.286549-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWy7djPc7ozV51LN1iz2Mzi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOz2Pt6K7vF5V1z2Cw+9x5htNj2uYXN
	Yu2Ru+wW67/OZ7J4ebmH2aJtFr/F/z072C2Orw23aNk/hcVB2OPNy5csHoc7vrB73DsxjdVj
	06pONo871/aweWxeUu/RsvYYk8f7fVfZPPq2rGL0uNR8nd3j8ya5AO4oLpuU1JzMstQifbsE
	roxTDUvYC1aJV7ycP5W5gXGJcBcjJ4eEgInE7v/n2bsYuTiEBFYwSvR2b2UESQgJfGGUOLcl
	HiLxmVFi0d8DTDAd++b1s0IkljNKTNjVBdX+hlHiQuNNNpAqNgEjiQfL54NViQj0M0n0HfkP
	5jALPGSUeP2yCcjh4BAWiJG41RAJ0sAioCox6+ljdhCbV8BOYse95VDr5CX2HzzLDGJzCthL
	vNi4iRGiRlDi5MwnLCA2M1BN89bZzCDzJQS2c0pce/uKGaLZReLW1XVQtrDEq+Nb2CFsGYn/
	O+dDLciXeLD1E1RNjcTOnuNQtrXEnXO/2EDuZBbQlFi/Sx8i7Chx718nE0hYQoBP4sZbQYgT
	+CQmbZvODBHmlehoE4KoVpOY2tMLt/Tcim1QSz0k9u25zjqBUXEWkmdmIXlmFsLeBYzMqxjF
	U0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQIT4+l/x7/sYFz+6qPeIUYmDsZDjBIczEoivGrb
	T6UL8aYkVlalFuXHF5XmpBYfYpTmYFES5120vzVdSCA9sSQ1OzW1ILUIJsvEwSnVwNTHcCdm
	e4jPhSfKXptzGa0mMJZtY+76sqzNJGuzwpHr2fYzOeZMiP9p90g9lnu1oknmkx053i/K5U1j
	/11n1O9Yu9iXJSvkxDof/RMX+kq0OpynfQr7G1WbLXrkzqQ7e96eenXu46aU365LuL516i98
	LNDx+Ld/yfuN8SwvTp85duRqcgtfvZ/0FscmCZP+7DWC4p9/esktf6yrszb2vfNtsaMTBdo4
	DYRu/jW6wypSeu9uLMeK6wyLTkrUX2OOVIzLOMClKCNSqPpz4bnFHPOdLCdt4j1RzvH2Ymjd
	6XtuL2uuFX6tXab8a5GJhy3zjMRGp/Zv/RPeb76Y3Lp2p0De1tyz7fUptdGH77ocP6fEUpyR
	aKjFXFScCACf+9n0+wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xe7ozV51LN2g8IGbx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZ7H29ld3i8q45bBafe48wWmz73MJm
	sfbIXXaL9V/nM1m8vNzDbNE2i9/i/54d7BbH14ZbtOyfwuIg7PHm5UsWj8MdX9g97p2Yxuqx
	aVUnm8eda3vYPDYvqfdoWXuMyeP9vqtsHn1bVjF6XGq+zu7xeZNcAHeUnk1RfmlJqkJGfnGJ
	rVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaphiXsBavEK17On8rcwLhE
	uIuRk0NCwERi37x+1i5GLg4hgaWMEg/bl7NBJGQkrnW/ZIGwhSX+XOtigyh6xSix8fpmRpAE
	m4CRxIPl88G6RQQWMklcnbKBGSTBLPCUUWLbDXEQW1ggSmL9jrtMIDaLgKrErKeP2UFsXgE7
	iR33ljNBbJCX2H/wLFgvp4C9xIuNm8AWCIHUdL9jhagXlDg58wkLxHx5ieats5knMArMQpKa
	hSS1gJFpFaNIamlxbnpusaFecWJucWleul5yfu4mRmAUbzv2c/MOxnmvPuodYmTiYDzEKMHB
	rCTCq7b9VLoQb0piZVVqUX58UWlOavEhRlOguycyS4km5wPTSF5JvKGZgamhiZmlgamlmbGS
	OK/b5fNpQgLpiSWp2ampBalFMH1MHJxSDUxht1PXVvDb767p5i9RKqzKOewo9u9AvELoFD/T
	uli9gz+CDKKu28/bJfp32zWFkvNPs63ZuNOTl2hVHPnKdTDVaMPH2zLGdv1WS2tSd1UsWyj8
	z0F+wjeegEkxEcx2Qi+X5dg1+L0Tf5nZfitCa14nv6ilqaTthfJbLV8V+JcWik+e4zfTp3tP
	o1z9svX3d8RfatfnFio7Pzs+lq3a1yN0yZPkmikLz82z7fmc8alT76vgrE/KexulW36eVw1h
	N9syN/i1/3ybvkZuzRveArf2fS+9ZmkVuVVrluwvTaNWw8eWoX3PNt/hqdB+0WBzz3bG1tDD
	j0O/879YPX2F5KGX1axnZd3spJW3z9R7rMRSnJFoqMVcVJwIAC/heFhrAwAA
X-CMS-MailID: 20250310090217eucas1p2051d00809a53d8daca663c8ef8d78dc8
X-Msg-Generator: CA
X-RootMTR: 20250310090217eucas1p2051d00809a53d8daca663c8ef8d78dc8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250310090217eucas1p2051d00809a53d8daca663c8ef8d78dc8
References: <20250310090211.286549-1-m.wilczynski@samsung.com>
	<CGME20250310090217eucas1p2051d00809a53d8daca663c8ef8d78dc8@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_020225_091242_8DF9457D 
X-CRM114-Status: GOOD (  16.63  )
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

The kernel communicates with the E902 core through the mailbox
transport using AON firmware protocol. Add dt-bindings to document it
the dt node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
new file mode 100644
index 000000000000..bbc183200400
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/thead,th1520-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AON (Always-On) Firmware
+
+description: |
+  The Always-On (AON) subsystem in the TH1520 SoC is responsible for managing
+  low-power states, system wakeup events, and power management tasks. It is
+  designed to operate independently in a dedicated power domain, allowing it to
+  remain functional even during the SoC's deep sleep states.
+
+  At the heart of the AON subsystem is the E902, a low-power core that executes
+  firmware responsible for coordinating tasks such as power domain control,
+  clock management, and system wakeup signaling. Communication between the main
+  SoC and the AON subsystem is handled through a mailbox interface, which
+  enables message-based interactions with the AON firmware.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-aon
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: aon
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    aon: aon {
+        compatible = "thead,th1520-aon";
+        mboxes = <&mbox_910t 1>;
+        mbox-names = "aon";
+        #power-domain-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ed7aa6867674..15f4bc618064 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20427,6 +20427,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
