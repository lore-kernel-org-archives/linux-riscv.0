Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70884C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fkdLXYoimVUJUkJCUi8VEfRALtlI7CmxLMnw2hrTXoA=; b=vRk9MQmcbze5MU
	k7nOseDX0XjK6nVrSJ5purHCMp+3IBnJPvSWA8PgFkOPg3f0S61twDGzdNUmtCSm4EKxm2ucajGDi
	lLLLgX+XhiG6vHPp3EziSdclWSanaiWMyBBuhhqdqmPdCTczuMWxa+/VnTxRmqW05QMjOaJtMDMN/
	EdKMQBCw+AtwQ7y8iCaj3eDeLu+TUY/5mTKImo1FdWBufg4LvO9t9J56cDhyqLprrBx/5oItlABJd
	IWEDGhPhZFeCedJ5admWFj6+cczMByQ4NcD/RLWUSw/XwrFCfdTktw8rrCaaZ1RIdnfGE56wg2P3w
	zAOVHTHbO1foPVbSX1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozg9e-002WYZ-91; Mon, 28 Nov 2022 15:34:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozg9b-002WWE-3x
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 15:34:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E9F0ACE0EA2;
	Mon, 28 Nov 2022 15:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EB5C433C1;
	Mon, 28 Nov 2022 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669649675;
	bh=S8NODlgq6yx6QV34sB+y37vgj9EEiEXVMGyItAX775s=;
	h=From:To:Cc:Subject:Date:From;
	b=f79Po3mBof5dcoujxSful43bPbrxJczrsl0eYLUe2UsHHGS/HlmTKuS3NWehoRbGb
	 4EwfJ+1RkWCVOoEsD/j5E2XMNm5f4T+6uuNySlnUkwt0k3BcWOipoLrMSB02ny3ss/
	 O4xCi5DS36CE4jorzan095InEXC30vhFd2wcqucxHbdJy8SpGkNyrG1n8EYizw+wIk
	 BEtonJAmwDZfOs0v8MF1Qx8ie56EY7LxJBxvNFlDK+mtpgXLexWLigZxoEwGDQ+gUH
	 9fenw6T7emij2c+mkWoew8caLViQntHvIcq0WyxXxaJ0IlELEzTevlHuvFoFNOBFEM
	 lx9WW97d2W8Sw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: head: use 0 as the default text_offset
Date: Mon, 28 Nov 2022 23:24:42 +0800
Message-Id: <20221128152442.3403-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_073443_356401_17169353 
X-CRM114-Status: GOOD (  12.64  )
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

Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
parse.") adds an image header which "is based on ARM64 boot image
header and provides an opportunity to combine both ARM64 & RISC-V
image headers in future.". At that time, arm64's default text_offset
is 0x80000, this is to give "512 KB of guaranteed BSS space to put
the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
to 0x0 in preparation for removing it entirely") pointed out, but
riscv doesn't need the space, so use 0 as the default text_offset.

Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
with u-boot booti cmd:
[    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
...
[    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
linux.

After this patch, the 64MB DDR is fully usable by linux
[    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/head.S | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..ef95943f7a70 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -38,18 +38,8 @@ ENTRY(_start)
 	.word 0
 #endif
 	.balign 8
-#ifdef CONFIG_RISCV_M_MODE
-	/* Image load offset (0MB) from start of RAM for M-mode */
+	/* Image load offset (0MB) from start of RAM */
 	.dword 0
-#else
-#if __riscv_xlen == 64
-	/* Image load offset(2MB) from start of RAM */
-	.dword 0x200000
-#else
-	/* Image load offset(4MB) from start of RAM */
-	.dword 0x400000
-#endif
-#endif
 	/* Effective size of kernel image */
 	.dword _end - _start
 	.dword __HEAD_FLAGS
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
