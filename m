Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE63C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r/2DLi4O8ED13MMQ0BjjhkRO5FTlYDB/ktBgH07W0M=; b=ZQsjvudgsEFyhP
	muuEv7bA/285mirGh2fYgdtCIrGlREC5Pt/c2j4JJZHD3B/1wSXhE2r13J/PbrBXDk0gUSFjIOflK
	uFgnBxRgtGdrK899swSSl875BDk8+KhBktCGFGg3iugoBEr3cmDR6z+gypNWRveY/dJ2ZlWrFCi3r
	yNKKWAOJWX4owBRzO56Wj0CFngP/lWHhc1j7aIDJCKDC9onyZvLz8HHqgS8gElzbS9r187ANYePKn
	fmXiN8p47U20mZffQgth+rY4ExVsH0Ec7mYArMMuVyKAsUz5fwRKw0iQC8j4H1lMfVtWAxfGfmqaG
	OUx3R/bzssyE3RH5EEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF3b-005P7Y-1G;
	Wed, 02 Aug 2023 16:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF3Y-005P5f-23
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:50:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24FD7619D7;
	Wed,  2 Aug 2023 16:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C33EC433C7;
	Wed,  2 Aug 2023 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995039;
	bh=ZxSSeBb/S16STGNIjLgLnRd4gdTK7GWBFlxeOcsXSwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Re6hHhbVV1BPv0jkxSRI9lbIULPSLrArCk6YQsxBcILuiJJmeoU/B3uTrAvZW8Hsd
	 NESYQvpaFa3FeTrzeq5alcZ+8qf3hCjwa1dYlRqVehWgABTIjXr0SOjxmkO5qRpSNq
	 1qIXDIaUuS+1gRLf0ruSHeazVgAk3gjiR9cBr17jFfhwbqsItlZSZChiEXW9Aeudck
	 ng8PI4CEgU7l6nTNJRMMj0DoG12Gwuhgv8z9TUe+XHbdIBKHy1e11wN96y5M4+BC+R
	 XiHmg97d52zUNBHlHhFRH+ttLsm02XcUzSw/7ie2wcPZp3vbS+OXOV8lwqhgE8Ytdi
	 cNN+zltkvBpng==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V10 11/19] RISC-V: paravirt: pvqspinlock: KVM: Implement kvm_sbi_ext_pvlock_kick_cpu()
Date: Wed,  2 Aug 2023 12:46:53 -0400
Message-Id: <20230802164701.192791-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095040_717535_77117113 
X-CRM114-Status: UNSURE (   9.99  )
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

From: Guo Ren <guoren@linux.alibaba.com>

We only need to call the kvm_vcpu_kick() and bring target_vcpu
from the halt state. No irq raised, no other request, just a pure
vcpu_kick.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kvm/vcpu_sbi_pvlock.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_pvlock.c b/arch/riscv/kvm/vcpu_sbi_pvlock.c
index 544a456c5041..914fc58aedfe 100644
--- a/arch/riscv/kvm/vcpu_sbi_pvlock.c
+++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
@@ -12,6 +12,24 @@
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
+static int kvm_sbi_ext_pvlock_kick_cpu(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu *target;
+
+	target = kvm_get_vcpu_by_id(kvm, cp->a0);
+	if (!target)
+		return SBI_ERR_INVALID_PARAM;
+
+	kvm_vcpu_kick(target);
+
+	if (READ_ONCE(target->ready))
+		kvm_vcpu_yield_to(target);
+
+	return SBI_SUCCESS;
+}
+
 static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				      struct kvm_vcpu_sbi_return *retdata)
 {
@@ -21,6 +39,7 @@ static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 
 	switch (funcid) {
 	case SBI_EXT_PVLOCK_KICK_CPU:
+		ret = kvm_sbi_ext_pvlock_kick_cpu(vcpu);
 		break;
 	default:
 		ret = SBI_ERR_NOT_SUPPORTED;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
