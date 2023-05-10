Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D42CC7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m+e3x6oBvjj6bjt0hiViCGupWmxJtoaZT8EQQHeeqHA=; b=uqqXMCeXzoGd2b
	9qc4Grqeq4qW6HTStAW8ZjsmTKtBGpby93uBjybb+saydSj9BQQiVgt9wbn1U5jBTI/c9BAkt9BqC
	G0C7vu//GLIKEva+5jSpjZKTDgdJp6IJiRm0iIAgaNZVW1xZQf3dA7owrYFPKLl+RU+7atbi9/GXQ
	WgmmNli/Ubxy+Cbmgzh5mTRkq7GHtYtRqq+PR1+SJ9ZyLufSFrcIWdCNJ+GRt4KxBeL4zeVk4siJj
	Mc2hwUwM2JK3WVhC9UX1vnMy0bi769vrmED+SsUc9jDeyDwNsWcIkzkI67c48IN5VmeoinEarB9y6
	oo/sNe9dhiV4s+oLNE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhj2-005ysq-21;
	Wed, 10 May 2023 11:11:16 +0000
Received: from out28-148.mail.aliyun.com ([115.124.28.148])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhiz-005yrr-25
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 11:11:15 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437702|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0270069-0.000773148-0.97222;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=lixiaoyun@binary-semi.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.SdWYsXA_1683717045;
Received: from localhost.localdomain(mailfrom:lixiaoyun@binary-semi.com fp:SMTPD_---.SdWYsXA_1683717045)
          by smtp.aliyun-inc.com;
          Wed, 10 May 2023 19:10:57 +0800
From: "Amma.Lee" <lixiaoyun@binary-semi.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Cc: lixiaoyun@binary-semi.com,
	xiezx@binary-semi.com
Subject: [PATCH] riscv: optimize ELF relocation function in riscv
Date: Wed, 10 May 2023 19:10:18 +0800
Message-Id: <1683717018-12882-1-git-send-email-lixiaoyun@binary-semi.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_041113_891265_251EDFC6 
X-CRM114-Status: GOOD (  14.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The patch can optimize the running times of "insmod" command by modify ELF
relocation function.
In the riscv kernel, when install the ELF driver which contains multiple
symbol table items to be relocated, kernel takes a lot of time to
execute the relocation. For example, we install a 3+MB driver need 180+s.

We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
items relocation function and find that there are two for-loops in this
function. If we modify the begin number in the second for-loops iteration,
we could save significant time for installation. We install the 3+MB
driver could just need 2s.

Signed-off-by: Amma.Lee<lixiaoyun@binary-semi.com>
---
 arch/riscv/kernel/module.c | 69 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d5..55507b0 100755
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -345,13 +345,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	int (*handler)(struct module *me, u32 *location, Elf_Addr v);
 	Elf_Sym *sym;
 	u32 *location;
-	unsigned int i, type;
+	unsigned int i, type, j_idx;
 	Elf_Addr v;
 	int res;
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
-
+	j_idx = 0;
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
 		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
@@ -385,8 +385,9 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
 			unsigned int j;
-
-			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
+			/*Modify the j for-loops begin number from last iterates end value*/
+			for (j = j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
+			/* Modify end */
 				unsigned long hi20_loc =
 					sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
@@ -420,11 +421,63 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				}
 			}
 			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
-				pr_err(
-				  "%s: Can not find HI20 relocation information\n",
-				  me->name);
-				return -EINVAL;
+				if (j_idx == 0) {
+					pr_err(
+						"%s: Can not find HI20 relocation information\n",
+						me->name);
+					return -EINVAL;
+				}
+
+
+				for (j = 0; j < j_idx; j++) {
+					unsigned long hi20_loc =
+						sechdrs[sechdrs[relsec].sh_info].sh_addr
+						+ rel[j].r_offset;
+					u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
+
+
+					/* Find the corresponding HI20 relocation entry */
+					if (hi20_loc == sym->st_value
+						&& (hi20_type == R_RISCV_PCREL_HI20
+						|| hi20_type == R_RISCV_GOT_HI20)) {
+						s32 hi20, lo12;
+						Elf_Sym *hi20_sym =
+							(Elf_Sym *)sechdrs[symindex].sh_addr
+							+ ELF_RISCV_R_SYM(rel[j].r_info);
+						unsigned long hi20_sym_val =
+							hi20_sym->st_value
+							+ rel[j].r_addend;
+
+
+						/* Calculate lo12 */
+						size_t offset = hi20_sym_val - hi20_loc;
+						/* Calculate lo12 */
+						if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
+							&& hi20_type == R_RISCV_GOT_HI20) {
+							offset = module_emit_got_entry(
+								me, hi20_sym_val);
+							offset = offset - hi20_loc;
+
+						}
+						hi20 = (offset + 0x800) & 0xfffff000;
+						lo12 = offset - hi20;
+						v = lo12;
+
+						break;
+					}
+				}
+
+				if (j == j_idx) {
+					pr_err(
+						"%s: Can not find HI20 relocation information\n",
+						me->name);
+					return -EINVAL;
+				}
+
+
 			}
+
+			j_idx = j;
 		}
 
 		res = handler(me, location, v);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
