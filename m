Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF27C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfyhRO73oPB2P7HkE4W78spCvcIHGeQzWrQVbpC66vs=; b=toyZPQf3b94y+2
	vzZKWVTCRdXYD5Wp66CKqt0wEz4nwHcUpsm1k/+5nuXw4Qr6vCkgG0JiUpGXhg+BXWHqM112YxpAE
	+c0EtXV3oPbL3wbm5THhblONsDT7zPKvOlG+fNCRwQjqbBBcdiZSfXH+/EkpU9LPrETKZffIoDte6
	q75NpLNpEud5IyOizQzFnjivDZjBaqOE1GrNvTNGCJDq6bGxvKwxV71tVwbAALoGnqkIDAW3KUqTs
	FCAdDY9mjsUUeOdB872dPxUiDO1J4c7Pe22IJ7q10dnky+UAHtS1zlNcxRV9MSW4pyYwNGxfTHLDi
	Dr+1aefPM0xJRmuBGi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuvb-00CbzC-G5; Tue, 01 Feb 2022 15:18:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEukl-00CWPO-Le; Tue, 01 Feb 2022 15:07:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 341356168B;
 Tue,  1 Feb 2022 15:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EBBC340EF;
 Tue,  1 Feb 2022 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643728051;
 bh=HEM6wUjW/YQojqR94RrLp8qy+d2K2OqnXt44dGkca70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RMmlxp4UJPsMtpXs87e4s6xiaJ80wAU96MOJZHI+WK5FXJjACE6sOA7mhIezCSDbn
 cVVy6Dpx1UPePeJgda2QrNUuIhD13UX9Ddx/gkxzZTOM7iBDVsQyAq9f5beTjmcN3M
 ZEsl2BI5891/5TdJmWhqOQneQUhuuoMklcHjp1EICjRMX/B2dRNawxC6X9flryBXEf
 UMGy0guzFd496xjEzWLCKPNxsUOAih/7+/NVQjvbaYR82M2ad4UoxMpNqKkOqcIgL9
 V5SdYuK4vcL1DcazWpHElMSfus+Gl4xAJ+/euvJde///B2VWJ2F4xHnWOobqXtVLoB
 Ojq7wWGiVAZow==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
Date: Tue,  1 Feb 2022 23:05:39 +0800
Message-Id: <20220201150545.1512822-16-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_070731_831248_14444951 
X-CRM114-Status: GOOD (  13.46  )
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

Detect hardware COMPAT (32bit U-mode) capability in rv64. If not
support COMPAT mode in hw, compat_elf_check_arch would return
false by compat_binfmt_elf.c

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/elf.h |  3 ++-
 arch/riscv/kernel/process.c  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index aee40040917b..3a4293dc7229 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -40,7 +40,8 @@
  * elf64_hdr e_machine's offset are different. The checker is
  * a little bit simple compare to other architectures.
  */
-#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
+#define compat_elf_check_arch	compat_elf_check_arch
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 1a666ad299b4..758847cba391 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,6 +83,38 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+#ifdef CONFIG_COMPAT
+static bool compat_mode_support __read_mostly;
+
+bool compat_elf_check_arch(Elf32_Ehdr *hdr)
+{
+	if (compat_mode_support && (hdr->e_machine == EM_RISCV))
+		return true;
+	else
+		return false;
+}
+
+static int compat_mode_detect(void)
+{
+	unsigned long tmp = csr_read(CSR_STATUS);
+
+	csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
+
+	if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
+		pr_info("riscv: 32bit compat mode detect failed\n");
+		compat_mode_support = false;
+	} else {
+		compat_mode_support = true;
+		pr_info("riscv: 32bit compat mode detected\n");
+	}
+
+	csr_write(CSR_STATUS, tmp);
+
+	return 0;
+}
+arch_initcall(compat_mode_detect);
+#endif
+
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
