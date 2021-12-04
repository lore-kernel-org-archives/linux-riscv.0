Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB70C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsYZBXQKVWNbfZXYHouF6HR5Rq1OfzZtZu9T8zPLwho=; b=m9sRLFTnotzsGH
	IxRYT083gOaXWLqlIiitvgM9RtG1v0pg0VyDUQnjv24TmsnkXw6vRB1U/djAwj/K/qm97Jm2ESaqR
	gRuZPlPoryoDUC7V5LO34Hi2lT3ZOBVSixAiNhG5WQBtr1vcIjcY/l0FR7m4gOtI64sk0R1G/fnux
	r/B4bf86lnSYZBPjtOJtDlNaxoIWyQT9pUxwwgvhnafKqYj0e7ajsTxUXHXlg4wZtnnbTpMZbtAC6
	z00+wAneEXRcvM6epRRZiz5uKnEA4qk9jBCmOvccJ8ciD7+gGLE9uvR9fCzjYp4/QOun43nta1wEF
	AxtdhPJxeVZN6ROPxRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtInV-00HHsY-GY; Sat, 04 Dec 2021 00:21:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtInN-00HHkp-0I
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:20:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id r5so4619325pgi.6
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAj3/ce5O2ZrRi0wWpAgfPpvWzW6SpIzMmjlaeDyTEs=;
 b=s6KVVmyJS2rECd00TuEz0H035FZF4S14FINOzD3WgMXi7nJBDoWfnuTGAoPeYN8pvd
 1Xrl/7T6U1NnFXuu86JtIR2AE9YyqJKC+I/vx/w857O+wC+hQnPoyXcmz2jvbX/zfjxL
 03LErAs0yNF5xrh0z+DUvMCIdHjIZljP9xKcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAj3/ce5O2ZrRi0wWpAgfPpvWzW6SpIzMmjlaeDyTEs=;
 b=VXSeHbObxbYBxPMJQ7BubsKd7F5wFh1KfLpN8vuy6GtVK3pfYiHl6hyEcjMHtYLCED
 KGBux8sitm96S/pAAI89n7aS3WcGODQtXeLRLat3hIqly8C4vP0Cu2/NBUEkkAYzysH5
 VwRL/V65B9hC79U6k0FwQkEh7J/88mE5RlCRpVnLRm92ZXSPqu0kUoChOPNdv1RAGTZ7
 glkh1wa49bpsJA1SOUEJIN6P11fbddyPAbuLWDQu+iN6h3wtA1UJqpXfB/jnqyBKgdwR
 snSBy/SfWebvhfkR8J2s9OrbGA8Jxw3T7gXarJu8GcXp1s12KuYQ1riX5EKiVmAQsqDg
 X3BA==
X-Gm-Message-State: AOAM530MJzTQDJyozM3whDCciHue+2FQiQn+V/BmDcXX5lfvOJstaGj9
 SMsZoHTkxHuwO/GauEZswwb7
X-Google-Smtp-Source: ABdhPJxPDj3DWbT7QqjNKVsjj1yuYyzu1X+tTz+Do5tfnZ9g5efBXY2tvN30FJZSJp/0d+/KXVB6Dw==
X-Received: by 2002:a05:6a00:1816:b0:49f:cd0d:b51b with SMTP id
 y22-20020a056a00181600b0049fcd0db51bmr21994104pfa.6.1638577251449; 
 Fri, 03 Dec 2021 16:20:51 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id r6sm3272402pjg.21.2021.12.03.16.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:20:51 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [RFC 0/6] Sparse HART id support 
Date: Fri,  3 Dec 2021 16:20:32 -0800
Message-Id: <20211204002038.113653-1-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_162053_165135_E053F865 
X-CRM114-Status: GOOD (  21.41  )
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

Currently, sparse hartid is not supported for Linux RISC-V for the following
reasons.
1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
   which is an array size of NR_CPUs.
2. During early booting, any hartid greater than NR_CPUs are not booted at all.
3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
   generating hartmask.

In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
which was logically incorrect anyways. NR_CPUs represent the maximum logical|
CPU id configured in the kernel while the hartid represent the physical hartid
stored in mhartid CSR defined by the privilege specification. Thus, hartid
can have much greater value than logical cpuid.

Currently, we have two methods of booting. Ordered booting where the booting
hart brings up each non-booting hart one by one using SBI HSM extension.
The spinwait booting method relies on harts jumping to Linux kernel randomly
and boot hart is selected by a lottery. All other non-booting harts keep
spinning on __cpu_up_stack/task_pointer until boot hart initializes the data.
Both these methods rely on __cpu_up_stack/task_pointer to setup the stack/
task pointer. The spinwait method is mostly used to support older firmwares
without SBI HSM extension and M-mode Linux.  The ordered booting method is the
preferred booting method for booting general Linux because it can support
cpu hotplug and kexec.

The first patch modified the ordered booting method to use an opaque parameter
already available in HSM start API to setup the stack/task pointer. The third
patch resolves the issue #1 by limiting the usage of
__cpu_up_stack/task_pointer to spinwait specific booting method. The fourth 
and fifth patch moves the entire hart lottery selection and spinwait method
to a separate config that can be disabled if required. It solves the issue #2.
The 6th patch solves issue #3 and #4 by removing riscv_cpuid_to_hartid_mask
completely. All the SBI APIs directly pass a pointer to struct cpumask and
the SBI implementation takes care of generating the hart bitmap from the
cpumask.

It is not trivial to support sparse hartid for spinwait booting method and
there are no usecases to support sparse hartid for spinwait method as well.
Any platform with sparse hartid will probably require more advanced features
such as cpu hotplug and kexec. Thus, the series supports the sparse hartid via
ordered booting method only. To maintain backward compatibility, spinwait
booting method is currently enabled in defconfig so that M-mode linux will
continue to work. Any platform that requires to sparse hartid must disable the
spinwait method.

This series also fixes the out-of-bounds access error[1] reported by Geert.
The issue can be reproduced with SMP booting with NR_CPUS=4 on platforms with
discontiguous hart numbering (HiFive unleashed/unmatched & polarfire).
Spinwait method should also be disabled for such configuration where NR_CPUS
value is less than maximum hartid in the platform. 

[1] https://lore.kernel.org/lkml/CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com/#t

The series is based on queue branch on kvm-riscv as it has kvm related changes
as well. I have tested it on HiFive Unmatched and Qemu.

Atish Patra (6):
RISC-V: Avoid using per cpu array for ordered booting
RISC-V: Do not print the SBI version during HSM extension boot print
RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method
RISC-V: Move the entire hart selection via lottery to SMP
RISC-V: Move spinwait booting method to its own config
RISC-V: Do not use cpumask data structure for hartid bitmap

arch/riscv/Kconfig                   |  14 ++
arch/riscv/include/asm/cpu_ops.h     |   2 -
arch/riscv/include/asm/cpu_ops_sbi.h |  28 ++++
arch/riscv/include/asm/sbi.h         |  19 +--
arch/riscv/include/asm/smp.h         |   8 --
arch/riscv/kernel/Makefile           |   3 +-
arch/riscv/kernel/cpu_ops.c          |  26 ++--
arch/riscv/kernel/cpu_ops_sbi.c      |  23 +++-
arch/riscv/kernel/cpu_ops_spinwait.c |  27 +++-
arch/riscv/kernel/head.S             |  33 +++--
arch/riscv/kernel/head.h             |   6 +-
arch/riscv/kernel/sbi.c              | 189 +++++++++++++++------------
arch/riscv/kernel/smp.c              |  10 --
arch/riscv/kernel/smpboot.c          |   2 +-
arch/riscv/kvm/mmu.c                 |   4 +-
arch/riscv/kvm/vcpu_sbi_replace.c    |  11 +-
arch/riscv/kvm/vcpu_sbi_v01.c        |  11 +-
arch/riscv/kvm/vmid.c                |   4 +-
arch/riscv/mm/cacheflush.c           |   5 +-
arch/riscv/mm/tlbflush.c             |   9 +-
20 files changed, 252 insertions(+), 182 deletions(-)
create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

--
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
