Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91ECEBF61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZWWxiA9ON8OmeXZMSHKb4K/M1JGeGpnni4cXU3QDjE=; b=mkVIGqY7B2GTS2
	8ltO+3gQqEDBXPGoe5y/NrIPzB3//djXqkF6QkIcZaFNl5KBhAAVLY9qKjnyqkOQg2pL92kHDQlOG
	eJaMcj84XuTKKqZmOmo3l0+iDK+rGk4bt63MbMbObZPTBtq+4IZRTol9jvlnEir2wM1m0cKL7zlho
	0vDj9zC/jwnIH4A/0pdP6KZgKkxVz31vGvUwkCwMS4XmaxrdkpI0H97xuw+nPpeSIXSpC0+8oG5SB
	WJk6s2axO34tRcJxeI8uLN82JqqpkNgtQzNOWM6hkHZ97YzwKTYF7LL1yvjmywk86bbh2F8qn/GHk
	aQaKJp768IDntErl1Wjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2U5-0000000GQoN-1FAy;
	Mon, 17 Nov 2025 16:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2U3-0000000GQna-2ba0
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16958601EA;
	Mon, 17 Nov 2025 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1C1C19425;
	Mon, 17 Nov 2025 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398422;
	bh=TqRTEy/qLFgCM+vu7DBByxdMFUChNT1Vph4iBUkSkRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1tHN/938def847wr8qwPFAttZbh8oCcV6fRZr/qkPpheYq07ZbsotllxL8U9UswB
	 0WhzuJTdvdaBGoCEhH4aS5DcnLMxzl06yNSqzuCvVx1Qe5gpICTgazUAiCwjdbEK79
	 X8iCtFzwZXuIVCWmS0IP96uovpKDkU28tZOx/TdvJA1Rdm9mKTYMbfYdeOnRYKJdZS
	 4Y2l2MytBvZm54ecpzVV1vHeCdBK1iOaHzhrEgBR0L2JDnu5HzAfbOPjeCl8oXbNyH
	 Stj1Nu4JLEadtrDKDaw6OHMhEDt6pB3dSiIO5xAsaYs9o9wKTBBpJ0jTvrSgPxtQBX
	 NdzojMU/U0xPw==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v3 3/3] riscv: dts: microchip: remove POLARFIRE mention in Makefile
Date: Mon, 17 Nov 2025 16:53:24 +0000
Message-ID: <20251117-spill-backup-a596b1e6e28d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-paprika-tipping-e7bb3e211d6f@spud>
References: <20251117-paprika-tipping-e7bb3e211d6f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wpACx2j7gstwFBMTM6Ro5FSqQVplVkbgHL8QrFVce9E=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSwQwqHN8mms0+IBY2+aS/4Hrd6DJ9vST7FBFnYZ/la /62NZd2lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIWqgz/9G/t8hflMI39W1Vi /m13lM9dn7IJksmOD3+XhxocWGZ+heF/WFXijbltAh/6npy7ekLL4EDszhbmYheDI5mtq+fuFOh jBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Substitute user hidden CONFIG_ARCH_MICROCHIP_POLARFIRE by user visible
CONFIG_ARCH_MICROCHIP.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 3ff4a4f67dc4..43f91cbf338b 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-disco-kit.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit-prod.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-disco-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-icicle-kit-prod.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-tysom-m.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP) += pic64gx-curiosity-kit.dtb
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
