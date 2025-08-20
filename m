Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D8ACA0EFA
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHaP+rN9GH2BlT/1CrQanTjkm8Q7zs82nBU1welp4FY=; b=bZjJfQ+OEQnvg7
	knqkbOoFKq6Lip4p2HeivP7hK4nHHW6U4esJH3zCK7uFxAsAWBZs3WT1AUF8DTVAkA1cqS8Hr1TvA
	pje0ZwJc14INCIWtZSSn6EqeUoscpjg1bPXoIy8uFQaLCK6xXG1obm1dqrXQSoFBCRSEhpwUxxErO
	S6EL7dqfsuF+Fre5uMQGJucsorxxtpj2aEPcFpwxIHXhlkLRV6g3NzbrUpjyjs7A1yjAoGBQKrbM2
	xGGsmn/BtFnzbp23LfSTVjG5zaMLk0FTK3kp6ToC6/z8wSwucHgPVZJ8Eae6H+A1cHuYPEH77jAsC
	Rg1Wt7FmYIANt6JdjMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodWE-0000000CdMy-0j7D;
	Wed, 20 Aug 2025 07:46:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodTW-0000000Cd36-2xdV
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:43:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7265E20CCB;
	Wed, 20 Aug 2025 09:43:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVV4-Maa9Sph; Wed, 20 Aug 2025 09:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755675792; bh=pjGZKvmGxMF/qKgMyngeTm7Z3aNgduzo0JlXz+X9aA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=REX7/w4Kym5QWUu+pglh0MceOIHZE1MgohFpYm7lv00/iHZGJhtFA37tWI07YFLmb
	 bB0/qfYYqrDNGskh96Bb2/2fQppKFTl2xppt4rzLyQEraS8ATJhQierMeg3XU+OEe9
	 nU4PcJq0py7IIzzrEVfJl9DIrTqslRWNI/SYaJMy1riog3QYnMVPI38yWbTvjWWUlp
	 kDS54fxZqQn5vmaQxRH+YIyhATjBVRzY2bYI9rvq9kiSAT3J159wmQUy1SJlUXJKDo
	 gorHC/l2FFK9hRqaQXJ71kKy7kjKxCBVFOA+vbPXfsHDTVY+LKW88aH+05ePGeQEME
	 cpxR4hML4wATQ==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: reset: Scope the compatible to VO subsystem explicitly
Date: Wed, 20 Aug 2025 07:42:43 +0000
Message-ID: <20250820074245.16613-2-ziyao@disroot.org>
In-Reply-To: <20250820074245.16613-1-ziyao@disroot.org>
References: <20250820074245.16613-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_004314_876997_627C32EB 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The reset controller driver for the TH1520 was using the generic
compatible string "thead,th1520-reset". However, the controller
described by this compatible only manages the resets for the Video
Output (VO) subsystem.

Using a generic compatible is confusing as it implies control over all
reset units on the SoC. This could lead to conflicts if support for
other reset controllers on the TH1520 is added in the future like AP.

Let's introduce a new compatible string, "thead,th1520-reset-vo", to
explicitly scope the controller to VO-subsystem. The old one is marked
as deprecated.

Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
Cc: stable@vger.kernel.org
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Co-developed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../bindings/reset/thead,th1520-reset.yaml      | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
index f2e91d0add7a..3930475dcc04 100644
--- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
@@ -15,8 +15,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - thead,th1520-reset
+    oneOf:
+      - enum:
+          - thead,th1520-reset-vo
+      - const: thead,th1520-reset
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -33,12 +36,8 @@ additionalProperties: false
 
 examples:
   - |
-    soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
-      rst: reset-controller@ffef528000 {
-        compatible = "thead,th1520-reset";
-        reg = <0xff 0xef528000 0x0 0x1000>;
+    reset-controller@ffef528000 {
+        compatible = "thead,th1520-reset-vo";
+        reg = <0xef528000 0x1000>;
         #reset-cells = <1>;
-      };
     };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
