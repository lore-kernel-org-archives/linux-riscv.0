Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E252C43458
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZ27Z5jG1711YBNY7LMUa/1k+/1cPZ7JxmYE+Er1gpE=; b=FTEEMwXv6vwfpn
	wD/yWmXqJ/kCITjS6fa11CzjtscY5rhd3q6syY31UR5II9ZoVAltM++m0buyowwR6uJRt7ByW4Nfv
	C8HJNm7Mz1qSMbnMBrP8JfI8hojCO/8OoTV/jTl32XAiiEJKnONNZylxQdkqKJ5PnAV081tsXuBMe
	9/LhKbe3Mqdf9di9wpM5VDZBbX8sPv0dmU4FWExv3AijXdjou+axvAlfiwka06pLtEdB+oV3b2Kfc
	/LGLg9H7wOTQMiNVK/L75ohlIufpeQUgFmc1l2Devkg06kDO7nrgr8Cmmj04LEqu5eUnpyItfQRP0
	qYIr05LhpKnSMVOi+0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEhZ-0000000GTMl-1fgQ;
	Thu, 16 Jul 2026 05:32:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEhX-0000000GTMI-38b0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 05:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7B443C88;
	Thu, 16 Jul 2026 05:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB017C2BCC9;
	Thu, 16 Jul 2026 05:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784179923;
	bh=K0/fBpvEVREYxAiLlkvLaBfaiGgV73UlQbngXGM401c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pTHEJbrTAB4h/ToeJQ/nV7mPrkm7baTfm9LUP/JbnPIBGjH/hQHzwTXcyJ+k25TGX
	 +sq1EtecKRe2CwDhUZJa2u16qG1vY1FZUY+3BbTcwhXXILTDPo+jNaEed9cpR3vfG5
	 iB1yDsRF91MpqSPCs1WFNFAhRWK8vTnP7FdnXl6ddigq+X2ni31a3F8Hx+3MVRNPke
	 y/wY6S1kuyjYRQJcOW4dXZNgIIPdEmYWmo6v18EN0zujj5CfHTcLxUfDGE0JDEzhOr
	 SuUin9uUQYwHAbN+yzMUvrmADQ0pPu/zdHpzjgbnkKilVAy3TlGXRxzVkp6Mu2NVCp
	 5X5H4OiarQLNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD830C44511;
	Thu, 16 Jul 2026 05:32:02 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Thu, 16 Jul 2026 13:31:49 +0800
Subject: [PATCH 1/2] modpost: ignore generated GCOV and RISC-V local relocs
MIME-Version: 1.0
Message-Id: <20260716-modpost-v1-1-8eab36cc7310@ultrarisc.com>
References: <20260716-modpost-v1-0-8eab36cc7310@ultrarisc.com>
In-Reply-To: <20260716-modpost-v1-0-8eab36cc7310@ultrarisc.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784179921; l=6237;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Qmcrh0ELG719bfZpzSpb/gjTYnW7s0pXlwROWQGT5ys=;
 b=MjwTgun4996uhG+72Cge2Wt8gh9lXuzarMQqAKiDdWhEPqtokFnkCGZq1qwlRPlu0T5iJKfuJ
 TLL9keOWHMSDHujPLTMdvuryg9oHoTjpjuBC8JMCwKOGa5WVOaIjVXT
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

GCOV_PROFILE_ALL can make GCC emit constructor and metadata symbols
that reference init or exit sections. modpost may then report section
mismatches through generated symbols such as _sub_I_* and __gcov_.*,
even though those references do not describe a normal section lifetime
dependency in kernel code.

RISC-V also uses local branch and PC-relative relocation pairs that can
resolve through compiler local or mapping symbols near init or exit
code. Treating those local relocations as ordinary lifetime references
creates a large number of bogus section mismatch warnings.

Teach modpost to keep the raw target symbol for generated-symbol checks
and pass the relocation type into the mismatch filter. Ignore GCOV
constructor and metadata symbols, compiler mapping symbols, and RISC-V
local branch or PC-relative relocations when they target init or exit
sections.

This was seen with an rv32 randconfig using KCONFIG_SEED=277518 with
CONFIG_GCOV_PROFILE_ALL=y, CONFIG_KCOV_INSTRUMENT_ALL=y and
CONFIG_DEBUG_INFO_BTF=y, where modpost emitted a large number of bogus
.text to .init.text section mismatch warnings through generated GCOV
and local RISC-V symbols.

This keeps named symbol section mismatch diagnostics while avoiding the
warning flood from compiler-generated references.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 scripts/mod/modpost.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a7b72a81d248..6869822446bd 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -951,8 +951,50 @@ static const struct sectioncheck *section_mismatch(
  *   refsymname = *.constprop.*
  *
  **/
+#ifndef R_RISCV_BRANCH
+#define R_RISCV_BRANCH		16
+#endif
+
+#ifndef R_RISCV_PCREL_HI20
+#define R_RISCV_PCREL_HI20	23
+#endif
+
+#ifndef R_RISCV_PCREL_LO12_I
+#define R_RISCV_PCREL_LO12_I	24
+#endif
+
+#ifndef R_RISCV_PCREL_LO12_S
+#define R_RISCV_PCREL_LO12_S	25
+#endif
+
+#ifndef R_RISCV_RVC_BRANCH
+#define R_RISCV_RVC_BRANCH	44
+#endif
+
+#ifndef R_RISCV_RVC_JUMP
+#define R_RISCV_RVC_JUMP	45
+#endif
+
+static bool is_gcov_generated_symbol(const char *sym)
+{
+	return strstarts(sym, "_sub_I_") ||
+	       strstarts(sym, "__gcov_.");
+}
+
+static bool is_riscv_local_reloc(unsigned int r_type)
+{
+	return r_type == R_RISCV_BRANCH ||
+	       r_type == R_RISCV_RVC_BRANCH ||
+	       r_type == R_RISCV_RVC_JUMP ||
+	       r_type == R_RISCV_PCREL_HI20 ||
+	       r_type == R_RISCV_PCREL_LO12_I ||
+	       r_type == R_RISCV_PCREL_LO12_S;
+}
+
 static int secref_whitelist(const char *fromsec, const char *fromsym,
-			    const char *tosec, const char *tosym)
+			    const char *tosec, const char *tosym,
+			    const char *raw_tosym, unsigned int r_type,
+			    unsigned int e_machine)
 {
 	/* Check for pattern 1 */
 	if (match(tosec, PATTERNS(ALL_INIT_DATA_SECTIONS)) &&
@@ -981,6 +1023,21 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
 	if (match(tosym, PATTERNS("__init_begin", "_sinittext", "_einittext")))
 		return 0;
 
+	/*
+	 * Compiler-generated local labels and GCOV constructors can produce
+	 * relocations that are later reported as section mismatches against
+	 * nearby init/exit symbols. Do not use those generated symbols as
+	 * evidence of a real section lifetime dependency.
+	 */
+	if (match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
+	    (is_mapping_symbol(raw_tosym) || is_gcov_generated_symbol(fromsym)))
+		return 0;
+
+	if (e_machine == EM_RISCV &&
+	    is_riscv_local_reloc(r_type) &&
+	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)))
+		return 0;
+
 	/* Check for pattern 5 */
 	if (match(fromsec, PATTERNS(ALL_TEXT_SECTIONS)) &&
 	    match(tosec, PATTERNS(ALL_INIT_SECTIONS)) &&
@@ -1025,21 +1082,25 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 				     const struct sectioncheck* const mismatch,
 				     Elf_Sym *tsym,
 				     unsigned int fsecndx, const char *fromsec, Elf_Addr faddr,
-				     const char *tosec, Elf_Addr taddr)
+				     const char *tosec, Elf_Addr taddr,
+				     unsigned int r_type)
 {
 	Elf_Sym *from;
 	const char *tosym;
 	const char *fromsym;
 	char taddr_str[16];
+	const char *raw_tosym;
 
 	from = find_fromsym(elf, faddr, fsecndx);
 	fromsym = sym_name(elf, from);
 
+	raw_tosym = sym_name(elf, tsym);
 	tsym = find_tosym(elf, taddr, tsym);
 	tosym = sym_name(elf, tsym);
 
 	/* check whitelist - we may ignore it */
-	if (!secref_whitelist(fromsec, fromsym, tosec, tosym))
+	if (!secref_whitelist(fromsec, fromsym, tosec, tosym, raw_tosym,
+			      r_type, elf->hdr->e_machine))
 		return;
 
 	sec_mismatch_count++;
@@ -1152,7 +1213,8 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 				   Elf_Sym *sym,
 				   unsigned int fsecndx, const char *fromsec,
-				   Elf_Addr faddr, Elf_Addr taddr)
+				   Elf_Addr faddr, Elf_Addr taddr,
+				   unsigned int r_type)
 {
 	const char *tosec = sec_name(elf, get_secindex(elf, sym));
 	const struct sectioncheck *mismatch;
@@ -1168,7 +1230,7 @@ static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 
 	default_mismatch_handler(mod->name, elf, mismatch, sym,
 				 fsecndx, fromsec, faddr,
-				 tosec, taddr);
+				 tosec, taddr, r_type);
 }
 
 static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
@@ -1382,7 +1444,8 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 		}
 
 		check_section_mismatch(mod, elf, tsym,
-				       fsecndx, fromsec, r_offset, taddr);
+				       fsecndx, fromsec, r_offset, taddr,
+				       r_type);
 	}
 }
 
@@ -1419,7 +1482,8 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 		}
 
 		check_section_mismatch(mod, elf, tsym,
-				       fsecndx, fromsec, r_offset, taddr);
+				       fsecndx, fromsec, r_offset, taddr,
+				       r_type);
 	}
 }
 

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
