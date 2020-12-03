Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15525C64E8A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415C822241
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415C822241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IlJofWTf5kNH59UH/NIFHMxlgX6nM9Mq5uXuo8MVACk=; b=m2q/V2KFCCqXsiE0I4xirwJ9l
	1/Yos6oPi5n2Y3+vtkjrrSM7bH343kj5V1alARPIX2TRdKdsvh5bOedrzcdSE2gvxGymA8DaKEj/f
	XfWoHWcL1NES+u8tZUsWlZpWbJn1cPY55+1MzPOCumLv1dRzkGOL/0gNt9ecRUcPIkgXvw30smB8g
	WAMNfRX2e4h7KXG0SW9fLpWksPITWCX3g27lV1esvmXrFn9yZ7U1gn9KEdBJFVBEFGnI4DyYT/WhC
	jrFdLwgvtnor10Ikn03fqY/050gsFsMUVvtRkWJ6yn5aaw6C2L/NjlY+7cQll96vgkouJgtmqQhMF
	aSX47QhSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kknc0-0001t2-MA; Thu, 03 Dec 2020 12:21:28 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kknbv-0001p2-Nm; Thu, 03 Dec 2020 12:21:25 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cmw0d67pXz15WyR;
 Thu,  3 Dec 2020 20:20:49 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:21:09 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <anup.patel@wdc.com>, <atish.patra@wdc.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pbonzini@redhat.com>
Subject: [PATCH RFC 3/3] RISC-V: KVM: Implement guest time scaling
Date: Thu, 3 Dec 2020 20:18:39 +0800
Message-ID: <20201203121839.308-4-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_072124_292043_C8641ED4 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: zhang.zhanghailiang@huawei.com, kvm@vger.kernel.org, yinyipeng1@huawei.com,
 victor.zhangxiaofeng@huawei.com, linux-kernel@vger.kernel.org,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When time frequency needs to scale, RDTIME/RDTIMEH instruction in guest
doesn't work correctly. Because it still uses the host's time frequency.

To read correct time, the RDTIME/RDTIMEH instruction executed by guest
should trap to HS-mode. The TM bit of HCOUNTEREN CSR could control whether
these instructions are trapped to HS-mode. Therefore, we can implement guest
time scaling by setting TM bit in kvm_riscv_vcpu_timer_restore() and emulating
RDTIME/RDTIMEH instruction in system_opcode_insn().

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/include/asm/csr.h            |  3 +++
 arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
 arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 10 +++++++
 4 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index bc825693e0e3..a4d8ca76cf1d 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -241,6 +241,9 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+/* The counteren flag */
+#define CE_TM		1
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 41b5503de9e4..61384eb57334 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -41,6 +41,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
 int kvm_riscv_guest_timer_init(struct kvm *kvm);
+u64 kvm_riscv_read_guest_time(struct kvm_vcpu *vcpu);
 
 static inline bool kvm_riscv_need_scale(struct kvm_guest_timer *gt)
 {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index f054406792a6..4beb9d25049a 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -18,6 +18,10 @@
 
 #define INSN_MASK_WFI		0xffffff00
 #define INSN_MATCH_WFI		0x10500000
+#define INSN_MASK_RDTIME	0xfff03000
+#define INSN_MATCH_RDTIME	0xc0102000
+#define INSN_MASK_RDTIMEH	0xfff03000
+#define INSN_MATCH_RDTIMEH	0xc8102000
 
 #define INSN_MATCH_LB		0x3
 #define INSN_MASK_LB		0x707f
@@ -138,6 +142,34 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
 	return 1;
 }
 
+static int system_opcode_insn_rdtime(struct kvm_vcpu *vcpu,
+				     struct kvm_run *run,
+				     ulong insn)
+{
+#ifdef CONFIG_64BIT
+	if ((insn & INSN_MASK_RDTIME) == INSN_MATCH_RDTIME) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, guest_time);
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+#else
+	if ((insn & INSN_MASK_RDTIME) == INSN_MATCH_RDTIME) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, (u32)guest_time);
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+	if ((insn & INSN_MASK_RDTIMEH) == INSN_MATCH_RDTIMEH) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, (u32)(guest_time >> 32));
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+#endif
+	return 0;
+}
+
 static int system_opcode_insn(struct kvm_vcpu *vcpu,
 			      struct kvm_run *run,
 			      ulong insn)
@@ -154,6 +186,9 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu,
 		return 1;
 	}
 
+	if (system_opcode_insn_rdtime(vcpu, run, insn))
+		return 1;
+
 	return truly_illegal_insn(vcpu, run, insn);
 }
 
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 2d203660a7e9..2040dbe57ee6 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -49,6 +49,11 @@ static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 	return kvm_riscv_scale_time(gt, host_time) + gt->time_delta;
 }
 
+u64 kvm_riscv_read_guest_time(struct kvm_vcpu *vcpu)
+{
+	return kvm_riscv_current_cycles(&vcpu->kvm->arch.timer);
+}
+
 static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 				     struct kvm_guest_timer *gt,
 				     struct kvm_vcpu_timer *t)
@@ -241,6 +246,11 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
 	csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
 #endif
+
+	if (kvm_riscv_need_scale(gt))
+		csr_clear(CSR_HCOUNTEREN, 1UL << CE_TM);
+	else
+		csr_set(CSR_HCOUNTEREN, 1UL << CE_TM);
 }
 
 int kvm_riscv_guest_timer_init(struct kvm *kvm)
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
