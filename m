Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CECC43458
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BL8kxmGxaZWyUDiOL19z8z9BsNZUtrPVXR/O04XVakg=; b=FifnJvfnYT2ML5
	UuC3XfwYIHV7X5jLdqsaQnlOTkjNHP0nEeCUXpYjWMkWfOGl07ZyXqBnipH+qL/bk0iiSsfT29i6I
	bMIjWJq15Sy1n82bgY4Pna44sQGL7c3mHRphnZ8jesXUon3f8earP5PFs14oY1O5r3Z7IsQNW6mqI
	NM/CEuh5mLxjF6v3/5lFHE2F92zjV+fk3sUe4IJzEMQsdV5djvuNO9l5gUJn/snMGdJzNT3Js+FqC
	kwqEUcqvVDIo4dOvfEyXGOs8MYrpHRTscIMaPz7wzGog/wInbQ2UX8dJtaqlyLW+X5zYFpq9dMn0Z
	kCv3mnslDRtQsISUFzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFO0-0000000GWYP-1Qnu;
	Thu, 16 Jul 2026 06:15:56 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFNt-0000000GWXe-2lEr
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 06:15:55 +0000
X-UUID: c218fede80dd11f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:24b7af87-80c9-4755-b3af-78c446906130,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:35e991e9ada5afe51c5d0e6d5ad49dda,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c218fede80dd11f1aa26b74ffac11d73-20260716
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1448846488; Thu, 16 Jul 2026 14:15:35 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Thu, 16 Jul 2026 06:15:18 +0000
Subject: [PATCH] bpf, riscv: fix missing extable entry for arena
 load_acquire
MIME-Version: 1.0
Message-Id: <20260716-bpf-riscv-fix-extable-v1-1-af023cc17af4@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAPV2WGoC/x2MQQqAIBAAvxJ7bkErNPtKdDBdayEsNCKI/p50H
 IaZBzIlpgxD9UCiizPvsYCsK3CrjQsh+8LQiEYJLRXOR8DE2V0Y+Ea6TztvhK0xptPOat17KO2
 RqOj/O07v+wG3YW9BZwAAAA==
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
X-CRM114-CacheID: sfid-20260715_231550_026365_F309AB5C 
X-CRM114-Status: UNSURE (   9.46  )
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
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/net/bpf_jit_comp64.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..4fd4392dd080 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1986,10 +1986,14 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		else
 			ret = emit_atomic_rmw(rd, rs, insn, ctx);
 
-		ret = ret ?: add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
-		if (ret)
-			return ret;
-		break;
+		/* ret can be 1 (skip-zext); extable entry still needs to be added */
+		if (ret >= 0) {
+			int err = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
+
+			if (err)
+				return err;
+		}
+		return ret;
 
 	default:
 		pr_err("bpf-jit: unknown opcode %02x\n", code);

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
