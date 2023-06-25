Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F8EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY0djfHA+L7hEL2WSZqsCAhFoUS+YMAp0PtqicOkUCI=; b=UKjpXgnbDLg7/v
	zBMfKkTP5wXYXWYUkoVWEndEvWSlRxV/aOEgwy0eNg6Ij+B1i6MUmKMAgLFyHH6f6KjzvuAF2eSTC
	IQzFRrlcBMrYSDaYD31ugbHfXK0NpQrkn+sBRxKgHz9KcSFRjBXp0HsH7gUalYpWW4OMPttZuxnxl
	GIrNYgLlBOiDKn8TyQRVPw0LtyiUqwgHfRcjq8YALQ1a6vcvXBwAyB2ukSgnFH73KMpshrH8HCZYm
	iYZAHVAUG8eKXORkaqgnmg6C9Wo2ZHCQRL/imFsX8orUxb/Vr2F0aMSZF5dJ7oNhPLfhp5ZvEnu69
	V8YP8RImqSfhhJtt4pCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQSE-00879H-2F;
	Sun, 25 Jun 2023 14:11:02 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQS8-008779-2a
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 14:11:01 +0000
X-QQ-mid: bizesmtp73t1687702214tvcj0zr9
Received: from localhost.localdomain ( [112.2.230.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 25 Jun 2023 22:10:11 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: lm7sZZPcOdayF/iPi2BR4TEQZ9thVeHoHrWDwBsJL4ncQ7c+lAS11zf54xTy3
	Fo3M0/o47zsFTuHKr0OZtWzSNREVR8bTElBgt+LPq2dRqUYvWaBDaY7slSNJw+xNRpQWEA+
	Rjv+tFEu+l41GgNbJ595Tpfo1ghEl1eY2WMgh2qBvy0mSydhFy6oAbkbAVm1bZzrsEpYThM
	wNZ8EOsZjsJoW9egl0Ac058twNt2/hFuBOikHE40Oz6wyQzk44N8LcxXwoDcmzlKWZUWryH
	FH200fkpS3gW0ZRaqqxfSyg8II+IuY93paiLI5RgaoFXH0rFo3Iaj/JntyYdOJtBftM01yq
	CGxtWz18la1yzqzwCO2TF510Ar3DePwU1NY0qSz
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3093032413490913072
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	frowand.list@gmail.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	mpe@ellerman.id.au,
	arnd@arndb.de,
	songshuaishuai@tinylab.org,
	rppt@kernel.org,
	samuel@sholland.org,
	panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	xianting.tian@linux.alibaba.com,
	anshuman.khandual@arm.com,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 2/3] Revert "riscv: Check the virtual alignment before choosing a map size"
Date: Sun, 25 Jun 2023 22:09:30 +0800
Message-Id: <20230625140931.1266216-3-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071057_151747_63B8B54A 
X-CRM114-Status: UNSURE (   9.13  )
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

This reverts commit 49a0a3731596fc004db6eec3fc674d92a09ef383.

With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the
linear mapping") reverted, best_map_size() only uses PMD_SIZE or PAGE_SIZE
for linear mapping and the phys_ram_base that va_pa_offset is based on
points the kernel load address which is 2M-aligned for rv64.

So no need to check the virtual alignment before choosing a map size.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/mm/init.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4fa420faa780..38c4b4d6b64f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -660,19 +660,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 	create_pgd_next_mapping(nextp, va, pa, sz, prot);
 }
 
-static uintptr_t __init best_map_size(phys_addr_t pa, uintptr_t va,
-				      phys_addr_t size)
+static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
-	if (!(pa & (PGDIR_SIZE - 1)) && !(va & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
+	if (!(base & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
 		return PGDIR_SIZE;
 
-	if (!(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
+	if (!(base & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
 
-	if (!(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
+	if (!(base & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;
 
-	if (!(pa & (PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
+	if (!(base & (PMD_SIZE - 1)) && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
@@ -1178,7 +1177,7 @@ static void __init create_linear_mapping_range(phys_addr_t start,
 	for (pa = start; pa < end; pa += map_size) {
 		va = (uintptr_t)__va(pa);
 		map_size = fixed_map_size ? fixed_map_size :
-					    best_map_size(pa, va, end - pa);
+					    best_map_size(pa, end - pa);
 
 		create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
 				   pgprot_from_va(va));
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
