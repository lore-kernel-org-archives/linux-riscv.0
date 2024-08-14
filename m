Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AVh4wBbOMy1u3uz713ozm+4NjxHb8WuShHBg3nO4ASs=; b=2qYkJkpHHjDheG
	9cwcl4OQq95w+oOaW0TaXx1433V6jb3wuDD/E/IMc+7vfhaIfTiBGSyy8S+A8B49pCfZcCbHXIgs2
	dICF9G2zEgFQtD1foc/4uyAEx1QpZLggbZkTKhN7pv4Wm/xnUpR0Zrq5T3tvmDe07WdPH0xjqwUPx
	xEAwamB6Ri3mM+pWyBeeMd9j9uVpoKypWAzPM1mz+rLG2coQNiwRBZTFEf0XAmvpg0LjnaUIL7x0Z
	XNVVHgFEEOhvf+ZAf8bCrMVEludaqAW7jnWJKcLbPhY6qtdw//hWU47f/NI/QEgAJUdQNY+J/XFL6
	+BnIZL6SndHJUTKfIOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99X-00000006CZO-2KJz;
	Wed, 14 Aug 2024 08:14:43 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99U-00000006CYH-1knA
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:41 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3934342a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623279; x=1724228079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7X7rwinZQ3JvqiiqzaTRexejN5yFH2f9NFPeSO2fsBU=;
        b=RuCUFcD3bZEJ6q3HSAZsPGih/Q5wkLGhDYQmJzOe516mCyXwah2CZNcXxoKIeJ8pIt
         XwJkkuiezVkaZY0ZK4bLgB1dZjHYwll+EnO0dY0gAplXuThiYHMF6SuYsBLvZ8fX1Tb3
         92+5PxZTtws97fdUDjSc7HQshfI4kXYZ/OvbZbhlYc/aYaCgKMlLCOYZwPv8l/60fhIA
         Sji7FD3RUF6954K1ACXwSnXhKA9Skx8mXgg/sisY3Yn8vWqdniHdpbT4UQ3gf0TWeDZK
         YZJa6KxlF3n40CLEozXd9TIcqwq9WRfaGkWs5B+1TqoBa8tG9svI2MAbUK/zkKkr0w82
         f6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623279; x=1724228079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X7rwinZQ3JvqiiqzaTRexejN5yFH2f9NFPeSO2fsBU=;
        b=QhswnSEuTTh78Vb9szXGSCC9sJQPmUrWyP3MS/D8TgEeF6RJjjc9ZnG0k4RiuY169b
         KdnqN6lHPEJTckrxOYOkdNh5x6abQmv2ZPfq0RFZ/cTgE7xFtou3rDY7FHJAtm0rhPTH
         JVmGOS4KI43qJUQpQwdY03ziiil2PiXZv91F8z3maX9ASpjFYSrZApQMFMNiUy7oWt9a
         oyoL715ifEWUesQ8q3tctZSUaTgo+6b2uopM6jdPi8pnBz3Kxa0rcwCgwOND2Ql6RPDn
         6nmOWt6NGu6Hh3rjYLanwZbrsIwPuFSGEv6ul4r9FGfD/GQmKdJ1+NWu4GslGxN2V2cL
         aokA==
X-Forwarded-Encrypted: i=1; AJvYcCUGzd7a2WGSfHOZ1EBsnKjbPnGi5Ejf5WhToC8YO4fwiRXoQQgP1Zc4VdX7GZb3vX4ouC9AG3AMrKdllkMfLkMlFA5LYnw7wyFEb9WPZWlZ
X-Gm-Message-State: AOJu0Yw3ZfNUL+dXI+wxwxlhiGa188YtYQAUkeqsgde42QOLg1zp/nla
	FaWsq4/DwTkqm/edHFmjFqDfgUf0Sdk4TRVBcFiKtUiq+A5q4O2dWK1rAJHvheA=
X-Google-Smtp-Source: AGHT+IFzkELaMVi7vLgmjzrCXMwoASj5tflpIgCrPNmykWcMOyp7YKgyx1HmjdXy2+4eBAxfLy8trw==
X-Received: by 2002:a05:6a21:31c7:b0:1c2:8af6:31c2 with SMTP id adf61e73a8af0-1c8eaf86b54mr2479321637.44.1723623279321;
        Wed, 14 Aug 2024 01:14:39 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:38 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 00/10] riscv: Userspace pointer masking and tagged address ABI
Date: Wed, 14 Aug 2024 01:13:27 -0700
Message-ID: <20240814081437.956855-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011440_487686_1063B3BF 
X-CRM114-Status: GOOD (  23.64  )
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

This series depends on my per-thread envcfg series[3].

This series can be tested in QEMU by applying a patch set[2].

KASAN support will be added in a separate patch series.

[1]: https://github.com/riscv/riscv-j-extension/releases/download/pointer-masking-v1.0.0-rc2/pointer-masking-v1.0.0-rc2.pdf
[2]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
[3]: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/

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
  selftests: riscv: Add a pointer masking test
  riscv: hwprobe: Export the Supm ISA extension
  RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
  KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   3 +
 .../devicetree/bindings/riscv/extensions.yaml |  18 +
 arch/riscv/Kconfig                            |  11 +
 arch/riscv/include/asm/csr.h                  |  16 +
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/asm/mmu.h                  |   7 +
 arch/riscv/include/asm/mmu_context.h          |  13 +
 arch/riscv/include/asm/processor.h            |   8 +
 arch/riscv/include/asm/switch_to.h            |  11 +
 arch/riscv/include/asm/uaccess.h              |  58 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   2 +
 arch/riscv/kernel/cpufeature.c                |   3 +
 arch/riscv/kernel/process.c                   | 153 ++++++++
 arch/riscv/kernel/ptrace.c                    |  42 +++
 arch/riscv/kernel/sys_hwprobe.c               |   3 +
 arch/riscv/kvm/vcpu_onereg.c                  |   3 +
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |   3 +
 .../selftests/kvm/riscv/get-reg-list.c        |   8 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/pm/.gitignore   |   1 +
 tools/testing/selftests/riscv/pm/Makefile     |  10 +
 .../selftests/riscv/pm/pointer_masking.c      | 330 ++++++++++++++++++
 24 files changed, 706 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/pm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/pm/Makefile
 create mode 100644 tools/testing/selftests/riscv/pm/pointer_masking.c

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
