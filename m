Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6BBC982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DOifJM1JVXI9ECQmhRG5lQsV4+BjgBDVMXlNZwSvLCU=; b=hGtvHux5J8t8aG
	vQaOd3dkTOiRY5va2iYi3K1w/1NewQ8VHGkGuRIQEmQ8puzciWNEXPG0oHSK1vqCstiSSUquoD4bh
	Hr4i9SOnvOY3A2j6ULR8Us3Ugxw59Q3SS9sPzFKg6bNgtb8Gob9GaABCcYI0DKeXXwpEIWxXJZkeY
	9BCGb8zwBLPz3BDoCZQ62GoJ1UjZUx9UvfQK75Kep4TtQP+EUCFMmvl+AE/5uMcLR1Kj0MTL+ybo9
	R2dtt2XMHNFaKQz0HKZlfyi0wMg4pPygjD5BQOdTtMe+cFYIF+Qep8uAlItDjQH63d9GI1MaBEjtA
	y3CGhJULehmBniPORfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MjO-00000008LRx-3B50;
	Wed, 23 Sep 2026 13:09:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MjN-00000008LRK-3SnH
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 13:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dVPfmbTv+JM2jarPBZCBYnAw22AyOzA3cOqy6hp9N2c=; b=PVpggXG6ilaHIGIM0vEs0chpbF
	E2HJQ8gSDvHQOBUfWybst5tC5JSXJIiMVgKAk4u1nHiSfDO1Q9N9Xm8t4QS4lc4QvaJMn1EiWbVK3
	jPHJrSeMfoudYxv3URyBxu1XGyAEWijuF62B4R2UIibMoRTef2k7ieNHOU7AyBOP851jifFArMNbt
	bpNWVP+GrUBn8vKdKxYJctgE9nIE7iYwHmS2++D16UujBA+eje83Gi0wnrwJjq9mHW03G/1QM98xs
	dC5BLCnY1BEyh++N4n4eVeOnoelOxZRknuFeLckQ8jvkptclU6KZWcLEiTUW0iobaoAmvXri2BitT
	16Kzo2+g==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9MjH-0000000EmuJ-2rpP
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 13:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790168967; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dVPfmbTv+JM2jarPBZCBYnAw22AyOzA3cOqy6hp9N2c=;
	b=WcIJi0Dl9LrYUV5ZHM9LD/3h+tVkQKHVWYceECyZGMK112Ommf6P7qq/kFzEj6vM3tNd51N9Em2mBIg2NzXOtHvW++7wJYhH1edS5aRfqPSs4GQGd1CAompsLvE10PUPo492SHTo88hGJVfzG/+MFGX1a9f9GdLfeqdZXRm5K40=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBX4ZCL_1790168937;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBX4ZCL_1790168937 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 21:09:26 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 0/2] bpf, riscv: Add support for indirect jumps
Date: Wed, 23 Sep 2026 21:08:54 +0800
Message-ID: <20260923130856.1157-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_140946_285843_4750FA8C 
X-CRM114-Status: UNSURE (   7.44  )
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

The indirect jump instruction (BPF_JMP | BPF_JA | BPF_X, "gotox") and the
BPF_MAP_TYPE_INSN_ARRAY jump tables it consumes are core features: the
verifier accepts them on every architecture, and the x86-64, arm64 and
powerpc JITs implement them. On riscv64 a program using gotox passes
verification and then fails to load, because the JIT does not know the
opcode and CONFIG_BPF_JIT_ALWAYS_ON leaves no interpreter to fall back
onto.

This series adds the riscv64 support and turns the existing selftests on
for that architecture.

Patch 1 emits "jalr zero, rd, 0" for gotox and publishes the xlated to
jitted offsets through bpf_prog_update_insn_ptrs(), which is what fills
in the jump table addresses. Patch 2 widens the arch guard in
verifier_gotox.c to riscv64, the same way arm64 and powerpc were enabled.

Testing
=======

Environment: QEMU virt rv64, with CONFIG_BPF_JIT=y,
CONFIG_BPF_JIT_ALWAYS_ON=y, CONFIG_DEBUG_INFO_BTF=y; selftests
cross-built with clang 22.

- test_progs -t verifier_gotox: 27/27 subtests pass on bpf-next, 13 of
  them executed through BPF_PROG_TEST_RUN.
- test_progs-cpuv4 -t bpf_gotox: 14/14 subtests pass, none skipped.
  The cpuv4 flavor is needed here because bpf_gotox gates its subtests
  on __BPF_FEATURE_GOTOX, which clang only defines for -mcpu=v4.

Chen Pei (2):
  bpf, riscv: Add support for indirect jumps
  selftests/bpf: Enable gotox tests for riscv64

 arch/riscv/net/bpf_jit_comp64.c                  |  5 +++++
 arch/riscv/net/bpf_jit_core.c                    | 16 ++++++++++++++--
 .../testing/selftests/bpf/progs/verifier_gotox.c |  8 ++++++--
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
