Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E24C7115E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AGogdTmRCzQTc0bRng2W/b7Ep36cPV5rz11CVMrcu0=; b=2J9z9UdM99p62W
	2flPYqrmHMjNshDpfPbyQsCv3VcHJdRaHpgxkR4YnbSpIPt8oEPO0hF+yr6ARtXEtlo8EU5GGJkt9
	vsehWOerL9E0l5U0hVzsdrR/QaHm8crmosdEBUfAschpv08XeL0QGxGtFlsCN0RW4plBnOJuRxKht
	z99uGT+n+mjF6AEkLNuhRryAJhQhXTGLQvX5JDiJlqxptVJMTuvXPrZ3610bTZlNSl9eTe2Se7xZl
	q/z7q4eVQ+1AUMROGoS3OP0rWSZtnu9SlbdY+L/T+ZCaX6sAorFOOpZVLkN0DkfMF3ugXyu2eEOw8
	CJEL3l8idLnWmg1C73Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJl-00000001cul-0850;
	Sat, 14 Jun 2025 18:09:25 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJe-00000001cpj-2UTe
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 18:09:20 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250614180917euoutp015074c5e944228344932224570020da08~I_x0Lgqug2160121601euoutp01E
	for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:09:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250614180917euoutp015074c5e944228344932224570020da08~I_x0Lgqug2160121601euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749924557;
	bh=hjL1qzi8D7La8kSdLlE+umaAk+GjyLvHnJK5f6ac4FQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=rNxhmXunDy3tyMaGIEJvg/elwWMNnxQdcHr7tbU7pmGA5SZ2idbAyDYEPF93myeqI
	 Ok3zIW3rIuZrlbE5GiAmtOG5OMu8eElIxrFjB5eANL6scLi1AYmfbp5uUV2aBwa1JO
	 vLpeVJvmV5XBdyMY/IF0zXxoyAECekDQIkBss9rI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180916eucas1p1ee5f075be14d88aa828ec4e55c26bae9~I_xy87uAa2846328463eucas1p1D;
	Sat, 14 Jun 2025 18:09:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180914eusmtip11a36fd21833595591f4f509910fb1977~I_xx41LnK2797327973eusmtip1e;
	Sat, 14 Jun 2025 18:09:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:14 +0200
Subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
MIME-Version: 1.0
Message-Id: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
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
	dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180916eucas1p1ee5f075be14d88aa828ec4e55c26bae9
X-Msg-Generator: CA
X-RootMTR: 20250614180916eucas1p1ee5f075be14d88aa828ec4e55c26bae9
X-EPHeader: CA
X-CMS-RootMailID: 20250614180916eucas1p1ee5f075be14d88aa828ec4e55c26bae9
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
	<CGME20250614180916eucas1p1ee5f075be14d88aa828ec4e55c26bae9@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_110918_900180_F548E981 
X-CRM114-Status: GOOD (  13.89  )
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

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..d1e5a18e8e84dc57452cd4bf0fe89dfb90a7bb29 100644
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
