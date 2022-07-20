Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00765C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VucrDccb/HX1JO0fUECpr8XS5ToKESLCQPJBWMwE9h0=; b=eIl51fFt3JZTht
	uaH20xCQeSBiGyjB5D/Kp4I3LID/KmAwxvRckr0iIf9bsGpEJOJPWI6o8HMyKQTCrotTQNeiUxJq1
	FmN7E5yIz2QhQqDwcdmE5ZFEmMZcRPV7p3LeJoOub0OdNLgEDOsfU6KVqNbInDhUOJ5lHD8ajiYGW
	oeV0cbkkjYcJMbOgKgI1nfmSQ2PP7meWEgqyKB4NrkAFZ1kIq7nMXE4HYjSyQLPI5xVRursxUVcZ8
	xm8HAUMi0TGaMZKrYRBl22WhagXv2cntQWJ7qfA7SfQZyy3vulsn34bM28cvXXrQv0BWUhPNaHJ+X
	3tXcKl4YDKxg8inuIYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIc-009oK3-81; Wed, 20 Jul 2022 19:23:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIY-009oDd-Rz
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 19:23:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d10so17318846pfd.9
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYEr3CWt7D7LyMtY/KQgoEUMdbBRKLvSXoaIBCH+uKw=;
        b=cLeXtxL8A5i621Cmtp30NZvRnlsHMqasoKAmiUkbkF7I0nbcvXY6dMOsi5Y4pV0Gq7
         1juMoXyZpG0y0mr0OhpOxILnIN1rzdAUY1MyhEZnvwUCCakmVX/71WAxPnYWdAuS6lPU
         F/UORxjj8kDmIcUxUd8U4DkDKDQ088ny+3HqPkhHuAbS4zdTDhd0evOV6HoWXwOzrHet
         XPOmiopRaQ060l0zDHisuHeO3XlR+Tu5iKZp6sqvD5fUn4y55jMOGAs3fwyPIGkgSw8L
         cXdUH+6IbINv3hwQWjKyB9GYr6xcoYAPy6Q6ZbdTGBiRpoUgDHEJAongyM74ELEKOaBN
         jqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYEr3CWt7D7LyMtY/KQgoEUMdbBRKLvSXoaIBCH+uKw=;
        b=3ROHSQD9GQlHt05Peu+X76um6z5aw6gU8qDSv8/ZxcQ9NTtsE9F5gp6JwnZCHZIHNh
         Lx0vA4d5bLXwyQDaQgnPpkPD6/yn2QxEXrWNb0vOPZcUuw7VC66LMvi22pR58UklT57v
         g0C29y1PRMhbB/3i6lTUiWyU7cMhw22SxrmiKZVj8XUQxuZCn8xEuFckVWGeD9iLhC22
         qrQM7cCjaqY4wkRvsS8AFOvfLCcZzb15o/62Afxk8ZA8ZXO5sQfoSFhvYOPj4rTOF7Tn
         QZljdsRj60ir3mtWpYGZhDHG812A+6FPdwbnZNd1mhchOXIv9yNavtI7JfuEZCIkS8Uw
         wSZw==
X-Gm-Message-State: AJIora+ZGYUOvs6dNETv8XuIX5dZHP4SEbL2bQyhKaROo+K5/sP3wYQB
	+ytk1xS80puC5wB05A0uPqtQ5w==
X-Google-Smtp-Source: AGRyM1s3OS9Pbf3tyCbJjBgXJVlqnxlUxUxjW0UMafJ5PdPCVGnrourOUYb1hAv4WKDpNnGR7GKvZg==
X-Received: by 2002:a05:6a00:22d5:b0:52b:af2:9056 with SMTP id f21-20020a056a0022d500b0052b0af29056mr39885946pfj.80.1658345031222;
        Wed, 20 Jul 2022 12:23:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b0016d2e772550sm219902pli.175.2022.07.20.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:23:50 -0700 (PDT)
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
	Liu Shaohua <liush@allwinnertech.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v5 0/4] Add Sstc extension support 
Date: Wed, 20 Jul 2022 12:23:38 -0700
Message-Id: <20220720192342.3428144-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_122355_129515_A5B875F7 
X-CRM114-Status: GOOD (  14.79  )
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
[2] https://github.com/atishp04/qemu/tree/sstc_v4
[3] https://github.com/atishp04/linux/tree/sstc_v5

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
arch/riscv/kvm/vcpu.c                   |   7 +-
arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  24 +++-
9 files changed, 183 insertions(+), 8 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
