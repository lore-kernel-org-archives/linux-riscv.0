Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E3EC98332
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RuwZ7FEgPXWLuvvsp4SvnOi0mmZB+VdhEXTaPuS/zUY=; b=38HLjJo6gruwIq
	ChAOYqc9q/95YPN51mCQ6MP7hpZ6Or9DgH140aW/BWuc/y60/QjgyIHizSsRZV2FidWeOVgbfOtRl
	pfH8G9KZtccltu9X1OKWOKXzI6lXp2Po+ZbsrquRsv0cxt7KcVoTB1o7iJYSBmJOvZAokynzhZ98n
	2peyYSumhE3ZXgzmB4EeP8kmxQcalUT3wbS72DBMvfLgMlWnK0JVL0JlBgmBGAQP4xIz+JE/VE9YD
	HrDO84H/Do3e57xuvYonJDnMWGnkR8uFM7DE7ollHxkHdHx0VZZgmX5hzfl5o/Jo9zCedA7cgUwfy
	mDphL+WpzMR28+ak3DKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAStC-0000000FULD-2Ol4;
	Sat, 26 Sep 2026 13:56:30 +0000
Received: from out-119.mta1.migadu.com ([95.215.58.119] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASt8-0000000FUJU-2Zkp
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 13:56:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Jk1pfOxu5P7hTWP0WaNJ55pPrxw8o/7nlJ9L9NFZsYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790430982; v=1; x=1791035782;
 b=jeE4WsTcy24Pskiw/BwbbL7baL7nWh3w5py6LlwtqYzqCzLzZP3jqyuEg2Z8HRY2+x34jwLL
 Jleitm1hR8los07K3crew6R0NT+yBZX80MO2j9APE6o7szGPuXTjHUu6+W15ULW4YNxoV6epp/U
 11VZ0nVs+1m4D2OpQfZYjNmY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e6577e4ede2e14f5;
	Sat, 26 Sep 2026 13:56:21 +0000
X-Mizu-Trace-ID: e6577e4ede2e14f5
X-Migadu-Flow: FLOW_OUT
From: "Florent Revest (Anthropic)" <florent.revest@linux.dev>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: "Florent Revest (Anthropic)" <florent.revest@linux.dev>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Junseo Lim <zirajs7@gmail.com>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH bpf v5 0/3] bpf: Fix use-after-free of progs detached from busy trampolines
Date: Sat, 26 Sep 2026 13:55:57 +0000
Message-ID: <20260926135605.1217928-1-florent.revest@linux.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_065626_790759_E5A01167 
X-CRM114-Status: GOOD (  19.90  )
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

A task running in a trampoline image can call a prog that was detached
and freed in the meantime, when it slept in a sleepable prog before
reaching the detached one or was preempted right before calling it.
Patch 1 handles the preempted case with an RCU tasks grace period,
patch 2 handles the sleeping case by patching detached progs out of the
images that still call them and patch 3 adds a selftest for the sleeping
case.

Since v3, only the nop of the prog that is detached is patched, in every
image that isn't freed yet, like v2 did. Progs that stay attached keep
running for the tasks that are in old images, ip_after_call is gone and
the call to the original function is never skipped.

On riscv and loongarch a jump of any range takes several instructions,
and as bpf-ci and Alexei pointed out, a task preempted in the middle of
such a patch site could resume into half of the new sequence. v5 makes
the skip sites a single instruction there, patched to a jal / b through
a new arch_bpf_trampoline_skip() hook, like their jump labels. I could
only test these two under qemu.

Tested on x86_64 under KVM and on arm64, s390x, powerpc64le, riscv64
and loongarch64 under qemu TCG, all with KASAN: the new selftest crashes
the unpatched kernel and passes with the series on every one of them,
along with trampoline_count, fentry/fexit, fentry_fexit, modify_return
and lsm_cgroup (and the full test_progs on x86_64). On x86_64, 18
fsession progs with cookies on an 11 argument function still fit in the
image. Same on bpf-next, where patch 2 has trivial context conflicts in
the x86 and arm64 JITs.

Changes since v4
(https://lore.kernel.org/bpf/20260925100342.481242-1-florent.revest@linux.dev/):
- riscv, loongarch: single instruction skip sites, patched through
  arch_bpf_trampoline_skip(), loongarch keeps its limit of 38 (bpf-ci,
  Alexei)
- arm64: say in bpf_arch_text_poke() why patching out a detached prog
  needs no synchronization (bpf-ci)
- Comment fixes (bpf-ci)
- Cc the arch maintainers and lists

Changes since v3
(https://lore.kernel.org/bpf/20260924170543.1017048-1-florent.revest@linux.dev/):
- Only patch the nop of the prog that is detached, in all the images
  that aren't freed yet, like v2 did, and explain why a list of images
  is needed (Alexei, bpf-ci)
- Lower BPF_MAX_TRAMP_LINKS to 36 on x86, the worst case no longer fit
  in a page with the nops (bpf-ci, Alexei)
- selftest: wait for the detached progs to really be freed before
  releasing the task, the grace period of patch 1 made the previous wait
  too short (bpf-ci). Detach two progs one after the other, so that the
  second detach has to reach an image that isn't the current one anymore
- Keep a single comment block in bpf_tramp_image_put() (bpf-ci)

Changes since v2
(https://lore.kernel.org/bpf/20260912095924.866254-1-florent.revest@linux.dev/):
- Patch all the nops in bpf_tramp_image_put() instead of the detached
  prog's nop at detach time, drop the image list, the trampoline
  backpointer and ip_after_call (Alexei)
- Wait for an RCU tasks grace period before freeing progs that were
  linked to a trampoline, for tasks preempted right before the enter
  helper (Junseo, sashiko)
- Initialize the jit ctx in loongarch's arch_bpf_trampoline_size() and
  the dummy image in every arch_bpf_trampoline_size() (bpf-ci)
- selftest: move the userfaultfd helper to testing_helpers.c and share
  it with bpf_mod_race, comment fixes (bpf-ci), add a subtest where the
  original function runs between the sleeping prog and the detached one

Changes since v1
(https://lore.kernel.org/bpf/20260819122252.1782790-1-florent.revest@linux.dev/):
- Patch nops in front of detached progs instead of taking prog
  references from the image (Alexei)
- Lower BPF_MAX_TRAMP_LINKS on arm64, loongarch and powerpc so the
  image still fits in a page
- Explain that the sleepable case doesn't depend on CONFIG_PREEMPTION
  (Kumar, Alexei)
- Add a selftest (Jiri, Alexei)
- Add Sechang's Reported-by (Junseo, Kumar)
- Drop Leon's and Kumar's acks since the code changed entirely

Florent Revest (Anthropic) (3):
  bpf: Wait for an RCU tasks grace period before freeing trampoline
    progs
  bpf: Skip detached progs in trampoline images that are still in use
  selftests/bpf: Detach a trampoline prog while a task sleeps before it

 arch/arm64/net/bpf_jit_comp.c                 |  37 ++--
 arch/loongarch/net/bpf_jit.c                  |  60 ++++--
 arch/powerpc/net/bpf_jit_comp.c               |  45 +++--
 arch/riscv/net/bpf_jit_comp64.c               |  56 ++++--
 arch/s390/net/bpf_jit_comp.c                  |  46 +++--
 arch/x86/net/bpf_jit_comp.c                   |  26 ++-
 include/linux/bpf.h                           |  45 ++++-
 kernel/bpf/syscall.c                          |  19 +-
 kernel/bpf/trampoline.c                       |  85 ++++++--
 .../selftests/bpf/prog_tests/bpf_mod_race.c   |  34 +---
 .../bpf/prog_tests/tramp_prog_detach.c        | 188 ++++++++++++++++++
 .../selftests/bpf/progs/tramp_prog_detach.c   |  56 ++++++
 tools/testing/selftests/bpf/testing_helpers.c |  28 +++
 tools/testing/selftests/bpf/testing_helpers.h |   2 +
 14 files changed, 572 insertions(+), 155 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tramp_prog_detach.c
 create mode 100644 tools/testing/selftests/bpf/progs/tramp_prog_detach.c


base-commit: ab39974240a0cff765f3bb9cce81d8001ffdb144
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
