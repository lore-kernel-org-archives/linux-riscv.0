Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1293C83F27
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=58tCduGwWlQkeusIF++rhf7PGOAf8tULeeHVX92qfzo=; b=rfHU07/MaN46qb
	tF4LLFPGpFG+9IgbQLLWGhclX+EbDhncPryqwbEmsAc+PLFJpX4IWkby6OriwfsMpubRtY4Zi19UT
	oM4a1X7ncQrxjzyxBML1naFchalbnZegCz2Y/M7i/8vwgddZvOuvv+/0Yy5q9F4Ss4NlD4vkOfhkS
	XOjRczBNNADpEEbxAdlFCvQA5yVnBntHCeQLIK5SAKhf40cnNln4mD2PpnKBwLHxB88nVux5L5kfu
	B9B3A+vDrj+GOwggjFYQ/g0mdy8f4abZrs70PafBEbd1pu4PN5NYXYkw1fZAP2mlWN1b0t/7dQbDe
	luipMBS/J9kweLglezRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eP-0000000E4d0-3U5v;
	Sat, 19 Jul 2025 09:14:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eN-0000000E4Z8-1N47
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:37 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw06KzLzKHMmS
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7A9F01A0D8D
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:23 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S2;
	Sat, 19 Jul 2025 17:14:23 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 00/10] Add support arena atomics for RV64
Date: Sat, 19 Jul 2025 09:17:20 +0000
Message-Id: <20250719091730.2660197-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1DAryftr4fCFW3Kw4DArb_yoW5AFW3pr
	43Gr9rGa15Ww1UCa9I9a4xC345Ca1Yvw15Jw4kAw1xAF1Ygr15JFZ2k3W3Ar15Krs3Xa1Y
	kryjqa4jyw4UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021435_702552_6B792F1D 
X-CRM114-Status: UNSURE (   6.11  )
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

From: Pu Lehui <pulehui@huawei.com>

patch 1-3 refactor redundant load and store operations.
patch 4-7 add Zacas instructions for cmpxchg.
patch 8 optimizes exception table handling.
patch 9-10 add support arena atomics for RV64.

Tests `test_progs -t atomic,arena` have passed as shown bellow,
as well as `test_verifier` and `test_bpf.ko` have passed.

$ ./test_progs -t arena,atomic
#3/1     arena_atomics/add:OK
#3/2     arena_atomics/sub:OK
#3/3     arena_atomics/and:OK
#3/4     arena_atomics/or:OK
#3/5     arena_atomics/xor:OK
#3/6     arena_atomics/cmpxchg:OK
#3/7     arena_atomics/xchg:OK
#3/8     arena_atomics/uaf:OK
#3/9     arena_atomics/load_acquire:OK
#3/10    arena_atomics/store_release:OK
#3       arena_atomics:OK
#4/1     arena_htab/arena_htab_llvm:OK
#4/2     arena_htab/arena_htab_asm:OK
#4       arena_htab:OK
#5/1     arena_list/arena_list_1:OK
#5/2     arena_list/arena_list_1000:OK
#5       arena_list:OK
#6/1     arena_spin_lock/arena_spin_lock_1:OK
#6/2     arena_spin_lock/arena_spin_lock_1000:OK
#6/3     arena_spin_lock/arena_spin_lock_50000:OK
#6       arena_spin_lock:OK
#10      atomic_bounds:OK
#11/1    atomics/add:OK
#11/2    atomics/sub:OK
#11/3    atomics/and:OK
#11/4    atomics/or:OK
#11/5    atomics/xor:OK
#11/6    atomics/cmpxchg:OK
#11/7    atomics/xchg:OK
#11      atomics:OK
#513/1   verifier_arena/basic_alloc1:OK
#513/2   verifier_arena/basic_alloc2:OK
#513/3   verifier_arena/basic_alloc3:OK
#513/4   verifier_arena/basic_reserve1:OK
#513/5   verifier_arena/basic_reserve2:OK
#513/6   verifier_arena/reserve_twice:OK
#513/7   verifier_arena/reserve_invalid_region:OK
#513/8   verifier_arena/iter_maps1:OK
#513/9   verifier_arena/iter_maps2:OK
#513/10  verifier_arena/iter_maps3:OK
#513     verifier_arena:OK
#514/1   verifier_arena_large/big_alloc1:OK
#514/2   verifier_arena_large/access_reserved:OK
#514/3   verifier_arena_large/request_partially_reserved:OK
#514/4   verifier_arena_large/free_reserved:OK
#514/5   verifier_arena_large/big_alloc2:OK
#514     verifier_arena_large:OK
Summary: 8/39 PASSED, 0 SKIPPED, 0 FAILED

Pu Lehui (10):
  riscv, bpf: Extract emit_stx() helper
  riscv, bpf: Extract emit_st() helper
  riscv, bpf: Extract emit_ldx() helper
  riscv: Separate toolchain support dependency from RISCV_ISA_ZACAS
  riscv, bpf: Add rv_ext_enabled macro for runtime detection extentsion
  riscv, bpf: Add Zacas instructions
  riscv, bpf: Optimize cmpxchg insn with Zacas support
  riscv, bpf: Add ex_insn_off and ex_jmp_off for exception table
    handling
  riscv, bpf: Add support arena atomics for RV64
  selftests/bpf: Enable arena atomics tests for RV64

 arch/riscv/Kconfig                            |   1 -
 arch/riscv/include/asm/cmpxchg.h              |   6 +-
 arch/riscv/kernel/setup.c                     |   1 +
 arch/riscv/net/bpf_jit.h                      |  70 ++-
 arch/riscv/net/bpf_jit_comp64.c               | 516 +++++-------------
 .../selftests/bpf/progs/arena_atomics.c       |   9 +-
 6 files changed, 214 insertions(+), 389 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
