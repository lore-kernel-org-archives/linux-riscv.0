Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E2D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XDECz4jd1MxEEIZr/zuXx2gExuSXv6pf8Xz/eYr1foc=; b=lmfDh+ngJMkWrs
	1pbg4qkCpvOBkDvRxNgLtakexpws37e6XJznCicceeve4KeA60tc7DzZuHsZd04cqoERW7JJoLHOZ
	SaHGOn9AYCnx56BQpgt8pwJZifZWbKmiR5Jp1PvvWK/nmKwmkNKQYYYGUnNqSx1gm3A/HX6hyIJFQ
	J75hcNo4a8wl5As3WAd3UyhcY0rdBegMnd8+mtaqWRNtEpfutruIT1B0XIOIuvOuA/0X+fPoePzVs
	Dn044p0PmVP0It8WEJDirU1lBuSWzmQgPyw4RgDUK0Kgl30h9cGPbpMiWOzOnnHHaWFHDpVADcXc+
	IvBFx1Ldq5XZcD74t5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu0-00000005MeB-3nhm;
	Sun, 20 Oct 2024 19:47:48 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2btx-00000005Md4-2lhj
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:47 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2524922a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453664; x=1730058464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ivURfBSvioRGHQ9UQ83vIOIrYF8b7wh/zY/rzLMXhM=;
        b=SEI7UG9u6iL0L7K2kRhx4jzjo23kCYAb7XRFCTQUP7YEZt7y2ztvDN6LbL5GfsSkTn
         mbNGlNnDcWwQqXPvr4uzsI5zXy+hvbERerrmy6c3LVfqv7148Nb/m4/o13kStti3JczU
         80TbpxkTQkdnolLr9G1nEs5Y7NXaIwHc/1EIEMMLDJ73UGd1eeIJup9mmFo39BstgBUi
         GQq82WY9RJbuz2A0lFnd2pMRo27CUdUW04jsQhgm89uvQ24681/S8eB3avTM8szfeN/q
         HRJPI8V5erSH9ey72UcHN9S3H3aArE5jchk/vojO+yJL1wJWsiqAIG/dyQ0rkdPcDCpf
         QemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453664; x=1730058464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ivURfBSvioRGHQ9UQ83vIOIrYF8b7wh/zY/rzLMXhM=;
        b=ec6NX/+L9jeZONS8QSZ5CD+QgwrLEKzxhrBdYEkJnikHgmDYbTfTg3CW9eXSfHZ7v0
         34stApMSoMX0mRLnkIvKZ0dDdoSOL/S16zainFdGItwO8Q+SQPCTp7JMLtLvJ8AfLk36
         lzdCoPJCaMipoWx5xGQu9yS8LRTs9KM4ARxJxwVAoGyt+zne3yKpuN+lkZjvmmc4GQLH
         Y1PiIdvtPJWSb/3XUYoy18SNXTC3KBfQqH4ozut6Zj5RHe5mjRq7nzDbICbUBa2y9mJF
         ZE1tPy5D78IykXSwVh8huL57HwhHhVEYI21T1QJamqpBciRQbndR6BJx5lwsY4rSoyeU
         xRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC+lKKU7K5ILSM4MwmwxvPsb7a6pWdXuml6WmPYSHIknnwLDGnSJ8Wg//1u2oYc8JprhDnkEIOqqMWLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWinjWuwzcxUpwuaL53A4ATo9W5RrJS+41U9TtThuLzyA5q8G6
	d8/geTmbQswM66ZFkxdzcJ1EX+NiIyr8Y2ExYHskm/ZiRN0TUNJArciPFi6et9o=
X-Google-Smtp-Source: AGHT+IHG9XXvm9AJ2oRMr/j3vJjm8TDJeXCKSU0fNmuN70GfoPp1Bf8M19KyxCwvXuMkl6hkr0LMHg==
X-Received: by 2002:a17:90b:4c8b:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2e5617331b4mr9148581a91.40.1729453664025;
        Sun, 20 Oct 2024 12:47:44 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 00/13] Accelerate KVM RISC-V when running as a guest
Date: Mon, 21 Oct 2024 01:17:21 +0530
Message-ID: <20241020194734.58686-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124745_725716_6850891D 
X-CRM114-Status: GOOD (  11.47  )
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

The KVM RISC-V hypervisor might be running as a guest under some other
host hypervisor in which case the complete H-extension functionality will
be trap-n-emulated by the host hypervisor. In this case, the KVM RISC-V
performance can be accelerated using the SBI nested acceleration (NACL)
extension if the host hypervisor provides it.

These series extends KVM RISC-V to use SBI NACL extension whenever
underlying SBI implementation (aka host hypervisor) provides it.

These patches can also be found in the riscv_sbi_nested_v2 branch at:
https://github.com/avpatel/linux.git

To test these patches, run KVM RISC-V as Guest under latest Xvisor
found at: https://github.com/xvisor/xvisor.git

For the steps to test on Xvisor, refer the Xvisor documentation
<xvisor_source>/docs/riscv/riscv64-qemu.txt with two small changes:

1) In step#11, make sure compressed kvm.ko, guest kernel image, and
   kvmtool are present in the rootfs.img
2) In step#14, make sure AIA is available to Xvisor by using
   "virt,aia=aplic-imsic" as the QEMU machine name.

Changes since v1:
 - Dropped nacl_shmem_fast() macro from PATCH8
 - Added comments in PATCH8 about which back-to-back ncsr_xyz()
   macros are sub-optimal
 - Moved nacl_scratch_xyz() macros to PATCH8

Anup Patel (13):
  RISC-V: KVM: Order the object files alphabetically
  RISC-V: KVM: Save/restore HSTATUS in C source
  RISC-V: KVM: Save/restore SCOUNTEREN in C source
  RISC-V: KVM: Break down the __kvm_riscv_switch_to() into macros
  RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
  RISC-V: KVM: Don't setup SGEI for zero guest external interrupts
  RISC-V: Add defines for the SBI nested acceleration extension
  RISC-V: KVM: Add common nested acceleration support
  RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
  RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
  RISC-V: KVM: Use SBI sync SRET call when available
  RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
  RISC-V: KVM: Use NACL HFENCEs for KVM request based HFENCEs

 arch/riscv/include/asm/kvm_nacl.h | 245 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/sbi.h      | 120 +++++++++++++++
 arch/riscv/kvm/Makefile           |  27 ++--
 arch/riscv/kvm/aia.c              | 114 +++++++++-----
 arch/riscv/kvm/main.c             |  51 ++++++-
 arch/riscv/kvm/mmu.c              |   4 +-
 arch/riscv/kvm/nacl.c             | 152 ++++++++++++++++++
 arch/riscv/kvm/tlb.c              |  57 ++++---
 arch/riscv/kvm/vcpu.c             | 184 ++++++++++++++++------
 arch/riscv/kvm/vcpu_switch.S      | 137 +++++++++++------
 arch/riscv/kvm/vcpu_timer.c       |  28 ++--
 11 files changed, 941 insertions(+), 178 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_nacl.h
 create mode 100644 arch/riscv/kvm/nacl.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
