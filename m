Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D2CFD376
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wKLY/NF+MsX1KzzCsf1Wy5BHVLMLyBPXtocr0gHVsus=; b=ufb3uD+e0GYGA5
	7KIYiIxV9A1ZNYC6AnmMMY+tHgxn4cjeliJexY9qyB7f8FkYHltOkgTu3/oNqxeP+/skuejDciCh6
	eR7SII7z2mM0+OHcmJMOM/v4pT9KziSR0juCnOvJmC3QKh/EtjXlfXTJF87wcQjPNYr4sbvbJXOvR
	kofgbHq9oheOXFAmKKtdyCnzJecR2h3JfqSu/rcc74JUy/uFo0zxKHzbneSjqsxAjiJpWNWcBkPWZ
	CJv3EW8fb2/7qQukLg+Xg0cJGWoewQ5ExTdvUVyK4MKJJgEUzpxf4dCOs7Eu+iM0FH3enLN7IqIYv
	xlyrWK7STOw8K0HJdXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsG5-00000002jGn-2eyb;
	Mon, 01 Dec 2025 00:59:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsG3-00000002jGe-2Oid
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 00:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E616011F;
	Mon,  1 Dec 2025 00:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD258C4CEFB;
	Mon,  1 Dec 2025 00:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764550754;
	bh=UtNCZQGfXiv0Zt+URelTemTiwNO7k3Gp4DGo5wFTEPY=;
	h=From:To:Cc:Subject:Date:From;
	b=AtGql0ogojAUdZZkz8gBDqULnhBJLqCuwQ6Rgb0CIfUQlByTctDLHThasVZzZBoqr
	 j/mKaebBRlokEFFXOja8cadBjch04v6xCA+Q7JOcgnzSgLoCLtBGA8w6KGgt6d5uSy
	 WHJVg5+9QRlhreMZFQVYAO/k+Emhle2fw90elDo/X+USRYHK2Xs3N1oox+XFngf+rK
	 TY2zjuCoOBcfNL+G6SpBMdpfRySSK4eRclTGVt4rKXltSFK9FNtbxemtS1OBn4+OyF
	 /iFrfjrplXN3kvGTd5UoP6HzT3fm7R1fI8kooDG3ef9lxv3Lh3fjmZekMlFnMpZVMf
	 5rIp0jvbbsTVg==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	alex@ghiti.fr,
	charlie@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: pgtable: Cleanup useless VA_USER_XXX definitions
Date: Sun, 30 Nov 2025 19:58:50 -0500
Message-Id: <20251201005850.702569-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

These marcos are not used after commit b5b4287accd7 ("riscv: mm: Use
hint address in mmap if available"). Cleanup VA_USER_XXX definitions
in asm/pgtable.h.

Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5a08eb5fe99f..30d1ea93dde3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -124,10 +124,6 @@
 #ifdef CONFIG_64BIT
 #include <asm/pgtable-64.h>
 
-#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
-#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
-#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
-
 #define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
 #define MMAP_MIN_VA_BITS_64 (VA_BITS_SV39)
 #define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
