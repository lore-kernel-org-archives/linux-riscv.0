Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC07BF5A8BC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieT0Impdy6tG1nNaVz+vvfBRRUmBgjqYvUPmr7qcTJs=; b=Exki3AlS6MjtsH
	DBCa0yFN483xQwG8fFU7cB1VegkFytc4uheTQwWboDuANvikmIcl+SMl94SpMeyNwFLcoPZhl5kMf
	lxAqRnZsul27ta1PVgk+y908fs+xNBuFwotzAlKsSHrtxCp5ACPmlL9UOrS+q1P6Y2483qUh3tHLp
	uWI9yAuM5PHp9wrHDKuccVA67OQ1Wlxkqox4YNs66DjaRMCMI53yZ6DQEUm6xyD0KjYrUbjuTZ5ej
	xLJ/j0Yw3DvThjge82w2xnDgqXFOT8YiXjI1w+/ZS3T9xCQyh2ygoIfg9t8NkwVzW7nctifdD5Y1d
	d2NofoEe/j+BmneLumcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2o-00000007fyq-3L2p;
	Mon, 20 Apr 2026 21:20:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2W-00000007fd5-4Ap1
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:26 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c7985752be1so661159a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720020; x=1777324820; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wb4qOZehlu9qqoPxcG4skBDjLAAYxFlHWRfg5heAd7Y=;
        b=tAzy4O4oM6f2X+CMo+PXSHeiVPDOSOz+bjv7lNUZksQvCo4EGMfM/ppiS/ASNznBDK
         8VjcBqtpvdIanNzNmbKvUdAF8+dT0I3yqAxRPmYgCxdsnAtkErQZcRA3jJFA3DbP6Fb/
         1jmt7mY/DY+avV09KscDlu7c9e2iSI3ugCGI13LjTpTRvf/l3EHxP1GmmrRKvg3nZ0it
         OOHFNodWl64JC8PZVQ4BC59HUIjYVP1KMkrK3rzDMlscKIAJ6JDTXfYcmfXbry5vqlgo
         FQMCvxdKixEQpkI7YghPymcMcspm07kmrQHTdlmJnLOv9mYMAKvYQ0hJlDNnXaLtm/Uv
         KrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720020; x=1777324820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wb4qOZehlu9qqoPxcG4skBDjLAAYxFlHWRfg5heAd7Y=;
        b=n44ORrPxLI2J8/GzcREoxDxRRKDA4cL6GTUFbn0tP1KCdCOZ6qzsxYJorFoF5ceQUb
         JoZYwUPPLLmoRaMtiUZfc6iF5KXZ07CB8Lm3yVPRO+Xxg1TXOtocBdEgzYZhdyLT2reR
         jLkZCsG04isi2F4DIf2AehZmExx1tWUjoRFU0NfC21gpNxbszrgDCt2j7ubPnwd5D2OF
         5mLgf4BvmpSjEoFMazlW+FB1T+FkOzUYaEL8i+vT55Y4wr3Ezshg3eCpFPXdre2VtYCS
         v9FeQ+nhWc60CTNOzf5HjobY4q7F8a1GUei3pbI+sqMXtZfywjG3cAddNElKRfLfE0V9
         T0vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9M7GJTsyLGEjMm3KlllIIT8twJzRP7oXstsjXIqD+cmQ8Qkmsjc3utYSIvBALxy6HXGqtNF5qyWDWFuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+AyfOX/s/5LQzFSlEO9aJHpxw8UVmm0fQsIj8nFSX8aqpTTGN
	seU3hwO6VSKtqWXvyf+BiFkufg9Ya5EnXPdRdynZSWK6UrP66PGk5LsDcwtrJ56yiYi+TNZWFaE
	bXYVIXg==
X-Received: from pfbfc25.prod.google.com ([2002:a05:6a00:2e19:b0:82f:98cb:c2a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c2:b0:82f:44dc:f85c
 with SMTP id d2e1a72fcca58-82f8c8d6ac2mr15859883b3a.34.1776720019124; Mon, 20
 Apr 2026 14:20:19 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:52 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-8-seanjc@google.com>
Subject: [PATCH v3 07/19] KVM: selftests: Use s32 instead of int32_t
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142021_144084_ED02F09D 
X-CRM114-Status: GOOD (  14.58  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: David Matlack <dmatlack@google.com>

Use s32 instead of int32_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int32_t/s32/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 24 +++++++++----------
 .../selftests/kvm/include/arm64/arch_timer.h  |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index f8b183f13864..f7625eb711d6 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -25,8 +25,8 @@
 /* Depends on counter width. */
 static u64 CVAL_MAX;
 /* tval is a signed 32-bit int. */
-static const int32_t TVAL_MAX = INT32_MAX;
-static const int32_t TVAL_MIN = INT32_MIN;
+static const s32 TVAL_MAX = INT32_MAX;
+static const s32 TVAL_MIN = INT32_MIN;
 
 /* After how much time we say there is no IRQ. */
 static const u32 TIMEOUT_NO_IRQ_US = 50000;
@@ -355,7 +355,7 @@ static void test_timer_cval(enum arch_timer timer, u64 cval,
 	test_timer_xval(timer, cval, TIMER_CVAL, wm, reset_state, reset_cnt);
 }
 
-static void test_timer_tval(enum arch_timer timer, int32_t tval,
+static void test_timer_tval(enum arch_timer timer, s32 tval,
 			    irq_wait_method_t wm, bool reset_state,
 			    u64 reset_cnt)
 {
@@ -385,10 +385,10 @@ static void test_cval_no_irq(enum arch_timer timer, u64 cval,
 	test_xval_check_no_irq(timer, cval, usec, TIMER_CVAL, wm);
 }
 
-static void test_tval_no_irq(enum arch_timer timer, int32_t tval, u64 usec,
+static void test_tval_no_irq(enum arch_timer timer, s32 tval, u64 usec,
 			     sleep_method_t wm)
 {
-	/* tval will be cast to an int32_t in test_xval_check_no_irq */
+	/* tval will be cast to an s32 in test_xval_check_no_irq */
 	test_xval_check_no_irq(timer, (u64)tval, usec, TIMER_TVAL, wm);
 }
 
@@ -463,7 +463,7 @@ static void test_timers_fired_multiple_times(enum arch_timer timer)
  * timeout for the wait: we use the wfi instruction.
  */
 static void test_reprogramming_timer(enum arch_timer timer, irq_wait_method_t wm,
-				     int32_t delta_1_ms, int32_t delta_2_ms)
+				     s32 delta_1_ms, s32 delta_2_ms)
 {
 	local_irq_disable();
 	reset_timer_state(timer, DEF_CNT);
@@ -504,7 +504,7 @@ static void test_reprogram_timers(enum arch_timer timer)
 
 static void test_basic_functionality(enum arch_timer timer)
 {
-	int32_t tval = (int32_t) msec_to_cycles(test_args.wait_ms);
+	s32 tval = (s32)msec_to_cycles(test_args.wait_ms);
 	u64 cval = DEF_CNT + msec_to_cycles(test_args.wait_ms);
 	int i;
 
@@ -685,7 +685,7 @@ static void test_set_cnt_after_xval_no_irq(enum arch_timer timer,
 }
 
 static void test_set_cnt_after_tval(enum arch_timer timer, u64 cnt_1,
-				    int32_t tval, u64 cnt_2,
+				    s32 tval, u64 cnt_2,
 				    irq_wait_method_t wm)
 {
 	test_set_cnt_after_xval(timer, cnt_1, tval, cnt_2, wm, TIMER_TVAL);
@@ -699,7 +699,7 @@ static void test_set_cnt_after_cval(enum arch_timer timer, u64 cnt_1,
 }
 
 static void test_set_cnt_after_tval_no_irq(enum arch_timer timer,
-					   u64 cnt_1, int32_t tval,
+					   u64 cnt_1, s32 tval,
 					   u64 cnt_2, sleep_method_t wm)
 {
 	test_set_cnt_after_xval_no_irq(timer, cnt_1, tval, cnt_2, wm,
@@ -718,7 +718,7 @@ static void test_set_cnt_after_cval_no_irq(enum arch_timer timer,
 static void test_move_counters_ahead_of_timers(enum arch_timer timer)
 {
 	int i;
-	int32_t tval;
+	s32 tval;
 
 	for (i = 0; i < ARRAY_SIZE(irq_wait_method); i++) {
 		irq_wait_method_t wm = irq_wait_method[i];
@@ -753,7 +753,7 @@ static void test_move_counters_behind_timers(enum arch_timer timer)
 
 static void test_timers_in_the_past(enum arch_timer timer)
 {
-	int32_t tval = -1 * (int32_t) msec_to_cycles(test_args.wait_ms);
+	s32 tval = -1 * (s32)msec_to_cycles(test_args.wait_ms);
 	u64 cval;
 	int i;
 
@@ -789,7 +789,7 @@ static void test_timers_in_the_past(enum arch_timer timer)
 
 static void test_long_timer_delays(enum arch_timer timer)
 {
-	int32_t tval = (int32_t) msec_to_cycles(test_args.long_wait_ms);
+	s32 tval = (s32)msec_to_cycles(test_args.long_wait_ms);
 	u64 cval = DEF_CNT + msec_to_cycles(test_args.long_wait_ms);
 	int i;
 
diff --git a/tools/testing/selftests/kvm/include/arm64/arch_timer.h b/tools/testing/selftests/kvm/include/arm64/arch_timer.h
index 4fe0e0d07584..a5836d4ab7ee 100644
--- a/tools/testing/selftests/kvm/include/arm64/arch_timer.h
+++ b/tools/testing/selftests/kvm/include/arm64/arch_timer.h
@@ -79,7 +79,7 @@ static inline u64 timer_get_cval(enum arch_timer timer)
 	return 0;
 }
 
-static inline void timer_set_tval(enum arch_timer timer, int32_t tval)
+static inline void timer_set_tval(enum arch_timer timer, s32 tval)
 {
 	switch (timer) {
 	case VIRTUAL:
@@ -95,7 +95,7 @@ static inline void timer_set_tval(enum arch_timer timer, int32_t tval)
 	isb();
 }
 
-static inline int32_t timer_get_tval(enum arch_timer timer)
+static inline s32 timer_get_tval(enum arch_timer timer)
 {
 	isb();
 	switch (timer) {
-- 
2.54.0.rc1.555.g9c883467ad-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
