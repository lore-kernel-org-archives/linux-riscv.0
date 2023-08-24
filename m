Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475CBC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FXO4VGK5OrePLFdO66OxojK/ZYiE2MTK6cTCEVh10Ac=; b=21BUruV+ruQAPC
	YI/QKEAdzkriuSAMBLxcgAs8tCA24rEM/5M/KUVzi0xYDX6HdUGFotyAQ/Px7hT1SUT5nSd/97zwT
	ZJgS6PLVYzdQSyj6+ZeOV3mT8ilstDUwTdN2wnzw/2yAE+MxIgjFVNqVj5jk9IkaNcB6bHLLLlLXM
	0OA6BtENDJ17Py2UZ9pmR6MvGft8VAj0Xxr+WAKlGUjcgl5Wmdp8+mL9LLGRtHSfCB9ctKEAepiO7
	p/+GCrqCQNRd1eIYYIuzClDUwr2cG96mXjIqs2fRcc7GWdRI4GYeHcE7mtDqbJPNoa6BQm5bOKtLa
	vDj6EDzZ/yevO/DV1jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZAR6-00392H-0B;
	Thu, 24 Aug 2023 13:31:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZAR3-00390l-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 13:31:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so2365466f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692883897; x=1693488697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FdYUtkQiM1JM6m+vtN/k3hYAug9sY5fG1iQwa7Fcq4=;
        b=JpjQHo7+L3DPs8XZmCudaeskHTtaLnVxKG3aPWyUyez3hsjSz8vtopkx2yyIcRiRwV
         CxbR+bJeaZsQKnRn99C5YuuA41+7pQ+IxE+w84BwuYF16Wiq+Im0RjfXuQTXJmJPZRGo
         MLkfrXomm7xEAvMroz3Np7Cal+V0VCqQceP1qq2IQWQe3ewpHqWEu08iPKaLPy2GecAb
         loS8fSaRQdL7IXxU+UmJLDka//AXrRgdbsFORtfcHTVrGxNHkiexGG83SPB5kBihTOZ8
         SRX9QC4MfIUeMPBio0rWa1cVp8JPa+rniyDp31PXqhlrZuVY3UScBjYkVh6OUpYHkv0e
         qtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692883897; x=1693488697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FdYUtkQiM1JM6m+vtN/k3hYAug9sY5fG1iQwa7Fcq4=;
        b=JPucqjnFmkKgGDfbwEh+DLHE+47qZ84anEuU/YlB0/ou/l4PrfKByE8gp2uwxNXjkC
         bg8nQov9jkgadXGLAiqB3tdjHwdOiDm/ciAECgsiYnQUOgiu4S/lXDDq0A5gGkW81B7g
         Ge8zF9LKmtgvOfqy90qrm27w3Tppi5URYZjAOxDTQTbmTi5QUUO+YZmWOGMRJOHKrqHR
         SuZZRe5qiD9KsuZO8Ydljy7AO0lZootGplpkP4vp/CHpSlX2pLTefM0KKriYnxgZ4UBc
         HEEp0kie7SzxCkpqMLX0NLITwsq+PkxY3/Hb3HV+mLHuzGOhPI5NKfe4iAKZO93hhSH6
         PuDQ==
X-Gm-Message-State: AOJu0YzHlXyahtyRjmw0Q4Uxen4gbGYpNT7C+A9jWksBG1X6omv6FMsB
	6dplULVRdJt6rCZAtM8zjGQ=
X-Google-Smtp-Source: AGHT+IHL/HgZh8yHs1r/hj6jGyz5kbloHuUrEeF21EDf5fE7o76UP5eUp1ft4jmivITX/DrUjdKf7w==
X-Received: by 2002:a05:6000:8b:b0:314:36f0:2214 with SMTP id m11-20020a056000008b00b0031436f02214mr10769903wrx.6.1692883897414;
        Thu, 24 Aug 2023 06:31:37 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id h11-20020a5d548b000000b00317e77106dbsm22396112wrv.48.2023.08.24.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 06:31:36 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 0/3] bpf, riscv: use BPF prog pack allocator in BPF JIT
Date: Thu, 24 Aug 2023 13:31:32 +0000
Message-Id: <20230824133135.1176709-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_063141_239914_53F04A78 
X-CRM114-Status: GOOD (  16.70  )
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

Changes in v1 -> v2:
1. Implement a new function patch_text_set_nosync() to be used in bpf_arch_text_invalidate().
   The implementation in v1 called patch_text_nosync() in a loop and it was bad as it would
   call flush_icache_range() for every word making it really slow. This was found by running
   the test_tag selftest which would take forever to complete.

Here is some data to prove the V2 fixes the problem:

Without this series:
root@rv-selftester:~/src/kselftest/bpf# time ./test_tag
test_tag: OK (40945 tests)

real    7m47.562s
user    0m24.145s
sys     6m37.064s

With this series applied:
root@rv-selftester:~/src/selftest/bpf# time ./test_tag
test_tag: OK (40945 tests)

real    7m29.472s
user    0m25.865s
sys     6m18.401s

BPF programs currently consume a page each on RISCV. For systems with many BPF
programs, this adds significant pressure to instruction TLB. High iTLB pressure
usually causes slow down for the whole system.

Song Liu introduced the BPF prog pack allocator[1] to mitigate the above issue.
It packs multiple BPF programs into a single huge page. It is currently only
enabled for the x86_64 BPF JIT.

I enabled this allocator on the ARM64 BPF JIT[2]. It is being reviewed now.

This patch series enables the BPF prog pack allocator for the RISCV BPF JIT.
This series needs a patch[3] from the ARM64 series to work.

======================================================
Performance Analysis of prog pack allocator on RISCV64
======================================================

Test setup:
===========

Host machine: Debian GNU/Linux 11 (bullseye)
Qemu Version: QEMU emulator version 8.0.3 (Debian 1:8.0.3+dfsg-1)
u-boot-qemu Version: 2023.07+dfsg-1
opensbi Version: 1.3-1

To test the performance of the BPF prog pack allocator on RV, a stresser
tool[4] linked below was built. This tool loads 8 BPF programs on the system and
triggers 5 of them in an infinite loop by doing system calls.

The runner script starts 20 instances of the above which loads 8*20=160 BPF
programs on the system, 5*20=100 of which are being constantly triggered.
The script is passed a command which would be run in the above environment.

The script was run with following perf command:
./run.sh "perf stat -a \
        -e iTLB-load-misses \
        -e dTLB-load-misses  \
        -e dTLB-store-misses \
        -e instructions \
        --timeout 60000"

The output of the above command is discussed below before and after enabling the
BPF prog pack allocator.

The tests were run on qemu-system-riscv64 with 8 cpus, 16G memory. The rootfs
was created using Bjorn's riscv-cross-builder[5] docker container linked below.

Results
=======

Before enabling prog pack allocator:
------------------------------------

Performance counter stats for 'system wide':

           4939048      iTLB-load-misses
           5468689      dTLB-load-misses
            465234      dTLB-store-misses
     1441082097998      instructions

      60.045791200 seconds time elapsed

After enabling prog pack allocator:
-----------------------------------

Performance counter stats for 'system wide':

           3430035      iTLB-load-misses
           5008745      dTLB-load-misses
            409944      dTLB-store-misses
     1441535637988      instructions

      60.046296600 seconds time elapsed

Improvements in metrics
=======================

It was expected that the iTLB-load-misses would decrease as now a single huge
page is used to keep all the BPF programs compared to a single page for each
program earlier.

--------------------------------------------
The improvement in iTLB-load-misses: -30.5 %
--------------------------------------------

I repeated this expriment more than 100 times in different setups and the
improvement was always greater than 30%.

This patch series is boot tested on the Starfive VisionFive 2 board[6].
The performance analysis was not done on the board because it doesn't
expose iTLB-load-misses, etc. The stresser program was run on the board to test
the loading and unloading of BPF programs

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
[2] https://lore.kernel.org/all/20230626085811.3192402-1-puranjay12@gmail.com/
[3] https://lore.kernel.org/all/20230626085811.3192402-2-puranjay12@gmail.com/
[4] https://github.com/puranjaymohan/BPF-Allocator-Bench
[5] https://github.com/bjoto/riscv-cross-builder
[6] https://www.starfivetech.com/en/site/boards

Puranjay Mohan (3):
  riscv: extend patch_text_nosync() for multiple pages
  riscv: implement a memset like function for text
  bpf, riscv: use prog pack allocator in the BPF JIT

 arch/riscv/include/asm/patch.h  |   1 +
 arch/riscv/kernel/patch.c       | 113 ++++++++++++++++++++++++++++++--
 arch/riscv/net/bpf_jit.h        |   3 +
 arch/riscv/net/bpf_jit_comp64.c |  56 +++++++++++++---
 arch/riscv/net/bpf_jit_core.c   | 113 +++++++++++++++++++++++++++-----
 5 files changed, 255 insertions(+), 31 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
