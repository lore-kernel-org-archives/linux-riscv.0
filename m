Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF316C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEpIQg5KBSVQiNNvXey4u3kz/3gQKLXqQRfMz1TCMjc=; b=grUGEtbufsjoPq
	Se2HJ588IyF73l2npUzuOatMikUBn91JsGvZ7xI43Bfdqyn+pylbzOZTF4bhaWTIiTwIeFBdRLwJ/
	eMsIErP4jJyo04EtIf0wS0Sppu7+hD3clXVuOXOiQroJp9fbrDS9+LsqmuivtktzGbt04ilype5eb
	dZBGYIT+IFklCH5wY2eZjJcKvIqYZoMrRqWj2HyaZIQa1+WyzneAZCeWreIt3uyT6gliHIGSmK61W
	FlCQzkf9Ced4qmjnnznNgAsQ1zVHb7/NiKuNvWgbtOyi6wfxxsmIrN9y4kjRzCgY71269VXP88EIR
	3DM9GCtQq3+8ccAgcPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7P-0000000Ashe-0iAD;
	Thu, 27 Jun 2024 15:33:03 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7M-0000000AsgK-0Mcx
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:33:01 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:19 +0000
Subject: [PATCH v2 05/10] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-5-cc06c7555f07@gentoo.org>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
In-Reply-To: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Sd2cefvtLvue4VbNU8TlhgwBKtDTSAfC6Dit7xBpOS8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXtHABiNrlEMZ8H8PALGClDGbpzYcf5kjII5
 gjtZqMg91GJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F7V8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277cTRD/wL9cUA+WtRnqxAtx
 pPkcr0X7+bD8Vm/RB6GWmre4+/fQQjJvnxmwXjgIdPdMZmbY6ZmvXZxX93QiuOp2prCvNZkn7T8
 nZaDWvscXO0pjnGTWOeDpIWx0PZA5ZEkgBP5NW/PL9TVPvFydVF8kQ52Y4Xpm/sp3mEvNWhg7id
 uaXN+sdt7FTL57nEpx79gqWh1N951Mn7q7YsV/Y+f0pOdhrO/AJCnqU60+z6eYyiTbRWA8weq58
 1hduSuS3p6I6RxhjL1WSW1NPkhGhOQyUQhw/5ZbfCdfA2BBfHv4txaXerbZu1qev1E8fiyHMqN0
 aR5iGUUaNhhNJEAeiRmhmIIBtBBvVBuQHpbD+Z8T49ljE76LPsg+BwSyPLgoI94zLuyOLdTXtV/
 uoyYgFTRXvCXo2WxTtXEHDEssgbLdlpZOszXc+lLcvwb2nc0jeuFYUe9cH+3pYg6fwRRsn7fSrt
 pKKIDtgUe0BG3y4BYINqUziWdt72MWRJZoRszv9ozTmA3wBnS8Szeg3IxgO9dXRH4YS6RL8I32T
 KRh90JCOmJakUjp7KFf+pKACEPjyWiHEEw3BK5NHUgqLkDe4lrdlfXWy/45rTYarHbjaP8ThlY1
 p7ymVah3Qz5a27uqqA7h0ysWeGcq2ysI8NpsIfDBEvA5nmLX/r08zQDpg6xVtfVjE8hg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083300_190874_31BA1F26 
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

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276bd..3d0426b569042 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - sifive,fu540-c000-plic
+              - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
           - const: sifive,plic-1.0.0
@@ -71,7 +72,9 @@ properties:
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-          - const: sifive,plic-1.0.0
+          - enum:
+              - sifive,plic-1.0.0
+              - spacemit,k1-plic
           - const: riscv,plic0
         deprecated: true
         description: For the QEMU virt machine only

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
