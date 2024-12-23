Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D8DE7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk1NbN6fIiwO+O8QjHp6Q8UUP1NIfdptB/rrkLjRp78=; b=Y0KVWf+YAZpgWO
	AfKnk956CKOj7oMUsOFeyuckDAGnN4cE/rh14clI9yFulT7mKofWdRAVPcu3/Z3mzKrv7EodH2tki
	F1QyLpxZC8BbKTnmPakVGWg5jTApQjOZ/qEb1KSIiK1CfMM9s1FcszyRjT4aFqNrk4NvQYsITieTd
	IUYbduhOBfdDSIh67dVPYR8eNGkh5iU3MIkzNN3cpXERHmV9vc+jdGnkquxUN+SFLDKSDABDfJG/y
	TE59R0q+243Z2uGZ1cyUFXJsGcCEDmiMinc9zo3OQQd7lg6laOJFKCRXPfpKbaO/l0TYj/Rlxb6y+
	lvOW9EfFCpkhcQzKoJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPj4W-0000000A7Gu-0vHv;
	Mon, 23 Dec 2024 14:06:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhyu-0000000A1MZ-2RtJ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 12:56:22 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241223125619euoutp01fd6e2235d1c485706832a6f568d57f90~Tz6K-Rrxj0142301423euoutp01K
	for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 12:56:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241223125619euoutp01fd6e2235d1c485706832a6f568d57f90~Tz6K-Rrxj0142301423euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734958579;
	bh=nuwkiED4lPbpZKtXLcNkHTpLcBgX1IbFQaBo7zxmeMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ni6qYVMTUYdSTJ/IBBTcsYUh+xyMzvqrcR6OLSaDF0IUXPLiCVvacUKMmMnxY1sQG
	 E2Op7OkNs0dkbreKQGbVC8SgX8O5RQ/6PSynSGJDtftZgkmPSZioBns6wDX4JcTABL
	 gLWUcNEkjyK6EpzHgu8Xs5ov0f/jtljJ3nZcaGIo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241223125618eucas1p2f8a172811e17e89c2823310441f50f7d~Tz6KlYoEZ1761017610eucas1p2Q;
	Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.C6.20821.2FD59676; Mon, 23
	Dec 2024 12:56:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4~Tz6KIBSf_0550705507eucas1p2u;
	Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223125618eusmtrp13abc2d87fa4ff22ee885e3e20ea6c671~Tz6KG99-F2059320593eusmtrp19;
	Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
X-AuditID: cbfec7f2-4fd7024000005155-94-67695df261d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.04.19920.2FD59676; Mon, 23
	Dec 2024 12:56:18 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125616eusmtip2fa38fe9c5a1f5b4707663101a15171a8~Tz6IvQ0vv3149631496eusmtip2F;
	Mon, 23 Dec 2024 12:56:16 +0000 (GMT)
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
Subject: [RFC PATCH v2 13/19] drm/imagination: Add support for IMG BXM-4-64
 GPU
Date: Mon, 23 Dec 2024 13:55:47 +0100
Message-Id: <20241223125553.3527812-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTZxzdd+/tvaVJ4VJ8fAGn2KVONkUgZH4Zm2HZMDd7OPljw2nIVuVa
	mRRMC2wSN2EFprXgdDBrwVHQ0AqUR6E8ukIdQqmgHag8zKCgwiasijzUMCMbpXXzv3N+5/x+
	5zvJx8UFTWQgNzE5lZUli5OEJI9otC04Ns/GJ0rCfjdEIvtgGYZMTzUUqmp1YKikw8FBzusN
	GLr5aJpE1RO9FLrXmkWgAf05CilsNSSa1DhJNKNyctANczGJ5vI6AGqcyyaRoWOEQjWPSjBU
	OmMi0IVmM0C5x8s5qK87Bo047QSavKHCUa7GD/1jaabQ4kAdgYoeWCnU4DrFQV2GOJRtLSCi
	1zLTQzkU45qcJJjLx+YppvWxlmBaNCMUo2q5ChhjxXGSGR6wkMzPV2KZ0RNdGFN/4SiTbbBh
	zMlnYcx0Wz/J5DdUAOa6YpDaKdjNeyuBTUpMZ2Vbtn3BO2A1n8UOVXK//s2hIzOBglICHy6k
	I+F87hlMCXhcAa0HsP/xUy+ZB3BhoJv0kDkAZwq0+POV3gkl8Ag6ADO7n3hXXABWNv1CuF0k
	HQHHdCUct7CCziFgTmfW8gpO/wlg43gx6XYF0LHw0pwRuDFBi6Cx1raM+XQ0HK+yefPWQeuv
	15axz9K8Sjnk9fjDK2fHl9PwJY/CVIS7AyBt4MGbhd1L/bhL5D3YZE333AmAU10N3tprYM+P
	KsKDU+CYadabdQS2qLq8OAoOO/4m3WdwOgTWmLd4xu9A7YgaeK77wqH7/p4X+MLTjWdwz5gP
	j+UKPO4NsFCV91+oQ9+IeTADrcoJ8gewXvNCF80LXTT/52oBXgFWs2lyqYSVhyezX4XKxVJ5
	WrIkdF+K1AiW/nbPYtdsMzg3NRPaDjAuaAeQiwtX8NsFiRIBP0F8OIOVpXwuS0ti5e0giEsI
	V/NFCetYAS0Rp7IHWfYQK3uuYlyfwExsa1n53er0E30zaYMZ25yrtu9XfFreEfx25sffxp3/
	pMw3+9bl+nb7qD7M1ma5uNh5XvDN3rEnkUF15ZvyTOUnR0Wczr6Q08aivIyYuvqIh/v3KOem
	aj8I6lkZpO4XajYFxvxRm2/cdVt4Z2rYsi8ty2+hz/pGvP+9HSN/VQ69bI7I/zIu6Frp2of5
	/Xxn8Yd2i1Wh3rn51mctr8t3iw/roieiwkNElwrf33G14OBG7Mgu/bvSN7cPfvTK3l5NTupQ
	9dZSKe/O9/cvLh4de+kns+5BVuEGNTZ7uyI+nPcdUouiVxW8Ot+mD1jpivKrkmyMXWNdb6+P
	CnS5gu9iBK3Nexa8R4J6hIT8gDj8NVwmF/8LFwOxyEoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7qfYjPTDbofCFmcuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
	uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DL2L9rJlPBao6K8+eWszUwNrN3MXJySAiYSFx42sXYxcjFISSwlFGi/0w/
	G0RCRuJa90sWCFtY4s+1LjaIoleMEi8+zGAFSbAJGEk8WD4fzBYRWMwisXdfJUgRs8BbRonr
	MzeCdQsL+EscnvuTEcRmEVCV2LThGJjNK+Ag8WTNMWaIDfIS+w+eBbM5geJrum6A1QgJ2Ev8
	O/WBDaJeUOLkzCdgM5mB6pu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xYZ6xYm5xaV56XrJ
	+bmbGIEJZtuxn5t3MM579VHvECMTB+MhRgkOZiUR3kNCmelCvCmJlVWpRfnxRaU5qcWHGE2B
	7p7ILCWanA9McXkl8YZmBqaGJmaWBqaWZsZK4rxul8+nCQmkJ5akZqemFqQWwfQxcXBKNTCZ
	O7nN3fHBf3KFzOtsr5NvC0Lb/6312DDn1xZ91w0T37MU7tIS2/3KuK/3g+zautropNU1W1dy
	9+QG7VLdzhLS0y76JOldHEPr/otS1zeF7ltesl4yaZEPq6DF5kkHJOw73hjN+hY4M5bLZ451
	5cQ8pUynCX+c3f/ItzFmXbI5XrjS117vEMOZ5zfuLVZ22S1zNLasuecQ3/nnJ/tzG93CnN4L
	7vWcxH2Bc1dKy27HpzL79FMyhBkfTFBd+HnthdsnWG+FWjw7m+QVc5Dt1fJNGzcnTmqMZYnq
	2ixt2TVxXtleCf2tW/91LJdx8JqZrntMz3Xh2y1HmwM8pH/9iBR6ULvizppU+9P//svsL1VT
	YinOSDTUYi4qTgQAOKNO7LkDAAA=
X-CMS-MailID: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
X-Msg-Generator: CA
X-RootMTR: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125618eucas1p2ad4887b41bb99a9ebbd0b8c2e2aa4af4@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_045620_894924_0F0FE329 
X-CRM114-Status: GOOD (  13.02  )
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
index 85ee9abd1811..91af060bb3e0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1475,6 +1475,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 
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
