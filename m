Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EDFC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99ZIpWmYuAKxN9a4yQiK952gRue2XZz+vci6SxxHck8=; b=p63/QU/a3H+YyC
	RWLm+udqxGdld6iz4jW3Rmqmmg4yOfVvrcJRPLoQbXWa7rwgrIlKUTBiv2z0zivSQPWzAHmIgqD/A
	hUtJsWab1vd5Pe2DY6dQbLOqzul6PBR0mPObtCvK+llHP+a08LFGV2RARikPZAfVPfrPCMDE0DkWb
	i6Ao2jSkTpGKhEj6e7UIMAhWSA5ZELndF0tpcYkug8u1wcdy0cpH1Ezbz7dbsjtgHmxTz+K4O+YUL
	pGmVaiAG7JYvrZrElhK799DOCETBMGHS04QwfRWE8Ecs2fvOpjwguCV4C6YTHomF4fuTT/btsb//n
	nTiMT1H2umpZh2pp8sEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyx0-006NUt-29;
	Wed, 01 Nov 2023 00:19:14 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxywx-006NTk-2U
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 00:19:13 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b2b1af964dso4010047b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 17:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698797948; x=1699402748; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9LzagGrV0vnl+5QDWRYBYwCCC2WqKNu2SBug3GHKXY=;
        b=Pxwv3ih5U6sIz4b6rSLgwA+pQG6PX8SySRgb78kr78Vlt/x/N9zCLy2BuBu2al/SnI
         6M/ZdUMxZmflgzvGw7yypK2RntvQO7r31SJcE2vDyBHqRhCHha6Wey1a1atAEBi7Rfrq
         ZKE3yOQKFtNv7jCr9DdCSQOy3WGdgXdfA1ysOfBrr09AthfOSoLK9J5ajdttHclxrltX
         W0fNP7fDABf0KU1o358BFVqjJBCtBOQcugSWv6hb8BFzWyMvuNe9TnJtOJeloeGXP+cm
         rS2O51TDmOOJmB8+FrFxkbFI/3Ut9rZZGYPikciQkH9dDh56qVPxXhelZjat1ygWPpmo
         5aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698797948; x=1699402748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9LzagGrV0vnl+5QDWRYBYwCCC2WqKNu2SBug3GHKXY=;
        b=n24JdFlt42fW9M7WJeLr0Jd3OqjUbfFntIiOSrjVTjIFSvaxwBbkj/HEqmuYle7wUY
         ZuejZgjjgbBzNKkfhmU6VgqNz3aMVtvSPhZN1ocktrKBe6jVQdETU2axJGJ1hZJBaXXY
         ROG1Hwx0Ojfd3bWGHhrJRlU3uLsgwdlmLSljMgONTZ4jPu6pT1cPwaAwt1wxKUUE4I0p
         GqpL7w/f/avqUnrTFVuF8CCRUXuDEy4SDbLwpKl+pJKwGi0J2VYZ+RqxK1N7rfRN7Fq8
         1kMQitDfhvwTwrP+ASCYMqu/1GdZwTHectpYmjaFsCIWzT0ttDrqcBtMscIKzawct4La
         TUWA==
X-Gm-Message-State: AOJu0YzOL9JkZk3BovnteMHG4JUHLtgQgBf1ocVEDb+/tMKj0JernVqp
	6krfqC33zzYtDkvb8o7NsUWebo7m5KKGFG8EGVE=
X-Google-Smtp-Source: AGHT+IHfHixrIJT6s2zrO1jrnWpmKDSDkNYetAAqwmEgEAScd+j6dKrW80Q8NyRyWyse3CGzv3SNAg==
X-Received: by 2002:aca:1214:0:b0:3ae:1446:d48b with SMTP id 20-20020aca1214000000b003ae1446d48bmr14762389ois.3.1698797948507;
        Tue, 31 Oct 2023 17:19:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n21-20020aca2415000000b003af638fd8e4sm65309oic.55.2023.10.31.17.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:19:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v9 0/5] riscv: Add fine-tuned checksum functions
Date: Tue, 31 Oct 2023 17:18:50 -0700
Message-Id: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGqZQWUC/23Q3UrEQAwF4FdZ5trKJPPvle8hIm0ydQfZdmnXo
 i59d6eLaJFcnkC+hHNVc55KntXD4aqmvJS5jEMN6e6g6NgOr7kpXLNCjUZHbZvxfCmn8pVf6Jj
 pbX4/NdyBdRhjSwiq7p2n3JePm/n0XPOxzJdx+rydWGCb/mjoBW2BRjfJBKehqyy2j1NZxrkMd
 E/jSW3ggn9I0k5CsCJE7F3kLljTCYjZI0FCzIY4jWwsJw5GQOwOAZAQW5EQiLDllKsiIG6PSA0
 vbvskuS5ii8GFLCB+j4id+IqAbT31HshDFJCwR5KEhIpoT4E1Mzv2AhJ/EdAoFhsr0ucugAYGj
 PwPWdf1G5qcXFKYAgAA
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
X-CRM114-CacheID: sfid-20231031_171911_811254_01141C6A 
X-CRM114-Status: GOOD (  24.34  )
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
      riscv: Checksum header
      riscv: Add checksum library
      riscv: Test checksum functions

 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/include/asm/checksum.h     |  92 ++++++++++
 arch/riscv/include/asm/cpufeature.h   |   3 +
 arch/riscv/kernel/cpufeature.c        |  30 ++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 326 +++++++++++++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 include/asm-generic/checksum.h        |   6 +-
 9 files changed, 819 insertions(+), 3 deletions(-)
---
base-commit: 8d68c506cd34a142331623fd23eb1c4e680e1955
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
