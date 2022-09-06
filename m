Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D17C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1tPcT5+vMJc6TWdaPHZRxkQn5qXETYD7kxeX3EL3UM=; b=B3PpwqHYYMsRFj
	dYjfmP15Jj08TmdAGN/TVyjEkURm2VLIeAMn4Pi9q9/IPcDQ8edPCbCPGlxLDE3Z222RywBLKvGgV
	El34d3b110BExOoknxP/62KPTm2v6j4FQh5d/Pm4cYwq4p/sHkS3mN7AK/bp9SzR4oJKuI4bt9Gqe
	QNmTUuH3kB6njwo31dtD50DfCnO7nqQQq8moiVSiHeIKxf1cFSwejAbOLnymXdZV9t/FIgOK1MXNm
	wG3opFGtjyJ+ve2Ls7TR8ZokUvSC1phaJQDu5iwgTahcyijrzVUJBYJIQUiNONc96zbOpPDnGGtk4
	823JRqCmf4N+yDPqKHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPfv-003wy9-Ee; Tue, 06 Sep 2022 03:54:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPfh-003wfO-9e
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 03:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4BFEB815FB;
	Tue,  6 Sep 2022 03:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49226C4347C;
	Tue,  6 Sep 2022 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662436482;
	bh=8F+Kx4X5IE8S8oO8XnXHjQy0E8HHBWecQqZQdnIaKB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sg38r6tTm+XwhBd+gYM4zk55hWu1LKTqyc4rE8j6uR6G6ncYmCh2x7/eaQ3piGf/Z
	 yuOCsXN87Xrj+hmWvFB0ZaI+0g0sWBdA5vDlQt1J+6KaIH2AKlrF0jAkVahdBiU/9W
	 y2cCavScceLxkx6XuPXHVXd1+LXWYlArr55bHJ25oRwQ7xTHfGtBHMPu2FHO+7N4Q7
	 gvhWkgKxyE5nXVJ/mi11s8IoEnQ3WkmunfT+vFqdZntj046layEzG9XSQfx7GMQZ38
	 SHtZXnTqyYFSQSi3RWA+9dOW/L2eN+TNSlg1yg3ih7GtAmLwEMpHK3NSvH/orSQ6qZ
	 OCdZyAHJodLsA==
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
	paul.walmsley@sifive.com,
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V3 1/7] riscv: elf_kexec: Fixup compile warning
Date: Mon,  5 Sep 2022 23:54:17 -0400
Message-Id: <20220906035423.634617-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906035423.634617-1-guoren@kernel.org>
References: <20220906035423.634617-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_205445_515898_59F5B93B 
X-CRM114-Status: GOOD (  12.41  )
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

If CRYTPO or CRYPTO_SHA256 or KEXE_FILE is not enabled, then:

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
'kernel_start' set but not used [-Wunused-but-set-variable]
  185 |         unsigned long kernel_start;
      |                       ^~~~~~~~~~~~

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/kernel/elf_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 0cb94992c15b..4b9264340b78 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 	kernel_start = image->start;
-	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
+	pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);
 
 	/* Add the kernel binary to the image */
 	ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
