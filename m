Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE9C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IkTu5cXfeHxGrnd0ffACOhI7VE0mffcbsNSl3rEtEKw=; b=4Tead86dtkcNKJ
	qDgaQguvr4FfXUErumaj97L4JkE9ulki5bmsYxZBt6q5r1IEqpUbYa7QKX/tF09zcskrIwiIYqA5w
	H1qzdFj+IP5f/mKnNXzDj2/y9qVJdMgYJb/SZIDfLPDX0S85XPlOS+u4eIpKEOlXZXToKiyuddxwc
	8+4EklF2YzF4q7WUp/21XAhZfBPJ1u0G/vCG4Yl+ckScjYGXWWubMJi1bJaumAqOIAMbR75R/zh0v
	Q7FLECqLdCUMIYb6pUZhWJCwiwqRhrTHtzBqR+p0Ay5hImVfs5uZNxMeTQDg8dduxjWQ3tbbEG77G
	b6NtkFmlZdiAIf8BB1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDQ4-00BhUj-Qr; Sun, 13 Nov 2022 13:53:08 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDQ1-00BhSG-3O
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 13:53:07 +0000
Received: from pop-os.home ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id uDPsoatM9TyouuDPso0z7n; Sun, 13 Nov 2022 14:52:59 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Nov 2022 14:52:59 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
Date: Sun, 13 Nov 2022 14:52:54 +0100
Message-Id: <c5e918630ba37273d7b0f4e4dbb6f90d4c2f321d.1668347565.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_055305_329229_EEEE1C1A 
X-CRM114-Status: UNSURE (   8.81  )
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

In kvm_arch_prepare_memory_region(), if no error occurs, a spin_lock()/
spin_unlock() call can be avoided.

Switch to kvm_riscv_gstage_iounmap() that is the same as the current code,
but with a better semantic.
It also embeds the locking logic. So it is avoided if ret == 0.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't use cross-compiler, so this patch is NOT even compile tested.
---
 arch/riscv/kvm/mmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..c8834e463763 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -537,10 +537,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if (change == KVM_MR_FLAGS_ONLY)
 		goto out;
 
-	spin_lock(&kvm->mmu_lock);
 	if (ret)
-		gstage_unmap_range(kvm, base_gpa, size, false);
-	spin_unlock(&kvm->mmu_lock);
+		kvm_riscv_gstage_iounmap(kvm, base_gpa, size);
 
 out:
 	mmap_read_unlock(current->mm);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
