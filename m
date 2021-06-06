Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB9BC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029F661426
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029F661426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h54OmUngA0BNBF3besQyLzIm3r1j6TCc1PUwHMGivK4=; b=CYZFRlUhdwRoP9
	ztiXq3ecBlEfzSjrEK7v/k6OI8grMdNjfyOFauVjqmyQ+rHQvrPAcmlIjfoiqFKAwekYqGV7QCubn
	jbtCC/Kt7wkxsPg83P6FBE4j8D3u6HHg1gBE51WNePzeO/sQaXN4D4Td3YTd24rMUzQe5s0wcBcnO
	IUmTASxFOGW/LNMrscXuBBksTLiIlTnPv58Gm69AiOCtTin1wIqx0gekON+ScN/0P+2GYq7j+f5Yq
	o13npNKmPK/BIRNkErKIUvDEdCdmZlweGlhxj9F9exDJzmZJLcZqKB/exOHK7bH9kEhLXfzuwxI2r
	k6s67AAA+tqVLtHAtJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoiT-0002Zq-2U; Sun, 06 Jun 2021 09:05:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoiR-0002ZO-3b
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA9B61420;
 Sun,  6 Jun 2021 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970306;
 bh=0HrILH6BshJfMkD9I3tL+9zxsVQ6ho2ivjftGmjwtWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N90/WwTU6WhPC9U30UcYf27IOC8d5m4doJgaeeestAHAmvIyOstbJz4mT2f/rA6R/
 f15t/Reh0HGQdFq/dg9McimNK5kLvkglPUtnx1ZPQ96cBWw5NaRyky6154M2iTheSa
 4rUwMx1MVZWpenz8Y8jbErI/+cIYQ98zklcOEdJ0CKQS7DLve+9ibPumgvhKoZmuRc
 P6APOvW6oj6YVi/GpZSlzOpXdS/yM+E0NwzzsvobAb1UjEgxb+H6fOXGxT4eIuTaog
 CM8/slp3fgrHYRrj5ss5okLE/6dl2OZfxpnvJ5jYhBS3tBFE5M7tHeCyycL+nNFVan
 YWGafNt2GPEsQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 1/3] riscv: Use global mappings for kernel pages
Date: Sun,  6 Jun 2021 09:03:57 +0000
Message-Id: <1622970249-50770-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020507_191900_BF72C709 
X-CRM114-Status: UNSURE (   9.33  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

We map kernel pages into all addresses space, so they can be marked as
global. This allows hardware to avoid flushing the kernel mappings when
moving between address spaces.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f46..346a3c6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -134,7 +134,8 @@
 				| _PAGE_WRITE \
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
-				| _PAGE_DIRTY)
+				| _PAGE_DIRTY \
+				| _PAGE_GLOBAL)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
