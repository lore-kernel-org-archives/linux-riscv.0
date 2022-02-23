Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39898C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfsiL9TpvzDQM8P6xJZMkxYynNX44mPj+csLIER68OY=; b=Cw3OcWBS0tVcZ/
	mvtRNEjRtKW7rJI7S0ocCOk1hPQ3EVUnugkCSOaB2aHaJ/bxoA3Pel3bbFIR3jILl9lwqUCuunQCx
	CF81Lix6/KiEuYgS2Ctb/NxDSAu573AzYXhKGPc/FlvXUu9wRw/x9sC3t6OmS8EOy+a0k2sEOY6o+
	oIl1+ALgS7J8lWf77G2/SngclTPFiCfAyzLN1nNOiP62FJ+BMW+Y4q/ccQzdjrMBXSVCaQeIw7DBx
	Fb8LuiMEjjoyFbn9+9ZMbVAN1f3dJcFOE+bn31gau1cBhtOAIxprzvcj18/85wxe4A9A38tNURRvb
	3r9s0MjVqxfa/YierFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMx4w-00FnYg-4y; Wed, 23 Feb 2022 19:13:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMx4t-00FnYC-KP
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 19:13:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id vz16so54604048ejb.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 11:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvNxmsK7om4nL0g4ISMz7hk28jUTX9RGKaudCuq0JlY=;
 b=qvK/o2neNOE9fwRjjEgYLKlvcTiSSxUZMrznc5hxZwocp9ffqx2apCHysxGbeqGDi7
 mH+RG4Wjj0AtY3gnZi2ySafbFWXK1qtl3uDAYuuaI3zMn7bzqLJptTrtySFiPKJr90Md
 MmsNZNYMcgiWrabAktg9+MJENZ0B/SVsoZGG9GPaYZVoFsmG8DoLqgcb2LU1yWjIOwZI
 iw1j6PSOpeWkcOhC7wFGKT7V1f3yDEw42P14B7kB549S5la2deEY19Op8vpkieCxXUj+
 bJ6vl7EjMpwiogGguNzTckZRVTyDZspXb6NNEnAVuhl/6QYfj70OJ48w0GvhGigu2UiE
 da8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KvNxmsK7om4nL0g4ISMz7hk28jUTX9RGKaudCuq0JlY=;
 b=CEOLTmW1mm84nCH8Rg7aVxUiHcXAuG4fUCCLu4R1ywond9Rcv7wOzMbjz1KnnzVQGd
 GOKh4FB0uFDp76IU34G89mhaObMu9FrXj/i2trwKADCTe0nK6JQFBDgzdzEDocHDUu9q
 9uHDdyZ3LCyOeBO1zraFm8ehiNbkk/OO+aVKwHrA+7AfiyBFZaRSx0lyifu92aUEc4VI
 UwQl1d2VIWzZCcV+evloyIQTgbHa4XB5Xi3cvefHzdlAWK1F0j2YMFQRS5blyq7+lp1I
 5A/gfwz/rAcCOjo60ZcjTP5b4I/Aa4gTF1lwarA7PR8Lq9jdnirwiFPvVslkKpauOjJc
 RDDA==
X-Gm-Message-State: AOAM530YmU1mJui4JW0PONdhr1zv/zTxtRbs09sS38wZ4K9Fc2fY1UFv
 Q1YfPFVCTII6cfCuKySRjtofG+DW0YLCij38
X-Google-Smtp-Source: ABdhPJyjtTfEFnQp3At+KO8m88JiOl5OJKsTdy/54iBndqcYTE66kpgLLNFrjFkUjL5zNNBDKQ4+ZA==
X-Received: by 2002:a17:906:8a5b:b0:6ce:2a05:813b with SMTP id
 gx27-20020a1709068a5b00b006ce2a05813bmr864005ejc.589.1645643609692; 
 Wed, 23 Feb 2022 11:13:29 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:6aa:aa1e:3637:3a48])
 by smtp.gmail.com with ESMTPSA id z22sm304172edd.45.2022.02.23.11.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:29 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix auipc+jalr relocation range checks
Date: Wed, 23 Feb 2022 20:12:57 +0100
Message-Id: <20220223191257.143694-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_111331_701701_8FEC965E 
X-CRM114-Status: GOOD (  13.42  )
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

RISC-V can do PC-relative jumps with a 32bit range using the following
two instructions:

	auipc	t0, imm20	; t0 = PC + imm20 * 2^12
	jalr	ra, t0, imm12	; ra = PC + 4, PC = t0 + imm12

Crucially both the 20bit immediate imm20 and the 12bit immediate imm12
are treated as two's-complement signed values. For this reason the
immediates are usually calculated like this:

	imm20 = (offset + 0x800) >> 12
	imm12 = offset & 0xfff

..where offset is the signed offset from the auipc instruction. When
the 11th bit of offset is 0 the addition of 0x800 doesn't change the top
20 bits and imm12 considered positive. When the 11th bit is 1 the carry
of the addition by 0x800 means imm20 is one higher, but since imm12 is
then considered negative the two's complement representation means it
all cancels out nicely.

However, this addition by 0x800 (2^11) means an offset greater than or
equal to 2^31 - 2^11 would overflow so imm20 is considered negative and
result in a backwards jump. Similarly the lower range of offset is also
moved down by 2^11 and hence the true 32bit range is

	[-2^31 - 2^11, 2^31 - 2^11)

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 68a9e3d1fe16..4a48287513c3 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -13,6 +13,19 @@
 #include <linux/pgtable.h>
 #include <asm/sections.h>
 
+/*
+ * The auipc+jalr instruction pair can reach any PC-relative offset
+ * in the range [-2^31 - 2^11, 2^31 - 2^11)
+ */
+static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
+{
+#ifdef CONFIG_32BIT
+	return true;
+#else
+	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
+#endif
+}
+
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	if (v != (u32)v) {
@@ -95,7 +108,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 	ptrdiff_t offset = (void *)v - (void *)location;
 	s32 hi20;
 
-	if (offset != (s32)offset) {
+	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, (long long)v, location);
@@ -197,10 +210,9 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 fill_v = offset;
 	u32 hi20, lo12;
 
-	if (offset != fill_v) {
+	if (!riscv_insn_valid_32bit_offset(offset)) {
 		/* Only emit the plt entry if offset over 32-bit range */
 		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
 			offset = module_emit_plt_entry(me, v);
@@ -224,10 +236,9 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 				   Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 fill_v = offset;
 	u32 hi20, lo12;
 
-	if (offset != fill_v) {
+	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, (long long)v, location);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
