Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5E8C83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wvCKfXsroVLkXZcdQ2JNVS5mpBmbDVg0YGD9wqvgiGU=; b=gjoegUtVa1Jrdp
	oMnLdzNCL52yVWUSMKkcaA0DvI2ksLlR8IvGN1B2qiEZCNteT8sEDNmPnCcRzEyFhyFieGc/L/Xxw
	+xmQEB94Jd8sFrkkq8Pl+FS1iQxg1l08Hz57rXOspc1A2h3Y4ChbTt4M0SK6sy1kUY3ac03Duz7D/
	iLapEB/y41w2TgoE2F0w6ztEV+icwdp8MX0+LI4xmoK3JJ7+dNAvyotzn/TcZCuulJ8GWK3y0PYoJ
	dIg1vtIfElc87x1sJ+PqlYIAM2eGKa+8h5OgRfHynp1iH2xt/lR8isXGwJtp8pPtNuz7x1N7nxDrx
	Cdj19UraHh2ibbvOVB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafb0-009wxx-0h;
	Mon, 28 Aug 2023 17:00:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafaw-009wvH-0g
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 17:00:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fee8af9cb9so32345635e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693241999; x=1693846799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWFHuz4TWzuhU6ynHIHPdsJm14S2Z0yCC4p9I+39C5w=;
        b=s340FHWJEjVhQCiBX6RAzXBIPowlnIC9z3QktT1dV6wkabMBOt2Lrht9WpTz56JdeT
         9nWpsfdJ9zhvnodtc7mjmV9+BG/sSenXTQzJPUkLhjVCRHVfVWu5tb4cnPBwyvrWaOLX
         pKiK4dj1lx3O8NMWlFC8LSDOrPJ9H3kP0nTgBjCutXXhwEpzxzw8Npjo1iGs6vqnwWNu
         RQ9Aw1WIoDQQt2hpL/Koh0P+6I7brC0PYxTDz9XGCBtVrOSUeriV+eJYCQghMsQ6FNVP
         DOk9aAXW64DLHHJGXs9tddDPfmCYYTbwCkT5uZW70Ho1HAPdI+d5IX3aZ+SVrt2Fajrp
         uDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693241999; x=1693846799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWFHuz4TWzuhU6ynHIHPdsJm14S2Z0yCC4p9I+39C5w=;
        b=QAocm1Xh56Zitt/prVLLUee6vRBhj6pV51uV2xEOr2xXOG4DGa6WLtcVbUxp/G42Ey
         NxXRLo2cFRPIPtEq5Yk8g/5n39N89/eEXe2lPzTrxqU4AlUAgiVWJ7UA9hHC0L8nKBZ1
         INHl0Ti/H+8qo+MVRIq7dVacx6UZaa756ghlBKijjCD5DjQVcsxtsNwlMQxkPf80OrGT
         57BDg8nr1k0qbCZGY2jv8kre1RgxwE9vu/DZzgXxIpg4GuP6S+xFap5BQ55i+fwVasbM
         Df4W/Yd+nYkySiGW6E5q1GNNNS0ojxbfRNcL5a4JH7zs8ksgJmZedzqxcJHd/hI+vD7r
         3MkA==
X-Gm-Message-State: AOJu0Yx1kgTGoDuKVmjSX56radWNtSfrzurpD+hJMUzeJlpmBbWT6Yeg
	VXwzmgCtmX512y8uhKkhlcs=
X-Google-Smtp-Source: AGHT+IEatBn6aeG9NY2XfQLWGllzhYHkWb57abOc3ulGzXBOGHu195uKivOEm8ZJAdclF2yoS2uw0w==
X-Received: by 2002:a5d:4f0f:0:b0:319:89ce:da0b with SMTP id c15-20020a5d4f0f000000b0031989ceda0bmr19271927wru.68.1693241999026;
        Mon, 28 Aug 2023 09:59:59 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b0031ad5fb5a0fsm11033613wrx.58.2023.08.28.09.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 09:59:58 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 0/3] bpf, riscv: use BPF prog pack allocator in BPF JIT
Date: Mon, 28 Aug 2023 16:59:55 +0000
Message-Id: <20230828165958.1714079-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_100006_277588_840C1CEE 
X-CRM114-Status: GOOD (  18.36  )
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

Changes in v2 -> v3:
1. Fix maximum width of code in patches from 80 to 100. [All patches]
2. Add checks for ctx->ro_insns == NULL. [Patch 3]
3. Fix check for edge condition where amount of text to set > 2 * pagesize
   [Patch 1 and 2]
4. Add reviewed-by in patches.
5. Adding results of selftest here:
   Using the command: ./test_progs on qemu
   Without the series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED
   With this series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED

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
 arch/riscv/kernel/patch.c       | 114 ++++++++++++++++++++++++++++++--
 arch/riscv/net/bpf_jit.h        |   3 +
 arch/riscv/net/bpf_jit_comp64.c |  60 +++++++++++++----
 arch/riscv/net/bpf_jit_core.c   | 106 ++++++++++++++++++++++++-----
 5 files changed, 251 insertions(+), 33 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
