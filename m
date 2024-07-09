Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55487C3DA47
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GgpIi4pfprIaGTGBUvfg9MtMBm8ZijyUpF7JzyIYls=; b=xQotoOQjbUD1rn
	zWgqLMN3/nauO9yFtMYKziigVA2QXR7QLzMUtmCqKeTAE+TXY+vzCPueQQac3n4RK+C83Y6vNzH4z
	vbP81ETJJlwo4HKBUgtqSyjXrpakTCreRcYSJmij9PX+cKaaTBj55AIPFETr77V3UoysL/X7kz5ir
	My66LS1A3a3HfjkXUi8sPV2ptrLDtOWUh6M407OjEFR+xcQKmNjCsK7Vrf13oaudlLCPiva3aTJbu
	CI7pLxI9q5i3s+m+vzEXhdN9dDnlihCoF+WIaRAEZMuj/dwRNnqtUQxKDlCzb0xW5z1avC45f+xYd
	4u64yfnxozthCJI/qDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZK-00000007uON-220z;
	Tue, 09 Jul 2024 16:19:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZG-00000007uLU-1qxn
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 16:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43884CE129B;
	Tue,  9 Jul 2024 16:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4037CC3277B;
	Tue,  9 Jul 2024 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541987;
	bh=EH0mnbrlmuEp86OTO77hyOOmJF9pAhGe7cuKGLBxhr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LaYbZR0m9Y+rRj4eH1Xq1t1wqhNEEiw+RfzveoiPWWpDBIwX6jQVlvhOqim6q7Zyo
	 LOXNpvJcKeeKb68j5o6vMWWwujuqWRKv7kvCY0u8b3cEVeEuX3hnFZIzJzkcGHu5L6
	 KPRd7g+sqe2abfXeMvkgsmzVKBfQzGEfkuuf+9A+Byft5erNMNPNEIPOU18c66LdP3
	 OeGtwFnEANVOJkAVJwIwlST40yCU7F7ZMXmOLMnaQFXdD7I64Zkgbw6AlGaU+PAL7I
	 hG+5Ho3YGIyZ7ddRA+lH4sroSe6erW14+yK2EiqdQ8/XHS/tFgB4mvTybe4SNL8tEW
	 IWgD6M4NKgRfw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: errata: sifive: Use SYM_*() assembly macros
Date: Wed, 10 Jul 2024 00:05:21 +0800
Message-ID: <20240709160536.3690-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709160536.3690-1-jszhang@kernel.org>
References: <20240709160536.3690-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_091950_674510_16A14BFF 
X-CRM114-Status: UNSURE (   8.45  )
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

ENTRY()/END() macros are deprecated and we should make use of the
new SYM_*() macros [1] for better annotation of symbols. Replace the
deprecated ones with the new ones.

[1] https://docs.kernel.org/core-api/asm-annotations.html

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/sifive/errata_cip_453.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
index f1b9623fe1de..b1f7b636fe9a 100644
--- a/arch/riscv/errata/sifive/errata_cip_453.S
+++ b/arch/riscv/errata/sifive/errata_cip_453.S
@@ -21,7 +21,7 @@
 1:
 .endm
 
-ENTRY(sifive_cip_453_page_fault_trp)
+SYM_FUNC_START(sifive_cip_453_page_fault_trp)
 	ADD_SIGN_EXT a0, t0, t1
 #ifdef CONFIG_MMU
 	la t0, do_page_fault
@@ -29,10 +29,10 @@ ENTRY(sifive_cip_453_page_fault_trp)
 	la t0, do_trap_unknown
 #endif
 	jr t0
-END(sifive_cip_453_page_fault_trp)
+SYM_FUNC_END(sifive_cip_453_page_fault_trp)
 
-ENTRY(sifive_cip_453_insn_fault_trp)
+SYM_FUNC_START(sifive_cip_453_insn_fault_trp)
 	ADD_SIGN_EXT a0, t0, t1
 	la t0, do_trap_insn_fault
 	jr t0
-END(sifive_cip_453_insn_fault_trp)
+SYM_FUNC_END(sifive_cip_453_insn_fault_trp)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
