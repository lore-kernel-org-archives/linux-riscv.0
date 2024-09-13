Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D16EEEC02
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 02:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4P7EvzCiw9o+OiE9khMpHw+vflGLaGpvZC1JMYBEOM=; b=eYxPNzTQ4Em//W
	LUX7badD2R1b8rubxdAfASg4kk394b+IHoFnXUK+mPbdo8VCrCKE2vzGaXZMNtsiFPoQKeWz4X36C
	tO+tmMXaC1CS8LmwrJfkCf/VH4l//SiMvoaimhx692aNmJnDhkRtHs1GvqhS+BbY4eewp0IIg6gpM
	Y2/vI7qyBO8J1pTsnhhgDh+XrA05tk4E1jOOt2TTEKf046ntxbgxTabAVQMgkFk398q7DOJc/to3v
	8PGgmTRooQ4WmXTcrzWHCWqK95wol+SfJitlshWKDdsN3mI1tkrN/GrOA9OtIQrJ2jDZO0Rj5Ofrk
	LT/2zqTxFLAtooMgSuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sow24-0000000EjaA-34ez;
	Fri, 13 Sep 2024 02:27:36 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sow21-0000000EjZN-03W0
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 02:27:35 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowAC3vh4Eo+NmTrhAAw--.28619S3;
	Fri, 13 Sep 2024 10:27:18 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 2/2] selftests/mm: skip virtual_address_range tests on riscv
Date: Fri, 13 Sep 2024 10:26:35 +0800
Message-Id: <20240913022635.751505-2-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
References: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3vh4Eo+NmTrhAAw--.28619S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww13Kr13WryrGw1rAr13Jwb_yoW8ZFW7pa
	4xA34Yvr10gFn7JF1kur4DXFW8Ka1kGF48tFyUZryDur13Jry7ur4fKr4Ut3WagrWFqw4r
	Z3WfW3s3Z3WUJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxUx5EfUUUUU
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgTB2bjgUZ5HAAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_192733_445545_29FD011D 
X-CRM114-Status: GOOD (  10.65  )
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

RISC-V doesn't currently have the behavior of restricting the virtual
address space which virtual_address_range tests check, this will
cause the tests fail. So lets disable the whole test suite for riscv64
for now, not build it and run_vmtests.sh will skip it if it is not present.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 tools/testing/selftests/mm/Makefile       |  2 ++
 tools/testing/selftests/mm/run_vmtests.sh | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 84573ddfcfa2..912778347213 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -112,7 +112,9 @@ endif
 
 ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64))
 TEST_GEN_FILES += va_high_addr_switch
+ifneq ($(ARCH),riscv64)
 TEST_GEN_FILES += virtual_address_range
+endif
 TEST_GEN_FILES += write_to_hugetlbfs
 endif
 
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 03ac4f2e1cce..7caa624a2e5a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -347,10 +347,12 @@ if [ $VADDR64 -ne 0 ]; then
 	# allows high virtual address allocation requests independent
 	# of platform's physical memory.
 
-	prev_policy=$(cat /proc/sys/vm/overcommit_memory)
-	echo 1 > /proc/sys/vm/overcommit_memory
-	CATEGORY="hugevm" run_test ./virtual_address_range
-	echo $prev_policy > /proc/sys/vm/overcommit_memory
+	if [ -x ./virtual_address_range ]; then
+		prev_policy=$(cat /proc/sys/vm/overcommit_memory)
+		echo 1 > /proc/sys/vm/overcommit_memory
+		CATEGORY="hugevm" run_test ./virtual_address_range
+		echo $prev_policy > /proc/sys/vm/overcommit_memory
+	fi
 
 	# va high address boundary switch test
 	ARCH_ARM64="arm64"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
