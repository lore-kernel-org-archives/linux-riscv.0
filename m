Return-Path: <SRS0=rv00=GC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF2CC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Dec 2020 14:40:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D687421919
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Dec 2020 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D687421919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgqqmt9LZlVVIxa4IDaov3uwyUE4/YFECQPyAwUx+YM=; b=HHZAqKAsi9wr2CIDpNFpEjIwsQ
	nrgp+nRjDrgWCCI6IV6ZBbssFzjCIeD+BkjwEjqI0xk1/Iw4aPlZ0vj4tcyij+IiwR0JPQiHMOtcy
	3DlSyqbsu3hoiITHk9EcngMTmXp4Wep3l4H9RxLVop430+UxRbYwT7lI6YmJGuogFcDdM7s2tGEdm
	2rwiTl3wGir3gPKW0Q1/9/tsmlOq/IreXrgTn6BMfb/o7tfsp4Fzi2MhmoSoJ/kdeGHpfzNbG4N0e
	Z3tVg884fERMPovXEWqgi9fzHYjQywrM3tfOrDDpv2rt0vfHxCQkEophOyYTE6I/w5GO1TPmqh7hi
	GlzJE/bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuceD-0007Pe-Aq; Wed, 30 Dec 2020 14:40:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuceA-0007PG-3R
 for linux-riscv@lists.infradead.org; Wed, 30 Dec 2020 14:40:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7C3B2220B;
 Wed, 30 Dec 2020 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609339216;
 bh=e0+df3C86TgDkLKPUHT/YZ/mJxTl5DbhpY6cE04RF04=;
 h=From:To:Cc:Subject:Date:From;
 b=MjzBvm0aDu1O3mQ7/rE4v7q9zm6Cdcten+cJx8w8Me0821ofQItlRD1X8N7UTla+j
 2lbLJg5h2Pc2ff9ssg6PmQkUzGRbqzlSfLxT/rpCrtaiJ3ivDFDTIrmd76fjxXAWjA
 s4UdM116Lmdl2nPnOWpoy2vYbw5nHj8vvqVrfGmuSwafGojy0rpA+5O8ZqPfSx8WXf
 uk3+boqvlabVdDgb4YprdsJ8ylq/CYUpSF+cHMSt8WAq1qXH2bdC2/SNfiRwJoW6q2
 GXg6RKlzSD3tZ0Q8E3i464fNwQBHxXdLomGQz1EYiGmfJCjLp77s9e+PTzENC6UC6r
 xLN78Svzb15kg==
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 atish.patra@wdc.com
Subject: [PATCH] riscv: mm: abort uaccess retries upon fatal signal
Date: Wed, 30 Dec 2020 14:39:16 +0000
Message-Id: <1609339156-61806-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_094018_226038_DE4FD941 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, guoren@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Pick up the patch from the 'Link' made by Mark Rutland. Keep the
same with x86, arm, arm64, arc, sh, power.

Link: https://lore.kernel.org/linux-arm-kernel/1499782763-31418-1-git-send-email-mark.rutland@arm.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3c8b9e4..7f5f45b 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -280,8 +280,11 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * signal first. We do not need to release the mmap_lock because it
 	 * would already be released in __lock_page_or_retry in mm/filemap.c.
 	 */
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			no_context(regs, addr);
 		return;
+	}
 
 	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
 		flags |= FAULT_FLAG_TRIED;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
