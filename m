Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2EC5AC80
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSlzHBlapaYDiN3gm/vEPqJWhMEBIHwlZlrihjzSzeg=; b=qXOky3k0IsKUYV
	L/CBQl45/EEv9Xnbcr/VfKhz9Fhz/JYbqx2USO+XSlBLONmywofo0HrFCflpc/panxyddVP5PQxtE
	+VGbzkc1KMA0npijsKlqqYRz6vDa4A/6W2aZftYW1NUVmk9gT14n1wBGzLLdYwuQZ/1jNJn+LW4vC
	9i8me1IvdnAGueiVtu8/0PaBauaUa0PsuUdyIw2St7wwOYbxRE9Mws8H7mg4owMtRiPkO07F+EqgK
	2I9kkQ3WgjZH9un9jUyu2txcREX2FPIiqgKYj2rSHwl/jX5nmL1ksJDbV3I8qpl78380sMNda2evZ
	rMGuML0hrH2Q9IoGT+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3ND-0000000AJoo-19Xd;
	Sun, 09 Aug 2026 13:15:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3N5-0000000AJdM-2EsS;
	Sun, 09 Aug 2026 13:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56FE24505F;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3793DC2BCF6;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786281322;
	bh=xyx5Knwd9tvdkgwyRcBleIrC6UxSeyd22qUIH6XE8hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FdqUVxPSmT/6mIs0mUC4WA3/xs5InaT0U8e8MYR3oHXYVpKM/xd+rUe7Gd/obnco4
	 QSMKDCCUMGveUGB8Z3csXqubhj/hmi/cO9dzj46iX2l/55GtjkIId9feKODHyeoUlK
	 8gJA6/i1Kg0PolVjnEm+arsQEZtuOXiQEeI9U2/F1fhLxvIU59keGq95SRbY1EwpmU
	 1SiyOSFHGLXcUf7+JjfQvGXLChD5TLNejwT2iv6FfBnyynqYIF10PWvXbjwd4PvqVz
	 lzoHazETYMSy6tHmzK051kuT+aKx0OM9UzGmuX73RvV+Ve2TNNXSkDIuRzbsew6hj4
	 59+9VFH2+07NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B09C5AC80;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sun, 09 Aug 2026 21:14:26 +0800
Subject: [PATCH v2 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
MIME-Version: 1.0
Message-Id: <20260809-k3-display-v2-17-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786281298; l=748;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=Rd/W3ej1+Yyo/sB25RLlb++aIWJg859l4StFtHsgjK8=;
 b=CGNvvC3Y7+GnTLkC46shxSTTmyvXWSerSCcWunxZ10Ouix8etzsTd5apjredzhbTIAvwWPN9Z
 cFSspUHSKwXBqrI/zjyP4MCCg8pxADiKbQbfpxdfC1APH+UsunJJHbz
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
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
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Cody Kang <codykang.hk@gmail.com>

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>

---
v2:
- no change
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a40..c38853d69d559 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
