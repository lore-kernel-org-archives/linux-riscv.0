Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA1C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WR25Zfw4qztyBMtlvH719qRxZoyDAiIWinnDJsaJxEI=; b=fGhB7s6y1Gse42
	3sWB1g3/etVtja2MLdqzsYJSv4DdyRKmYacTfSIb/qfh/jQLO9r8POi8CGmJZtkWAGTkANuJk/Sx9
	KpGlIPlMHzHY1oRbTvOrN98iFLr5HkyQ/FyNn8SUpc/gb19gfcSTqE/9QcMSrbW5+t2/AmsSrL7Rh
	2KPF2UqmF82AS3jZu0ZObYAgMfZhRovd/q4nUiHof5UrGMpRhrAFQ3xgRsQjLgsSyjrKNzCTtQm8W
	ku8zhBsbzfgKFuYH8DEDzj3jY8mPG5hy8/yJLc+DRSDqaBCKwz89dlc7wmxG4xVa3b2yguHao7xUh
	qsdiFHHrlyaAsn/qm7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQJO-00FrE9-Es; Tue, 26 Apr 2022 18:53:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQJA-00Fr6g-Ne
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 18:53:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id y14so18009438pfe.10
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UMn8myMUy/xks0zAUGTj68bP5leid2WlXPOOX8hNXzU=;
 b=Lq1qfYNvDVIKXnBpxw3hPz6Le2o1L8AkMCTY3ptzmLaYBXEyJzoZO60lICnlYTt9AO
 7DGW53e/1q/T7aOyQLigQK1PHgXVaRAEya+6Sj35Zga+9wejIYH0cWFuDbxrRtg7ZF4p
 xq4yjoPbFEwuBY0FD9dT/bjRt0pNhHqnsKG9shFQjKBMLrSctNPd5JVIQ/WarldNNLaG
 ffyOyySPU02nnWckpcl9Au3a+f1eZe5uo/1dBxOjNQmXXcr5IFb3yzUPqv+G8N8gYixb
 te0ntmjGPh5Yzp0DPeIX0Ji/fST5980Y1uPm7l0rKkkdg3uJ1q0jZGczAdkUSt3/tBKd
 k1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UMn8myMUy/xks0zAUGTj68bP5leid2WlXPOOX8hNXzU=;
 b=BCVNccxuZZceGevT14OcGRqjD7Uay4Ab0JnP9WBVkZ0/oBujbFypa6511ac8VQBRxD
 c8aWVirWPZbzxagpGGbOsBVUpHxlNSImfMnPsR+pl6Sa39sqss7f5SzYIY4GiA93uEnw
 4sT6NFeETP2nmlZFHvLE70kCzlDKL2EChfYQRWSNpmlFVahgrP56rBWHk5Z3uURZNJm3
 QlCg+wN1z4x2lSZWAXBVwg2d4bYUyhVl3DEUZCwKgll5k0iqD2EPbRw7bm/MvzrJxdBb
 eLh6SWGrfeZdP8W8eWLGeW/juOI9i7z+e6BAOWtYrb3mQ/yehHB88c9yxE/v+qa+2DyT
 CP1g==
X-Gm-Message-State: AOAM531TIxP9NOmiX1P3+R12AdhZ0frvnaHJDuxNufqoE4HrzPplb7rG
 SdA3Mr3Kgro0ozefgnCQg9rbkg==
X-Google-Smtp-Source: ABdhPJwNDSCDMjlhPP/yeNIfJjRkz3mOWh6WcKKp1EIcuCmVJORf+JecC065cep/KXKikC3d6gUqTA==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id
 j2-20020aa783c2000000b00505723f6acemr26200192pfn.86.1650999186971; 
 Tue, 26 Apr 2022 11:53:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 cl18-20020a17090af69200b001cd4989ff5asm3839664pjb.33.2022.04.26.11.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:53:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] Add Sstc extension support 
Date: Tue, 26 Apr 2022 11:52:41 -0700
Message-Id: <20220426185245.281182-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_115308_839495_36E2ADDD 
X-CRM114-Status: GOOD (  14.18  )
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

To maintain backward compatibility, KVM directly updates the vstimecmp
if older kernel without sstc support is running in guest. Similary, the
M-mode firmware(OpenSBI) uses stimecmp for older kernel without sstc support. 

The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
PATCH 4 implements the Sstc extension in KVM.

This series has been tested on Qemu(RV32 & RV64) with additional patches in
OpenSBI[2] and Qemu[3]. This series can also be found at [4].

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
[2] https://github.com/atishp04/opensbi/tree/sstc_v2
[3] https://github.com/atishp04/qemu/tree/sstc_v2
[3] https://github.com/atishp04/linux/tree/sstc_v3

Atish Patra (4):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |  11 ++
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_host.h       |   1 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
arch/riscv/include/uapi/asm/kvm.h       |   1 +
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   1 +
arch/riscv/kvm/main.c                   |  12 ++-
arch/riscv/kvm/vcpu.c                   |   5 +-
arch/riscv/kvm/vcpu_timer.c             | 138 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  21 +++-
11 files changed, 193 insertions(+), 7 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
