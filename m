Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B58C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwhExjYAuF5ogay5uq/uS8j+I8Z5M9TBkxBCK/I7P2o=; b=apJG5SIUkocX+H
	WGIFGqbtHUWoxvcv1VgfI2ssTq3NATdYkqmSOlwE24zbUSCVFaVmw7khUIeaC6XAEBteHam6J1XUY
	m/TNkYPlmZL+XqMRl2Aa4PakTLCILL5kZ0PGSoFVC71CIGswql7Z+8bezyvJsiRLzwAnnpKpnSnox
	XrS0V5OOOmeODvMPk/jXXGwp1QzncQx/Ufc2fFIIzHn9mzo9Tcq6QAYafnuj2rx1CfzFVqMA7Tcbz
	AxlKUX1SFny6ouq/IWqF4OlVj9O1hZUJzjGr1Z3z+vWos3YoMASZjcAMJhCzRG2zi7Cj1Yf4bOy57
	ygdnXh8B266n2xaJDXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf6v-00000009j7S-1c6q;
	Wed, 19 Aug 2026 12:09:37 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf6s-00000009j60-0nT4
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 12:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787141371; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=LBnyrIO7Qk8AasBq1JmQ0vykCnGIcm4jF0dZdPwMdr0=;
	b=MGR5rsmnEaJk5QPvW8veuMGoXaDhSo2bJNtq8YigsZGr010sWSCLmCR1y/YL2LqMGRrCAajxRUVd9Ncf1VJM9vwrNcteMVGw1soB5rPFK+xYDnZtb5gSAhFmaW3Np5HjuKjJDoAILxikyTwQTzs+FlSYyhAzkl8RvUCFKOBljSg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X9GeFUY_1787141369;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9GeFUY_1787141369 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 20:09:30 +0800
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
Subject: [PATCH bpf-next v3 1/2] bpf, riscv: Add support for signed arena loads
Date: Wed, 19 Aug 2026 20:09:23 +0800
Message-ID: <67422a421852c3eed2269c6def7b5569e727617f.1787140923.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787140923.git.cp0613@linux.alibaba.com>
References: <cover.1787140923.git.cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_050934_402049_30655753 
X-CRM114-Status: GOOD (  12.07  )
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

Changes in v3:
- Restore the pseudo-code form of the PROBE_MEM32SX case comment.

Changes in v2:
- Fix extable entry overflow breaking arena_atomics load

 arch/riscv/net/bpf_jit_comp64.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..64ebd262c498 100644
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
+	/* LDX | PROBE_MEM32SX: dst = *(signed size *)(src + RV_REG_ARENA + off) */
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
