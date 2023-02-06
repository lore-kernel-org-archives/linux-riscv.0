Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DDAC05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCt0gTmAF16bf6tbTVTX8KrjaQ4aXb0gzo2SjF9T8wE=; b=xJ/tPDcvHOx4qf
	hmvNF8T9sin/6NA1lowJoZFp+pHrUYvaT9epaFWLMbFpvcw1VGEDJBn0C7G/f/t4dFt+UUqoMhokl
	yefCVrO7+KSPXWhB3Mqvq1OKVRy91ON6lq48PgjUcscl/1Pi/wsn0xpKC6vTtfD1u2drZQ2Q9oqrL
	XhVboM3iDgnD8qMZsOldO3Me+4uK4+Fs28OeTLLWhnmHcYhuHRYTS6thVPrEFU3i6xroaH+bwPCsx
	TtB63cwCykiyfSXhbFWDRJx8qJdiK+kV8DUDKqjbNx/qncTQWwWTdQYIg+8RniE2KzaIdbA7Mnh/Z
	oidJh1WPZVjxxswX6WEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tc-009oWV-E6; Mon, 06 Feb 2023 20:15:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tW-009oUM-31
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:15:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id mi9so12713255pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 12:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MxVFygB+s6JhMTYYGUwxJSOFTRuFYcBJHXW1ILzDh4s=;
        b=dE/VgE4aiAPBGl3Wx3OM4FAd+oDs1q+MILDu2tmzY7z0mFl5OEXDRMVxfXg36LlJR4
         O37G+Sc9qsM73DZ6nVYZtk0JZjLjeCKvw508klbl6ceZfF/4+s0Xo1D3IzwG7DR30VZk
         sUOhCVVQY+C9X7zCHFCJVXNAvdaEPzVap90KA4Tx8rQ7acUt6zG2EPRvFgMW+u/twjhs
         JSNaoNn+nD0Oq2dkRB3C17Xjqz3FibkAfDEe6jG4HXEtn+wcMnYsEX2yzjnRhPfoJQMp
         gbYbcnxByjshQW9jsnB0IGo7JlzYKzHY3DiGIDVU0QMyGNGWztrFxwVigcUvyHNg4rGX
         Tj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxVFygB+s6JhMTYYGUwxJSOFTRuFYcBJHXW1ILzDh4s=;
        b=0yEGB76WfWgvnLN/qRlvlojd7/au3+UHoOujGMceibKuytwREq12tI6SwDfXgdFARF
         moA1VKOg+3A5cc3NJyDZnKmurbAdLlJbnQvQqOc7nGUvShgVzLD1LZ3uOcdYRt0Snqyd
         sCM16OLD3XhaIxPIt/HkSK73FyamwYD+IOVf3idsUgYRlRR549kA9oFXL+hCzmorkEBa
         vGh/iK885SZYbkhrAc9MPP2kc3iU96OO2L3HZjKzlvIgzAS40gn4/PbH1HR4dZlfjuT1
         1WUPP1zBM58Z9RKhloLBnUX8RHHW0H6XwR8Q84NlY16hWjJTqGu+kySMzKyeaR+8mDNl
         QmWQ==
X-Gm-Message-State: AO0yUKW5Yj67JHST4uYZJmXjGglXLU2Q59N8VMowPCc5qm155dxe73h5
	z372nMUCl1YdeGvwk2txBfuoDg==
X-Google-Smtp-Source: AK7set97KVIZp2KqBRd3V9YN6e2IalxIwrU2sjpVKl1CrB2R7mS0EHe5J+f4YiuXO1YRqBuyZB8O/A==
X-Received: by 2002:a05:6a20:e413:b0:c0:c905:7b23 with SMTP id nh19-20020a056a20e41300b000c0c9057b23mr290481pzb.48.1675714515334;
        Mon, 06 Feb 2023 12:15:15 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:14 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 0/6] RISC-V Hardware Probing User Interface
Date: Mon,  6 Feb 2023 12:14:49 -0800
Message-Id: <20230206201455.1790329-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_121518_143475_DD612466 
X-CRM114-Status: GOOD (  28.21  )
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
Cc: heiko@sntech.de, Jisheng Zhang <jszhang@kernel.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, Bagas Sanjaya <bagasdotme@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, linux-kselftest@vger.kernel.org, slewis@rivosinc.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, dram <dramforever@live.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Guo Ren <guoren@kernel.org>, Dao Lu <daolu@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


These are very much up for discussion, as it's a pretty big new user
interface and it's quite a bit different from how we've historically
done things: this isn't just providing an ISA string to userspace, this
has its own format for providing information to userspace.

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

The actual user interface is a syscall.  I'm not really sure that's the
right way to go about this, but it makes for flexible prototying.
Various other approaches have been talked about like making HWCAP2 a
pointer, having a VDSO routine, or exposing this via sysfs.  Those seem
like generally reasonable approaches, but I've yet to figure out a way
to get the general case working without a syscall as that's the only way
I've come up with to deal with the heterogenous CPU case.  Happy to hear
if someone has a better idea, though, as I don't really want to add a
syscall if we can avoid it.

An example series in glibc exposing this syscall and using it in an
ifunc selector for memcpy can be found at [1].

[1] https://public-inbox.org/libc-alpha/20230206194819.1679472-1-evan@rivosinc.com/T/#t

Changes in v2:
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

Evan Green (4):
  RISC-V: Move struct riscv_cpuinfo to new header
  RISC-V: Add a syscall for HW probing
  RISC-V: hwprobe: Support probing of misaligned access performance
  selftests: Test the new RISC-V hwprobe interface

Palmer Dabbelt (2):
  RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
  dt-bindings: Add RISC-V misaligned access performance

 .../devicetree/bindings/riscv/cpus.yaml       |  15 ++
 Documentation/riscv/hwprobe.rst               |  66 ++++++
 Documentation/riscv/index.rst                 |   1 +
 arch/riscv/include/asm/cpufeature.h           |  23 +++
 arch/riscv/include/asm/hwprobe.h              |  13 ++
 arch/riscv/include/asm/smp.h                  |   9 +
 arch/riscv/include/asm/syscall.h              |   3 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  35 ++++
 arch/riscv/include/uapi/asm/unistd.h          |   8 +
 arch/riscv/kernel/cpu.c                       |  11 +-
 arch/riscv/kernel/cpufeature.c                |  31 ++-
 arch/riscv/kernel/sys_riscv.c                 | 192 +++++++++++++++++-
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/riscv/Makefile        |  58 ++++++
 .../testing/selftests/riscv/hwprobe/Makefile  |  10 +
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  89 ++++++++
 .../selftests/riscv/hwprobe/sys_hwprobe.S     |  12 ++
 tools/testing/selftests/riscv/libc.S          |  46 +++++
 18 files changed, 613 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/riscv/hwprobe.rst
 create mode 100644 arch/riscv/include/asm/cpufeature.h
 create mode 100644 arch/riscv/include/asm/hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/hwprobe.h
 create mode 100644 tools/testing/selftests/riscv/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
 create mode 100644 tools/testing/selftests/riscv/libc.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
