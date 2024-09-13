Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E4FC616A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NA28d73lCrIN90Rh8eadUuuCuumK00OA4nvjlEkNEc=; b=S55ZEIr/vYBS1Z
	lK1FO39WEmgaoKof5/l6vgUv3TmKVzVyhqur7xUIi9OPDiXuvNoF6hmuJr/yS4kWtoOiBGg8grPG1
	YRP9ZUwk06IlDcoSv8TmgiGCxco+oSXxgJFCEOT5VodM+eV4NwyWAAs446Mz1eRsIDovGZ6SGK+Jy
	JN4l0uiadss2N3df/c9DGxDQFBcyGSFcN86EOsxVXfO+J5UaLbCDLwxEBGoctZkhfvYS+JquVfME9
	dA3IZt2vfv0F+CGmNxrcf4Xkc74hmBeR6qncQh47TiZLR9V4Wfc7RVd86CRo7TqROzcXoRMn6Tpr3
	nfukCtaHlFi8Vzp6UN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAkJ-0000000GmBc-22l8;
	Fri, 13 Sep 2024 18:10:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAj3-0000000Glv8-2Uzt
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 18:08:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2057835395aso28271725ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726250936; x=1726855736; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZnA3erGKxX6kl7LXrESncIv3ytuXvzogy+s/qD8NvE=;
        b=l0CklQYq1CVs+3YlLyz+d38sur9QkcE0IIINEL+Wo5rEgQUNUCBABT0jwdkK1R2uPi
         7vel3JZbG9nUJj0cKLdqEtHZIeyxFzZR71bc072OOw4rs2WIDLrYNUM2nHZ8bJtAY6wT
         XVTX0puh0eESfjk9bCp2/Dy1IG4xXYnCcz+2NyhcF4CbNfb0UIe0t8HyNdEZqVcL8Gzj
         Ks5yCT0xNKEE/XgkVCcoqQ3vti0i/fazd4KWI1N8Fk6LEhUm9i7PbKRuocJ/oJT+ydym
         2h0ZJJeKlEW+TnpYZk+MMM1gKfOMMItA0+ZoZ6HME9OD0uqVD63RiFy94BJXtvsAvzXB
         ipgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250936; x=1726855736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZnA3erGKxX6kl7LXrESncIv3ytuXvzogy+s/qD8NvE=;
        b=if5VhfumR+oRG94yac/ZLB2kHokghZsIsi4C1MWYtrU++nDzjbfdZ+KW8iA9ZHfO1N
         RAe7CSJu2qLrz7H4DD331uZcVPpQ15UtZO9wuvGXS/0ODnjE+8e7JKJnc2A9VG5joL0E
         0CaWTr+lfqVK2oMquEVitYkJN8oKxLswy/rzy1Ta4hje1rNdzNChbzHNEGifB9NBcR4o
         AHP8wh+lKOH4/SHz0vspUZq+0YAdVGsktDPojSbWHeg3SVmAwAJlZjmTpyb55kG8Xi0c
         iBeY69mPhoKQ0T9rf0Cf+x/iIzt0HUQToBljgRosrg2JOHX2oE+twMOS6DRnV+jxrHhn
         co6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+Yxh1jwc/tbFGll9CScg5IXklsCMH+8ocgsx0fl4nUo/30IYkpn1bJadcGAXjJMUg1N/xflbmMKw/hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHhZN24KLqPwy/3/OlBvz7KnWCAVoX1nfAjRcPOIbuE1UiPRLP
	dmcTwUrH77cHSWracI459zp/LCXsUlI0E/SoCNvH7t/XoKIbBs5y+1IDKKU1ibo=
X-Google-Smtp-Source: AGHT+IFN964Zs+/aTw1ojF+mM++GEGXbGxkYdsmtpvBxBVzOYlXl/oCfNtrQS2GMYUKlHUbPHCw5LA==
X-Received: by 2002:a17:902:f550:b0:205:4e4a:72d9 with SMTP id d9443c01a7336-2076e30651fmr127545975ad.7.1726250935453;
        Fri, 13 Sep 2024 11:08:55 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe9a75sm30468575ad.211.2024.09.13.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 11:08:54 -0700 (PDT)
Date: Fri, 13 Sep 2024 11:08:52 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 00/10] riscv: Userspace pointer masking and tagged
 address ABI
Message-ID: <ZuR/tK+9cKUXqDga@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_110857_886233_17B7D94B 
X-CRM114-Status: GOOD (  35.41  )
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

On Wed, Aug 28, 2024 at 06:01:22PM -0700, Samuel Holland wrote:
> RISC-V defines three extensions for pointer masking[1]:
>  - Smmpm: configured in M-mode, affects M-mode
>  - Smnpm: configured in M-mode, affects the next lower mode (S or U-mode)
>  - Ssnpm: configured in S-mode, affects the next lower mode (VS, VU, or U-mode)
> 
> This series adds support for configuring Smnpm or Ssnpm (depending on
> which privilege mode the kernel is running in) to allow pointer masking
> in userspace (VU or U-mode), extending the PR_SET_TAGGED_ADDR_CTRL API
> from arm64. Unlike arm64 TBI, userspace pointer masking is not enabled
> by default on RISC-V. Additionally, the tag width (referred to as PMLEN)
> is variable, so userspace needs to ask the kernel for a specific tag
> width, which is interpreted as a lower bound on the number of tag bits.
> 
> This series also adds support for a tagged address ABI similar to arm64
> and x86. Since accesses from the kernel to user memory use the kernel's
> pointer masking configuration, not the user's, the kernel must untag
> user pointers in software before dereferencing them. And since the tag
> width is variable, as with LAM on x86, it must be kept the same across
> all threads in a process so untagged_addr_remote() can work.
> 
> This series depends on my per-thread envcfg series[3].
> 
> This series can be tested in QEMU by applying a patch set[2].
> 
> KASAN support will be added in a separate patch series.
> 
> [1]: https://github.com/riscv/riscv-j-extension/releases/download/pointer-masking-v1.0.0-rc2/pointer-masking-v1.0.0-rc2.pdf
> [2]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
> [3]: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/
> 
> Changes in v4:
>  - Switch IS_ENABLED back to #ifdef to fix riscv32 build
>  - Combine __untagged_addr() and __untagged_addr_remote()
> 
> Changes in v3:
>  - Note in the commit message that the ISA extension spec is frozen
>  - Rebase on riscv/for-next (ISA extension list conflicts)
>  - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere
>  - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions
>  - Rename CONFIG_RISCV_ISA_POINTER_MASKING to CONFIG_RISCV_ISA_SUPM,
>    since it only controls the userspace part of pointer masking
>  - Use IS_ENABLED instead of #ifdef when possible
>  - Use an enum for the supported PMLEN values
>  - Simplify the logic in set_tagged_addr_ctrl()
>  - Use IS_ENABLED instead of #ifdef when possible
>  - Implement mm_untag_mask()
>  - Remove pmlen from struct thread_info (now only in mm_context_t)
> 
> Changes in v2:
>  - Drop patch 4 ("riscv: Define is_compat_thread()"), as an equivalent
>    patch was already applied
>  - Move patch 5 ("riscv: Split per-CPU and per-thread envcfg bits") to a
>    different series[3]
>  - Update pointer masking specification version reference
>  - Provide macros for the extension affecting the kernel and userspace
>  - Use the correct name for the hstatus.HUPMM field
>  - Rebase on riscv/linux.git for-next
>  - Add and use the envcfg_update_bits() helper function
>  - Inline flush_tagged_addr_state()
>  - Implement untagged_addr_remote()
>  - Restrict PMLEN changes once a process is multithreaded
>  - Rename "tags" directory to "pm" to avoid .gitignore rules
>  - Add .gitignore file to ignore the compiled selftest binary
>  - Write to a pipe to force dereferencing the user pointer
>  - Handle SIGSEGV in the child process to reduce dmesg noise
>  - Export Supm via hwprobe
>  - Export Smnpm and Ssnpm to KVM guests
> 
> Samuel Holland (10):
>   dt-bindings: riscv: Add pointer masking ISA extensions
>   riscv: Add ISA extension parsing for pointer masking
>   riscv: Add CSR definitions for pointer masking
>   riscv: Add support for userspace pointer masking
>   riscv: Add support for the tagged address ABI
>   riscv: Allow ptrace control of the tagged address ABI
>   selftests: riscv: Add a pointer masking test
>   riscv: hwprobe: Export the Supm ISA extension
>   RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
>   KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   3 +

Would you be open to writing documentation similar to what is available
for arm? https://www.kernel.org/doc/html/next/arm64/tagged-address-abi.html

- Charlie

>  .../devicetree/bindings/riscv/extensions.yaml |  18 +
>  arch/riscv/Kconfig                            |  11 +
>  arch/riscv/include/asm/csr.h                  |  16 +
>  arch/riscv/include/asm/hwcap.h                |   5 +
>  arch/riscv/include/asm/mmu.h                  |   7 +
>  arch/riscv/include/asm/mmu_context.h          |  13 +
>  arch/riscv/include/asm/processor.h            |   8 +
>  arch/riscv/include/asm/switch_to.h            |  11 +
>  arch/riscv/include/asm/uaccess.h              |  43 ++-
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   2 +
>  arch/riscv/kernel/cpufeature.c                |   3 +
>  arch/riscv/kernel/process.c                   | 154 ++++++++
>  arch/riscv/kernel/ptrace.c                    |  42 +++
>  arch/riscv/kernel/sys_hwprobe.c               |   3 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   3 +
>  include/uapi/linux/elf.h                      |   1 +
>  include/uapi/linux/prctl.h                    |   3 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   8 +
>  tools/testing/selftests/riscv/Makefile        |   2 +-
>  tools/testing/selftests/riscv/pm/.gitignore   |   1 +
>  tools/testing/selftests/riscv/pm/Makefile     |  10 +
>  .../selftests/riscv/pm/pointer_masking.c      | 330 ++++++++++++++++++
>  24 files changed, 692 insertions(+), 6 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/pm/.gitignore
>  create mode 100644 tools/testing/selftests/riscv/pm/Makefile
>  create mode 100644 tools/testing/selftests/riscv/pm/pointer_masking.c
> 
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
