Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF49C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLqTi+nNoGt+d+gHaUNQviEF7QqUFGpUX0p+I6Szy4E=; b=lMfEiSCcOfVoiF
	7X4xX+obiZsmG3f0oeVTktEghThYN3OiHUF2UZ23Zi2ctwFlD/8lmyZpV9H106+lUzw9mJvolj/G9
	B2D+qypmRNlle43GQP7oovx7FeiKxOa2SpOMzZniZJRWOqWGqk2xaiGv+/1HltqKeRM9wB/QZGzGy
	rInXrk5WDfms/f8afh6M7asboh4VW5KeQmAyJLgy6wD3YRkej6mGREFmlQVJIVNhJiSJSVoKxqguI
	qc276PZOaS+8LrZP6o6FSuSoLaFAaUY1MBkzDLlH/192Vx3NO415cxhyZIYRhldET9qPC7ATMj52f
	EbpA5Kd4f7D3Q+dVwllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGC-0000000BCSA-1ml1;
	Thu, 26 Jun 2025 09:51:12 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUizZ-0000000B9Qa-49jW
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 09:34:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250626093400euoutp02e84412e503388bacae2242c76b28e039~MjfVZpPzu0334803348euoutp020
	for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 09:34:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250626093400euoutp02e84412e503388bacae2242c76b28e039~MjfVZpPzu0334803348euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750930440;
	bh=Oics6uJobKbENIaO6NLm2nxzuP4RRsijLK+rKJOLJ9o=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=G+CSBMjrjtBYNTvd/WNwbBIPNX+9iFXqAYddavxpEw2nS/zhjcioAmLn257C7NDyj
	 A/MFwvHJaY4+jymjKpmRHaTYrxsJgaRZFM+wiVvQjFKo4HF0A3rZC6j7NuxYFtD4SN
	 huXoqOE9oZGRfgA+CMcuZp+gSfWoqkIz8CxJc8t4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250626093359eucas1p20a737f31b582ef0a2d54082eb172586e~MjfUxBO5l2275422754eucas1p2D;
	Thu, 26 Jun 2025 09:33:59 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250626093358eusmtip27941ec8e931ded71546ca1b6f2603321~MjfTtTb9x1338813388eusmtip2c;
	Thu, 26 Jun 2025 09:33:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 26 Jun 2025 11:33:48 +0200
Subject: [PATCH v7 3/5] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
MIME-Version: 1.0
Message-Id: <20250626-apr_14_for_sending-v7-3-6593722e0217@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
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
X-CMS-MailID: 20250626093359eucas1p20a737f31b582ef0a2d54082eb172586e
X-Msg-Generator: CA
X-RootMTR: 20250626093359eucas1p20a737f31b582ef0a2d54082eb172586e
X-EPHeader: CA
X-CMS-RootMailID: 20250626093359eucas1p20a737f31b582ef0a2d54082eb172586e
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
	<CGME20250626093359eucas1p20a737f31b582ef0a2d54082eb172586e@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_023402_626067_E311EEBC 
X-CRM114-Status: GOOD (  12.12  )
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Drew Fustini <drew@pdp7.com>
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
