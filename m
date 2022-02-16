Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57890C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjQLGt84UtBnw0WBVnDaZJMEnrA+GVAjyEWu16l06pY=; b=piTIISApskCOWE
	J5wToOe4dobSZGHwU3yMHR/JSK3wp8/rSLXlo+sC/3rECRjJC3QjbXvdXcCmqt8YvfmmRHH3KKm/i
	cAZ0ZTN4DtHzDZg+1BqpmDilcMQ6KqlJBmfrteOrt18ZTHFE861l8wVwyS1MoDKoh/3OsJGMTTcrB
	73jjImYEn0Pm5c9TvffU3Y1WSlw3Tyz3RNcP1puKQHvFhurTafKHybNnFpow8v+E2Mx/xMBtn7ThY
	n5C/0ebN6RSE/6cmqLDRoUxb+Nt6t/3GQc2Qno9Uh5bonKTCUqBLSQ3bf7Vx9SI88EFs5/TUqe0oI
	njVXOfFyt0uQl42pozog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKCUk-005YIt-8E; Wed, 16 Feb 2022 05:04:50 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKCUf-005YF7-Rp
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:04:48 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 0/2] RISC-V: some improvements for Atish's framework (for v5)
Date: Wed, 16 Feb 2022 14:04:25 +0900
Message-Id: <cover.1644987761.git.research_trasio@irq.a4lg.com>
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_210446_049643_8AC626C4 
X-CRM114-Status: UNSURE (   4.07  )
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

This is patches for Atish's ISA framework patchset v4 (intended to be
squashed into patch 3 and 6 of it).

Changes:
1.  It now skips 'S' and 'U' single-letter "extensions" on QEMU
    (with M/S/U modes) without handling as real extensions.
2.  Split base ISA using minimal parser (not by just splitting with '_',
    find and stop before the first multi-letter extensions, stripping
    version numbers)




Tsukasa OI (2):
  RISC-V: Better 'S' workaround
  RISC-V: Extract base ISA from device tree

 arch/riscv/kernel/cpu.c        | 83 ++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 10 ++--
 2 files changed, 81 insertions(+), 12 deletions(-)


base-commit: e9e240c9a854dceb434ceb53bdbe82a657bee5f2
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
