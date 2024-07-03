Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E671EC30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L59dmJxgTiLEzYEaQuSAtluqPXNEdua2kxgwpuCFwDI=; b=X+fPblFO/vedJD
	fRwWch0I0RujPV9B3wh4ZbeNcZfgwNeik3bpcKgvzISu7VSPDJhrx+K54qZCxuSpXh+xvzf70deY0
	fQZ9XXcNTdDqhirFTeDJMDK9SpcinPPTSw9JD7ym5Ovsa4+ceoxR/e+4sAfBCQfIQXWCntzNkhF3+
	KXNhXA0v4ddr1WD9H4SKaXj+0y872a3qMD/jEuMIGzE2QrXODydAPbP51NGfteiTnAbYl2dsS8IG1
	ZSYNoRb2LzPdnXQFQmbRqi6ZQwCA7AppwOxk+lrs99PZXkjBu+5K8j8Rd0aQhGCtO3rfMg/6N0L2j
	9RXDAFGphoVUmIQMFUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Pa-0000000AYgC-2uH5;
	Wed, 03 Jul 2024 14:56:46 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1PX-0000000AYev-2iHj
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:56:45 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:04 +0000
Subject: [PATCH v3 01/11] dt-bindings: vendor-prefixes: add spacemit
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-1-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=S6L+lb2i5tfCPntQqdP469atY/fB6iYa1pxCzasyD14=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWZ35K0BgZRCWeClcEq98CC21zonWvlG1WLyB
 GJMClbdDOuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmd18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TG0D/48WTs5j9KUPRJWCs
 Bihq1piUY6xNskgbDJDzOvBu9S1CTxByFU6R7YnWEw6SQL6gsAuXbOj/FyiqzT9r8KBMlNaqMaJ
 AKbu8D2Tp3xyUB147d0VvfbFki+x2pnFlT772/TE8SSDmImZDbYmhlEDC8n168q/jv3zKOKYany
 ssyvBUJhCdTdazzpmtevhI0+zMtggBUkdz+nF59G5Tkx3+7UUNL5q5CfuiivOJMzGowPtK2rYzG
 g0QsEXRi76ioyMTMdejQMggdmRJtW7gBYa8ZTRvVvM1gCeUykWfSq7dViiuaN+JuZ7uP45uUcgA
 P3pGwhdoVkwwNvNGFWDVySpt9gdO4+SMwPW/OMpHt2g+Y7NhpwE8Xf2T71XfpX2IoE9ezRck0bU
 Syqt7D4cfn3SdJilMgD6GuDwrIUXIi7wddXnJT84otmMAEX9C8kVWy2y9Oma2Cfo02TATsGNwMm
 vgSE5SFmWUjz1/XG5JMkNc2UMk0NDxgYO7JmUkdbC5oWmmACFzwYDMFmuJk4x+QNL0neoLEQuak
 2i+I74J/Y631ASMHmPSPsLOb+wSRDF5treF617rxBxbSM17XF9ZNaIFbzJAuOyCSQdtiIWXMNJc
 AEtVRjC92G5WcGdBdQFHV25dMNpOYA3RwT+zkOdCkJIVXPk9mJFi7uu6Winb918fHEZQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075643_751771_674CA039 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add new vendor strings to dt bindings for SpacemiT K1 SoC.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1a..7ee6e4a89376e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1362,6 +1362,8 @@ patternProperties:
     description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
+  "^spacemit,.*":
+    description: SpacemiT (Hangzhou) Technology Co. Ltd
   "^spansion,.*":
     description: Spansion Inc.
   "^sparkfun,.*":

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
