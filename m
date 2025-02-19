Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6992BC021B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XPqK20y34DlLij3WteVodWolXFR0v4agu9SvI46r3c=; b=CTCK/tDIZpQ/ZZ
	vt0+BpTQNZDLzFU4LV1zk1rGenLubgOdzbQskijv+yruoV9lpZ24q53RH2NPJhdEVfpARDZL/lZuO
	YP6LzNa1rXs+bAdSg3HYsJHnMe2IxmYE8o5BvP0BpzsDHeyaZ7rqdB0eLq4yetzLkLAC8dF8GnCSf
	Ff20uzzFcd+nvNok1Lui30RWLHFWX48xGZPdlbYCc7w/V1s8SdQg1HIG6Qhf+dsDulLWA5Y9PfLWn
	/SWDmoP/ctzgGKt1R2NRz27PZalOjfb+py6vNE3jmNJW26EfeL3ey6zSj6vvaRbwAw26YhRE06YpJ
	Zd9oDTLyoCX8pqL3sXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkhX-0000000D9rt-46g7;
	Wed, 19 Feb 2025 14:05:23 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfA-0000000D8gG-1Ftq
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:03:02 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250219140252euoutp024c5c49e8e227ba97d841fc7c2d53f396~loO1H1gPV0177101771euoutp02I
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:02:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250219140252euoutp024c5c49e8e227ba97d841fc7c2d53f396~loO1H1gPV0177101771euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739973772;
	bh=uo7s5XP9xLCcaXV6zS5at5CrZeY48gYb8finhktiqJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LD+X4e9em9WJylhofuniR3Axa7TTJGtCp5mBu3YW5Fi1xSG9ay7d8JTUhAYXw49Ho
	 EoEvZB/D3s0C+dZiZnWyWNjCBQQ8nwIXf/VSnft7u5Y7L4084v1QXCNmfNvKbDFGwQ
	 aEsCvufBkIJaZAxCTBEj4eVXMd/GNhnMYfNF/AFc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250219140251eucas1p1af357e5281ba396a4d6369a7305587c6~loO0srYhE1246212462eucas1p1G;
	Wed, 19 Feb 2025 14:02:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 68.72.20397.B84E5B76; Wed, 19
	Feb 2025 14:02:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140250eucas1p2e099f0f15ce0342f816ae15666e3e2f9~loO0GUseq1970819708eucas1p2u;
	Wed, 19 Feb 2025 14:02:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219140250eusmtrp1801e2278c4db1da2a8bba7c6a671a3b6~loO0FZLAD2416524165eusmtrp1K;
	Wed, 19 Feb 2025 14:02:50 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-b5-67b5e48b35f0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.76.19920.A84E5B76; Wed, 19
	Feb 2025 14:02:50 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140249eusmtip2e60405385117c7a2ec12b5af0b18e71d~loOyqS8N10094500945eusmtip2x;
	Wed, 19 Feb 2025 14:02:49 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/21] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Date: Wed, 19 Feb 2025 15:02:19 +0100
Message-Id: <20250219140239.1378758-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUZRjG+845e87ZraXjso6fUJI0mjHIpRj7TFJMHQ7ZMF2GCLRgg9NK
	sAvtipZjg7RAAguairorCCqTgCDmXrgEkguyErJyEbAQpISJVZLlsk5KWS4Hy/+e9/l+7/u8
	78xH45J60oNOUG7nVEpZkjcpIsyt96+uzB0xyQNGi5agy/0nMWSa1VOostGGoeIWmwANdRsx
	dM05QaKzo50UGmtMJ1BfWRGFNK3VJLLrh0jUeMdEoUntkAD11BeSaDqvBSDzdAaJqloGKVTt
	LMbQiUkTgUpr6wHKyv5OgLp+2oQGhy4TyN6jxVGW/ln0T0MthR72fU+gY3ebKGQc/1aArFWR
	KKPpEBHixU5cz6TYcbudYJv3zlBs470Sgq3TD1Kstu4KYM9XZJPsjb4Gkj3e9i57M9eKsYbS
	NDajqhVj9/0dwE5c6CXZfGMFYLs1/dQ7kmhRcDyXlLCDU/mvjRVtO3TnZ5BydskXJbpCwR7Q
	B3OAkIZMEOwomaVygIiWMGUA/latE/DFDIAn7p+bL6YBPPVLOv64pbFcQ7q0hDkN4OGarTw0
	DmDrD1NzEMm8AodPF891S5lMAmZeSgeuAmeKMXjmgW6Ocmci4M0OA5YDaJpglkF7ZZjLFjPr
	4K1mG8GnecGmix24CxEyIfBClwePLIBtupE5BH+EaEzHcNd4yJhEsKO9neR7N8I6+wDgtTu8
	bTVSvH4Oth/Uzs9PhsOmqfnLdsM6rXVer4E3bA9IVy7OvAyr6/15ez08U1dOuGzIuMHrfyzg
	V3CDB8xHcN4Ww71ZEp5eDgu0ef+F2srMGK9ZOH30LrEfLNU/cYz+iWP0/+eWALwCLOJS1Qo5
	p35Vye30U8sU6lSl3C8uWXEePPre7Q+tzlpQdnvSzwIwGlgApHFvqTgrzSiXiONlX+7iVMkx
	qtQkTm0BnjThvUh8silTLmHksu1cIselcKrHrxgt9NiD+YZEGl6LK/04wHhwZX5NuE3zTUxc
	zvMeP0b7RyW4Ey9aPfeNHXhBMbJwC/5Mc4nj6dyM46sLbn3uWBWGB2YGegZryocL90de2WJz
	XG2JEL25qq1/VpmWWJqIeYmponVk1ObX25K37qS+DpVOeubeeyo8PCUs/63Y8fDk9W8sXNy/
	IXQ6OH7gJXVXvSMidXXo78WOXVErhNKNusPSvChfe3YPLHjftLa/MvpP69LdTTWxmyTmDwfe
	phP9FL7LlYvxoD6f0fKPDBUNH4RYLq0J2HFqzKen8pP3LF+t6OrpdLptPjcjnPrMoAj6S+dw
	/xXZhP7imN5lgZ3XPpX2dhcNXtQ744civAn1NlmgD65Sy/4Fj0TrFk0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xe7pdT7amG6xermNx4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js9j7eiu7
	xceee6wWl3fNYbP43HuE0WLb5xY2i7VH7rJbrP86n8li4cetLBZLduxitGjrXMZqcfGUq8Xd
	eydYLF5e7mG2aJvFb/F/zw52i3/XNrJYzH63n91iy5uJrBbH14ZbtOyfwuIg7/H+Riu7x5uX
	L1k8Dnd8YffY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9bB7zTgZ63O8+zuSxeUm9R8vaY0we
	/X8NPN7vu8rm0bdlFaPHpebr7AFCUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFW
	RqZK+nY2Kak5mWWpRfp2CXoZU17fZCxYJ1exYOYc1gbGaxJdjJwcEgImEntXNrOB2EICSxkl
	zm93g4jLSFzrfskCYQtL/LnWBVTDBVTzilGiY/12RpAEm4CRxIPl81lBbBGBxSwSe/dVghQx
	Cyxlknj0/wDYVGGBYIlz22YwdzFycLAIqEq8XOMJEuYVsJd4fPgc1AJ5if0Hz4KVcAo4SOy7
	KAVxj73Eub77rBDlghInZz4BK2cGKm/eOpt5AqPALCSpWUhSCxiZVjGKpJYW56bnFhvqFSfm
	Fpfmpesl5+duYgQmmW3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeNvqt6QL8aYkVlalFuXHF5Xm
	pBYfYjQFunois5Rocj4wzeWVxBuaGZgamphZGphamhkrifO6XT6fJiSQnliSmp2aWpBaBNPH
	xMEp1cCkk+/xz0rmyXepuQKhuafzcy802q8tmvp/C8dfM3fxV8d+y/OvCQoMrWVh3fZHzbLw
	NOu1TwcPbXLRL840+JFyrErw3NwToTbBfgdCPgmujU3+G+fTkXqpc6+ss0+P3wzd45FejAFH
	ToYFykxjcAhde+jZ31mz259O3rZuinv7fs0vASyLZv5+tfLSkze/T6lYbeU7lhI/c/aKx0d/
	Wrkf79di/avwRfrx69MqIgFa6sem/77P9mxfEsOiCVYqi61nXn3AWT89dHHOki15p+ZZdL54
	MeNUr8Tu9P+3lPjbBeKEea/2LQyZ5Ztb6Ku3UG+LB2N7t+l+U0Ed2Ty1Qpfm5ikxTxXF1Jli
	bnlpbZJTYinOSDTUYi4qTgQA0g9DgrsDAAA=
X-CMS-MailID: 20250219140250eucas1p2e099f0f15ce0342f816ae15666e3e2f9
X-Msg-Generator: CA
X-RootMTR: 20250219140250eucas1p2e099f0f15ce0342f816ae15666e3e2f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140250eucas1p2e099f0f15ce0342f816ae15666e3e2f9
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140250eucas1p2e099f0f15ce0342f816ae15666e3e2f9@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060257_851061_FCA75B09 
X-CRM114-Status: GOOD (  11.80  )
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

Add device tree bindings for the TH1520 Video Output (VO) subsystem
clock controller. The VO sub-system manages clock gates for multimedia
components including HDMI, MIPI, and GPU.

Document the VIDEO_PLL requirements for the VO clock controller, which
receives its input from the AP clock controller. The VIDEO_PLL is a
Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
with maximum FOUTVCO of 2376 MHz.

This binding complements the existing AP sub-system clock controller
which manages CPU, DPU, GMAC and TEE PLLs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
 .../dt-bindings/clock/thead,th1520-clk-ap.h   | 34 +++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
index 0129bd0ba4b3..9d058c00ab3d 100644
--- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
 
 description: |
   The T-HEAD TH1520 AP sub-system clock controller configures the
-  CPU, DPU, GMAC and TEE PLLs.
+  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
+  the clock gates for the HDMI, MIPI and the GPU.
 
   SoC reference manual
   https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
@@ -20,14 +21,24 @@ maintainers:
 
 properties:
   compatible:
-    const: thead,th1520-clk-ap
+    enum:
+      - thead,th1520-clk-ap
+      - thead,th1520-clk-vo
 
   reg:
     maxItems: 1
 
   clocks:
     items:
-      - description: main oscillator (24MHz)
+      - description: |
+          One input clock:
+          - For "thead,th1520-clk-ap": the clock input must be the 24 MHz
+            main oscillator.
+          - For "thead,th1520-clk-vo": the clock input must be the VIDEO_PLL,
+            which is configured by the AP clock controller. According to the
+            TH1520 manual, VIDEO_PLL is a Silicon Creations Sigma-Delta PLL
+            (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
+            a maximum FOUTVCO of 2376 MHz.
 
   "#clock-cells":
     const: 1
diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index a199784b3512..09a9aa7b3ab1 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,4 +93,38 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+
+/* VO clocks */
+#define CLK_AXI4_VO_ACLK		0
+#define CLK_GPU_MEM			1
+#define CLK_GPU_CORE			2
+#define CLK_GPU_CFG_ACLK		3
+#define CLK_DPU_PIXELCLK0		4
+#define CLK_DPU_PIXELCLK1		5
+#define CLK_DPU_HCLK			6
+#define CLK_DPU_ACLK			7
+#define CLK_DPU_CCLK			8
+#define CLK_HDMI_SFR			9
+#define CLK_HDMI_PCLK			10
+#define CLK_HDMI_CEC			11
+#define CLK_MIPI_DSI0_PCLK		12
+#define CLK_MIPI_DSI1_PCLK		13
+#define CLK_MIPI_DSI0_CFG		14
+#define CLK_MIPI_DSI1_CFG		15
+#define CLK_MIPI_DSI0_REFCLK		16
+#define CLK_MIPI_DSI1_REFCLK		17
+#define CLK_HDMI_I2S			18
+#define CLK_X2H_DPU1_ACLK		19
+#define CLK_X2H_DPU_ACLK		20
+#define CLK_AXI4_VO_PCLK		21
+#define CLK_IOPMP_VOSYS_DPU_PCLK	22
+#define CLK_IOPMP_VOSYS_DPU1_PCLK	23
+#define CLK_IOPMP_VOSYS_GPU_PCLK	24
+#define CLK_IOPMP_DPU1_ACLK		25
+#define CLK_IOPMP_DPU_ACLK		26
+#define CLK_IOPMP_GPU_ACLK		27
+#define CLK_MIPIDSI0_PIXCLK		28
+#define CLK_MIPIDSI1_PIXCLK		29
+#define CLK_HDMI_PIXCLK			30
+
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
