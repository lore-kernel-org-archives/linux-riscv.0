Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45B8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 16:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F7E60295
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 16:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66F7E60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yyTGwVtubjgQGIHgguAv5xerpVyuFT9EU7/6NJu1M2c=; b=X8TBUpiemQ+vQF
	RTVygFbNbS/BJ5CXPESbVuwu0sub3z/OgprKqZ2B2B6o0BhZUJhKz8L1U13oMRj8tFy5cA+ZNU4XU
	lt7kgibtqvK6k+4+wjd9kHE2wLTRFlvqoNN0mQKTaq6gl+kTSXfGyv2xi8NF5N1+asR2t0TjFVEtE
	DrPcqyzJGuJdo0e6ZGybhWF3khuHzIM8SyOtbGdV2bWVftOFW6MqUjn3276fUt7gmFrIrTiYKuXeY
	c8H9qf3QwmNAHOgf9kwIQXzVYAPTF77Lxi8MmKv+TXN9AMr16dJhBp14WpnZbazaa6CEsxqZTkITG
	XfuKl0yO8PYZGoGCvIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maKwE-00DYKF-8I; Tue, 12 Oct 2021 16:47:38 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maKwC-00DYJ7-0m
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 16:47:37 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A750B3FFF7; 
 Tue, 12 Oct 2021 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634057248;
 bh=/P/G2tQaU+J00Hwl+lWdgaHlFqUMRDqts18zTv/hnao=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wRhM2CKkIllKP94EtAEooVNUqc5wog9LqlVI2CGihLTtA50LpyDCXNHfJssriK+du
 o1zJTnuW1l5BAukX2YDsqDK0lRfej7OsyZJLq4NS1VDBsYZNThfFeB+uScWZVhSt4K
 qbz0aBwZrAtr/iUerZdoBEU+xeMdy52gH1M7bpklChMoIYAsZSmAtJ0UJ8FjpRb9Af
 UzJDs/yquAfxqo3hJvGZxwvYziWFlXb32mzpuuML5ViX0ZohjaST5Tw+/tOtRwclUa
 2FQDzTk4rlZtU4eVOLQlnP+5Y0DshVwQudvTFCBYCgW4MKE4ixrdB7b5pJViUDDaeP
 GGetpzaLavgOQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup.patel@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: defconfig: enable DRM_NOUVEAU
Date: Tue, 12 Oct 2021 18:46:58 +0200
Message-Id: <20211012164658.81894-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_094736_234455_70E670B6 
X-CRM114-Status: UNSURE (   9.05  )
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

Both RADEON and NOUVEAU graphics cards are supported on RISC-V. Enabling
the one and not the other does not make sense.

As typically at most one of RADEON, NOUVEAU, or VIRTIO GPU support will be
needed DRM drivers should be compiled as modules.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/configs/defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4ebc80315f01..c252fd5706d2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -72,9 +72,10 @@ CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_POWER_RESET=y
-CONFIG_DRM=y
-CONFIG_DRM_RADEON=y
-CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM=m
+CONFIG_DRM_RADEON=m
+CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
