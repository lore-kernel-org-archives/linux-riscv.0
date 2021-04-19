Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206BEC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 20:44:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C8C613C9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 20:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C8C613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxXUkaO1VtQRpXaHCM4PWxvVX12Cnri9lirdtHx8MzQ=; b=aBHToEkTZTQoE4/eoe10fvu+X
	BUzb1vGlvdqas5KBSI5a26dcPPjKvJz01UR/fWSxQrrIp30Rf0U4dC1R/zWlmOodpwvK7RbdVPzU9
	uS5ypGjRjhE18OFc4Y2IvD/whAA/PaUN0CBYpeVLbdorArpNDRMChqliElV5kaHp19jI2yOjDuu3N
	q7M0zfr4EYVauKpdGsU5A7QIFRCAc7sq9dmYAX0m/v8D7C/skYFnIpstd9mz3GAASJzbo8KU0+YkW
	hH18HO03vtYIuNjo7fjOI5WjZXg9AO/+nvnivDHzQpFgQSaysejQY1jtQ6sG3z1KaJrdumopgPtHZ
	4Sqf8zZRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYakw-00Aa2d-VZ; Mon, 19 Apr 2021 20:44:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYakc-00Aa0a-Hg; Mon, 19 Apr 2021 20:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=l/ok6UaHBFVrcdQiW+maIK7Fx8e6fcT+lbEf9VHn4ww=; b=kG61HWvZb3BKr51AvOkeY0Vupo
 qUWAgGdVaD0qs2spfMk8SgkAs6y3c7XjgyXyEpK9yjm5vsX18BmWZg5FJ034RAixYwlkoU/OHf4Gm
 GfbQVl0e0Yrx6cYOV4/J5Sd9h+6+0qLEHJjMjOrrDJelf9c9oS46DBlZukBju7XYF5EQ0Gndw+jwe
 4Ygln0/cfikFBKWmWAUu8GmA+q7iSc+Vh4XTOcqkXBi6EhAm+qSk96BW0/DWAaV3TWaKa9B/0Qvzt
 3wJ36hYZLUAuFsSjAWAkHgCwnY+atqWulPaR44oBsOkCPtEM5gvNaq1SKmw9SZ8VYVz6XdV0Hh6Qf
 Si7xs56A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYakW-00BeDl-QL; Mon, 19 Apr 2021 20:44:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F6C8613B0;
 Mon, 19 Apr 2021 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618865044;
 bh=nAmp5UIFdq9tgAD5cLuft77KrM6yGyF0GIa2ORZdBR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WkJzcDtLRxIiUmY9hnVWEo+0Ymu1f0trLmbVbn62ZoSQ7CJjM9yKCrP+DlvOnVOsv
 CchRoJeW2ZsbJ02mstiAJC9E6/HTOEnFp0Ny/O2uXiMrwwHpI0U40EM61czb4xXrkf
 Yg5xvBHV92s1LBtMJ2luQLP14G9SPQWmRZDpCsO4V6onU5P5movtlSmYo1Lo5b4rKy
 WeMTJX2BbkVHIIzrnjD78FD6FJEz/DydRTwCRSE+rvM64aiunI5+RBLmw09V1eeBUO
 HQ8ql2W9MV5EWLAI69+T59W9uJlZhCOfYdj/MXG/Jvy76huHQuvC6f03VZlGAwto9X
 QDUlbGKqMzZKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 14/23] arm64: kprobes: Restore local irqflag if
 kprobes is cancelled
Date: Mon, 19 Apr 2021 16:43:33 -0400
Message-Id: <20210419204343.6134-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204343.6134-1-sashal@kernel.org>
References: <20210419204343.6134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_134404_916556_022D9D37 
X-CRM114-Status: GOOD (  11.53  )
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

From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

[ Upstream commit 738fa58ee1328481d1d7889e7c430b3401c571b9 ]

If instruction being single stepped caused a page fault, the kprobes
is cancelled to let the page fault handler continue as a normal page
fault. But the local irqflags are disabled so cpu will restore pstate
with DAIF masked. After pagefault is serviced, the kprobes is
triggerred again, we overwrite the saved_irqflag by calling
kprobes_save_local_irqflag(). NOTE, DAIF is masked in this new saved
irqflag. After kprobes is serviced, the cpu pstate is retored with
DAIF masked.

This patch is inspired by one patch for riscv from Liao Chang.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/r/20210412174101.6bfb0594@xhacker.debian
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/kernel/probes/kprobes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 66aac2881ba8..85645b2b0c7a 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -267,10 +267,12 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
 		if (!instruction_pointer(regs))
 			BUG();
 
-		if (kcb->kprobe_status == KPROBE_REENTER)
+		if (kcb->kprobe_status == KPROBE_REENTER) {
 			restore_previous_kprobe(kcb);
-		else
+		} else {
+			kprobes_restore_local_irqflag(kcb, regs);
 			reset_current_kprobe();
+		}
 
 		break;
 	case KPROBE_HIT_ACTIVE:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
