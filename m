Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555EDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8FZ1oHdAogS5L7rCddmcR8U2nxiWGtvLkpDfXV4y2I=; b=aDvvGWjRCZ5efY
	vCi4BSJ24DK/iL+W+cEKZID/8FSr75OeEUTUJRaDusJQ/2cbVcl8/kZ2oWTfWzclOWKVAvBuv8nv1
	9VShbTMwaPaBOQMP4F7YMTDswWc2QmNGHMP4mVRWFa6ma1y9brRmo0zxn+8ZEnpzaOcsHoiv4jeq7
	0T8X/lGNVLJqD/p8vdJpNuiunDgRE39gs7TGa7b/rdXC3lKhKJW1jOIuoHgCDEKoTYZMcRkIWyr6s
	/e9j8ozvbAdh+fOS7vRQCGci5wZshF9E1iUzPRgWoCsti6/3uLBMVuEWIswBZLFZUvNkKGbZAfmIK
	otCq0v36Fa9YdOHYyTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdYJ-00HV56-PK; Tue, 05 Apr 2022 07:24:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdP1-00HPj4-LO; Tue, 05 Apr 2022 07:15:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49F5BB81B18;
 Tue,  5 Apr 2022 07:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5F3C34113;
 Tue,  5 Apr 2022 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649142897;
 bh=ggDDZ4KrMuZa/FnH1iFuGJ/npHtqKAOwj6Ie6vczNw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBi4/1UQ8TYPu3HtKyxz7E7vs+XesHh9mqlNAGCCPu7pAqmdCSklUU49E5HTtRTRK
 J6T69wDNoEPicEALGu2Xw/qiuktVFvAY0ZuDycQ1/Pmcr6H/4HMyWZa409DCqiLvZb
 s6J3VkTwDyyGyZ3eu9EkAwlc+143LU2cGd1vc1zdgpQ0ZAU2oF3Ih9V8Ec2YmTCED5
 SsKGhQ0J5paJUebgWmUFlD4DHHntwyFz4i38LX5Bco9HkbrZtkMpCsZkKeChunvTSM
 C4x4Gaqwnjgyyps53h1iVUo+JBRfl2xwK/1cH62Pfpt2fUSfFGWk7oOPxYlhjfBb25
 g9Itk8RHqE/1A==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, heiko@sntech.de,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 15/20] riscv: compat: Add hw capability check for elf
Date: Tue,  5 Apr 2022 15:13:09 +0800
Message-Id: <20220405071314.3225832-16-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405071314.3225832-1-guoren@kernel.org>
References: <20220405071314.3225832-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001500_010386_C49F8949 
X-CRM114-Status: GOOD (  12.97  )
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

Add CLASS to enhance (compat_)elf_check_arch to distinguish
32BIT/64BIT elf.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/elf.h |  6 ++++--
 arch/riscv/kernel/process.c  | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index a234656cfb5d..754fdb8cee96 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -33,9 +33,11 @@
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#define elf_check_arch(x) (((x)->e_machine == EM_RISCV) && \
+			   ((x)->e_ident[EI_CLASS] == ELF_CLASS))
 
-#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
+#define compat_elf_check_arch	compat_elf_check_arch
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b4421c16198c..1c7be865ab31 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -84,6 +84,34 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+#ifdef CONFIG_COMPAT
+static bool compat_mode_supported __read_mostly;
+
+bool compat_elf_check_arch(Elf32_Ehdr *hdr)
+{
+	return compat_mode_supported &&
+	       hdr->e_machine == EM_RISCV &&
+	       hdr->e_ident[EI_CLASS] == ELFCLASS32;
+}
+
+static int __init compat_mode_detect(void)
+{
+	unsigned long tmp = csr_read(CSR_STATUS);
+
+	csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
+	compat_mode_supported =
+			(csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;
+
+	csr_write(CSR_STATUS, tmp);
+
+	pr_info("riscv: ELF compat mode %s",
+			compat_mode_supported ? "supported" : "failed");
+
+	return 0;
+}
+early_initcall(compat_mode_detect);
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
