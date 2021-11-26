Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD176C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2a8lKHmzWkRikGamuLstgtB/Ag1ZWo/Bcjo17XoDpo=; b=ThTaNfEkFLv+OD
	bh1s8Hg5KL8f//lVGbGZYBM9j8aAsEFDdHnm09yXlOyKEYbZHODhiP+6F8hpQ6iWyHE+TbIy2d9O5
	UhW0FYbMgaWonTFQFHj/WZdfibk1YL0qxLy15VLYHsC8bpRJU9S54Mup61LD58oUrUC/efN3xqG99
	zXxRZ9eg6nF7MftscutzO/wKW6yIY6lKUp51kGM4Dfu5+nFtZ5ViZVMaH1IXsOEEPYyyNVsG8VLSO
	YxUNqivaYaTkTfNf6vye0IddN2czCqy1OUWKwD7gM9Ccb+XcmN4fZ3UyTZOaVHjL9451Z79bNKz/9
	7+kMaBTsBDmwNBuzvIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfdX-00BQtX-4j; Fri, 26 Nov 2021 18:07:51 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfaQ-00BPR6-Vy
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 18:04:44 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1AQI4aco005327
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 20:04:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1637949871; x=1640541871;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HwZwqj1Qv59IMeyNmkXzER8KB6AH7iTuvaLwYU2PapU=;
 b=BVqeGD+8xaZowUssCk5lhXjmAYmLl2S5BxHrzCurO5rm/Ls5vv0HyVT9i84ORE5l
 A8VsKL3znz+puvAGTBeK2hqTn5EgCKSNb64bNqojcL9a96y4XHtrOq11/qamrxXo
 muPEUW4P/PoeqxHqGee2mEw7ug/DK3THPrdJBc7Uq3CqVzz2SYIOTkJNbqm1Vm5v
 gMHrvscXnZOw//NDeJDKvZzm+UPL92rz5tEZR5TiNsG8VZFEgFB+C3WLxRkits3E
 qDLXKAoDogthUOU/7SxtPhPkVO4S1kNJ7dIh/w6eipMiWPvBVvNt6FEF7vaoNCp8
 19WuOEQ9VHXxW7KRWaX8dw==;
X-AuditID: 8b5b014d-9a2477000000460a-ab-61a121affcd5
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 B9.14.17930.FA121A16; Fri, 26 Nov 2021 20:04:31 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH 3/3] riscv: try to allocate crashkern region from 32bit
 addressible memory
Date: Fri, 26 Nov 2021 20:04:11 +0200
Message-Id: <20211126180411.187597-3-mick@ics.forth.gr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126180411.187597-1-mick@ics.forth.gr>
References: <20211126180411.187597-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsXSHT1dWXe94sJEg5/HeSy2/p7FbnF51xw2
 i22fW9gsmt+dY7d4ebmH2aJtFr8Dm8ebly9ZPA53fGH3eLjpEpPH5iX1Hpear7N7fN4kF8AW
 xWWTkpqTWZZapG+XwJXxbuEepoIDAhVHNi9gbGCcy9vFyMkhIWAi0fLzClsXIxeHkMAxRomp
 SzYyQiTcJG7f38kKYrMJaErMv3SQBcQWEXCXWD35DxOIzSyQL7HtyznmLkYODmGBKIk5v8xB
 wiwCqhLdD6czg9i8AuYSTTd/sEGMlJc4tewgE0g5p4CFxI7fkSBhIaCS95tWskKUC0qcnPmE
 BWK6vETz1tnMExj5ZiFJzUKSWsDItIpRILHMWC8zuVgvLb+oJEMvvWgTIzgUGX13MN7e/Fbv
 ECMTB+MhRgkOZiURXufA+YlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeXn1JsQLCaQnlqRmp6YW
 pBbBZJk4OKUamHjsE5N4f8/xspgfHv27T6FjpdbE6VbfD/QfsJcrOMzQk3NNmPfBjTV2XK1p
 QhudhPYt5HxxeuqKZ81rNV9YP5n4/Cofa1ef5PL7pmdur06XmX9Ny/MyJ6u+23PGrqg/h7f+
 1mc4G8HfVXvYtiRjzq4PGk/Y92Wmv2zZs6RdwIBxi77Zyc4pMRMTVcuDOy//jNRco2MS9/Ll
 wo+T0rlyFutxN21uC5u+IvRp4e+cN6Ive1vfVO2aafr73apWe+u1rpWFcWej1lXIsjK9D/7u
 du2cf1sGo32NtUK5qGeM46b7q92VGx5fTOjYK5n4/Vfv5ZA2m6ulCQ4lz8yCe0/cr3h7/kZ1
 Ojf3ptdfpFivKrEUZyQaajEXFScCAHgKg0a0AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100439_451613_F35D8BCB 
X-CRM114-Status: GOOD (  14.13  )
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

When allocating chrash kernel region without explicitly specifying its
base address/size, memblock_phys_alloc_range will attempt to allocate
memory top to bottom (memblock.bottom_up is false), so the crash
kernel region will end up in highmem on 64bit systems. This way
swiotlb can't work on the crash kernel, since there won't be any
32bit addressible memory available for the bounce buffers.

Try to allocate 32bit addressible memory if available, for the
crash kernel by restricting the top search address to be less
than SZ_4G. If that fails fallback to the previous behavior.

I tested this on HiFive Unmatched where the pci-e controller needs
swiotlb to work, with this patch it's possible to access the pci-e
controller on crash kernel and mount the rootfs from the nvme.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/mm/init.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 24b2b8044..1963a517e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -812,13 +812,22 @@ static void __init reserve_crashkernel(void)
 	/*
 	 * Current riscv boot protocol requires 2MB alignment for
 	 * RV64 and 4MB alignment for RV32 (hugepage size)
+	 *
+	 * Try to alloc from 32bit addressible physical memory so that
+	 * swiotlb can work on the crash kernel.
 	 */
 	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
-					       search_start, search_end);
+					       search_start,
+					       min(search_end, (unsigned long) SZ_4G));
 	if (crash_base == 0) {
-		pr_warn("crashkernel: couldn't allocate %lldKB\n",
-			crash_size >> 10);
-		return;
+		/* Try again without restricting region to 32bit addressible memory */
+		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
+						search_start, search_end);
+		if (crash_base == 0) {
+			pr_warn("crashkernel: couldn't allocate %lldKB\n",
+				crash_size >> 10);
+			return;
+		}
 	}
 
 	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
