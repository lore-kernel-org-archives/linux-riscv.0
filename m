Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653ADC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yfGkK/9idGKKSq4AK3WVJYPYlCNJizA3Sv2EYClXS8=; b=XURnJqNXN7+7+s
	dfk1fGohBlao3lxUMTjRH25XDyAKuLlNYFUS/q59PJBeYjwoJV/8V8HpU2cxAwAwnjj5Mf1/qJ7Bp
	HW3L3y3ACQ9zrKtYU+FGXAROvMs2yKAH/sKUZk9YZXqbWU2tunpB7AZlADpyIsZjBekupL84e3IBm
	HukxWPsP7pDuuXOd5QAum+WXQjzoTvfZvmogGG0N/Kd+eamIxWl5Wq40SmLhdex4mAS1gHguxKAoY
	J2E0njhz7I6116aTKf4a5iCedR+ojXdUF2PaGsHBbmx3XPvITRIt0/3yyPkhdGU51Axawuq3dToCe
	nLeAUQou11nY3iQzezhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAk-00000003B70-399o;
	Fri, 19 Jul 2024 16:09:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAh-00000003B5f-0RaE
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fc66fc35f2so13171975ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405365; x=1722010165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYWKSzPxNF1FBMt6vsXOOAcJiLP6695b+s20Dc1fH5Y=;
        b=jliwpiLbxtHfkH0nnLfINOOCRhey8argmEWJODWTQZmh8pV+uov/7HLJK01WHQ+q67
         0iS5roPIpIVoEBOMov6KlyzSRAARbEvm8VI35El1yMy+hhc9e4nezf0KFn+iP+GvU1Cr
         YiBboIriXzu+tTo9HMOoH+DrSlhX7x0vGZFJi0trWrh7lla6u784J7NidZLcEpWf57NJ
         KaoAM2sidFFtairzCr75S9f/XOagr9hh6IYgYVDXtVUCNRsT3ax3CanWPl81kzXg+YNE
         3w2BWHk9Xz3AY5v9I0njqHDV+9xcqqzPqUAfZlhhd4QPO2HBiJnqOe5qjMic6eZI1tb8
         OKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405365; x=1722010165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYWKSzPxNF1FBMt6vsXOOAcJiLP6695b+s20Dc1fH5Y=;
        b=MAQzwkPOliPx3DH/LExEGWgPBflMIUEudldYsQ0sw9dsLR+fdxYkDUdBXS4kk22ZSZ
         E5m9nzLHlPc1j46Emc5Keytzpj3Sdp5AGrtxvXA3ZQE81UZAnuBhyD5j3t4swiJMA5kW
         ibc7iRBgbLS/SiH/jIs9U8i71j9WDzqT40CSMXHtT1CuMz7wQYCbCDlqwbT+ryHoIL89
         v5V0XBTSWB1qio1zvsqp+ojb6/un+6WLnqW4sc7a0+6JauWXlZZQGr/MiWWwDh6+x5VY
         xiYDmcXajFoSHxSJ8nrCjzBLZtwp4V2RX4NredmeFafWtY3CQ7fquop2JXY5f+nvWavI
         9HaA==
X-Forwarded-Encrypted: i=1; AJvYcCXk0qKRWMZvpTSzP93WAPzqIPIJOhODiC7GJM3J0n0l4s5K8Q/Mz+g0SATqVKzT45IHYR5anbwmFXMebMYq4zDQ2qv7QprYa69im/Fv3YS6
X-Gm-Message-State: AOJu0YwBzLcnydSFsbFc7hcRS9J2rj0dcPjLfGH+GDECsGiyptQqdSDt
	zTI8brqOW/qM+QEN1zrr+NHjgPKpS0lVuxxEXNAAXgbCrT0lqLc10Yv1XyjZ894=
X-Google-Smtp-Source: AGHT+IEDU6P9hJ2nz3TyZ6kiWvc/ZyeAut4s//9AkbdAxAzckMrzsXplgQo8noxdWpSASQCmveYruw==
X-Received: by 2002:a17:903:98d:b0:1fc:58b7:ae66 with SMTP id d9443c01a7336-1fd74d366dcmr1596895ad.17.1721405364733;
        Fri, 19 Jul 2024 09:09:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:24 -0700 (PDT)
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
Subject: [PATCH 00/13] Accelerate KVM RISC-V when running as a guest
Date: Fri, 19 Jul 2024 21:39:00 +0530
Message-Id: <20240719160913.342027-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090927_149794_99E10EA5 
X-CRM114-Status: GOOD (  11.28  )
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

These patches can also be found in the riscv_sbi_nested_v1 branch at:
https://github.com/avpatel/linux.git

To test these patches, run KVM RISC-V as Guest under latest Xvisor
found at: https://github.com/xvisor/xvisor.git

For the steps to test on Xvisor, refer the Xvisor documentation
<xvisor_source>/docs/riscv/riscv64-qemu.txt with two small changes:

1) In step#11, make sure compressed kvm.ko, guest kernel image, and
   kvmtool are present in the rootfs.img
2) In step#14, make sure AIA is available to Xvisor by using
   "virt,aia=aplic-imsic" as the QEMU machine name.

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

 arch/riscv/include/asm/kvm_nacl.h | 237 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/sbi.h      | 120 +++++++++++++++
 arch/riscv/kvm/Makefile           |  27 ++--
 arch/riscv/kvm/aia.c              | 114 +++++++++-----
 arch/riscv/kvm/main.c             |  53 ++++++-
 arch/riscv/kvm/mmu.c              |   4 +-
 arch/riscv/kvm/nacl.c             | 152 +++++++++++++++++++
 arch/riscv/kvm/tlb.c              |  57 ++++---
 arch/riscv/kvm/vcpu.c             | 184 +++++++++++++++++------
 arch/riscv/kvm/vcpu_switch.S      | 137 ++++++++++-------
 arch/riscv/kvm/vcpu_timer.c       |  28 ++--
 11 files changed, 935 insertions(+), 178 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_nacl.h
 create mode 100644 arch/riscv/kvm/nacl.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
