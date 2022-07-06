Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1046CC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M/5SvObfugagFpx0u7YwPVMM0WWVv5khVUuxfiuL8wE=; b=fAqPC6JGT06j82
	9vlBDVTyocKKJiSnOOcdxMQ+OWV6oNPLQYScncwdTaHEau0QlUkClC4ikuOC+lPa8Yyogiqo+1cmM
	u3hrKl4oa/dOOY9gGE0iw1CfcbaNnmn3WQ0B7uzZKsxg9cSmlrg7iuD3KtIn3m4OHUcGYBPYdNiAK
	0keCj8FN1K60QhF87pixSiyXp+oWh68hoNfDwwskvh2wpBFHFwTfSKzezK9ej5yyzQZCR+TWueNXM
	X/tY/gNqzEqd7qLWiimNhu+I0cScUsXvUkjJTAttIdb/bcx3Udq4gOzqIoZn/2UmFQ46sJ5H7kggu
	rnJ+jKGLD3gjcCQgDmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95d2-00AW7a-TE; Wed, 06 Jul 2022 14:03:44 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95cz-00AW6F-K3
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 14:03:43 +0000
From: Yixun Lan <dlan@gentoo.org>
To: linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hengqi Chen <chenhengqi@outlook.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] riscv, libbpf: use a0 for RC register
Date: Wed,  6 Jul 2022 22:02:04 +0800
Message-Id: <20220706140204.47926-1-dlan@gentoo.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_070341_722011_A0FFDF2C 
X-CRM114-Status: GOOD (  10.28  )
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

According to the RISC-V calling convention register usage here[1],
a0 is used as return value register, so rename it to make it consistent
with the spec.

[1] section 18.2, table 18.2
https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf

Fixes: 589fed479ba1 ("riscv, libbpf: Add RISC-V (RV64) support to bpf_tracing.h")
Signed-off-by: Yixun Lan <dlan@gentoo.org>

---

I'm adding a Fixes tag here, although the original version may just work fine,
and shouldn't be considered as a real error. But, the benefit is that we could
make it consistent with RISC-V spec, and all other tools will follow the same usage.

thanks, and let's me if there is any issue that I may not noticed..
---
 tools/lib/bpf/bpf_tracing.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
index 01ce121c302df..11f9096407fc4 100644
--- a/tools/lib/bpf/bpf_tracing.h
+++ b/tools/lib/bpf/bpf_tracing.h
@@ -233,7 +233,7 @@ struct pt_regs___arm64 {
 #define __PT_PARM5_REG a4
 #define __PT_RET_REG ra
 #define __PT_FP_REG s0
-#define __PT_RC_REG a5
+#define __PT_RC_REG a0
 #define __PT_SP_REG sp
 #define __PT_IP_REG pc
 /* riscv does not select ARCH_HAS_SYSCALL_WRAPPER. */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
