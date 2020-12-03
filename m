Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A3BC63777
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE7D22245
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE7D22245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XPmE2TfPhjrhg8mnxVVSFiFIYAGKjq/9+ln5nBwnc48=; b=cfF+Er7Zavn/Jby+CgbpqHUc3
	gsruCBsPa/9XhqT5yslJ3ZE47tRLjA/GANs8hshBcKcRrTCWW+zubDX7gMi3xHOxIXS5U+PB4FUXz
	TwUrJUKILJxhKNzcRTljZvnS9OC9l8EOlUDE/qJXJjZJk+EOf+/5hTMPRSEJnh7JkBAst2J4QOjy3
	09K+z50R4RgRPlpC1tYCN4yd4vzOY6FyxUOdxUy+KgxnVUWYvUS8umFWYG1ZmHKWUg4p40mFsfqaS
	D3IJlGFfI209pelyJcDobZH3HinaXsMpIyrUJ5di7mspLKIyvkDuEAecXPXJBTKtHxY8mN6SEufZp
	UJ8x8ptuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kknc0-0001sj-1q; Thu, 03 Dec 2020 12:21:28 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kknbv-0001p3-Hi; Thu, 03 Dec 2020 12:21:25 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cmw0d6T1hz15Wyd;
 Thu,  3 Dec 2020 20:20:49 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:21:07 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <anup.patel@wdc.com>, <atish.patra@wdc.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pbonzini@redhat.com>
Subject: [PATCH RFC 2/3] RISC-V: KVM: Support dynamic time frequency from
 userspace
Date: Thu, 3 Dec 2020 20:18:38 +0800
Message-ID: <20201203121839.308-3-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_072124_109444_E251F52F 
X-CRM114-Status: GOOD (  11.84  )
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

This patch implements KVM_S/GET_ONE_REG of time frequency to support
setting dynamic time frequency from userspace. When the time frequency
specified by userspace is inconsistent with host 'riscv_timebase',
it will use scale_mult and scale_shift to calculate guest scaling time.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h |  9 ++++++
 arch/riscv/kvm/vcpu_timer.c             | 40 +++++++++++++++++++++----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 87e00d878999..41b5503de9e4 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -12,6 +12,10 @@
 #include <linux/hrtimer.h>
 
 struct kvm_guest_timer {
+	u64 frequency;
+	bool need_scale;
+	u64 scale_mult;
+	u64 scale_shift;
 	/* Time delta value */
 	u64 time_delta;
 };
@@ -38,4 +42,9 @@ int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
 int kvm_riscv_guest_timer_init(struct kvm *kvm);
 
+static inline bool kvm_riscv_need_scale(struct kvm_guest_timer *gt)
+{
+	return gt->need_scale;
+}
+
 #endif
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index f6b35180199a..2d203660a7e9 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -15,9 +15,38 @@
 #include <asm/delay.h>
 #include <asm/kvm_vcpu_timer.h>
 
+#define SCALE_SHIFT_VALUE 48
+#define SCALE_TOLERANCE_HZ 1000
+
+static void kvm_riscv_set_time_freq(struct kvm_guest_timer *gt, u64 freq)
+{
+	/*
+	 * Guest time frequency and Host time frequency are identical
+	 * if the error between them is limited within SCALE_TOLERANCE_HZ.
+	 */
+	u64 diff = riscv_timebase > freq ?
+		   riscv_timebase - freq : freq - riscv_timebase;
+	gt->need_scale = (diff >= SCALE_TOLERANCE_HZ);
+	if (gt->need_scale) {
+		gt->scale_shift = SCALE_SHIFT_VALUE;
+		gt->scale_mult = mul_u64_u32_div(1ULL << gt->scale_shift,
+				 freq, riscv_timebase);
+	}
+	gt->frequency = freq;
+}
+
+static u64 kvm_riscv_scale_time(struct kvm_guest_timer *gt, u64 time)
+{
+	if (kvm_riscv_need_scale(gt))
+		return mul_u64_u64_shr(time, gt->scale_mult, gt->scale_shift);
+
+	return time;
+}
+
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 {
-	return get_cycles64() + gt->time_delta;
+	u64 host_time = get_cycles64();
+	return kvm_riscv_scale_time(gt, host_time) + gt->time_delta;
 }
 
 static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
@@ -33,7 +62,7 @@ static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 		cycles_delta = cycles - cycles_now;
 	else
 		cycles_delta = 0;
-	delta_ns = mul_u64_u64_div_u64(cycles_delta, NSEC_PER_SEC, riscv_timebase);
+	delta_ns = mul_u64_u64_div_u64(cycles_delta, NSEC_PER_SEC, gt->frequency);
 	local_irq_restore(flags);
 
 	return delta_ns;
@@ -106,7 +135,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_TIMER_REG(frequency):
-		reg_val = riscv_timebase;
+		reg_val = gt->frequency;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(time):
 		reg_val = kvm_riscv_current_cycles(gt);
@@ -150,10 +179,10 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_TIMER_REG(frequency):
-		ret = -EOPNOTSUPP;
+		kvm_riscv_set_time_freq(gt, reg_val);
 		break;
 	case KVM_REG_RISCV_TIMER_REG(time):
-		gt->time_delta = reg_val - get_cycles64();
+		gt->time_delta = reg_val - kvm_riscv_scale_time(gt, get_cycles64());
 		break;
 	case KVM_REG_RISCV_TIMER_REG(compare):
 		t->next_cycles = reg_val;
@@ -219,6 +248,7 @@ int kvm_riscv_guest_timer_init(struct kvm *kvm)
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	gt->time_delta = -get_cycles64();
+	gt->frequency = riscv_timebase;
 
 	return 0;
 }
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
