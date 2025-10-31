Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D642CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJN6Cuw1mJ0UZ+R+1yC2Sv0IexGFgoMNJ2Ib9XaVRBg=; b=E1MAMReLhf6J6f
	soS4Iwwo9J2sxG6vthaCCOM+mqHWU6XJnjtFnZulol4m3aDVDSasbFPokyEKbeNzc+zmDL9mnsU3+
	Lt/ZglFEbdYvjKRhQzpTiWDtewXS1lW8+XN5Yjtlo5ArjA2o7EeV/PLfK7z94qtajUiL5PC/QlupD
	+JDwDiZoiSU+hJOwqlxyXAhFVicH0M0A8t94zjMAnr9xxjlzZ8uH6y3EMAJOHdTUwuGoD/eVg43iA
	MqKl2QJDY0Ibp5UhkDyiAoWs3k1pR881RPobRcCxSLhQUVDkrZRpdNSNnRcB1RjpAPHBIPC9V3PsH
	zyTG+AV64FrqueUDklrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfdK-00000005KCr-1QSP;
	Fri, 31 Oct 2025 03:16:58 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfdH-00000005KBa-0oQM
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 03:16:56 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dxvr8lKgRpVe0cAA--.61182S3;
	Fri, 31 Oct 2025 11:16:53 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxjcEkKgRpxMkeAQ--.48052S2;
	Fri, 31 Oct 2025 11:16:52 +0800 (CST)
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
Subject: [PATCH 6/6] KVM: LoongArch: selftests: Add SW emulated timer test
Date: Fri, 31 Oct 2025 11:16:52 +0800
Message-Id: <20251031031652.4020879-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20251031031227.4020738-1-maobibo@loongson.cn>
References: <20251031031227.4020738-1-maobibo@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxjcEkKgRpxMkeAQ--.48052S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201655_614096_D2BFB0D9 
X-CRM114-Status: UNSURE (   8.08  )
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

This test case setup one-shot timer and execute idle instruction
immediately to indicate giving up CPU, hypervisor will emulate
SW hrtimer and wakeup vCPU when SW hrtimer is fired.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 .../selftests/kvm/loongarch/arch_timer.c      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/loongarch/arch_timer.c b/tools/testing/selftests/kvm/loongarch/arch_timer.c
index 1be42ef33bf3..a30dd0414a34 100644
--- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
+++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
@@ -114,6 +114,45 @@ static void guest_time_count_test(uint32_t cpu)
 	}
 }
 
+static void do_idle(void)
+{
+	unsigned int intid;
+	unsigned long estat;
+
+	__asm__ __volatile__("idle 0" : : : "memory");
+
+	estat = csr_read(LOONGARCH_CSR_ESTAT);
+	intid = !!(estat & BIT(INT_TI));
+
+	/* Make sure pending timer IRQ arrived */
+	GUEST_ASSERT_EQ(intid, 1);
+	csr_write(CSR_TINTCLR_TI, LOONGARCH_CSR_TINTCLR);
+}
+
+static void guest_test_emulate_timer(uint32_t cpu)
+{
+	uint32_t config_iter;
+	uint64_t xcnt_diff_us, us;
+	struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
+
+	local_irq_disable();
+	shared_data->nr_iter = 0;
+	us = msecs_to_usecs(test_args.timer_period_ms);
+	for (config_iter = 0; config_iter < test_args.nr_iter; config_iter++) {
+		shared_data->xcnt = timer_get_cycles();
+
+		/* Setup the next interrupt */
+		timer_set_next_cmp_ms(test_args.timer_period_ms, false);
+		do_idle();
+
+		xcnt_diff_us = cycles_to_usec(timer_get_cycles() - shared_data->xcnt);
+		__GUEST_ASSERT(xcnt_diff_us >= us,
+				"xcnt_diff_us = 0x%lx, us = 0x%lx.\n",
+				xcnt_diff_us, us);
+	}
+	local_irq_enable();
+}
+
 static void guest_code(void)
 {
 	uint32_t cpu = guest_get_vcpuid();
@@ -123,6 +162,7 @@ static void guest_code(void)
 	local_irq_enable();
 	guest_test_oneshot_timer(cpu);
 	guest_test_period_timer(cpu);
+	guest_test_emulate_timer(cpu);
 
 	GUEST_DONE();
 }
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
