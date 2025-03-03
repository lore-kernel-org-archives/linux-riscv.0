Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3EC282D4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBycXvv43xlLW3thPUNUBxLUUYRfiKlwJNp5CONK5lo=; b=t+DJiWm8j1eTiC
	Om41ix3z5eYkeF11EzuZwF1Wc8/zpYady1eewSSc57cZETtrjM4nToXaQKM7+t5pKVDwdV4y98Oz6
	gZfI3j9Q9+6jPmo9Um+oq617kmrdr31Gv9B0wRqkZN/12r5+xwisLltjG+6H1/llqxGGVspKPACqd
	HWGIcjAVBRzSIAXsIPdz1aCp92zR7PHUL3+erOWzFRHFvxNSTDe8VtBqnZbLMt0KWM0UETo10SV61
	CGMzpcDf7vy8nAbwQjaTsIr6MeSD3AQxKGWK+5eoWuaz2Y9EKETn1lqN3DTQQdh+mh9/LPOaoAUr9
	X3Orb0y/Rz1Bi0pMU5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GS-00000001C6K-0S9Y;
	Mon, 03 Mar 2025 14:59:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GO-00000001C3B-2De2
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 14:59:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250303145922euoutp019b165f639185245823d55d6c63ee2cf2~pUvmTNRMx0409604096euoutp01b
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 14:59:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250303145922euoutp019b165f639185245823d55d6c63ee2cf2~pUvmTNRMx0409604096euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741013962;
	bh=GvH+KGxOLMWPvCT3kvkzzW6sq/iRIHCpZUQmHgtdxxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tq7M70wUn6VUGmTO1XN8lvHUQ/n2lzmkRDVi0wnDhv8RqxLtwI8Sw9EEVE0H0zLhA
	 Xn7UiTPJqUdmDGUgtNDt46LKLQig+dhXyV5W+8SXR2PtPQ2aIBB8KM9v8E2tPfVX/n
	 Dd2vuEnqC+EMvHnwk6jlSckyctnVsrLY6LUO5HXQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250303145922eucas1p2c9fb5c5a0c86d7c0e4e22530e031a541~pUvl__aG73212832128eucas1p2e;
	Mon,  3 Mar 2025 14:59:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 11.D1.20409.AC3C5C76; Mon,  3
	Mar 2025 14:59:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250303145922eucas1p1224cdbd627f5e3d7f854073ebbd93c42~pUvloWqzy3228832288eucas1p1O;
	Mon,  3 Mar 2025 14:59:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250303145921eusmtrp15f79bbff6f92ac43526e025605572ab3~pUvldkeGy2312323123eusmtrp1h;
	Mon,  3 Mar 2025 14:59:21 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-bd-67c5c3caecf6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id E6.2D.19654.9C3C5C76; Mon,  3
	Mar 2025 14:59:21 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250303145921eusmtip28416f0c951b2f94563d2b03444b42495~pUvkrdOt70060900609eusmtip2g;
	Mon,  3 Mar 2025 14:59:21 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v1 5/5] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Date: Mon,  3 Mar 2025 15:59:01 +0100
Message-Id: <20250303145901.446791-6-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303145901.446791-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7djPc7qnDh9NNzh8XtLi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOzuLxrDpvF594jjBbbPrewWaw9cpfd
	Yv3X+UwWLy/3MFu0zeK3+L9nB7vF8bXhFi37p7A4CHm8efmSxeNwxxd2j3snprF6bFrVyeZx
	59oeNo/NS+o9WtYeY/J4v+8qm0ffllWMHpear7N7fN4kF8AdxWWTkpqTWZZapG+XwJUxe+0Z
	poIpnBU9uy+wNTCeZu9i5OCQEDCRuL46sYuRi0NIYAWjxMb9K1m7GDmBnC+MEgffVUMkPjNK
	TDiylBkkAdLwcv52Joii5YwSbxoKIIreMEr0rT/KBpJgEzCSeLB8PitIQkSgn0mi78h/MIdZ
	YCWjxP0LZ8FGCQt4SJw+vQBsH4uAqkT/qs9gNq+AnUTXkSdMEOvkJfYfBKnn4OAUsJf41KAJ
	USIocXLmExYQmxmopHnrbKjrNnNKnLsL9ZqLxNEfMRBhYYlXx7ewQ9gyEqcn97BA2PkSD7Z+
	gmqtkdjZcxzKtpa4c+4XG8gYZgFNifW79CHCjhKX5k9ghJjOJ3HjrSDEAXwSk7ZNZ4YI80p0
	tAlBVKtJTO3phVt6bsU2qJc8JL48bWOewKg4C8krs5C8Mgth7wJG5lWM4qmlxbnpqcVGeanl
	esWJucWleel6yfm5mxiBafD0v+NfdjAuf/VR7xAjEwfjIUYJDmYlEd5b7UfThXhTEiurUovy
	44tKc1KLDzFKc7AoifMu2t+aLiSQnliSmp2aWpBaBJNl4uCUamASnVDr7se/Il26f/2e6svH
	FTZHZZ98b2m0qdlp85dl/Pw3+5vC1Dg1WAvEXhuuWzC/etvku1+P/njmaLO4QeyE4NZXVRuC
	1+iy9jS/3brjx4WX/9Ut1uuvW/OjXz+KM6b05uckmwlHli86mbuv48FOq7Prb2hN6J7KlGLJ
	vfZs79xKkflaycdL/OftYHLnXu/tcI07JOPVp6P7G0/Ky1z11Issjm+0ZVzyo447o8jh8qY4
	c83N7MEswqJhscX3D1a0OV7cfmjr9V6efbPOHkyW+aD2f89x5p5ZrXuMnT10GDi02bcqbX4t
	kKehfJDPtzFQ40u386LtnN9PGxgtaqwrFDE7fWGpCoPkFNb4jDtKLMUZiYZazEXFiQCDYMew
	8gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsVy+t/xe7onDx9NN/i/2tTi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOzuLxrDpvF594jjBbbPrewWaw9cpfd
	Yv3X+UwWLy/3MFu0zeK3+L9nB7vF8bXhFi37p7A4CHm8efmSxeNwxxd2j3snprF6bFrVyeZx
	59oeNo/NS+o9WtYeY/J4v+8qm0ffllWMHpear7N7fN4kF8AdpWdTlF9akqqQkV9cYqsUbWhh
	pGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcxe+0ZpoIpnBU9uy+wNTCeZu9i5OSQ
	EDCReDl/O1MXIxeHkMBSRomzE6+xQCRkJK51v4SyhSX+XOtigyh6xSjx93sXWIJNwEjiwfL5
	rCAJEYGFTBJXp2xgBnGYBdYyShy+eglsh7CAh8Tp0wtYQWwWAVWJ/lWfwWxeATuJriNPmCBW
	yEvsP3gWqJmDg1PAXuJTgyaIKQRU8uoTB0S1oMTJmU/A9jIDVTdvnc08gVFgFpLULCSpBYxM
	qxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQIjd9uxn1t2MK589VHvECMTB+MhRgkOZiUR3lvt
	R9OFeFMSK6tSi/Lji0pzUosPMZoCXT2RWUo0OR+YOvJK4g3NDEwNTcwsDUwtzYyVxHnZrpxP
	ExJITyxJzU5NLUgtgulj4uCUamCyT6jfqrlQzzo+c3HSC9a2Zwmehze8faa0f8dZxZcHdu1m
	mMPAPHkez1vHEP/nH049lzv2bQULn3Ne2dFbf1inzVArM/6hvTF8cZPZuoy7k1dlvo+Jf3lr
	4+s/v2R5fMXMuu6zGW4sd8+xL1tVf3pFZkZ7y70r6u9+TAquWFgbsvTVuw2ZmhXarwTFVvSu
	ruZn8GEr8P7aJP9ezOSoIutKu9db5UQen3T/rXXSm21f7ARZbpdQbUPvaKGph45tT5Pp2JV0
	sJtpFpPAgl7Jp2WLon4o3pjTdffPjJ7Fe5/6pUkLbG/0PqDe1atyLlrDJDdG7721ed/Ox3kv
	slO+f9mdMH3XS5tJZgvbDRIMNrMpsRRnJBpqMRcVJwIA8FM+TGUDAAA=
X-CMS-MailID: 20250303145922eucas1p1224cdbd627f5e3d7f854073ebbd93c42
X-Msg-Generator: CA
X-RootMTR: 20250303145922eucas1p1224cdbd627f5e3d7f854073ebbd93c42
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303145922eucas1p1224cdbd627f5e3d7f854073ebbd93c42
References: <20250303145901.446791-1-m.wilczynski@samsung.com>
	<CGME20250303145922eucas1p1224cdbd627f5e3d7f854073ebbd93c42@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_065924_839623_3E8235DB 
X-CRM114-Status: GOOD (  10.88  )
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

T-Head SoCs feature separate power domains (power islands) for major
components like the GPU, Audio, and NPU. To manage the power states of
these components effectively, the kernel requires generic power domain
support.

This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
allowing the power domain driver for these components to be compiled and
integrated. This ensures proper power management and energy efficiency
on T-Head platforms.

By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
for the power domain drivers to function correctly on RISC-V
architecture with T-Head SoCs.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450..83833ded8908 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -53,6 +53,7 @@ config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
+	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
