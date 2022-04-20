Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2364C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qktH1GWqMvTMyE9rAgYRAg1iCZMcSkr9eLhutvNFvlQ=; b=H2TbWjd68biLVO
	jXUwghft1DrbOzTXLIMU+uKRU3b1fSCugzyeDga1UQQmiunj304GSQvXmqLQ9DkWGid1V/nKCl4Kq
	W8NOSuvxBeuHToyB0LLGdSAEDEZOI2i3g4no70U5D9WMfS0LunO1tJ6QRPq2d/eFBLarsIiqrZHKP
	JZG+l5GpxTtgk+SLLrGfbh7U+Eg2uhBG5Ln7TYBEok79ciDHa9jU6OAo9tofRytQ00F1ZVzgEC+Uv
	XFJuF7q0ec3+O1hHK9loqyK8plGsVAmT/AvcsC05zw86vzxl0m2TVqI9MlQsJMiwhPmXi/E9g6MAz
	tbUp7LjAQRCmkQquEsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8SH-008kYM-VR; Wed, 20 Apr 2022 11:25:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8SF-008kXQ-Ai
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:25:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id g9so1325088pgc.10
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCU3W9mlxHE4TMqBdkjcyOh2bqsvTjlfmzIF3NGnHvE=;
 b=UfaKu9dbb+wXEjWlLaL6U689AztbKkrzep/TzrQwLKereP5jlihhLW83hYi6pshpQT
 RC4D0gb86EnOjGNFqbJ+nXqRqcan40eCGd5YJ1poRTncgAmmYSx5Uec1das06uEnA80/
 kg5zlVNVqWob2/JwFwTcPHKCf50sEyeSvjMGdtnkAfHSNPolkhmSNWqnGq/4CTjBEGYk
 wYf0srChQ0tX9SB7KjZfNPT+06g3JGsqneDoziL+ZZep2OkoZ/s3RP6yxJrL3M4HsubV
 /GT1J/EpY3X6v59ZDCMStoygEgUkaFACI9IDAbD/eRKH1tvUvLRvXeYwkcwrcbXndXZ0
 39tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCU3W9mlxHE4TMqBdkjcyOh2bqsvTjlfmzIF3NGnHvE=;
 b=4UN4KdAyAaMfiebnjXa4EkrVV/dMiq35yrxUI20sWDdQ39pljWqRdDlUdAUPdaM3FW
 gcRsgtQCLFBzI4SN0J3fkGbPu7CwCl2Id2tE2yZrRPLIZ/a0ME734RqtzZ6H1WWJyyCu
 pJ59M4d8CkJFbVzP4ji29B1/IEPHNHzXRNQSlytG/S4g9090G0JZUSvmMwmbq5cjVbff
 wJl1OgWDVg3NgJuB7Ji/8Y+S8Ry5bxBGEaIEmx9LUKhBDtyk8vSNLcru1RG72znrTsFS
 v1bw3Bm3TN4Ia0FKVfgF0zj72iqQ3k0qt0RyZnblIPcRVlNWIAg0dxiKtz9+EBnADXe1
 lZWw==
X-Gm-Message-State: AOAM530JJyJtKN+eT72OkH/IQ56ZvDiyKR/fn74fvLYEPrRL7lNMAgZU
 BpiwmwvPR/sM+uoF+pcatWPk3g==
X-Google-Smtp-Source: ABdhPJwWY6A6dVQh0vaMFD3tyaT0I/WyyNN+KyeBTF4LfaCmGbkpzDGXOOHqQQgY5qQgYEDIoTN2kQ==
X-Received: by 2002:a05:6a00:a94:b0:4fd:c14b:21cb with SMTP id
 b20-20020a056a000a9400b004fdc14b21cbmr22660388pfl.53.1650453901951; 
 Wed, 20 Apr 2022 04:25:01 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm22529274pjn.14.2022.04.20.04.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:25:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/7] KVM RISC-V Sv57x4 support and HFENCE improvements
Date: Wed, 20 Apr 2022 16:54:43 +0530
Message-Id: <20220420112450.155624-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042503_410422_4567DDAD 
X-CRM114-Status: GOOD (  11.60  )
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

This series adds Sv57x4 support for KVM RISC-V G-stage and various
HFENCE related improvements.

These patches can also be found in riscv_kvm_sv57_plus_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased on Linux-5.18-rc3
 - Drop gstage_tlb_pgsize_bitmap and hfence_update_order() from PATCH4
   because software is not required to know to page sizes supported by
   TLB. In fact, it is responsibility of hardware implementation to
   ensure that S/HFENCE on an address X invalidates all TLB entries
   created for PTE covering address X.
 - Added PATCH7 to cleanup stale TLB entries when VCPU is moved another
   host CPU

Anup Patel (7):
  RISC-V: KVM: Use G-stage name for hypervisor page table
  RISC-V: KVM: Add Sv57x4 mode support for G-stage
  RISC-V: KVM: Treat SBI HFENCE calls as NOPs
  RISC-V: KVM: Introduce range based local HFENCE functions
  RISC-V: KVM: Reduce KVM_MAX_VCPUS value
  RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
  RISC-V: KVM: Cleanup stale TLB entries when host CPU changes

 arch/riscv/include/asm/csr.h      |   1 +
 arch/riscv/include/asm/kvm_host.h | 124 ++++++--
 arch/riscv/kvm/main.c             |  11 +-
 arch/riscv/kvm/mmu.c              | 264 +++++++++--------
 arch/riscv/kvm/tlb.S              |  74 -----
 arch/riscv/kvm/tlb.c              | 461 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             |  45 ++-
 arch/riscv/kvm/vcpu_exit.c        |   6 +-
 arch/riscv/kvm/vcpu_sbi_replace.c |  40 ++-
 arch/riscv/kvm/vcpu_sbi_v01.c     |  35 ++-
 arch/riscv/kvm/vm.c               |   8 +-
 arch/riscv/kvm/vmid.c             |  30 +-
 12 files changed, 812 insertions(+), 287 deletions(-)
 delete mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/tlb.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
