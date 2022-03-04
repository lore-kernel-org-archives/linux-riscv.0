Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE46C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HrDuRzPiYUOjVVSWKMpjFZ0Pj/Dwl5INwWLCLJ1ZRM=; b=c8lJT/fl4GmRXl
	Eao3Xw5fSXXHwLeRXtLyC54nN2DLsszVWXqGODsUT4D6VPk7Xav7xYdR2cUsoJ+wLUJV+f/SJcHK1
	9hpV/9G74C3oUtmHJJLldc2dP3pPs0An5C4EWX2VlaJScj1z0oIqk94xecWbT821P+3qY13OQPUOo
	L2ThyvOYoQDuvZ3YgactOeB697jIZBnUb26wSq9Z5tAKApiAcuIgA5W2/nZmKdn97hD2jOo88p+6/
	OciONCMgaxEFhETU2T6OSSiYek2uqaAYIl5VKwUSVTkMlR1m3J9t1IZC6cWw/aAi4sZju730aaRoM
	TuNVJODQSnTqmyWMECng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGB-00Bt8o-M5; Fri, 04 Mar 2022 20:10:43 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEG7-00Bt6h-FD
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:41 +0000
Received: by mail-qt1-x831.google.com with SMTP id e2so8345972qte.12
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3hwhrGILXdhz/XeWc3KW5uuxAFbMTxchWciY7LftwM=;
 b=gWSOzgXN0en0k+yoq+gp40hIQ0jSbo3zMvH3uDi3oO6KZwtgAzpOILlFXgVqme9ZQe
 QL3YG2VE/6OjVosmCdiTn+JwxyrijZr0T7iam6gOGSXhvyljatoF9/m4/mCf0/oW5EY8
 BgDtLZTQYDyLXoBJzGDoEBc47P5Qytf0LNtobMd+TVur6an2OoC899T5IGQYae6dupq5
 hlGs3iz76pUFYOrI5x2MLuKu1g7fe1bc7sZrJckIiAV4QeBEYYhiMirYgU00wffDYnKV
 0UbdZaOomJYY6WQ7i7RdG6OraQxQ8soBBvKsgseUzObhZdsLPcG0e6DWNPh2AAxdB6qm
 VsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3hwhrGILXdhz/XeWc3KW5uuxAFbMTxchWciY7LftwM=;
 b=VCqww7IkqB9sDok9KT4aYmsEjHAaDb74X+NZHv1Y408IGCN0MFsuf0BcxAwMd9d2Ae
 XxZ2qox5tOQloNGswKc1vVKfurXdvQGsWkzQtqvzjvDN8+H3Q3jobiNH7x4wGyuWr+tC
 F8DVKgMWCKRBUs2+m/DjbamJaDgg29zOwGQtD+Lx1j1rGacg8/M2NIxgjvZOaPzN+vEY
 RludduJN4B3lxO478QhBV415stSzyXNCyxtcHlqfkgrVv7YgDOI2RwIMcNLAx1dZDaeq
 0huTHHANzW4RjkiBZdwBlKqpbbTpK40H8DKp3QFOJqV4b/VMVQg/P3HxwcRqLbGvDn2Y
 7chg==
X-Gm-Message-State: AOAM531fdHhIQs4SKOKmLas07YjU2Ppam1GQ+2jSdkuuCslAKeOkAgrX
 ptXaopWCajFIMFq6CR6sce4e2w==
X-Google-Smtp-Source: ABdhPJy7TOhFoNFD4vGDLADKFrKXnucp+teoiBHQIPQ3w172uA42MtTQNHkgRMmFcWN/TpxO2Qz/Qg==
X-Received: by 2002:a05:622a:548:b0:2e0:4a6f:7c7e with SMTP id
 m8-20020a05622a054800b002e04a6f7c7emr375590qtx.303.1646424637904; 
 Fri, 04 Mar 2022 12:10:37 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 0/7] Add Sstc extension support 
Date: Fri,  4 Mar 2022 12:10:13 -0800
Message-Id: <20220304201020.810380-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121039_608918_9C1D42B2 
X-CRM114-Status: GOOD (  13.82  )
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
PATCH 4 & 5 adds the infrastructure for KVM to use sstc while PATCH 6 actually
uses the Sstc extension if available. 

This series has been tested on Qemu(RV32 & RV64) with additional patches in
OpenSBI[2] and Qemu[3]. This series can also be found at [4].

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
[2] https://github.com/atishp04/opensbi/tree/sstc_v1
[3] https://github.com/atishp04/qemu/tree/sstc_v1
[3] https://github.com/atishp04/linux/tree/sstc_v2

Atish Patra (7):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
RISC-V: KVM: Restrict the extensions that can be disabled
RISC-V: KVM: Introduce ISA extension register
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |  11 ++
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_host.h       |   1 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
arch/riscv/include/uapi/asm/kvm.h       |  21 ++++
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   4 +-
arch/riscv/kvm/main.c                   |  12 ++-
arch/riscv/kvm/vcpu.c                   | 128 ++++++++++++++++++++--
arch/riscv/kvm/vcpu_timer.c             | 138 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  21 +++-
11 files changed, 328 insertions(+), 18 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
