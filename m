Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF300C636D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBS2w8M2qPG2dyKL3rDCMCJmZcA6+ZPruVL82tqDFRs=; b=EAc7s3aZWUyQ8N
	7LzV0quqPVK5LuSPGBs6EfkUZ/87qaKWn4RoVFTMKexYBQT83g3VhxCWrEe1BZtdcUVBgIKADvJxQ
	Y379G3yUuvCFkZbmP23dPCHBma7ira3Rzi6d1sy8FJbJQOBHzS3G4xYxw7QZjfpy/ZfjxVgD6X0tU
	wTMELvyizSKKdQwAjx3VTdDYlGY83ggvrPXrribBXwsNowMGCyKmIb7K9JaQbIHZ11c8E6bj83J2m
	nYxq3XMSoQq3kx6TBOghTNsFCyYrmE0++jaHvkRhZvycyQT/0SEwTty6ivy+SZkYxanGsypF/SAzt
	8JcKaJp5ioTRYH/dd6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHCF-00Aw3Y-Pw; Tue, 07 Feb 2023 06:11:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHCB-00Aw0z-H3
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 06:11:13 +0000
Received: by mail-pf1-x42f.google.com with SMTP id n2so10041687pfo.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 22:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rAcX9aaFjXRXaxTFHD9BwOlLSG25X1nzXDAU6wa6LN4=;
        b=QFA55Z3owdD7Qqm7qantYesixVLz/YV5mQY8OB36UyTkX1O+jv7dtgW8mlmXov68he
         Sp47ymJ8lA4yojfiudNfX269H7aHw4B0KZ3A7xIyByAjRPaseqgUw12rTrUnkT3L//vG
         O/KXCHwfhMdSYjIg5QWAG94t4Zg1hgL5HEDBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAcX9aaFjXRXaxTFHD9BwOlLSG25X1nzXDAU6wa6LN4=;
        b=vnpMga5IGHwYtn8Z2jT3A6S7LuYzAaP6yjgZQuztObrfGkAG0WIhg1wmCHAwdh+RwO
         X4EEhSOErmfB6jPvm2worhhDPb3L3eG07gqqDK/r9QYJUDXDerqppQJbBcmepDpKlDU+
         D09aXIhpYB7QB8AvFpDRj6LzGBLKuMIAyZqKzCNS6KyA3FSjnkb122nThdJqDEGeC51B
         kZxdwYAYA9qd8eXD7bS7SryIRpuksmiwOfpuDAcRvqLTyW7NzSHgJdjEJlK5n3mPRSDe
         sK7pIwNvUal9YIMTAj9Ni3ZV/YkXc3eX3rbEXgKyEc1kCp7PT0qb5rEQe5GBi+f3Bk/K
         uPGA==
X-Gm-Message-State: AO0yUKUInraZc1exNcMpGh6aV14WUbgw8eg9M07T9y8grFBW9NMqFoCK
	Dw2MTefDqyM6WGVoqZ93NFaPRz8AaXZKOzLhLaHtjNqnHGKLP84=
X-Google-Smtp-Source: AK7set8GCI2+N5yKUnT63zTuZxVFJbNXLiYrGyefyOdpN5Wd2cg8/+0sabR/eAwg9CBuYMJPxhIOLP3kyInF2DSi2j4=
X-Received: by 2002:a63:7a56:0:b0:4c7:ef33:bbe1 with SMTP id
 j22-20020a637a56000000b004c7ef33bbe1mr306028pgn.73.1675750269029; Mon, 06 Feb
 2023 22:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20230205011515.1284674-1-atishp@rivosinc.com> <20230205011515.1284674-9-atishp@rivosinc.com>
 <F8326D42-00ED-4639-91E7-5CF8E84469E7@kernel.org>
In-Reply-To: <F8326D42-00ED-4639-91E7-5CF8E84469E7@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 6 Feb 2023 22:10:57 -0800
Message-ID: <CAOnJCULfPR22sHLYAOmqbTZUg9XY3trOnMVoEcWjVXKU-TCw8A@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] RISC-V: KVM: Add SBI PMU extension support
To: Conor Dooley <conor@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_221111_819763_2C6C1A1F 
X-CRM114-Status: GOOD (  21.51  )
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

On Sun, Feb 5, 2023 at 2:31 AM Conor Dooley <conor@kernel.org> wrote:
>
>
>
> On 5 February 2023 02:15:09 GMT+01:00, Atish Patra <atishp@rivosinc.com> wrote:
> >SBI PMU extension allows KVM guests to configure/start/stop/query about
> >the PMU counters in virtualized enviornment as well.
> >
> >In order to allow that, KVM implements the entire SBI PMU extension.
> >
> >Reviewed-by: Anup Patel <anup@brainfault.org>
> >Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Hey Atish,
> CI is still complaining about something in this patch:
> https://gist.github.com/conor-pwbot/8f8d6a60a65b0b44d96c9c3b220e3efd
>

This is an invalid warning as vcpu_sbi_ext_pmu is used as an extern variable in
arch/riscv/kvm/vcpu_sbi.c. That's how every sbi extension code defines the
kvm_vcpu_sbi_extension in its own respective file.


> I'm without a laptop this weekend, so apologies for
> the lack of investigation as to whether there's a
> reason for it.
>
> Cheers,
> Conor.
>
>
> >---
> > arch/riscv/kvm/Makefile       |  2 +-
> > arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
> > arch/riscv/kvm/vcpu_sbi_pmu.c | 87 +++++++++++++++++++++++++++++++++++
> > 3 files changed, 99 insertions(+), 1 deletion(-)
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> >was > >diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> >index 5de1053..278e97c 100644
> >--- a/arch/riscv/kvm/Makefile
> >+++ b/arch/riscv/kvm/Makefile
> >@@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
> > kvm-y += vcpu_sbi_replace.o
> > kvm-y += vcpu_sbi_hsm.o
> > kvm-y += vcpu_timer.o
> >-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
> >+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
> >diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> >index fe2897e..15fde15 100644
> >--- a/arch/riscv/kvm/vcpu_sbi.c
> >+++ b/arch/riscv/kvm/vcpu_sbi.c
> >@@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
> > };
> > #endif
> >
> >+#ifdef CONFIG_RISCV_PMU_SBI
> >+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> >+#else
> >+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> >+      .extid_start = -1UL,
> >+      .extid_end = -1UL,
> >+      .handler = NULL,
> >+};
> >+#endif
> >+
> > static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> >       &vcpu_sbi_ext_v01
> >       &vcpu_sbi_ext_base,
> >@@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> >       &vcpu_sbi_ext_rfence,
> >       &vcpu_sbi_ext_srst,
> >       &vcpu_sbi_ext_hsm,
> >+      &vcpu_sbi_ext_pmu,
> >       &vcpu_sbi_ext_experimental,
> >       &vcpu_sbi_ext_vendor,
> > };
> >diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> >new file mode 100644
> >index 0000000..9fdc1e1
> >--- /dev/null
> >+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> >@@ -0,0 +1,87 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * Copyright (c) 2023 Rivos Inc
> >+ *
> >+ * Authors:
> >+ *     Atish Patra <atishp@rivosinc.com>
> >+ */
> >+
> >+#include <linux/errno.h>
> >+#include <linux/err.h>
> >+#include <linux/kvm_host.h>
> >+#include <asm/csr.h>
> >+#include <asm/sbi.h>
> >+#include <asm/kvm_vcpu_sbi.h>
> >+
> >+static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >+                                 struct kvm_vcpu_sbi_return *retdata)
> >+{
> >+      int ret = 0;
> >+      struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> >+      struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> >+      unsigned long funcid = cp->a6;
> >+      u64 temp;
> >+
> >+      /* Return not supported if PMU is not initialized */
> >+      if (!kvpmu->init_done) {
> >+              retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> >+              return 0;
> >+      }
> >+
> >+      switch (funcid) {
> >+      case SBI_EXT_PMU_NUM_COUNTERS:
> >+              ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
> >+              break;
> >+      case SBI_EXT_PMU_COUNTER_GET_INFO:
> >+              ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
> >+              break;
> >+      case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> >+#if defined(CONFIG_32BIT)
> >+              temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> >+#else
> >+              temp = cp->a4;
> >+#endif
> >+              /*
> >+               * This can fail if perf core framework fails to create an event.
> >+               * Forward the error to userspace because it's an error happened
> >+               * within the host kernel. The other option would be to convert
> >+               * this an SBI error and forward to the guest.
> >+               */
> >+              ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> >+                                                     cp->a2, cp->a3, temp, retdata);
> >+              break;
> >+      case SBI_EXT_PMU_COUNTER_START:
> >+#if defined(CONFIG_32BIT)
> >+              temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> >+#else
> >+              temp = cp->a3;
> >+#endif
> >+              ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> >+                                                 temp, retdata);
> >+              break;
> >+      case SBI_EXT_PMU_COUNTER_STOP:
> >+              ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
> >+              break;
> >+      case SBI_EXT_PMU_COUNTER_FW_READ:
> >+              ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> >+              break;
> >+      default:
> >+              retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> >+      }
> >+
> >+      return ret;
> >+}
> >+
> >+static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
> >+{
> >+      struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> >+
> >+      return kvpmu->init_done;
> >+}
> >+
> >+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> >+      .extid_start = SBI_EXT_PMU,
> >+      .extid_end = SBI_EXT_PMU,
> >+      .handler = kvm_sbi_ext_pmu_handler,
> >+      .probe = kvm_sbi_ext_pmu_probe,
> >+};



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
