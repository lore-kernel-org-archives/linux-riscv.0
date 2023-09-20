Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DFCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 03:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IHzABLDpPfK2F/xIL89I6ciAVeTK8LSLMA4iWtnP0NM=; b=NWDPtWPBsN0QvK
	vWKD0Hds7UQ6NUY1JHgucd/DmueXBQohloGVu122s+Y9CEHTHyLP9oNrT6TBH3FmyhvT/4RzrFqS6
	3PLp8Dzc7WTbvXANBNvECLuHzNHiCuS2EQIgbzccLdSJLyWczYC37rvgd4hJCqv2aRtdjvtWcpk+R
	bmXKlz/PXkLC5/slAY9q/6dnebnWq+YCsbWfrU6BGYKwfDWtbcx/KqnJmHJnZstuhEzk8WEHsat1P
	jwJtJ/zX2YxELScB84oi8LFnqQs8BAFWU36yw3lVXkJvSoVKq8VqMx3pez1uin3B9bHarkOSpJtMb
	FBtSfO832tM9fmPPYlsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qioKA-001mA9-0B;
	Wed, 20 Sep 2023 03:56:26 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qioK6-001m9B-2y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 03:56:24 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38K3teNk069434;
	Wed, 20 Sep 2023 11:55:40 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 20 Sep 2023
 11:55:39 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <david@redhat.com>, <akpm@linux-foundation.org>,
        <alexghiti@rivosinc.com>, <bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <conor.dooley@microchip.com>, Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH v3 1/3] riscv: Improve PTDUMP to show RSW with non-zero value
Date: Wed, 20 Sep 2023 11:55:20 +0800
Message-ID: <20230920035522.3180558-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38K3teNk069434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_205623_400049_C0FA54A2 
X-CRM114-Status: GOOD (  16.63  )
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

RSW field can be used to encode 2 bits of software
defined information. Currently, PTDUMP only prints
"RSW" when its value is 1 or 3.

To fix this issue and improve the debugging experience
with PTDUMP, we redefine _PAGE_SPECIAL to its original
value and use _PAGE_SOFT as the RSW mask, allow it to
print the RSW with any non-zero value.

This patch also removes the val from the struct prot_bits
as it is no longer needed.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v1 -> v2
- Redefine _PAGE_SPECIAL to (1 << 8)
Changes v2 -> v3
- Add commet for _PAGE_SPECIAL
- Add ".." when RSW field is clear
- Fix unbalanced braces warning
---
 arch/riscv/include/asm/pgtable-bits.h |  4 +--
 arch/riscv/mm/ptdump.c                | 35 ++++++++++++---------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index f896708e8331..179bd4afece4 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -16,9 +16,9 @@
 #define _PAGE_GLOBAL    (1 << 5)    /* Global */
 #define _PAGE_ACCESSED  (1 << 6)    /* Set by hardware on any access */
 #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
-#define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
+#define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
 
-#define _PAGE_SPECIAL   _PAGE_SOFT
+#define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
 #define _PAGE_TABLE     _PAGE_PRESENT
 
 /*
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 20a9f991a6d7..57a0926c6627 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -129,7 +129,6 @@ static struct ptd_mm_info efi_ptd_info = {
 /* Page Table Entry */
 struct prot_bits {
 	u64 mask;
-	u64 val;
 	const char *set;
 	const char *clear;
 };
@@ -137,47 +136,38 @@ struct prot_bits {
 static const struct prot_bits pte_bits[] = {
 	{
 		.mask = _PAGE_SOFT,
-		.val = _PAGE_SOFT,
-		.set = "RSW",
-		.clear = "   ",
+		.set = "RSW(%d)",
+		.clear = "  ..  ",
 	}, {
 		.mask = _PAGE_DIRTY,
-		.val = _PAGE_DIRTY,
 		.set = "D",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_ACCESSED,
-		.val = _PAGE_ACCESSED,
 		.set = "A",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_GLOBAL,
-		.val = _PAGE_GLOBAL,
 		.set = "G",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_USER,
-		.val = _PAGE_USER,
 		.set = "U",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_EXEC,
-		.val = _PAGE_EXEC,
 		.set = "X",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_WRITE,
-		.val = _PAGE_WRITE,
 		.set = "W",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_READ,
-		.val = _PAGE_READ,
 		.set = "R",
 		.clear = ".",
 	}, {
 		.mask = _PAGE_PRESENT,
-		.val = _PAGE_PRESENT,
 		.set = "V",
 		.clear = ".",
 	}
@@ -208,15 +198,20 @@ static void dump_prot(struct pg_state *st)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
-		const char *s;
-
-		if ((st->current_prot & pte_bits[i].mask) == pte_bits[i].val)
-			s = pte_bits[i].set;
-		else
-			s = pte_bits[i].clear;
+		char s[7];
+		unsigned long val;
+
+		val = st->current_prot & pte_bits[i].mask;
+		if (val) {
+			if (pte_bits[i].mask == _PAGE_SOFT)
+				sprintf(s, pte_bits[i].set, val >> 8);
+			else
+				sprintf(s, "%s", pte_bits[i].set);
+		} else {
+			sprintf(s, "%s", pte_bits[i].clear);
+		}
 
-		if (s)
-			pt_dump_seq_printf(st->seq, " %s", s);
+		pt_dump_seq_printf(st->seq, " %s", s);
 	}
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
