Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED0FD49761
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Dec 2024 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8OQAfZyQNbK2nc/8vRYmXGsLl5eHEYtf/CgqsSUVv0=; b=Si3PdgLlMiVqmj
	s2G0z1TFxIa6+VUiM56fysLvB6/oCS7hs2D9QkAiidF4vmy3s5O1pxX3tEu313vqBX649m89MIfEd
	KZe4264KLcOl0O5iJwBYwA+WQvfvuqbGy/sAaIRuL7sggm6+Iq5AQOQEa0FKElPvX6ZAfgyKxLCW4
	qSPETHc87ewmWTayoq1vexmWKaCJU+ZUsRvQd4o+25B53aMxCoe4o8gRXd4fWDjcKr7y1emtu2VPY
	nEU8HvFydqSw+7RT/jcI5bhYjwzTCyuQprWqJLMi2J/k/ufxs3hOfZbfNFrnAcpoQL91dsQUMEhPe
	fZhPkGH8LeNvLZxSZUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBT-00000003INg-26eL;
	Sun, 01 Dec 2024 10:28:11 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBQ-00000003IMK-3IVO
	for linux-riscv@lists.infradead.org;
	Sun, 01 Dec 2024 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nfGXRLkquFvg92946tM0Zd0jB72ZUCP2hBvLATnXeSA=; b=oJAVQ4A5087W7FUIdboGYQ6WJ9
	9jRF7VWrg+c17zvdIMUMes2L8z3zBFzGxiqaheP2cbQFIxZvNIF7J/6w3OOBEDJbALml+jqtLpbK9
	eTOURTIl2nTFEXwXrt3jYlTWUvkexSiryhiS89rlKFwhIXzi1y7IlBMUH+RF7Rs/p6hcbWgeA8tp8
	mI3+f3E0QNmtXBoePzWlLP+NLTtiVCT+fHrXBQbEpuc21OATvdA0TXbg5acmVvNwiU+5tqJyiYskK
	I4IwEwzhTHxW6x8SkXroGe4v30884IRIyZBWW+dvr8lYegyGYU0p/aQl4RY+P4RlhSS2Jb3VTDIq4
	bvNP1T2A==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tHhBJ-00FjrQ-1n; Sun, 01 Dec 2024 10:28:02 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tHhBJ-00000000vYv-3XqN;
	Sun, 01 Dec 2024 10:28:01 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com,
	palmer@dabbelt.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 3/3] riscv: insn: add RV_EXTRACT_FUNCT3()
Date: Sun,  1 Dec 2024 10:27:59 +0000
Message-Id: <20241201102759.221176-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_022808_902661_272C651C 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

Add extraction for the func3 field of most instructions
for use with anyone who needs it.

Note, added this for decoding of CSR accesses for
work we did looking at the RDCYCLE v RDTIME calls.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/insn.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..c67f44ff2066 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -299,6 +299,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
 
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK)); })
+
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
