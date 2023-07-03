Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A2DEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ujvFF8jQ4q/7b88cRjoKJup0uqbl9uluqZ0YfvN0oe0=; b=bwQdm6O0oDY1kP
	Nv+XtSLCIe8SQoqISvaqFNC6UNNOHi3wlc05EcJ96kiTbN8KbPz/0UOdCayg2GvWiI3DnF1ImiC6O
	7FhnWfyBQth8AC7AfAQfXERxTfNbvIq4JVmvxHB8PQGtOdfxnV9El3iGjYR1HJpHh6U0e+r8vHeuZ
	b2OBoAj1X6bEaakdcq43ZpNZPTAaHY/G9rMOcs3t3vmaB9TO6Mj6yhOsg0zooT1hea1GKFT+C4ppl
	txWeondFsjzzDGJyDzufCg70twGny5F/5rWjnsgIlC7y0qoMIC2XeSlaFzFHlHHYWZsUbiAHgVFeo
	XuN0ViWswveAy2LEC8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAJP-009Apo-00;
	Mon, 03 Jul 2023 03:33:15 +0000
Received: from out28-125.mail.aliyun.com ([115.124.28.125])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAJL-009AnU-39
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 03:33:14 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437741|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0371712-0.0010859-0.961743;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=lixiaoyun@binary-semi.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.TjpOQK9_1688355167;
Received: from localhost.localdomain(mailfrom:lixiaoyun@binary-semi.com fp:SMTPD_---.TjpOQK9_1688355167)
          by smtp.aliyun-inc.com;
          Mon, 03 Jul 2023 11:32:58 +0800
From: Amma Lee <lixiaoyun@binary-semi.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: lixiaoyun@binary-semi.com,
	xiezx@binary-semi.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: optimize ELF relocation function in riscv
Date: Mon,  3 Jul 2023 11:32:12 +0800
Message-Id: <1688355132-62933-1-git-send-email-lixiaoyun@binary-semi.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_203312_219289_A9D9D7E9 
X-CRM114-Status: GOOD (  16.57  )
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

The patch can optimize the running times of insmod command by modify ELF
relocation function.
In the 5.10 and latest kernel, when install the riscv ELF drivers which
contains multiple symbol table items to be relocated, kernel takes a lot
of time to execute the relocation. For example, we install a 3+MB driver
need 180+s.
We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
type items relocation function in the arch\riscv\kernel\module.c and
find that there are two-loops in the function. If we modify the begin
number in the second for-loops iteration, we could save significant time
for installation. We install the same 3+MB driver could just need 2s.

Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
---
 arch/riscv/kernel/module.c | 67 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d5..b8df144 100755
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
@@ -386,7 +386,15 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
 			unsigned int j;
 
-			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
+			/*In the second for-loops, each traversal for j is
+			 * starts from 0 to the symbol table item index which
+			 * is detected. By the tool "readelf", we find that all
+			 * the symbol table items about R_RISCV_PCREL_HI20 type
+			 * are incrementally added in order. It means that we
+			 * could interate the j with the previous loop end
+			 * value(j_idx) as the begin number in the next loop;
+			 */
+			for (j = j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
 				unsigned long hi20_loc =
 					sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
@@ -420,11 +428,64 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				}
 			}
 			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
+				if (j_idx == 0) {
 				pr_err(
 				  "%s: Can not find HI20 relocation information\n",
 				  me->name);
 				return -EINVAL;
+}
+
+				/*If the last j-loop have been traversed to the
+				 * maximum value but never match the
+				 * corresponding symbol relocation item, the
+				 * j-loop will execute the second loop which
+				 * is begin from 0 to the prerious index (j_idx)
+				 * unless the previous j_idx == 0;
+				 * */
+				for (j = 0; j < j_idx; j++) {
+				unsigned long hi20_loc =
+				sechdrs[sechdrs[relsec].sh_info].sh_addr
+						+ rel[j].r_offset;
+				u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
+
+				/* Find the corresponding HI20 relocation entry */
+				if (hi20_loc == sym->st_value
+					&& (hi20_type == R_RISCV_PCREL_HI20
+					|| hi20_type == R_RISCV_GOT_HI20)) {
+					s32 hi20, lo12;
+					Elf_Sym *hi20_sym =
+						(Elf_Sym *)sechdrs[symindex].sh_addr
+						+ ELF_RISCV_R_SYM(rel[j].r_info);
+					unsigned long hi20_sym_val =
+						hi20_sym->st_value
+						+ rel[j].r_addend;
+
+					/* Calculate lo12 */
+					size_t offset = hi20_sym_val - hi20_loc;
+					if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
+					    && hi20_type == R_RISCV_GOT_HI20) {
+						offset = module_emit_got_entry(
+							 me, hi20_sym_val);
+						offset = offset - hi20_loc;
+					}
+					hi20 = (offset + 0x800) & 0xfffff000;
+					lo12 = offset - hi20;
+					v = lo12;
+
+					break;
+				}
 			}
+
+				if (j == j_idx) {
+					pr_err(
+						"%s: Can not find HI20 relocation information\n",
+						me->name);
+					return -EINVAL;
+				}
+			}
+
+			/* Record the previous j-loop end index */
+			j_idx = j;
 		}
 
 		res = handler(me, location, v);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
