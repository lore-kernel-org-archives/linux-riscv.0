Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F4C4706C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 23:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z0J92KHL6LLeAUHWhv+7KG7KaKqKl3R2Yd69smcvHO0=; b=iRh6GryRM98wYG
	PRyxW44AW7NDGpXe2M14NY6c1sJOAFouxMEVccyLRsEonCEEUgT+3rYQS/vFPPAuTOPe9TuXtZb2M
	rJ2MDkOuHtvnH2wDd+GMLxE+GAlja4XZjiRYxylk64Q12tVlJQFc0N0XUGH7EvoGTk2w5H1vuH0v9
	hRIzH0BOfffCcT2dRPxRkgX1TwMPOSgloVVr9QhuSbQNY9CMf/z4aObF4NkO0zoDIOvXXV1J46xW8
	1zITvbadC+dJDY757HvLSCHHdGHUy3VQHt7Ph06pu/4twQUkQ/EkII/tBn4fdErPiV7vQSZKsbs1P
	WUaK3KlLbPqaaj1VpsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG68N-001GXY-1r;
	Wed, 20 Dec 2023 23:37:51 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG68H-001GV7-01
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 23:37:47 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b9e2a5e8faso98021b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 15:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703115462; x=1703720262; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlcuA36LI1zoJf4X+37ieCmx2xUdNx+5pCFfF6wObqA=;
        b=FzYwTYnJ5moxOsSWigwxf3MuhoGwA/JgFTLqMXIW0gFzu1xpN+ig3/IxVDhy4cKZsy
         yyr5ns5lMhE+0YqM/KDUeVMjOEMHzv2VxVXq3xgetNtAi3qwCC3VrB9gVXwT3+YWv4ql
         iVcBR0TXty9lERW98S/NcYhRgqKXCoQvSpAPJhR9EGKeR5hSxk+6pAF10UJUBWNzbI+w
         CUKeR25Uz+k7YGSY/tpaw/TrO+q5nbFHU11guHHb5N4fDPlfMc7xS0CqhXfHEKM/JXVe
         DDv8NYb+t0+UTgK2vQSYeX6fm71EL6jtpGD746wLURWmRYY0bIedmqdXMU8JwGzK3K6D
         UV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115462; x=1703720262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlcuA36LI1zoJf4X+37ieCmx2xUdNx+5pCFfF6wObqA=;
        b=kaoDbW5Z6WoR2RoH2t7ovHKdTirof/aaOud6wKdp98gV7gonOd2K7e9a0wH7/P/w1O
         +lHEAQsDoZDKtsKgacQt8guJGTf1vkDe7Kdcc0FbKAj7/RsZToYEx7f1vqlTK1SaI6fe
         05MzNlpMc2mlQDiMDA53XTzsrlevJ9cQ7zVCb1wzy7d+k8VpSDBwpaFqo0iKlAWf7F7F
         zhKfnSMwllwlmojxC8dOI/XDggEm8v1QFvpHdjk+n17lG9wbVEb7tvnYKcOCTVxjknYu
         ej+yq00eZdjm+f0JpM+b++8Vub5NKndQl3g5oBveeX7NJQhyoXsxR2y54AsZ3L4ZowPp
         K5pA==
X-Gm-Message-State: AOJu0YyTqIzyFbn7GJgVrgwOdCJeVeDzGDf/Xw10r91BS1BBJ8M8BplQ
	FsjjGrW+jH8QqLuTkq3DqCJvnNrmVOBu5x3rg01XCQ18Vdo=
X-Google-Smtp-Source: AGHT+IECo4sFvbcefQmeWEKqjKL51U57iY5x9jo29lpI5aMy/w0vAYxnSZZrRJKUOjeds3kfiWBeFw==
X-Received: by 2002:a05:6808:2387:b0:3b9:d9be:802e with SMTP id bp7-20020a056808238700b003b9d9be802emr1673907oib.54.1703115461996;
        Wed, 20 Dec 2023 15:37:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k5-20020a056830150500b006d87e38f91asm132834otp.56.2023.12.20.15.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:37:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v13 0/5] riscv: Add fine-tuned checksum functions
Date: Wed, 20 Dec 2023 15:37:38 -0800
Message-Id: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMJ6g2UC/23S3UrEMBAF4FeRXlvJTP698j1EJMmkbpDdLu1a1
 GXf3ekibpG5nEC+ZA7n3M11anXuHu/O3VSXNrfxwAPo+7uu7NLhrfaN+KBDhVoFZfrxeGr79l1
 fy66W9/lj31MGYzGEVBA6vnec6tA+r+jzC8+7Np/G6ev6xgLr6a+GTtAW6FUftbcKMrOYnqa2j
 HM7lIcy7rsVXPCGRGUlBBkphZwNlL3RWUD0FvESolfEKiRtKJLXAmI2CICEGEa8LwUTxcqKgNg
 tIiW82PUn0eaACb31VUDcFhEzcYyASa4MDoqDICB+i0QJ8YwoVzwpIrLkBCT8IaBQDDYwMtTsQ
 QEBBhKQuEG0GGxkpCYFobqYEaOAgLop/JbYNl6nTyYG633O0YkMbBgQN4K1tZ5bEq0ZqnYgMbf
 aAgKKzNpbAzGZnBw59z/ey+XyA6H3vQmzAwAA
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703115460; l=7189;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=4IR3mjq7Qe5hgiByQjg6dI37GwuRsrOURUG+THLjvJY=;
 b=JUSsFLvL/oYHFOQZh0QTw83jouJ37B7/7WN57uNbUC48bBx9u+nnzDhVgMHI8AK91+KF9oaZR
 E+YENaAo7YADy1n6+oXm53tFLUOCOOg05EdHL468D0/oNSVxTb0R33N
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_153745_068653_5D635860 
X-CRM114-Status: GOOD (  23.80  )
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
functions that are used in networking. Tested on QEMU, this series
allows the CHECKSUM_KUNIT tests to complete an average of 50.9% faster.

This patch takes heavy use of the Zbb extension using alternatives
patching.

To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT.

I have attempted to make these functions as optimal as possible, but I
have not ran anything on actual riscv hardware. My performance testing
has been limited to inspecting the assembly, running the algorithms on
x86 hardware, and running in QEMU.

ip_fast_csum is a relatively small function so even though it is
possible to read 64 bits at a time on compatible hardware, the
bottleneck becomes the clean up and setup code so loading 32 bits at a
time is actually faster.

Relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@rivosinc.com/

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
To: Xiao Wang <xiao.w.wang@intel.com>
To: Evan Green <evan@rivosinc.com>
To: linux-riscv@lists.infradead.org
To: linux-kernel@vger.kernel.org
To: linux-arch@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Changes in v13:
- Move cast from patch 4 to patch 3
- Link to v12: https://lore.kernel.org/r/20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com

Changes in v12:
- Rebase onto 6.7-rc5
- Add performance stats in the cover letter
- Link to v11: https://lore.kernel.org/r/20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com

Changes in v11:
- Extensive modifications to comply to sparse
- Organize include statements (Xiao)
- Add csum_ipv6_magic to commit message (Xiao)
- Remove extraneous len statement (Xiao)
- Add kasan_check_read call (Xiao)
- Improve comment field checksum.h (Xiao)
- Consolidate "buff" and "len" into one parameter "end" (Xiao)
- Link to v10: https://lore.kernel.org/r/20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com

Changes in v10:
- Move tests that were riscv-specific to be arch agnostic (Arnd)
- Link to v9: https://lore.kernel.org/r/20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com

Changes in v9:
- Use ror64 (Xiao)
- Move do_csum and csum_ipv6_magic headers to patch 4 (Xiao)
- Remove word "IP" from checksum headers (Xiao)
- Swap to using ifndef CONFIG_32BIT instead of ifdef CONFIG_64BIT (Xiao)
- Run no alignment code when buff is aligned (Xiao)
- Consolidate two do_csum implementations overlap into do_csum_common
- Link to v8: https://lore.kernel.org/r/20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com

Changes in v8:
- Speedups of 12% without Zbb and 21% with Zbb when cpu supports fast
  misaligned accesses for do_csum
- Various formatting updates
- Patch now relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@rivosinc.com/
- Link to v7: https://lore.kernel.org/r/20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com

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
Charlie Jenkins (5):
      asm-generic: Improve csum_fold
      riscv: Add static key for misaligned accesses
      riscv: Add checksum header
      riscv: Add checksum library
      kunit: Add tests for csum_ipv6_magic and ip_fast_csum

 arch/riscv/include/asm/checksum.h   |  93 ++++++++++
 arch/riscv/include/asm/cpufeature.h |   2 +
 arch/riscv/kernel/cpufeature.c      |  30 ++++
 arch/riscv/lib/Makefile             |   1 +
 arch/riscv/lib/csum.c               | 326 ++++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h      |   6 +-
 lib/checksum_kunit.c                | 284 ++++++++++++++++++++++++++++++-
 7 files changed, 738 insertions(+), 4 deletions(-)
---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
