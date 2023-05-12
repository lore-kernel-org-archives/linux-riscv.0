Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F0C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlSQbIigMWNl62zNovaYYmFNXk6t7dk67AP/yvZVNlo=; b=VIoDQUFuzexOcp
	+Fga9zuxq7mCDXEyVqhyDPWH+Pjl7WGJq4rJpGae4MoAX/kVnOMpTgdxNoHeuvLVyX7hf9mbDofpY
	eMsvq11LwooPtjivmK3ODBDA50LtQtbzEnbWKDxSLztTm+D3aUv8L27Xt+VuBWfk8a90r6UpcBG3X
	SfST1LAByosLWkFJe/ZBCGEgCG/wxoYuh0+PzgNj+u7Te49ziK502BGjGDH7ebMgX3r4nXIvaC4k+
	B9TKZ6rceEzDnBNDPMbTLi8mZqJ86liGY/g0+XoIJT7Kd6LRxvZWqCvtT7yzTzsi1JfvN0YVdr0ix
	Zj1STSD4zQZHTkoMeVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOW1-00BNfQ-1Y;
	Fri, 12 May 2023 08:52:41 +0000
Received: from out28-76.mail.aliyun.com ([115.124.28.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOVx-00BNeG-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:52:39 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437567|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0113127-0.000330278-0.988357;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=lixiaoyun@binary-semi.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.T.knj5Y_1683881536;
Received: from localhost.localdomain(mailfrom:lixiaoyun@binary-semi.com fp:SMTPD_---.T.knj5Y_1683881536)
          by smtp.aliyun-inc.com;
          Fri, 12 May 2023 16:52:25 +0800
From: Amma Lee <lixiaoyun@binary-semi.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lixiaoyun@binary-semi.com,
	xiezx@binary-semi.com
Subject: [PATCH v2] riscv: optimize ELF relocation function in riscv
Date: Fri, 12 May 2023 16:51:53 +0800
Message-Id: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015237_649730_2AE2F457 
X-CRM114-Status: GOOD (  16.27  )
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
When install the riscv ELF driver which contains multiple
symbol table items to be relocated, kernel takes a lot of time to
execute the relocation. For example, we install a 3+MB driver need 180+s.
We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
items relocation function and find that there are two for-loops in this
function. If we modify the begin number in the second for-loops iteration,
we could save significant time for installation. We install the 3+MB
driver could just need 2s.

Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
Reviewed-by: Conor Dooley <conor@kernel.org>

---
 arch/riscv/kernel/module.c | 53 ++++++++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 55507b0..1683c1d 100755
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -385,9 +385,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
 			unsigned int j;
-			/*Modify the j for-loops begin number from last iterates end value*/
+
+			/*
+			* In the second for-loops, each traversal for j is
+			* starts from 0 to the symbol table item index which
+			* is detected. By the tool "readelf", we find that all
+			* the symbol table items about R_RISCV_PCREL_HI20 type
+			* are incrementally added in order. It means that we
+			* could interate the j with the previous loop end
+			* value(j_idx) as the begin number in the next loop;
+			*/
 			for (j = j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
-			/* Modify end */
 				unsigned long hi20_loc =
 					sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
@@ -420,22 +428,30 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 					break;
 				}
 			}
+
 			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
-				if(j_idx == 0){
+				if (j_idx == 0) {
 					pr_err(
 						"%s: Can not find HI20 relocation information\n",
 						me->name);
 					return -EINVAL;
 				}
-				
-				
-				for (j = 0; j < j_idx; j++){ 
+
+				/*
+				* If the last j-loop have been traversed to the
+				* maximum value but never match the
+				* corresponding symbol relocation item, the
+				* j-loop will execute the second loop which
+				* is begin from 0 to the prerious index (j_idx)
+				* unless the previous j_idx == 0;
+				*/
+				for (j = 0; j < j_idx; j++) {
 					unsigned long hi20_loc =
 						sechdrs[sechdrs[relsec].sh_info].sh_addr
 						+ rel[j].r_offset;
 					u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
-				
-				
+
+
 					/* Find the corresponding HI20 relocation entry */
 					if (hi20_loc == sym->st_value
 						&& (hi20_type == R_RISCV_PCREL_HI20
@@ -447,36 +463,37 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 						unsigned long hi20_sym_val =
 							hi20_sym->st_value
 							+ rel[j].r_addend;
-					
-				
+
+
 						/* Calculate lo12 */
 						size_t offset = hi20_sym_val - hi20_loc;
+						/* Calculate lo12 */
 						if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
 							&& hi20_type == R_RISCV_GOT_HI20) {
 							offset = module_emit_got_entry(
 								me, hi20_sym_val);
 							offset = offset - hi20_loc;
-				
+
 						}
 						hi20 = (offset + 0x800) & 0xfffff000;
 						lo12 = offset - hi20;
 						v = lo12;
-					
+
 						break;
 					}
 				}
-				
-				if (j == j_idx)
-				{
+
+				if (j == j_idx) {
 					pr_err(
 						"%s: Can not find HI20 relocation information\n",
 						me->name);
 					return -EINVAL;
 				}
-				
-				
+
+
 			}
-			
+
+			/* Record the previous j-loop end index */
 			j_idx = j;
 		}
 
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
