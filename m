Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C85E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMlA+vuYzlwq3ClSk8DZbdSszNPkh57SKPvW4wlSjlg=; b=KJq+adDABku3oO
	KJhKIc0jJIbgE5lc3T3Nl1zYktooGNlJi/lnx4G0l7e8LWsc+ZAnSH12cipLV/AgnaKcg0CYh3HUQ
	WbpBaHh1CYNJpTtzLrxSNACqDq/Gqn+5iI8lb8GelrOAhB1ZsK2JeNNZya6ZfCewkR9A/b1kIg5+W
	WFM7x9HmumanddBOZng09Az6jvPA4ONwL92OIo7KN/ZGc/XPIE4byIk1vj8dCRSWlrjA5CH0DCVYk
	+B6Qabn+Pdbtbt3qDCehiqIHueAFZJd6M3jCIjy35OJBe1GgYz3/jAVKT2oXzAIjbU2RZZziRM6Fu
	sjrpjqoLQVpOMFejQ4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuil-00000002vgC-2sxA;
	Sun, 28 Dec 2025 17:38:23 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuii-00000002ver-2gS8
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 17:38:22 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vZuiU-000VmZ-2e;
	Sun, 28 Dec 2025 18:38:06 +0100
Received: from Mac (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Sun, 28 Dec
 2025 18:38:05 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <bjorn@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <palmer@dabbelt.com>,
	<luis.gerhorst@fau.de>, <daniel.weber@cispa.de>, <marton.bognar@kuleuven.be>,
	<jo.vanbulck@kuleuven.be>, <michael.schwarz@cispa.de>, Lukas Gerlach
	<lukas.gerlach@cispa.de>
Subject: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
Date: Sun, 28 Dec 2025 18:37:53 +0100
Message-ID: <20251228173753.56767-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-gwd-01.um.gwdg.de (10.108.142.50) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_093820_677337_87465608 
X-CRM114-Status: UNSURE (   8.88  )
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

The BPF verifier inserts BPF_NOSPEC instructions to create speculation
barriers. However, the RISC-V BPF JIT emits nothing for this
instruction, leaving programs vulnerable to speculative execution
attacks.

Originally, BPF_NOSPEC was used only for Spectre v4 mitigation, programs
containing potential Spectre v1 gadgets were rejected by the verifier.
With the VeriFence changes, the verifier now accepts these
programs and inserts BPF_NOSPEC barriers for Spectre v1 mitigation as
well. On RISC-V, this means programs that were previously rejected are
now accepted but left unprotected against both v1 and v4 attacks.

RISC-V lacks a dedicated speculation barrier instruction.
This patch uses the fence.i instruction as a stopgap solution.
However an alternative and safer approach would be to reject vulnerable bpf
programs again.

Fixes: f5e81d111750 ("bpf: Introduce BPF nospec instruction for mitigating Spectre v4")
Fixes: 5fcf896efe28 ("Merge branch 'bpf-mitigate-spectre-v1-using-barriers'")
Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/net/bpf_jit.h        | 10 ++++++++++
 arch/riscv/net/bpf_jit_comp32.c |  6 +++++-
 arch/riscv/net/bpf_jit_comp64.c |  6 +++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 632ced07bca4..e70b3bc19206 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -619,6 +619,16 @@ static inline void emit_fence_rw_rw(struct rv_jit_context *ctx)
 	emit(rv_fence(0x3, 0x3), ctx);
 }
 
+static inline u32 rv_fence_i(void)
+{
+	return rv_i_insn(0, 0, 1, 0, 0x0f);
+}
+
+static inline void emit_fence_i(struct rv_jit_context *ctx)
+{
+	emit(rv_fence_i(), ctx);
+}
+
 static inline u32 rv_nop(void)
 {
 	return rv_i_insn(0, 0, 0, 0, 0x13);
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 592dd86fbf81..d9a6f55a7e8e 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -1248,8 +1248,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			return -1;
 		break;
 
-	/* speculation barrier */
+	/*
+	 * Speculation barrier using fence.i for pipeline serialization.
+	 * RISC-V lacks a dedicated speculation barrier instruction.
+	 */
 	case BPF_ST | BPF_NOSPEC:
+		emit_fence_i(ctx);
 		break;
 
 	case BPF_ST | BPF_MEM | BPF_B:
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 45cbc7c6fe49..fabafbebde0c 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1864,8 +1864,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		break;
 	}
 
-	/* speculation barrier */
+	/*
+	 * Speculation barrier using fence.i for pipeline serialization.
+	 * RISC-V lacks a dedicated speculation barrier instruction.
+	 */
 	case BPF_ST | BPF_NOSPEC:
+		emit_fence_i(ctx);
 		break;
 
 	/* ST: *(size *)(dst + off) = imm */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
