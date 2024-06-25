Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73682C30659
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6qfFL4DQubrRI7opJB81jvEXIOIOv29wyz1FQTLN9QQ=; b=wLJs5QyrLD5Rp3
	AieMJ20u6ZJeH1xDQA1NOTaoeqXUNHSPqmp04vsDV9f2t/mzKe0bVq5IheNKT/xFPQlEkS6EY48ib
	XRY3L8a4fwd1Kbyv5cJmMpUUQr3Es9Sy67L4cu7nPPyULLqGgRxf9EI+3uxpuToNLHmMGVZpY+uGA
	kSZAE22nUk9ux8dio35OhJKc4tCHpJtr3BmYfFhevSCvYyDKcbfmSLfg5G5vDSj+Xx0pwnwtUIoU4
	DtJcrV8oChOm7AIT3Sru0giMxb9sr36Jy+JN3WZcUth+HbuGBtPKvKKV57BZNoUBRuX60yTnUja3f
	nETr2M5TkfR3LoRV+dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ8-00000004V5K-1tjj;
	Tue, 25 Jun 2024 21:09:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ3-00000004V2D-10SG
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f480624d0dso50750335ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349776; x=1719954576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUBdVGV0+fMFwjwLM0qvSzcFICs4EkTcqE1zrLWEtEM=;
        b=FJB+3E8OqTNCa+Byk8kWeV2sKAFH+pLG57bPv1095cHeGd3Xu1KF1OZ6XAyYQ90Xg3
         N7VrY280VmHxrsqCsFhf4ykBRhd57TzupSmAHX+KJR5HPMgt6neoS8pJHOpr+8A4LPG4
         AuACDDKctAQbgt0+67nBLyGBJK8W0LaoIkj8zEpajsXYu0vFNYE7TMY8twqlm29pwN6P
         IVTQOJF7+5hIqJil1rWuVvUIMn7ppfr6hgPfMZObVKybiyu+x7fcf38DWjgZzf90J29j
         pasVrpGTdNIeTAzl1U0CxqxH+7m2rsAtHDj8nSfG+YcQdA9K7XXnMxgWN/Bcr/pzilhk
         bEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349776; x=1719954576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUBdVGV0+fMFwjwLM0qvSzcFICs4EkTcqE1zrLWEtEM=;
        b=aX5B+iJfk1qvwlMJKaH+B37jjnlKjcfekFzRfCjVnGvkg0SW4C6TAI7jFOkbeavLcm
         v53AllyBMlClAOFJRD8UGXKC03gkbsYn8yrUgXKDOX/B+lE8xXJF3u22womUti7rCAWY
         8zxPEnMhFIp2HunBBoGYqYr3WVisViEqbOBZgh2IOJJjwWXUOMvHmY0681sLQdNLbom7
         qh5Ii8ptZ5YwJPglgQnb3OZaV83LC19In5f36XECSiad3lHouRoFKn8PQjsgud8zU/D3
         bFbS7R81Hx33Ixax1atYK99vRiAsj5NOIhDxUIGo+BNjp78aPRI75Dl5gRQoIOlrzXBQ
         mE9A==
X-Forwarded-Encrypted: i=1; AJvYcCV01rPf10Xgm3yaIJv8xJXsWhXa2p/xHPlTga85c9kC7pNzAhE2CzzxQqM1t1ElvP9xJ/3os6I83sO/6JEjqZW91dfKUVcQqPNXDjiYah0X
X-Gm-Message-State: AOJu0YxAA/n45hxM7B4rUNidXJV0GBi2nEOYU8iVaJ88ls6o5RxIIYJk
	5Rrdsvk0R5C56/YJ5S95KoKH3+4kC+LWb1gERoV68FRl4CjGIBK2I17Fnv8y4AU=
X-Google-Smtp-Source: AGHT+IEaUHjDWO8+3ZFN6cPh1szoLNnMWbRTcCp8FoVAQAbCft2J13YEiKmHfYP2xrEiBrAdej61ww==
X-Received: by 2002:a17:902:c10c:b0:1fa:a2a:221e with SMTP id d9443c01a7336-1fa23ef0d8bmr91219335ad.40.1719349775795;
        Tue, 25 Jun 2024 14:09:35 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:35 -0700 (PDT)
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
Subject: [PATCH v2 00/10] riscv: Userspace pointer masking and tagged address ABI
Date: Tue, 25 Jun 2024 14:09:11 -0700
Message-ID: <20240625210933.1620802-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140939_434947_D33B333A 
X-CRM114-Status: GOOD (  21.05  )
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
width (which is interpreted as a lower bound on the number of tag bits).

This series also adds support for a tagged address ABI similar to arm64
and x86. Since accesses from the kernel to user memory use the kernel's
pointer masking configuration, not the user's, the kernel must untag
user pointers in software before dereferencing them. And since the tag
length is variable, as with LAM on x86, it must be the same across all
threads in a process so untagged_addr_remote() can work.

This series depends on my per-thread envcfg series[3].

This series can be tested in QEMU by applying a patch set[2].

KASAN support will be added in a separate patch series.

[1]: https://github.com/riscv/riscv-j-extension/releases/download/pointer-masking-v1.0.0-rc2/pointer-masking-v1.0.0-rc2.pdf
[2]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
[3]: https://lore.kernel.org/linux-riscv/20240613171447.3176616-1-samuel.holland@sifive.com/

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
 arch/riscv/include/asm/hwcap.h                |   7 +
 arch/riscv/include/asm/mmu.h                  |   7 +
 arch/riscv/include/asm/mmu_context.h          |   6 +
 arch/riscv/include/asm/processor.h            |   8 +
 arch/riscv/include/asm/switch_to.h            |  11 +
 arch/riscv/include/asm/thread_info.h          |   3 +
 arch/riscv/include/asm/uaccess.h              |  58 ++-
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   2 +
 arch/riscv/kernel/cpufeature.c                |   3 +
 arch/riscv/kernel/process.c                   | 164 +++++++++
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
 25 files changed, 715 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/pm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/pm/Makefile
 create mode 100644 tools/testing/selftests/riscv/pm/pointer_masking.c

-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
