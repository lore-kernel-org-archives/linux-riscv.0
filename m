Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A103C5CFDB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UmRpyO63oTJZ+HKOqwMxCNn4crAcI1ifAf567bRvh8o=; b=E/oYnFFJ7LzIxR
	1XBBxrpnBQKuCQCLnZEQHOJMelS+Q4oxklgM5mkvdQ57FZoqtwu+eYpnt98843LXY1XMNdpeFZMyj
	oRB+FC5BFz8x2pzs86lOs9wfQlByV4XKrYPskLQZHrCz6Mql7pRNnxMKyk1jBgMay9DhE0x9NOVvn
	d0DC4EmxO8pPzpwSD7gX8DMl9DAtDmOrNyuB1n220au7dVqSr3bYM/diTw73yG2CZqSE82wNf85Wp
	clhb+tO3dcDHtPuEubK/ud265F+e/Q2Xoz1cZ/RAPWulR8SSeMdjPzGi5IMRxjWRuT2GecceTdDUc
	GQRmqXmkLCcWW/DC+n8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wur8n-00000002eqa-3cyU;
	Fri, 14 Aug 2026 12:36:05 +0000
Received: from out-104.mta1.migadu.com ([2001:41d0:203:375::68] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wur8k-00000002epl-2AVN
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 12:36:04 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TkDW6b1+JKxpBtH+Vbo/8j3ET4tgnpLuLKovOFW3zZ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786710960; v=1; x=1787315760;
 b=Xgf3xPwGoJUhfVKJ1HubtXLNhQ/VQmb9u1CN0m3V9R2HmtQblCZh3sx2l9akP0BTYlaZZW1V
 5E3zFObEJRL6KShO+nC48ivs2DEOAS9Pj6/FLHbyB7XifjTiBwNjS5/LdzhOwX3GUdKqZpjCXtL
 Bw1WV5FYAdbSuM86iohHZnJ4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id c1eb88277eb99e05;
	Fri, 14 Aug 2026 12:36:00 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH] KVM: riscv: Avoid redundant interrupt check for pending timers
Date: Fri, 14 Aug 2026 08:35:41 -0400
Message-ID: <20260814123541.593613-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_053602_718717_03BDC6C9 
X-CRM114-Status: UNSURE (   6.60  )
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

kvm_vcpu_check_block() calls kvm_arch_vcpu_runnable() before
checking whether a timer is pending. On RISC-V, kvm_arch_vcpu_runnable()
already checks all pending guest interrupts through
kvm_riscv_vcpu_has_interrupts(vcpu, -1UL), including IRQ_VS_TIMER.

Drop the repeated IRQ_VS_TIMER pending-interrupt check from
kvm_riscv_vcpu_timer_pending() and keep the helper focused on the timer
deadline state. If the timer becomes pending after the runnable check,
the timer path still injects IRQ_VS_TIMER and kicks the vCPU through the
normal wakeup path.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/vcpu_timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ae53133c7ab0..0e01bd793772 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -132,11 +132,7 @@ bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
-	if (!kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t) ||
-	    kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
-		return true;
-	else
-		return false;
+	return !kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
 }
 
 static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
