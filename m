Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE4BC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LeGVoQmfUNQtcVeu4z5RRm8cgKqbvVK6IMkE1JxD3Q=; b=Ourfhwh0+cBeHI
	MHqSgLB+Xnc9us6rvn/ubquxMyHwMjXttXx5hRjlfzu6tvW9VlXJ7YPHOXsRsGUy6ZgHjLOeueoEC
	rCuVjj2znflAnAEeRP57SsQ1PK4F2eusGlrdEUo9BrU7tB3jrRGmJwAQjn8xp9nA7i0iUCfOMc8/b
	7dFWRDxGVE/C3gtH30AuCfkhmzp+Fan3gR1/3e/L4eIusBTq2QOZx3Kf8cvUYh1FHD+Pl5wHsdxjM
	O9Rp5uffgeVP3A1qJY6kN4jMfGMsbfV8NDD4rDBTqy2zHls/RYC3Zoag5Mx9R3rEPT4Fow+gyp8ld
	uwWjF9tIsEW3yhCn4+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHPf-00Az4o-5G; Tue, 07 Feb 2023 06:25:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHPZ-00Az2b-JF; Tue, 07 Feb 2023 06:25:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4C10B816D9;
	Tue,  7 Feb 2023 06:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7542C433EF;
	Tue,  7 Feb 2023 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675751098;
	bh=54y3Lwvfe2FREfsKfSnUXmHXeq1yIf3FBACyGmaiRRE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BC8LniRyI7cZxEo6V/OJ2TfOH069VH0jc3qDneWC0kfyzjiws/UB91UqGoy0lFgtx
	 LXYsyjUw8f+1sNxpJGlVBfya8ow4ZabdSUYnCD4ja7JcVTA+TotnsaDqC4FFyOxLwJ
	 /gw4Ly8IuJfxueit4OOu1nlpPL7HlA39DXOltgVBME/WkaSFStpXG5ENnJxQEVlLd0
	 U+XIOSiAB4yFt/zAAbl7QLaniwUHax1VWlpRkQuTG7iHvQ9dPs1sNYkPuWGAQtGT5B
	 logFTUf/8ekR7GU/UUYD6rX7lxMZlVKA5kmfFXLrfslmnLEUsm5nJwAQ45jlD/Ys69
	 6JL2WFFYwXU7Q==
Date: Tue, 07 Feb 2023 06:24:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
CC: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 08/14] RISC-V: KVM: Add SBI PMU extension support
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOnJCULfPR22sHLYAOmqbTZUg9XY3trOnMVoEcWjVXKU-TCw8A@mail.gmail.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com> <20230205011515.1284674-9-atishp@rivosinc.com> <F8326D42-00ED-4639-91E7-5CF8E84469E7@kernel.org> <CAOnJCULfPR22sHLYAOmqbTZUg9XY3trOnMVoEcWjVXKU-TCw8A@mail.gmail.com>
Message-ID: <B878B403-34BD-457D-971B-7E6D5726E8F8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_222501_961463_7E67779D 
X-CRM114-Status: GOOD (  20.75  )
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



On 7 February 2023 06:10:57 GMT, Atish Patra <atishp@atishpatra.org> wrote:
>On Sun, Feb 5, 2023 at 2:31 AM Conor Dooley <conor@kernel.org> wrote:
>>
>>
>>
>> On 5 February 2023 02:15:09 GMT+01:00, Atish Patra <atishp@rivosinc.com> wrote:
>> >SBI PMU extension allows KVM guests to configure/start/stop/query about
>> >the PMU counters in virtualized enviornment as well.
>> >
>> >In order to allow that, KVM implements the entire SBI PMU extension.
>> >
>> >Reviewed-by: Anup Patel <anup@brainfault.org>
>> >Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>
>> Hey Atish,
>> CI is still complaining about something in this patch:
>> https://gist.github.com/conor-pwbot/8f8d6a60a65b0b44d96c9c3b220e3efd
>>
>
>This is an invalid warning as vcpu_sbi_ext_pmu is used as an extern variable in
>arch/riscv/kvm/vcpu_sbi.c. That's how every sbi extension code defines the
>kvm_vcpu_sbi_extension in its own respective file.

Ah, so the user is in another patch.

>> I'm without a laptop this weekend, so apologies for
>> the lack of investigation as to whether there's a
>> reason for it.

Hard to check these things from a phone!
Sorry for bothering you so.

>>
>> Cheers,
>> Conor.
>>
>>
>> >---
>> > arch/riscv/kvm/Makefile       |  2 +-
>> > arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>> > arch/riscv/kvm/vcpu_sbi_pmu.c | 87 +++++++++++++++++++++++++++++++++++
>> > 3 files changed, 99 insertions(+), 1 deletion(-)
>> > create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
>> >was > >diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
>> >index 5de1053..278e97c 100644
>> >--- a/arch/riscv/kvm/Makefile
>> >+++ b/arch/riscv/kvm/Makefile
>> >@@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
>> > kvm-y += vcpu_sbi_replace.o
>> > kvm-y += vcpu_sbi_hsm.o
>> > kvm-y += vcpu_timer.o
>> >-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
>> >+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
>> >diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>> >index fe2897e..15fde15 100644
>> >--- a/arch/riscv/kvm/vcpu_sbi.c
>> >+++ b/arch/riscv/kvm/vcpu_sbi.c
>> >@@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>> > };
>> > #endif
>> >
>> >+#ifdef CONFIG_RISCV_PMU_SBI
>> >+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
>> >+#else
>> >+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>> >+      .extid_start = -1UL,
>> >+      .extid_end = -1UL,
>> >+      .handler = NULL,
>> >+};
>> >+#endif
>> >+
>> > static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>> >       &vcpu_sbi_ext_v01
>> >       &vcpu_sbi_ext_base,
>> >@@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>> >       &vcpu_sbi_ext_rfence,
>> >       &vcpu_sbi_ext_srst,
>> >       &vcpu_sbi_ext_hsm,
>> >+      &vcpu_sbi_ext_pmu,
>> >       &vcpu_sbi_ext_experimental,
>> >       &vcpu_sbi_ext_vendor,
>> > };
>> >diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
>> >new file mode 100644
>> >index 0000000..9fdc1e1
>> >--- /dev/null
>> >+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
>> >@@ -0,0 +1,87 @@
>> >+// SPDX-License-Identifier: GPL-2.0
>> >+/*
>> >+ * Copyright (c) 2023 Rivos Inc
>> >+ *
>> >+ * Authors:
>> >+ *     Atish Patra <atishp@rivosinc.com>
>> >+ */
>> >+
>> >+#include <linux/errno.h>
>> >+#include <linux/err.h>
>> >+#include <linux/kvm_host.h>
>> >+#include <asm/csr.h>
>> >+#include <asm/sbi.h>
>> >+#include <asm/kvm_vcpu_sbi.h>
>> >+
>> >+static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>> >+                                 struct kvm_vcpu_sbi_return *retdata)
>> >+{
>> >+      int ret = 0;
>> >+      struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>> >+      struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> >+      unsigned long funcid = cp->a6;
>> >+      u64 temp;
>> >+
>> >+      /* Return not supported if PMU is not initialized */
>> >+      if (!kvpmu->init_done) {
>> >+              retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>> >+              return 0;
>> >+      }
>> >+
>> >+      switch (funcid) {
>> >+      case SBI_EXT_PMU_NUM_COUNTERS:
>> >+              ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
>> >+              break;
>> >+      case SBI_EXT_PMU_COUNTER_GET_INFO:
>> >+              ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
>> >+              break;
>> >+      case SBI_EXT_PMU_COUNTER_CFG_MATCH:
>> >+#if defined(CONFIG_32BIT)
>> >+              temp = ((uint64_t)cp->a5 << 32) | cp->a4;
>> >+#else
>> >+              temp = cp->a4;
>> >+#endif
>> >+              /*
>> >+               * This can fail if perf core framework fails to create an event.
>> >+               * Forward the error to userspace because it's an error happened
>> >+               * within the host kernel. The other option would be to convert
>> >+               * this an SBI error and forward to the guest.
>> >+               */
>> >+              ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
>> >+                                                     cp->a2, cp->a3, temp, retdata);
>> >+              break;
>> >+      case SBI_EXT_PMU_COUNTER_START:
>> >+#if defined(CONFIG_32BIT)
>> >+              temp = ((uint64_t)cp->a4 << 32) | cp->a3;
>> >+#else
>> >+              temp = cp->a3;
>> >+#endif
>> >+              ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
>> >+                                                 temp, retdata);
>> >+              break;
>> >+      case SBI_EXT_PMU_COUNTER_STOP:
>> >+              ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>> >+              break;
>> >+      case SBI_EXT_PMU_COUNTER_FW_READ:
>> >+              ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
>> >+              break;
>> >+      default:
>> >+              retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>> >+      }
>> >+
>> >+      return ret;
>> >+}
>> >+
>> >+static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
>> >+{
>> >+      struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> >+
>> >+      return kvpmu->init_done;
>> >+}
>> >+
>> >+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>> >+      .extid_start = SBI_EXT_PMU,
>> >+      .extid_end = SBI_EXT_PMU,
>> >+      .handler = kvm_sbi_ext_pmu_handler,
>> >+      .probe = kvm_sbi_ext_pmu_probe,
>> >+};
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
