Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DCEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCD560F26
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCCD560F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn7V4lDAY/OTr6u3py/TJrDeKKUV1sldNJoBUMwATWM=; b=W09hdh/IjXA7qM
	j6yC+E8eje4CO4EI/N56P+shGrjqtcSZf/M9XEAF0l4DvPq3Cqz1iQap9txS7L0LsxG9iX9WahysN
	DnsXR6zYjH7c5ARuTKjF2HjMaVs5RgkN4RnxYR7TEGHfnknAXZJFa2CRLRTtTEYCzqdtjYj4zVj1L
	XICvSdbmVt1ZbStP8uZEN+erlFaO+PlEEHjopBHIQW7K5zH9sdRh64gPindDMcx17OHSvmQLMCC4I
	H2NjXHyp84ey8l60P1YDe4VeQmt5m3KkR/eepmp9OaaxeCyh8H6qnobIJJJ4tvZ6NkgLr3FAi5H7Q
	us+ECnLC8DPrir9ZNxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfhZ-007blC-3l; Thu, 18 Nov 2021 11:35:37 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfhL-007bZZ-3B
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=EW6iraQ65ROOPbIyDVgjglECaMsybXCJKB
 ++hMb997E=; b=uirKa4+y7X4RNCZuik44UaSRBW26Hx9TnNkr/8yBG89LZTSoiV
 eTFunT2kJJmEQ3BSII2FaH73CMY5GK7gMFT1gs/b0hS3COf09Sora5+VkxI3+ZiR
 ozsFc6rRsAGd2MuVidkXdKvt559NU+40mFUxVG+/njtNky7E4iqqur5ec=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAHD99XOpZhwZ1cAQ--.27562S2; 
 Thu, 18 Nov 2021 19:34:47 +0800 (CST)
Date: Thu, 18 Nov 2021 19:22:51 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Tong Tiangen
 <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [PATCH 03/12] riscv: switch to relative exception tables
Message-ID: <20211118192251.749c04f7@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAHD99XOpZhwZ1cAQ--.27562S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFyfJFy8WF4kAFWfZry3twb_yoW7tr15pF
 4DC3s5KrZ5Crn7u3Wak3yqgF1rGanY9a45KryrWr1UA3y2vrW8tws5t347uF1UAa18Za4F
 9rySgr1jkw4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr
 0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU80_M3UUUU
 U==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033523_847183_608B5D9B 
X-CRM114-Status: GOOD (  21.42  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Similar as other architectures such as arm64, x86 and so on, use
offsets relative to the exception table entry values rather than
absolute addresses for both the exception locationand the fixup.

However, RISCV label difference will actually produce two relocations,
a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
example:

$ cat test.S
.section .text
1:
        nop
.section __ex_table,"a"
        .balign 4
        .long (1b - .)
.previous

$ riscv64-linux-gnu-gcc -c test.S
$ riscv64-linux-gnu-readelf -r test.o
Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0

The modpost will complain the R_RISCV_SUB32 relocation, so we need to
patch modpost.c to skip this relocation for .rela__ex_table section.

After this patch, the __ex_table section size of defconfig vmlinux is
reduced from 7072 Bytes to 3536 Bytes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/Kbuild    |  1 -
 arch/riscv/include/asm/extable.h | 25 +++++++++++++++++++++++++
 arch/riscv/include/asm/uaccess.h |  4 ++--
 arch/riscv/lib/uaccess.S         |  4 ++--
 arch/riscv/mm/extable.c          |  2 +-
 scripts/mod/modpost.c            | 15 +++++++++++++++
 scripts/sorttable.c              |  2 +-
 7 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/include/asm/extable.h

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc97305a..57b86fd9916c 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += early_ioremap.h
-generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += user.h
diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
new file mode 100644
index 000000000000..84760392fc69
--- /dev/null
+++ b/arch/riscv/include/asm/extable.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_EXTABLE_H
+#define _ASM_RISCV_EXTABLE_H
+
+/*
+ * The exception table consists of pairs of relative offsets: the first
+ * is the relative offset to an instruction that is allowed to fault,
+ * and the second is the relative offset at which the program should
+ * continue. No registers are modified, so it is entirely up to the
+ * continuation code to figure out what to do.
+ *
+ * All the routines below use bits of fixup code that are out of line
+ * with the main instruction path.  This means when everything is well,
+ * we don't even have to jump over them.  Further, they do not intrude
+ * on our cache or tlb entries.
+ */
+
+struct exception_table_entry {
+	int insn, fixup;
+};
+
+#define ARCH_HAS_RELATIVE_EXTABLE
+
+int fixup_exception(struct pt_regs *regs);
+#endif
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 714cd311d9f1..0f2c5b9d2e8f 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -12,8 +12,8 @@
 
 #define _ASM_EXTABLE(from, to)						\
 	"	.pushsection	__ex_table, \"a\"\n"			\
-	"	.balign "	RISCV_SZPTR "	 \n"			\
-	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
+	"	.balign		4\n"					\
+	"	.long		(" #from " - .), (" #to " - .)\n"	\
 	"	.popsection\n"
 
 /*
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 63bc691cff91..55f80f84e23f 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -7,8 +7,8 @@
 100:
 	\op \reg, \addr
 	.section __ex_table,"a"
-	.balign RISCV_SZPTR
-	RISCV_PTR 100b, \lbl
+	.balign 4
+	.long (100b - .), (\lbl - .)
 	.previous
 	.endm
 
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index ddb7d3b99e89..d8d239c2c1bd 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -28,6 +28,6 @@ int fixup_exception(struct pt_regs *regs)
 		return rv_bpf_fixup_exception(fixup, regs);
 #endif
 
-	regs->epc = fixup->fixup;
+	regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
 	return 1;
 }
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb8ab7d91d30..6bfa33217914 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1830,6 +1830,14 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 	return 0;
 }
 
+#ifndef EM_RISCV
+#define EM_RISCV		243
+#endif
+
+#ifndef R_RISCV_SUB32
+#define R_RISCV_SUB32		39
+#endif
+
 static void section_rela(const char *modname, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
@@ -1866,6 +1874,13 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		r_sym = ELF_R_SYM(r.r_info);
 #endif
 		r.r_addend = TO_NATIVE(rela->r_addend);
+		switch (elf->hdr->e_machine) {
+		case EM_RISCV:
+			if (!strcmp("__ex_table", fromsec) &&
+			    ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)
+				continue;
+			break;
+		}
 		sym = elf->symtab_start + r_sym;
 		/* Skip special sections */
 		if (is_shndx_special(sym->st_shndx))
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index b7c2ad71f9cf..0c031e47a419 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -376,6 +376,7 @@ static int do_file(char const *const fname, void *addr)
 	case EM_PARISC:
 	case EM_PPC:
 	case EM_PPC64:
+	case EM_RISCV:
 		custom_sort = sort_relative_table;
 		break;
 	case EM_ARCOMPACT:
@@ -383,7 +384,6 @@ static int do_file(char const *const fname, void *addr)
 	case EM_ARM:
 	case EM_MICROBLAZE:
 	case EM_MIPS:
-	case EM_RISCV:
 	case EM_XTENSA:
 		break;
 	default:
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
