Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE46CC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwttQrk/dYSUQdcIWXwwAyT+CkzZis7C8v56LL1b5kQ=; b=SSGR5TQYGlQ2dK
	coX6PL15r6umyDVEgujtubs8RBsbIhoruU20EOKj/jmVDJ7+6nAgJonSWt9FwVbup9x51zVGLdB8g
	OTcEenaiS06zGi+BHCDudpSTTVTbjT+6ZqGGiIfoBeAff5CE+wOuNc5twJW4HqqBLpAxAfd0Ewhld
	mU15FSEK7Xgt6MyKR+pIu2pwJ+lTDcMtFp4TQK8abtt/hHk5TWui0ESF5r3565vX3Z2m0QCzjIWop
	nBhlq+IjOYnPjCW6AWReQYg2pD5lFSD3MW1XsnYlhD//8OLp6Cv1gXY3DClgkGZzXgZucUwwVaCxP
	6HGtHsO6xWp/QhGPjYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Rld-00000006iDF-0DCF;
	Wed, 09 Apr 2025 09:30:45 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RlU-00000006iAz-2eJG
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 09:30:38 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250409093032euoutp01552434616770953823f13aaa86a9e044~0nICwFx-u0513005130euoutp01b
	for <linux-riscv@lists.infradead.org>; Wed,  9 Apr 2025 09:30:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250409093032euoutp01552434616770953823f13aaa86a9e044~0nICwFx-u0513005130euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744191032;
	bh=84CX4mPXzhvt6jZ4xCM8idWzEtVXSfS2MtWhIx9Nzwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bnkei+oOUdKNoH4sf7uyHS5UDX8gUv6gxzUIGBW3XFJqL7U1xzfgTEfB5JPedI58m
	 SHASIwzAO8BhToaqNFhssstWYYyaKQkoz9ANRmPSocnXaSkaWorBmgPoYfrqL66oym
	 OrcpgM8TJle6QaeH9tk8LtuY1C1q7djqwM4s/QZQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250409093031eucas1p2961ba97b62454ce4bb51d6663bcd5428~0nICglOsS0998709987eucas1p2W;
	Wed,  9 Apr 2025 09:30:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 48.4A.20397.73E36F76; Wed,  9
	Apr 2025 10:30:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf~0nIByCFsf1023010230eucas1p2R;
	Wed,  9 Apr 2025 09:30:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250409093031eusmtrp1c091b027f744040d7f056718b50f2a0b~0nIBxXYi_1346513465eusmtrp10;
	Wed,  9 Apr 2025 09:30:31 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-ef-67f63e3727a4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id C4.35.19920.73E36F76; Wed,  9
	Apr 2025 10:30:31 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250409093030eusmtip2d8cd87a82f5916eb2fc3e94379087b87~0nIBHVz3h2948829488eusmtip2F;
	Wed,  9 Apr 2025 09:30:30 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, ulf.hansson@linaro.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v1 1/2] dt-bindings: firmware: thead,th1520: Add clocks and
 resets
Date: Wed,  9 Apr 2025 11:30:24 +0200
Message-Id: <20250409093025.2917087-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409093025.2917087-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7rmdt/SDaZ3mlus2XuOyeLepS1M
	Fi/2NrJYvJx1j83i8q45bBafe48wWmz73MJmsfbIXXaL9V/nM1ncvXeCxeL/nh3sFsfXhlu0
	7J/C4sDrsWlVJ5vHnWt72Dw2L6n3aFl7jMmj/6+Bx/t9V9k8+rasYvT4vEkugCOKyyYlNSez
	LLVI3y6BK+PU2W72ggUiFbM+XWVvYDzE38XIwSEhYCJx9YFHFyMXh5DACkaJ3vn7WbsYOYGc
	L4wSbRv4IRKfGSV2zGtmA0mANHz73M4OkVjOKLHk9TQo5w2jxOPFi9lBqtgEjCQeLJ/PCpIQ
	EdjLKNF56gMziMMs0M0osXbbDVaQ5cICIRJPPvKCNLAIqEqcWXMWbAWvgL3EpVkTWCDWyUvs
	P3iWGcTmFHCQONRzgh2iRlDi5MwnYDXMQDXNW2eDzZcQ+MIhMWHZNyaIZheJeZPuskLYwhKv
	jm9hh7BlJE5P7oFakC/xYOsnZgi7RmJnz3Eo21rizrlfbCB3MgtoSqzfpQ8RdpTofL2JFRJ2
	fBI33gpCnMAnMWnbdGaIMK9ER5sQRLWaxNSeXril51ZsgzrMQ2LDt5esExgVZyF5ZhaSZ2Yh
	7F3AyLyKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMHmd/nf86w7GFa8+6h1iZOJgPMQo
	wcGsJML7duKXdCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8i/a3pgsJpCeWpGanphakFsFkmTg4
	pRqYJL5PlVP4cv2imNf5YObiyza+sTxsxi3CZ/wk1fcJrUlZXXdvrlqrfaRdLGdLQMuz2JS+
	l83e8edf1V7vtrLptDnMxtfGfj/DaPqzjTPiGmr9C1XudRjVFqxnPhI3obHs1v0febrzpgmf
	kbi4pDpeO8vBMtjsJWf9O745/Iu9PNpkmP8rZ/zKTGd0MLp9uzH6hKVBruPdpdskpssKRK54
	p9y6dseNypmGhx9/m9ZcN8er8Pcv26f6RyzF1nJtf1Q7dc8m5xTnwrlCezU3f1edq9Pf+Nt1
	4s2lqrM25jMLqv4JnybW8OprgqRn9OpjXud0f3/59OYyZ9H9n+2hvx5Pie68dJiRr2XLYoZY
	08dKLMUZiYZazEXFiQBQW9lezQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7rmdt/SDRZcYbNYs/cck8W9S1uY
	LF7sbWSxeDnrHpvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wW67/OZ7K4e+8Ei8X/PTvYLY6vDbdo
	2T+FxYHXY9OqTjaPO9f2sHlsXlLv0bL2GJNH/18Dj/f7rrJ59G1ZxejxeZNcAEeUnk1RfmlJ
	qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaps93sBQtEKmZ9
	usrewHiIv4uRk0NCwETi2+d29i5GLg4hgaWMEief/2WGSMhIXOt+yQJhC0v8udbFBlH0ilHi
	yLOljCAJNgEjiQfL57OC2CICJxkl7r6qAyliFuhnlJj68QpYQlggSOLChSNgU1kEVCXOrDnL
	BmLzCthLXJo1AWqDvMT+g2fBajgFHCQO9ZxgB7GFQGrerGGCqBeUODnzCVg9M1B989bZzBMY
	BWYhSc1CklrAyLSKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMNa2Hfu5eQfjvFcf9Q4xMnEw
	HmKU4GBWEuF9O/FLuhBvSmJlVWpRfnxRaU5q8SFGU6C7JzJLiSbnA6M9ryTe0MzA1NDEzNLA
	1NLMWEmc1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkGJi+V5I18Wgbr9x7VnnjP76C24QaFa99T
	Rebdz+fKa3XQW7jd76vGM8XeLSX66zcfil7smzzzw7+lX3fMll1RPftlj+xXmZiwDccaVmWw
	TJ27SFd1143Ppx7fqintKHjLK+M8IfQZw63+DS/Levjn8sdfv3eedy+rZolP658bhXnbIjU+
	5tvclHcrFdWWMvsgd8s/+qUXb2HJyhnsm1ZFiFzdYnHa9503n9yGUsPbK3ovimyWOGRvlNQd
	afVBevnGyTc+L5seor2je7FAcPqxmbOvHcxjXXX6xaKsHJtlRhc0slWqLaWv12jI7+zwqXwQ
	O02Iz3CHro5frun+TJE76QlHrNcvKP7//bDb2YqG70osxRmJhlrMRcWJAPkESq8+AwAA
X-CMS-MailID: 20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf
X-Msg-Generator: CA
X-RootMTR: 20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf
References: <20250409093025.2917087-1-m.wilczynski@samsung.com>
	<CGME20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_023037_246199_1F95C01F 
X-CRM114-Status: GOOD (  12.54  )
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

Prepare for handling GPU clock and reset sequencing through a generic
power domain by adding clock and reset properties to the TH1520 AON
firmware bindings.

The T-HEAD TH1520 GPU requires coordinated management of two clocks
(core and sys) and two resets (GPU and GPU CLKGEN). Due to SoC-specific
requirements, the CLKGEN reset must be carefully managed alongside clock
enables to ensure proper GPU operation, as discussed on the mailing list
[1].

Since the coordination is now handled through a power domain, only the
programmable clocks (core and sys) are exposed. The GPU MEM clock is
ignored, as it is not controllable on the TH1520 SoC.

This approach follows upstream maintainers' recommendations [1] to
avoid SoC-specific details leaking into the GPU driver or clock/reset
frameworks directly.

[1] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/firmware/thead,th1520-aon.yaml   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
index bbc183200400..8075874bcd6b 100644
--- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -25,6 +25,16 @@ properties:
   compatible:
     const: thead,th1520-aon
 
+  clocks:
+    items:
+      - description: GPU core clock
+      - description: GPU sys clock
+
+  clock-names:
+    items:
+      - const: gpu-core
+      - const: gpu-sys
+
   mboxes:
     maxItems: 1
 
@@ -32,13 +42,27 @@ properties:
     items:
       - const: aon
 
+  resets:
+    items:
+      - description: GPU reset
+      - description: GPU CLKGEN reset
+
+  reset-names:
+    items:
+      - const: gpu
+      - const: gpu-clkgen
+
   "#power-domain-cells":
     const: 1
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - mboxes
   - mbox-names
+  - resets
+  - reset-names
   - "#power-domain-cells"
 
 additionalProperties: false
@@ -47,7 +71,11 @@ examples:
   - |
     aon: aon {
         compatible = "thead,th1520-aon";
+        clocks = <&clk_vo 0>, <&clk_vo 1>;
+        clock-names = "gpu-core", "gpu-sys";
         mboxes = <&mbox_910t 1>;
         mbox-names = "aon";
+        resets = <&rst 0>, <&rst 1>;
+        reset-names = "gpu", "gpu-clkgen";
         #power-domain-cells = <1>;
     };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
