Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B1AEC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r/2DLi4O8ED13MMQ0BjjhkRO5FTlYDB/ktBgH07W0M=; b=OWPwh0uzKRCMpR
	zs2M1ULKXsLMSwkg2b+Eu5OSWv3ibyXdR6xPSjGqqSycXy79q+ZD8PtLazpQXTKuakJJdhzNQyS0g
	tI6/Al+Tc6MsvpTAbgf6jZJjiVviVYrMOVAhYCj2QO5cwZd4qKURsq+Dvw9JYlYrrrXZPEOvHxoyn
	ZyZvbkbK96A6y31ynWYYFm2aYtCIvnCY0Zs7/yg/xPiGHtI215HC2S2zdyymN16bz1yRSaoPMSScK
	HOHXEsT9nw+q3j/a/ipExcnedAaaV5FLDkiKSW4eIU6gnKhYqaeKd5JtzD5Rn6w50p7jTlqk9rCmF
	ItroEBFLuMzA6vLTCJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFrF-00GIO4-22;
	Sun, 10 Sep 2023 08:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFrD-00GIM1-0e
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B253560BBF;
	Sun, 10 Sep 2023 08:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4096C43397;
	Sun, 10 Sep 2023 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334710;
	bh=ZxSSeBb/S16STGNIjLgLnRd4gdTK7GWBFlxeOcsXSwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+LRgGMW/xx8261kzbec/7ectryiunjI7NOKoSUJZMQ5GO9xW2FzxB+MpQTjPJwrP
	 GqZmGTDK/Cn5Uldm9Mx54IZVN/eDq1LT+Hrd6ayDASK2ZXJSqpekvxQPcGwsuaX5J2
	 U41UBqPSUW/oUH3AuoETyRMVkb9twscE6eYAz1hJSWU9FodNY8BV2gv7nBtWI0BMYk
	 gDPHGGttiPk/+RxqXz0RzsFAlZOZxTaiTRLevDEXWEaO/LtMjz+hekQH0J1QF/dJuq
	 CVBIe+GUx3doKxK4ICkFhf1vXR716rIvyf8B97hkgFqJ6R+xJQkXq0oOtqrgScC3qw
	 ALUrMl2iBo61w==
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
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 17/17] RISC-V: paravirt: pvqspinlock: KVM: Implement kvm_sbi_ext_pvlock_kick_cpu()
Date: Sun, 10 Sep 2023 04:29:11 -0400
Message-Id: <20230910082911.3378782-18-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013151_276107_B4103C8F 
X-CRM114-Status: UNSURE (   9.93  )
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
