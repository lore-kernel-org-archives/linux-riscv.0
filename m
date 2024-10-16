Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D4D2A555
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u1vhWkuWzqLJxpbRUo7hQuPt9QBm3RCybdBi443IgLg=; b=of++oipZSR36gO
	nRnhxOVjs9M78zzwSU139De6iNWgAr3z25ilthF3kSpOCp8rXo555a4nZmTav3uz7gmwja4ju/r/w
	EcST/qZ9pF3XyWiRx4ySfIBX9AJs427eehMvvVvwEFf8QelJC84ajhpK9fU8KY7NqI8CiR8WuywjG
	1hFGLdZNrjMD6RpR/01b8Ar7FJ+MzH3jupDSm36bZ9g4tBhm1YiMdjqISw3ucwDCtZ/Q/ovaY5o8y
	B6Dq2u3RNnfLmg4AH3zQkn2ffvRIyeiBkbqm7HALtOEQ7MbwUefHkUH+zcC8ShpAdGWIWRUVYH1cl
	FW/oDuB79+G1AZUqzy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ad3-0000000CwQg-3iu5;
	Wed, 16 Oct 2024 20:28:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ad0-0000000CwPM-2Tvc
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:20 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso164381a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110497; x=1729715297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hEUhwJlktvJ9XLTxaEULHD6mXOGpKAbrtbb51ie7J44=;
        b=GOv+u6GzGRT+XB8P4/5i1k5ux5P/TchbcrHieSoziLQsruhqxTPh6g39cYI0VotooE
         3TTAFWni7DPdtvwLmUvW936SpG1Q3hg6SOnlWXgyf0c6xzIeCLmtLay4p4IK0bAYRdY6
         rogt9TQbp3zmbxRDWD5cvGPH9/mzpYqTC/fImTLGm4j2OCRxAYtTQUnlUI7PNnOsJFCG
         UgVdgFMbK3m3+yRHtv+jVIxuhpzeHUxQviznx3D2SlACPvRKw0qzfA8HkLiKHi5IkWLl
         M8jWxJPXNiKlkjPi/PRIGOUgPyJC/AhVM2UXArrDKO238EhPP8VRjhQkgfKElcAfcNkR
         9sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110497; x=1729715297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEUhwJlktvJ9XLTxaEULHD6mXOGpKAbrtbb51ie7J44=;
        b=ChpC/PR4WUGhXeO04yETQ4A+EgJu5UNvYru+A86eHMLgj8QkAW/9esU3KuawMW93vM
         +5EZeA3OMrFE8YONiNnbzNcRENcr3B35NJHjVqr8RBGwpcP81iMoohZEkTbEuMKXTniB
         C7Tu8g7v4xFc43czd6+zRMUEtycawmOUTsXmzHEOZrjN7FZzvCeNv5VbvllTbfK5LXyy
         SxjhdBVrt2DSSDxDaRr0HDElbPf5ae0AVo+Xx3/jpHNqmgBO9mUPIVn4ilW5ShFeJ1Co
         JrxF7Ih4UWUG7WSZoyqnVIibjYJg6uGSTV4sElVU9UqAsWptkVhajhOyW4vcFSLI7aTE
         FCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHIXTD8mh79djZXY7n7HN0jqEnAEG4bGD+fIdvQ25MTUKqru2Diez52kYpuSg6aZIgN2xqAXZsELDwFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLRsNefxPTD1WvZIXASP5HdPowEykt+maEYAAo0BxfVfUalPAx
	uzw7ymAUCNMs1xno1zbd3B9tCVQ9Pwe4qwBmWW5rTEI4RcHNaTMoUFvVKrBPe4s=
X-Google-Smtp-Source: AGHT+IGllzymcOAYJ4F9gGwGiLHbUJdPlvukCb/zqDKpUvzRbezJlnGn7CSqgSzw6TP5Nt2/LjKHnQ==
X-Received: by 2002:a17:90b:4b8b:b0:2e2:9077:a3b4 with SMTP id 98e67ed59e1d1-2e3151b8a44mr21167547a91.7.1729110497313;
        Wed, 16 Oct 2024 13:28:17 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:16 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 00/10] riscv: Userspace pointer masking and tagged address ABI
Date: Wed, 16 Oct 2024 13:27:41 -0700
Message-ID: <20241016202814.4061541-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_132818_671392_71C9B0B8 
X-CRM114-Status: GOOD (  24.84  )
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

RISC-V defines three extensions for pointer masking[1]:
 - Smmpm: configured in M-mode, affects M-mode
 - Smnpm: configured in M-mode, affects the next lower mode (S or U-mode)
 - Ssnpm: configured in S-mode, affects the next lower mode (VS, VU, or U-mode)

This series adds support for configuring Smnpm or Ssnpm (depending on
which privilege mode the kernel is running in) to allow pointer masking
in userspace (VU or U-mode), extending the PR_SET_TAGGED_ADDR_CTRL API
from arm64. Unlike arm64 TBI, userspace pointer masking is not enabled
by default on RISC-V. Additionally, the tag width (referred to as PMLEN)
is variable, so userspace needs to ask the kernel for a specific tag
width, which is interpreted as a lower bound on the number of tag bits.

This series also adds support for a tagged address ABI similar to arm64
and x86. Since accesses from the kernel to user memory use the kernel's
pointer masking configuration, not the user's, the kernel must untag
user pointers in software before dereferencing them. And since the tag
width is variable, as with LAM on x86, it must be kept the same across
all threads in a process so untagged_addr_remote() can work.

[1]: https://github.com/riscv/riscv-j-extension/raw/d70011dde6c2/zjpm-spec.pdf
---
This series depends on the per-thread envcfg series in riscv/for-next.

This series can be tested in QEMU by applying a patch set[2].

KASAN_SW_TAGS using pointer masking is an independent patch series[3].

[2]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
[3]: https://lore.kernel.org/linux-riscv/20240814085618.968833-1-samuel.holland@sifive.com/

Changes in v5:
 - Update pointer masking spec version to 1.0 and state to ratified
 - Document how PR_[SG]ET_TAGGED_ADDR_CTRL are used on RISC-V
 - Document that the RISC-V tagged address ABI is the same as AArch64
 - Rename "pm" selftests directory to "abi" to be more generic
 - Fix -Wparentheses warnings
 - Fix order of operations when writing via the tagged pointer
 - Update pointer masking spec version to 1.0 in hwprobe documentation

Changes in v4:
 - Switch IS_ENABLED back to #ifdef to fix riscv32 build
 - Combine __untagged_addr() and __untagged_addr_remote()

Changes in v3:
 - Note in the commit message that the ISA extension spec is frozen
 - Rebase on riscv/for-next (ISA extension list conflicts)
 - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere
 - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions
 - Rename CONFIG_RISCV_ISA_POINTER_MASKING to CONFIG_RISCV_ISA_SUPM,
   since it only controls the userspace part of pointer masking
 - Use IS_ENABLED instead of #ifdef when possible
 - Use an enum for the supported PMLEN values
 - Simplify the logic in set_tagged_addr_ctrl()
 - Use IS_ENABLED instead of #ifdef when possible
 - Implement mm_untag_mask()
 - Remove pmlen from struct thread_info (now only in mm_context_t)

Changes in v2:
 - Drop patch 4 ("riscv: Define is_compat_thread()"), as an equivalent
   patch was already applied
 - Move patch 5 ("riscv: Split per-CPU and per-thread envcfg bits") to a
   different series[3]
 - Update pointer masking specification version reference
 - Provide macros for the extension affecting the kernel and userspace
 - Use the correct name for the hstatus.HUPMM field
 - Rebase on riscv/linux.git for-next
 - Add and use the envcfg_update_bits() helper function
 - Inline flush_tagged_addr_state()
 - Implement untagged_addr_remote()
 - Restrict PMLEN changes once a process is multithreaded
 - Rename "tags" directory to "pm" to avoid .gitignore rules
 - Add .gitignore file to ignore the compiled selftest binary
 - Write to a pipe to force dereferencing the user pointer
 - Handle SIGSEGV in the child process to reduce dmesg noise
 - Export Supm via hwprobe
 - Export Smnpm and Ssnpm to KVM guests

Samuel Holland (10):
  dt-bindings: riscv: Add pointer masking ISA extensions
  riscv: Add ISA extension parsing for pointer masking
  riscv: Add CSR definitions for pointer masking
  riscv: Add support for userspace pointer masking
  riscv: Add support for the tagged address ABI
  riscv: Allow ptrace control of the tagged address ABI
  riscv: selftests: Add a pointer masking test
  riscv: hwprobe: Export the Supm ISA extension
  RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
  KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   3 +
 Documentation/arch/riscv/uabi.rst             |  16 +
 .../devicetree/bindings/riscv/extensions.yaml |  18 +
 arch/riscv/Kconfig                            |  11 +
 arch/riscv/include/asm/csr.h                  |  16 +
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/asm/mmu.h                  |   7 +
 arch/riscv/include/asm/mmu_context.h          |  13 +
 arch/riscv/include/asm/processor.h            |   8 +
 arch/riscv/include/asm/switch_to.h            |  11 +
 arch/riscv/include/asm/uaccess.h              |  43 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   2 +
 arch/riscv/kernel/cpufeature.c                |   3 +
 arch/riscv/kernel/process.c                   | 154 ++++++++
 arch/riscv/kernel/ptrace.c                    |  42 +++
 arch/riscv/kernel/sys_hwprobe.c               |   3 +
 arch/riscv/kvm/vcpu_onereg.c                  |   4 +
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |   5 +-
 .../selftests/kvm/riscv/get-reg-list.c        |   8 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/abi/.gitignore  |   1 +
 tools/testing/selftests/riscv/abi/Makefile    |  10 +
 .../selftests/riscv/abi/pointer_masking.c     | 332 ++++++++++++++++++
 25 files changed, 712 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/abi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/abi/Makefile
 create mode 100644 tools/testing/selftests/riscv/abi/pointer_masking.c

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
