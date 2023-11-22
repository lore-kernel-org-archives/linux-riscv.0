Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2092DC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y7dc6mC7RR4ixwWppnCB0NfQ60SAyxkpDW2xT2wwwmg=; b=1zYP4WKu84xwjE
	itrfpkzHByf47msskch8DbKNTiajNDpYgzxbi7vOt5LuyxjV7/oBDii+2wpg9rxUw8vNiu0+cfdzk
	WLHOEtTVUWaVM8nPX8Kk+F8r4s0vIn55UGjpl+97I4xyZagTw0gIVxhI4gZCi5VZtP6UrYgRdUqHW
	lwyog6kRYDg2D9rnkuh06z3T8nIKd2qLvY7Y7GuXvo6cQCsppmjJktwQxciDElGNdTANSKXJ2Q6XR
	7GACkFYktD7j5W5OHojdL752B0nqRMu0xz1vsS94TQCeHIjjMvmP+kspAoA1QtKEe2xRYTyVUhhDt
	1zB3rqp37HYahx7aJjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lJG-001XM2-2h;
	Wed, 22 Nov 2023 11:22:22 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lJD-001XJy-1U
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AlXqdHPOnHB2E+0lQ1aQJEepsIEBNaFvxect1T6h8V8=; b=E5LmH3frqzmDhyPdGS1VX0gUgw
	42+fKueq6tq1fx3t5mAyHEjdaezuo76JzMkjcbycbQmO3wxmDvEbuzInbMt4wgj62aScpEIy5jZ8z
	vgpxXuWGYB2DpRr8vkqJ3JXPIxuVlf8rr/DMw+XnNUHpnIHB3Gc3gE/5FceV2snBBAZ0RBTJntEdU
	aLt8kkNwx4klJVMNMSB79oo6KgGnanNiIrVVReRTOqr7JKJNQ0PA31GUHAQgYryyZNRgEfdZamUnV
	IxNVPWkQYxUiMpt1Jys1x5P7ufrUTOCiulVvZsJzVPri/15rJfsm3OBQOcxLwhRPQda0mqKJjaD2H
	jvU6hMnA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r5kjs-003lIy-6s; Wed, 22 Nov 2023 10:45:49 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r5kjs-000000014fr-2n0F;
	Wed, 22 Nov 2023 10:45:48 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: fixup endian issues in module code
Date: Wed, 22 Nov 2023 10:45:47 +0000
Message-Id: <20231122104547.256286-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_032219_580602_A2284E90 
X-CRM114-Status: GOOD (  10.20  )
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

There is a couple of places in the module.c file where it
is using u16 where it meant __le16. Change this and fix
the following sparse warnings:

arch/riscv/kernel/module.c:68:25: warning: cast to restricted __le16
arch/riscv/kernel/module.c:68:55: warning: cast to restricted __le16
arch/riscv/kernel/module.c:73:19: warning: incorrect type in assignment (different base types)
arch/riscv/kernel/module.c:73:19:    expected unsigned short [usertype]
arch/riscv/kernel/module.c:73:19:    got restricted __le16 [usertype]
arch/riscv/kernel/module.c:74:19: warning: incorrect type in assignment (different base types)
arch/riscv/kernel/module.c:74:19:    expected unsigned short [usertype]
arch/riscv/kernel/module.c:74:19:    got restricted __le16 [usertype]
arch/riscv/kernel/module.c:81:20: warning: cast to restricted __le16
arch/riscv/kernel/module.c:86:17: warning: incorrect type in assignment (different base types)
arch/riscv/kernel/module.c:86:17:    expected unsigned short [usertype]
arch/riscv/kernel/module.c:86:17:    got restricted __le16 [usertype]

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index b5109a3889c9..82f9266ae434 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -64,7 +64,7 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 
 static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
 
 	insn &= keep;
@@ -77,7 +77,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 
 static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
 {
-	u16 *parcel = location;
+	__le16  *parcel = location;
 	u16 insn = le16_to_cpu(*parcel);
 
 	insn &= keep;
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
