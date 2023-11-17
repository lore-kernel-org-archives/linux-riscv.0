Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA2C5ACB3
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OcjWtLNrGFKQNjKEYUVFD0UEdCEbF+WctWV7yQsxaQs=; b=aByYaifmejOVym
	DRNsbEvgnyopHXbmzvJRLmFqBnfNEjS8+O/fe73xZF0IOd03hpbugNYPkiF2hXyphl2DNw5yGKA0S
	m/Nl6D3oHGys/5zx3883mNhCYm+hfEyP1KP6qgKLwhv24iLecRwyg1HYrZ2U5nNAgGb9UT87zWKrc
	EwBgmCTpd5C/ty+E/4JXjleguEncJwaSuypYvMPBZz1euG4pAC9Yiow9du4Tq/0o2qoykja9QpIAg
	YfMlb3wGWLl6VntThOl4vEzvt2SKpcrDCJEwD4gYgeAeScUCU48fU5DlDLgddvceRwhGyn94zfsAi
	Fm/9Iy+37XeT2cGgbOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r46No-007NHF-2l;
	Fri, 17 Nov 2023 21:28:12 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Nl-007NEq-39
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 21:28:12 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1f5b92bba54so358733fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 13:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700256488; x=1700861288; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pbfqhCDRNrxODLpkfaWCwkY+4hLyv36be17aYVh/JsM=;
        b=G2CU6lE10sD6ecb/t9cid92O6j2uxBcXiLC/PzzCOeLd87EpjonA/Q7DNsU+d7j5eg
         zm0sNzGygXoSI9Y/aPa4wWlH+VRueDIsq1JdOeyevTOG9ESLzZ8x0ZQruY/GmHw2uF2/
         hnFkWsd3lIgpSWeIE9JCcf5c/yi5o1I3IonqMvNuZKqACEUuV37quJcbleQ4XW2iPGsR
         BR1cSGb5xI7qqp0ek3xtg40fg9RSXNfB3VVqBpU5xc3dP4sUKAd5Mg+sujGtcEM8sM3p
         EQv6GOE0v6gfWPjzYmk+WkdvZI0S1XafWX4mMidfRwFULxNY4zIEgF3kc8UvwUmMK5hA
         Z2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700256488; x=1700861288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbfqhCDRNrxODLpkfaWCwkY+4hLyv36be17aYVh/JsM=;
        b=Zq7HDFzD9+kKPT8tjqxLxhInVNYaurOsKf3KjrgIY71TsWerX/t35lPTWRxtbro0+f
         q6Bb1Xh3WOtz3N1qb2VsdmncZLKVXcYQq37g5EfSSMQEBcGU17E5ifE7YWr8Ja21uIWr
         D3AEpjWsDNJ5JKO3IkLoGb4WL3GIMl0GleskDL9tofO/zqpPhg4c/HRRzYWalMpDMeL/
         GBxUudP3aZWEquKxGcS8GCJeJlC7+QbBlVOWlAZDr5WTPt676phWCs8DH9IljH/98VVU
         XBdGFt0QgwJJvuxjClBGtEwf+yu3vYuopMZ+ondmTNJRGEJfN4VtXeIgbtOYldjg/sik
         fm0w==
X-Gm-Message-State: AOJu0YwWFGL3vF9Sw0vpqKG12g/u0prG9R/Rzmbct1fjYi3k9yKSgiJD
	u9S+p/SpnvyEGfLlFEUcT6WMpg==
X-Google-Smtp-Source: AGHT+IH3AqicpvNyXP5O2g9M0EKuSR0Z9jlWLpGXDV3oh+qALban3hm1S5g0A5wcSgchPbZj/PlR9A==
X-Received: by 2002:a05:6871:88a:b0:1e9:dfc3:1e6c with SMTP id r10-20020a056871088a00b001e9dfc31e6cmr3333927oaq.28.1700256488467;
        Fri, 17 Nov 2023 13:28:08 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e2-20020a05683013c200b006d3127234d7sm365677otq.8.2023.11.17.13.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:28:07 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v11 0/5] riscv: Add fine-tuned checksum functions
Date: Fri, 17 Nov 2023 13:27:58 -0800
Message-Id: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN7aV2UC/23S22rDMAwG4FcpuV6GJR9k92rvMcawLXc1o01Ju
 rCt9N3nlLGGoUsJ9Mn68aWbyljL1G03l24sc53qcGwFwMOmy/t4fCt95dboUKFWXpl+OJ3roX6
 X17wv+X36OPScwFj0PmaErs2dxrKrnzf0+aXV+zqdh/HrtmOGpfuroRO0GXrVB01WQWosxqexz
 sNUj/kxD4duAWe8I0FZCcGG5MzOek5kdBIQvUZIQvSCWIWsDQcmLSBmhQBIiGkIUc4YOZSmCIh
 dI1LCs11eEmzyGJEsFQFxa0TMxDUETHR55yA78AJCayRICDVEuUysmNmyExD/h4BCMVjfkF1JB
 AoY0LOAhBWixWBDQ0pU4IsLCTEICKi70naJv62d00cTvCVKKbj/zPV6/QEOzjtpJQMAAA==
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_132810_016103_BC66C42D 
X-CRM114-Status: GOOD (  22.96  )
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
 arch/riscv/include/asm/cpufeature.h |   3 +
 arch/riscv/kernel/cpufeature.c      |  30 ++++
 arch/riscv/lib/Makefile             |   1 +
 arch/riscv/lib/csum.c               | 326 ++++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h      |   6 +-
 lib/checksum_kunit.c                | 284 ++++++++++++++++++++++++++++++-
 7 files changed, 739 insertions(+), 4 deletions(-)
---
base-commit: 8d68c506cd34a142331623fd23eb1c4e680e1955
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
