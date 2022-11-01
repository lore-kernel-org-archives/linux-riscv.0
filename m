Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E9DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 05:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EdJ34rU7NvKV7e7yXpxulJV5+njED+s326SCUvoij4I=; b=W7JorSkZ0EQi+n
	S5SXZ2r9PQw9PDNTjhBD4FE8MVEAmyyN7AuPfRAw95I0P1on1cuIDNb18fUVuwYMGKZoKX7zhBL6f
	Aish4k61v4r7za4jGLQ0o8t2/AU5wrhOe9fsaeWxTq/zPWroLiTKnm+7BSL4SgJEPMOLIJsP8PJTD
	2MX4JVoZzx76MM8j6hTUOiuGhlJZmXPs+bJe/tWwSoZ95qLyg+6Vx9lQ7s1v7RTqGW8lko5z9X+/o
	6d5vWXmi5GdDDCdCREG7I/RXRwgng0lCsTWNMkmL6CweFJWzAfq8FRzcM4arN5bHnA72Ff90IFNDa
	6I+UanHpV8XKcHwZ261Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opjzh-0021pG-F8; Tue, 01 Nov 2022 05:39:25 +0000
Received: from unicom146.biz-email.net ([210.51.26.146])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opjzd-0021lp-Kv; Tue, 01 Nov 2022 05:39:24 +0000
Received: from ([60.208.111.195])
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id VGN00136;
        Tue, 01 Nov 2022 13:38:36 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.12; Tue, 1 Nov 2022 13:38:37 +0800
From: Bo Liu <liubo03@inspur.com>
To: <anup@brainfault.org>, <atishp@atishpatra.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
Date: Tue, 1 Nov 2022 01:38:11 -0400
Message-ID: <20221101053811.5884-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.200.104.97]
tUid: 202211011338366c5089ed1402f402bc867b8fd6cef50f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_223921_974599_AF69EEE6 
X-CRM114-Status: UNSURE (   7.90  )
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

vma_lookup() finds the vma of a specific address with a cleaner interface
and is more readable.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..5942d10c9736 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -632,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	mmap_read_lock(current->mm);
 
-	vma = find_vma_intersection(current->mm, hva, hva + 1);
+	vma = vma_lookup(current->mm, hva);
 	if (unlikely(!vma)) {
 		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
 		mmap_read_unlock(current->mm);
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
