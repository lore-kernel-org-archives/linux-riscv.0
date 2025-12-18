Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA377D68BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 03:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FmgloJS6vKsBzse2VfiPK1pZpl0ICw6+DZCLJdRrXd0=; b=ctbhINV7zm/uG+
	1aplqu0LK+BkWaFbnJ5sUj5n2G0YcUXasyA1slKdRNgaBO4kPCzLsRnvKlbFLjmoy1Git6KYYL+z9
	Tie4cFFLYGvbiNuPiUg9F57fz8mW0ZHpfpJTsqk+ChoDvYpkntyq3Ql8aElB0NwfanLnKGs//anlL
	EOfBnvXIWZ6THpZURONXTxHKhbEiqe6nCXrh7lPsTUEEkksOJShPWClZTHy1OHduNA+xs+dogWALC
	Hu0nQCcccwA6rdZE4FV2RqzAh1e70LPqTB8Sz2371jW8wEn7gZk4lXPdmG/JENnkMSBrq716qNFF9
	O+8IufBdAVxcN0mGBK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW4f6-00000007kZC-0jYw;
	Thu, 18 Dec 2025 03:26:44 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW4f2-00000007kYd-1aNY
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 03:26:42 +0000
X-UUID: 5726cc44dbc111f0a38c85956e01ac42-20251218
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8fc08638-656e-4b2b-a743-4887d8c1367f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:40277e2b49307c66118a777ee908fa59,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5726cc44dbc111f0a38c85956e01ac42-20251218
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 829326784; Thu, 18 Dec 2025 11:26:28 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	jiangfeng@kylinos.cn
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: lib: optimize strlen loop efficiency
Date: Thu, 18 Dec 2025 11:26:14 +0800
Message-Id: <20251218032614.57356-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_192640_755035_027020D5 
X-CRM114-Status: UNSURE (   5.67  )
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

Optimize the generic strlen implementation by using a pre-decrement
pointer. This reduces the loop body from 4 instructions to 3 and
eliminates the unconditional jump ('j').

Old loop (4 instructions, 2 branches):
  1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b

New loop (3 instructions, 1 branch):
  1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b

This change improves execution efficiency and reduces branch pressure
for systems without the Zbb extension.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/lib/strlen.S | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index eb4d2b7ed22b..e7736ccda514 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -21,13 +21,11 @@ SYM_FUNC_START(strlen)
 	 * Clobbers:
 	 *   t0, t1
 	 */
-	mv	t1, a0
+	addi	t1, a0, -1
 1:
-	lbu	t0, 0(t1)
-	beqz	t0, 2f
 	addi	t1, t1, 1
-	j	1b
-2:
+	lbu	t0, 0(t1)
+	bnez	t0, 1b
 	sub	a0, t1, a0
 	ret
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
