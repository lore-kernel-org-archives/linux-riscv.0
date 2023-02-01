Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAF9C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uC2LQBJ1zMtgWPFM2j1+wXB1NZGWZm1iwJlhXEU+Mxc=; b=17fwqAG99U613O
	2352PtbIRDSC/AnvJiUT2nU2dRGKr9BOV+Z1bLeFNaMLGQC0T4mWelEveibf76VVCp5As4dIpxJlN
	P6kzmZcI/qKn8unFAzkAzAoDSGe9qRAZBeC72RBK57hJZmsvSl+lWo4Y+rDHU7nHSSiHH0Pzj6fQ7
	OjlWNfGN0NjdWgl8zRGlG9hR/q7wi+Nc+DEzdSZmxKDfyVJqah34PPssPydEvlZV5SWxputGNdhIE
	bUKiIHhlz6FHrwagXRL0ghi53nTfVSI5LH2ZenKt06cYHw314bhg/MOG8utV1/KPq1y0E5I5cO/al
	0LYqyaE5HLOFhRApHS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6tT-00AV9e-Np; Wed, 01 Feb 2023 06:46:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6tQ-00AV98-QB
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 06:46:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 18388B820AA;
	Wed,  1 Feb 2023 06:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C69C433D2;
	Wed,  1 Feb 2023 06:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675234009;
	bh=gTXbxviqwiipAfrlkTcVTx4LMrjxFY0gn9AiSEXRjEE=;
	h=From:To:Cc:Subject:Date:From;
	b=eCghh/6SgHVgxYCyz3WcktFEU3qWMlkrXdIptT5sbgaK9kcLJ9bVRRnO9rAsD4FLD
	 bDbjATRN4x1gxo4p++R2Rcb5DyE438+8mqZCkUeOMO7ZsBbvVrMNSIwOJoWmygTYLd
	 +gHMiP6xmfG2lj8eY3JtTYSz/8kQJJda4euN/X1ws3mbRyM2hJmR+6CHMDOzxyAjtC
	 iGx3yLa6bd84w6HMwkafXHz0rwszeSqMaNQ6Bqct+wgV8EYhLWKIrJSK9KGWp2V8ey
	 gFjCsf6QAVbFMk+KPrNqVPgXSF25fE8xBi9tk4OaDDqlNC4APrSbZGHvAT9kLXTCfF
	 xDuEwPzKN5mdQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Bjorn Topel <bjorn.topel@gmail.com>
Subject: [PATCH] riscv: kprobe: Fixup misaligned load text
Date: Wed,  1 Feb 2023 01:46:08 -0500
Message-Id: <20230201064608.3486136-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_224653_011574_84B61321 
X-CRM114-Status: GOOD (  10.46  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The current kprobe would cause a misaligned load for the probe point.
This patch fixup it with two half-word loads instead.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/linux-riscv/878rhig9zj.fsf@all.your.base.are.belong.to.us/
Reported-by: Bjorn Topel <bjorn.topel@gmail.com>
---
 arch/riscv/kernel/probes/kprobes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 41c7481afde3..c1160629cef4 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -74,7 +74,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 		return -EILSEQ;
 
 	/* copy instruction */
-	p->opcode = *p->addr;
+	p->opcode = (kprobe_opcode_t)(*(u16 *)probe_addr);
+	if (GET_INSN_LENGTH(p->opcode) == 4)
+		p->opcode |= (kprobe_opcode_t)(*(u16 *)(probe_addr + 2)) << 16;
 
 	/* decode instruction */
 	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
