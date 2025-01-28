Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D9C0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Lo0Lh/MzapeFduqkVM0aj57GIQ2o07xTwUQqprU3co=; b=jcrmFAadlkdXlk
	jZs13FLhXyq4QM9d8AoxXMHP9GFf9TEmh1bGnmry/Jno+aMgpAHYkoF1JrPw5R8wsE5gHLIOWHWYz
	791eFFozfcdWyrutoXH3Z21hOwc+0kCU2kBxrSnZ9d3f67gt1pF7oAXMQmQTfEz+7tAPIgQumSaHA
	GN1pGra2+18vkv55PO5qqAMIRpcscYx6gAGT5xvy5EpxpuovVgjrBfFDu3wrtwP3V7VjQHqGThPs7
	VunBwTmQ8oRa277FMK+tNGAn76eWqR/WxOtlvQOcyW13pzyoKAgVH09w/3TMRYtSo+yKAU+el0/hm
	9Gaiqgk+ZLN6Lqsbkr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZv-00000005jcx-25Lz;
	Tue, 28 Jan 2025 19:48:55 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZl-00000005jQt-1a8z
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 19:48:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250128194844euoutp01e27b315435d5341e1a7be4d5a5fa8afc~e8wiFtL0s1608516085euoutp01a
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 19:48:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250128194844euoutp01e27b315435d5341e1a7be4d5a5fa8afc~e8wiFtL0s1608516085euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738093724;
	bh=NPrBg1EbUpkFE9UokEkLR/r+lKVgAEIlIzXhayO3RBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbqnBn2LMQ1rxm8j5YlKN/w6SD8lUqt1lSYLpEpsoLBMRcBathSrNsHKdt8UN7TiP
	 PSNtt0hUpdAAYkhJHiU14VadjgYfq0KqNGgjrYffR4r0k3Fz5IcwFnVpeLhg5ASJEW
	 GBU/CcRRo31pPhWfqpatcgaXWFDxuHAJ9/Q1/NMU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250128194843eucas1p1f955e9cdd72f1cbc361f5cd884d72859~e8whS9BGL1987319873eucas1p1r;
	Tue, 28 Jan 2025 19:48:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.B2.20409.B9439976; Tue, 28
	Jan 2025 19:48:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250128194842eucas1p2aa8df6d985786c17432feca390861918~e8wgeoH5d2211822118eucas1p2J;
	Tue, 28 Jan 2025 19:48:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250128194842eusmtrp23a00bb92cc71b1d4dd971323eed34df1~e8wgd2cEn3008430084eusmtrp2j;
	Tue, 28 Jan 2025 19:48:42 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-1e-6799349b8e77
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.E0.19920.A9439976; Tue, 28
	Jan 2025 19:48:42 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250128194840eusmtip13ba4039be9215c6cbc98ff5e9e3c0d14~e8wfKUdsz2620826208eusmtip1o;
	Tue, 28 Jan 2025 19:48:40 +0000 (GMT)
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
Subject: [PATCH v4 13/18] drm/imagination: Add support for IMG BXM-4-64 GPU
Date: Tue, 28 Jan 2025 20:48:11 +0100
Message-Id: <20250128194816.2185326-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjNe+/tvZduwKU6fe2cmyS6sURgRLd3EZmLLLtuCRkmi9mHw0Zu
	KgKFtJbBZhxYPh0IOAEpzFZG+JpIRinSAhKw0KKjyIdFHJT+QATluziHAq5wcfPfOec5z3ue
	k7w0LrpGiukI2UlOLpNEeZNCor5jsXtX0e5Cqf9othBZBkowpH+mptCVZiuGNCarANl76zDU
	/3iGRFfv36bQeHMSgWwVv1JI1VFDogm1nURzmXYB6jMWk8iZZQKo3plMomrTMIVqHmswdHlO
	T6DSBiNAqRllAtRz8xM0bLcQaKIvE0epak/0vKmBQiu2PwhUNN1CobrJXAEyVx9GyS0XiP3b
	2Jm7KRQ7OTFBsDfSFyi2+W8twRrUwxSbafgTsLVVGSQ7ZGsi2UudoezIz2aM1ZX+xCZXd2Bs
	9rI/O3P9Dsmeq6sCbK9qgPpC9LUwMJyLiojj5H5BR4XHzeWjWOzvdHzXvRE8Eaios8CNhsxu
	mPpgBjsLhLSIqQBQe/U2zpMFAPNL6gQ8cQLYmD+IvVhpTOwi+UE5gEt5xRRPJgF0pLULVl0k
	EwAd5Zq19Y1MCgFT2pPAKsGZBwDWjxaTq64NzOfwYsnw2rsEswPqDJ1gFbsz+2HSVAPg896E
	La1d+Cp2c+m1yxUE7/GCnYWjaxh3eVT6orXLIVMthN1ncnB+ORheGdSuP7QBPjTXrffeCp8b
	NOuFYqBDP7/uPwUNmeZ1vBcOWZ+6DqVdAT6wxujHyx/D7HvTazJkPODdKS/+BA94vr4A52V3
	mJ4q4t07YV5m1n+h1op6jLewcMUalgO2q1/qon6pi/r/WC3Aq8BmTqmIlnKKABn3va9CEq1Q
	yqS+x2Kia4Hrb99aMS80gPKHc75tAKNBG4A07r3R/Yj1olTkHi5J+IGTx4TJlVGcog28ThPe
	m91LWlKkIkYqOclFclwsJ38xxWg3cSIW6KkMUafZOstOn8pT+izGdZosOVUZh57J9BXJsXsc
	lUt954e2hs23Li1kV3ZHPHoLqEIY+5448dGgE41f3RzfV1ii80pX4rYxk9Y63P/RLBk/9iRx
	cuqybbZN0Z9lvD+fNRpckN+D274U5pI94p0dW8p2/fVj7Imc7krNb9fpiWUf/RFL0LXFaeO4
	JOKMSh95Z+9i6NPZ+e881Wl+6f8U6HKNvQ5l/EAzcfDC22LLubJfnI++CXQOdo9YSi1WwYGx
	9OBPsxI02zwS37glLd1y8NumA9rtre+/pju279KHsqjPQp6Yb5yeDqWdPZsCXkmdivdqj9QL
	ajYdTnrVH36QEP6ON6E4LnnvXVyukPwLKTdAAUoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7qzTGamGzz5LGxx4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
	4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
	yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
	L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
	fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEv4/jyJ0wFqzkqzt66z9zA2MzexcjJISFgIrG74SxbFyMXh5DAUkaJxj/P
	2SASMhLXul+yQNjCEn+udUEVvWKUaLu3jxEkwSZgJPFg+XxWEFtEYDGLxN59lSBFzAJvGSWu
	z9wI1i0s4C0xY9FdJhCbRUBVYvPOk2DNvAIOEo1vdzBCbJCX2H/wLDOIzQkU3/R3BVivkIC9
	xKO3M9gg6gUlTs58AhZnBqpv3jqbeQKjwCwkqVlIUgsYmVYxiqSWFuem5xYb6hUn5haX5qXr
	JefnbmIEJphtx35u3sE479VHvUOMTByMhxglOJiVRHhjz81IF+JNSaysSi3Kjy8qzUktPsRo
	CnT3RGYp0eR8YIrLK4k3NDMwNTQxszQwtTQzVhLndbt8Pk1IID2xJDU7NbUgtQimj4mDU6qB
	aemz94aa91/Ldu+3XCZdU/lNvT5pcuqViKS9uvUM/Y0X3v1S3vJExuD4p+3ftiTemTsh6xpj
	Y/Jsbr6/O3ZnzpT13LPnw1T/1P+v1VzE7StO3uh2iK7kKTq9kq9HUf2ttNmx/2+OzxXy/19r
	sXXvl6ywTTwZFwvdGSI90l+KXJtdtVBn5r4Phq+bnTVXTBaub05/tONov9nZT15HHWobuHeZ
	OXvPvh1xTLB5w33dtbdiG08E/zhwoSckvm5Zku1R98VfQlck64TY3Laa/7PDNlA7vzrn2dOc
	1HUT5ppsfGcmMtPe4r/k5HTuwER+/075u+3Bq2d9tOFT2J++wnR7k3NDstbpSmYp7+c+/14t
	UGIpzkg01GIuKk4EAGMYpVy5AwAA
X-CMS-MailID: 20250128194842eucas1p2aa8df6d985786c17432feca390861918
X-Msg-Generator: CA
X-RootMTR: 20250128194842eucas1p2aa8df6d985786c17432feca390861918
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194842eucas1p2aa8df6d985786c17432feca390861918
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	<CGME20250128194842eucas1p2aa8df6d985786c17432feca390861918@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_114845_766197_DA0A8F25 
X-CRM114-Status: GOOD (  13.10  )
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

The IMG BXM-4-64 GPU is integrated into the T-Head TH1520 SoC. This
commit adds the compatible string "img,img-bxm" to the device tree match
table in the drm/imagination driver, enabling support for this GPU.

By including this GPU in the compatible devices list, the driver can
initialize and manage the BXM-4-64 GPU on the TH1520 SoC, providing
graphics acceleration capabilities upstream.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0639502137b4..cbd7f5d37cc4 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1474,6 +1474,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,img-bxm", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
