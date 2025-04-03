Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5C5C3601B
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBkEjq/P6FbdlY1L0I7LfQcbdTZJnU4mXVn1LA0PFU0=; b=Rn9se5Ymzy2vSp
	BDp+xGPDF4/m6fwNsv5lYNUideleBW/kzp6jIaopukCxKRYtP/uk9OzQsBGO4bYjrj0EMWEhu0kE4
	tG4oGGLlxlxYxLdGjjoEckTxDImk8Dshh2UeTMid5axNz/V1bwS9N7GAmjgCqzPYZ0ySc2F8EFzAM
	QD76NWvKhqAPDj2aUtJeGlslLnX6w3VvxDZbZguNJnHJf4CXNn+HQJRgWa+Zwkm1YoAOBMfJMPRGv
	EDHhoqHVKdojR+puM6pBRSVHfgzNtlgFsmwG8WBM9FNAncWZ8YD5dtwNoquwaA3AZqwHMNm0aLFuH
	Raa+99ctoETPDPP6xwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HZQ-00000008WHv-2cqw;
	Thu, 03 Apr 2025 10:13:12 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H7m-00000008RFm-192v
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 09:44:40 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250403094434euoutp020f9fcf7f0ce33b37e30c6a809bedb99a~yxclU-9lo0284502845euoutp02m
	for <linux-riscv@lists.infradead.org>; Thu,  3 Apr 2025 09:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250403094434euoutp020f9fcf7f0ce33b37e30c6a809bedb99a~yxclU-9lo0284502845euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743673474;
	bh=zWpSPctGzB1QFcIv8f8mPGsvFF5oZ87O6t+skARlCj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5Rrs3flXjXZLCH6rEqIfZpjYdYq25Gt4vADUmgHTsaYdYD+DZA/+nye2N2joEmjK
	 KEkq0Ol1Hv4ekBvDjs64ivkx2ZhS43A6v1vAIl8DBOHpOR3TDKKk7y0AFOLurLrOoq
	 5lCGbEHRL46NLfLDPjDPIyrsE4TVjORAvJ/tQsn4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250403094433eucas1p2ac0ecff48840a11e974d418b3f372fc9~yxck5OjcX1404914049eucas1p2O;
	Thu,  3 Apr 2025 09:44:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id C2.79.20409.1885EE76; Thu,  3
	Apr 2025 10:44:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319~yxckiSN4R0789407894eucas1p2U;
	Thu,  3 Apr 2025 09:44:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403094433eusmtrp2885ba86520c1e37e943077d94852f880~yxckhi9os1352013520eusmtrp2n;
	Thu,  3 Apr 2025 09:44:33 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-ea-67ee5881f257
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.FF.19654.1885EE76; Thu,  3
	Apr 2025 10:44:33 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094432eusmtip24ab6de2b4e1d8767ed3f8da4f00574ba~yxcjocdlD1024010240eusmtip2W;
	Thu,  3 Apr 2025 09:44:32 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Date: Thu,  3 Apr 2025 11:44:25 +0200
Message-Id: <20250403094425.876981-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403094425.876981-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7djPc7qNEe/SDf4u0LF4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	WP91PpPFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRXDYp
	qTmZZalF+nYJXBkfumcyF5xir1jftJmtgXEOWxcjJ4eEgInElmPzWbsYuTiEBFYwShz9eIkJ
	wvnCKLGvdwojhPOZUeLc3jfMMC2bb7cwQySWM0r8mdbIAuG8AervucMCUsUmYCTxYDnEYBGB
	PUwS37//BGthFljFKPHk20f2LkYODmGBAInjfzlAGlgEVCXaZuwBu4pXwE5i7r0jUOvkJfYf
	PAtmcwrYS2yY8pgRokZQ4uTMJ2DLmIFqmrfOhqo/xSkxd0kFhO0ice3NLXYIW1ji1fEtULaM
	xP+d85kg7HyJB1s/QfXWSOzsOQ5lW0vcOfeLDeRMZgFNifW79CHCjhKTfm8CC0sI8EnceCsI
	cQGfxKRt05khwrwSHW1CENVqElN7euGWnluxDWqph8Tt1ulMExgVZyH5ZRaSX2Yh7F3AyLyK
	UTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMFWe/nf8yw7G5a8+6h1iZOJgPMQowcGsJMJb
	qPU2XYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvov2t6UIC6YklqdmpqQWpRTBZJg5OqQam3Zbn
	HFktm9ZOdyrtYixZ76eh/s9BQ3tWt5FcSkf5XP178Z5PPkiXnWGIm/Lb9MJ0p5Pti91jnoZw
	m+nOvxLzLKaC75qu21mlojSP0vJtD2/XhX2yl/bfxHsjdE9F+c9k40/CbwJypT2OLml88nAZ
	10mLs2wTrsw/tIafdWbgrvV9zGWnRLqlttiVMNp5i2YemsJSWvP6aQH77VKp/OCXNbZxp5Km
	+yY8N1iWKim9eUX2zZaUyWrC/BMur1291vS7hNfTkH0MHI/bnjisu23B7HKz/ODCNQa3Qs4x
	PI/aeS+Nf45m7G6nNRvWGP4UuSYgajF9qc+tLK4gn5P5swPc3ZMUCzRtgme+ObDW/YwSS3FG
	oqEWc1FxIgDUxk5BBAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xe7qNEe/SDQ61iFg8u/OV1WLr71ns
	Fmv2nmOymH/kHKvFvUtbmCxe7G1ksWg+tp7N4uWse2wWH3vusVpc3jWHzWLb5xY2i7VH7rJb
	rP86n8ni4ilXi7v3TrBYvLzcw2zRNovf4v+eHewW/65tZLFo2T+FxUHE4/2NVnaPNy9fsngc
	7vjC7nHvxDRWj02rOtk8Ni+p92hZe4zJo/+vgcf7fVfZPPq2rGL0uNR8nd3j8ya5AJ4oPZui
	/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwP3TOZC06x
	V6xv2szWwDiHrYuRk0NCwERi8+0WZhBbSGApo8TyhxoQcRmJa90vWSBsYYk/17rYIGpeMUp8
	n8QBYrMJGEk8WD6ftYuRi0NE4AKTxK51q5lAHGaBdYwSU7bvYAKpEhbwkzi68B7YBhYBVYm2
	GXvAJvEK2EnMvXeEGWKDvMT+g2fBbE4Be4kNUx4zQmyzk/hzs58Zol5Q4uTMJ2AXMQPVN2+d
	zTyBUWAWktQsJKkFjEyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqN627GfW3Ywrnz1Ue8Q
	IxMH4yFGCQ5mJRHeQq236UK8KYmVValF+fFFpTmpxYcYTYHunsgsJZqcD0wreSXxhmYGpoYm
	ZpYGppZmxkrivGxXzqcJCaQnlqRmp6YWpBbB9DFxcEo1MDW67Vw3abf9lf9rStZfXi1wqUlu
	XekdqW/nzZ9PW3X5/c1LZQdiDtZcnvlh6+nyf/+0Da/7et58+foZG+fTlYxr2r+q5nzYcb7I
	3mSLysHJIu+LVnv5tMzzd46qeSWg6p72NSJROD33/ua2jwaXJnz8pvvpQO4iER2eqKN5N/+d
	yf73rvH9f3ad5sKwVlVf0wxNT/td5+x1DvbGb++fG7O/w9Hmw6wDXU/lX13ZnTL5+OeThWyJ
	/yY4uadPSYliCG5ruj8jX/xL8u2GjZEnxRkaJn5tWLf7uXwRh+mP2Ath/RVJm9i+vNELag5c
	sv6tpvmP2fyRS/0kdlsnLBCZKx93WtHdaA6zvcWlf53TuXSVWIozEg21mIuKEwFp71JucwMA
	AA==
X-CMS-MailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-Msg-Generator: CA
X-RootMTR: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_024438_584608_A79F60CA 
X-CRM114-Status: GOOD (  10.17  )
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

VO clocks reside in a different address space from the AP clocks on the
T-HEAD SoC. Add the device tree node of a clock-controller to handle
VO address space as well.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 527336417765..d4cba0713cab 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		clk_vo: clock-controller@ffef528050 {
+			compatible = "thead,th1520-clk-vo";
+			reg = <0xff 0xef528050 0x0 0xfb0>;
+			clocks = <&clk CLK_VIDEO_PLL>;
+			#clock-cells = <1>;
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
