Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81730C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNWBjol6X9vs5JnLCVCjVPx1dbccxHzAbzxGC5QadFY=; b=p0KG5Wto2OZi8V
	yzcVur5T7trCYP2tqIJFUXj0+NDEBqXz3JDW0YGRFhs5TnZnLnwq93uN8z34aFKcb8G/RBdJ/V/nj
	5ZSHXjG9vu1mE9e8lU0yzWw+6u7kbMV7MMim6in3q09qlZXPUezpoKtl+IYsYMWmWNdeWMloCZRI9
	bDLA/pKJ5oMksxT1nUEDm0vzer2VQSZczI/pQs/0ipL0Z5SPd7f2QRoqGvOjLBysOu2oYflkfgjA2
	5m9YEVwdgHp5TbH+rvZIg5pGYUSj0fjnVSjSMGlB96dDeOqBSznplobcOVgV2zzeADrYz7EjMiUYr
	Zan6lpyPJ7jny5/W7ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwc37-00000009LWM-0Qma;
	Wed, 19 Aug 2026 08:53:29 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwc34-00000009LV1-0e80
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787129604; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=MWpf0VeTCBhwFwAftU7whr2vA1ztFY19iNzKSTGqoHg=;
	b=q5Nv0dtVA8RmpgC3nXLkRnHqazFdeuQOq95yQNX/A4DeiO43CXMcx6nLLe/fyQbCZF0DNHqSvmLOfU1+6aAL5MIgnTrdCLM34lheqi1t83Ny3suxYjhR4u22tRRqsXHGEWH7mqmNLDJzfUjBO3dQl0u8b2edTg9fjmhsPNJ7Iu0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X9G1fzf_1787129602;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9G1fzf_1787129602 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 16:53:23 +0800
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
Subject: [PATCH bpf-next v2 1/2] bpf, riscv: Add support for signed arena loads
Date: Wed, 19 Aug 2026 16:53:15 +0800
Message-ID: <a78cd29b238aa1aba87efeb2fc09d25a56c22f69.1787128322.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787128322.git.cp0613@linux.alibaba.com>
References: <cover.1787128322.git.cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_015326_649459_07BCBE1A 
X-CRM114-Status: GOOD (  11.89  )
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

Signed loads from arena memory are currently rejected on riscv64, as
bpf_jit_supports_insn() refuses BPF_MEMSX loads when in_arena is set,
while x86 and arm64 gained support for them in v6.18. Compilers such
as GCC-14 are free to generate signed loads into arena memory, which
breaks loading of otherwise valid BPF programs on riscv64.

Implement BPF_PROBE_MEM32SX support in the RV64 JIT by reusing the
existing arena handling: the arena base (RV_REG_ARENA) is added to
the source register and the load is emitted with sign extension
(lb/lh/lw). Add BPF_PROBE_MEM32SX to the add_exception_handler()
mode gate so that faulting loads get an exception table entry which
clears the destination register and resumes execution. Since
BPF_PROBE_MEM32SX shares its mode value (0xc0) with BPF_ATOMIC, the
gate accepts it only for LDX class instructions so that plain atomic
instructions do not register exception table entries.

Verified by running the arena LDSX selftests (arena_ldsx_disasm,
arena_ldsx_exception, arena_ldsx_s8/s16/s32) and the full
arena_atomics test suite on riscv64 QEMU, all passing.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

Changes in v2:
- Fix extable entry overflow breaking arena_atomics load

 arch/riscv/net/bpf_jit_comp64.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..acc1b16d2e2f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -777,6 +777,8 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
 	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
 	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
+	    !(BPF_MODE(insn->code) == BPF_PROBE_MEM32SX &&
+	      BPF_CLASS(insn->code) == BPF_LDX) &&
 	    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC)
 		return 0;
 
@@ -1902,13 +1904,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
+	/* LDX | PROBE_MEM32SX: sign-extending arena load */
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_W:
 	{
 		bool sign_ext;
 
 		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
-			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
+			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
+			   BPF_MODE(insn->code) == BPF_PROBE_MEM32SX;
 
-		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
+		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
+		    BPF_MODE(insn->code) == BPF_PROBE_MEM32SX) {
 			emit_add(RV_REG_T2, rs, RV_REG_ARENA, ctx);
 			rs = RV_REG_T2;
 		}
@@ -2126,10 +2134,6 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 			if (insn->imm == BPF_CMPXCHG)
 				return rv_ext_enabled(ZACAS);
 			break;
-		case BPF_LDX | BPF_MEMSX | BPF_B:
-		case BPF_LDX | BPF_MEMSX | BPF_H:
-		case BPF_LDX | BPF_MEMSX | BPF_W:
-			return false;
 		}
 	}
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
