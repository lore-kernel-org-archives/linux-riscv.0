Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD4C0218B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GC4yMfjGU+6Jc91qMLgHD9gqc9kgVMDauUOWrSPhISY=; b=FQYGucacgnkKpc
	24Yu57BYoZ3GaN+ig6SGotpmuHK1N3QW68tFw6A4musOtNQ7VfXyPcJrf+0Cj/qLlbI7spgGb6u3X
	/v1VuQ5g3xA4VBWLwZkqmxTYNwbgr2AljIfMtXhsRbU0Q1IxHKIlsiseSOTfpU/XSHplkOd9mkmyC
	Lyy1/V0WmSimr4Z0dWLDdjy9tWtMrUcI90Jop4gmZwI2ZghJmghqDiCMdEPFp95KAntNjwr9/Z5Uc
	7J79stp0yotPvDYzNDvR8wSnK2akzZI+z+Y6PkQuvNplcmM97nCgN44rULthHuIVT7wPqSCaZCWjx
	AUwtD13lQmHaaR/zZ5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvUo-000000067wu-1RTw;
	Mon, 20 Jan 2025 17:23:30 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvT1-00000006720-2BM5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 17:21:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250120172138euoutp02e15ce3d8d8376c271b4c0c9bc88380ca~cdl0PSsRu1665616656euoutp029
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 17:21:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250120172138euoutp02e15ce3d8d8376c271b4c0c9bc88380ca~cdl0PSsRu1665616656euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737393698;
	bh=DgeFHCAIbeFBF+0nDHhjAGX/VqaqfX2KAeQLuxONDpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YM1YPDPLsXBTD6TLQRpQ9dF/7fGO4BX7zSv+Mfum6NsK4cQBzNu8tI4f/0NGn5LaJ
	 fOCtQiQ/A/yuBSKtmnuKsav5iYYcIucyUF92Jp3u+m2GRQYHRITjK4wcICiaj+BidI
	 8SmpG9ogkxNBDBC+RJbZFxm2IlwsTKjuCEOK/7d0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250120172137eucas1p2816a41e029cd0736f688b818382cb354~cdlzg-vLo1088710887eucas1p2D;
	Mon, 20 Jan 2025 17:21:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.66.20397.1268E876; Mon, 20
	Jan 2025 17:21:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599~cdly_ozja3181531815eucas1p2i;
	Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250120172136eusmtrp24b6c13d605134fee3e3dcaac7a00a88d~cdly91R020490804908eusmtrp2_;
	Mon, 20 Jan 2025 17:21:36 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-66-678e86212fb4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E2.D8.19920.0268E876; Mon, 20
	Jan 2025 17:21:36 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250120172135eusmtip1a3bbf8b8e44cde18b4db74e4cde13572~cdlxq3Mr00819408194eusmtip1s;
	Mon, 20 Jan 2025 17:21:35 +0000 (GMT)
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
Subject: [RFC v3 13/18] drm/imagination: Enable PowerVR driver for RISC-V
Date: Mon, 20 Jan 2025 18:21:06 +0100
Message-Id: <20250120172111.3492708-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTZxzdd+/tvZdmhWuV+A2ZhiZCJBFQXPIle0EyyF2yP2Axmpllrspd
	ZfKyFWWoAwZFkOKADQgFpQpBAhSClAqdBeVVwFEmjMc2XtvQ8RyFtqIu1lFu2fzvnN853+/8
	TvLRuPgO6UVHx53l5HHSGAkpJPQ9z8z7fTKvyoJs2W+g3rGbGGr+R02hOqMZQ+VdZgGaGtJh
	6Gf7ConqH/1EoTljGoFGq69RKL2ngUTz6ikSraqmBGjYUEYia24XQHprBom0XZMUarCXY+jG
	ajOBKlsMAGVmVwnQw/4wNDnVS6D5YRWOMtUe6OXdFgo5RhsJVPp3O4V0S/kCZNIeRRnt3xMh
	u9mVcSXFLs3PE2xnlo1ijU80BNuqnqRYVeuPgL1dk02yE6N3SfZ6XyQ7nWPC2KbKFDZD24Ox
	374IYlfaRkj2qq4GsEPpY1SE+JjwnSguJvocJw9873PhqXuGNSzBQCflz77AU8Fl6gpwoyFz
	CNY2TWBXgJAWM9UAquuGSJ7YAKzNaaN4YgWwWFeIbz0xpD0geOEWgN3FjwQ8WQJwZGFa4HSR
	zEE4c6t8U9jBKAmo7E4DToIzfwGony0jna7tzIdQM9C4uZdg9kKN4TnhxCImBOY3WAV83h7Y
	fn9g0+O2MV8fMVK8ZxvsK5nd9OMbnvTmUtwZAJlGIbTYtvp9AC1PJl2LtsMFk84194YvW8sx
	HsfDmeY1V7mLsFVlcuG34YT5+cah9EbAPthgCHRCyIRCR044D93h+PI2/gJ3WKAvxvmxCGZl
	ivkdvrBQlftfprla78pkoaX9GyoP+Khf6aJ+pYv6/1gNwGvATi5RESvjFMFx3PkAhTRWkRgn
	CzgZH3sbbPztBw6TvQVUL6wGdACMBh0A0rhkh8jTopKJRVHSr5I5efxxeWIMp+gAu2hCslN0
	s10pEzMy6VnuNMclcPItFaPdvFIxTe7+3H32CtrviH+tR+ruQ/Xhpm5d9pspniWP798IPP3b
	x5fmzoQ6jL1zpdLlcz5H++nIgcVCvK7Nr1HFRKWEv98Zqb30VonjXtJ6WVHnUAh62hz5w0d2
	zzOVzz6ZDhlfjj7vd9CqtQX/GuKLDH2Wx9e/CC27YxvzTpUY/vzO/V3vlOKngxHaw1WiwfE8
	VdFnypz8a/Xre37xEg0E095WwiOD9hXmKtHKZfuiZ5Youcr/4WFj8qekZtYCl18roGfc+/E/
	mvZGrHnIC76uCTpQpLwIEv3DBlv0i8WloV++bh3WTKljREUVu/ovJA2eiGv8vTBsRgMvDB9L
	WImoOO6F5UkIxSnpAX9crpD+Cxl3GstKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7oKbX3pBtv+G1ucuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
	uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DLOLDrE1PBLo6KiU/+MjcwtrN3MXJySAiYSOxqPM3SxcjFISSwlFHi7L35
	jBAJGYlr3S9ZIGxhiT/Xutggil4xSsxomMwMkmATMJJ4sHw+K4gtIrCYRWLvvkqQImaBt4wS
	12duBOsWFvCUWHB2I1gDi4CqxIJdv8DivAIOEhPXf2aF2CAvsf/gWbAaTqD496t7wc4TErCX
	uHO1mxGiXlDi5MwnYL3MQPXNW2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GJDveLE3OLSvHS9
	5PzcTYzABLPt2M/NOxjnvfqod4iRiYPxEKMEB7OSCK/oh550Id6UxMqq1KL8+KLSnNTiQ4ym
	QHdPZJYSTc4Hpri8knhDMwNTQxMzSwNTSzNjJXFet8vn04QE0hNLUrNTUwtSi2D6mDg4pRqY
	+G95/v7+M2GN7N4jc0T6JvAt//nVMD0j8Ebnw69OTcx/7u6YyV/nuEXWaMu7iocC3H01y56p
	Hb5WknxpsXhi62qNh7vbjzjUvm554bjj2XuPh75VH4oqbe3eTsuf9HLPz5qHFdHLOHIZ3e+V
	6EqbbFmdEKBq2ct8oOp7sO17zQc9G7/LFi47GuMVLPR8n8tbgweccwSXLq1aXPpp+syLbzk8
	Y5duilrT1ZfrvF5UjWHC+d+LE34yW1cXP90+5a5GwWKuqQZZx249/FKeyu53/OAyl/8LdwTc
	XvPr3ZTd7xq/ClyV73r0/fNr1SDrN+yP9v/Zq37s9PXyoLVOBzgSit/r6C5562Jyu/KxgEzb
	fA0lluKMREMt5qLiRACZNBB7uQMAAA==
X-CMS-MailID: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
X-Msg-Generator: CA
X-RootMTR: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
	<CGME20250120172136eucas1p2a8348fbcfdf42efa8c130d558381f599@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_092139_819877_F4131CD0 
X-CRM114-Status: GOOD (  14.08  )
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

Several RISC-V boards feature Imagination GPUs that are compatible with
the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
4A board. This commit adjusts the driver's Kconfig dependencies to allow
the PowerVR driver to be compiled on the RISC-V architecture.

By enabling compilation on RISC-V, we expand support for these GPUs,
providing graphics acceleration capabilities and enhancing hardware
compatibility on RISC-V platforms.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dc..5f218896114c 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV)
 	depends on DRM
 	depends on PM
 	select DRM_EXEC
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
