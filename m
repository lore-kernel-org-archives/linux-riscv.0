Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF06C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9vKyd3Vo6qSsDsX3bK6wy8bzPOKKNNJQpujpnW+yH9c=; b=bKAXMOGEZfAdcI
	JZzLIrZyyOmbvh6YrAyjT6aqPuWLI/4zsrMRo5TEjm8d5Gbx8wgF4yjg66jwon6DJpPbYUKJiyaqp
	IGbt/TlhRr3rcP08NgDT1SPAaSsbvaZMSMN89LQ63yAQyBpz1jSOgcSmQ/bsxXJL+OnK/hqU4qQIl
	lxES+IKsJ5gcrhx9K0JQzJHL7qIob8r5npjlDuixcRdTWbSBpsG4f76m2pZhTB4iq0UTr7NKL6UJd
	lsqnvs96RtCFE3n9Hxvqe1QqGX/vJtSUAHLHQceoUKSjHo0WayqhbfLXyrTK+NCVVDU5MY9r0XXqf
	K//ZGI7sMQrqVmnb/m1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QVR-00DvlR-RK; Wed, 15 Jun 2022 10:44:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QS9-00Du9B-Lc
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 10:40:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id a10so10858300pju.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AW1W09LSbc0AKeBzhbbJRYawCgr5kPp9j0he58N2L0=;
        b=P1wNqgu+aTWdnGrFY3sOgB9OzXAQGI2zy4bwVExY9eRylwBxDd/kr8+hiqtNXdyvsE
         CL13R/NI5b0vtsBPy49ewUIhf5ahjDEO7xhhnIspj5rIiTqX2cbqw+KjsEV0J/Q1KUEZ
         u2cbeE4nNEHGH/M/MNVLa9rgW+uhr4nu6Qbcbp6metOVqSW/08QOAwH0iS3S9CBbgI0O
         ARWCiJDCmvnijdD35ok5B9pZtUHo+D0ak703gpJdniBDaJt03yHgQasxgQfhl97y6ELY
         PXVQIlTbrxin/EwJk7po/Gpya3kFE51rZO5rvAusdqQgQ9ciGh+rYsNYxc72w9yWV8le
         L+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AW1W09LSbc0AKeBzhbbJRYawCgr5kPp9j0he58N2L0=;
        b=HN2rHVFl+TW2QOkIkKRLoO8SQsyLJ/Fl0xUZh88lNrg4TW7Px7t7gT9vMHta7NUFka
         TdPP5NNR7HrnrR1Q/NnQiAzkAdP2m/oJLQyjQdscrZs281qDlE8Cvgm7z1s4/pCosvR9
         MC56tlA57p66zVCpsfhapRqUYtQ4tnMK+OOP7XhCo3JXGcNI5ih5QD0x/Lk08PJ5Y547
         VqXg5g41WekxQYY1qVRa8GAtd58GqqCyAWg/jq3ksu5zLYZ7OeSNGEQ2ZAFm8/srfxXV
         z/+tCY7DG1729emaDxC5VF5/nE4aB++5LIireo/anEnQKAKQrxO3BoXm29I13+b7RAqS
         aorg==
X-Gm-Message-State: AJIora/BgKK5+TjZB21fmfmbLIbQBNRP3TKLuSzlAyldi1Qar/x2yfGX
	p/C26piaJaQ3g1Vq1ueqi3tvkQ==
X-Google-Smtp-Source: AGRyM1vyMoS8OEQqhgBrKgCKa5j36/nBcdYxDHmc5RV/6JecYTKtu4JVmOBla7MYDyJ0GnJ4MMdZHw==
X-Received: by 2002:a17:902:c40d:b0:164:1a71:f7c0 with SMTP id k13-20020a170902c40d00b001641a71f7c0mr8626759plk.90.1655289646565;
        Wed, 15 Jun 2022 03:40:46 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.104.191])
        by smtp.gmail.com with ESMTPSA id i19-20020a056a00225300b00522c365225csm1427273pfu.3.2022.06.15.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 03:40:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/3] Improve instruction and CSR emulation in KVM RISC-V
Date: Wed, 15 Jun 2022 16:10:22 +0530
Message-Id: <20220615104025.941382-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_034049_765022_F620C1F3 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

Currently, the instruction emulation for MMIO traps and Virtual instruction
traps co-exist with general VCPU exit handling. The instruction and CSR
emulation will grow with upcoming SBI PMU, AIA, and Nested virtualization
in KVM RISC-V. In addition, we also need a mechanism to allow user-space
emulate certain CSRs under certain situation (example, host has AIA support
but user-space does not wants to use in-kernel AIA IMSIC and APLIC support).

This series improves instruction and CSR emulation in KVM RISC-V to make
it extensible based on above.

These patches can also be found in riscv_kvm_csr_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Added a switch-case in PATCH3 to process MMIO, CSR, and SBI returned
   from user-space
 - Removed hard-coding in PATCH3 for determining type of CSR instruction

Anup Patel (3):
  RISC-V: KVM: Factor-out instruction emulation into separate sources
  RISC-V: KVM: Add extensible system instruction emulation framework
  RISC-V: KVM: Add extensible CSR emulation framework

 arch/riscv/include/asm/kvm_host.h           |  16 +-
 arch/riscv/include/asm/kvm_vcpu_insn.h      |  48 ++
 arch/riscv/kvm/Makefile                     |   1 +
 arch/riscv/kvm/vcpu.c                       |  34 +-
 arch/riscv/kvm/vcpu_exit.c                  | 490 +----------------
 arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} | 563 +++++++++++---------
 include/uapi/linux/kvm.h                    |   8 +
 7 files changed, 392 insertions(+), 768 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
 copy arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} (63%)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
