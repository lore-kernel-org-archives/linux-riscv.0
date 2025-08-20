Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tc+qsnjIaKz9FDS9dL5mymzb6X4ZxmwuW1Pa9gDVAJU=; b=1I+fp19IpEq/k/
	VCAZKqUwc0lgWPJYc1MQHr4+QboZoyY6Bg3aFZKcGVNk3TsnEuUG6PXD9EPk96aTz6s/LHgb2HTLR
	PkyVN8QiOutn9pvlazK6rcJkUKrr4zy/5n0nrxrdzN2WF/w2OClFlN1CPIQICXRmyFC6ST7VX8tFz
	qPugTg9CK1Ydsm2kMfkZgIqjjdd+8FMUhBSO2p+w/fDJ56Pj4LKtwjuKA35AzXgFdQYQWeUAplG82
	dj+p0rmKxDHNaGnHdG3mNSfQWtkaviesRCu3BHGtR2VgxlIztTw+Nbtna97miYoL1rxUdulfb/pzq
	eT1/SzToHiz56AHafGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogbi-0000000DHJA-2LxK;
	Wed, 20 Aug 2025 11:03:54 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoec9-0000000Cobo-3jmw
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 08:56:15 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250820085612euoutp014359090493ef6b9ae88dbf6915cd1d22~dbdCoJmSh0817608176euoutp01t
	for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 08:56:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250820085612euoutp014359090493ef6b9ae88dbf6915cd1d22~dbdCoJmSh0817608176euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755680172;
	bh=o9pup7lxdlJYj1WCugUFlZF6W3E8/CCvLfzm1q+9rG4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=QufDc8xI4smr/1tvhd+SQFha5cIatKLD68bYKP9t8/viN5Yv4cLSeqkF12kCcGupA
	 u2ftjM3OCojP1cFELRvPstlvMqTrnirsY2W8nmDy8j3zJM3yIF077/rLWv/8eCSSNn
	 vZMJsMzC7o6pg5OJ0wOdTWHNcvNA3aVgv1Q9Mod0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7~dbdCKCdpp0935209352eucas1p1r;
	Wed, 20 Aug 2025 08:56:12 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250820085611eusmtip15bff8603433a6dbae2aca87e78707bdc~dbdBKMNHw3025430254eusmtip1S;
	Wed, 20 Aug 2025 08:56:11 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 20 Aug 2025 10:55:56 +0200
Subject: [PATCH v12 4/4] drm/imagination: Enable PowerVR driver for RISC-V
MIME-Version: 1.0
Message-Id: <20250820-apr_14_for_sending-v12-4-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
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
X-CMS-MailID: 20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7
X-Msg-Generator: CA
X-RootMTR: 20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7
X-EPHeader: CA
X-CMS-RootMailID: 20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
	<CGME20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_015614_194855_92523932 
X-CRM114-Status: GOOD (  14.64  )
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
