Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEFBC5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ndn+du74b6RYtqn3AaYl+hHS7LtQp5MIeMRa8cKZgbA=; b=Zo6agqWVHy5qcw
	aP2zVICusnd5yk1uX2x60+mQqzpPeIpzOIXqWC4UTly1JHmNpLEmXyuz6zOaohd3/6HvbVPKqk68M
	Q9BiuuCGOeUsI3lG/oyY2E6z+pILOo6C7S470Jp4MOsmmjLRC7AsKEZ2TO3a9V4zpR3QDsEJuUxg8
	duwrrvEfPeVHZakiLVYLxDIesdaaVh0e2l/2S/70vzWqlSPfJMZXzAXg/8duh1C/sqqW4Wq0tPv5Z
	QaUVuOQiYcuvMkAinOs4KHhq/IlYGArOlxcZkhG6P3qQZZalp9VkMsKL4m7VeXRV+1AyrDPguWc3P
	nqsfHbsG0JRIyUggGdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYg-0000000Dxm5-3Cdy;
	Wed, 28 Aug 2024 05:49:30 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYc-0000000DxkW-3PcG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7cd895682fcso2352275a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824166; x=1725428966; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUFbDMgjzsoT48Z/N2yqe2kry93QHxmitnGNSfp0h7M=;
        b=YjnqAgW2AXxB8gBsIKxOJOToH8FYLo47XMtNr6jyC0osrygVpTurCew9A5s4U8e+xk
         ar+D5rSQikd6jIKlwCLgERlm13yZq2MYWTTT0BZThBP5dEzlG0ykLEtFKzWOM1FJuvYH
         5ivcJtWjqyI4DzB0tbgMXjRy5qKvm1sncSGv0GROqMSxzFqAwqQFrxrXia73RC7ZkJdf
         BGQculbmimkOoWibnm+xCGFxQuDxjPa/ga1Sek285cuYlwzMJHyEZRTd0DYz9b18BxLv
         sfIa35bp9yggXX9L9rOC+YPdVgCXCIjL+CyyButSr8YjGoWe47pUkgNmeaWRe37G1Z4s
         imEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824166; x=1725428966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUFbDMgjzsoT48Z/N2yqe2kry93QHxmitnGNSfp0h7M=;
        b=icQTxZ7JdJMyuZka1DdMJn3PxRi8DmRZR26t26jq7dCLPk8MZReyCh55dON6KSvysz
         Uno/X71FmCF8gRFKoTBVTMxw0umuQMPSpdzMXS3v9vEfW1ttzIxMixGCeUVgMn40oxHz
         Mi8sp4rcJVXn7O4ufnA5fE4kLhuUnE2jqZUj7in2ra6MpxQxMSRW2Vi+f6xbCaapcX3w
         VhjB8h7/nofOJ2ZK52emJlme9mUsx7wSu7dg4jrwK1KgCEZW+XKYK8GcJ00GxTexg8Fb
         2Pa6pH+FFc2Kqln95ztnNtZFB+m/p/3b0ZDyH6cWev3Ind2nPhDd0IMrL5kFZ+458e8A
         4qmw==
X-Forwarded-Encrypted: i=1; AJvYcCU9m+2tWph8I5gKJOZ+cNTQKnqkEOxWBLYl5fxyqu+n9tzpwbVBRZGhr8M9ucN9djhsDtD43Wz4QqYfYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOfVmv89UpVccdzRe80EoLOg1gNt648vSPNmyHc4885XMl2Dfq
	xn3NrLBS3JtawnrA6vunSBzbCGE01+dUDiLML1Low40vvC4EvXbSfXfcfpnQq/E=
X-Google-Smtp-Source: AGHT+IF6T5IRS6PI9ffePkiTGEXwg74qwFWRmO3+h509ZqjZl31p2gGXC6rr0MOwZENhtWiyWe3S3w==
X-Received: by 2002:a05:6a21:78e:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cc8b49d8abmr14865175637.27.1724824165540;
        Tue, 27 Aug 2024 22:49:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Date: Tue, 27 Aug 2024 22:49:06 -0700
Message-Id: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFK6zmYC/x3MTQqAIBBA4avErBPSkn6uEhFmUw6UiUYF4d2Tl
 t/ivRcCesIAXfaCx4sCHTaB5xloo+yKjOZkEIWoikbUzKlTGwxswu24R0P2HPddOTbxcq5bhVx
 LCal2Hhd6/nM/xPgBQKT3MGkAAAA=
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6044; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rybnxgXRfasNksP5lSU1TnJeqx+66siNWRNOd7Jshtg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XSH3lM7XXzj5QFjW4OtX+60nZ+rMb1N2D9F5e2t+8
 tuSp8uiOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIkUMMf8WSWp0unDgcOEl5
 8kUJVXP5KYyTLI0KMiNvKmnOTI5taWBk2Cj+dkXn/qc3T0v2+U/SXhD+ZpOA/e/6H56BP2LNukr
 5GQE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224926_903671_A525ACC9 
X-CRM114-Status: GOOD (  19.87  )
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

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the maximum address space,
unless the hint address is greater than this value.

On arm64 this barrier is at 52 bits and on x86 it is at 56 bits. This
flag allows applications a way to specify exactly how many bits they
want to be left unused by mmap. This eliminates the need for
applications to know the page table hierarchy of the system to be able
to reason which addresses mmap will be allowed to return.

---
riscv made this feature of mmap returning addresses less than the hint
address the default behavior. This was in contrast to the implementation
of x86/arm64 that have a single boundary at the 5-level page table
region. However this restriction proved too great -- the reduced
address space when using a hint address was too small.

A patch for riscv [1] reverts the behavior that broke userspace. This
series serves to make this feature available to all architectures.

I have only tested on riscv and x86. There is a tremendous amount of
duplicated code in mmap so the implementations across architectures I
believe should be mostly consistent. I added this feature to all
architectures that implement either
arch_get_mmap_end()/arch_get_mmap_base() or
arch_get_unmapped_area_topdown()/arch_get_unmapped_area(). I also added
it to the default behavior for arch_get_mmap_end()/arch_get_mmap_base().

Link: https://lore.kernel.org/lkml/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/T/ [1]

To: Arnd Bergmann <arnd@arndb.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
To: Liam R. Howlett <Liam.Howlett@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: H. Peter Anvin <hpa@zytor.com>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Russell King <linux@armlinux.org.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
To: Alexander Gordeev <agordeev@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
To: Vasily Gorbik <gor@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Sven Schnelle <svens@linux.ibm.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Rich Felker <dalias@libc.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David S. Miller <davem@davemloft.net>
To: Andreas Larsson <andreas@gaisler.com>
To: Shuah Khan <shuah@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Charlie Jenkins (16):
      mm: Add MAP_BELOW_HINT
      riscv: mm: Do not restrict mmap address based on hint
      mm: Add flag and len param to arch_get_mmap_base()
      mm: Add generic MAP_BELOW_HINT
      riscv: mm: Support MAP_BELOW_HINT
      arm64: mm: Support MAP_BELOW_HINT
      powerpc: mm: Support MAP_BELOW_HINT
      x86: mm: Support MAP_BELOW_HINT
      loongarch: mm: Support MAP_BELOW_HINT
      arm: mm: Support MAP_BELOW_HINT
      mips: mm: Support MAP_BELOW_HINT
      parisc: mm: Support MAP_BELOW_HINT
      s390: mm: Support MAP_BELOW_HINT
      sh: mm: Support MAP_BELOW_HINT
      sparc: mm: Support MAP_BELOW_HINT
      selftests/mm: Create MAP_BELOW_HINT test

 arch/arm/mm/mmap.c                           | 10 ++++++++
 arch/arm64/include/asm/processor.h           | 34 ++++++++++++++++++++++----
 arch/loongarch/mm/mmap.c                     | 11 +++++++++
 arch/mips/mm/mmap.c                          |  9 +++++++
 arch/parisc/include/uapi/asm/mman.h          |  1 +
 arch/parisc/kernel/sys_parisc.c              |  9 +++++++
 arch/powerpc/include/asm/task_size_64.h      | 36 +++++++++++++++++++++++-----
 arch/riscv/include/asm/processor.h           | 32 -------------------------
 arch/s390/mm/mmap.c                          | 10 ++++++++
 arch/sh/mm/mmap.c                            | 10 ++++++++
 arch/sparc/kernel/sys_sparc_64.c             |  8 +++++++
 arch/x86/kernel/sys_x86_64.c                 | 25 ++++++++++++++++---
 fs/hugetlbfs/inode.c                         |  2 +-
 include/linux/sched/mm.h                     | 34 ++++++++++++++++++++++++--
 include/uapi/asm-generic/mman-common.h       |  1 +
 mm/mmap.c                                    |  2 +-
 tools/arch/parisc/include/uapi/asm/mman.h    |  1 +
 tools/include/uapi/asm-generic/mman-common.h |  1 +
 tools/testing/selftests/mm/Makefile          |  1 +
 tools/testing/selftests/mm/map_below_hint.c  | 29 ++++++++++++++++++++++
 20 files changed, 216 insertions(+), 50 deletions(-)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
