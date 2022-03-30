Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC62C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PO2wvidgG78na3eIy/oDj4KH9O9dR6tVDpcYfeuWZQ=; b=Zl9y+ZZQd1ME4d
	uDzbRLWr72K/AmMzK1VdFvC+Kuxf/PoxAbzRw7h515YTcZ+rfsLvRcO7FENb3t1IY5JpDxAHhDswI
	NZUNzm644cElBXnABMuKb10oON7HBD0CYm4xPH2i6p+Spgd8Zw7/r+KUOm1nL6n3sbqCp3OlVEhDU
	GIRUJxTDeCswz04v/oztjyvzp3MkUMF6EDWwSie8HhCzIq5L3qDhNjf87KflSsEhSnia8+hhPXy0c
	SPQ6GPX6SzrvUvr3g0OBxpbqg0YzaJfyfCt5YE0ZdF+WwI/xLcNoTZXUiQAmgwDcQzIpWLzFsKaq6
	pWLi4+SV1EhNxk6HU72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTYF-00ElqA-1r; Wed, 30 Mar 2022 08:19:35 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTWX-00EklS-Se; Wed, 30 Mar 2022 08:17:54 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KSzj31s8NzBrp9;
 Wed, 30 Mar 2022 16:13:43 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 30 Mar
 2022 16:17:45 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <liaochang1@huawei.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <changbin.du@intel.com>, <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, 
 <jszhang@kernel.org>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <mick@ics.forth.gr>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <penberg@kernel.org>, <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v2 -next 6/6] RISC-V: Load purgatory in kexec_file
Date: Wed, 30 Mar 2022 16:17:01 +0800
Message-ID: <20220330081701.177026-7-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330081701.177026-1-lizhengyu3@huawei.com>
References: <20220330081701.177026-1-lizhengyu3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_011750_340950_4E00CF3D 
X-CRM114-Status: GOOD (  17.57  )
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

This patch supports kexec_file to load and relocate purgatory.
It works well on riscv64 QEMU, being tested with devmem.

Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
---
 arch/riscv/kernel/elf_kexec.c | 151 ++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 911d65d5a123..9cb85095fd45 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -182,6 +182,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	unsigned long new_kernel_pbase = 0UL;
 	unsigned long initrd_pbase = 0UL;
 	unsigned long headers_sz;
+	unsigned long kernel_start;
 	void *fdt, *headers;
 	struct elfhdr ehdr;
 	struct kexec_buf kbuf;
@@ -196,6 +197,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 			     &old_kernel_pbase, &new_kernel_pbase);
 	if (ret)
 		goto out;
+	kernel_start = image->start;
 	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
 
 	/* Add the kernel binary to the image */
@@ -246,6 +248,22 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 		cmdline = modified_cmdline;
 	}
 
+#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
+	/* Add purgatory to the image */
+	kbuf.top_down = true;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+	ret = kexec_load_purgatory(image, &kbuf);
+	if (ret) {
+		pr_err("Error loading purgatory ret=%d\n", ret);
+		goto out;
+	}
+	ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
+					     &kernel_start,
+					     sizeof(kernel_start), 0);
+	if (ret)
+		pr_err("Error update purgatory ret=%d\n", ret);
+#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
+
 	/* Add the initrd to the image */
 	if (initrd != NULL) {
 		kbuf.buffer = initrd;
@@ -291,6 +309,139 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	return ret ? ERR_PTR(ret) : NULL;
 }
 
+#define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
+#define RISCV_IMM_BITS 12
+#define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
+#define RISCV_CONST_HIGH_PART(x) \
+	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
+#define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
+
+#define ENCODE_ITYPE_IMM(x) \
+	(RV_X(x, 0, 12) << 20)
+#define ENCODE_BTYPE_IMM(x) \
+	((RV_X(x, 1, 4) << 8) | (RV_X(x, 5, 6) << 25) | \
+	(RV_X(x, 11, 1) << 7) | (RV_X(x, 12, 1) << 31))
+#define ENCODE_UTYPE_IMM(x) \
+	(RV_X(x, 12, 20) << 12)
+#define ENCODE_JTYPE_IMM(x) \
+	((RV_X(x, 1, 10) << 21) | (RV_X(x, 11, 1) << 20) | \
+	(RV_X(x, 12, 8) << 12) | (RV_X(x, 20, 1) << 31))
+#define ENCODE_CBTYPE_IMM(x) \
+	((RV_X(x, 1, 2) << 3) | (RV_X(x, 3, 2) << 10) | (RV_X(x, 5, 1) << 2) | \
+	(RV_X(x, 6, 2) << 5) | (RV_X(x, 8, 1) << 12))
+#define ENCODE_CJTYPE_IMM(x) \
+	((RV_X(x, 1, 3) << 3) | (RV_X(x, 4, 1) << 11) | (RV_X(x, 5, 1) << 2) | \
+	(RV_X(x, 6, 1) << 7) | (RV_X(x, 7, 1) << 6) | (RV_X(x, 8, 2) << 9) | \
+	(RV_X(x, 10, 1) << 8) | (RV_X(x, 11, 1) << 12))
+#define ENCODE_UJTYPE_IMM(x) \
+	(ENCODE_UTYPE_IMM(RISCV_CONST_HIGH_PART(x)) | \
+	(ENCODE_ITYPE_IMM(RISCV_CONST_LOW_PART(x)) << 32))
+#define ENCODE_UITYPE_IMM(x) \
+	(ENCODE_UTYPE_IMM(x) | (ENCODE_ITYPE_IMM(x) << 32))
+
+#define CLEAN_IMM(type, x) \
+	((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
+
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+				     Elf_Shdr *section,
+				     const Elf_Shdr *relsec,
+				     const Elf_Shdr *symtab)
+{
+	const char *strtab, *name, *shstrtab;
+	const Elf_Shdr *sechdrs;
+	Elf_Rela *relas;
+	int i, r_type;
+
+	/* String & section header string table */
+	sechdrs = (void *)pi->ehdr + pi->ehdr->e_shoff;
+	strtab = (char *)pi->ehdr + sechdrs[symtab->sh_link].sh_offset;
+	shstrtab = (char *)pi->ehdr + sechdrs[pi->ehdr->e_shstrndx].sh_offset;
+
+	relas = (void *)pi->ehdr + relsec->sh_offset;
+
+	for (i = 0; i < relsec->sh_size / sizeof(*relas); i++) {
+		const Elf_Sym *sym;	/* symbol to relocate */
+		unsigned long addr;	/* final location after relocation */
+		unsigned long val;	/* relocated symbol value */
+		unsigned long sec_base;	/* relocated symbol value */
+		void *loc;		/* tmp location to modify */
+
+		sym = (void *)pi->ehdr + symtab->sh_offset;
+		sym += ELF64_R_SYM(relas[i].r_info);
+
+		if (sym->st_name)
+			name = strtab + sym->st_name;
+		else
+			name = shstrtab + sechdrs[sym->st_shndx].sh_name;
+
+		loc = pi->purgatory_buf;
+		loc += section->sh_offset;
+		loc += relas[i].r_offset;
+
+		if (sym->st_shndx == SHN_ABS)
+			sec_base = 0;
+		else if (sym->st_shndx >= pi->ehdr->e_shnum) {
+			pr_err("Invalid section %d for symbol %s\n",
+			       sym->st_shndx, name);
+			return -ENOEXEC;
+		} else
+			sec_base = pi->sechdrs[sym->st_shndx].sh_addr;
+
+		val = sym->st_value;
+		val += sec_base;
+		val += relas[i].r_addend;
+
+		addr = section->sh_addr + relas[i].r_offset;
+
+		r_type = ELF64_R_TYPE(relas[i].r_info);
+
+		switch (r_type) {
+		case R_RISCV_BRANCH:
+			*(u32 *)loc = CLEAN_IMM(BTYPE, *(u32 *)loc) |
+				 ENCODE_BTYPE_IMM(val - addr);
+			break;
+		case R_RISCV_JAL:
+			*(u32 *)loc = CLEAN_IMM(JTYPE, *(u32 *)loc) |
+				 ENCODE_JTYPE_IMM(val - addr);
+			break;
+		/*
+		 * With no R_RISCV_PCREL_LO12_S, R_RISCV_PCREL_LO12_I
+		 * sym is expected to be next to R_RISCV_PCREL_HI20
+		 * in purgatory relsec. Handle it like R_RISCV_CALL
+		 * sym, instead of searching the whole relsec.
+		 */
+		case R_RISCV_PCREL_HI20:
+		case R_RISCV_CALL:
+			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
+				 ENCODE_UJTYPE_IMM(val - addr);
+			break;
+		case R_RISCV_RVC_BRANCH:
+			*(u32 *)loc = CLEAN_IMM(CBTYPE, *(u32 *)loc) |
+				 ENCODE_CBTYPE_IMM(val - addr);
+			break;
+		case R_RISCV_RVC_JUMP:
+			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
+				 ENCODE_CJTYPE_IMM(val - addr);
+			break;
+		case R_RISCV_ADD32:
+			*(u32 *)loc += val;
+			break;
+		case R_RISCV_SUB32:
+			*(u32 *)loc -= val;
+			break;
+		/* It has been applied by R_RISCV_PCREL_HI20 sym */
+		case R_RISCV_PCREL_LO12_I:
+		case R_RISCV_ALIGN:
+		case R_RISCV_RELAX:
+			break;
+		default:
+			pr_err("Unknown rela relocation: %d\n", r_type);
+			return -ENOEXEC;
+		}
+	}
+	return 0;
+}
+
 const struct kexec_file_ops elf_kexec_ops = {
 	.probe = kexec_elf_probe,
 	.load  = elf_kexec_load,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
