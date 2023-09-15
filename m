Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD0FEED619
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I+L//+ezexTje+iMH0TS2Pqed3v7kGJxMfLcv374Xi8=; b=jyhz2p+fjc5fP2
	G5XcuiHdfx1q4+/AdtXV9qKcW/CafqcsHv6+i38wS6kWa96r/1wq9v9T7v7m7EmNYXPeoSESR9Wqk
	LlBpR8KqRvhtQgl/eCrHbfR1IwrK1zV1OUJMzLVdSbpvblo8/TfFGd4TNSGo3sRZZxqWAOuajubq2
	GyKGFjM3JXFAe2DEEb1CFh2irKxQ0rbmDv8L3TMWdH8IKkcXvEBRO2k8pSfKP73WlHdsvd4QEsxK1
	s9APpLUSQdcPlrpNlRlnPiHhkj6mpO7e0jXCCGv3Rr0nuVNzwjhD7aoUu9idt3tBPQkNJfu06T9jg
	pJKq62nO0loew3WRVGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDF-00B6A9-1r;
	Fri, 15 Sep 2023 17:02:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDB-00B68X-2J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 17:02:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7a6509deso18817845ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694797350; x=1695402150; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln+7rHA69/YQ6l7rezPa2HlFS+4ma5eDvscwKBBdEIw=;
        b=JkeNupphPXPAIb8lg4P2wAl1Ch9AAhk4lVorDtGnxYO2/eXWpzk4FW8YlMc1tsUwah
         9wBUlC7frfSX5KvO/x4pmpLflknbTKOaH71Hs77nbIrkJqePJFZBTTaYnF4LE8LmVeSC
         wXyL6ncU9slT8fzk5OfhL1SSYEkuG6A8DeOhk1cgKmvhybjx9RZcSYIJ8BHzl/E/JYX8
         EtAn4t81hhM6bq75ClajOkBLme/gusO4PvzYG0OpfXEubgFMIUXRJ5iiBfFToO86b/Id
         Wm/PmWDW+xuWbEg2RI8HQRN27leUI8BaJ7BzPQKx46LBUbKTE0+d8Un4Wt1SeemVFdLT
         xsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797350; x=1695402150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln+7rHA69/YQ6l7rezPa2HlFS+4ma5eDvscwKBBdEIw=;
        b=Am3m6WsUZQwi/+SAIQBqIIoHAZRvh/Xbighj5Z9w1O0o8B7/EeHxaPGPuR89rcvNcH
         RlwYj+wyKUZClTqU73hJhN521c9i2dR++F0fMSLPWCdGCT80dWUt1XIeZ6+jr9Bo1Tf6
         WpXxDXTpg1f6n4JkNCFL8muD5Xud+eTn9zjHuCnbH1+EGJ51dALmIHH0rqdo38/9hQbP
         W0RIKhyIh9S1I1TlT+BsGNdmACzVbWUSO+aRUGvG6u1vd/XjVXJJH7f9nPJX4jF50cg6
         6eOSB8wlBvHR8AK5hCXjE09bN8dqoHwmkjIzLwrAaIy8hN8qtCAJPkohSWZzMnkta7OS
         LXpw==
X-Gm-Message-State: AOJu0Yyv1ondWO5LD3e9Pbjj+muUDHfPIwfheFk2lG6GdLg2UTbwuHbK
	jlbTebUh22dNoPd9qZmp1kvy063pOlWz3LLCfGQ=
X-Google-Smtp-Source: AGHT+IHW0dFXuQ5J11FZ/mFNf2U7014xBJodgfH0AfGxl53c/+Th0Qz+Am146b6bzYb//uwFGTT5sg==
X-Received: by 2002:a17:902:a40b:b0:1bb:3406:a612 with SMTP id p11-20020a170902a40b00b001bb3406a612mr2116565plq.57.1694797349850;
        Fri, 15 Sep 2023 10:02:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b001c44c8d857esm34299plq.120.2023.09.15.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:02:29 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/4] riscv: Add fine-tuned checksum functions
Date: Fri, 15 Sep 2023 10:01:16 -0700
Message-Id: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANyNBGUC/23Q30oFIRAG8Fc5eJ2ho67aVe8REf6rHWLXg56kO
 uy75x6ClvDyG5jfN8yV1FQwVfJwupKSGlbMaw/T3YmE2a1viWLsmQADwQyTNJ8vuOB3eglzCu/
 1Y6HRc6nAGBeAk753LukVP2/m03PPM9ZLLl+3isb36a8G00BrnDJqhVaM+86CeyzYcsU13Ie8k
 B1s8IdYpkYIdCSEOCkTvZbCDxBxRPQIETuiGEQho41aDBB5QDgfIbIjWocALtrUlQGijsjow03
 tl1jlDTjQSqd/yLZtP2bSzwXJAQAA
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
X-CRM114-CacheID: sfid-20230915_100233_758965_EE1B801B 
X-CRM114-Status: GOOD (  23.06  )
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
 arch/riscv/lib/csum.c                 | 198 ++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h        |   4 +-
 7 files changed, 655 insertions(+), 3 deletions(-)
---
base-commit: af3c30d33476bc2694b0d699173544b07f7ae7de
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
