Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D99CCDB47A
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emvQE4qsE4jAlUljkk/q5C0TV+DF9M8zMhfgq9G2/ME=; b=UB50bDhXw3nNKB
	vxMRTDOimjY+zLDXud1i4PtA3AmN51tod/QuzoyWiPP6GML+DYJHPlri3enttDPM31cia0Hk1gbOs
	u30QASLw2Ol1RkIcqNqzjdycg8KyxHYqg6nWEuKeNifeYoLai4Mws/n3dUdk+TQwXf2LN+Yi7anHT
	hyzv6dvmAv6sSIAUgIVxmsSrF3V+SaKhN3dHlgQxTc68+q67kTKJLMwr4tOwnScICifb9H7BFgYKb
	xKsw6bMnR1C0V9hl0t1YwIXJeDjSuZ3s9PtDRpLpc1jKRIXnWj6DKYiYiGOEN0y7d4dT1vhYzXvft
	I6/IFYvVHl978911fdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVr2-00000004MYw-38Yc;
	Mon, 22 Jun 2026 04:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVqw-00000004MTa-3kgc;
	Mon, 22 Jun 2026 04:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E997344554;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC68C2BCB4;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782100901;
	bh=Vd7pJ/GZnCkwymgA2w5VXuoQUkHwDpIXijdgJXkxMXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f5rvf+hYTCnL3Es93Xr2ZUOWgOkNf0UzTRL3dkVpAwSDo1RVmXBDcWKfRNKURe2W+
	 fjHFsZb6g3SDtbuWtvZoJIugoOGVukRUMOqMxJt6Ghv4Srz70J2b3kc/ofk5j5u3oG
	 D2lKD6DTuS4WXaxVjYs0G7UfEm1VJf8zqZGbz1z1Y/XZYXXoQG7X/fcAU+dooo2UFR
	 BsCVLm1jT8R4ORPFzgRLQX4ZUIxE8giIK+fBrTbKTaR5wnvU98BbJoIQPrYpAHIWOQ
	 /oFvKIaOLaIIqwDetzcrQNKxWpNGuKRIaMi+nkWip7MaYHScSu5a74dr0NsRasKkMC
	 1uT9DeuMgh4pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B62CDB46F;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Sun, 21 Jun 2026 21:01:26 -0700
Subject: [PATCH v2 08/16] riscv: kvm: Use generated instruction headers for
 csr code
MIME-Version: 1.0
Message-Id: <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782100900; l=2903;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=K3nlHLRVqUIL1C57tfA+TsyDzlXTk7zsvNIuKkm7Q9o=;
 b=bqIxyzSLPdziV664M2ZVX8utiG1JdEZecaZjIMvKdW3/LGTcMO61R+g5yEx/a81/rdlXv2Oq/
 x2vHsRtLp4pCvohRrDYuuDqnWcj5+AgbREVZ+9yILLgId+7y5wwsCIP
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260605
 with auth_id=810
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

Migrate the csr parsing code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This is a simple transformation that I have again validated through
brute force.
---
 arch/riscv/kvm/vcpu_insn.c | 47 +++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..8ccf6ec722f0 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -146,43 +146,44 @@ int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
+	#define GET_REG(_rd) (*((unsigned long *)(&vcpu->arch.guest_context) + _rd))
+
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num = insn >> SH_RS2;
-	unsigned int rs1_num = (insn >> SH_RS1) & MASK_RX;
-	ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
+	unsigned int csr_num;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
 	/* Decode the CSR instruction */
-	switch (GET_FUNCT3(insn)) {
-	case GET_FUNCT3(INSN_MATCH_CSRRW):
+	if (riscv_insn_is_csrrw(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_val;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRS):
-		wr_mask = rs1_val;
+		new_val = GET_REG(riscv_insn_csrrw_extract_xs1(insn));
+		csr_num = riscv_insn_csrrw_extract_csr(insn);
+	} else if (riscv_insn_is_csrrs(insn)) {
+		wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRC):
-		wr_mask = rs1_val;
+		csr_num = riscv_insn_csrrs_extract_csr(insn);
+	} else if (riscv_insn_is_csrrc(insn)) {
+		wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
 		new_val = 0;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRWI):
+		csr_num = riscv_insn_csrrc_extract_csr(insn);
+	} else if (riscv_insn_is_csrrwi(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_num;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRSI):
-		wr_mask = rs1_num;
+		new_val = riscv_insn_csrrwi_extract_imm(insn);
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrsi(insn)) {
+		wr_mask = riscv_insn_csrrwi_extract_imm(insn);
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRCI):
-		wr_mask = rs1_num;
+		csr_num = riscv_insn_csrrsi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrci(insn)) {
+		wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
 		new_val = 0;
-		break;
-	default:
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else {
 		return rc;
 	}
 
+	#undef GET_REG
+
 	/* Save instruction decode info */
 	vcpu->arch.csr_decode.insn = insn;
 	vcpu->arch.csr_decode.return_handled = 0;

-- 
2.54.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
