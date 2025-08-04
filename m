Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372DAC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tc+qsnjIaKz9FDS9dL5mymzb6X4ZxmwuW1Pa9gDVAJU=; b=xhtFcOzxNFCJ3/
	dN/0kF9pPSmrgmYg35MUL+ROzT4byjH88wVmzObY8i2pKmnZekOzKgIg4rEYmMfWDAQhD/mCoIH7h
	ZKDZOs8h8tb0gtx2v3qIfWJW4v8GE/njVSKkcNwp2GOrKyY4nD4Fz4W5DknSbKTa7EKAXy1tG8ujc
	yGIiZujvQXtKB16NWAlcLRjOD0YAkKwxZ0KL9e0pY+Fy7RRHAgZgKsvom9DSZsAOakknXT7+NrhiP
	tyo8djTTl7JXiOqVaAhPxnePbWYRMSSv7i8zGDkZWcvTNPqPQbsj0wh9IsKK6I4w198W9AmRIC8hB
	UP7G8bozuPwMdDn9vq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4YX-0000000BStY-0qNX;
	Mon, 04 Aug 2025 23:25:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4YS-0000000BSq6-4AIF
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 23:25:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250804232517euoutp02738b652ceec46985cf6726f31bbc4681~Ys-SMtoDH2716827168euoutp02B
	for <linux-riscv@lists.infradead.org>; Mon,  4 Aug 2025 23:25:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250804232517euoutp02738b652ceec46985cf6726f31bbc4681~Ys-SMtoDH2716827168euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754349917;
	bh=o9pup7lxdlJYj1WCugUFlZF6W3E8/CCvLfzm1q+9rG4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=GbWU7GMzBpnaVF/JeFaJuZ8dnDtibwhpOjzNepMDyjEmvwFj6aUSiTpsfjtC9jRG/
	 bIKrS+ZeWJoP8DdxhBJv73IIjspXQMwEdsDFzFPUa43HdolTXiAQYI8mCb4ewsN1sr
	 GNbC9Lm5cW8ABWj/9rag3TK7dy+emxh0ITSOuN2E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250804232516eucas1p1c50313f830f44571e409fba8c5d5fe79~Ys-QtyptJ2311123111eucas1p1o;
	Mon,  4 Aug 2025 23:25:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250804232515eusmtip2bd8f5ff41059da14ee0285cd5cde078e~Ys-PtrLgG3204032040eusmtip2d;
	Mon,  4 Aug 2025 23:25:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 05 Aug 2025 01:25:04 +0200
Subject: [PATCH v11 4/4] drm/imagination: Enable PowerVR driver for RISC-V
MIME-Version: 1.0
Message-Id: <20250805-apr_14_for_sending-v11-4-b7eecefcfdc0@samsung.com>
In-Reply-To: <20250805-apr_14_for_sending-v11-0-b7eecefcfdc0@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250804232516eucas1p1c50313f830f44571e409fba8c5d5fe79
X-Msg-Generator: CA
X-RootMTR: 20250804232516eucas1p1c50313f830f44571e409fba8c5d5fe79
X-EPHeader: CA
X-CMS-RootMailID: 20250804232516eucas1p1c50313f830f44571e409fba8c5d5fe79
References: <20250805-apr_14_for_sending-v11-0-b7eecefcfdc0@samsung.com>
	<CGME20250804232516eucas1p1c50313f830f44571e409fba8c5d5fe79@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_162521_290110_80691949 
X-CRM114-Status: GOOD (  14.75  )
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

The RISC-V support is restricted to 64-bit systems (RISCV && 64BIT) as
the driver currently has an implicit dependency on a 64-bit platform.

Add a dependency on MMU to fix a build warning on RISC-V configurations
without an MMU.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..682dd2633d0c012df18d0f7144d029b67a14d241 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,8 +3,9 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV && 64BIT)
 	depends on DRM
+	depends on MMU
 	depends on PM
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
