Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB467D3C922
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Kfd+cFTvyaL+IIgl40eeGai4VNeM2gDu9QzZjqUrjE=; b=qJxFxhRggxaGqi
	jo1Hosf/HTfzoCGeHVryQAPOWcgj3++AtuiMa2zLApwHyCYqO5Tx9duczJkjSYndgcbA0d4BNvFUY
	BtaGCutym2/4Rv0ljctVrPPvJUQoanSAeQrEBno8P3fWT3QRp/T8IZS18bCIKQT53zc92xoa2Xz5J
	cIX4Qzaz8n1ksiA3X7Crsu7b54CrYzyjfNiOwvGIDtQJoPfZqA7ii3/0DGksrdwWD2HxcO+yruP9x
	1Ug+CNbmbDKw4xzSO4DWs3hL+HSw6K54Dta28nb2+AaJsmdjoOtPmTNRRG7zc55Gs7wUYcyrJP5GW
	paoLKq0Xy4aqY2MNwbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMp7-0000000FbyK-0OMv;
	Wed, 10 Dec 2025 16:13:53 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMp4-0000000Fbxi-0jYh
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:13:51 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-11b6bc976d6so1441065c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383229; x=1765988029; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+4BuqMxZsml/T3w00f03pRuV/LUORx/SyQCTY0UnL0=;
        b=BAimysztPHfyis3TtwlsKPV2EVHDRn+DKyn8Zqw2dpQ7AqyaM5V+cOVgiiz0JeMgYi
         uwkfpUmohicOHn3u0xESvrcV06fFwB0SDHhnUVQfO9VQ9Vwtx1IEYVlxtMjGnii33XM+
         gHXDnaNpf+CeWL0kH/KUzMuIeVahmvHuLd337OqOWGJ7kb/jDlBFWPl28zjmYR0uqELs
         vqlSQRFthHssNAya2uJuUnp2LeSJmyZlZUEobiI9susi9Z2wCjlCHO9zjheTXXxtxXbK
         kwqXjfthtAoalo7uVZKgyw02Av8op3V0kQaFi1NT+Xco3hQOzakSJefRu1muDydqBuaO
         MvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383229; x=1765988029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+4BuqMxZsml/T3w00f03pRuV/LUORx/SyQCTY0UnL0=;
        b=i7nrXvTfV6/fXlQ7BNe9TM+FQmmYdhOh9OE1A2eGa6+cTNJhPtdF0YW48L7bsB2cpI
         y0BlVhGn6uuphjDDs8xidGLn9lfcQ2GSomyai88ya73hCABADUrJ7Cuj3bkKo62EAlTi
         rmcGmqsO+dELzdHuwwZkGCq9RJZhKlfXWGEjKta6TGVXVZ+GozIcBENPgTCkg5acVGPH
         u/2VgUbx1C/AQ8rojHD6rpXu0PZBnpilXFi+NXnA0Av8gg7to2rmhL4NCKUj+q8I1EO1
         +d7K54sVPBrDsBwChlqjOGbcrKILbe9DedaxjG/NjO6YNxM2fWg8bLyNmOrexgzhnWd4
         wQ2Q==
X-Gm-Message-State: AOJu0Yw8Wpy8c2ywx0UgcjAhnwMQ/K6f5ybghMmFmDWtBgzmUM+PkEop
	krZaYSw/wKi26z5N/ztR1a3gicwBSf6+k6xp2uh7nQTkxjlX++DMLAIyk8puMFwgFuE=
X-Gm-Gg: ASbGncvgYmVrXltXfCzp7m8a+/+N3Mnl5S97pHyIAd89KCmElix8DuowcWPpy8Y36VC
	pvdPL0pWsz/FmYMuq8YYmjrCpwHD84Ka85ATYU8ae32tMezBaGKCxVk0Q3nNMIzQYjvmwshfEsm
	HmdHy4w853c+rhz6aVStpZkm73uf/TvxPLImm41soxBH3gJakRaNHdqFhVJW2ewJovVLqmXqwsn
	k2s9m+HRYgpYDHuIbDx8OwiDn0I+Iv1y24+e0f1qK5sKXLdfK4lDT+PKY5HrjJhLTHB3PRWMfJu
	qamd9/y39FjdsvUs+7TYB/HjVLirn0lUIkS9nF/f/F06bqG13rWYFqU/s1McK/j2rDveenltSBk
	MZQ3mwQR+/dmTJfgDX38V1hZ8JlwktYYJUcqaJyh1NMa35dC+5gbQPrpEv9G168dD8mXNzinee7
	Px7XFCvQdEZPUrRN+CaNNEC/OcwsN0S8Cp1ePteieqI2zkR/KgDXp/u63fzFb/cYDvhABAlZWlJ
	irzE6UT7uDI
X-Google-Smtp-Source: AGHT+IFdYa9h0jkY9yGKX56u4TyHn7iUic2XinmYLur7oHcnTo1ydlnzMulcXWIhsW1apYu4kgDp8w==
X-Received: by 2002:a05:7022:3845:b0:11b:ade6:45c7 with SMTP id a92af1059eb24-11f293b6807mr2519650c88.3.1765383228597;
        Wed, 10 Dec 2025 08:13:48 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:13:48 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH RFC 00/10] riscv: Add support for rva23
Date: Wed, 10 Dec 2025 08:13:37 -0800
Message-Id: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADKcOWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3YKi/LTMnNRiXcvkZDPjVCPLRMsUSyWg8oKi1LTMCrBR0UpBbs5
 KsbW1AAQ7ZHNfAAAA
X-Change-ID: 20250616-profiles-9cc63e29a9d9
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=5445;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=oDpw19AYDhsKPqwE33ZOXFntcgHiTkEc0I/reT1h7bY=;
 b=9G4zeg8W+7TphoTpqoxfI/PgUdvZNYbekQnflf1mLkM4AKNenR5ilmOFJ6ItRvna9a0yuzgdZ
 EYeDyKYuM8vAv8LEIyhjdto0y2zVQXfMH3AA3dyJCmGedWKZu+X8M+p
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081350_374068_C6CE9399 
X-CRM114-Status: UNSURE (   9.70  )
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

I will be talking about rva23 at Plumbers this year and have this series
as a draft of my ideas.

rva23 is a RVI profile to group together extensions that are expected to
be found on high-performance systems.

This series:
1. Introduces a framework to add extensions to the kernel cflags
2. Adds a rva23 config option 
3. Optimizes riscv_has_extension_*

This is based on 6.18 plus
https://lore.kernel.org/linux-riscv/20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn/.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Charlie Jenkins (10):
      riscv: Standardize extension capitilization
      riscv: kconfig: Reorganize extensions
      riscv: kconfig: Simply arch selection
      riscv: kconfig: Make extensions tristate
      riscv: kconfig: Add zve32x
      riscv: Makefile: Add enabled extensions to compiler flags
      riscv: kconfig: Make vendor extensions tristate
      riscv: Optimize cpufeature macros for extension assumptions
      riscv: kconfig: Add rva23 config
      riscv: csum: Remove inline assembly

 arch/riscv/Kconfig                                 | 340 +--------------
 arch/riscv/Kconfig.extensions                      | 485 +++++++++++++++++++++
 arch/riscv/Kconfig.vendor                          |  25 +-
 arch/riscv/Makefile                                | 136 +++++-
 arch/riscv/include/asm/arch_hweight.h              |   4 +-
 arch/riscv/include/asm/archrandom.h                |   2 +-
 arch/riscv/include/asm/asm-prototypes.h            |   2 +-
 arch/riscv/include/asm/barrier.h                   |   2 +-
 arch/riscv/include/asm/bitops.h                    |   8 +-
 arch/riscv/include/asm/checksum.h                  |  32 --
 arch/riscv/include/asm/cmpxchg.h                   |  14 +-
 arch/riscv/include/asm/cpufeature-macros.h         | 136 ++++--
 arch/riscv/include/asm/cpufeature.h                |  42 +-
 arch/riscv/include/asm/hugetlb.h                   |   2 +-
 arch/riscv/include/asm/hwcap.h                     |  18 +-
 arch/riscv/include/asm/kgdb.h                      |   2 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h           |   2 +-
 arch/riscv/include/asm/mmu.h                       |   2 +-
 arch/riscv/include/asm/mmu_context.h               |   4 +-
 arch/riscv/include/asm/page.h                      |   2 +-
 arch/riscv/include/asm/pgtable-64.h                |   2 +-
 arch/riscv/include/asm/pgtable.h                   |   6 +-
 arch/riscv/include/asm/processor.h                 |   2 +-
 arch/riscv/include/asm/simd.h                      |   2 +-
 arch/riscv/include/asm/swab.h                      |   2 +-
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/asm/uaccess.h                   |   2 +-
 arch/riscv/include/asm/uprobes.h                   |   2 +-
 arch/riscv/include/asm/vector.h                    |   7 +-
 arch/riscv/include/asm/vendor_extensions.h         | 113 ++---
 arch/riscv/include/asm/xor.h                       |   2 +-
 arch/riscv/kernel/Makefile                         |   6 +-
 arch/riscv/kernel/cpufeature.c                     |  38 +-
 arch/riscv/kernel/head.S                           |   2 +-
 arch/riscv/kernel/kgdb.c                           |   2 +-
 arch/riscv/kernel/pi/archrandom_early.c            |   1 +
 arch/riscv/kernel/probes/decode-insn.c             |   2 +-
 arch/riscv/kernel/probes/uprobes.c                 |   2 +-
 arch/riscv/kernel/process.c                        |  10 +-
 arch/riscv/kernel/ptrace.c                         |  12 +-
 arch/riscv/kernel/signal.c                         |   2 +-
 arch/riscv/kernel/suspend.c                        |   8 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   4 +-
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S |   6 +-
 arch/riscv/kernel/vendor_extensions/Makefile       |  22 +-
 arch/riscv/kvm/tlb.c                               |   2 +-
 arch/riscv/kvm/vcpu.c                              |  10 +-
 arch/riscv/kvm/vcpu_onereg.c                       |  22 +-
 arch/riscv/kvm/vcpu_vector.c                       |   2 +-
 arch/riscv/lib/Makefile                            |  14 +-
 arch/riscv/lib/csum.c                              |  94 ----
 arch/riscv/lib/strcmp.S                            |   2 +-
 arch/riscv/lib/strlen.S                            |   2 +-
 arch/riscv/lib/strncmp.S                           |   2 +-
 arch/riscv/lib/uaccess.S                           |   4 +-
 arch/riscv/mm/hugetlbpage.c                        |   2 +-
 arch/riscv/mm/pgtable.c                            |   2 +-
 arch/riscv/mm/tlbflush.c                           |   2 +-
 arch/riscv/net/bpf_jit.h                           |   2 +-
 drivers/perf/Kconfig                               |   2 +-
 drivers/perf/riscv_pmu_sbi.c                       |   3 +-
 lib/crc/riscv/crc-t10dif.h                         |   2 +-
 lib/crc/riscv/crc32.h                              |   8 +-
 lib/crc/riscv/crc64.h                              |   4 +-
 lib/raid6/Makefile                                 |   4 +-
 lib/raid6/algos.c                                  |   4 +-
 66 files changed, 961 insertions(+), 749 deletions(-)
---
base-commit: 537904d2226574c759e51bdf301ca8a90d0fdce1
change-id: 20250616-profiles-9cc63e29a9d9

Best regards,
-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
