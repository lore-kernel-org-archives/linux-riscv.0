Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04099CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlUNFm8GIcrH4Ctpro24tAAxrWeFUEdHbi+xJtmUzSU=; b=If+OkqeWKjzgue
	G7buVLFCDnVLEYMI0rHTzaIhZ0A6bsGLmH6t9wpV1tDevs9m/Z5T+vzO8vDWGoDdfzjZ3kPdphvKP
	EZDuzaa67KtruStvZRgzTGaE9B0TCDKbscTsX0vIC9xVR2f8mZSHM8ZoyfjYc9vSIyCOeVzUmknaN
	2oZY/gCvn/Wtqqj+/RBgiJnwAh5fGBSykeziKxCAjkkdqXY/lhlUKZ6rPkMgnaRgBaYXvN9KZyH68
	sNevyoHGbYTmEgYYQIhLgdo6/wZ+bcJPVMZ6WpALdV4Mnrqxr9wGYXz0L9PTXsw7Rtj8DE6asyBgD
	S27BZOy6Upol6gkV2XFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKzy-00000001kiH-2Qw1;
	Tue, 19 May 2026 14:00:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKzw-00000001kh8-0t6a
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 14:00:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-459bf19e87bso2145612f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779199238; x=1779804038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BK6P9ZRx8illl6oBwVYfN3EvftuNIWvP02Fn1jxek7Q=;
        b=Ual42x3yKH56evMMBaq+KTPE5lExNPBpvkXTs5fMa98nrx4xV73u/4fhojFNYLpEPO
         LIjzpzdYZxB/5SHXTOFpwj+thB7hp4k2XlsakJ+G5XR6IdSsdJRlQBSarpnqlL0AsDyJ
         Dl2Q7hd3xQHOT4LEkMCMHfjkiqX9czF0K97Iuk7hSQN1XUcix1FpIzssaSMoJ5J3jm36
         XNcGaAESOiM2qj6Rzb3OOZewrp12/KLVgjav1oD18d4q3LcxIepR8fEiYkJn5OZu8/0o
         ATKeEJoLdaoEmZ8FN6dyvBdreTEg5QdW7e/cIjSwKnNnidNv5mb4NPD4jZtMH1Z21Gxa
         wyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199238; x=1779804038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BK6P9ZRx8illl6oBwVYfN3EvftuNIWvP02Fn1jxek7Q=;
        b=QQz6/6XPoAt0HOBAz5U92+IxF3U+WdjGFCMbeBpmBFDeqw3fo1IgT0C5VhD5eTom3n
         IMDvV1o9c6w2cjHLmLAA3ydFMSxvpi1qGEJaDSMPwgHqCiICPnRw9F1OHLSVITqA8r12
         VAg4z0X7+bCahNNCHXziXvVzicyoF07ktT1yvsg7rhEsdD0Vmaf04EKAqvSPO/vXgB4Q
         XR4AkciPp9Eng5Bvb6DiBeCFB/ISM3sNBfVWsj6Mq+Zh268Xgp8Oo1eUOs1nmY1DMuWk
         tPZdXzL6va95876vWBop5iDr+2fpsX8rJuC00XILAcL+8+sDDgUuK2UId1yVj8S6RnqB
         gHTw==
X-Forwarded-Encrypted: i=1; AFNElJ9DlRZ5JUjoySC0Rgo4WnMbBJ6ToF2N8lhZlQzFILM6VQWO9lhvKOsOWhUwKRb+9uQbmtDWU3MzMqO7hA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX9d79k/rQMvhRQuN3qhJcDA9TENTaX9rRK6jWRSBt7da3O1QN
	T3l26TX5KBLR4bv3GMEnB0/9owEZs67qnwoN9flS+AS/jQ3pGz/sXwHL
X-Gm-Gg: Acq92OFFPmdqHI8dPMMUoGNFDIQGy8NasEhdFPvZejhgHriA6GdIvU/nsquyrOACh5x
	YbWEwkMv5QtvLLosf+uRfPhbF8pGq4Vnu1ODIhCQIV8o//xORqOBTmwMIjMsU52G5YhCfjUntKm
	VXQVDZ9lhX6VkQVKCBuCuI3HnJTeSashx4LAT8rj1ZIvgpSwc4Rjw9cLoo9UbI7Du1Lxz/4NDvm
	zQD6Ya/MI91CsDLtsFsFWAbn4TyQMkBKCcfS4GYWFl1s2UXZXzESSC48PONRICD7aAVBwufOphH
	IKhQE4ctgnDu9pFW/mChwteyPS0xQ7xIMJ2wiBIzy2pNeuB9igCZl/OWCfjxkKZl0R5we7rRCG2
	dpXR/Ji9V0V110mK84OELDlcnHKNFqFo4bBaJkmYmWfeijCBpxUmU8B8XZuddgDoLDjDHVJliQr
	jt2csAN3AfRg5M1jPOw36gKjpiGDpw3KgbU+UzmMLM
X-Received: by 2002:a05:6000:4007:b0:43d:1cec:4766 with SMTP id ffacd0b85a97d-45e5c5bf971mr32297364f8f.23.1779199237965;
        Tue, 19 May 2026 07:00:37 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([95.86.49.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm44065144f8f.3.2026.05.19.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:00:37 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v5 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Tue, 19 May 2026 16:00:27 +0200
Message-ID: <20260519140029.1190381-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_070040_268117_2D15F418 
X-CRM114-Status: GOOD (  10.29  )
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

This v5 series provides an optimized RISC-V memcmp() implementation 
along with extended KUnit tests for functional verification and 
benchmarking

The memcmp() implementation now uses word-aligned loads for the generic 
path and leverages Zbb for fast sign resolution on supported hardware. 
A robust fallback to byte-by-byte comparison is implemented for non-Zbb 
systems to ensure correctness and stability across different toolchains 
and hardware revisions.

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v5 changes:
    - Removed redundant warm-up from test case
    - Optimized generic memcmp path with word-aligned loads.
    - Implemented non-ZBB fallback to byte comparison per review.
    - Link to v4: https://lore.kernel.org/all/20260518131407.1026049-2-milant2002@gmail.com/

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
 arch/riscv/lib/memcmp.S         | 106 ++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 110 ++++++++++++++++++++++++++++++++
 5 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
