Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B658C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJDFctzWT67H+rtbQF2QXuM7Ukl4qOxi1UOQQzc/lMM=; b=JQUI4oiHEucC7u
	onfiqQWSZesTOfKFUREa16HpB9xX7Kn85V6WCSj219KtTzRGy+d0R7ZTOx3RkJBNqFXyRL7RY5Czb
	J+Y38c1orxyvsKCPXleEMMt3kTTaopDTQZrj2rr8xijeOcBUKsvBmZ3ggBoJPVZZZNeTxtAysSQh+
	vkhtB/zErgEirZooVsh/hgoZqrgr0JlQ5WalJVJGQLTIZTDcHi5kwvWR51ECmmN1mgcG7KjMsbP0L
	hMD0xaXcKKUSS4/6SgFWOMbRKx6vXNnkZVKO/vpBDg61AKh41qYR2OHfhHI34f2mt3dzsBHQhla+i
	8qzwHQ0JVXFIKaQFtNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOqV-00F1VS-7z; Fri, 27 Jan 2023 13:32:47 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR1-00EryH-BF
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:39 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S16;
	Fri, 27 Jan 2023 21:06:11 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com
Subject: [PATCH v6 12/13] riscv/kprobe: Move exception related symbols to .kprobe_blacklist
Date: Fri, 27 Jan 2023 21:05:40 +0800
Message-Id: <20230127130541.1250865-13-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S16
X-Coremail-Antispam: 1UD129KBjvJXoW7uw45Xw18uF45WrWrKF18uFg_yoW8uw4kpF
	4DCrn5WrWrWryfC34ayr1DuayxJwn5Ww4ayr1ruFWrAF42grW8Awn0v3yDXryIgF4xW3yr
	uF109rWYga4UX37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jzmhrUUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiAwkEE2PTrr4g2AAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050627_887637_B0433E65 
X-CRM114-Status: UNSURE (   7.38  )
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

From: Liao Chang <liaochang1@huawei.com>

Due to the generic exception entry and exit code is part of the critical
path for kprobe breakpoint and uprobe syscall entry, set a kprobe on the
assembly symbols in entry.S result in kernel stack overflow crash, hence
it has to explicitly blacklist it, requiring a new _ASM_NOKPROBE() asm
helper.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/include/asm/asm.h | 10 ++++++++++
 arch/riscv/kernel/entry.S    | 12 ++++++++++++
 arch/riscv/kernel/mcount.S   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 816e753de636..5d9f13d8b809 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -81,6 +81,16 @@
 	.endr
 .endm
 
+#ifdef CONFIG_KPROBES
+#define _ASM_NOKPROBE(entry)				\
+	.pushsection "_kprobe_blacklist", "aw" ;	\
+	.balign SZREG ;					\
+	REG_ASM entry ;					\
+	.popsection
+#else
+#define _ASM_NOKPROBE(entry)
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 99d38fdf8b18..9e8882a78523 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -606,3 +606,15 @@ ENTRY(__user_rt_sigreturn)
 	scall
 END(__user_rt_sigreturn)
 #endif
+
+_ASM_NOKPROBE(handle_exception)
+_ASM_NOKPROBE(_restore_kernel_tpsp)
+_ASM_NOKPROBE(_save_context)
+_ASM_NOKPROBE(ret_from_exception)
+_ASM_NOKPROBE(ret_from_syscall)
+_ASM_NOKPROBE(__switch_to)
+_ASM_NOKPROBE(ret_from_syscall_rejected)
+_ASM_NOKPROBE(restore_all)
+_ASM_NOKPROBE(resume_kernel)
+_ASM_NOKPROBE(resume_userspace)
+_ASM_NOKPROBE(check_syscall_nr)
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 30102aadc4d7..7393b8895ef3 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -54,6 +54,7 @@ ENTRY(ftrace_stub)
 #endif
 	ret
 ENDPROC(ftrace_stub)
+_ASM_NOKPROBE(MCOUNT_NAME)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
