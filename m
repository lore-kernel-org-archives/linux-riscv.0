Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0203C7115D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwW+VkTocqSYUoj1TdMin2vFHJ2ZOV5XMM2AHoJZlLw=; b=n0w9BRdHaPRVrC
	vMuepjbuNS5jruv2v3Bo6QbFQPXuRdmenBYJosfvPb4vmW1UNda3XDrtiod+zQ9NGRFO7y92gD3XS
	SjI1MP0G9w/flRE8jTYkdUhH2x9uVVVJvRVuBwZw9/ezMeHQUeBlEdi48z6QLyH8t/mVhnFNBfsQc
	lOe0DyDmjzdM1ubhpiFSDIps8mPerr9Ua8aZhuOqFvoZzYzGpyWHYmvlQPNI13inpvACYNaWztuzT
	O61MgFthLNdz1+Xpc+UWyBcnq2kPPUMhQ03z2Rqi/A8MyCS63ybffm6enq/FVQPhlWLFfY2ofksW/
	8ykDzQMQIBv12DKhJExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJk-00000001ctw-0AnG;
	Sat, 14 Jun 2025 18:09:24 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJb-00000001cng-3nLm
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 18:09:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250614180914euoutp018bbd75d193360d970358302c461098fb~I_xxrlgJW0712307123euoutp01T
	for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:09:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250614180914euoutp018bbd75d193360d970358302c461098fb~I_xxrlgJW0712307123euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749924554;
	bh=03clYuLUe6lZViLZ7J3QsFCYeiK6qNUgF531eyi5Uj4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=SX0QDtosxymnYJ9fMe40jJ7GyFyQrdjDht4B+f/CXbtqecpM8vBi+fHVwXxzQl7oA
	 dB/iNF5DLL48nUjCe/HyaV3ITUiASudgcHTAp0oJyiTwKP+zd6rHNAgCSTLVjNk/a4
	 AY/74CQ4V2aBjeqJgGkR9IXVNyOmE0m6WsgdHYjo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250614180913eucas1p2554c9e8d5024c534565d3c1de58f2e61~I_xw2bPmU3062230622eucas1p2x;
	Sat, 14 Jun 2025 18:09:13 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180912eusmtip1e08743a9bcee9b7280e90351569ae07e~I_xvwqq-J1758317583eusmtip1q;
	Sat, 14 Jun 2025 18:09:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:12 +0200
Subject: [PATCH v4 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
MIME-Version: 1.0
Message-Id: <20250614-apr_14_for_sending-v4-6-8e3945c819cd@samsung.com>
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
X-CMS-MailID: 20250614180913eucas1p2554c9e8d5024c534565d3c1de58f2e61
X-Msg-Generator: CA
X-RootMTR: 20250614180913eucas1p2554c9e8d5024c534565d3c1de58f2e61
X-EPHeader: CA
X-CMS-RootMailID: 20250614180913eucas1p2554c9e8d5024c534565d3c1de58f2e61
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
	<CGME20250614180913eucas1p2554c9e8d5024c534565d3c1de58f2e61@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_110916_926651_AA8EA061 
X-CRM114-Status: GOOD (  12.39  )
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

Add the "gpu-clkgen" reset property to the AON device tree node. This
allows the AON power domain driver to detect the capability to power
sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
driver for managing the GPU's complex power sequence.

This commit also adds the prerequisite
dt-bindings/reset/thead,th1520-reset.h include to make the
TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
dropped during a conflict resolution [1].

Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d63072a1573431e51893 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <dt-bindings/power/thead,th1520-power.h>
+#include <dt-bindings/reset/thead,th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";
@@ -234,6 +235,8 @@ aon: aon {
 		compatible = "thead,th1520-aon";
 		mboxes = <&mbox_910t 1>;
 		mbox-names = "aon";
+		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
+		reset-names = "gpu-clkgen";
 		#power-domain-cells = <1>;
 	};
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
