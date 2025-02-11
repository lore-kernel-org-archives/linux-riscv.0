Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F12C021AD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 02:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdqgnv/NXm6Z2BWc9b+BdGnRnG2ogLKsnZwaWLhPMFs=; b=tkfliWwMF6YEyN
	2duYJdIJ7/tBp2nZFy2ea+tVkEW7XsbLCYDIZ42dxk+DaWO56q6Ku9z5zUbbppeq6AzIN691dC8SU
	BefPA46lL9YnME1zG6gxKUtsASj8NOHkWBz0vACVILY+AeJfTj/Go/uRPcCWhu7MDvY0MkjHYI+w5
	ddfX71E+8RgJZUySmZEzx0IrU21tmyZmEzpcBRU0dcskCI1tYrRW3A+Su6kCCGq8oaHFrswZCpHbJ
	zZJEzmaEPnU/EJ2MHrTFHsqttsYlBs3tPi1cKay4GXNqG2fwoAZSvTtX9M7SGqBtIs9Xu91fiWVh+
	zTtU04ICxWio0+AarhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgCr-00000002IaT-1puQ;
	Tue, 11 Feb 2025 02:41:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thf6M-00000002710-1OEu
	for linux-riscv@bombadil.infradead.org;
	Tue, 11 Feb 2025 01:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AREZ3SxvGUX4E3zpSrv9DCdUqgN69hiuchma835LrEw=; b=bM+m2euxikmVa8hmdPV6UjRSAw
	AFxDNjAtddky/Jb9bULA63LL5JldCSbD/aUzPjfyXXq08+vP3RcEl1cAoycq5jFHVQbWNdXmP1Tvo
	Hmv4cCDBKy/U4uSj0jnU9iPrMLN2hX+d3UnW6CgYTZtXOC8YW2PlBO7b9PiD+ZeWyjqn6HLTT8plR
	y0bBgYkJczrQQZLh8nLQnTVa9vRtqNKahbK41LCgfWk268jrpRe4G4r1BZxigaxQucVNqy7vAf1Mo
	yPO3W3zDpL73AmYWT5A0TnvQ/66FvNCt6tFI4rmzNrPC59Xl13/EGq4DhrExE6Vkcz9cny9xxXnoZ
	/0depskQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thf6I-00000000QrL-1wPX
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 01:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 110615C5FEB;
	Tue, 11 Feb 2025 01:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A653C4AF09;
	Tue, 11 Feb 2025 01:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739237406;
	bh=O0uRPqFkoL/37XU7UWWZV0ARYrC8R2rnUfUL+3Jfoig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XfObNTjq5brsNiDHvtd5SxkxhFCwqrY200exrZ1lN/eulkwG63sJMAlWP/LjITiFq
	 MHOIroSOBLNmxey3MB57vZr635kTVVca5IuwLB6FM671PuMkhmLWM+GjxwYglZD0n+
	 i9nLL6mEymTdUZKwxYgFjFevNDXv1Zelz6DrJFs5PRJ/90xZmxO4gNg733EECEobFF
	 4oMmfA6TMmwCzX1hWGlfxRtfxo4yjKZxyeykSCh9w7KyM1c0hy/y81AeKh5BityGDw
	 ySdlf76h4l0RiyK+BLcUb5KaokWsvDL3GotwQLUEFBzkK5P75zAhaC8AaeifhOK077
	 0pkLJChfSgQHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xu Lu <luxu.kernel@bytedance.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 07/21] irqchip/riscv: Ensure ordering of memory writes and IPI writes
Date: Mon, 10 Feb 2025 20:29:40 -0500
Message-Id: <20250211012954.4096433-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211012954.4096433-1-sashal@kernel.org>
References: <20250211012954.4096433-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013010_997168_6DF86DED 
X-CRM114-Status: GOOD (  13.16  )
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

From: Xu Lu <luxu.kernel@bytedance.com>

[ Upstream commit 825c78e6a60c309a59d18d5ac5968aa79cef0bd6 ]

RISC-V distinguishes between memory accesses and device I/O and uses FENCE
instruction to order them as viewed by other RISC-V harts and external
devices or coprocessors. The FENCE instruction can order any combination of
device input(I), device output(O), memory reads(R) and memory
writes(W). For example, 'fence w, o' is used to ensure all memory writes
from instructions preceding the FENCE instruction appear earlier in the
global memory order than device output writes from instructions after the
FENCE instruction.

RISC-V issues IPIs by writing to the IMSIC/ACLINT MMIO registers, which is
regarded as device output operation. However, the existing implementation
of the IMSIC/ACLINT drivers issue the IPI via writel_relaxed(), which does
not guarantee the order of device output operation and preceding memory
writes. As a consequence the hart receiving the IPI might not observe the
IPI related data.

Fix this by replacing writel_relaxed() with writel() when issuing IPIs,
which uses 'fence w, o' to ensure all previous writes made by the current
hart are visible to other harts before they receive the IPI.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20250127093846.98625-1-luxu.kernel@bytedance.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-early.c      | 2 +-
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f5..275df50057057 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -27,7 +27,7 @@ static void imsic_ipi_send(unsigned int cpu)
 {
 	struct imsic_local_config *local = per_cpu_ptr(imsic->global.local, cpu);
 
-	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
+	writel(IMSIC_IPI_ID, local->msi_va);
 }
 
 static void imsic_ipi_starting_cpu(void)
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
index b0e366ade4271..8ff6e7a1363bd 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
 static void thead_aclint_sswi_ipi_send(unsigned int cpu)
 {
-	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
+	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
 static void thead_aclint_sswi_ipi_clear(void)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
