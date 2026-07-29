Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E6C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cakdqTAY1kn1yewleVToFoWKGXU1dR6tL1EXRu2dRaQ=; b=x4HLIYuvktH8CC
	aqVkZIvPBV5iJFTtSnvzBAS3aliGuQzqcmkl00a2hVkU1B2MjfwEhTvZAo8cI78rbl+T9SmzR2Ru8
	mmlQKhU2bGvXxRyXJG9uB0Ovn5ZeFCd8mChltTN7ReLhCfxyrfw9ba261wBXPYJkLyWyUCTmH0ZKe
	D0yHuX5dP+6QQ9IarIsZPKFaCqGhfI2aQWvNsvm9EiFyHvoppcWxnznbxOGU7NHnLY25WMly9yxbU
	w97FsfTjCvX1Xk5BZaJXicVtYD6NQcVerafK+PvUbS6m0gBJnw8Xxy+vz4Q11Xmo6Va/5UdHm5cta
	OzwplJAFKcpfe9C+BRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81c-00000008gx4-1Sog;
	Wed, 29 Jul 2026 17:25:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81Z-00000008gvW-2ETS
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Q2zj3qDB8hW0vtIwJ+k9HiOUKEfG8choS44rKubLpno=; b=Lg13oUslBHI5Yz6ROprlpErsNK
	e/fPKl6MyLFr1oXQXMtZZKJy1kfhpy75t9cl9EkVCfk/1UuT5XEaznhtxB4bGcjqen5Tw10B7gy22
	t7ZIDQX1MawVI/VpR7DWcSPMXnOdocsqV4jj7eVJxx9xEWO7sD56KzH4ajKIg7CmmRKCly4a3v8nO
	BpL0YKrAe+gwLDIvYaI+xvIMtJJLM7AZXCD2DNrYs/m1MNUTUckwmesMW/mGe04Gs8EdEnG8ousIl
	I7TJhA9OK3d9J2XF4hg7TF/w/0MCGPeDd+/BJPqIBCgQ/+HH+RtC83IOC75Oas+7JT5dz2Qs6l2up
	Y0DH6sTg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81W-00000002mWj-3XJO;
	Wed, 29 Jul 2026 19:24:54 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v2 1/4] riscv: defconfig: enable RFKILL and RFKILL_GPIO
Date: Wed, 29 Jul 2026 19:20:23 +0200
Message-ID: <20260729172450.1660418-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729172450.1660418-1-aurelien@aurel32.net>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_102457_576777_9AA1EC89 
X-CRM114-Status: UNSURE (   6.88  )
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

The SpacemiT K3 Pico-ITX requires RFKILL_GPIO to enable bluetooth and
wlan.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a40..8668aa31e79aa 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -99,6 +99,8 @@ CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
 CONFIG_CAN=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
