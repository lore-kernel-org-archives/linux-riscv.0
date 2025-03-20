Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF8C36005
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeScKZlsnTAsFSpxbMuddpuImFUnEVWbjsrWljdQy7E=; b=Vq4knkik2JZ/dx
	/4Uwbrlng4Bsces46Gedz1Wp8a82vFyLrcb27KNNTBYpj8fzZBqctcbStRhdgvita3S9HD1XCNTsj
	1NUvtLasEsCIRcUEOzw1N8TyRU+udJo+yoNBLd1j7HPOxwLViZWMxsWMQk6i3Iy8W5c3tptsQ4DUX
	UihvHldzOwgyhXKyqqBUkkXH7QEKEmZgeTuz8tUPuz5QjIL2CORoOCVJ3/Uk0WXBELpJHKlNKBu6q
	tckJOkzBsx6f2GrAtxuqSP+I0MBsWYI0S19rvm5dzx7or1r5QzZ4PMpC+I01iBGgiRdItS5dk9Aqe
	tf+yUbNlbWo83x07rpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDYE-0000000Bs1h-0UUw;
	Thu, 20 Mar 2025 10:55:02 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDY9-0000000BrxO-1wfm
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 10:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2708; q=dns/txt;
  s=NAESA-Selector1; t=1742468097; x=1774004097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H3wnlGqXSSS/oiZRRPE2KJNofPHwThcoVMkEwdUNQ7I=;
  b=Q2uDmJz2pkVaWcMTjjiPi1FiFTzunse/QANRHrjOIIFXVMzyXbP1OgGs
   oFiukTWMDGSoiK9EXnerkkdwwXF4ylgC3F56d8Bc+4XFk1VaQNLPlNsea
   0/ymjBwd/X0COfkOc4Gue3tDpDHKo15yfbmouqy2ZSFXaKl8oRxBpVVLw
   eroitUkOBfXJCZuhDf2fdw7Ql5tE4KTeyXDV0Yf30MUsRcWAVMcaf5D/2
   x0kj7YsVJygA7pwFDFw+q3ia+pqvJuzq24NM56ZA0AHWdW+zKZDygLw7C
   2iuruPwpQrTWiUhHHew5kxcx9uh7ExxUobwouoXpB9mKTp8tmu5e6ylwl
   A==;
X-CSE-ConnectionGUID: JNpILgqOTVW0rkGPMHwoIg==
X-CSE-MsgGUID: WihiOzVeR26qmgZs1p7IAw==
X-IronPort-AV: E=Sophos;i="6.14,261,1736838000"; 
   d="scan'208";a="80317548"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 20 Mar 2025 04:54:56 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 20 Mar 2025 16:24:49 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility
Date: Thu, 20 Mar 2025 16:24:44 +0530
Message-Id: <20250320105449.2094192-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Mar 2025 10:54:49.0944 (UTC) FILETIME=[80946D80:01DB9986]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_035457_567845_FC433BAD 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pritesh Patel <pritesh.patel@einfochips.com>

This cache controller is also used on the ESWIN EIC7700 SoC.
However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
So add dedicated compatible string for it.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../bindings/cache/sifive,ccache0.yaml        | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..579bacb66f34 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -39,6 +39,7 @@ properties:
           - const: cache
       - items:
           - enum:
+              - eswin,eic7700-l3-cache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
           - const: sifive,ccache0
@@ -55,10 +56,10 @@ properties:
     enum: [2, 3]
 
   cache-sets:
-    enum: [1024, 2048]
+    enum: [1024, 2048, 4096]
 
   cache-size:
-    const: 2097152
+    enum: [2097152, 4194304]
 
   cache-unified: true
 
@@ -89,6 +90,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - eswin,eic7700-l3-cache
               - sifive,fu740-c000-ccache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
@@ -108,6 +110,22 @@ allOf:
             Must contain entries for DirError, DataError and DataFail signals.
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-size:
+          const: 4194304
+
+    else:
+      properties:
+        cache-size:
+          const: 2097152
+
   - if:
       properties:
         compatible:
@@ -122,11 +140,31 @@ allOf:
         cache-sets:
           const: 2048
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mpfs-ccache
+              - sifive,fu540-c000-ccache
+
+    then:
       properties:
         cache-sets:
           const: 1024
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 4096
+
   - if:
       properties:
         compatible:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
