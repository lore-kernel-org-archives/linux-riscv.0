Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB2C10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJ9JHwfbfTR8s1U5yXBxoggb5BZ6GKeII/Bs6gGJFUQ=; b=D7138fpvvIEFC3
	hC+pEBHnzALP171swc4XyyH21izJmZPjbBckuhncv6NUsgzWC5BIQrdHeWtIZl0IlRlx+irD/dY4g
	KaWUSEFC+0xDLVctuswoIE4JS9kj3mIsWh7YrkOnol8+vPDsaW2QlhRqlb8junUujjFpmUMUxa/0I
	GKLgXV72yTebFqO85E58tpABDU+FspgZ+ZyYRHoW41SKJuGqQIUk02Sd2GeORo3J1SrXOfQTGJAau
	KBqizwrsC5NtTe/9KiyvhjW0umv4UtxH6JtLwhgCCEZevcIScQeiNgylYijPI7f60S5nLP4Sr3QDK
	b0GXEpmI6d16msKCZmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEg-0000000Dexr-2N04;
	Wed, 08 May 2024 01:36:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEc-0000000DexH-25v3
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2b33d011e5dso262856a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132200; x=1715737000; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+7QlTjnxppzA5Udx+bzDo8JE3hSKFTseR43SNN1UptE=;
        b=0uPvuk321174oW8HlYXKosncSH1S/MwnIVFD64L1yW/t9jOyqnNTdtHZQAnybUueaI
         tafrvXzDxO1cSj4oZoFFl+jAm5qfWrHL6tHbKvcCGr7ukDJNDgXejtot8whBN3tCoqed
         CIjWumH2QViRfZKa3dwVj8o0xk75wMYKFQv62B9krSHpbE5m0cQmXV0GAfqS9uiCp4o6
         R5PNqJcs3TSDzzbuK7rtMnHjyCDyDZEGbbhsLNzG5kzqUWcfsTnlJ78SbFUSXGUWqTW3
         BZ1esmqJzA12nSXJ4JN1Q2Lzx4mXfto8WlXpJQXi+aRjiVoIhi50gPWEKwHEXKnpgLl0
         Is6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132200; x=1715737000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7QlTjnxppzA5Udx+bzDo8JE3hSKFTseR43SNN1UptE=;
        b=apzXAm7MPseqrKv5o5kXBXrRFkyv+ZoAJzClwjKsRoFIKdH5JV88GKFonjxC6Nzlr7
         Mr14ysCoKR4R/kbgiWZlaRa8kPGXclMoACV7FcBNjS6myY7mCNxuqShc8gU9R07Gl9i7
         QRDvTJSxWJKq7JfILOzB3m6kJ2Yf3XQUpd1TbvbQe/drSNvDEidkCP43qdK8DCorvMxc
         /YS2F8+JfEQZ0fhK32+Jxr9Qop1/0wkYLyJXXZu470z3VWycFIytxnt6oOziipLJYoaY
         FxCLdYMDbpn0kgw0wHBLerx3ZYevulsryNsdF/DfeqOQMjBLrwgxWWaNrM+JDAzIsuuB
         M8kA==
X-Gm-Message-State: AOJu0Yxfgh6dkxN+q5LNtvie1tsd56RgdcoX2s2SlUBH3VRYzESXs1yS
	TakCo1QLfY8aXjA6EZ35IfVSbaJPvLX18L/6r0HRX/PO3PLpxFs70wcmh67prDg=
X-Google-Smtp-Source: AGHT+IGBUMwgwED594JfXAPKf75mxxw8xGyD68Kq1T2yA2i8v2BD/Iit1PYfzguaf0S8GcMHvm4ZFA==
X-Received: by 2002:a17:90a:d790:b0:2af:33a6:f820 with SMTP id 98e67ed59e1d1-2b611378d9fmr1997613a91.1.1715132200272;
        Tue, 07 May 2024 18:36:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/8] riscv: Support compiling the kernel with more
 extensions
Date: Tue, 07 May 2024 18:36:26 -0700
Message-Id: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABrXOmYC/4WNUQ6CMBBEr0L225qyUA1+cQ9DiGlX2YgtaUnFk
 N7dggfw801m3qwQyDMFuBQreIoc2NkMeChADzf7IMEmM6DEWtbYCO1eE4/UP8lbGvs3z0NPy0x
 2WwbRoDG5WZkKFWTJ5OnOy35w7TIPHGbnP/tfLLf0p1by9E8dSyGF0qh0WdVaNufWc3SBrT7mJ
 XQppS+UkX6CzwAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=3278;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=JLgbatqmIExlBnuCq3aANbOE8Onz3/4vLKRdWZjAJIg=;
 b=KiyA7L0KVvS1JXAVEqaLEplXpWMoEL9cajQs3TtOugD7mQ62ZP7TAKqfmSj3ujpal1dMogWjs
 utnjYrKD1D3Bkd7DacIU9Ge0j4MDOYapJ08pOkqHW8T3bLIMCqV5aoC
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183642_587554_1D9914A8 
X-CRM114-Status: GOOD (  14.41  )
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

The kernel currently has the restriction that it can only be compiled
with the extensions that are hardcoded in arch/risc/Makefile.

Any extension that is not listed in the Makefile can still be used by
explicitly writing the assembly and using alternative patching.

This series introduces Kconfig options that allow the kernel to be
compiled with additional extensions.

The motivation for this patch is the performance improvements that come
along with compiling the kernel with these extra instructions. Allowing
the compiler to emit arbitrary Zb* instructions achieves a 4.9%
reduction of dynamic instruction count for a test ran in Spike that
boots the kernel and runs a user space program that prints to the
console.

Additionally, alternatives that check if an extension is supported can
be eliminated when the Kconfig options to assume hardware support is
enabled.

This series is based on the wording changes from Conor in:

https://lore.kernel.org/lkml/20240424-tabby-plural-5f1d9fe44f47@spud/T/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Eliminate references to incorrect config in Svpbmt patch (Jess)
- Add motivation to cover letter (Conor)
- Remove "v" from march
- Correct the ifdef for vector
- Correct the ifdef for Svnapot
- Link to v1: https://lore.kernel.org/r/20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com

---
Charlie Jenkins (8):
      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig option
      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT Kconfig option
      riscv: Move RISCV_ISA_SVPBMT to Kconfig.isa
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBB Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig option

 arch/riscv/Kconfig                    | 133 +-----------
 arch/riscv/Kconfig.isa                | 393 ++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile                   |  14 +-
 arch/riscv/crypto/Kconfig             |  14 +-
 arch/riscv/include/asm/arch_hweight.h |  33 +--
 arch/riscv/include/asm/checksum.h     |  18 +-
 arch/riscv/include/asm/pgtable.h      |   3 +-
 arch/riscv/include/asm/simd.h         |   3 +
 arch/riscv/include/asm/vector.h       |   3 +-
 arch/riscv/kernel/cpufeature.c        |   3 +-
 arch/riscv/kernel/head.S              |   8 +-
 arch/riscv/kernel/probes/uprobes.c    |   2 +-
 arch/riscv/kernel/process.c           |  12 +-
 arch/riscv/kernel/ptrace.c            |   6 +
 arch/riscv/lib/csum.c                 |  48 ++---
 arch/riscv/lib/riscv_v_helpers.c      |   1 -
 arch/riscv/lib/strcmp.S               |   4 +-
 arch/riscv/lib/strlen.S               |   4 +-
 arch/riscv/lib/strncmp.S              |   4 +-
 arch/riscv/lib/uaccess_vector.S       |   2 +
 arch/riscv/lib/xor.S                  |   2 +
 arch/riscv/net/bpf_jit.h              |   8 +-
 22 files changed, 509 insertions(+), 209 deletions(-)
---
base-commit: 2f47357557b7aa98d9d9002688aae480864ca3f6
change-id: 20240429-compile_kernel_with_extensions-92dd2403d325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
