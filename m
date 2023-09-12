Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4A3CA0EC8
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlVLxWorDdOPXoPZPUdxEZ4tm83h1NxD7PMpe9OJRS4=; b=ihSOslIxNRr+Fz
	J6pRkLF4zqTrGRZM7a+O75rlcBaWsWcUSfk/yxXmr4smCrbQ5urjTFVmUtzCzPpIkp7BcYmV4k1lS
	9Nsf6Ve9uRyAO/kfIv9Ew9I/GrMuMRmUQ9baN20+NE1y2CVllLHiWfeYaedsQoBwoFVyAQindOIdy
	D278g0exJYVOLTMxxfjsyaO1dZWqS1P2OQ9vW97noVt0SNtKZ5d5AAIlu+qHM4+w2FP5xjpokFwzI
	1e4xHfTWRGVpJxdu3D5VX/SJS9dsbytXIe7mE0ybMm1/EVnhWOr4EagVWHCJcRrl7BclvoTj+kIqJ
	z9yAqILCBqM9KnXh+PoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qftT4-001zKi-28;
	Tue, 12 Sep 2023 02:49:34 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qftSy-001zJ2-0K
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:49:33 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20230912024919epoutp010325efc1511586234bda5b4e22e65a82~EBumFummN0941609416epoutp01C
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 02:49:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20230912024919epoutp010325efc1511586234bda5b4e22e65a82~EBumFummN0941609416epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1694486959;
	bh=pcwXxZ3ZJyENqzSg2Gt/59d3eNX8TmAD5sk0ptGAf5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHgK9DhIDcG/uwoCdaJTD7uIohV4iXs5WfqDg6+kLUKPMOs8+2e4TDVcOPZJUDXCV
	 0QVIXPRFh3TGAf+1pw388aAyA6xN+1zaDEg6xJNx+YWvf7zeRhnZzYr/j08erQku3X
	 oCSbV22L8/KHp1/cRTR4hk4g0BKtWtnCA2XGThk8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20230912024919epcas1p3f51689c295fc4a8e81051d033dd9b795~EBulmUnkW0111901119epcas1p3Z;
	Tue, 12 Sep 2023 02:49:19 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.136]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Rl7Md6cs9z4x9Q4; Tue, 12 Sep
	2023 02:49:17 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	42.91.10163.DA1DFF46; Tue, 12 Sep 2023 11:49:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20230912024917epcas1p4bb4d649f97b592c3245b10b6450d32cf~EBuj0uZhm0730507305epcas1p4g;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230912024917epsmtrp1bb0d0e56c4295b7802ed3dcd37d331f1~EBujz97Bh2900529005epsmtrp1j;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
X-AuditID: b6c32a38-4dbf8700000027b3-eb-64ffd1ad9c74
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	62.A7.08649.DA1DFF46; Tue, 12 Sep 2023 11:49:17 +0900 (KST)
Received: from mediaserver.. (unknown [10.113.111.131]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230912024917epsmtip15b5aa7104165c06080e15d51431293b4~EBujiunKd3056130561epsmtip1J;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
From: k.son@samsung.com
To: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Kwanghoon Son <k.son@samsung.com>
Subject: [PATCH 1/3] dt-bindings: reset: Document th1520 reset control
Date: Tue, 12 Sep 2023 02:49:12 +0000
Message-Id: <20230912024914.3769440-2-k.son@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912024914.3769440-1-k.son@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmvu7ai/9TDDb1GVps/T2L3WLN3nNM
	FvOPnGO1eLG3kcVi0v0JLBbNx9azWfSuucpk0ffiIbPF5V1z2Cy2fW5hs7h77wSLxcvLPcwW
	bbP4LVr3HmG3aNk/hcWB3+PNy5csHoc7vrB7bFrVyeZx59oeNo/NS+o9+v8aeLzfd5XNo2/L
	KkaPS83X2T0+b5IL4IrKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21
	VXLxCdB1y8wBekJJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BaoFecmFtcmpeu
	l5daYmVoYGBkClSYkJ1x5qJuwVzBiv/7tjI3ME7g62Lk5JAQMJGYN3s6YxcjF4eQwA5Gicbn
	l5kgnE9AzpcTUM43Rol5hyaxwbQ8vTGLGSKxl1Hi/JQD7BDOG0aJ35/6mECq2ATEJTqvrQQb
	LCLwn1HizZ9WsFnMAk2MErPbZoDNEhZwk+jauRvMZhFQlbg4/RwziM0rYCGxbOdDVoh98hL7
	D54Fi3MKWErMndLNCFEjKHFy5hMWEJsZqKZ562ywmyQETnBIfG9sZYFodpG4eP4nE4QtLPHq
	+BZ2CFtK4mV/G5SdLXH0416o50okrs9aBLXYWGL/0slAvRxACzQl1u/ShwgrSuz8PZcRYi+f
	xLuvPawgJRICvBIdbUIQprzErc5yiGpRiTNPP0IN95C4tPATNOR6GCWeXfjBOoFRYRaSb2Yh
	+WYWwuIFjMyrGMVSC4pz01OLDQtM4FGcnJ+7iRGcqrUsdjDOfftB7xAjEwfjIUYJDmYlEd6S
	Q39ThHhTEiurUovy44tKc1KLDzGaAsN6IrOUaHI+MFvklcQbmlgamJgZGZtYGJoZKonzHnvV
	myIkkJ5YkpqdmlqQWgTTx8TBKdXAZGup+EzoQVfn4jP3ZprkVSpaXj6dwysa6X3IKkMuIXNh
	us5/3XjPBHazKUtLOjmqT6THbZVf+rMxoXNfpMqn/QJHrG13NUndtZfyY9joIrV/ypn6f8Wd
	yxWZ9pYEBay4/ju9c068zYWdHUtvOPH2m1xYFx19PErjysHtr3dEnc8pSGSdtFEpUqQxWf2l
	1eujT246n5q3cJ/UjEbp3h2Rc31tnpQqn2/gjF7jL5G21yuv7DmnhOS0lhe1it7ffdrPt+ju
	MTvw/7OW6udg2fX7pZ6lcyudWJQl67xP+8SBQ0x82r8EHrulv3z4fubDd9+qPOTsp+RyTIm+
	N+9vIluQ1eYSgfzHx2eGuWcbX49TYinOSDTUYi4qTgQA/xPaHl4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJTnftxf8pBku2Clps/T2L3WLN3nNM
	FvOPnGO1eLG3kcVi0v0JLBbNx9azWfSuucpk0ffiIbPF5V1z2Cy2fW5hs7h77wSLxcvLPcwW
	bbP4LVr3HmG3aNk/hcWB3+PNy5csHoc7vrB7bFrVyeZx59oeNo/NS+o9+v8aeLzfd5XNo2/L
	KkaPS83X2T0+b5IL4IrisklJzcksSy3St0vgyjhzUbdgrmDF/31bmRsYJ/B1MXJySAiYSDy9
	MYu5i5GLQ0hgN6PEtvtPmSESohIdlxsZuxg5gGxhicOHiyFqXjFKNE49yARSwyYgLtF5bSUj
	SEJEoJdJ4sPHJUwgDrNAG6PEiQ9bwSYJC7hJdO3czQZiswioSlycfg4szitgIbFs50NWiG3y
	EvsPngWLcwpYSsyd0s0IYgsB1dz/8JkRol5Q4uTMJywgNjNQffPW2cwTGAVmIUnNQpJawMi0
	ilEytaA4Nz032bDAMC+1XK84Mbe4NC9dLzk/dxMjOKa0NHYw3pv/T+8QIxMH4yFGCQ5mJRHe
	kkN/U4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGs6YnSIkkJ5YkpqdmlqQWgSTZeLglGpg6lkZ
	vXHn9ejd/CdvFeybz6OwOPR5bcgcgcOv3/ey3jj917+0tO9H3ILSghgGbu+WevHn67nvqvlv
	MV87k2uaTURp/dq7v7Nlphcv7XRj7Twfl6n8NX3NWzUL5k7HXbtvLWozDjTbz/vnitrLuWI1
	r7KXix4RDmDg3Z923OTlq6Vyj9unxwpzFEq/v5pW5pnFsValUXGZZMYqpkcW+w7Wdi+5vEd8
	82e/aRXrO+/lyO6ackPVUVur++46d3+T0pofOVba1eEz1OW/Lvmi+ipf0lUz8emysuftxoI7
	BYSsOzZ+v57Ov1y9knmtzdfTT+wzJt2+rKi29Nuv72YSyW7NApPSklS2sPLZPNY4ZqKlxFKc
	kWioxVxUnAgA0hQJYRgDAAA=
X-CMS-MailID: 20230912024917epcas1p4bb4d649f97b592c3245b10b6450d32cf
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230912024917epcas1p4bb4d649f97b592c3245b10b6450d32cf
References: <20230912024914.3769440-1-k.son@samsung.com>
	<CGME20230912024917epcas1p4bb4d649f97b592c3245b10b6450d32cf@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_194928_481629_B0A01273 
X-CRM114-Status: GOOD (  20.84  )
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

From: Kwanghoon Son <k.son@samsung.com>

Add documentation to describe th1520 reset device

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 .../bindings/reset/thead,th1520-reset.yaml    | 47 +++++++++++++++++++
 include/dt-bindings/reset/th1520-reset.h      |  9 ++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 include/dt-bindings/reset/th1520-reset.h

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
new file mode 100644
index 000000000000..6724a9ccdd55
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD th1520 SoC Reset Controller
+
+maintainers:
+  - Kwanghoon Son <k.son@samsung.com>
+
+allOf:
+  - $ref: /schemas/mfd/syscon.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: thead,th1520-reset
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/th1520-reset.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      reset-controller@ffef014000 {
+          compatible = "thead,th1520-reset", "syscon";
+          reg = <0xff 0xef014000 0x0 0x1000>;
+          #reset-cells = <1>;
+      };
+    };
diff --git a/include/dt-bindings/reset/th1520-reset.h b/include/dt-bindings/reset/th1520-reset.h
new file mode 100644
index 000000000000..ec10751814e5
--- /dev/null
+++ b/include/dt-bindings/reset/th1520-reset.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef DT_BINDING_RESET_TH1520_H
+#define DT_BINDING_RESET_TH1520_H
+
+#define TH1520_RESET_WDT0 0
+#define TH1520_RESET_WDT1 1
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
