Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39F0CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ8nV7JCtx3ZvsIhxwpHASkZ0KCGj4Yms03fSQJoFvk=; b=h5UgJGmE6U1b0b
	yO0w4XkpFztBQ8nx8ScQYYih9RbKst2JR+vpLcCpXYCpyBUFJPMYAhPeWjs2hUiAxhoNR7ET18IMx
	mJ7mWe3/xyG0hEXvOYDBSWq1wJpbtlLgEaEZfuCxrZsBPdPKJDgOJjAgfPtwhqB8VKFvgdJOJrzgD
	9xdR78wXpGlAXnoXAMuBtYWOkmQwKX0ZPv7uCEbZur+5TgnzBIG8ysr2Gk70b2wT7356cgQ+O4Yn3
	jZKgspqLfJVJ6BL1yZLbqnxlgOI+O+SSdk7Ppo41xNgJfg0vFhdz8XlpUrn0+DJZrhgBIdUjPl7Fe
	31QYBx9mrypTu77YmOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphva-00000004C6K-1htZ;
	Sat, 23 Aug 2025 06:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0h-00000003CZR-1O7Q
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=BbBY6NPm5sNqyj5xvW1kmPQR/4ysuemf5S+6Sr88shw=; b=C4/9MJNdKgD1K9Lpbm9GBtlDWj
	AMhh+affqTVN2VvT778unDcJaJf80QNDrQAz8cCja2PixAMFNwFqrc9cL6T7EfwjwoadC5RE2ZVRU
	XN+tkAxxZyq/w1OXFsuY8Ih7m6S8hMxe3hX3eHZYpjP6cufO2otHc6LAv+RYyT9nlASItIskCe2VC
	daKJBgLfkvE5/teq5BRAXVsiMoaAkj5KmbdDPNJ/NjfgxbDa2rU5otvm7TfwqIt6jbOJgwtIttwx4
	2B0kyY9zhrAeEIxDRYi77yqqRFSEzp79/TVqNTfg5K2ORi6iZcaYw9W3nD9jSafA8oTECKEtokYIs
	MbaU8G1A==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s6-02Fy
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BbBY6NPm5sNqyj5xvW1kmPQR/4ysuemf5S+6Sr88shw=; b=VG6aly5E5llsRgCsEXZLL8TVGl
	i0KPn3M4hKZvadLzsG2sC/ZuuATJ+y/dLYvUjdemb994Wyqi1AGRYrh7Arhq3GJCIz1AAl2M5/v5j
	ZDYQ/C8pem66iPs9UeYEVFzBYxPhRL5ltmN5DifL53DmzHckiabsfVex18XGyI9r4oo8Plwr3JGug
	RLjldlkKu0tEAi6/M+27xYnklp+3PJFyJPHN1aI3WxHZ9Yem7QjMZ24Q8SeFwSuCB9SNWS9ARvbqI
	RCBl93Wkq/RlceATWuSJ2Jx9AalplF/tvfoHrhqSNrxpNfu/Fe3LX4AXkFkB4Mj5Gackxu4Hinj63
	FY5S+NRQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0T-0015cl-UY; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPO-2UFp;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 08/18] riscv: bpf: big endian fixes, updated BPF_ALU ops
Date: Fri, 22 Aug 2025 17:52:38 +0100
Message-Id: <20250822165248.289802-9-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_204863_BBC59C4E 
X-CRM114-Status: GOOD (  12.62  )
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
index e7b032dfd17f..0191db443485 100644
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
index 10e01ff06312..946cf2ab8cfa 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1479,20 +1479,25 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
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
