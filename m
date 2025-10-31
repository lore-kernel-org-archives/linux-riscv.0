Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD67CCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/hJpITCv4L02SyEhsKF4FQF2+9FJzwbksuzPoGYYTQ=; b=VqVWKy0O7FhWSc
	OKYf1cS8EgTqbJ/WSmcPT5DPCnGhVjFQ6wwyaqZfX8KWh3FPHaCvuEPTasUdjuY3ZfdURjqnLG8PZ
	jpuTfqSp1Gh3J9QWfqU0b7LUhGU1ioeZti6fix0HtytszY+zKRnWm+4gpZBGQX/jfbeoNlftyVoJ5
	RmuiwZlDaoX7oEBuwRE5OeS+y9OdERrvE3GAqPK8qJETPVuNnNNpLOVTol9ez5a6UfL9HPDuAW7Vt
	nqCHjGCe31pp6kEc7CPmRQjFUbB/z2zO3BbpcSlM63wAthVi070c8uwlBYkuvq1Q6Fg8v37OVjSTi
	wTMjfed75u2Gw/JXRvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfd5-00000005K9B-3uLs;
	Fri, 31 Oct 2025 03:16:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfd5-00000005K8d-03DI
	for linux-riscv@bombadil.infradead.org;
	Fri, 31 Oct 2025 03:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=59kRw4t6L/3X65l5NWZZmckO3L9EhtcF2laH+8tMB2o=; b=mDs4sgM+TA0ncPrNyJ+xEO0hTZ
	8cuHPIPqXaYsx1LD7ZeHVyDQQAOnyGrfRXZhhnI5c1DAMCWTWRQs6C33NxHUOvyr1eEb+yae/jzE+
	68TfGRv+tr6pA2Z1P3VU73VHrcMLTUBfYLOZtbJ3h7pEX1XXEs3foGw/jo5Gi9t7KU5qd3GFho01w
	YzXLwHbBLmLIWIXqTQYwpLgmkayGP9Zg26a8fi8bF0eszCf3zYer7BR+9WEQEosLrG+w42AnpwUjG
	1Bd7JuykpKpujoe+xAfeS9n6kOh9//9yTRy5ezDEBUeJMMtxoBALkSi8YBxPePjXx+hRycCzkb3fU
	dthwoWEw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfd0-00000003DIG-1SwF
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 03:16:41 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxL9MVKgRpQO0cAA--.61961S3;
	Fri, 31 Oct 2025 11:16:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxH8IUKgRpu8keAQ--.47195S2;
	Fri, 31 Oct 2025 11:16:36 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/6] KVM: LoongArch: selftests: Add period mode timer and time counter test
Date: Fri, 31 Oct 2025 11:16:36 +0800
Message-Id: <20251031031636.4020857-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20251031031227.4020738-1-maobibo@loongson.cn>
References: <20251031031227.4020738-1-maobibo@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJCxH8IUKgRpu8keAQ--.47195S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031640_219851_A4D50E6C 
X-CRM114-Status: UNSURE (   9.96  )
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

Period mode timer and time counter test case is added. Timer only need
program once with period mode, its compared tick value will reload when
timer is fired. With time counter, it is always growing up until
overflow with value BIT_ULL(48).

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 .../kvm/include/loongarch/arch_timer.h        |  5 ++
 .../selftests/kvm/loongarch/arch_timer.c      | 49 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
index 94b1cba2744d..b6399e748f72 100644
--- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
+++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
@@ -36,6 +36,11 @@ static inline void timer_set_next_cmp_ms(unsigned int msec, bool period)
 	csr_write(val, LOONGARCH_CSR_TCFG);
 }
 
+static inline void disable_timer(void)
+{
+	csr_write(0, LOONGARCH_CSR_TCFG);
+}
+
 static inline unsigned long timer_get_val(void)
 {
 	return csr_read(LOONGARCH_CSR_TVAL);
diff --git a/tools/testing/selftests/kvm/loongarch/arch_timer.c b/tools/testing/selftests/kvm/loongarch/arch_timer.c
index 2a2cebcf3885..1be42ef33bf3 100644
--- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
+++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
@@ -23,6 +23,13 @@ static void guest_irq_handler(struct ex_regs *regs)
 	GUEST_ASSERT_EQ(intid, 1);
 
 	cfg = timer_get_cfg();
+	if (cfg & CSR_TCFG_PERIOD) {
+		WRITE_ONCE(shared_data->nr_iter, shared_data->nr_iter - 1);
+		if (shared_data->nr_iter == 0)
+			disable_timer();
+		csr_write(CSR_TINTCLR_TI, LOONGARCH_CSR_TINTCLR);
+		return;
+	}
 
 	/*
 	 * On physical machine, value of LOONGARCH_CSR_TVAL is BIT_ULL(48) - 1
@@ -67,13 +74,55 @@ static void guest_test_oneshot_timer(uint32_t cpu)
 	}
 }
 
+static void guest_test_period_timer(uint32_t cpu)
+{
+	uint32_t irq_iter;
+	uint64_t us;
+	struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
+
+	shared_data->nr_iter = test_args.nr_iter;
+	shared_data->xcnt = timer_get_cycles();
+	us = msecs_to_usecs(test_args.timer_period_ms) + test_args.timer_err_margin_us;
+	timer_set_next_cmp_ms(test_args.timer_period_ms, true);
+	/* Setup a timeout for the interrupt to arrive */
+	udelay(us * test_args.nr_iter);
+	irq_iter = READ_ONCE(shared_data->nr_iter);
+	__GUEST_ASSERT(irq_iter == 0,
+			"irq_iter = 0x%x.\n"
+			"  Guest period timer interrupt was not triggered within the specified\n"
+			"  interval, try to increase the error margin by [-e] option.\n",
+			irq_iter);
+}
+
+static void guest_time_count_test(uint32_t cpu)
+{
+	uint32_t config_iter;
+	unsigned long start, end, prev, us;
+
+	us = msec_to_cycles(test_args.timer_period_ms);
+	for (config_iter = 0; config_iter < test_args.nr_iter; config_iter++) {
+		start = timer_get_cycles();
+		end = start + us;
+		/* test time count growing up always */
+		while (start < end) {
+			prev = start;
+			start = timer_get_cycles();
+			__GUEST_ASSERT(prev <= start,
+					"prev = 0x%lx, start = 0x%lx.\n",
+					prev, start);
+		}
+	}
+}
+
 static void guest_code(void)
 {
 	uint32_t cpu = guest_get_vcpuid();
 
+	guest_time_count_test(cpu);
 	timer_irq_enable();
 	local_irq_enable();
 	guest_test_oneshot_timer(cpu);
+	guest_test_period_timer(cpu);
 
 	GUEST_DONE();
 }
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
