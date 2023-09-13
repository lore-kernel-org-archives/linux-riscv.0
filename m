Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18E5CA553A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbdgHLPU5u5aETzQYFsa4u9bRjBAHlQ50Kxopc1c8JI=; b=GrMf851Acz9FgX
	D7EFvTqujECYckuQ9cVNgtWDLM6Ozy/WIOlKHlKAih4gDyIq47a4dVIxH1t+pRjX1Lp33+G70+8jQ
	4mIvt5PSJovVnhx/bVhraX3Vg0lUAncer2i0xmE/xCiTlXpjG/ItJotIe6l0/5VlOGI7wSgBnIGhK
	dWTi4wnFY0x84JIZOJ51RTq3meaoMsio3q3y5H/Yo/y7jJ3Q2EJmgIbKowz+3w2Vyd7ulOKR+g+/9
	EXQsnQ6vaQX7GK5AgGP0V3se22fJ81cnNoJtq/NM4BEBNc7GRDUEV+e1nhKGppRD8l7kv1bHJOQeU
	nV3aONSs++3dWPXCU0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSgI-006Jqt-0m;
	Wed, 13 Sep 2023 16:25:34 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSgE-006JpZ-2I
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:25:32 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38DGPCBn042632;
	Thu, 14 Sep 2023 00:25:12 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Sep 2023
 00:25:07 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <david@redhat.com>, <akpm@linux-foundation.org>,
        <alexghiti@rivosinc.com>, <bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ycliang@andestech.com>, Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH 2/3] riscv: Introduce PBMT field to PTDUMP
Date: Thu, 14 Sep 2023 00:24:57 +0800
Message-ID: <20230913162458.2931065-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913162458.2931065-1-peterlin@andestech.com>
References: <20230913162458.2931065-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38DGPCBn042632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_092531_188647_8C609A13 
X-CRM114-Status: UNSURE (   9.95  )
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

This patch introduces the PBMT field to the PTDUMP, so it can
display the memory attributes for NC or IO.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 arch/riscv/mm/ptdump.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 62bbea17d475..2a89c66f837a 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -135,6 +135,12 @@ struct prot_bits {
 
 static const struct prot_bits pte_bits[] = {
 	{
+#ifdef CONFIG_64BIT
+		.mask = _PAGE_MTMASK_SVPBMT,
+		.set = "MT(%s)",
+		.clear = "      ",
+	}, {
+#endif
 		.mask = _PAGE_SOFT,
 		.set = "RSW(%d)",
 		.clear = "      ",
@@ -205,6 +211,16 @@ static void dump_prot(struct pg_state *st)
 		if (val) {
 			if (pte_bits[i].mask == _PAGE_SOFT)
 				sprintf(s, pte_bits[i].set, val >> 8);
+#ifdef CONFIG_64BIT
+			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
+				if (val == _PAGE_NOCACHE_SVPBMT)
+					sprintf(s, pte_bits[i].set, "NC");
+				else if (val == _PAGE_IO_SVPBMT)
+					sprintf(s, pte_bits[i].set, "IO");
+				else
+					sprintf(s, pte_bits[i].set, "??");
+			}
+#endif
 			else
 				sprintf(s, "%s", pte_bits[i].set);
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
