Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BCBC7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IJs66jhBIf6tQvS5PGJqJXihODD52ZMoPXCoJabBMM=; b=jkQkhn+s/1Zdre
	Enh9xFb/dLxr9g/MFusaxyOd+2dnKd2WUqUZO6hDwetH7dki6jY+VcZVNlJYaC39s4UyWQmPb8Gei
	MBuWKwYu0s5VAkKOFQZzZs75SLSFO24VBw/+yZuKOFN6+8NmyK7u8g554LSimx3hEphtW7l/9VRP8
	gUsjhFzCYFcua/8/vg2W4jZhINTbIY/9R8y86Q8VSexjp3UbKrlgi16es7d/IswCEhAAtgihSs5zY
	P5DRHA0Q+QCrKBhRi+YG72ERk4FWMcw2mHCrGO+UgGXPG6qDBnONYOjr5/N15EC4Ni5fYyrzQEkoN
	m2cQAjB0r3fnX6hKKlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh34-00000002qJS-0ZKV;
	Mon, 23 Jun 2025 13:17:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbT-00000002XVr-0ZIE
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 11:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4KBq3towXlALkf8L/GsfuKalsYvwb01P2yDpfTNY1cI=; b=OPbdowGFOHdm1IJUfcCerKpbe9
	5+ZFFEyB+QOpAcrjm9jcSuM5qR5JdAChwXY+chMh2DOv/ubgjYdxV9sb0bUCZxE51pTzLlsoXBbl2
	GPY4G5VHegTow2k0UyFNl3PH0AOfkIP5P8fX07IFWjDGBg5TXRG37OhKmZGzVR0QssFaYugIcQ47w
	Xn1Da3UoRjdRV5WYOnnsACuBm9SQT+E2ArF9kMfs0t2pKIs3CL1/GzybiuEZ7Yuwrtva32OEJ/YIq
	04I+Ve8TG090OwNoCLnMQoM/8keUNaY1x/tXXBNbEPrfGpmJ1qUz67HJf/DIkWqUmnCHed2N05e06
	egJI6Q/A==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbQ-00000005Cey-0WJX
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 11:44:46 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250623114440euoutp011f45382c9a4464e97c10f12f9a403ac9~LqVkjg0Kb0078700787euoutp01a
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 11:44:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250623114440euoutp011f45382c9a4464e97c10f12f9a403ac9~LqVkjg0Kb0078700787euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750679080;
	bh=4KBq3towXlALkf8L/GsfuKalsYvwb01P2yDpfTNY1cI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=GBjkxg3MAq3D58gQ8N/ItNYBQCNLtIS29fEK6dzMtcX8eduMhpT8NZ1Haq4IYNEia
	 j0nXsRIMcRoFcfLPInVN2YGLeBcAjf1BbMkHE9UflGMuiuG93LtsaFq5UEE29K8oos
	 YwvjKwmxSfZCSdBMo04ouyK8TVW1eLhrR79up1z4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11~LqVj7QSKC0446204462eucas1p1-;
	Mon, 23 Jun 2025 11:44:39 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114438eusmtip1bc757cb4b724f616bacd29cae7402150~LqVi6EDxK1647616476eusmtip1i;
	Mon, 23 Jun 2025 11:44:38 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 13:42:46 +0200
Subject: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for RISC-V
MIME-Version: 1.0
Message-Id: <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
X-Msg-Generator: CA
X-RootMTR: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
X-EPHeader: CA
X-CMS-RootMailID: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124444_325191_B74C2324 
X-CRM114-Status: GOOD (  13.88  )
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

Add a dependency on MMU to fix a build warning on RISC-V configurations
without an MMU.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..a7da858a5b301e8f088e3e22f5641feb2e078681 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,9 +3,10 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV)
 	depends on DRM
 	depends on PM
+	depends on MMU
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
