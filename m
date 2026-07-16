Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A63C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BNR0NhD2l2XM6AQhcfqlko6v3xRd4Td/15ZfpoL9Acc=; b=dM2E/xHXKNERFO
	nRMYOVhOppZWzQfZxt2Es9Zh+z93mu+gTe+OZ0Yh82lKVno42oY5bzF9T0i8i+ODtFWMBLUCzyWVL
	s9qTv048k8qa5GvS51QOJT4tU9RwYAsjAaPneSbaf2CpPqXnFQHWY+x1Vev/axh54TQOemnNzAsF8
	sWTYUe7Eu5R4TRnibj+Ys/c94gNBV8a0qK9ZtiJb1x7MXNXb1aYtbBy6pMvU4/0ZUr4F2FGtE6Qq/
	hmxv2Rot1GsU6zOySLO/StymcXLzSg6LbU6RL6+FMJf4isQChQmo5ssL8Aqo9AWANBrJSiHhdvB0k
	ExOeZ8TQp/EWyvn0zMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgN-0000000GfkV-0Bbd;
	Thu, 16 Jul 2026 07:38:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgJ-0000000GfjX-0R4q
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 07:38:58 +0000
X-UUID: 60cebc8e80e911f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:84d47a8e-53a5-486f-8042-8414e40789a1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2dde9d5cd799cfa9fce1dea7b08f5605,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60cebc8e80e911f1aa26b74ffac11d73-20260716
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 507581892; Thu, 16 Jul 2026 15:38:46 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Thu, 16 Jul 2026 07:38:33 +0000
Subject: [PATCH v2] bpf, riscv: fix missing extable entry for arena
 load_acquire
MIME-Version: 1.0
Message-Id: <20260716-bpf-riscv-fix-extable-v2-1-421f75812533@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAHiKWGoC/4WNQQqDMBBFryKz7pQkiqldeY/iIsZJHSpREgmKe
 PemXqDL9z///QMiBaYIz+KAQIkjzz6DuhVgR+PfhDxkBiVULbSssV8cBo42oeMNaVtNPxGWTdN
 U2hqtHwPk7RIo15f31WUeOa5z2K+bJH/pP2OSKNE4oUprpTauaj/7xH6Od+uhO8/zC7sdDzG7A
 AAA
X-Change-ID: 20260716-bpf-riscv-fix-extable-399947ca778d
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_003855_491959_DAEA46DD 
X-CRM114-Status: UNSURE (   9.79  )
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

emit_atomic_ld_st() returns 1 to have build_body() skip the zext after
a sub-word load_acquire. The caller does "ret = ret ?:
add_exception_handler(...)", which skips add_exception_handler() on any
non-zero ret, so the extable entry is missing and a faulting
PROBE_ATOMIC load_acquire oopses.

Check ret >= 0 before calling add_exception_handler(), and return ret
unchanged so build_body() still skips the zext.

Fixes: fb7cefabae81 ("riscv, bpf: Add support arena atomics for RV64")
Suggested-by: Pu Lehui <pulehui@huawei.com>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
Changes in v2:
- Drop extra variable as suggested by Pu Lehui.
- Link to v1: https://lore.kernel.org/r/20260716-bpf-riscv-fix-extable-v1-1-af023cc17af4@kylinos.cn
---
 arch/riscv/net/bpf_jit_comp64.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..0db89093ff89 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1986,7 +1986,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		else
 			ret = emit_atomic_rmw(rd, rs, insn, ctx);
 
-		ret = ret ?: add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
+		/* ret can be 1 (skip-zext); extable entry still needs to be added */
+		if (ret >= 0)
+			ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx) ?: ret;
+
 		if (ret)
 			return ret;
 		break;

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260716-bpf-riscv-fix-extable-399947ca778d

Best regards,
-- 
Feng Jiang <jiangfeng@kylinos.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
