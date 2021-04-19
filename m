Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AA2C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 20:45:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B8A613CF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 20:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B8A613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZRV5FE/Qjh/jFioXPXFzo+3/s2py2whBTdLxBn1gx9M=; b=nby2sPfdaCYO5Ezd9uAzMxos4
	+Ml8wiu8c7ZohIrOXu9/DqFtyA1gllRFPQ12MiTmoJbOW7IVpB7iyempLa8PhPicpvuyzayr3IB/B
	OUgB2Hd8AtPtlOz8v/rsmKBxL76VvcVRodvSUVGYlkN9D57n6Us7qgfpuJry6Ri72z6lpBQP+E0TS
	YqcptaowqRX6k3P6BiFypp1g0XA1wdqQH19Vg7s78HYqnh77XyBeAlVnRbJh/Zyp2dVEpOmCfyZBz
	d70kk4h6L2H8creLtBBTjkI6Xku99+0oVTgDYB3jncEKRQoqxYes+xQ3GxWL54bZAdno68eGsTlVO
	R9qjvIAWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYalc-00AaC2-9U; Mon, 19 Apr 2021 20:45:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYal7-00Aa4d-Ji; Mon, 19 Apr 2021 20:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lQlgM95q4DmLeNOYiYyRuqhG/zFiI8DxD8JnTJJ7t3I=; b=jRnClG5L+ohNiIjGxQuyAkCIsC
 grymrQ5U9/4cBANfaZtuDiq1dc186rbCcdS0OwaA+ChbdfhTIgcwSJnJkShWtsL94NJDyM3uuxkyT
 4c9SKzFX2uTSPwr9xbp8cpR8oyFdn4H77sfgng5D+94o052PUVCYj6WujWZb07rkkLBwJsliWJ1iW
 24OegUzKNktuh0UqtF0NdMFF9AilHMS0OY1hxePswp7YAmQ0QMWmcDOWTS2eVA1rGlBfFnX39KbCW
 F/SQdQvpwkQCZMeHeGH0s5v/bBO6oRp6J2DiNGie7f69UCHecgUO/r2NJyZsTCA7GL91Yjk96O/zQ
 uZiffJgA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYal4-00BeGZ-Ue; Mon, 19 Apr 2021 20:44:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 735CF613B8;
 Mon, 19 Apr 2021 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618865078;
 bh=6kyVlTTcQvm60muHEDHx+81IPWmlevGExB5GYk3nMuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CaG85hAuYw6bdrY5vk7P1+SPuRiqNksH7qJRxioSYvKEangx86aZA/Wwyaeiq2d/3
 88TcUDIBmCml1QIp+G5Ajn1RlC6nGHH+TBHsY/QsJkRiVKLHMtIWlgbprqM931g0vH
 74/la0sFtXlXmUmIvrRdQrRtFkInUv39UuwX+CQyzMa1uGMqecn22EgWgC9K/bO53p
 kVpPhe1i6WMwk2VIczl1jGWwUIjVz+74wCJmH27PZb+fwLG1PxGnd+yNki8abCoijA
 CjbivXfd6zly6kNEUO0xwnIQ53l46Syzz+SXoic2mGyDNdZsrfg/mMGEj6ednpfr0w
 wDjGU3ObTGu9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 12/21] arm64: kprobes: Restore local irqflag if
 kprobes is cancelled
Date: Mon, 19 Apr 2021 16:44:10 -0400
Message-Id: <20210419204420.6375-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204420.6375-1-sashal@kernel.org>
References: <20210419204420.6375-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_134439_037895_F1FED1FF 
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
index f11a1a1f7026..798c3e78b84b 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -286,10 +286,12 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
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
