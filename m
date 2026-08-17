Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B3DC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLZuTLh+q3cmGvzq5kIWRVT7E1DPM7tlS5OukM4rNN4=; b=QtvIr9M676D5AG
	75WemmVQgKkAG3emd5v1SZQOSULRGWvx+jQnr1jybxEnjm7NujgVRhzgQMWuo5lPIVtmxXN99oKS5
	1V6RDnI+O6muOoYH6qt8gia8dlt6MxAyv/WfXjuhc191EwmK5wM8eCj2yt+8ZKprqTl//xDpk8K3r
	eSrhP6q24ogLY+l8fMwAzytYpHatTsI4WM2I1Cxc0oJAtyJlUYT17p+8WwfMNk/N1fgdvOIBfE4qu
	dfEO9J3/BKIw5hxs63VfOtzcHhzqLf5Cxbf+0tGu6CdZse3qBD/xGuU8p//sWJjXtN9EEoHaQib7y
	9nLWUfa5sgTtFWGptniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvriJ-00000005XWf-3IvL;
	Mon, 17 Aug 2026 07:24:55 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvriG-00000005XV8-2j0D
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 07:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786951486; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=q4ERmdk1+RsEzsn5I3v/zlMZ2pSAGeBy9Gl7zpbPgVE=;
	b=B42yRZBgpGRf1K3y9sGF+56M86AZGZAFwVfEnGLX4xUPwcJ8jL2oL87xcnlGozKdLGwYOp5L3Uw0ibM7sjXfTwtuuYQIJSxBwI2L0jnY2L3QR4RxWpVmOZsCz2wth+XzzrMKYXRBb7YvlA7Ue2XZmqmtIrsNqjaUswK4B7QGwtc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X946s41_1786951484;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X946s41_1786951484 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Aug 2026 15:24:45 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: eddyz87@gmail.com,
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
Subject: [PATCH bpf-next 1/2] bpf, riscv: Add support for signed arena loads
Date: Mon, 17 Aug 2026 15:24:32 +0800
Message-ID: <3445fb0231f9c72496ae840e9dca675b15899433.1786708960.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786708960.git.cp0613@linux.alibaba.com>
References: <cover.1786708960.git.cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_002453_023020_366DBCFB 
X-CRM114-Status: GOOD (  10.57  )
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
clears the destination register and resumes execution.

Verified by running the arena LDSX selftests (arena_ldsx_disasm,
arena_ldsx_exception, arena_ldsx_s8/s16/s32) on riscv64 QEMU, all
passing.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..5786f7dfc8a7 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -777,6 +777,7 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
 	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
 	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32SX &&
 	    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC)
 		return 0;
 
@@ -1902,13 +1903,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
@@ -2126,10 +2133,6 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
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
