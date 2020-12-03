Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348D3C71156
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544F522244
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 544F522244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SJqFisnfm72XofZpDL7eT8Tys0xuXnLyNONekxDMZNc=; b=cJ0nsY0p2wDtIaou3whQ/1a1f
	BnN25W2arKQae4DMWaVmP45CsgbWXTHG561xFEShc4fAg/TvJd5SMoDTfpwF5j3khDeMx0OJ6Dk9X
	EDHnaMqZynOmS1THSqhy8vv+rg4c1XC0Eog7kKHwt/HD4SYh6njaoxv09RrS4NeKOkqy9++dIZAF6
	LUBfFMp1hQDX9bGL7sSTBzinoH35kdcE5FVKOmbqIp4qGtvD5vx2IolixaZAot2/jYTAps8nzuJZh
	H7SEnWgy7oRxwH5l0N2xv5HOUs94izH47eZFxYQupcEjnJnrtceaaa/xsGlsYQJHRLoKCTm2UUv2u
	D58Yzub1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kknby-0001rg-2F; Thu, 03 Dec 2020 12:21:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kknbt-0001nK-NC; Thu, 03 Dec 2020 12:21:23 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cmw0N6GcxzLywj;
 Thu,  3 Dec 2020 20:20:36 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:21:05 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <anup.patel@wdc.com>, <atish.patra@wdc.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pbonzini@redhat.com>
Subject: [PATCH RFC 1/3] RISC-V: KVM: Change the method of calculating cycles
 to nanoseconds
Date: Thu, 3 Dec 2020 20:18:37 +0800
Message-ID: <20201203121839.308-2-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_072122_053892_4CD6173F 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: zhang.zhanghailiang@huawei.com, kvm@vger.kernel.org, yinyipeng1@huawei.com,
 victor.zhangxiaofeng@huawei.com, linux-kernel@vger.kernel.org,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Because we will introduce the dynamic guest frequency later, we
can't use the fixed mult and shift to calculate nanoseconds.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h | 3 ---
 arch/riscv/kvm/vcpu_timer.c             | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 375281eb49e0..87e00d878999 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -12,9 +12,6 @@
 #include <linux/hrtimer.h>
 
 struct kvm_guest_timer {
-	/* Mult & Shift values to get nanoseconds from cycles */
-	u32 nsec_mult;
-	u32 nsec_shift;
 	/* Time delta value */
 	u64 time_delta;
 };
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ddd0ce727b83..f6b35180199a 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -33,7 +33,7 @@ static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 		cycles_delta = cycles - cycles_now;
 	else
 		cycles_delta = 0;
-	delta_ns = (cycles_delta * gt->nsec_mult) >> gt->nsec_shift;
+	delta_ns = mul_u64_u64_div_u64(cycles_delta, NSEC_PER_SEC, riscv_timebase);
 	local_irq_restore(flags);
 
 	return delta_ns;
@@ -218,7 +218,6 @@ int kvm_riscv_guest_timer_init(struct kvm *kvm)
 {
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
-	riscv_cs_get_mult_shift(&gt->nsec_mult, &gt->nsec_shift);
 	gt->time_delta = -get_cycles64();
 
 	return 0;
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
