Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C03C88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUi8VKeYpF/rSaP5DEOugFuXd3KJQpSwmcMu6a63Bds=; b=dSAJ6Iex7DHOje
	L14YF5mrf/EBMLMTLrzd44yet/SMrUGk32XRaxTDLpMgf6n/wvRqRevmERLfDF9Ft8dHSku5u7Ply
	vz1dR1otatKIYTgc4Rh4n3oUhKfanItETc2/ZgtrliVl1U98gAWExJzIwyTIqoEmDuLUg5HKfSqyw
	fQw7S38x91bnfomVJ46AHYRyb7xgcQuVTBCnzqhkMlXIhhHKEPki/rwA+zjxkI5Cn2EtYiLvQTXS1
	sBvOi7oSpaBGU/Dzz32WmezgG8eBxltLhcL8Wl1S1EBDrt70dxpMgNAW68EDOhNda+6A3hXdHAPv2
	ZvK00PEH+f0nKwHCDF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5791-000000001GN-0XPq;
	Fri, 11 Sep 2026 19:42:43 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x578y-000000001Es-2F5d
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 19:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=4HUpR03/tyAN0WG71k+QFtPol0dW270SWgoZPUtqdQ8=; b=dd8rUh/xWYuxqCYVpV4JaeL4h6
	KgqgU2qilwD59tZ+3XVeV8U4bAvhAUUQNsfztS57T81EmNrCYz0yMFtyOpfqGp0gY/gIN1tMED1q9
	mEjL//dU8SW+Pk5acMEdHAXzjhKwRij1FhErdIOHfsw2Evhc+sApB941IBkDuyhD0j4+Vy+r8dKDh
	43+OIwCfWwqKTkQuExsvZ4qpKZJMn3AeS06TW8mdIanjY5Ksf7Y9NTbgY0Tp6CX8dUFjNNIqQit17
	BdR7/WB+1ZMIVI2x6yC+VM6wg3gh4Rglp7Ewa03F93GRSWEOtvv8DqnoVeQS9LB8DrfDezDFlVUR1
	sWOcxKSA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x578t-0000000979a-014e;
	Fri, 11 Sep 2026 21:42:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: vector: Fix output operands in context save
Date: Fri, 11 Sep 2026 21:42:17 +0200
Message-ID: <20260911194218.3379486-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_124240_572471_C10B6936 
X-CRM114-Status: UNSURE (   8.61  )
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

The __vstate_csr_save() inline assembly declares vcsr as an output
operand while the assembly only writes vstart, vtype, and vl. Remove it
as it is later saved by the C code.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77208..064a24c89d74 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -137,8 +137,8 @@ static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 		"csrr	%0, " __stringify(CSR_VSTART) "\n\t"
 		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
 		"csrr	%2, " __stringify(CSR_VL) "\n\t"
-		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
-		"=r" (dest->vcsr) : :);
+		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl)
+		: :);
 
 	if (has_xtheadvector()) {
 		unsigned long status;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
