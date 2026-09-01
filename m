Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF20C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cTv8zDqCrCrzVmJcp4TRXq3leZJ5d9WotvvIflFe0X8=; b=cnIn5IHQU73VCK
	YmGHgE2+mPi9gbCSkMSsTJhQoN2RNjasq+W4KPaY3HN0fhwn3xLI+axVdsgPOC0DHsefAUk6Pkc0R
	ghMLRaNNRkhVuFWUeUVJcNGIDeMa6C53usUErwKCg7sExHPZYh50Ji+hyeAMye2qxI+beyB5914c+
	Q5jB+KUkp/4s23AiSps+zjdJW3vQ94wZjCyk7+PWtrajQt9CEgD/nhpLpNjfa/Suoke9G7PQk3lz/
	sRHUKMaEUPmz1i7rFI5JeNvNwjuRLdveW+0gTFWKzBglGGSTsuE5+gezktLOmpBsIDfNRMUj5pcaE
	EIG2I4a1qt04Y0Qf22SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OHB-0000000CAEj-02n8;
	Tue, 01 Sep 2026 13:11:45 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OH7-0000000CACW-10P9
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788268298; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ATJH11bxVHIskQuz+vJepFf7SUqYuoorOP97hyHmC+g=;
	b=CYLLPrOXEmpGrCPe1+wFisykuMsRd3FgbiyqStxUxxYsUbAIWqkiyenOxxeiFYpjacChZD+lSA7s3iAcboZU8v5JxFRc0iBThChn5eCRK8I9LqhzE7A+RUV7bD4p+ofewS/aqUv37is4tnw8QC2JN/NN2nwc1zXE9GAFpJD3aEE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XA8SKn1_1788268294;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XA8SKn1_1788268294 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 21:11:37 +0800
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
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH bpf] bpf, riscv: Make arena support depend on ZACAS
Date: Tue,  1 Sep 2026 21:11:32 +0800
Message-ID: <20260901131132.16241-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061141_792796_598C1FAF 
X-CRM114-Status: UNSURE (   7.88  )
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

The arena range tree allocates its nodes with kmalloc_nolock() since
commit f8c67d8550ee ("bpf: Use kmalloc_nolock() in range tree").
kmalloc_nolock() requires slab caches with cmpxchg128 support
(__CMPXCHG_DOUBLE); on riscv cmpxchg128 is provided by the ZACAS
extension. On systems without ZACAS every arena map creation fails
with a misleading -ENOMEM.

Report the missing support instead: make bpf_jit_supports_arena()
return system_has_cmpxchg128(), so arena map creation fails with
-EOPNOTSUPP on systems without ZACAS. This matches how arena
BPF_CMPXCHG instructions are already gated on ZACAS in
bpf_jit_supports_insn().

Fixes: f8c67d8550ee ("bpf: Use kmalloc_nolock() in range tree")
Cc: stable@vger.kernel.org
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
This issue was reported by sashiko-bot:
https://sashiko.dev/#/patchset/20260901120013.16104-1-cp0613@linux.alibaba.com?part=1

Question for reviewers: should the arena selftests gate on ZACAS,
e.g. probing it via riscv_hwprobe() (RISCV_ISA_EXT_ZACAS) and
SKIPping cleanly on systems without the extension?

 arch/riscv/net/bpf_jit_comp64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 74efe4b138d2..0061c1d4ed98 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -2128,7 +2128,11 @@ bool bpf_jit_supports_ptr_xchg(void)
 
 bool bpf_jit_supports_arena(void)
 {
-	return true;
+	/*
+	 * The arena range tree uses kmalloc_nolock(), which needs
+	 * cmpxchg128, provided by ZACAS on riscv.
+	 */
+	return system_has_cmpxchg128();
 }
 
 bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
