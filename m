Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6CAC5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kbrnRLImEBg7PRWjhJ2Sbs/LcQuzxAIqQuAofiYuUUE=; b=WHRuXvvFFDXVi7
	MuN7adFanlzVePrq50XaHf1v7bRDDQjFdDNcTCB87JSPbWy5PkxafXFpbrH6L8B5xSrsoE2p+srcW
	Nc0TeyFZl9bELsWFWecKlhh0nvLdVlyhjf2E7frvFGvrughYcCBS4Eh15emqQGFUdW8M7BtciGMAn
	FxZc+Pb7w7ZlJTQzgRiLA/bCKdEA+R7hGTBBlhkxBJcvKdJ0JmOHreqVwa6nSY7Av5MgiWjGoxR9S
	iFWWInANzOgDYUr5AcpYuQHN0nttMKGHzq2FmbX1/dUTOTCHTrswISjZM5sgV+y6oMkbmNIsken1G
	aYKlTHhzeiyHTVLuWglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf6t-00000009j6o-0kBr;
	Wed, 19 Aug 2026 12:09:35 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf6q-00000009j5z-1MYD
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 12:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787141370; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nsrQsrvNgsc1Q4hzl9K1PyRWt6ItnxGRc2gHDULbnBI=;
	b=XQC7jCFhmnnYoC1darh3p7K7UfEYc4lwgtBDd8s51UMZpIW6aGJiF17nnEfxt5hHWA6FnYgE7JeN3L0hlVx4VbiNA38e1DN6y1EHZo3wbxBqvDOGxJISPExmHKd4EVSOR5odS82VfYTAHvjg1VdIukVD00JhjPGOokA3kipvoLI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X9GeFT9_1787141365;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9GeFT9_1787141365 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 20:09:29 +0800
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
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/2] bpf, riscv: Add support for signed arena loads
Date: Wed, 19 Aug 2026 20:09:22 +0800
Message-ID: <cover.1787140923.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_050933_043887_1CEA468E 
X-CRM114-Status: GOOD (  11.48  )
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

Hi,

Signed loads from arena memory are currently unsupported on riscv64:
bpf_jit_supports_insn() rejects BPF_MEMSX loads when in_arena is set,
so the verifier fails such programs with "sign extending loads from
arena are not supported yet". The x86 and arm64 JITs gained support
for them in v6.18 (a91ae3c89311, eab2a71f3a6a). Since compilers are
free to generate signed loads into arena memory (e.g. GCC-14 was
reported to do so), otherwise valid BPF programs fail to load on
riscv64.

This series adds BPF_PROBE_MEM32SX support to the RV64 JIT and
enables the corresponding selftests on riscv64:

1 implements signed arena loads in the RV64 JIT. The verifier
  already converts MEMSX loads from PTR_TO_ARENA to
  BPF_PROBE_MEM32SX once bpf_jit_supports_insn() allows them, so
  the JIT reuses the existing arena handling: the arena base
  (RV_REG_ARENA) is added to the source register and the load is
  emitted with sign extension (lb/lh/lw). BPF_PROBE_MEM32SX is also
  added to the add_exception_handler() mode gate so faulting loads
  register an exception table entry that clears the destination
  register and resumes execution.

2 enables the arena LDSX tests on riscv64: JIT disassembly
  assertions are added to arena_ldsx_disasm, and
  arena_ldsx_exception/s8/s16/s32 are now run on riscv64.

The series was verified on riscv64 with QEMU (-M virt): all five
arena_ldsx tests pass, including the exception path (load from
unallocated arena memory returns 0) and the sign-extension values
(s8/s16/s32 tests return -1 as expected). The arena_atomics test
suite also loads and runs cleanly.

Changes in v3:
- Restore the pseudo-code form of the PROBE_MEM32SX case comment.

Changes in v2:
- Fix an extable entry overflow breaking the arena_atomics load.
- Collect Reviewed-by on patch 2.

Note: the __jited assertions in patch 2 were derived from the JIT
register allocation (R0->a5, R1->a0, R8->s3, R9->s4, arena base in
s7) and the emit_ldx() code paths; happy to adjust them if a
disassembler output detail differs.

Thanks,
Pei

Chen Pei (2):
  bpf, riscv: Add support for signed arena loads
  selftests/bpf: Enable arena LDSX tests for riscv64

 arch/riscv/net/bpf_jit_comp64.c                 | 16 ++++++++++------
 .../testing/selftests/bpf/progs/verifier_ldsx.c | 17 +++++++++++++++++
 2 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
