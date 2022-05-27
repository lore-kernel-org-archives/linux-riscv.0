Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D92CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crK5Ktcw06WaufyrCs6edcKwYB30VBZDLlWZne8aPMk=; b=mEf6S6NnEJh4T/
	LoodC93ggQ9qA6HYa88suE2iWxpnK0HOQ8Uju+89yWEZ7yHjhysdAFAv7AJu/UxY72+fvaGPBNgUs
	CqnhG/7YewB7Ub46ciYPhHDjXXYZaOs5CsdM5NM8rNRwTS+QgZOApLdIK+A70Y+VZw2BmDrRYrScH
	qmOCNsGzF8/VXZ+RhcxepVCQJmdpZIpsueO+76yVNI4SG+0Lz/oouwO/azuhHw3YWwCkXEHV2mkR0
	GIfZ1kp9kEg+dYxuw4tvGquoFo0F19wCqAg63tp+fPxvUy/QXPc7nwv0Q2nn4DXgyN3hR8RuXnBIW
	Y6OM1abeLLPCMpCmrqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbp-00GZyz-Cd; Fri, 27 May 2022 04:29:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbk-00GZwu-0Y
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 04:29:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id j6so3353151pfe.13
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 21:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxyOYIUtWsKWwOM7sIj1O327JELUP9E08IQ32gOiwio=;
        b=xFRZVGwwriXl8/nPznIDsTMM5kipdKDj1JQbcaURQIH9eRjN9P8KlFbr1joz/HFqwn
         /BWnk1sh3nYj9WJkWrXwTAzmCT3pD44rNn53vOOKYk58hItdQwml/tGiy5rUICVQcb3d
         fb+my9arL+X/kgG/2WlVIVG2tl6sZGw1azwlV6QkU6rlbMy4xGpGCJUUlD+kHkb3U2u0
         G2WwFOhvlu4Jt7ocs2BQI3B2BkjRKwKY1C90CaviptMWpmSYW/N87QA6QiNTYhmRNhGi
         jqzs4byOF6Bm8Jr9cqkZieXPQJ3VMBylDqXGOCdAkd0RVPhdfTOJ4fGLsCV6HCFGVMiS
         90TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxyOYIUtWsKWwOM7sIj1O327JELUP9E08IQ32gOiwio=;
        b=PMHUPlBviJcqO8+jT8+A5J8aW0XydXbPJ6pN48JDOkFmQB+hgfiNYGfjfDBNe0AjcN
         WJOoHqpYOef4Gs6iYyF+WdGw3fWHk2uQxyFjvfpSLE+SJdTzE8JvsbK9s7jkG5/0ps0r
         XBj5au+xBNpE5JbzzcAYmf8q1G1Dzjp5bG43GO+Uk0ItNfOVozQXXPrY65WZJufbkr3M
         Q3TAnIIHn0k/z9ntr0awviUhncP8Dx/0hBg0wLXevnEHAnKqXCJZ7jg9eXlKuWnPQxra
         Plgmd2khtTA9gLhR7li00QspH/Jk44D/66iF8Xft+Rd5naRjx3rwFiWQ9Sd3vluD105E
         Oqww==
X-Gm-Message-State: AOAM53041O5Ld0ZMabvg70OGYKaJ4PiHn9aimr1f1ENt0I4SK00vYWh7
	LZoBcnd2jHugrElFqdNjieP4nQ==
X-Google-Smtp-Source: ABdhPJzGT2jToXkh7UQIbyzaAakeoBkWusV6gSTx0SdU1ohBIMPVXGfH3n2hPirSRiKCAenoMKDW2Q==
X-Received: by 2002:a65:4149:0:b0:3fb:1476:d0dc with SMTP id x9-20020a654149000000b003fb1476d0dcmr5500060pgp.373.1653625789745;
        Thu, 26 May 2022 21:29:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y63-20020a638a42000000b003fadfd7be5asm2352307pgd.18.2022.05.26.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:29:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/4] Add Sstc extension support 
Date: Thu, 26 May 2022 21:29:33 -0700
Message-Id: <20220527042937.1124009-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_212952_321314_84CF9131 
X-CRM114-Status: GOOD (  14.06  )
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
[2] https://github.com/atishp04/qemu/tree/sstc_v3
[3] https://github.com/atishp04/linux/tree/sstc_v4

Atish Patra (4):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |  11 ++
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
arch/riscv/include/uapi/asm/kvm.h       |   1 +
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   1 +
arch/riscv/kvm/main.c                   |  12 +-
arch/riscv/kvm/vcpu.c                   |   5 +-
arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  24 +++-
10 files changed, 198 insertions(+), 10 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
