Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D4EEAA42
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 03:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FIcJqa/h/PXzYx87k7Lyt7v87qsOcPDrjSkxvoXUfR0=; b=4Fm5uAR95NeXAW
	WRW/HHTicFGzfoLQ7ut0G9vZy5U9KSzikMmOkvjCs1baiX2VlZfznV48QphtTOVqqOqoLe0hDYBP7
	qvpxrOg7ICsX9QP5WMD1Qfxf9sJRG4JakwkBi1HRddqZ4/S7MTXmVKZdUzHv0MMtMAFV3jaRoljEF
	GyIS8hQhlXmQwod7v1i1UiepKponPcAxh/O3aANmGYI5TcxAgaDizKgSd5XDVxthATyM+HEr5v5XK
	DeFIAGuLZKjeKuG9+CReT5H81pqTKQwS2ABvEvukHQ8PIUNNBJFuMHlVgWk8d4E7uwPMKO3Y7a9S7
	6BVdO/SZ1yf7VafNN5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzq0-009h16-0K;
	Fri, 15 Sep 2023 03:49:48 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzpu-009gz8-2X
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 03:49:45 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-573c62b3cd2so1284692a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 20:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694749781; x=1695354581; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIiYP19fFZbc0l4Ho3T5W+k2kEX//fiFsZ6CGgO3BzE=;
        b=Kv5TnpJoHfaoHUgkkkLTEycdJillyXLEROMiQ0/S264RMGSWtTp+R5GGsiO+qB/tQt
         2YMYOZEOGrqKYS1i/nM0NGvPQfaul5p3CnYS1iOW3mJJRg2XcKUPhN5hovkOkzeg1xbi
         odshYnB/vKexkwuOlMtckiWQM+jcg7Pne7SOuUxtP2YF6YAPNRl7b7MuI6WEr4RhGr/R
         vnLVVeh2oyd3KJtWkZ9PhUVxguQ1R+H9tH4cvCc0GdB0gPU7kT5R2L7Vhz47LAoWZ4so
         efKcy9OyWA1w6znwWQCHNAP3kg3WlMOpA6vD77o3ff2fLeb6Q644QojGWrznB2mU6Wmk
         Jypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694749781; x=1695354581;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIiYP19fFZbc0l4Ho3T5W+k2kEX//fiFsZ6CGgO3BzE=;
        b=PHjkp/Q6zcSjEMONzobgwdOukDDdT7YjFrBlYk+cldD6D3PWSqN2hLcZjVYvrHXJ50
         0Pwi1siWypo555KrtqdwHgZ1EpyV5YrOgeo/OYrnHo/Qj5Y4dzAy0OtJvG/4GeYncfLO
         nPJtdeCRlvQhD7pjvkCfbvChGH4fxxOjy3/zIDiVWUdmRmFLOCnU1o92SteMMg4dCgnq
         XJSvPpCX6eJia0U4lLJjnhlvKMm2VvFwqVWc55dpW+bNophVJX1tTICWrFIwadKBR1AB
         cAKgQwjjgl5MIbMyelDz3capW5HbRagj8q2BXIUiNBPE5O2yP2L6iXhROiFxuUx8q+nu
         Lkyg==
X-Gm-Message-State: AOJu0YwoPTugN/evsbvn8VjeLCRYEKCKj46u/6aiKW/1HFvFeL16GAZk
	bsepovIjehKEnaHy2hLIYmkvdQ==
X-Google-Smtp-Source: AGHT+IGzfdXXD1ISJxQVDssN13Obc1tgu78IHKhnPBozJdR4PLgUpl4EFv8EUgnNwjaMJCyzg/HqBg==
X-Received: by 2002:a05:6a20:1057:b0:14e:6c19:60f6 with SMTP id gt23-20020a056a20105700b0014e6c1960f6mr603039pzc.50.1694749781484;
        Thu, 14 Sep 2023 20:49:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090adac500b002739282db53sm3881409pjx.32.2023.09.14.20.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 20:49:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 0/4] riscv: Add fine-tuned checksum functions
Date: Thu, 14 Sep 2023 20:49:36 -0700
Message-Id: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFDUA2UC/23N0YrCMBCF4VeRXBtJJolp92rfQ0TaSbSDtJFEg
 6703TcVYWXJ5X9gvnmy5CP5xL5WTxZ9pkRhKmHWK4ZDN508J1eagQAlGqF5uFxppB9/wMHjOd1
 G7nqpDTRNhyBZubtEf6T7y9ztSw+UriE+Xi+yXNa3BtuKliUXvFXWCNkXFrrvSDkkmnCDYWQLm
 OEPaYWpIVAQRLc1jeutVn0FUZ+IrSFqQYwAp7RrnVUVRH8gUtYQXRBrEaFzrS/KP2Se51+mClS
 ohAEAAA==
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_204943_072704_030861F3 
X-CRM114-Status: GOOD (  21.48  )
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

Each architecture generally implements fine-tuned checksum functions to
leverage the instruction set. This patch adds the main checksum
functions that are used in networking.

Vector support is included in this patch to start a discussion on that,
it can probably be optimized more. The vector patches still need some
work as they rely on GCC vector intrinsics types which cannot work in
the kernel since it requires C vector support rather than just assembler
support. I have tested the vector patches as standalone algorithms in QEMU.

This patch takes heavy use of the Zbb extension using alternatives
patching.

To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
and RISCV_CHECKSUM_KUNIT.

I have attempted to make these functions as optimal as possible, but I
have not ran anything on actual riscv hardware. My performance testing
has been limited to inspecting the assembly, running the algorithms on
x86 hardware, and running in QEMU.

ip_fast_csum is a relatively small function so even though it is
possible to read 64 bits at a time on compatible hardware, the
bottleneck becomes the clean up and setup code so loading 32 bits at a
time is actually faster.

---
    
The algorithm proposed to replace the default csum_fold can be seen to
compute the same result by running all 2^32 possible inputs.
    
static inline unsigned int ror32(unsigned int word, unsigned int shift)
{
	return (word >> (shift & 31)) | (word << ((-shift) & 31));
}

unsigned short csum_fold(unsigned int csum)
{
	unsigned int sum = csum;
	sum = (sum & 0xffff) + (sum >> 16);
	sum = (sum & 0xffff) + (sum >> 16);
	return ~sum;
}

unsigned short csum_fold_arc(unsigned int csum)
{
	return ((~csum - ror32(csum, 16)) >> 16);
}

int main()
{
	unsigned int start = 0x0;
	do {
		if (csum_fold(start) != csum_fold_arc(start)) {
			printf("Not the same %u\n", start);
			return -1;
		}
		start += 1;
	} while(start != 0x0);
	printf("The same\n");
	return 0;
}

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
To: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
To: David Laight <David.Laight@aculab.com>
To: linux-riscv@lists.infradead.org
To: linux-kernel@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Changes in v5:
- Drop vector patches
- Check ZBB enabled before doing any ZBB code (Conor)
- Check endianness in IS_ENABLED
- Revert to the simpler non-tree based version of ipv6_csum_magic since
  David pointed out that the tree based version is not better.
- Link to v4: https://lore.kernel.org/r/20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com

Changes in v4:
- Suggestion by David Laight to use an improved checksum used in
  arch/arc.
- Eliminates zero-extension on rv32, but not on rv64.
- Reduces data dependency which should improve execution speed on
  rv32 and rv64
- Still passes CHECKSUM_KUNIT and RISCV_CHECKSUM_KUNIT on rv32 and
  rv64 with and without zbb.
- Link to v3: https://lore.kernel.org/r/20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com

Changes in v3:
- Use riscv_has_extension_likely and has_vector where possible (Conor)
- Reduce ifdefs by using IS_ENABLED where possible (Conor)
- Use kernel_vector_begin in the vector code (Samuel)
- Link to v2: https://lore.kernel.org/r/20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com

Changes in v2:
- After more benchmarking, rework functions to improve performance.
- Remove tests that overlapped with the already existing checksum
  tests and make tests more extensive.
- Use alternatives to activate code with Zbb and vector extensions
- Link to v1: https://lore.kernel.org/r/20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com

---
Charlie Jenkins (4):
      asm-generic: Improve csum_fold
      riscv: Checksum header
      riscv: Add checksum library
      riscv: Test checksum functions

 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/include/asm/checksum.h     |  91 ++++++++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 198 ++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h        |   5 +-
 7 files changed, 655 insertions(+), 4 deletions(-)
---
base-commit: af3c30d33476bc2694b0d699173544b07f7ae7de
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
