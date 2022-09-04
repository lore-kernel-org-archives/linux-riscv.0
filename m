Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4862FC6FA82
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vmv4LXaDZWdiiXteNXLOUuvw3BdGYvPg13aHTDO0Pw=; b=If9KRGdkA+rWKx
	5p4I+PN2uoBPYj1Ucz1dUy4NHUhGhDMaQ7VxAAFAOmwofIFWwZEWW8XMCPHJIP+pc8cIRyVlOrzAj
	A3mUs9jDsfARns7HdjKx76up84AEs6ifxEctNhcNWnEpFO3ghtBRFEpuY4+edO7wBr7QUa361gwOZ
	gw2U2zJvgpgXEaUD76id9DNLHMxSdbtdnDLy2djbWdgzEzpAZksONq7I8KWEo353biXtX5kkkI+z4
	9EFZ9/m9pbxa3EkzqqamnLHIiDW2hu2z7u17I7jOfYv0ITrExR/lAbJZYtQgWCNQGMtCdnMzPnGyv
	xV2WRQj0wt2UJj8R/eKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2s-00HOWF-KI; Sun, 04 Sep 2022 07:27:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2q-00HOUQ-D9
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 07:27:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED374B80D2E;
	Sun,  4 Sep 2022 07:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9BEC433C1;
	Sun,  4 Sep 2022 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662276469;
	bh=SH3odaE6GEvQpUHPIHgK0HsZ+i7j0oLK9zGMjCOZqwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S6Uk2vKyyFzTRAbEMqBc9RwhWgCbjPNCSWWgEp4wtltpB7dH6Mu70SuSR9Qg3+PjV
	 mNl5a2rjf1CiO5A1lOMdFTMExg5dGJV1Hmwxugay2z4gkOthjQobifP0bfVEVyCIqB
	 DytWtlElaR96/73q9c796K1jtpxwIGHpj0C2xTISiFgVMmdahNI7Tx7fIjGQDn+6kI
	 b45Y7NW/QH39kVOfnwgJA0lnt3pof4/Rr4Rz/iHgYtYsA8gkfy772XT/6JBgZHj/2T
	 xjIcGdvANFtSFD3m/NxEHGzBMkPfyXKfpkHRI0F5jw5mWIgUkNwfyOFvQ1tHqq+K5C
	 M2z/EeC3wUQLg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
Date: Sun,  4 Sep 2022 03:26:36 -0400
Message-Id: <20220904072637.8619-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220904072637.8619-1-guoren@kernel.org>
References: <20220904072637.8619-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_002752_626147_D10E38A2 
X-CRM114-Status: GOOD (  10.67  )
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

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
'kernel_start' set but not used [-Wunused-but-set-variable]
  185 |         unsigned long kernel_start;
      |                       ^~~~~~~~~~~~

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/kernel/elf_kexec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 0cb94992c15b..bba3723a0914 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -182,7 +182,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	unsigned long new_kernel_pbase = 0UL;
 	unsigned long initrd_pbase = 0UL;
 	unsigned long headers_sz;
+#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
 	unsigned long kernel_start;
+#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
 	void *fdt, *headers;
 	struct elfhdr ehdr;
 	struct kexec_buf kbuf;
@@ -197,7 +199,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 			     &old_kernel_pbase, &new_kernel_pbase);
 	if (ret)
 		goto out;
+#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
 	kernel_start = image->start;
+#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
 	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
 
 	/* Add the kernel binary to the image */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
