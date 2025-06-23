Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8ACC7EE3A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVRDMhGeEv9ZmWUkuWZoxsrvD4L3mhvzgOjwnfrVi6c=; b=FmwIABDEcAIEeX
	KYnblK2yU8MRGmpox/J7mA8PA2y29nzBpwRc99Kpa0yt0DL8h2GHKam6pVRUHvdf2Me5UWg3IaRSR
	9x11YocbO+/HPDYvnKUFoLxCiRx1DS97im1fAnRKGxDFELIKtxz2ew7+LXRhV8PdYimKtNyQyjXpr
	Fy/Y74P6iZ/IcIt9AVzVOQoA2rsPi3xRbIedtkDra1WcbacVysM5wVmME8TudhThFHJ8bkHETsKQc
	tWgdCKcFMHbooL8GOKxuvrpyVVuPvEkM4OO7Vkop4o1FE9bsArPRPuouT5Vft09xKd9hDbL8XjpIJ
	YpYcMMoK/7sazrDfoyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh32-00000002qIJ-3AYx;
	Mon, 23 Jun 2025 13:17:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbO-00000002XUD-383T
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 11:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=snLx4JRv75lRpgWYDV6hSgEiKwVBWVcVe6z8ZUMZE/4=; b=GBfGxI0gob6AQFXlabMyrDbo+f
	jlf+iBMNrM5ZjswKDmWGgjIX0vbBeMuFvp+sjKJwSDZvMM/jWYQHmG+Q1vLzc4/U2RZ+riQRKy076
	xWhjJSjtebv5jZhhBjj8Cefw7Sojfwt2VDdwfx42H5XEYE12jcjHat5gPLjPbEGxUiCwHC98CIUYy
	sIO+z6q+OlwwP0O2W2slidtKDHZJBBDHD2VmxFuuYfhrECcrlX8k9rA0+AdaSsbh9mrhyHFhEaddA
	0qwQGjqxACuNJqNcbGibdt59NoGGpUYXMe9W7/FAfLzMwXYWQZu/w8D0le6JaJ3yaeKwnmtsQPxNz
	NiKxvClg==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbL-00000005Cd4-0w0b
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 11:44:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250623114432euoutp0263c9013b80bf3aae0a1ee5d09bab4f19~LqVc6scgz1759017590euoutp02R
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 11:44:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250623114432euoutp0263c9013b80bf3aae0a1ee5d09bab4f19~LqVc6scgz1759017590euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750679072;
	bh=snLx4JRv75lRpgWYDV6hSgEiKwVBWVcVe6z8ZUMZE/4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=YltEA3z+bkmNQeBYA3x7KNCLdOm2IeVJU0//HuAEIbeZYT+1s817n8sgbulWFkFfd
	 jA5NeLWTt+Mt+YNiwute9jn492A546Jf1pZKOcAM3VDd3UBcrzpjN9/oi94rjItfXp
	 wVY3z3gqj2QLMNbk9iMtyM76iCv0IJhfQvOd21X0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250623114431eucas1p23e8afc09574e2c2026b0e05323db821f~LqVcSGMCD2915729157eucas1p2i;
	Mon, 23 Jun 2025 11:44:31 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114430eusmtip1b8811fa83d3fe7951975aa26c0c678b2~LqVbKVMve2309023090eusmtip19;
	Mon, 23 Jun 2025 11:44:30 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 13:42:40 +0200
Subject: [PATCH v6 2/8] dt-bindings: firmware: thead,th1520: Add resets for
 GPU clkgen
MIME-Version: 1.0
Message-Id: <20250623-apr_14_for_sending-v6-2-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114431eucas1p23e8afc09574e2c2026b0e05323db821f
X-Msg-Generator: CA
X-RootMTR: 20250623114431eucas1p23e8afc09574e2c2026b0e05323db821f
X-EPHeader: CA
X-CMS-RootMailID: 20250623114431eucas1p23e8afc09574e2c2026b0e05323db821f
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114431eucas1p23e8afc09574e2c2026b0e05323db821f@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124439_568995_AB350272 
X-CRM114-Status: GOOD (  10.60  )
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

Extend the TH1520 AON to describe the GPU clkgen reset line, required
for proper GPU clock and reset sequencing.

The T-HEAD TH1520 GPU requires coordinated management of two clocks
(core and sys) and two resets (GPU core reset and GPU clkgen reset).
Only the clkgen reset is exposed at the AON level, to support SoC
specific initialization handled through a dedicated auxiliary power
sequencing driver. The GPU core reset remains described in the GPU
device node, as from the GPU driver's perspective, there is only a
single reset line [1].

This follows upstream maintainers' recommendations [2] to abstract SoC
specific details into the PM domain layer rather than exposing them to
drivers directly.

Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/ - [1]
Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/ - [2]

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Drew Fustini <drew@pdp7.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
index bbc183200400de7aadbb21fea21911f6f4227b09..3365124c7fd4736922717bd31caa13272f4a4ea6 100644
--- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -32,6 +32,13 @@ properties:
     items:
       - const: aon
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: gpu-clkgen
+
   "#power-domain-cells":
     const: 1
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
