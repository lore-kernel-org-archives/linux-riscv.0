Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A56FC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 17:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C941B64E02
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 17:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C941B64E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bUVeXBXJTOyosM6NOlZJbwGFG77ZTjNvzcSvviIZ1Bk=; b=rRbNpB9Th8gfIDkFyT9tUaT2jE
	XxgjxRHtbyoJkpIg63Yr8Tmp3vxGw+gJCl2ZFHSE3laAVH3wIQ7u9tX0VFVHi0i5wQyRMgohgwCwH
	OCRgZqBQxn7CVn7N2YDlXA23Pm88k8aZSoyfjr7R46Lky1mcj5YcEGfKeSyqnLsbrQWuYZQae8p8J
	iq/oUyAlh8An5Hh35yVebOP/JRFa1OiaNHr7/nrVNwOqZK8OUEokJ3Ij377UHUBZb87+DHx8l/p0y
	ZLVNTNa6mkrlPsm8oK1KQKbHl1hqoSbzzo8zVAvXK5LwIGtIZdr6M1TzAUeiiCVNyP0FIwtcgm9ED
	JLCTgQ3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Xc2-0003E9-E7; Fri, 29 Jan 2021 17:31:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Xc1-0003Dm-39
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 17:31:13 +0000
X-Originating-IP: 92.91.220.130
Received: from debian.numericable.fr (130.220.91.92.rev.sfr.net
 [92.91.220.130]) (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DAEC6C0010;
 Fri, 29 Jan 2021 17:31:07 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: virt_addr_valid must check the address belongs to
 linear mapping
Date: Fri, 29 Jan 2021 12:31:05 -0500
Message-Id: <20210129173105.22020-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_123113_237362_AC4202CC 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

virt_addr_valid macro checks that a virtual address is valid, ie that
the address belongs to the linear mapping and that the corresponding
 physical page exists.

Add the missing check that ensures the virtual address belongs to the
linear mapping, otherwise __virt_to_phys, when compiled with
CONFIG_DEBUG_VIRTUAL enabled, raises a WARN that is interpreted as a
kernel bug by syzbot.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 2d50f76efe48..64a675c5c30a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -135,7 +135,10 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 
 #endif /* __ASSEMBLY__ */
 
-#define virt_addr_valid(vaddr)	(pfn_valid(virt_to_pfn(vaddr)))
+#define virt_addr_valid(vaddr)	({						\
+	unsigned long _addr = (unsigned long)vaddr;				\
+	(unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr));	\
+})
 
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
