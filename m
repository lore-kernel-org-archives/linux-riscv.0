Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F936CE79A8
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M13s+FmOpF/2dhyOiIZiA9/MzZc2cExw/6MsM1ZPmVI=; b=v8+BVNVumSRrZG
	S8CnqjTxdf5pOTz14hZjkJX9DEpcPGAYPM0fYOHGV1y2ApqdgqJSW+d1KK501vJ8hS1hI9ZxUi6mf
	eoQphP/UPOMhkrXLSj4PRq05ws0gI+DzT8sOiH1ZEKLjr6IYWXzfjJ+PABPHN259e3eyLvEepDuOM
	KpFOgZaB8umLj1ZLqLQknLn3VzEOFcFdHIVH1nUbSgebCDBSVOeImMNO/h4PJXxg5l/P8242lkbh+
	wCLFnluN9OQKUsgc1lZlJS1aJw1yB2agAvtlCMzhQ7xvs+N/867T5uOtVNTSb3x/dF5lq0fzlOE89
	5fAo2FV4SkLQEaeYkZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qific-0015j3-2R;
	Tue, 19 Sep 2023 18:45:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifiW-0015gg-1b
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:45:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-577fb90bb76so3306739a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695149098; x=1695753898; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uA2AKw5TRuWkTphPeTSud1oyV6iHPUIlWEjGcPkhvI=;
        b=jf0SRbbipNz1u3ndSeKZTMpyoQX+39JgPopaXInclWhP0aBRSDzc0+zmOcnfQ7VySi
         UQ/882iNO615ChOe3cAHuUqr0YiIsQjJU3umL1tNZEP9pyLGjLPeauM3Uyhlb6wkawzL
         Awa6SSu8vKukgO6PdouV9Kqq1rNfyLzBqPH4lP4HXL+uK4zwKVEPeuySOlW1ARTD4ldP
         urweJbhzP0Z1Q2YL1J4bJ+7Qprq1uN3hAjQ7PCExcnEyQ3IZeJefcB9P0yAC2j9Kjwqi
         KrHj53huyKnkorZS5dNx6RVOSauzr9c+9c6GleZf2Wt1tSs57VH4HB2W6WILTP+nC7ZZ
         2JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149098; x=1695753898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uA2AKw5TRuWkTphPeTSud1oyV6iHPUIlWEjGcPkhvI=;
        b=jgLrZrx+P2wR7GIoMBePmtEAmRqOJYiwtod6CfRz6LxTkSxoYCeIrNSSIJN1lDCq9N
         IwJ79wa7aTjR2dxUugjTkKZX/3zH0NPRj1LnCfTmBlCBQWI8S01L96hBjlvtzC1WaieM
         fa3H0FKm4/z80dJyf65LW2530+GrAX1SvxGGAYems9ksAbF25TZgy3ZC29G1ksjuHs5H
         /TQ9Tjk8fQgiqo4wlTzwVtyqkNoayBm73rOO1Xo5Cu0zS8kcxz2OCgv39X/fZvW7ng67
         2aW5P3G31+r2b8leOiWzdN+HKGHPXg5MZfyifpP70cg+ZHvIPqgVCIQ2iKru6Vzi7O+X
         tnSw==
X-Gm-Message-State: AOJu0Yy1tFHj/ZO2wyX9FiN0YPTZgZa/wrNcgy1Xyq4P8uLmpAEQ8I3G
	uz0xasIoz6F4wqC7GnlELUr81A==
X-Google-Smtp-Source: AGHT+IHQse60GH+RLIRvJ6EeiBAwEVE5yYVcnEb1+9ssEr7AXWIByI8HcDuGdJ6V4rNHibbFVK8OGQ==
X-Received: by 2002:a17:90a:e2ce:b0:26b:5ba4:4948 with SMTP id fr14-20020a17090ae2ce00b0026b5ba44948mr534507pjb.12.1695149098229;
        Tue, 19 Sep 2023 11:44:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090b068500b0026309d57724sm3876846pjz.39.2023.09.19.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 11:44:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 0/4] riscv: Add fine-tuned checksum functions
Date: Tue, 19 Sep 2023 11:44:29 -0700
Message-Id: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA3sCWUC/23QTWrDMBAF4KsEresijf6z6j1KKNJIqUWxFaxEt
 A2+e+VQqClavoH5Znh3UuKSYiHHw50ssaaS8tyCfjoQHN38HocUWiZAgVNDxZAv1zSl7/iGY8S
 PcpuG4JmQYIxDYKTtXZZ4Tp8P8/XU8pjKNS9fjxOVbdNfDVRHq2ygg+VaUuYbC+5lSTWXNOMz5
 olsYIU/xFLZQ6AhiEFJE7wW3HcQvkd0D+EbIikELoINmncQsUMY6yGiIVojggs2NqWDyD3Sa7j
 K7RMrvQEHWurYQdQe6XaiGsKEU3hWDBUz/5B1XX8A5VvcmA4CAAA=
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_114500_559019_AAA96FE3 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
To: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
To: David Laight <David.Laight@aculab.com>
To: linux-riscv@lists.infradead.org
To: linux-kernel@vger.kernel.org
To: linux-arch@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Changes in v7:
- Included linux/bitops.h in asm-generic/checksum.h to use ror (Conor)
- Optimized loop in do_csum (David)
- Used ror instead of shifting (David)
- Unfortunately had to reintroduce ifdefs because gcc is not smart
  enough to not throw warnings on code that will never execute
- Use ifdef instead of IS_ENABLED on __LITTLE_ENDIAN because IS_ENABLED
  does not work on that
- Only optimize for zbb when alternatives is enabled in do_csum
- Link to v6: https://lore.kernel.org/r/20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com

Changes in v6:
- Fix accuracy of commit message for csum_fold
- Fix indentation
- Link to v5: https://lore.kernel.org/r/20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com

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
 arch/riscv/lib/csum.c                 | 217 ++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h        |   6 +-
 7 files changed, 676 insertions(+), 3 deletions(-)
---
base-commit: da5f5b0f1b813dafe9ce81b70fed01b0d103d556
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
