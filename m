Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E64C54F4C
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqZDtzEAa3GMH86TRmaCiPdZoFNnWopoXKzF8M2wmFo=; b=4Jji2i6KOfdsDM
	ZYrfp9MZJvCwI85NCv/eRbeGPw/ZD/OEM3H08NdAfek7m5j+Y0bpktehESn+l+jrdZHdB8DdIJEbR
	49iSjbeo4SEioWnVSpuyC2M9RH4HmVTh0e5bjkL1puU87vZ6Nqpw1BPvtsjmyU4RruHDJgbhdpQN+
	rO8xTM5jleAy1azsqASGqNXjVoHGY5PLfZAydkps1r2m75G3QmdLKqE8/c7vuNmElZt7kjsm+cEkM
	vEBvF57eMLQHd2Uni3TQF96+GRwLUNPhm1aDMOKpO/CX3vJ9Gv4arc3g4uUDXSEsMpmJ+v4VwJkOj
	Bnxgy2ixObUWie41KC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMH-000000000c1-0Mm3;
	Sat, 25 Jul 2026 04:51:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMA-000000000TC-2yDE;
	Sat, 25 Jul 2026 04:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E10451B0;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46B3BC4DDE2;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=qlqukEpeHs8YwqY+ZJ5WGtGqzc9V6xyMS9RvFf7xyE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cBwMyvs8hABqBqxP2ExG6jNaoEfeM2i1tFpnSpaJD+wnQaUCtVlwYJTRyGXCkFzie
	 4XfvpO3iLzoNpBV2oNCSUgZhf3q58nsdpJ6WQqT9Is/BfFWhD4GR0hI1y53x4YRHyP
	 gR0n/El748wIZah0OTvWQC/InMJF71bfgBZMYRZJtlIdpbqmOTQasbcpFrdezIN/FA
	 E+PNbhkI1sVp893Y13jBOSQVP1Z0O0ykiPo5quEd+9o9XgNh+BnKEZYgse/FCnOn2P
	 bnS8LksXyp1SONzscqQ/bDafzXszrRrgSij6XwNyNgGCKCdcNYTQgaTHmSBiDswMwg
	 aYr5pmVPqNE2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD52C53200;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:26 -0400
Subject: [PATCH RESEND 17/17] riscv: defconfig: spacemit: k3: enable
 display driver
MIME-Version: 1.0
Message-Id: <20260725-k3-display-v1-17-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
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
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=721;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=w6ttYgU0lJiv/SJUYAPaXSKPoe0j2NwHgYQpCKODV1k=;
 b=RuOMqHCM04aU30sdKNUndT2uO/g5y9lCEBtEuaOH6YwkM7KhTjs107cobdqryAZ8eAgMPP1nw
 zlPieTKZ9I1AuWDVZhnYUCrtiEEjAGEEmd5ziVnwjkSjXCIRE2qb+n7
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
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
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
