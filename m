Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9DBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADEpjhhpnWooiSDL4nXYtMKcweKRiHZeuz9Syaia/Wo=; b=WlKA4jfC73Ej6d
	75E/R0WV3PmO2Xzj8DR1pWa2nN7zuP8aQDIoDFpt0+PVkQLnbWtv3JoemnkC2Y/Sq5zAGBa8zMqMJ
	VNozPamar/2tl9X4RdvOwew2wPVDsnhopQTRjFpCVA5SOhswuuvcm1bjzSZ5/b4RzqelDRlwmO3Qr
	WIaIjeeLg+SwqJIpqoMOl8BCm9YMBtWCYWYrqgcAtY/DLweGo70D+0V3SHgCUHhR3Yy+JMiJUQzY9
	8uwcSVaZ4PgWVKzYMf/TnX2rixaRY1oK7o3kL/cgQvBmmZExE0Q8D8dU5RALpscg4NwVTg0o3FZFp
	4/uqWEUK/yByB5zPhzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbPP-00ALRX-Bi; Mon, 31 Jan 2022 18:28:11 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbP5-00ALCv-SQ
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:27:53 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so13835125oth.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pFasC+wyxSnpAZ2usTdBEAt8b8vmkJCatL6gaFi2YnA=;
 b=jpvQ12JqsAmFiYXikZczOVDw5Kt0XfkhYMBMzN6tcJTC0FJYu+eD55ciJJi5xu+xHK
 oVgSpKYqmmNFXvxtbjYbM7q1joXuoE3Rbh1bNsWsWRSdTybFgvZr7/NQfmMG4HtfKIKG
 /5rSVurc0tNqeuZZTrKFzuZb0N6M2N5YH3LWhKryCYuun0JxbvgkTp/58CgzctLUQ9B6
 3PeZ6hWRPyRORzvu2gB3By23xMKcv31tvbkcvFSp3LTWHOwTX6X9iFBc8vTyMnTaC4nW
 qDessmj1nBnuYWhbzRkklIq6ewo0Aih4AFMR1V3VMexgtpaNoequZrxlCHp2bLOm+J49
 5AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pFasC+wyxSnpAZ2usTdBEAt8b8vmkJCatL6gaFi2YnA=;
 b=6W0RseTrdw5niMlzu/WqYANpy8Sr6vTMGRwrHMBYCNg/Kngv4nK0rraYAazeu21gDP
 ftU8J+BXYFk/jq2dxXfMuCwEReHApCBWflg4rIAdXgnlPyZ/WrgI7W+wJaFZFevkQIp3
 cAc13WJ7pFOzhiMJOTDNnJ48xWCWsOudmIUKTUFQAHfAqqT1YM+s5PRPgK7Mp3CtgRgS
 hQXtiaFf2jdDWoeoG3hWEZ+W/rwWW3VhritssGcuzmeMam0uotJeqa2BVBlUqkQOdxYi
 L4PIYoauEYyYLo08ktTZi3/gXwJzgFAFbAjuqdjQ/fOJSLOrWIbDLApnESNztjLKfJEb
 KWrQ==
X-Gm-Message-State: AOAM531dcx3+1ZHk000BOiw8Jb5QGlnV0TjKyYmUIjBa3OUHM8We4ybS
 L/tvbwsm+NlA6Ywg3yu+P75tYxWE20LBVg==
X-Google-Smtp-Source: ABdhPJzBTaqANAdPoa+FjV2Ik3Mc6tUBsaq3/j7JGk9sEd6q1zJXozM9fiU3Tnt/9CFg85fhURwygA==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr12038860otk.177.1643653669852; 
 Mon, 31 Jan 2022 10:27:49 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id a26sm16041676oiy.26.2022.01.31.10.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:27:49 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] riscv: Fix auipc+jalr relocation range checks
Date: Mon, 31 Jan 2022 19:27:16 +0100
Message-Id: <20220131182720.236065-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182720.236065-1-kernel@esmil.dk>
References: <20220131182720.236065-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102751_934439_9F0D7076 
X-CRM114-Status: GOOD (  15.00  )
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
	jalr	ra, t0, imm12	; ra = PC + 4, PC = t0 + imm12,

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
 arch/riscv/kernel/module.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 3d33442226e7..a75ccf3a6ce8 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -13,6 +13,18 @@
 #include <linux/pgtable.h>
 #include <asm/sections.h>
 
+static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
+{
+	if (IS_ENABLED(CONFIG_32BIT))
+		return true;
+
+	/*
+	 * auipc+jalr can reach any PC-relative offset in the range
+	 * [-2^31 - 2^11, 2^31 - 2^11)
+	 */
+	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
+}
+
 static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 {
 	u16 *parcel = location;
@@ -111,7 +123,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, void *location,
 {
 	ptrdiff_t offset = (void *)v - location;
 
-	if (offset != (s32)offset) {
+	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, (long long)v, location);
@@ -201,10 +213,9 @@ static int apply_r_riscv_call_plt_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	s32 fill_v = offset;
 	u32 hi20, lo12;
 
-	if (offset != fill_v) {
+	if (!riscv_insn_valid_32bit_offset(offset)) {
 		/* Only emit the plt entry if offset over 32-bit range */
 		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
 			offset = (void *)module_emit_plt_entry(me, v) - location;
@@ -226,10 +237,9 @@ static int apply_r_riscv_call_rela(struct module *me, void *location,
 				   Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
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
