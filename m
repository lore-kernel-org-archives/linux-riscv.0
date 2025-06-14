Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391F7C71151
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5CndKBA9eIY1JZfYx528JJg8DOM6+5aN5jcNX+5OBg=; b=y+SZYlI6hKd9KT
	dC9p5pvV0n2skjxdekb4pJ0V+R315XkM7LJ3EyORi+0551TRzjhf566qH5PXb5jMBy8T7J5q1Sihk
	FYndbvt5OTw6Tba1vIV89UU3uK/gZvbIiYgbergTzfdBivlhUeMgJOezdv4NsljRhNvQbzyEU321A
	rANcr67U0vXk2SHucez1TbBXJbL877u3z6ryvymsPOAo2gLQ7b+yuZQn8XxriC95QazobvsCIhJXX
	ItnD7no2AixNJN+TpLie6+020AV+9FB2YK151SsjNWIo6v1BI4q0zs5eXmaPCVJ2/8nixIk+rqhUK
	zTBvBPHjBODMHt52Wd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJf-00000001cqV-15rD;
	Sat, 14 Jun 2025 18:09:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJa-00000001cnW-2V4v
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 18:09:18 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250614180910euoutp012fd639f669c6c014eec813522c17f96e~I_xtW5FAC2694526945euoutp01l
	for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:09:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250614180910euoutp012fd639f669c6c014eec813522c17f96e~I_xtW5FAC2694526945euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749924550;
	bh=63b01qSumkcLmIEY0xdhZ+QcRoYutlUuGjICSf4+AW0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ClZPKjxM5OghbTcfgCIe5d+vucZN+EPvVbPxD+9Zb8WF8Mgq/SyZ56JEQNKWXESQg
	 Bhj+omRSPKgWYxnHmqIv2bmTCOMxjrmVLUL7ue7sTJAuJSgSHHRyW/awI2V15Dci+n
	 3Q9smHBE/SKziJWQZhykb9AV3+c13r7QivZ2jnIc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180908eucas1p1f8e152bc86111d1fab4916e1737534e1~I_xr8DbVU2845928459eucas1p1D;
	Sat, 14 Jun 2025 18:09:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180907eusmtip1ff19c528fcdbe243e1c7de018a545147~I_xq78Vp31758317583eusmtip1o;
	Sat, 14 Jun 2025 18:09:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:08 +0200
Subject: [PATCH v4 2/8] dt-bindings: firmware: thead,th1520: Add resets for
 GPU clkgen
MIME-Version: 1.0
Message-Id: <20250614-apr_14_for_sending-v4-2-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
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
	dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180908eucas1p1f8e152bc86111d1fab4916e1737534e1
X-Msg-Generator: CA
X-RootMTR: 20250614180908eucas1p1f8e152bc86111d1fab4916e1737534e1
X-EPHeader: CA
X-CMS-RootMailID: 20250614180908eucas1p1f8e152bc86111d1fab4916e1737534e1
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
	<CGME20250614180908eucas1p1f8e152bc86111d1fab4916e1737534e1@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_110916_068420_0DC20B66 
X-CRM114-Status: GOOD (  10.26  )
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
