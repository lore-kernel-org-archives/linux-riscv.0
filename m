Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE3FE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaYAfrjgmbUTKoG8g52vuSqIDdA5oeOMpOUmUrautbc=; b=RPQXvxI9cyfV63
	KISWJXNxzLVg8bkjkB4WdgchfNhnE0rB1FeNm3xy+10SWXfDxKdInt3wjCdlX7HbMVUDqvVRnYPqH
	MYgcpV4tZjVzViSe8YUxqAONFFSl0X9RnIOv9oNf5v1aU0KrPAFvCAJZNEjZZnMphpyPr6uoYPgsK
	Ijlsramlde+Uq8LTAyYHacT6aFcJya1/ysyoeJlKMzUtWceo3V356t2dMsuoeTgX3Q9Qr2uZueNBS
	YEC9mkbKSx6w4m8Y52HGyDcjFN4kGHBTi0lsUGfdyLkqa6RKM4LgSOnHq0oUPK4vw2jugVTg9zVJ7
	pWNTcqqJCf4XRkhndHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOJ-00000005NvZ-2cc8;
	Fri, 20 Dec 2024 15:58:15 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005NqY-1lRO
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kRvzRkr5gY/5pQR/YZDxLWbtpc+EzjrXZMVpv2FaDuE=; b=7LR5nXrrSIlqdn+O334qwTvYV5
	MbPi7i4s4eNT+MWfDv6vQrQk5KzJ9bGGeoZTBehC24hFCgOCx/I4wyo1vV5qj0X2G7UcO4RqU5mtN
	pnzPDwMMolGWGSMR0djJE1wyOT0Kqz4szvHiCWenVck4dT8PzkMnfO14Cmag4ouQXrBJ5e1lD3sDU
	f43eVSpROiAfPezeHTIIQ7rdlLGKigICym+lRtmPUGzLgp8L5rE3z7ShaPUEwhf5+sJF1UYmNKL/v
	wiSuHJw7KftBRYdZk7WrGkdHMKjowWwJgIv2iXZvX+4AecY9IH748bSt3R9e6zW6hC/Xidsj4x6Hl
	cdmyv1lQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAO-3J; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LTF-3hiI;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 12/15] riscv: bpf: big endian fixes, updated BPF_ALU ops
Date: Fri, 20 Dec 2024 15:57:58 +0000
Message-Id: <20241220155801.1988785-13-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_453404_70720C8C 
X-CRM114-Status: GOOD (  11.83  )
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

If running big endian then the instruction stream needs to
be written le16/le323 and the BPF BSWAP instrictions need
to correctly set the endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/net/bpf_jit.h        | 14 +++++++++-----
 arch/riscv/net/bpf_jit_comp64.c | 29 +++++++++++++++++------------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 1d1c78d4cff1..eb2908cc42fd 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -28,6 +28,12 @@ static inline bool rvzbb_enabled(void)
 	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
 }
 
+static inline bool alu_end_should_swap(u32 code)
+{
+	u32 endian = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) ? BPF_FROM_BE : BPF_FROM_LE;
+	return (code & BPF_FROM_BE) != endian;
+}
+
 enum {
 	RV_REG_ZERO =	0,	/* The constant value 0 */
 	RV_REG_RA =	1,	/* Return address */
@@ -117,10 +123,8 @@ static inline void bpf_flush_icache(void *start, void *end)
 /* Emit a 4-byte riscv instruction. */
 static inline void emit(const u32 insn, struct rv_jit_context *ctx)
 {
-	if (ctx->insns) {
-		ctx->insns[ctx->ninsns] = insn;
-		ctx->insns[ctx->ninsns + 1] = (insn >> 16);
-	}
+	if (ctx->insns)
+		put_unaligned_le32(insn, ctx->insns+ctx->ninsns);
 
 	ctx->ninsns += 2;
 }
@@ -131,7 +135,7 @@ static inline void emitc(const u16 insn, struct rv_jit_context *ctx)
 	BUILD_BUG_ON(!rvc_enabled());
 
 	if (ctx->insns)
-		ctx->insns[ctx->ninsns] = insn;
+		ctx->insns[ctx->ninsns] = cpu_to_le16(insn);
 
 	ctx->ninsns++;
 }
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 4cc631fa7039..05f5b1a88423 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1273,20 +1273,25 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 	/* dst = BSWAP##imm(dst) */
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
-		switch (imm) {
-		case 16:
-			emit_zexth(rd, rd, ctx);
-			break;
-		case 32:
-			if (!aux->verifier_zext)
-				emit_zextw(rd, rd, ctx);
-			break;
-		case 64:
-			/* Do nothing */
-			break;
+	case BPF_ALU | BPF_END | BPF_FROM_BE:
+		if (alu_end_should_swap(code)) {
+			emit_bswap(rd, imm, ctx);
+		} else {
+			switch (imm) {
+			case 16:
+				emit_zexth(rd, rd, ctx);
+				break;
+			case 32:
+				if (!aux->verifier_zext)
+					emit_zextw(rd, rd, ctx);
+				break;
+			case 64:
+				/* Do nothing */
+				break;
+			}
 		}
 		break;
-	case BPF_ALU | BPF_END | BPF_FROM_BE:
+
 	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
 		emit_bswap(rd, imm, ctx);
 		break;
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
