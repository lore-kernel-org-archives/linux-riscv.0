Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E15C021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97z/yrTNdbTz83nL5bbe7r6n5gsv5PzjX85fjJOse8k=; b=WybPqI+DsSRuLk
	eUPCnEqpNA+kpX/H88EDka5zyScEaNoZ2LJ0ktv14YGVU/yqNTAnr5zcwsalwm1H//v2dIc+U/4Rt
	cpPcuDxwbHFbY8JT7tqmzr1/Ljq8oSmiayJTQa+RK+4zETBG5Ktxb93xr92QAXc00PjFKIwqf0Nie
	OfcnusRfcTAsbwFXlas6/yWiQuLZu5+qVbO28CJDnnbm4al82t001pFgN9AJx0OOzSC46J+OvmvQO
	D+UeIKOqQGRh/JrEgoNxlPvFnfa+bd/fzwuVIKb/WTbeYJd3I6kNlj9opRJe3mNWTwArNh0NP7PAF
	1LTCOOhgnbpL8wuJxmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkhn-0000000DADm-0IRo;
	Wed, 19 Feb 2025 14:05:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfU-0000000D8x8-25T2
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:03:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250219140315euoutp024de372a4c483334bfb4d06d0ea5a6c03~loPKxzoYm0188601886euoutp02V
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:03:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250219140315euoutp024de372a4c483334bfb4d06d0ea5a6c03~loPKxzoYm0188601886euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739973795;
	bh=12zgg0u6SopxWQIy7vWjQCGizdWj0osIHyffKHYRC3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHi3YnVLLP1TRdNzxRc81KiW3WISxDAUWcjI6D6PwHI1Twp4dA/WQL2FKwLGvPEYG
	 svk6vQiW1OsG/lSUSUHkLi2ShfHsiqJK00EUxazD24Vzd2JSMxLkNDXXv1rStSEJDL
	 N7iJWb3TceUkftqVy3fy2J20pOqKz1PYsTBHK59I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250219140314eucas1p1eda8c0381842319a9428e02125dc3823~loPKWaHR21249212492eucas1p1I;
	Wed, 19 Feb 2025 14:03:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 3D.11.20409.2A4E5B76; Wed, 19
	Feb 2025 14:03:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219140314eucas1p146c73e1fdb8b56315672742f8de8c131~loPJ5Xd_-2959629596eucas1p16;
	Wed, 19 Feb 2025 14:03:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219140314eusmtrp1f5cf61c06102900283ff30fea46263ba~loPJ4h7qK2395223952eusmtrp1i;
	Wed, 19 Feb 2025 14:03:14 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-46-67b5e4a268cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id AB.96.19920.2A4E5B76; Wed, 19
	Feb 2025 14:03:14 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140313eusmtip264744d700dcb5ab18c82ae4a69e75618~loPIrps6c0084500845eusmtip2v;
	Wed, 19 Feb 2025 14:03:12 +0000 (GMT)
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
Subject: [PATCH v5 18/21] riscv: dts: thead: Add device tree VO clock
 controller
Date: Wed, 19 Feb 2025 15:02:36 +0100
Message-Id: <20250219140239.1378758-19-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjNe+/tvZcu1WtFfQUzFCaLwIojkr0bbEGnyWWZQecPlxHDOrgr
	ZlBMK6j7EoFW0IoCilpQHDhBQkVZW2kHdmPYomKd4EqXQVs2HAM7Gd8ogw16cfPfc85zTs5z
	kofGxdfJAHq3fC+nkEvTgkkhYbQ+sb9S2WeQrS//Ngy1dVViyDCtpVBdsx1DFa12AXJ16DH0
	YHyIRFce/kihP5oPEchRc45CudZ6Eg1oXSQa1rgEqNNcTqLRY60AGUfzSKRr7aFQ/XgFhr4a
	NhDoYqMZIHXBJQG6f3sL6nG1EWigU4MjtXYx+qepkUKzjmsEKntsoZDeWyRANt1OlGc5ScS9
	yA45VRTrHRgg2B/yxyi2eeICwZq0PRSrMbUDtqG2gGS7HU0ke/7WdtZ91Iax31w8yObprBh7
	fGY9O3TjJ5It1NcCtiO3i9om/kAYm8Kl7c7iFJFvfShMzS5tAHv+pvbf650SZAMreQT40ZDZ
	AM+V6fEjQEiLmRoAu+6ZKB6MAegylWI8GAVw8KYHf2a5PVtA8otqAHXHhwEPvABOekcF8yqS
	iYKe6grB/MKfURFQdfOQT4Uz/QAa+8p98UuZ9+DPZpPPQTBr4enCDl+GiImD7q4OjM8Lgpbv
	787xNO03x9+4H8BLlsBbZ/uI+Rmfk+QaynwtIKMTwr/UTor3boZPK9wLdy+Fgzb9Ar8K3inR
	EPycAT2GkQXN59CksS3MMbDb/pScz8WZdbDeHMnTG+F3OWZinobMIuj8cwl/wiJYbDyN87QI
	5qvFvDoUntIc+y/UXmNcKMXCGc9h8gRYo32ujPa5Mtr/cy8AvBas4DKV6TJOGSXn9kmU0nRl
	plwmSc5IbwBzv31n1jbWCKoHhyUtAKNBC4A0HuwvUh/Uy8SiFOmBTzlFRpIiM41TtoBAmghe
	Iaq0qGRiRibdy33CcXs4xbMtRvsFZGOi39p6ndKqt2N1+KM3rno3PXn8UmzIygeB8NE7M2nE
	pf7gmsTXri8L/yyye11xUFhJWw4h6a8KLdqxPSa/XV6QsMM6vbkq6nzyrtRfEmBAoi1oehWt
	2OqfVDUSzTz8vfjdEXtblvukPml502Vv6OHVE2eLOq8Ix0dFIRP012vjIqJjpqZe/8jUcOZy
	pCRwoDBhpKKk90COo1kimEx0hI/pv9gSu1/uOeN0t5+A+WZdXg4Zv1gV9+usZbndOlanNpVG
	7/OP2MaGxMd7vSuz3qyveyFn8OhWO2nt+9LRtUyXTEZdfX81577rfHnnqdQ1G9mIj7GIDeHK
	SalrV39Kge5ay6ZgQpkqfTUMVyil/wJu5Ov/SgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7qLnmxNN5h+j8/ixPVFTBZbf89i
	t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
	xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
	l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
	X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
	+66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
	TUpqTmZZapG+XYJeRsO0TYwFf9grzj/8wdrAeIyti5GTQ0LAROLUv04gm4tDSGApo8Tx4+tY
	IBIyEte6X0LZwhJ/rnVBFb1ilOjZNYUZJMEmYCTxYPl8VhBbRGAxi8TefZUgRcwCbxklrs/c
	CNYtLBAgsbR3Adg6FgFViel9l8CaeQUcJO5fv8QEsUFeYv/Bs0BxDg5OoPi+i1IgYSEBe4lz
	ffdZIcoFJU7OfAI2khmovHnrbOYJjAKzkKRmIUktYGRaxSiSWlqcm55bbKhXnJhbXJqXrpec
	n7uJEZheth37uXkH47xXH/UOMTJxMB5ilOBgVhLhbavfki7Em5JYWZValB9fVJqTWnyI0RTo
	7InMUqLJ+cAEl1cSb2hmYGpoYmZpYGppZqwkzut2+XyakEB6YklqdmpqQWoRTB8TB6dUA9OR
	7AlT/52vmvw9UDOk20RbouVLHxPLFQ5zx5ePtH5vfuhY8ivz2cZ4SZfPiy7tmnZlWtmB11zz
	Z5170XoqR7zNzan3Vsqi42Ff+sxLJoQwsXkHeB/b9+rm1IqnEV1X4wMDjJ+VL1c0EOQLWfve
	fH69Lqfp10Nzzviu6G+dpdb6Jbvx8e3/Tw6eaHyx4HjbkUe+aY8n1uyyU89r2bq1aX/1zgoH
	7qIMr0vXGDdl9iw6F+3ks7qe6+vbrjOcJ59Vpj/7UjT33mT5T/ple26wCUYXVUy3Cfj2vK/D
	sfvptVfi35l2l+Tolx+e6/CmxmzLzYXfJqx5pCvVai3L93bNZY29wktMuR/7TDgxTWbDX7ds
	JZbijERDLeai4kQAovIHJ7gDAAA=
X-CMS-MailID: 20250219140314eucas1p146c73e1fdb8b56315672742f8de8c131
X-Msg-Generator: CA
X-RootMTR: 20250219140314eucas1p146c73e1fdb8b56315672742f8de8c131
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140314eucas1p146c73e1fdb8b56315672742f8de8c131
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140314eucas1p146c73e1fdb8b56315672742f8de8c131@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060316_811030_2AAC94CB 
X-CRM114-Status: GOOD (  10.23  )
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
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 527336417765..197df1f32b25 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -489,6 +489,14 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		clk_vo: clock-controller@ffef528050 {
+			compatible = "thead,th1520-clk-vo";
+			reg = <0xff 0xef528050 0x0 0xfb0>;
+			clocks = <&clk CLK_VIDEO_PLL>;
+			#clock-cells = <1>;
+			resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
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
