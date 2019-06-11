Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A256C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB50206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ju77hOys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DB50206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M4OD/EnPDNdIsUqyjadyLPU2olPGqyHhorVX8TS7HRw=; b=ju77hOysHz2bal
	kPROtlIV652haE0n271mjmpr0MPD2BGpooRcGSMOXbsRKUqVsnzuoammCG4YFE9nMqgoZOY+Mivlo
	LPq6aCBDqfU9wiI/LGCTdbYtJkwaeG1wntH2+AzyP26eJmvnH0p7d1ssFT91PWkQKYTXQZpRTBKaw
	qbxdUYOnt6f0bMdJ1dMLCoyT+PuD6mj/x/pGSra0nvK043lNAwuBS/maFgSUCaVcSg8WoX21zBpaP
	x3f+GwhL08EB5kndT+iJRaza0w5ltTxlIwYAwIX9jB3jGgSTw9Hy5kgZZIFBlGw3+wonFLPJ/dFuH
	Npxihko2L+wIpZzAQ+MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hae1D-0005n6-UK; Tue, 11 Jun 2019 10:28:43 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hae1C-0005md-2z
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 10:28:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CA424ADDD;
 Tue, 11 Jun 2019 10:28:40 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: export pm_power_off again
X-Yow: I'm RELIGIOUS!!  I love a man with a HAIRPIECE!!
 Equip me with MISSILES!!
Date: Tue, 11 Jun 2019 12:28:40 +0200
Message-ID: <mvm36kgpg9z.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_032842_274497_B934DD13 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Commit bf0102a0fdd9 ("riscv: call pm_power_off from machine_halt /
machine_power_off") removed the export of pm_power_off, but it is used by
several modules:

    ERROR: "pm_power_off" [drivers/mfd/rk808.ko] undefined!
    ERROR: "pm_power_off" [drivers/mfd/max8907.ko] undefined!
    ERROR: "pm_power_off" [drivers/mfd/axp20x.ko] undefined!
    ERROR: "pm_power_off" [drivers/char/ipmi/ipmi_poweroff.ko] undefined!

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index cfb6eb1d762d..d0fe623bfb8f 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -13,6 +13,7 @@ static void default_power_off(void)
 }
 
 void (*pm_power_off)(void) = default_power_off;
+EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
