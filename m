Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC5BC52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CnZ94NL/bSTjL/A8Bus4a3o84UToIdgelp/YY0O24bM=; b=FWmwr15y+lo7gZ
	9E0W4TG9+M/19lhYhu+MoSQUdraBmUpFUXyjubeZc3trSm0HMZEfvPAoWWJ9HidOmlSnJiZj6OXKY
	1Cama97318wHak1wN2eS81Y83++pdu5yCkKKTb4pmxDuRNXmDZFi+crID/aBVfi7eqQ7nIxaft0Lx
	mOsquJAoCfbSQhui8PitA7nEOTTTChI0MZnNLpUIbZkCUcpTNX2zFL51Su1yuNfU6tJU0yq5cqkBi
	YKdJs1USOpNo4hU3F87xuSLLNUOLjpR1l0SzEPIm3/n+ZqTBgS2/fcTzGldmx+77htp/q4eVI1Tce
	h+TTxG2M/SKePzUl7WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAo9-00000006U59-3TVQ;
	Wed, 14 Aug 2024 10:00:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9nw-00000006IAv-08iV
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lmaS/ucUO4ax4xArhdHVTXE+tGzy8O1URFQiuKQW0B8=; b=jkhFf8B003QG2I8qjN8s8Yz/xt
	tRAcw+n1RUBKxvfslsIXAhnjeYgfyrANvYEnLRZjdZ8Od58IEK5kHM9YuR26vWW51E7ba19HrByMu
	7wK4QvZdMvSKiCE6jTH3ARvIfrFYMjfQTfpZb71PCC8IADHU3HQEFN72gsYbSQ4S0dm4pvOdnRmD8
	SW7B5NUFYRF/m4xHdqRrv6HCxrK3lAFar5jgNfSmVcNLDQYZ7IxZUcF1G6j3ipdCRySGEGCrIfqik
	JpK4cZgyPul5+rFoejzg66BPzZZctjJ6sP4JXXY2ecDZuFtQsw04jkYJOwptKHmA3+wyqQuNqfbvR
	m3qc8Ang==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9ns-00000007z9M-0JWY
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fd69e44596so4831025ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625780; x=1724230580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmaS/ucUO4ax4xArhdHVTXE+tGzy8O1URFQiuKQW0B8=;
        b=F4ALe6sZmPPTvzYSDrmr5eqF2k/qdFgpQkuqRtSRZd+eE1Wqgojvdp8PgrIZ3Znz/D
         /ayxzjGgPEaKNxXg4NU/4shv7pMedtQap/qIYc8iMGewyKcEC3Msige7AcSAzUsgMKPx
         GEwFH+0yLYbIZc+3Ys7nPqBBErg25tjF/LuDGSdTWYyvxwfSizm35ewdIqnajJupvx4Q
         s94JBDxqvpwbGGDM2kcOyJqvUVfGiM9zbYKRfS/FEhMz1LVMT25kYmXYsl4ztTRYRRKd
         dAGOa73oOCTNI7tE5wugaWisrR4x+YA3dBW3oJx7FECVxEHb8vyvU/JH/zDERqsP8uEP
         badw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625780; x=1724230580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmaS/ucUO4ax4xArhdHVTXE+tGzy8O1URFQiuKQW0B8=;
        b=Kf65H7v4IKtM0Vcf5OINUFUWx4iJ/Yyz/vUm2qaSgbYBWvgCmCwG/jfOr9mIWVDR6E
         lD8TYbZIbRwOTEP7kHE8g6vn9rH87jVylqy6WHGJVnI62AIuFxPN+xRTp9rilHnWH54K
         BXdpL4iN6FHGUwGpEXoX25J9jpOkDVyiIX8xORTZ/HRjBiZ4YIZXL7LwBuZwOHiMJ6Zk
         UHU62caYOgPhAnm5yhSfLP7y855AleDesYFwIEtlw/qpNfEBfAOW8DG0EbkX+nVpS5Bh
         aCCvUCkRriDB7h73qkgZCpTtL6pxqEWFa+FA8/x4ANVnkMjgGEs9jizeQLy5TaI2AdB0
         HLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHqeROZ9APx6LP1kdm3ufpYKIH+z/QJf7s74Od2o35uAk9+XcKDwAjQDZ/VIhTA1SVZshRAQzei6+4b4TiddceZ7+hK15XU4TkTbsHh25r
X-Gm-Message-State: AOJu0YzDxND2FrWkEGFATSfTEhdgywj/PO9gF/+HiU7yfMrMDorZrAaN
	qtxiEO0KBOZVkNNXrpbsrtT9KEt3LjwKlfRPBLnqZNrB+uFCipn+021YKBYNiaA=
X-Google-Smtp-Source: AGHT+IH1j+rcWR7Ja5u/brytrbI7rlDNEm3iDMni88s3lw2tXNH8pNxbcK4NC9zx6bdDjtDvIkOIow==
X-Received: by 2002:a17:902:da86:b0:1fd:8b77:998e with SMTP id d9443c01a7336-201d9a28d73mr22221125ad.29.1723625780442;
        Wed, 14 Aug 2024 01:56:20 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:20 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 0/7] kasan: RISC-V support for KASAN_SW_TAGS using pointer masking
Date: Wed, 14 Aug 2024 01:55:28 -0700
Message-ID: <20240814085618.968833-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095624_470317_5EE41614 
X-CRM114-Status: GOOD (  19.53  )
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

This series implements support for software tag-based KASAN using the
RISC-V pointer masking extension[1], which supports 7 and/or 16-bit
tags. This implementation uses 7-bit tags, so it is compatible with
either hardware mode. Patch 3 adds supports for KASAN_SW_TAGS with tag
widths other than 8 bits.

Pointer masking is an optional ISA extension, and it must be enabled
using an SBI call to firmware on each CPU. If the SBI call fails on the
boot CPU, KASAN is globally disabled. Patch 2 adds support for boot-time
disabling of KASAN_SW_TAGS.

The SBI call is part of the upcoming SBI Firmware Features (FWFT)
extension[2][3]. Since generic FWFT support is not yet merged to Linux,
I open-coded the sbi_ecall() in this RFC to keep this series focused.

With my RISC-V KASAN fixes series[4] applied, this implementation passes
all but one of the KASAN KUnit tests. It fails vmalloc_percpu(), which
also fails on arm64:

      ...
      ok 65 vmalloc_oob
      ok 66 vmap_tags
      ok 67 vm_map_ram_tags
      # vmalloc_percpu: EXPECTATION FAILED at mm/kasan/kasan_test.c:1785
      Expected (u8)((u8)((u64)(c_ptr) >> 57)) < (u8)0x7f, but
          (u8)((u8)((u64)(c_ptr) >> 57)) == 127 (0x7f)
          (u8)0x7f == 127 (0x7f)
      # vmalloc_percpu: EXPECTATION FAILED at mm/kasan/kasan_test.c:1785
      Expected (u8)((u8)((u64)(c_ptr) >> 57)) < (u8)0x7f, but
          (u8)((u8)((u64)(c_ptr) >> 57)) == 127 (0x7f)
          (u8)0x7f == 127 (0x7f)
      # vmalloc_percpu: EXPECTATION FAILED at mm/kasan/kasan_test.c:1785
      Expected (u8)((u8)((u64)(c_ptr) >> 57)) < (u8)0x7f, but
          (u8)((u8)((u64)(c_ptr) >> 57)) == 127 (0x7f)
          (u8)0x7f == 127 (0x7f)
      # vmalloc_percpu: EXPECTATION FAILED at mm/kasan/kasan_test.c:1785
      Expected (u8)((u8)((u64)(c_ptr) >> 57)) < (u8)0x7f, but
          (u8)((u8)((u64)(c_ptr) >> 57)) == 127 (0x7f)
          (u8)0x7f == 127 (0x7f)
      not ok 68 vmalloc_percpu
      ok 69 match_all_not_assigned
      ok 70 match_all_ptr_tag
      ...
  # kasan: pass:62 fail:1 skip:8 total:71
  # Totals: pass:62 fail:1 skip:8 total:71

I'm not sure how I'm supposed to hook in to the percpu allocator.

When running with hardware or firmware that doesn't support pointer
masking, the kernel still boots successfully:

  kasan: test: Can't run KASAN tests with KASAN disabled
      # kasan:     # failed to initialize (-1)
  not ok 1 kasan

If stack tagging is enabled but pointer masking is unsupported, an extra
change (patch 7) is required so all pointers to stack variables are
tagged with KASAN_TAG_KERENL and can be dereferenced. I'm not sure if
this change should be RISC-V specific or made more generic.

This series can be tested by applying patch series to LLVM[5], QEMU[6],
and OpenSBI[7].

[1]: https://github.com/riscv/riscv-j-extension/releases/download/pointer-masking-v1.0.0-rc2/pointer-masking-v1.0.0-rc2.pdf
[2]: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-firmware-features.adoc
[3]: https://github.com/riscv-non-isa/riscv-sbi-doc/pull/161
[4]: https://lore.kernel.org/linux-riscv/20240801033725.28816-1-samuel.holland@sifive.com/
[5]: https://github.com/SiFiveHolland/llvm-project/commits/up/riscv64-kernel-hwasan
[6]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
[7]: https://lists.infradead.org/pipermail/opensbi/2024-August/007244.html


Samuel Holland (7):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: sw_tags: Check kasan_flag_enabled at runtime
  kasan: sw_tags: Support tag widths less than 8 bits
  riscv: Do not rely on KASAN to define the memory layout
  riscv: Align the sv39 linear map to 16 GiB
  riscv: Implement KASAN_SW_TAGS
  kasan: sw_tags: Support runtime stack tagging control for RISC-V

 Documentation/arch/riscv/vm-layout.rst | 10 ++---
 Documentation/dev-tools/kasan.rst      | 14 +++---
 arch/arm64/Kconfig                     | 10 ++---
 arch/arm64/include/asm/kasan.h         |  6 ++-
 arch/arm64/include/asm/memory.h        |  8 ++++
 arch/arm64/include/asm/uaccess.h       |  1 +
 arch/arm64/mm/kasan_init.c             |  7 ++-
 arch/riscv/Kconfig                     |  4 +-
 arch/riscv/include/asm/cache.h         |  4 ++
 arch/riscv/include/asm/kasan.h         | 29 +++++++++++-
 arch/riscv/include/asm/page.h          | 21 +++++++--
 arch/riscv/include/asm/pgtable.h       |  6 +++
 arch/riscv/include/asm/tlbflush.h      |  4 +-
 arch/riscv/kernel/setup.c              |  6 +++
 arch/riscv/kernel/smpboot.c            |  8 +++-
 arch/riscv/lib/Makefile                |  2 +
 arch/riscv/lib/kasan_sw_tags.S         | 61 ++++++++++++++++++++++++++
 arch/riscv/mm/init.c                   |  2 +-
 arch/riscv/mm/kasan_init.c             | 30 ++++++++++++-
 arch/riscv/mm/physaddr.c               |  4 ++
 include/linux/kasan-enabled.h          | 15 +++----
 include/linux/kasan-tags.h             | 13 +++---
 include/linux/kasan.h                  | 10 ++++-
 mm/kasan/hw_tags.c                     | 10 -----
 mm/kasan/kasan.h                       |  2 +
 mm/kasan/sw_tags.c                     |  9 ++++
 mm/kasan/tags.c                        | 10 +++++
 scripts/Makefile.kasan                 |  5 +++
 scripts/gdb/linux/mm.py                |  5 ++-
 29 files changed, 255 insertions(+), 61 deletions(-)
 create mode 100644 arch/riscv/lib/kasan_sw_tags.S

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
