Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1976C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sRCDHN0eP6TdD2OpfDT0uhefFw4wOHcCOv62C8tazFc=; b=kPlrjmCPI/F+bI
	4FBX1BGjoo2h/mT2WsHU7E/NUW62C8UXfHc/8gFDlgdZhv6g8aIz2Z9SSZPGUOudXFUa7obyrsYPk
	Hh9o2Qznbe5wz0cU/jM6ZAYQiyeKZ7qxotmeVHbLU0xsWz3EfRWI+0guioHjaoAk+gQ1y7u+oZ3hK
	crWLzQyDuYZskMW855S0blk3T27gbDs6LCWUZWFX2tNOCPJ1BGzT9l9zgLINns87O6u2ehRuoZbrx
	oErwUcni9UmVFcuN9JQ/kVphmxTfvdIIdk0wU+kx+5f3ypwTgxEm/pK6jliWc/JWq98WfgP5ZpXOP
	NiwFNvQP5T5IyzqeNuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBBdI-0000000Cb5B-3UNS;
	Sun, 26 May 2024 11:01:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBBd3-0000000Cb14-22tD
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 11:01:43 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716721274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t2Uz48YRsUOXeGZ9DVsANdtln0IbDr3I+aFSlZRM3WI=;
	b=cJ+z3s7nk0Gp7f9D4DJzEQ/CuZwEJLOxzlVVbBIkA2z/NXZpKArFHcQqGF50fczr1iPJlp
	gT6hOT56hnY4ui78+Pwa9Sp2Dx+brf4ii0v0Evv3QFke+pvS0MaXaI/WgDiqi+WWIXclfP
	7rRkWQwKuy4u7Vwrik4nrKEF4FxiGL1dRM4wuLSjUDrisUUt/gDbPia9iErLESPSK8MdPr
	rx0fZmY+DQxZjDwIzoTNBAnCtv31ssmh2El/j1pIqyNrVnULVGymlLgIC9uahERdM0YBZO
	nfvFyCQ0M0Xo7uBZsZIL89FTBg57DtwG935Uq5gzbZxLSj/QoI8dBRFAZLOMzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716721274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t2Uz48YRsUOXeGZ9DVsANdtln0IbDr3I+aFSlZRM3WI=;
	b=9E6rWNlr93vWj3BRUMTK3cmikVL1VaaaPC9QIWtLSafLmmoHGrMk5F4SfqY7UVXXIfWpWY
	Bm8URRST7vSd3SDg==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel
Date: Sun, 26 May 2024 13:01:04 +0200
Message-Id: <20240526110104.470429-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_040129_701842_37E34347 
X-CRM114-Status: UNSURE (   8.26  )
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

HAVE_ARCH_HUGE_VMAP also works on XIP kernel, so remove its dependency on
!XIP_KERNEL.

This also fixes a boot problem for XIP kernel introduced by the commit in
"Fixes:". This commit used huge page mapping for vmemmap, but huge page
vmap was not enabled for XIP kernel.

Fixes: ff172d4818ad ("riscv: Use hugepage mappings for vmemmap")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: <stable@vger.kernel.org>
---
This patch replaces:
https://patchwork.kernel.org/project/linux-riscv/patch/20240508173116.2866192-1-namcao@linutronix.de/

 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b94176e25be1..0525ee2d63c7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -106,7 +106,7 @@ config RISCV
 	select HAS_IOPORT if MMU
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
-	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
+	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && 64BIT
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
