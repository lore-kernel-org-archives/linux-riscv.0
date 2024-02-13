Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50829C4829D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 00:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsgBSTGpiFnfN7B6wBHgObU8+1TYzWh/0sMj6DtMOe4=; b=g1Zl+4g7QtR9dM
	Pg/34NTJtRH9zeJBAUpyt5ehKyAgLw8+ujziTBlL2NWSEsliPEZ2G5jAMeCqNCfD+l4/mncY1O/2R
	VyUcSGkHaelVjiosAGrhpZOLM5wllTbT7mV6hPEi+I9clMXKNhrV+Ot2XQrmAwCla13cRPIonMEPz
	8kIfb3jInoTetif0sYxo4cANZ3rgkYkq+ka3WSk21I2eB3vjLN3dVMGt39a86FMq9LOvYSkf2PAle
	wo2hT/qWRo5YdQ2vhB7mEyq+RBc4SIREby/dt3vNxd8JrdMXL/k+WbPGnPrafUnyjrAorCtltDyB1
	wrM4YNOMjfrjuActrcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgWC-00000007MjJ-3lwl;
	Tue, 13 Feb 2024 00:19:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgW9-00000007MiE-47jO
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 00:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F8B3611CB;
	Tue, 13 Feb 2024 00:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFCAC433F1;
	Tue, 13 Feb 2024 00:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707783560;
	bh=coe5qCrIxtjBe9bpwxvduhBiOdnr8HhwgkBSSur6uTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLQiszL5Kc0zTXa7U1t6OSCiLEmFG8TJf/4bRtDL9lxXMpbviu44Oo5URs8MVzJnP
	 g0xgeH4iXFGFZXo064yl6TOe3xpsjcWw+Lc5TlUBokkKdXSNO+/zaWy7Wm9SBB9bpg
	 8Zym+iCDETVTAqDfdfwmCXOx17ijlfEvgcBmAov1BrFUPM/C3KK6GTaYdXTBYjfKe5
	 tWYyZmE0oec8MltlnD6DRNx7GawsrF+ip6uy37eey0RHdgChNpDco6HPslJkd70EZA
	 TtEmdqsSNd+sayhk3mWrIhzTw13AUjb8doetCSHMnDvK5+gIq+iUepmx7cvFxDrRYE
	 Y5cabrD+lBRvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Bresticker <abrestic@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 32/58] efi: runtime: Fix potential overflow of soft-reserved region size
Date: Mon, 12 Feb 2024 19:17:38 -0500
Message-ID: <20240213001837.668862-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_161922_091205_0FA48255 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Andrew Bresticker <abrestic@rivosinc.com>

[ Upstream commit de1034b38a346ef6be25fe8792f5d1e0684d5ff4 ]

md_size will have been narrowed if we have >= 4GB worth of pages in a
soft-reserved region.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/efi/arm-runtime.c   | 2 +-
 drivers/firmware/efi/riscv-runtime.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 83f5bb57fa4c..83092d93f36a 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -107,7 +107,7 @@ static int __init arm_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index 09525fb5c240..01f0f90ea418 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -85,7 +85,7 @@ static int __init riscv_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
