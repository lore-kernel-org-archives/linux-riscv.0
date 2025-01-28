Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16341C02192
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GC4yMfjGU+6Jc91qMLgHD9gqc9kgVMDauUOWrSPhISY=; b=3V/2Bp1XLVnGdj
	q29uYgKZ52F2isUK5GQCnCBYRqG8UFYl3ACcDoOMPhPwpF3/w2RHvZDqp5EKPZYRLIg1Hr2Jd/KBv
	bGrhJ5tT4BAJsIY7SGH0fIN5v7cx6vIZfl0R1XjNUDCx4d6Fhw5dsejPHMOYjQeMMC6aPU7F4fdZ4
	gpwlF5pLnS8Kqk8BKLLCxpycrwO09wQHE/WsE2Gz5zOMvz2Xd+fFC/feW6x6clG6sNXMcNSA8Rh4n
	Dl7khQ4JA12GE4nXN5sOp+BxLXcEgprUJhLR3kueQnlemRBEKnOzRKEJzuGLG/xR5itPxtT89+qcl
	jjzdT+UNQard52oX+Q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZz-00000005jiv-3Exs;
	Tue, 28 Jan 2025 19:48:59 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZm-00000005jSF-1EVY
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 19:48:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250128194844euoutp018b88af1296233f6acdae73d39a1effa7~e8wix5XlZ1348913489euoutp01x
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 19:48:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250128194844euoutp018b88af1296233f6acdae73d39a1effa7~e8wix5XlZ1348913489euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738093724;
	bh=DgeFHCAIbeFBF+0nDHhjAGX/VqaqfX2KAeQLuxONDpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gBklYeNdf4Pkkt+2Dlh4b7cILUrQPomfvaXQPcHaM7uh9XMwnLH4BVvkabsGDwKEZ
	 bJRVR6l/2PlDaC9e1/UkdQoRj/QifYCeT42V5lkdJ4x/Un1Enm0XRCoytD+IB4Feuc
	 hQ9j6ICfev0+StdOkmihiZ5xEaHdsf9g9hvvXwQw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250128194844eucas1p23f4a3b17539769a6f877ff79f0defe6d~e8wiXY7sy2211822118eucas1p2L;
	Tue, 28 Jan 2025 19:48:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 7F.F8.20821.C9439976; Tue, 28
	Jan 2025 19:48:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250128194843eucas1p28e5e735e526a153138c3539a9ceeec07~e8whxsUTf2889728897eucas1p2C;
	Tue, 28 Jan 2025 19:48:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250128194843eusmtrp2a72b81009b4de1f7ec2b077c9c70e06f~e8whw7Eq-0493804938eusmtrp2C;
	Tue, 28 Jan 2025 19:48:43 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-a1-6799349c8ca6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id CB.BB.19654.B9439976; Tue, 28
	Jan 2025 19:48:43 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250128194842eusmtip19dd4d65c97acee7a18cc5c676543c59c~e8wga_kvR0756107561eusmtip1T;
	Tue, 28 Jan 2025 19:48:42 +0000 (GMT)
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
Subject: [PATCH v4 14/18] drm/imagination: Enable PowerVR driver for RISC-V
Date: Tue, 28 Jan 2025 20:48:12 +0100
Message-Id: <20250128194816.2185326-15-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/1vVcG+ChsXFGc1I/BEipMt12jYzI28zLjnJnOxGRzDbwU
	IgVsZXMNOBgf0lLmYDho+ZQQQTZkMFpoERmfheE6BaQkSpEF0WodKV8JM8AorZv/nXN+53fP
	+SWXxgUtZAAdl3CWkyWI44WkB6HvW/oztHSPRhLWYBCgfksVhnTPtBT6ud2MoYoeMw9Zh5ox
	NLIwQ6JrD25R6FF7OoFGa8solNHXQCKb1koih9rKQ8PGUhLN5fUApJ/LJFF9zziFGhYqMHTZ
	oSNQdasRoGzlFR66/fsHaNzaTyDbsBpH2doNaPV6K4VWRhsJVPJ3B4Wa7fk8ZKo/gTI7CokD
	W9iZsSyKtdtsBNudM0+x7YuVBGvQjlOs2nATsE11SpK9N3qdZMsHjrITuSaM/bX6Gzazvg9j
	Ly6HsTM37pDsd811gB3KsFAfC0567I/h4uO+5GS7Ir7wiP3NOIslGelz+VPLeBq4QKkAn4bM
	HqidHCJVwIMWMLUAanKXCBeZB9AxMoW7yByABaq7xPOVhZlr7kENgJnacspF7ABabCbc6SKZ
	N+D9mgqec+DHZBEwqzcdOAnOPARQP1W6FknTvswheOWG1LlAMDvghO4v0om9mAPwqqrI3fBV
	2NH5x/qj/DW9abmWcHl84IBmah3ja54MXcl6JcjUe8BFhw13Lb8P+61t7t6+8LGp2f3oZrhq
	qMBcOBHe1826/SnQoDa58T54z/zPek+cCYENxl0uORJOjHXjThky3nDsqY+rgjcs0Be5ZS+Y
	ky1wuXfCS+q8/0LNtXp3KAs1hSvY9yBI+8Ix2heO0f6fWwnwOuDPJculEk4ensB9JZKLpfLk
	BIkoOlHaBNb+9uCKabYVlD12iLoARoMuAGlc6Of1mblYIvCKEX+t4GSJp2TJ8Zy8C2yiCaG/
	V1VHlkTASMRnudMcl8TJnk8xmh+QhinUQUFhB4+knJj0DGjfmzztH2w7+jQsWocde/d2YNQr
	b3+bXvvSQH/hmbdypi19P9069WxQMegXIorYfOSJuYbMNcbUnDwuagstCwn2+fFCZPUdluys
	jJ19uDV6APs8pSg2amTHSvnenuKD5zJM8pcfnbfHtRm3vendmtX7abOs7p2UyFRPXwM/MDFK
	2tR32bLFvqjcBBuDu/idBYG7FcoIZcv2alPe9h+Ku0vSAjYe/yX1iXV+lVdGDkf6dKqKy+4m
	Ne5X7+zXLelunhZdRccW9MaPej2n415LD226lHpo8sOiB4EKtLEgOm1DCz/ncHhyS/6+9z4R
	7q7SnD9TIwzPpQO2Cgl5rDj8dVwmF/8LQzAUxkoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7qzTWamG0xt1bQ4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CXcWDXJ6aCXRwVE5/8ZW5gbGfvYuTkkBAwkfj6fh1zFyMXh5DAUkaJjafW
	sEIkZCSudb9kgbCFJf5c62KDKHrFKPHoZyszSIJNwEjiwfL5YA0iAotZJPbuqwQpYhZ4yyhx
	feZGoG4ODmEBb4ll+3JBalgEVCXub33EBmLzCjhIrOyaDnWFvMT+g2fBZnICxTf9XQG2WEjA
	XuLR2xlQ9YISJ2c+AYszA9U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1
	kvNzNzEC08u2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryx52akC/GmJFZWpRblxxeV5qQWH2I0
	Bbp7IrOUaHI+MMHllcQbmhmYGpqYWRqYWpoZK4nzsl05nyYkkJ5YkpqdmlqQWgTTx8TBKdXA
	ZCV1punatg0ydvccXbZILt4oVDhTbcrPddVFbaVHHXad+Tm35NXrDMP+K3fzV/v7eXbLbtyr
	VLeJPWF/t6+/sqfW3tLgsDahZ+E5Uc+Nr93a9uX3jA/reT8JFdiKpRhw9AVlu8hkKk1W2Xzi
	/69pq/hNHjYtf7DLvtNwiqOehm8DX8DpuR+YNE3OsTXs/6e6SzjhlHZB5W+Prdv/5rLUdDit
	Lq51EvF/WX/+5aLzK5n2hfzufBD7TTNKiLnzqiPbsWXMSX4eQkHJgcLTgzbPXr/P1Wv1Srkt
	2hmFWmyzD0ZoX1sh8caNM3pJzooIDoEdaasWaM5/9+iZaeq3P9JvjQucPu6aOrPRP8pEJcla
	iaU4I9FQi7moOBEAyO0/yLgDAAA=
X-CMS-MailID: 20250128194843eucas1p28e5e735e526a153138c3539a9ceeec07
X-Msg-Generator: CA
X-RootMTR: 20250128194843eucas1p28e5e735e526a153138c3539a9ceeec07
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194843eucas1p28e5e735e526a153138c3539a9ceeec07
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	<CGME20250128194843eucas1p28e5e735e526a153138c3539a9ceeec07@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_114846_646298_FBFEC2AA 
X-CRM114-Status: GOOD (  14.30  )
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
