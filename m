Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C56CFA76A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uY4IYi5Itn/fsGd+rw9ToSiXoKbsgFpTdOELvM15Nb0=; b=jCr4eUqq7EIoQK
	MuXFf0aLMXuuDHYCAyi3ShFHC2X5n/yVmCLLaIq1HQimEjE+5/oWq9/8+FB7Obf635u23A//fT/II
	DenNg68Q4VxPBiTrYxEpxAudmbQZPjveeDg8v62Gtcuefnj8TC/il9qMAdzVx56z2vCrMdPBWbmgz
	o2WaeShfS7JrfYuORjS1Ey5aMKAqbEkieO7B02YygenVqPrzm8ZVYaS9LbbA2cpO4jnRSIGEPE9fo
	JQrszc1GWdIs/Y/kufgVXceKcEeJUcfdwNWE7tAjmDaq+mnEUr0HAlcnzlEjUaTd0vJSm2leIlQPn
	55bfs3c2fCYcF1r+5drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swgOq-0000000C640-1pAq;
	Fri, 04 Oct 2024 11:23:08 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swgMN-0000000C5Co-2Bj8
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 11:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ndQVvTzHXT+i+I2ixdEppGGTUj/crNj5V52A15z/KHw=; b=LOHuSvTbUih/iyHTk7rAEirIgS
	03Da0jmdAE+jys4xN3dTPuXEqkp1R+ic8zboh1Y6ES9gVlFo9nk4vQNkPLbUt1czxJ+B3MYL6BUS7
	M/2llWaROd/8L9sKRaaBtCFzvqjU7ut2YxPhgjZCDf5cOwpkVatvV4e00XMlnKGt8Ps6eUfIviRqu
	S/5EVG2RH/LbCbU8pNKUTstFqAC0RP1CMez0uQApQLT2z5zbGKnNJhQLE2Lp2VIwYwvKD9b1L+CVQ
	RrlGBS4IBsggqS58SSAz3n9QloEXfaOD1IEmybjMX28V1tN7W9S56WW9F4CWa1zAZDTERt41h6+aU
	vwifp+2Q==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1swgMG-00AP4b-Lg; Fri, 04 Oct 2024 12:20:28 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1swgMG-0000000B4an-2dWu;
	Fri, 04 Oct 2024 12:20:28 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: insn: add RV_EXTRACT_FUNCT3()
Date: Fri,  4 Oct 2024 12:20:27 +0100
Message-Id: <20241004112027.2639252-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_042035_663550_6B7E22AF 
X-CRM114-Status: UNSURE (   7.89  )
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
