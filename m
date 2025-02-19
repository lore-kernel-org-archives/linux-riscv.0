Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8023DC021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhWNd4sUIYMJgrf+mmqxg92zon/Tm04dC0z+aLp9Nf8=; b=WlQa6wLfp79VNe
	ZCKRJGm+y9NLBPKvKYBbwJEQ+BDqSVdy/8O7RyXRBJ6gNr5brjD4dPybgbH9beIC00zt2nYSrmqcZ
	CdHb1fbSnw1MFMAB8z77Ajk11VclGsuSq7pmzNenomE/4KPgNARNlTwYFUmh7XGOAMELs9w2RrC5T
	QImBMiNxlvX5hwW9XO0icj7Hi3jKNKgWD3F/a1BFRZICphyOKkbk32KekF/NZGiYLYjmCvFG8WWTU
	T7L+Q8md36pG+2zAKNWkLkpCjgqwvEDvas9Jju0uEGyt8GBZ/juK2LaY0DbH10q1ObcXXTCWiAR2s
	oUVMDIgF1gtN0DaESTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkhp-0000000DAGy-0urJ;
	Wed, 19 Feb 2025 14:05:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfV-0000000D8zK-3yO5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:03:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250219140316euoutp0153f99b3b157a978e899a02f2ee5637de~loPMFc0nb1473614736euoutp01i
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:03:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250219140316euoutp0153f99b3b157a978e899a02f2ee5637de~loPMFc0nb1473614736euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739973796;
	bh=E1zJumBGEhU08Fgunm11x/aZblHVc773/qz1x5SMe2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JvpQxDzu9cNaNdBEBOx/gWQmpBNXbZiN3wvDvIn3no3kmbM0LqR7ZLvZijvgvuvF1
	 BNI2Bg/Yb52bv3lcaotnbb9mzotFwB0Izkuom/F3HcdKvIgp6J/hOiuw6L7mH50CfC
	 Frnvidxm56vubAyhaSD6lnRmrjYWQ/mFv0CpUU+M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250219140316eucas1p164a6d8297aeedf001d6a6b5e22170952~loPLpY6bu2959629596eucas1p1_;
	Wed, 19 Feb 2025 14:03:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 80.A2.20397.4A4E5B76; Wed, 19
	Feb 2025 14:03:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d~loPLIgJDP2129421294eucas1p1s;
	Wed, 19 Feb 2025 14:03:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219140315eusmtrp1ec8ac420be7e9c649195915122aae2cb~loPLHlW_V2395223952eusmtrp1k;
	Wed, 19 Feb 2025 14:03:15 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-25-67b5e4a4bccd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.96.19920.3A4E5B76; Wed, 19
	Feb 2025 14:03:15 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140314eusmtip25dd0e4371c8e2f5b6ae8d0407dc74335~loPJ03h2l0642206422eusmtip2R;
	Wed, 19 Feb 2025 14:03:14 +0000 (GMT)
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
Subject: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Date: Wed, 19 Feb 2025 15:02:37 +0100
Message-Id: <20250219140239.1378758-20-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbZRjG/c45Pac0Fs/KCJ/oQEkgGXGAbi6fcRGIOI8xLui2YBYWVt2x
	wGhpWhgyJ4NwEWi3wS4yC4zLyCjEjo21TbmUS7kURO4OmIOKWXEUuhEGbCrKpJ5O99/ved7n
	zfO9ycfHRXrSl58gS2EVMnFSACkgjL1/DO+osRskYRc2KNQ3WY0hw7qGQt+bhzBU0T3EQ7Yx
	PYZ+Wlsi0bW5EQrNm7MINKEtp1B2bwOJHBobiZbVNh4aby4j0crpboCMKzkk0nXPUKhhrQJD
	VcsGAtWYmgHKK7jKQ6M/vIdmbH0EcoyrcZSneQE9aTVRaGPiBoFKH7RTSO8s5iGrLgbltF8g
	IvyYpalcinE6HATTlb9KMeZHlQTTpJmhGHXTj4BprC8gmemJVpK53P8x84vKijE3a04xObpe
	jDn7dxiz1HaLZM7o6wEzlj1JRYsOCfYcZZMSjrOK0HeOCOJHF3fKezy+7LsywssEa1Qh8OBD
	ehfML1BhhUDAF9FaAM2DdwlOrAJoLS/CObGyOamrwJ6ujDZ0uFdqAfz1UTHFCSeAPWt9wJUi
	6TfgbG0FzzXYSucSMLcnC7gETt8D0GgvI10pL/owrFwt/JcJOhC2Py7muVhIR8DesVqc6/OH
	7Z2Dm8zne2z6baO+XGQL7P/OTrgY34xkG0rd8ToBnNZEchwF7a1V7ku94IJV7+aX4cB5NcFx
	Mpw1PHTvnoRNaqub34bTQ3+Srlqc3g4bmkM5OxJODswRLhvSnnDq/hbuBZ7wnLEE52whzM8T
	cekgeFF9+r/SIa0R4yIMzHIqisCrmmdO0Txziub/2kqA1wMfNlUplbDKnTI2LUQplipTZZKQ
	z5OljWDzYw9sWNdMQLuwHGIBGB9YAOTjAVuFeaf0EpHwqDj9BKtIjlOkJrFKC3iJTwT4CKvb
	cyUiWiJOYY+xrJxVPJ1ifA/fTMy7Zia2wy/wVqdn1N6FBMVf9ojpfar9H11zJJ7tOPJkv1ye
	GnDwq/qo2A9bVrebymb8w3ZfeXiwpasrXhXdn5MmU4UdLw3e+CBmI3b4fkZrbIJZeiB3cM+l
	xp9/hzc6VxavD2dQPgqjY0fp19sIw4l1HdVp//a5x6o74ap78quJN3UwZT0ufiDaQ6uVnvNL
	V6S/Ypt7LcUyFbct0vyWs9xy+1i1VhgeeFtV1/HbN/PV74fDkfK267PyT6Iu+09GBwVXYXe8
	nYlvvqjyqmKa0syHpuZDD0wsRt8tMTXPdQ86Tb3vqopijIKW8chdz188E/TZ+eyTD2wl3iG7
	Dxu/2Lv4aVtGZgChjBe/HowrlOJ/AHNk9ZJHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7qLn2xNN9jbomhx4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
	4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
	yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
	L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
	fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEv4+Jr44KjnBUnFl9gbWD8yt7FyMkhIWAicXH9ASYQW0hgKaPE5ndOEHEZ
	iWvdL1kgbGGJP9e62LoYuYBqXjFKPDg6BSzBJmAk8WD5fFYQW0RgMYvE3n2VIEXMAm8ZJa7P
	3AhWJCwQLfF7/UqwbSwCqhL7v08Ea+AVcJA4dmk5M8QGeYn9B88C2RwcnEDxfRelIA6ylzjX
	dx+qXFDi5MwnYCOZgcqbt85mnsAoMAtJahaS1AJGplWMIqmlxbnpucWGesWJucWleel6yfm5
	mxiBqWXbsZ+bdzDOe/VR7xAjEwfjIUYJDmYlEd62+i3pQrwpiZVVqUX58UWlOanFhxhNgc6e
	yCwlmpwPTG55JfGGZgamhiZmlgamlmbGSuK8bpfPpwkJpCeWpGanphakFsH0MXFwSjUw2Rbt
	yNO7fPVcFwczz0/5k3ZrfJdxlOxp/Zu1a6sUx60LBz9MOH7z1dcp/iandoZx521Inqpx9xnP
	Uo0P/m9CAgo6P4cqTe2TY5z6bHW3toW3zszVVYz7H3mXFYW5Sfj+Yorn3ep1fuLJA04mHRZz
	Nq0zc705O/92svqfa5aLnpqv6o1/f6HlUGasxoaaSu9Ic9HjxccUFug6bJOeXeDJnBqVofPM
	k7Pj5tPLe4Jm3eXReS15U3mpsqxzZW/ImoDiT6rarNp5XawBPJfmnXx7/a38XRntrc+Dlkja
	Sy8wjY2v//R5Tt+xhRa3k3PlpkjOad41cZrY3wmeFkdtpl9LOnlGYXpT1ZITL4TEL+4LVmIp
	zkg01GIuKk4EAEd0C8K2AwAA
X-CMS-MailID: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
X-Msg-Generator: CA
X-RootMTR: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060318_259164_48459216 
X-CRM114-Status: GOOD (  11.07  )
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

The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
TH1520 SoC implements power management capabilities through the E902
core, which can be communicated with through the mailbox, using firmware
protocol.

Add AON node, which servers as a power-domain controller.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 197df1f32b25..474f31576a1b 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+#include <dt-bindings/power/thead,th1520-power.h>
 
 / {
 	compatible = "thead,th1520";
@@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
 		snps,blen = <0 0 64 32 0 0 0>;
 	};
 
+	aon: aon {
+		compatible = "thead,th1520-aon";
+		mboxes = <&mbox_910t 1>;
+		mbox-names = "aon";
+		#power-domain-cells = <1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
