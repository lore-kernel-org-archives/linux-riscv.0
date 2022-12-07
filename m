Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D95BC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+I6hNcZOdKanE/KEa+ToE5KRcRDpC7emBDqXiU0+BLI=; b=QL+bLTYmcguaCf
	kN3mwcBLwHp1iPbpt6JXXo8ANtnXeazxSAFwJl8XNXkJCesX1/tKpuRWId8FYQqwVv6H5hwt6IaBn
	qDJ1A+E29YaLnrXdPckq9ZI5hryTE3zEa25ZbMiRLQx+CuT+gSYyFwOrx42ded5zOVimJeuyUfE+I
	J7l0TOUT7uxCUUZ1/YdrBjMJAUQ/ch1ZdQs7vXihaBlBTeVaZvSXw2lEacDr46Ae/5HRWS7XBUjCC
	dqGlJeVl2qB3r+7hro8e0ex9SSZL7RksvQMa9yWtZqvZAEeq7a92o0HxB7/T0HAxpZQB2BcMP6gq0
	lhXHe7ipXG9YqwK2Hd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qSl-00FtXT-2a; Wed, 07 Dec 2022 09:11:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qSi-00FtWW-GR
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 09:11:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C9A360B59;
	Wed,  7 Dec 2022 09:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5C7C433C1;
	Wed,  7 Dec 2022 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670404291;
	bh=+J9p7r7GyvB7mtC2Mdp1scaM+ReAbPChQfWFGWWj1h0=;
	h=From:To:Cc:Subject:Date:From;
	b=tl/xFYFy8V/+HKRLUzMbUO6Uee5tvFcSoxaeua2JXpWVeYh8NpSHm/4lKQONTO2w5
	 DpvaDNG1PV48NhUtybqbXDczK/IXTrnlGiv+mOtkAr2Lx7rPHg/X+9elCx2/ryxESZ
	 Vvht0+A7QKoYiAyNEiEyvzlGKSXOgMLuYuRFgpKlfGyaIo9kfB3nlJZExSQXbsKKJV
	 oOGJxqurKmJmyEPSXPWdukJtFIKY/n4of/0B5MpWU2k2sPXuuC/GeG60OuPndh7sLM
	 6FdsH46Ff8ySPucL2aQYCjRsgKCVIsWVami23clsBioEvq2Fzo6GjhmNxpSk7yBcpa
	 kzHIDBzQ6d8rQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	lizhengyu3@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Conor Dooley <conor@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Fixup compile error with !MMU
Date: Wed,  7 Dec 2022 04:11:12 -0500
Message-Id: <20221207091112.2258674-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_011132_607764_F169556E 
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

From: Guo Ren <guoren@linux.alibaba.com>

Current nommu_virt_defconfig can't compile:

In file included from
arch/riscv/kernel/crash_core.c:3:
arch/riscv/kernel/crash_core.c:
In function 'arch_crash_save_vmcoreinfo':
arch/riscv/kernel/crash_core.c:8:27:
error: 'VA_BITS' undeclared (first use in this function)
    8 |         VMCOREINFO_NUMBER(VA_BITS);
      |                           ^~~~~~~

Add MMU dependency for KEXEC_FILE.

Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Reported-by: Conor Dooley <conor@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef8d66de5f38..91319044fd13 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -496,7 +496,7 @@ config KEXEC_FILE
 	select KEXEC_CORE
 	select KEXEC_ELF
 	select HAVE_IMA_KEXEC if IMA
-	depends on 64BIT
+	depends on 64BIT && MMU
 	help
 	  This is new version of kexec system call. This system call is
 	  file based and takes file descriptors as system call argument
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
