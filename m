Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B18A606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztiU327U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htohICOmSZZOs0zb78krmUan2jbc4jJ9D1l2Q4AJ8v8=; b=ztiU327UqBCqKF
	Ps19uUsaCpvsn90TDD2OUBhbhgc33qCZeORCLj8r+wO6prYOcj+wgRgdxmI4T/89njuSYJWjS0zcx
	08NRb/cXZ5CfKdY1p2NRXO5drCFssdQjVWnx3VQiuarigy+SIXHGRk2323J3GdQepMKn5X9iQqowT
	BirzSPh8jFGvIvx3/p68dELpm41RCWFyIeyIc8OHhHfqNIxO7RYq6M8lXNAmZWEu5Fcg7uGqMEPgU
	DD4on8lPBdVDptbq6ojeAvFquQpa+fZgke9smYq55/5QnbCdpfEKDzz341TN2exlOdsAXfyPoxhAI
	1m90g7uDbME9WhSeAWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPGC-0000000B7Pj-1zKY;
	Wed, 21 Oct 2026 05:53:12 +0000
Received: from gw.zju.edu.cn ([210.32.2.4] helo=zju.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPG6-0000000B7On-27Ne;
	Wed, 21 Oct 2026 05:53:10 +0000
Received: from zju.edu.cn (unknown [10.162.163.215])
	by mtasvr (Coremail) with SMTP id _____wCnU30vU9hqxYmsAQ--.12518S3;
	Wed, 21 Oct 2026 13:52:48 +0800 (CST)
Received: from lutetium.tail477849.ts.net (unknown [10.162.163.215])
	by mail-app2 (Coremail) with UTF8SMTPA id zC_KCgDHHXwuU9hqfMt1AA--.30733S2;
	Wed, 21 Oct 2026 13:52:47 +0800 (CST)
From: tangyazhou@zju.edu.cn
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	David Vernet <void@manifault.com>,
	bpf@ietf.org
Cc: tangyazhou@zju.edu.cn,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Tianci Cao <ziye@zju.edu.cn>,
	Yazhou Tang <tangyazhou518@outlook.com>,
	Shenghao Yuan <shenghaoyuan0928@163.com>
Subject: [PATCH bpf-next v2 2/8] bpf, x86: JIT UHMUL and SHMUL on x86-64
Date: Wed, 21 Oct 2026 13:52:30 +0800
Message-ID: <20261021-bpf-hmul-v2-2-88e260099f7d@outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com>
References: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CM-TRANSID: zC_KCgDHHXwuU9hqfMt1AA--.30733S2
X-CM-SenderInfo: qssvjiasrsq6lmxovvfxof0/1tbiAgoLCmrXxB0cWQAAso
X-CM-DELIVERINFO: =?B?pob2uAXKKxbFmtjJiESix3B1w3vD7IpoGYuur0o+r46DyAi5OfOO+T4vrW4FyUBIyu
	9q9ICaYHawYgZNs3JF60Ts6PPq05Od3lAt5X1rALYnAzqSMXT3rVO5QlEWQO+/hzO9bz2y
	+UYAa8tO1tZGO/9TSUb1UDnldeqlI+4cSLgvSlYqmKLRPt2g5/6ISv8F1S15fA==
X-Coremail-Antispam: 1Uk129KBj93XoWxGFW3AFykAFWxKw1kZr45CFX_yoW5tw48pF
	s7Grn3CrWDZwsrJrZrXFWxZrnxWF4xWr1xAa42y3y7X3ZxXr18uF4xKa47t3s5CryFvw1S
	qr1jk3srC3WkWFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUcs2-UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_225307_126599_5513815C 
X-CRM114-Status: GOOD (  12.13  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tianci Cao <ziye@zju.edu.cn>

JIT the UHMUL and SHMUL instructions with the one-operand x86-64 mul and
imul instructions. These instructions multiply RAX by an explicit
source and return the full product in RDX:RAX, so the desired high half
is available in RDX.

Copy register or immediate sources into AUX_REG, load the destination
into RAX, and move RDX back to the BPF destination after multiplication.
Preserve RAX and RDX when they hold other live BPF registers, while
handling BPF_REG_0 and BPF_REG_3 destinations without restoring over the
result.

Leave the existing JIT handling of ordinary BPF_MUL unchanged.

Link: https://lore.kernel.org/bpf/CAADnVQ+2O2zgdy11+vxE6dOp+3Br4zZBysHF-Hne7cP+eeucnQ@mail.gmail.com/
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Tianci Cao <ziye@zju.edu.cn>
Co-developed-by: Yazhou Tang <tangyazhou518@outlook.com>
Signed-off-by: Yazhou Tang <tangyazhou518@outlook.com>
Co-developed-by: Shenghao Yuan <shenghaoyuan0928@163.com>
Signed-off-by: Shenghao Yuan <shenghaoyuan0928@163.com>
---
 arch/x86/net/bpf_jit_comp.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 6a2fe3d0039d..53f38e21f7f3 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -1378,6 +1378,38 @@ static int emit_kasan_check(struct bpf_verifier_env *env, u8 **pprog,
 	return 0;
 }
 
+/*
+ * The one-operand x86 mul/imul forms use RAX as the implicit first
+ * operand and store the 128-bit product in RDX:RAX.
+ * The JIT uses AUX_REG as the explicit second operand.
+ */
+static void emit_hmul_aux(u8 **pprog, u32 dst_reg, bool is_signed)
+{
+	u8 *prog = *pprog;
+	bool save_rax = dst_reg != BPF_REG_0;
+	bool save_rdx = dst_reg != BPF_REG_3;
+	u8 mul_modrm_base = is_signed ? 0xE8 : 0xE0; /* imul /5 or mul /4 */
+
+	if (save_rax)
+		EMIT1(0x50); /* push rax */
+	if (save_rdx)
+		EMIT1(0x52); /* push rdx */
+
+	if (save_rax)
+		emit_mov_reg(&prog, true, BPF_REG_0, dst_reg);
+	maybe_emit_1mod(&prog, AUX_REG, true);
+	EMIT2(0xF7, add_1reg(mul_modrm_base, AUX_REG));
+	if (save_rdx)
+		emit_mov_reg(&prog, true, dst_reg, BPF_REG_3);
+
+	if (save_rdx)
+		EMIT1(0x5A); /* pop rdx */
+	if (save_rax)
+		EMIT1(0x58); /* pop rax */
+
+	*pprog = prog;
+}
+
 /* LDX: dst_reg = *(u8*)(src_reg + off) */
 static void emit_ldx(u8 **pprog, u32 size, u32 dst_reg, u32 src_reg, int off)
 {
@@ -2916,6 +2948,14 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 
 		case BPF_ALU | BPF_MUL | BPF_K:
 		case BPF_ALU64 | BPF_MUL | BPF_K:
+			if (bpf_insn_is_hmul(insn)) {
+				/* imul/mul use AUX_REG as src. */
+				emit_mov_imm32(&prog, true, AUX_REG, imm32);
+				emit_hmul_aux(&prog, dst_reg,
+					      insn->off == BPF_SHMUL);
+				break;
+			}
+
 			/*
 			 * lea for 3, 5 and 9, which LLVM leaves as a
 			 * multiplication, but not for r13, which needs a
@@ -2951,6 +2991,14 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 
 		case BPF_ALU | BPF_MUL | BPF_X:
 		case BPF_ALU64 | BPF_MUL | BPF_X:
+			if (bpf_insn_is_hmul(insn)) {
+				/* imul/mul use AUX_REG as src. */
+				emit_mov_reg(&prog, true, AUX_REG, src_reg);
+				emit_hmul_aux(&prog, dst_reg,
+					      insn->off == BPF_SHMUL);
+				break;
+			}
+
 			maybe_emit_mod(&prog, src_reg, dst_reg,
 				       BPF_CLASS(insn->code) == BPF_ALU64);
 

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
