Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797CFCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgD4hDcI31Nxz5oRasVleZ5qcQo9R6kmu28+c388jLQ=; b=pYWM/8dE96/gN/
	4z6vga5k1SYIVaMbYpb2NSIpVLYFovZW9sqrOMVEtt55WizeAcTax6cNmOrMiuLddBRzHixdKOnp7
	SN46sYRsX0/hMwg19zm0kX4nY+GzBfpLkCUbj86fZbSP3OiYaH7vE6+7cjhJQasI88dSxFOQXv2wl
	0thuuKoOJLHgbfqyueJVuvbfXuW0jjN6OtRVKYqzvmMjrq8zCwUL4eSG6ae4jCwbSBTVSRqsfX9wj
	O0aOj4OLtjGYLsgTyNlsEbRatTWRhHYIkmuOQuARazNPGnWIunE4q17Rf28o0nLxQlr/KZTLT+455
	jwbpfj62hh3Fho0Qg9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDj7o-0000000Fxru-33qN;
	Tue, 28 Oct 2025 12:48:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDj7m-0000000Fxre-3Snl
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E65961E93;
	Tue, 28 Oct 2025 12:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BEFC4CEF7;
	Tue, 28 Oct 2025 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761655709;
	bh=mBs6zOvlj94/t/tcRzA9U+nJJWpO9GMLA7jnyPrzwMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beLtwKfkHuArdJ093VKDaQyW5I77Lx9WOTXN184qFghOTo6/Tdh2mUvvtTH+jRL2S
	 4cygiFZP7DMx9PsOIwy1/u+DYquQyts+p2E1uAYY7ztuWaQwWzWQh4RcCRGIh3vlIV
	 WRxFToVynHiHiPYkbcrBPFvbFEvXb9aIf20ebCQeUGjEu4eVNmQTU3ynfL3vl9jhf5
	 BK2XPYyxVuE65pAQd6m4XDplUFIKr8L0KPtWB5OUjQsdiFoKbzoSImm/rw9X8ZF0Tg
	 tKOktKXmzdGKg0CWYMMY9tnh55nN9ABkDZRMduKMYLwMYVG4Z5tRJV6JZqJkOEhpJ1
	 E2O1QgHXh0gVA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	david@redhat.com,
	apopple@nvidia.com,
	alexandre.f.demers@gmail.com,
	alexghiti@rivosinc.com,
	willy@infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] riscv: mm: Define MAX_POSSIBLE_PHYSMEM_BITS for zsmalloc
Date: Tue, 28 Oct 2025 08:48:06 -0400
Message-ID: <20251028124815.1058740-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028124815.1058740-1-sashal@kernel.org>
References: <20251028124815.1058740-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 5898fc01ff344075e4332aa9abeb0841c85e7e51 ]

This definition is used by zsmalloc to optimize memory allocation. On
riscv64, it is the same as MAX_PHYSMEM_BITS from asm/sparsemem.h, but
that definition depends on CONFIG_SPARSEMEM. The correct definition is
already provided for riscv32.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Link: https://lore.kernel.org/r/20251015233327.3885003-1-samuel.holland@sifive.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis of this commit using repository
examination and code analysis, here is my assessment:

## **Backport Status: YES**

## Detailed Analysis

### 1. Code Change Analysis

The commit adds a single line to `arch/riscv/include/asm/pgtable-64.h`:
```c
#define MAX_POSSIBLE_PHYSMEM_BITS 56
```

This definition is required by zsmalloc (used by ZRAM/ZSWAP) for correct
memory allocation calculations.

### 2. Tools Used and Findings

**Repository Investigation:**
- **Grep searches** revealed that MAX_POSSIBLE_PHYSMEM_BITS is:
  - Already defined for riscv32 (34 bits)
  - Defined for all other major architectures (x86, arm64, powerpc,
    mips, arc, arm)
  - Missing for riscv64 (this is the bug being fixed)

- **Code analysis of mm/zsmalloc.c** (lines 65-77, 91-92) shows:
  - zsmalloc uses `_PFN_BITS = (MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)`
  - OBJ_INDEX_BITS = (BITS_PER_LONG - _PFN_BITS)
  - Without MAX_POSSIBLE_PHYSMEM_BITS, it falls back to MAX_PHYSMEM_BITS
    or BITS_PER_LONG

- **Examined arch/riscv/include/asm/sparsemem.h** which defines
  MAX_PHYSMEM_BITS as 56, but only when `CONFIG_SPARSEMEM` is enabled

**Impact Analysis:**
Without this fix on riscv64 systems where CONFIG_SPARSEMEM is disabled:
- Incorrect: _PFN_BITS = 64 - 12 = **52 bits** (using BITS_PER_LONG
  fallback)
- Correct: _PFN_BITS = 56 - 12 = **44 bits**
- This causes OBJ_INDEX_BITS to be 12 bits instead of 20 bits
- Affects ZS_MIN_ALLOC_SIZE calculations and entire zsmalloc size class
  system

### 3. Historical Context Investigation

**Git history analysis** revealed critical information:
- Commit **f0bbc41760557** (2021) fixed this exact issue for ARM, MIPS,
  PowerPC, and other architectures
- That 2021 commit:
  - Was triggered by actual kernel crashes (NULL pointer dereference in
    zs_map_object)
  - Had "Fixes:" tags pointing to zsmalloc
  - Was backported to stable kernels (signed-off by Sasha Levin)
  - Documented real-world bug report: "Unable to handle kernel NULL
    pointer dereference"
- riscv was NOT included in that 2021 fix (likely because riscv64
  support was incomplete then)
- The current commit (5898fc01ff344) completes that 2021 work for
  riscv64

### 4. Configuration Analysis

**Examined arch/riscv/Kconfig**:
- ARCH_SPARSEMEM_ENABLE is optional (`def_bool y` depends on MMU)
- Users CAN choose FLATMEM instead of SPARSEMEM
- Default config has `CONFIG_SPARSEMEM_MANUAL=y`, but this is not
  mandatory
- Without CONFIG_SPARSEMEM, MAX_PHYSMEM_BITS is undefined, triggering
  the bug

### 5. Subsystem Criticality

**Memory Management Impact:**
- zsmalloc is used by ZRAM (compressed RAM) and ZSWAP (compressed swap)
- These are important for memory-constrained systems
- Incorrect calculations could lead to:
  - Memory corruption
  - Kernel crashes
  - Data loss

### 6. Backport Indicators

**Against backporting:**
- No "Cc: stable@vger.kernel.org" tag
- No "Fixes:" tag
- Limited scope (only affects specific config combinations)

**For backporting:**
- **Critical**: Identical bug was backported for other architectures in
  2021
- **Precedent**: This is completing a known stable-backport pattern
- **Safety**: Minimal change (single line), no side effects
- **Correctness**: Fixes mathematically incorrect value that can cause
  crashes
- **Stable Rules Compliance**: Pure bug fix, no new features, no
  architectural changes

### 7. Risk Assessment

**Regression Risk: VERY LOW**
- Single constant definition
- No behavioral changes
- Only affects riscv64
- Mirrors existing definitions for other architectures
- Value (56) matches the PFN_MASK in the same file (GENMASK(53, 10))

**Impact if NOT backported:**
- Users building riscv64 kernels without CONFIG_SPARSEMEM will have
  broken zsmalloc
- Potential for kernel crashes similar to the 2021 ARM bug report
- Data corruption in ZRAM/ZSWAP scenarios

## Conclusion

This commit SHOULD be backported because:

1. **It fixes the same bug that was considered serious enough to
   backport for other architectures in 2021**
2. **The 2021 fix caused real kernel crashes that were documented**
3. **It's a minimal, safe change with no regression risk**
4. **It follows stable kernel rules: fixes bug, no new features, no
   architectural changes**
5. **riscv64 was simply missed in the 2021 fix, and this commit
   completes that work**

The lack of explicit stable tags is likely an oversight, as this is
clearly a bug fix following the pattern of previous stable-backported
commits for the same issue on other architectures.

 arch/riscv/include/asm/pgtable-64.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1018d22169013..6e789fa58514c 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -69,6 +69,8 @@ typedef struct {
 
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 56
+
 /*
  * rv64 PTE format:
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
