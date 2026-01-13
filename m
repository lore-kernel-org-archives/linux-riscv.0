Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA50D29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EtyyjH07DdRH+OcaaXn8ZvgXc4GidbsbAsdRz57NX6w=; b=DRDeL8vJ51LKL3
	GYScR7GgLJoE6T8yB8oOwWKC8geIWt7GEGqqhmX9pFWQ6sqheSYLahZAying8RUOjuQM09bWJQYJ0
	u7fb9S68OwQk2zzAqM+48/SxNO+GWrmpiSCBwvSeFV9TuTxKOli9GK+FWH78V8vZ6/UKSnBrf0S8L
	EhY4uqa4AjdFo5WsZv6O23Rp+eIkKIybsxjm1mLa8yRoKcIDoNsI5/e8B4S8ctpqbKJHhqrO1289u
	8FO1jz7dU6BW1Wzu9kH1/jdwt0X7pQLqkX2QUPpHOOr0byUrR+duBUf8SrF/5Gfaga7ntMifN2iub
	t3mnaEwKkTkYgUD4WTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlE-00000006jfd-3yDr;
	Tue, 13 Jan 2026 08:28:20 +0000
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZl2-00000006jdm-3hRS
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:19 +0000
X-UUID: c11bedeef05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:cc4c9168-a479-4ded-b754-d030a91f6b56,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:7dc0868022a0e158532e637d4446d3a8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c11bedeef05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 738451414; Tue, 13 Jan 2026 16:27:53 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 00/14] riscv: optimize string functions and add kunit tests
Date: Tue, 13 Jan 2026 16:27:34 +0800
Message-Id: <20260113082748.250916-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002809_232876_5B95D0BC 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

This series introduces optimized assembly implementations for strnlen,
strchr, and strrchr on the RISC-V architecture. To support a rigorous
verification process, the series also significantly expands the
string_kunit test suite with both functional correctness tests and
performance benchmarks.

The patchset is organized as follows:
- Refactoring (Patches 1-4): Extract generic C implementations for
  strlen, strnlen, strchr, and strrchr into exported __generic_* functions.
- Correctness Testing (Patches 5-7): Extend string_kunit with detailed
  functional tests for the target functions.
- Performance Benchmarking (Patches 8-11): Add a benchmarking framework
  to string_kunit to measure execution time across various string lengths.
- RISC-V Optimizations (Patches 12-14): Provide the optimized assembly
  implementations for the RISC-V architecture.

Testing:
All patches have been verified using the KUnit framework on QEMU 
virt machine (riscv64). All string-related tests passed.

    $ ./tools/testing/kunit/kunit.py run --arch=riscv \
        --cross_compile=riscv64-linux-gnu- \
        --kunitconfig=my_string.kunitconfig \
        --raw_output
    [15:26:26] Configuring KUnit Kernel ...
    ...
        ok 1 string_test_memset16
        ok 2 string_test_memset32
        ok 3 string_test_memset64
        ok 4 string_test_strlen
        # string_test_strlen_bench: strlen performance (short, len: 8, iters: 100000):
        # string_test_strlen_bench:   arch-optimized: 148900 ns
        # string_test_strlen_bench:   generic C:      5551900 ns
        # string_test_strlen_bench:   speedup:        37.28x
        # string_test_strlen_bench: strlen performance (medium, len: 64, iters: 100000):
        # string_test_strlen_bench:   arch-optimized: 166000 ns
        # string_test_strlen_bench:   generic C:      16250200 ns
        # string_test_strlen_bench:   speedup:        97.89x
        # string_test_strlen_bench: strlen performance (long, len: 2048, iters: 10000):
        # string_test_strlen_bench:   arch-optimized: 14100 ns
        # string_test_strlen_bench:   generic C:      35605600 ns
        # string_test_strlen_bench:   speedup:        2525.21x
        ok 5 string_test_strlen_bench
        ok 6 string_test_strnlen
        # string_test_strnlen_bench: strnlen performance (short, len: 8, iters: 100000):
        # string_test_strnlen_bench:   arch-optimized: 147500 ns
        # string_test_strnlen_bench:   generic C:      6429800 ns
        # string_test_strnlen_bench:   speedup:        43.59x
        # string_test_strnlen_bench: strnlen performance (medium, len: 64, iters: 100000):
        # string_test_strnlen_bench:   arch-optimized: 197900 ns
        # string_test_strnlen_bench:   generic C:      22322500 ns
        # string_test_strnlen_bench:   speedup:        112.79x
        # string_test_strnlen_bench: strnlen performance (long, len: 2048, iters: 10000):
        # string_test_strnlen_bench:   arch-optimized: 14100 ns
        # string_test_strnlen_bench:   generic C:      56162600 ns
        # string_test_strnlen_bench:   speedup:        3983.16x
        ok 7 string_test_strnlen_bench
        ok 8 string_test_strchr
        # string_test_strchr_bench: strchr performance (short, len: 8, iters: 100000):
        # string_test_strchr_bench:   arch-optimized: 166800 ns
        # string_test_strchr_bench:   generic C:      6079400 ns
        # string_test_strchr_bench:   speedup:        36.44x
        # string_test_strchr_bench: strchr performance (medium, len: 64, iters: 100000):
        # string_test_strchr_bench:   arch-optimized: 151500 ns
        # string_test_strchr_bench:   generic C:      21130400 ns
        # string_test_strchr_bench:   speedup:        139.47x
        # string_test_strchr_bench: strchr performance (long, len: 2048, iters: 10000):
        # string_test_strchr_bench:   arch-optimized: 32800 ns
        # string_test_strchr_bench:   generic C:      50630400 ns
        # string_test_strchr_bench:   speedup:        1543.60x
        ok 9 string_test_strchr_bench
        ok 10 string_test_strnchr
        ok 11 string_test_strrchr
        # string_test_strrchr_bench: strrchr performance (short, len: 8, iters: 100000):
        # string_test_strrchr_bench:   arch-optimized: 166300 ns
        # string_test_strrchr_bench:   generic C:      6201400 ns
        # string_test_strrchr_bench:   speedup:        37.29x
        # string_test_strrchr_bench: strrchr performance (medium, len: 64, iters: 100000):
        # string_test_strrchr_bench:   arch-optimized: 207200 ns
        # string_test_strrchr_bench:   generic C:      23062700 ns
        # string_test_strrchr_bench:   speedup:        111.30x
        # string_test_strrchr_bench: strrchr performance (long, len: 2048, iters: 10000):
        # string_test_strrchr_bench:   arch-optimized: 14000 ns
        # string_test_strrchr_bench:   generic C:      51192900 ns
        # string_test_strrchr_bench:   speedup:        3656.63x
        ok 12 string_test_strrchr_bench
        ok 13 string_test_strspn
    ...
    # string: pass:28 fail:0 skip:0 total:28
    # Totals: pass:28 fail:0 skip:0 total:28
    ok 1 string
    reboot: Restarting system
    [15:28:10] Elapsed time: 103.449s total, 0.001s configuring, 101.878s building, 1.569s running

Changes:
v1: Initial submission.

v2: 
- Refactored lib/string.c to export __generic_* functions and added
  corresponding functional/performance tests for strnlen, strchr,
  and strrchr (Andy Shevchenko).
- Replaced magic numbers with STRING_TEST_MAX_LEN etc. (Andy Shevchenko).

---

Feng Jiang (14):
  lib/string: extract generic strlen() into __generic_strlen()
  lib/string: extract generic strnlen() into __generic_strnlen()
  lib/string: extract generic strchr() into __generic_strchr()
  lib/string: extract generic strrchr() into __generic_strrchr()
  lib/string_kunit: add correctness test for strlen
  lib/string_kunit: add correctness test for strnlen
  lib/string_kunit: add correctness test for strrchr()
  lib/string_kunit: add performance benchmark for strlen()
  lib/string_kunit: add performance benchmark for strnlen()
  lib/string_kunit: add performance benchmark for strchr()
  lib/string_kunit: add performance benchmark for strrchr()
  riscv: lib: add strnlen implementation
  riscv: lib: add strchr implementation
  riscv: lib: add strrchr implementation

 arch/riscv/include/asm/string.h |   9 +
 arch/riscv/lib/Makefile         |   3 +
 arch/riscv/lib/strchr.S         |  35 ++++
 arch/riscv/lib/strnlen.S        | 164 +++++++++++++++
 arch/riscv/lib/strrchr.S        |  37 ++++
 arch/riscv/purgatory/Makefile   |  11 +-
 include/linux/string.h          |   4 +
 lib/string.c                    |  53 +++--
 lib/tests/string_kunit.c        | 344 ++++++++++++++++++++++++++++++++
 9 files changed, 645 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/lib/strchr.S
 create mode 100644 arch/riscv/lib/strnlen.S
 create mode 100644 arch/riscv/lib/strrchr.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
