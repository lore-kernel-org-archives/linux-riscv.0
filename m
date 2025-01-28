Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF576C02195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5cZf1cqKjHLDZQuDHEBH8gFRywq+9HCzYp6SM0MHJg=; b=ChJLJNfnwJD3Qy
	veLmRglpFiT5qd654FZQjJa3W5+Y+CoAXguQKbMhteXD2ok7w0I52me3t+aMTaT2Nhg1nd/73gFsz
	lLIMpjqA+UMg01pzNaAK+rbCVqj4sIyPG6ApSSPNvHHZLEQD1dFQ6v3BG7xjdQQL8Axxu8oJZQMty
	pH1LmzuPQOOT+ev0f/WtplJiAK7pyVYH8VxQO2puPb1artK7Uea/wz37rxqXyZWhFhFfPQtF9XoJJ
	dpJHudzbhe/ZHUIFH9UdIwsposYBmQSHAlfJfQMqsrgHLvZ3DaM0J0K+Y/hZlomDlZR96SYNTaOYy
	sojUq1cyUSOwFaHPn81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcra2-00000005jnW-2bYF;
	Tue, 28 Jan 2025 19:49:02 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZq-00000005jWq-2ifJ
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 19:48:52 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250128194849euoutp01d635ff20a512f3cf17a2569bcb53e2e4~e8wnCMFcl1614616146euoutp01e
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 19:48:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250128194849euoutp01d635ff20a512f3cf17a2569bcb53e2e4~e8wnCMFcl1614616146euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738093729;
	bh=YQ56w407jw6xppNoERGSTo6PKZd9ELlFhYIxa3usay8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8RRbfnYWVXiaYNOpe2kH9AGUr6jNU2aCi4r216E4blR2z0LN/7E1pwVXqJpNqTsu
	 MbEbv4yE+sMo7R2oJocU2M6b9/zVehrqV8/zYUBd0Mfhxm5qpCJgG/z72r7dtcQNLe
	 HFjflJDGDimWanv7+YG7k++VRl+KOqGQG7F9ovsE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250128194848eucas1p150313ac13f9666ed4a9bade345626229~e8wl8c7xd1987819878eucas1p1s;
	Tue, 28 Jan 2025 19:48:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 55.B2.20397.0A439976; Tue, 28
	Jan 2025 19:48:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250128194847eucas1p29f83672bd54d3e8ba76c1d5f53f1dc4b~e8wlcIQpo2889728897eucas1p2D;
	Tue, 28 Jan 2025 19:48:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250128194847eusmtrp268cdd74f09f2b0a1d642129b1c8ef7d3~e8wlbUSdT0493804938eusmtrp2K;
	Tue, 28 Jan 2025 19:48:47 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-eb-679934a05c30
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 00.CB.19654.F9439976; Tue, 28
	Jan 2025 19:48:47 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250128194846eusmtip1d4d3ecf54919cb41c5cff072dd8c4a99~e8wkI6bhr0756107561eusmtip1U;
	Tue, 28 Jan 2025 19:48:46 +0000 (GMT)
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
	<m.wilczynski@samsung.com>
Subject: [PATCH v4 17/18] riscv: dts: thead: Introduce reset controller node
Date: Tue, 28 Jan 2025 20:48:15 +0100
Message-Id: <20250128194816.2185326-18-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGPffe3ntLqF4qxiNTJyWwsCm6YfTEzQlGljvDEjaXbc4QrXpX
	GOUjLTi2sAxWShArDhwoLV92jXYE5GOUAgFxFUEEikMsLqHANiYDWhGhDkbE0V7m/O/3POd5
	87xvcmhcbCb96NiEZE6RIJVLSC+ioWOhb1v5ziLZjppMIbo1qMeQaVFLocpWK4bK2q0CNNxf
	j6EB1zSJrv55h0J/tWYQyGYsoZCqo5pEE9phEs1ohgXobnMxiWbPtgPUMJtJoqp2O4WqXWUY
	ujRjIpChsRmgrNOXBeiX2xHIPnyLQBN3NTjK0q5Bz1oaKbRkqyWQ7mEbheodeQLUWfUxymz7
	ngjbzE7fV1OsY2KCYG9kz1Fs65Nygm3S2ilW09QD2LqK0yQ7ZGsh2dKu99mRM50Y+5PhGzaz
	qgNjzz3dwU5fu0eyufUVgO1XDVJR4k+93jrJyWNPcYrtbx/zitHc0VNJk3TqE/MYlQ5qqBwg
	pCGzE9Y0TwlygBctZowA2sw9JC/mAMx13sR5MQvgOUPp8xGHq2dl5AqAJT8UrQgHgGdq7Z4U
	ybwBR6+UeR58GTUB1TczgFvgzDiADWPFpDu1lomElnGdwM0EEwgf140v+zQtYsLgVMVrfN3L
	sO3nXtzNwmW77qmRcLOI8YFdRWMexpczKpPOsytkar2gSZcu4IcPwAcTrYDntXCys37lho3w
	WVMZxnMiHDU9xnlOg02azhV+Ew5Z//HsgzPBsLp5O2+Hw1yDWeC2IbMa3nf68CushvkNF3De
	FsHsLDGfDoIFmrPPS63GhpVSFk7ZW8B3wF/7wjHaF47R/t9bDvAKsJ5LUcbLOGVoAvdFiFIa
	r0xJkIWcSIyvA8t/u3up09UIjJMzIRaA0cACII1LfEXR1osyseik9MuvOEXiUUWKnFNawEs0
	IVkv0repZWJGJk3m4jguiVP894rRQr90LHpvpDCu49GRVWEPzjt3e0dUL+wLiQ5gN4n1Q92v
	bBgwR80F38jeINdVVpZuiwi/9m3mQ6Ur46MRS86pVL/9dfKv37kYOlv7m7WbsK0a8N/Y0n75
	R/X8ewElB64b8vV9qVVJKm9g2dp7vbywN3/+UMCxwaDAoL60Xz/cVL1nnpI5FtT+eQX3AvJs
	v3+QSDrHbgvrfQs+G2VyYgxbD6b5KVN3O5Wylm6XUbJHsqvo8N7zF+IiF6b7R9ZF7Tv+d0/g
	FlFhzPFPDob/wR3+fNG8JkeeMhpZmF3ZqjohX0pOuuqjotIvSfeHdumKpWhoiyPWe/FQ3uCj
	zVnBodiRde8e3eU9k2GSEMoY6euv4gql9F/6qVNNSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7rzTWamG/zaq25x4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
	4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
	yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
	L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
	fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEvo+fCIvaCVxwV37Y/YW9g3MDexcjJISFgIvHm6xnWLkYuDiGBpYwS8zdt
	ZINIyEhc637JAmELS/y51sUGUfSKUeLLzm5WkASbgJHEg+XzwWwRgcUsEnv3VYIUMQu8ZZS4
	PnMjWLewgI/EoeezwYpYBFQlPm16DjSJg4NXwEHi9SptiAXyEvsPnmUGsTmBwpv+rgBrFRKw
	l3j0dgbYQbwCghInZz4BizMD1Tdvnc08gVFgFpLULCSpBYxMqxhFUkuLc9Nzi430ihNzi0vz
	0vWS83M3MQLTy7ZjP7fsYFz56qPeIUYmDsZDjBIczEoivLHnZqQL8aYkVlalFuXHF5XmpBYf
	YjQFOnsis5Rocj4wweWVxBuaGZgamphZGphamhkrifOyXTmfJiSQnliSmp2aWpBaBNPHxMEp
	1cBkcFXZ/NuKnOTie5P2yV40/dCxIWOTSkVwovaMF8Jt/rKrWJa5fji4IU1jq6vy3lO9oQsO
	xka7XLwrd0DimZwy25mHel9/x4ZsuTTJyvnqEb852vMYamPe2x2ssvjwn4dlSkW+i8z0DfVP
	sq8qr222kpI4uIyxwPLeuzVNNzcc380rc+dsuGtM8uOjx+/scls7d4bPoQL7rlcsCcZnl98O
	eptZMy+uWnbK3lmvjGQi0gS+WBapaWVwi5w/sXVXrPtulWe7RQ7FiUuv+fq+mzX8ZcePEnZu
	gWRZqdp91b9UVLqjuQsynWq+Ob5QKZ79mft7jd0+Jrs4VTu7hXWSstd2Si2YrOB16/B68a+M
	X+qVWIozEg21mIuKEwHo8d57uAMAAA==
X-CMS-MailID: 20250128194847eucas1p29f83672bd54d3e8ba76c1d5f53f1dc4b
X-Msg-Generator: CA
X-RootMTR: 20250128194847eucas1p29f83672bd54d3e8ba76c1d5f53f1dc4b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194847eucas1p29f83672bd54d3e8ba76c1d5f53f1dc4b
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	<CGME20250128194847eucas1p29f83672bd54d3e8ba76c1d5f53f1dc4b@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_114850_957571_FFC991FA 
X-CRM114-Status: GOOD (  10.32  )
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

T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
of the power-up sequence.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 2f5389579abc..bdbb1b985b0b 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <dt-bindings/power/thead,th1520-power.h>
+#include <dt-bindings/reset/thead,th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";
@@ -497,6 +498,12 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		rst: reset-controller@ffef528000 {
+			compatible = "thead,th1520-reset";
+			reg = <0xff 0xef528000 0x0 0x4f>;
+			#reset-cells = <1>;
+		};
+
 		clk_vo: clock-controller@ffef528050 {
 			compatible = "thead,th1520-clk-vo";
 			reg = <0xff 0xef528050 0x0 0xfb0>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
