Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4DC54FB3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjO3arQ9BhsdX3Lb4SvCLRLREy4+8l7QPdUI4+stS+U=; b=15C1PTI1sKxIpD
	A9YGaWaPMk+45q25MrqzEi9r0zfwF58mBgGBkRpwJ1RvVhNqZ07xKzhTEjX32iU8owJilgK1CNP2I
	dpTYb7DOTYO2syphwMjjB1EL3EmK1CITJZ/cKw8Cby1Z5D+K7cL3EYxmA2E6eW6I7xPlx9bgVZg4I
	bSSc8XCCsFXBfzsDr8Oh3bCC193fCPUfj/DGy+rkKJTQfup0ktwWjIv0wO6kWP98/LeanIr13kwJd
	F8rYXLFstIgKVEgkMwcJ96jbG4wtZgSsZkYYQLPT3ovhyzU4sLwkLAwXhuIwIpH7M0iLurlz349By
	ypNnRIWZ8HE23/aysD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlfd-0000000GdYV-0Ls5;
	Thu, 29 May 2025 22:24:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlfW-0000000GdTP-35PE
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:24:13 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250529222409euoutp0221ff32c1b02e5bb8e1d394e675791dda~EH7xxG0c_2213722137euoutp024
	for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 22:24:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250529222409euoutp0221ff32c1b02e5bb8e1d394e675791dda~EH7xxG0c_2213722137euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748557449;
	bh=UtMJUuq6/j+HHS1BRexsXIMJEKVh/fKMbHv0hDIc9WQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Bo1cbFTC/L2jtBQzgLE4qcGuhQaPqUydLGvl1eR5kYcegBYAbznwVpewNQjOM+yLp
	 ChI8ODy+AELbT5s2uhpaO5+kogdPSCMAnn0n7Xlp2TAfEuLBdDDyMcftnrkQffezDa
	 ToCcohPrYIOFrDPqBDdbftHrF4VTUawqSTw8bmBE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265~EH7wSHjOI1565715657eucas1p2_;
	Thu, 29 May 2025 22:24:07 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250529222406eusmtip29a64f97e4cb0480e499cfbe8b47ef396~EH7vU3Abr3031530315eusmtip2M;
	Thu, 29 May 2025 22:24:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 30 May 2025 00:23:52 +0200
Subject: [PATCH v3 5/8] riscv: dts: thead: th1520: Add missing reset
 controller header include
MIME-Version: 1.0
Message-Id: <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
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
X-CMS-MailID: 20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265
X-Msg-Generator: CA
X-RootMTR: 20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265
X-EPHeader: CA
X-CMS-RootMailID: 20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<CGME20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152411_045159_5DDF7640 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

TH1520_RESET_ID_GPU_CLKGEN and TH1520_RESET_ID_GPU are required for GPU
power sequencing to work.  To make these symbols available, add the
necessary include for the T-HEAD TH1520 reset controller bindings.

This change was dropped during conflict resolution [1].

[1] - https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..bdbb1b985b0b76cf669a9bf40c6ec37258329056 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <dt-bindings/power/thead,th1520-power.h>
+#include <dt-bindings/reset/thead,th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
