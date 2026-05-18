Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C83ECD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2geexhi+wcm9EQpZjJXHCxvElDgE+1XsqNkDfo4qQuw=; b=XoldkSvUR2MCA/
	qZ7Pwk4IJx+IJnI3749Lcsb6BVaL0RpdJQaBT3rVtWzk32Z63D1DMkUwD7IbwaOBvIqe5CiAd8Sho
	RC4yhS34twXorOFXYHDs+te3kipdWeflQQ6o+87I1JpaBY13+p+2AHAKZL+zkHbRM/Ji1UgywwBSA
	EwcdkkzAFZoif/lmMA7dMABda9rctt0NuZ2eaBDJta+/vhTCbV2bOjqyCmB+2iuT7J/Dr6YP4xQbu
	fFzTkUgJSTbUweNo4kheeCC/xrd6dO3W1DUswk+0xcuUwXQSdXbCmNKN8ub0eEZdf8hq2HvHHf5ih
	q95Wx9/lAQeYsksJAfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxnz-0000000FmKw-197J;
	Mon, 18 May 2026 13:14:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxnw-0000000FmJh-1rkB
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 13:14:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso19096575e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110082; x=1779714882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2W8Kh26zpmPW+LCobCj4WL6hHrjmrN7QEdZmG2gns4=;
        b=jqaiU9TIwCAZ3l8oYV5WNgqitdm8mMUEZWk+9XJgDyvaDmkk9VAv5k5sxVv4J+PSgy
         UcXE3GOSZckR7LREwlxxtS+ktnX1Ep579VhxnoxxK6qGG9PkSIZ8NhnCV6n0MYt9NM0x
         9FknaBuj6OFqvGaI36ES0fRVLW7vTvKWNviQab8h7xVh0HJrhSJiQfY/7b+GK9jiMBFh
         ziBu3hzsRcRkG7+gMYWSDH7GOsDKXxJEFRHDuDPqjWI4+r2oxkNXWynHegLHtER06+5/
         HbALswB7Bl+uKe+9SQHWpRIipADy9x/eGRbmBIrY9OgTlxLSj1ziGorAVVuNXufsm4kX
         O5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110082; x=1779714882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2W8Kh26zpmPW+LCobCj4WL6hHrjmrN7QEdZmG2gns4=;
        b=imOxpZ2EjdMRa6dMaxkudCRJukcb1YwvpXm4nD22MCiuvEc2ImT+rQ2O2oK/N6nRHF
         Llj1ojFyGd/28W1jaHxVjY8ja2YWujYIYRBG6puI8Rm0U6X/lApEWxGLNNWnm4LILKRW
         a0dGvcAFoEvXy33d7Hdf5W83zLFRVBcYDPyt/Yqr9gy+OiqLq7MzIWAA4esSwaLci5ET
         jxLBwaniqFk/qAYiqkDibYy7kpOCiXidS7/JuZ1gZmQruwW9EnI/M3v/Uo0fYLNZzyKq
         K3P0HNTtqM6sRhHgTzyNZ6HH+ktIG7XDEJYhsxOOTgBvDY8S6Ur34RVd40Y3pFkuplom
         NjAw==
X-Gm-Message-State: AOJu0YwugOLkOH3NtX/FIOxXzlErYzJAN2Ij7lLaIFO1tW1tmC2QG/Rq
	nV/XbtZO+IB18mv3k2oC1Cv+D+nIp8vpv8gjgGAfVll+G4iTB18zTxGTs55htX7L
X-Gm-Gg: Acq92OEEyYa3lSoK00iLhWcBzCoVMWNqtNEP9xMJECuTYbyotGmR6wp7FYmBQFgxJQe
	LBNUfT4fC8AbvxjdA2XRvqpsRbt+tmWZOY07EX41QtxZcMNR0u0JLV4wEsQv3VjR28kdfoDltiE
	ud93rmWbQowHFemXrx+pHbZA7JlTmDliv85YAO+SCQ3WWfUBFqgLXnLPNzEQuHWtPSNYt8VX8o9
	VMKjnB8H1GwnrBajwBwc7kH47lcAVs6LU068JzE+k4OwR/49OhFeltScf3avxRKImXptq33b+cB
	HXYYAORtmdNvRvnzVAHs2b2RQIn96zioA2Pv73B7f9nvFFaJd+EdfBHoXx0U3IKGauiJyrX7IHO
	4YLQQVeOtDCUm/ciS6D/iocZOospqn3gGelUKvKYuauHZNV4L0ceEPh9pOeZItZtKciUHunQ1U2
	ekAs2A8s6CoSMLwwtup58jR4aN2cIyYyXNpb4u3DjP
X-Received: by 2002:a05:600c:4f8a:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48fe62f8c6bmr230536955e9.24.1779110082062;
        Mon, 18 May 2026 06:14:42 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([95.86.49.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm249619265e9.9.2026.05.18.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:14:41 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v4 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Mon, 18 May 2026 15:14:05 +0200
Message-ID: <20260518131407.1026049-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_061444_519100_20697C72 
X-CRM114-Status: GOOD (  10.70  )
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

This v4 series introduces an optimized RISC-V memcmp() implementation 
and extends the KUnit string tests to cover both functional correctness 
and benchmarking of memcmp().

The memcmp() implementation incorporates review feedback from earlier 
versions. It features improved alignment handling, optimized loop 
structures, efficient use of the Zbb extension, and ensures overall 
correctness.

The KUnit updates provide comprehensive memcmp() test coverage and a 
benchmark mode. This v4 specifically fixes a build error regarding an 
undeclared function call (STRING_BENCH).

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v4 changes:
    - Fixed build error: call to undeclared function 'STRING_BENCH'
    - Link to v3: https://lore.kernel.org/all/20260515141019.1234037-1-milant2002@gmail.com/

v3 changes:
    - Split memcmp benchmark into wrapper (string_bench_memcmp) and worker
      function (do_string_bench_memcmp).
    - Removed all C99 mixed declarations; moved all variable declarations
      to the top of each function.
    - Converted len, iterations and loop counters in the benchmark to u64
      to avoid implicit casts.
    - Cleaned up spacing, indentation and minor style issues.
    - Added #if defined(CONFIG_RISCV_ISA_ZBB)... in  memcmp.S
    - Link to v2: https://lore.kernel.org/all/20260514121359.931999-1-milant2002@gmail.com/

v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Fixed KUnit build failures for Clang and non-benchmark configs.
    - Link to v1: https://lore.kernel.org/all/20260512141007.1193033-1-milant2002@gmail.com/

Milan Tripkovic (2):
  riscv: lib: add memcmp() implementation
  lib/string_kunit: extend benchmarks and unit test to memcmp()

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 125 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 120 ++++++++++++++++++++++++++++++
 5 files changed, 252 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
