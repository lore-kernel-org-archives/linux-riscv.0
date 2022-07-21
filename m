Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363CDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o/kb6hXi10KtvhoOX0ZEls/C3dHca0jpTMunOr0TX0s=; b=Hl/+mRq4znLSQs
	GMII5gWN7twdM1d1q3Y06iBB7aXc/TRGs/UKkzIq6OXEA0brwpcE0mEZuSb8bo0lCA5SFmo00Ef/b
	i0fKs8i8YddD6SuQmfujDWAYvw71/pugUED01JWjXkdgko98Kz5BorOixhLErmqnWLm9wDflKERi0
	fhDTrkdSd2n73/Ay+pskHEnV2unIDnrRriH0VhdsZa6lxQhgQWqDWI1IMSg4afl+eBGO9nX1DisdB
	gYfyPHJsUw6N4AMxMh6B0nTcGZVAo+PuSD4BKrja29cqNxOcfKbO4ey0tynDk7kPh5Zs/5xzrbXCV
	oswiJTiC0gpyz2GzTKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf2-00BHnZ-C7; Thu, 21 Jul 2022 18:12:32 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaey-00BHiL-QW
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 18:12:31 +0000
Received: by mail-pf1-x430.google.com with SMTP id b133so2468877pfb.6
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YFNoGkEpqZ0ZZUn8QgTK9f9e2SF2KokqJRLIpbyDvaQ=;
        b=JU3qmK3RlD4+t2a2ZSOXCURgt6cpux/CQIb7FIcuLolQvk7dnHol5Fry4fHI1+giDD
         wVZkCIEK7AIgn7/38SrgEtN2oZsnU3vyFW4DRP0PZYxy8KhWxE3sGuOeqrjA1st4DQnT
         /8FjXj/LP4kqsWxgEYAQuU84OSKy+9i8QQRqap+0NjHqRkTDtBLOhPCcvGK3BKrUL8we
         8sMLWQdap+IgT6f24XjJdio9YuBk7/nm4GYgz9dO61wXDu4oumueqv8s3bDetE0C6lMR
         Xf0FkulJPHdvyi2jdXUcqFZ+vVvD+HjqOng0OgpJVj4qL3yxA2lU6sUKwQ4TnQsUmtj6
         EMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YFNoGkEpqZ0ZZUn8QgTK9f9e2SF2KokqJRLIpbyDvaQ=;
        b=tTIUwhblUUiP0nUCvQPTKrCvLRmDXfjNdYSblCGC/kQCzUF/CLzz0fqVYaboXUY+j1
         vvhc+0GgjG5yB7rGEo7TjskIlQc/u+szczW0pIG1VSGeS3MnmC9G00xi70/FnavYGGq9
         SUTCyFqKRyo9bKIedUfeID5O0Pj7ne0AtMWyIy1+N4erFUv0A5j1tVZX21sUZ5b+5itQ
         YLPM9E97IYVlBAi/naMFqY4osnxgsxyEWSQ4FEYEfAq2VbxuUW51kSw1+aSSPSgkLTv1
         FdupxWXiReUERJTyq7M6qlpoIimUq4Glt1V3nfU/JgOxyV+1ev2kCSOG7pwiSxtvMao0
         5bNg==
X-Gm-Message-State: AJIora9A5TLY1UAyKlknPe+ZF5CfG/JX4Cme8l/lUUCA4PKfVKsb1Kic
	We0KaUyfPHEZJxf5EOwFwTJy9g==
X-Google-Smtp-Source: AGRyM1sweUen+aNGv5VBOyhlZwmXMBcK/5AdbKESfeVg7uhbOBZIOOmnsphwW8Pr3CHtTNuxyptDPQ==
X-Received: by 2002:a05:6a00:450d:b0:52b:84ca:9509 with SMTP id cw13-20020a056a00450d00b0052b84ca9509mr17520079pfb.74.1658427142864;
        Thu, 21 Jul 2022 11:12:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b0016d3a354cffsm617358plm.89.2022.07.21.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 11:12:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v6 0/4] Add Sstc extension support 
Date: Thu, 21 Jul 2022 11:12:08 -0700
Message-Id: <20220721181212.3705138-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_111228_876999_6A683DB2 
X-CRM114-Status: GOOD (  15.25  )
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

This series implements Sstc extension support which was ratified recently.
Before the Sstc extension, an SBI call is necessary to generate timer
interrupts as only M-mode have access to the timecompare registers. Thus,
there is significant latency to generate timer interrupts at kernel.
For virtualized enviornments, its even worse as the KVM handles the SBI call
and uses a software timer to emulate the timecomapre register. 

Sstc extension solves both these problems by defining a stimecmp/vstimecmp
at supervisor (host/guest) level. It allows kernel to program a timer and
recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
intervention.

KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
call instead of updating stimecmp directly. This is required because KVM will
enable sstc extension if the hardware supports it unless the VMM explicitly
disables it for that guest. The hardware is expected to compare the
vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
will lead to spurious timer interrupts. This also helps maintaining the
backward compatibility with older kernels.

Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
without sstc support as STIP bit in mip is read only for hardware with sstc. 

The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
PATCH 4 implements the Sstc extension in KVM.

This series has been tested on Qemu(RV32 & RV64) with additional patches in
Qemu[2]. This series can also be found at [3].

Changes from v5->v6:
1. Moved SSTC extension enum below SVPBMT.

Changes from v4->v5:
1. Added RB tag.
2. Changed the pr-format.
3. Rebased on 5.19-rc7 and kvm-queue.
4. Moved the henvcfg modification from hardware enable to vcpu_load.

Changes from v3->v4:
1. Rebased on 5.18-rc6
2. Unified vstimemp & next_cycles.
3. Addressed comments in PATCH 3 & 4.

Changes from v2->v3:
1. Dropped unrelated KVM fixes from this series.
2. Rebased on 5.18-rc3.

Changes from v1->v2:
1. Separate the static key from kvm usage
2. Makde the sstc specific static key local to the driver/clocksource
3. Moved the vstimecmp update code to the vcpu_timer
4. Used function pointers instead of static key to invoke vstimecmp vs
   hrtimer at the run time. This will help in future for migration of vms
   from/to sstc enabled hardware to non-sstc enabled hardware.
5. Unified the vstimer & timer to 1 timer as only one of them will be used
   at runtime.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/qemu/tree/sstc_v5
[3] https://github.com/atishp04/linux/tree/sstc_v6

Atish Patra (4):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |   5 +
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   7 ++
arch/riscv/include/uapi/asm/kvm.h       |   1 +
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   1 +
arch/riscv/kvm/vcpu.c                   |   8 +-
arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  24 +++-
9 files changed, 184 insertions(+), 8 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
