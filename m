Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A21C27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sg+Pyvcc3El8PblUK2GfjvB8Jjh/JyiB1ZFF+5V2jDY=; b=oWkZoQHyucOWqL
	f/eP5GRtZJVQiRN6FcdzMJ0RWqQxetrm49h9PEQ8fI4CFeqRhL2HtB5gK5ttgUd5e/UGnTXr8MZbR
	XQwN9j+Lj1oak5pBP0YlY7JqrvCDDqPPhJ61Z5pK0el2VFQVhUKwT6DKdkLG1uZLydQNbjClDxxbw
	OcPa8jyFa6/hFt9yE6z5dm475YymWoysQwKGpEHKurof18aFyIhLihxfVVbEDEQqeETlbp2r9fpPf
	ismUHIc0gp4ELiN9hhFiGpQhiEK2E9rb2V8LuYkLzp8I9BMmel7vKMA89wGjyzBUv7JaXyPy41WK+
	09NgFigkGKJYapCfSD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfct-00HLUC-5a; Sat, 28 Jan 2023 07:27:51 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfcq-00HLTQ-Ks
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 07:27:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id o13so6707074pjg.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIp0ncMCm62OCfgMvP1/ZtcZEYlq9GSVvwzMRdDzsxc=;
        b=WwmJCQbfdSpysGWAhddrN6xzvrr5sfTaMCaViq0MVeVN65lEA/K0kIbWOiJ5mx00sf
         9sqz+ULl8iPa0yd67yMO+U2/mew/CeqDuS3f7o4cI2sBgRqx+OT9UxOQn/+M3B015gf9
         ZvGN2si8+FKg6JafIeg2mvKJ+8gLA/w4AD8qRBvruTPhZMTyfioTqC7XOwLb87Kqcaas
         edsL7+csyJAySV4Q8Z5WH5LtnL5jkYOvSMNGQsxJfwAcvtjdNwsuGXO7Rqa4or19sFAM
         NmQv7Zt2Z0yBUQ+ce6VtIY49NShocrenZCvCsryo8pynAFdbm7m9YMDKewvXewYPQ2uU
         ik4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIp0ncMCm62OCfgMvP1/ZtcZEYlq9GSVvwzMRdDzsxc=;
        b=wNrGz785jrTRU0gDeuc5pkA+BmlFJ9zBsDKYkw9GUORt53amdYSDsDujY7wzQPEimS
         KC/GWbaJaoT+n+QB4hFrZE1np87KyL+z2mfTNJjKWWmo/PCPoi9Bfk8TkAwcFL1Kv2hs
         HD1KMNkSCziBtTk0+x8Sv7U4Kur2PYynx0XUuudtlj15HJontqbi1h10C85VbP20/EiV
         7BV1RSKKc6XfK6RMgJfcVP/YjJUnodj1C1ggz4WKJ9q7ERgB+KfPzLDSo69lpDKYGRA9
         SnE5mOd8Owe2PD6pETPUm0ZgCT12ZBS2IRI3lGXUGxwA++mEOKRz71STwNeP846/axTJ
         n/Fg==
X-Gm-Message-State: AO0yUKX78+j01SVg0HIPNo8DfDMxh7+hrc7QeF8GOyAVazXDe4MMPjve
	L1kAarHACgw3eAZagW3t37DMKA==
X-Google-Smtp-Source: AK7set/JZk8OaVhYXMDTxZz7NE3fu1CtJ7X9nXADGQO9RjFWpzFvGeSfgyEKTn7iJvyPiZNUK7Pzxw==
X-Received: by 2002:a17:903:230b:b0:196:13cd:a49 with SMTP id d11-20020a170903230b00b0019613cd0a49mr19370623plh.27.1674890866753;
        Fri, 27 Jan 2023 23:27:46 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b00194ac38bc86sm753132plb.131.2023.01.27.23.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 23:27:46 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/7] RISC-V KVM virtualize AIA CSRs
Date: Sat, 28 Jan 2023 12:57:30 +0530
Message-Id: <20230128072737.2995881-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_232748_714091_CC2E85CE 
X-CRM114-Status: GOOD (  10.43  )
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

The RISC-V AIA specification is now frozen as-per the RISC-V international
process. The latest frozen specifcation can be found at:
https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf

This series implements first phase of AIA virtualization which targets
virtualizing AIA CSRs. This also provides a foundation for the second
phase of AIA virtualization which will target in-kernel AIA irqchip
(including both IMSIC and APLIC).

The first two patches are shared with the "Linux RISC-V AIA Support"
series which adds AIA driver support.

To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
series and use KVMTOOL from the riscv_aia_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_aia_csr_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Addressed from Drew and Conor in PATCH1
 - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
 - Use GENMASK() in PATCH3

Anup Patel (7):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
  RISC-V: KVM: Initial skeletal support for AIA
  RISC-V: KVM: Add ONE_REG interface for AIA CSRs
  RISC-V: KVM: Virtualize per-HART AIA CSRs
  RISC-V: KVM: Implement guest external interrupt line management

 arch/riscv/include/asm/csr.h      | 107 ++++-
 arch/riscv/include/asm/hwcap.h    |   8 +
 arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
 arch/riscv/include/asm/kvm_host.h |  14 +-
 arch/riscv/include/uapi/asm/kvm.h |  22 +-
 arch/riscv/kernel/cpu.c           |   2 +
 arch/riscv/kernel/cpufeature.c    |   2 +
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/aia.c              | 624 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c             |  14 +
 arch/riscv/kvm/mmu.c              |   3 +-
 arch/riscv/kvm/vcpu.c             | 185 +++++++--
 arch/riscv/kvm/vcpu_insn.c        |   4 +-
 arch/riscv/kvm/vm.c               |   4 +
 arch/riscv/kvm/vmid.c             |   4 +-
 15 files changed, 1075 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
