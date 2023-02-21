Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F243C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0/himvWshaJ6hKHeq9Kcbd1AYFCDnMJ3SmmxSiJUlhc=; b=UL25ihDC7OVZLQ
	13LBDKh0P4n2lzpx9jLb0m16KJRjKmNhuyRDpO8kVofb4WLN3ub29EWXQQ3JHQzTNYBgyp6GRVezr
	WsrYnPrlfmaI3pllDMPHyH0yEBl9KL0Kc1mMaywsHpLKzIJZKNTp2euSiAjVJyt+whzVF9XHSV37c
	W5WGw2Doss812U34eKN6V9A+Ig16jKgmBxAJTuxTZgcwkD2pGHie2W7x+LM54GsYDC9lGUHNiqqu0
	VyyurDz67wKTmPMOsGMzJH7tGsEsb2hqhRKjK+oOfK7F0XO4jllVcfFJhitdDr5/68hK+JqDqQA1I
	STRRHZAHs6S9m9UdA6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0x-009Ur3-O5; Tue, 21 Feb 2023 19:09:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0u-009Und-8N
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id u14so2247401ple.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjKINbb63v5SLh2fBO1WTFDjRXNgIY1VQjz6bVZHQms=;
        b=3sslWOyxPhymcC8neUnCMcsS0pPBKNktRr8N7hI+3KXZAOnhnwU1AXnitKO5EqgTVk
         BBplfBFBHKG8oJb7NI0iwMFrnmlirBn5mAY2eAMcHdo3ObPlY4A6D83fOueZxL2ck4YU
         jUYE/7VPXqR3dL74ogM/WgK4XJDWYVNStASCx97NSCQYqmSJafq1VbhrxhG5X9uPHPGU
         wjc79uXtBsJjCGNZ0ZzRwJ2VAJu3KybR8zTSbiag35wyFgSGIsLoReSXjLtrwnNfNnaV
         xtyjEcPNSra+qVmlNi0qvBZMnzNpSYfnljwa/vvxx1gq/jmeFcJTqBfv8e2qIFvyhWLy
         TG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjKINbb63v5SLh2fBO1WTFDjRXNgIY1VQjz6bVZHQms=;
        b=qF+MnXT+G4UU9vsFaQopYjeFXf4r6bLC2hyjVBoeZDLCb5j3citpmvNQJU15cOT+/1
         tHCEZBmaeiQykHAICe3+JiW3gJRiFKRnns1fz6TK+y5ym7gn0ftJfPQhrsp15goXH8X4
         vIRI5y9AT1sgXuM28bmHshyORvV6R44M9RuNiPU+glMadNpzDiLo+wGKnQihxuMOsTGa
         N0HHw60bSi/NKJFjcKcBRD1UMnU0bZJkBpJtpCmIazA+TAWdEVorOpcYwApMlKOEhq7x
         fxBfZJwZ6xTXrEW5YjtNDJktAboVGG2PPQJO/8QenCXZcHNQW+Dz1A4KaE+M53qGqhBt
         QMOQ==
X-Gm-Message-State: AO0yUKWDuB7VtE9wiHy0+6kCPeVg79fdCxTlaM1tuzMik8tLkMwRNh/q
	CdCsONbcHXVkxNYoMjlGubfABA==
X-Google-Smtp-Source: AK7set/LLBBxVlCKn8oUpZpNpFvej+FyNPldkLZd8dQFU6qsq6oAUKleyiQQ6a/2mujUE8g4N0Q9Ug==
X-Received: by 2002:a17:902:c941:b0:196:5b76:8e6e with SMTP id i1-20020a170902c94100b001965b768e6emr6609924pla.1.1677006555431;
        Tue, 21 Feb 2023 11:09:15 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:14 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 0/7] RISC-V Hardware Probing User Interface
Date: Tue, 21 Feb 2023 11:08:51 -0800
Message-Id: <20230221190858.3159617-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110920_521771_5261EA21 
X-CRM114-Status: GOOD (  31.68  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, heiko@sntech.de, Jisheng Zhang <jszhang@kernel.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, linux-kselftest@vger.kernel.org, slewis@rivosinc.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


There's been a bunch of off-list discussions about this, including at
Plumbers.  The original plan was to do something involving providing an
ISA string to userspace, but ISA strings just aren't sufficient for a
stable ABI any more: in order to parse an ISA string users need the
version of the specifications that the string is written to, the version
of each extension (sometimes at a finer granularity than the RISC-V
releases/versions encode), and the expected use case for the ISA string
(ie, is it a U-mode or M-mode string).  That's a lot of complexity to
try and keep ABI compatible and it's probably going to continue to grow,
as even if there's no more complexity in the specifications we'll have
to deal with the various ISA string parsing oddities that end up all
over userspace.

Instead this patch set takes a very different approach and provides a set
of key/value pairs that encode various bits about the system.  The big
advantage here is that we can clearly define what these mean so we can
ensure ABI stability, but it also allows us to encode information that's
unlikely to ever appear in an ISA string (see the misaligned access
performance, for example).  The resulting interface looks a lot like
what arm64 and x86 do, and will hopefully fit well into something like
ACPI in the future.

The actual user interface is a syscall, with a vDSO function in front of
it. The vDSO function can answer some queries without a syscall at all,
and falls back to the syscall for cases it doesn't have answers to.
Currently we prepopulate it with an array of answers for all keys and
a CPU set of "all CPUs". This can be adjusted as necessary to provide
fast answers to the most common queries.

An example series in glibc exposing this syscall and using it in an
ifunc selector for memcpy can be found at [1]. I'm about to send a v2
of that series out that incorporates the vDSO function.

I was asked about the performance delta between this and something like
sysfs. I created a small test program [2] and ran it on a riscv64 qemu
instance. Doing each operation 100000 times and dividing, these
operations take the following amount of time:
 - open()+read()+close() of /sys/kernel/cpu_byteorder: 114us
 - access("/sys/kernel/cpu_byteorder", R_OK): 69us
 - riscv_hwprobe() vDSO and syscall: 13us
 - riscv_hwprobe() vDSO with no syscall: 0.07us

These numbers get farther apart if we query multiple keys, as sysfs will
scale linearly with the number of keys, where the dedicated syscall
stays the same. To frame these numbers, I also did a tight
fork/exec/wait loop, which I measured as 23ms. So doing 4
open/read/close operations is a delta of about 2%, versus a single vDSO
call is a delta of 0.0003%.

This being qemu rather than real hardware, the numbers
themselves are somewhat inaccurate, though the relative orders of
magnitude are probably good enough.

[1] https://public-inbox.org/libc-alpha/20230206194819.1679472-1-evan@rivosinc.com/T/#t
[2] https://pastebin.com/x84NEKaS

Changes in v3:
 - Updated copyright date in cpufeature.h
 - Fixed typo in cpufeature.h comment (Conor)
 - Refactored functions so that kernel mode can query too, in
   preparation for the vDSO data population.
 - Changed the vendor/arch/imp IDs to return a value of -1 on mismatch
   rather than failing the whole call.
 - Const cpumask pointer in hwprobe_mid()
 - Embellished documentation WRT cpu_set and the returned values.
 - Renamed hwprobe_mid() to hwprobe_arch_id() (Conor)
 - Fixed machine ID doc warnings, changed elements to c:macro:.
 - Completed dangling unistd.h comment (Conor)
 - Fixed line breaks and minor logic optimization (Conor).
 - Use riscv_cached_mxxxid() (Conor)
 - Refactored base ISA behavior probe to allow kernel probing as well,
   in prep for vDSO data initialization.
 - Fixed doc warnings in IMA text list, use :c:macro:.
 - Added | to description: to make dt-checker happy.
 - Have hwprobe_misaligned return int instead of long.
 - Constify cpumask pointer in hwprobe_misaligned()
 - Fix warnings in _PERF_O list documentation, use :c:macro:.
 - Move include cpufeature.h to misaligned patch.
 - Fix documentation mismatch for RISCV_HWPROBE_KEY_CPUPERF_0 (Conor)
 - Use for_each_possible_cpu() instead of NR_CPUS (Conor)
 - Break early in misaligned access iteration (Conor)
 - Increase MISALIGNED_MASK from 2 bits to 3 for possible UNSUPPORTED future
   value (Conor)
 - Introduced vDSO function

Changes in v2:
 - Factored the move of struct riscv_cpuinfo to its own header
 - Changed the interface to look more like poll(). Rather than supplying
   key_offset and getting back an array of values with numerically
   contiguous keys, have the user pre-fill the key members of the array,
   and the kernel will fill in the corresponding values. For any key it
   doesn't recognize, it will set the key of that element to -1. This
   allows usermode to quickly ask for exactly the elements it cares
   about, and not get bogged down in a back and forth about newer keys
   that older kernels might not recognize. In other words, the kernel
   can communicate that it doesn't recognize some of the keys while
   still providing the data for the keys it does know.
 - Added a shortcut to the cpuset parameters that if a size of 0 and
   NULL is provided for the CPU set, the kernel will use a cpu mask of
   all online CPUs. This is convenient because I suspect most callers
   will only want to act on a feature if it's supported on all CPUs, and
   it's a headache to dynamically allocate an array of all 1s, not to
   mention a waste to have the kernel loop over all of the offline bits.
 - Fixed logic error in if(of_property_read_string...) that caused crash
 - Include cpufeature.h in cpufeature.h to avoid undeclared variable
   warning.
 - Added a _MASK define
 - Fix random checkpatch complaints
 - Updated the selftests to the new API and added some more.
 - Fixed indentation, comments in .S, and general checkpatch complaints.

Evan Green (6):
  RISC-V: Move struct riscv_cpuinfo to new header
  RISC-V: Add a syscall for HW probing
  RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
  RISC-V: hwprobe: Support probing of misaligned access performance
  selftests: Test the new RISC-V hwprobe interface
  RISC-V: Add hwprobe vDSO function and data

Palmer Dabbelt (1):
  dt-bindings: Add RISC-V misaligned access performance

 .../devicetree/bindings/riscv/cpus.yaml       |  15 ++
 Documentation/riscv/hwprobe.rst               |  74 ++++++
 Documentation/riscv/index.rst                 |   1 +
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/cpufeature.h           |  23 ++
 arch/riscv/include/asm/hwprobe.h              |  13 +
 arch/riscv/include/asm/smp.h                  |  11 +
 arch/riscv/include/asm/syscall.h              |   3 +
 arch/riscv/include/asm/vdso/data.h            |  17 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  36 +++
 arch/riscv/include/uapi/asm/unistd.h          |   9 +
 arch/riscv/kernel/cpu.c                       |  11 +-
 arch/riscv/kernel/cpufeature.c                |  31 ++-
 arch/riscv/kernel/sys_riscv.c                 | 222 +++++++++++++++++-
 arch/riscv/kernel/vdso/Makefile               |   2 +
 arch/riscv/kernel/vdso/hwprobe.c              |  47 ++++
 arch/riscv/kernel/vdso/sys_hwprobe.S          |  15 ++
 arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/riscv/Makefile        |  58 +++++
 .../testing/selftests/riscv/hwprobe/Makefile  |  10 +
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  89 +++++++
 .../selftests/riscv/hwprobe/sys_hwprobe.S     |  12 +
 23 files changed, 692 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/riscv/hwprobe.rst
 create mode 100644 arch/riscv/include/asm/cpufeature.h
 create mode 100644 arch/riscv/include/asm/hwprobe.h
 create mode 100644 arch/riscv/include/asm/vdso/data.h
 create mode 100644 arch/riscv/include/uapi/asm/hwprobe.h
 create mode 100644 arch/riscv/kernel/vdso/hwprobe.c
 create mode 100644 arch/riscv/kernel/vdso/sys_hwprobe.S
 create mode 100644 tools/testing/selftests/riscv/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
