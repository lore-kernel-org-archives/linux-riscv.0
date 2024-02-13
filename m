Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAE3C4829D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 00:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IWu7PgiDQahfMZ58J7PQPMO0VgN6nxb0IV+pb5KnnM=; b=4sneuv5V7SH/Dt
	MaGS1SnL0dcJbrsSx2Uf+tFscyq9h7Em7T8SxYOQFM9/++908mR/PXyEMFzSaJja+WbCo/QsRgIhP
	QogP5qe/RyLASCkstW9TmreNhOpnuDpD/bC3rHnKY6+cZCnbD3V7Jp8It2zGa+UCGZHc6m3Dz1l8D
	ncfFDR3aCos1ciI6Z4qgE7tzjFwrKxJ/apLn65U3PxqA0aH3hmzl/kYnV0G/5dsjWpeR+pTqpO44E
	f4DOhTGR7Swm3Ftd5bWD8d1DuJo53VmzDC2ekhTv86X1AD49iIuuGEVcDj4NeWGUYuF5l+/VP2wAU
	j1fkgyPt2TYTrcLPJUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgaX-00000007OJV-0GE9;
	Tue, 13 Feb 2024 00:23:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgaU-00000007OI0-2PnL
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 00:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16E78611E0;
	Tue, 13 Feb 2024 00:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907CEC43394;
	Tue, 13 Feb 2024 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707783829;
	bh=Pn07thD0aJ/gRCqlLhA7LBD8t5v3filXzrlPtc3D2NY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MU5bHa6iYrRu+3fJSjNoiHqTiQGQ0lBMi4PriHx/IFoogBas4y0Se0G8wkX3yyoUb
	 V8XRN24wP5ndF6ha64rk1USUWu3CDrrI6WVDKgJAV9Z6dbZkUrEbWHzvzZ7QvVa/ib
	 xDHpzas8Hl3PSkSvNy9iM+4muWQKjeASNEt3X01huWyI55DVoqs+sBkAIICUrm0EFG
	 /KjR7j8Vsw59dJtUeKjnO8R2WY9PtDkEz1NDJnhAG4v7PNi1XrVXrUeGI9zMQUX8iH
	 V7ej8WJ1J/NF0xQ9c6s15+yhO39KMOtC1VsZuTWZppu+yMBOeMAEsdszlGpWTklcve
	 WHnJG8F9Fsvvw==
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
Subject: [PATCH AUTOSEL 5.15 14/22] efi: runtime: Fix potential overflow of soft-reserved region size
Date: Mon, 12 Feb 2024 19:23:16 -0500
Message-ID: <20240213002331.672583-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213002331.672583-1-sashal@kernel.org>
References: <20240213002331.672583-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_162350_710894_4C2623E2 
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
index 3359ae2adf24..9054c2852580 100644
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
index d28e715d2bcc..6711e64eb0b1 100644
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
