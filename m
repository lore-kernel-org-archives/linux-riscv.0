Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0777C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HfG2OdYtQgKBw1bdPip70y+YCvzW+u1OsFrF5vXN7f0=; b=dRHWJV0Pb1FmHe
	gk8w79KZlNe1KqzPSU7T6t7ywUHhuPGoc62niJoECduJpFfJH2ootu7ecQzaw4dAYAecb7iA29UAY
	9KVyW1dpv+1DPG2M30gnUjild0jweoZDMIyztminVjwh/pxTD3MTyxYsqu0qzH/3OXrwPnuDFHOda
	Joqllzv1ZGtZ5Yy4KlKB2wUd5FtK6+FvXhWwYamJc+76zJyttWzYbwvMpNzOQmemlUZs0eEfRIbfh
	AtYBRkYMu21aIUinvWawjsitjnXDVHpceJ7MwoGXxuULNXDaf/FivIA/juZ5cPEQkDA6y1Wo7XcdW
	xFsu3nhZ5OHM71asW1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwxK-008gIC-Ux; Fri, 22 Jul 2022 18:00:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvrc-0084um-Cl
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 16:51:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id 70so4944383pfx.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wi3p6cYevYgSzxpRYQW2/GvJN4seuvoUHVHYEM8rd/c=;
        b=Zsl/HCR/HfwmXiX43HZ5K1ARQTPoyE5IMqULQVKIo6SK/77BnXc56/Jwf4h3JM5WT8
         TnpdDx+JdlDtjutzANTIBh8TZ339Ki0MOxYlUXsv0D9GIPmyY02caVS+RNE9mZ80OsDc
         1loE+ynHVL2rTaVr1bhLzHHF2Is4dV2NVBmu2qz36cSiz9SsGUp9Yur12O5CNmfBzkOv
         dS94okAjOgJM5DHNwg7PC6jD0vMWNWO2Xg0LdhcePYVmkNUY7m6wH+g92iq11bvHng8T
         +rsVTJ2WZJuSAARtp2ah0qnYhu4/SKrE/BzJkLm+kh3VTb0Vn+2jAyQxzHlhFTJW8Pc+
         F1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wi3p6cYevYgSzxpRYQW2/GvJN4seuvoUHVHYEM8rd/c=;
        b=iCtYimqbshAu9mOV2p6GwOUR5rxl0MeK+5E/wSGBN/OtTDPEbTRnSHcPffIOnp7y9E
         hemnL6t9Rmmxxm3hUeiuRm8gWrSL7cKuExvohzM0xWQrRLDwKE92SdJSvTDKFbvjRwo2
         Yyh66uJUe45eVEOCIJjk7yJNCljeiUj5K8k0Cqq+LRMtqQNZh+hbFFEf3oE6vmW44cQA
         42CUgBDtLTHtCs/SLs+kuTX9xC4HNgJB0x87h3NkOcoKk3q+lqZvArStshEXibRBx6qV
         TLZ2e1yRkZDijKuakB3RI3wBEuSPoBsLrtuZkCsNoxfaKMCntrSE/IbUmZFAqguorq4L
         7saQ==
X-Gm-Message-State: AJIora+QMUgiVAjMy8qAo7Wa8J2lV9CeAeBrCqba76sA0u7H06SaO30n
	+Feh0jWv4T/OGQ931aOA35GIVA==
X-Google-Smtp-Source: AGRyM1sUmQT9VjeiyZDFrDoJUmFACBX5qw8AGfD99c7VfNcKYYrVTY40lygAzTDsFL+55AErgWeb/A==
X-Received: by 2002:a63:1324:0:b0:419:afb2:af7b with SMTP id i36-20020a631324000000b00419afb2af7bmr542186pgl.367.1658508653963;
        Fri, 22 Jul 2022 09:50:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b0016a3f9e4865sm4028476plg.148.2022.07.22.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 09:50:53 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v7 0/4] Add Sstc extension support 
Date: Fri, 22 Jul 2022 09:50:43 -0700
Message-Id: <20220722165047.519994-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_095056_443396_99339C96 
X-CRM114-Status: GOOD (  15.54  )
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

Changes from v6->v7:
1. Fixed a compilation error reported by 0-day bot.

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
[2] https://github.com/atishp04/qemu/tree/sstc_v6
[3] https://github.com/atishp04/linux/tree/sstc_v7

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
drivers/clocksource/timer-riscv.c       |  25 +++-
9 files changed, 185 insertions(+), 8 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
