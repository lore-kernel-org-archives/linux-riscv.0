Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88477C64E8A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A05221FB
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A05221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=eZByHO+faStpnPcxA+67XOGOr
	xUG4q4ow2i0X+s6bGJU+4kPaUtog6iG/eY67jnUkVxSXDCkDI+TWtlkxRL/H3qFp7+BFmvw9j7cxE
	cPGFEpBZ5BgvvShve5KP/Mc9rMZRpoQT845hGj3qCbw4XrxjiaggCmg6LPqx2dyDGVnIueNmW89hf
	wRM8uTEzoKr5LpEJ6J8mI5Lsk+bnEIbqnzw4CUuwbvT95l5PHRGh8iTPYtQtqjBpfGKRG2okFIr18
	K64n9muSeoWwDFXm02swbqa6K/90FhQhH+kqVnhDJBzfxzQXJa5/6xfeQMDGZPeg7HN3NnlAdyO7s
	p6NRkIfyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIlo-0000rr-BJ; Wed, 02 Dec 2020 03:25:32 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIlk-0000nN-F2
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879528; x=1638415528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=OGxg8XNyH2bar3HwSi/3MWghzHhb4iR5xpBSnSPnzcqFCJ0i67w/t14u
 V9lhYLDnVNdcg106kmE015Z0X9Vapz3dmehyZox2T1Nv35iJpeyNobZjd
 eDalMU+48IqWSF/KUrqJUG67KEj+J31bN/eCq0LjGC2D5KndigQIxIT5V
 Ig2eFs/a+2RG637mZ2iTzyiGpoveX1U03gtPnjzBRsMctox7eTK1OCMDl
 klgRN3qtUgR5fcXOLSsTaH9WmaUFQauvUEKz5TBpFTCXyqSfxkShLM06x
 tQkJl1GXjGi30fA75R6ruMa/qTC0nl8GwRCkvlpdkWBvC0lr2kQMc5Frh A==;
IronPort-SDR: hancRcsGviK55Lz04HlscUfhBvJV/PiWNnmY/tOTdqtwi5xSC/C0gxFZMZUCqbsZ37W5bJ8RRu
 8h23ZyfQ/MbkW8/e8klcerpudDU+ZuqKYRkf7NwO5S5ZHFmH0ruMCNIsSOR2xdAIk0lMdVQp/E
 Tz1OFGsL3ZxUO8QOXC2lOA3REWVn7nkeiSmresg78chl0dkrD9T+ALiCqCBKYSG6XFzFeNtElU
 hw1bQvq7cyMCXAGSXtgHI82lS0FHyM3m/meR8zdW+rCtcch1IKDq2E7lY5ZuAUJk+QxyuZEAY2
 Gno=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922339"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:11 +0800
IronPort-SDR: UjuKW5YnKhfYNlqVK0Tl47VF2U0ig4ddY1I9nxUVlgg8AUuDZ9EcAZ5eimmTF2yKHZxbe8xTwM
 j7IDxbUTcPXM5eQusrUtA5zC/Qy2q/eRE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:10:46 -0800
IronPort-SDR: n5i6KqE45ld2pSJaXhVwDF7/c8Spaaxd2zdfidNYfLOL7tvCwWfYVRyGsV+LCKcDPUnHgrmOSz
 FwOBaRt2mAZg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:10 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date: Wed,  2 Dec 2020 12:24:42 +0900
Message-Id: <20201202032500.206346-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222528_647950_8E7A291D 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When running is M-Mode (no MMU config), MPIE does not get set. This
results in all syscalls being executed with interrupts disabled as
handle_exception never sets SR_IE as it always sees SR_PIE being
cleared. Fix this by always force enabling interrupts in
handle_syscall when CONFIG_RISCV_M_MODE is enabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/entry.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..080eb8d78589 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -155,6 +155,15 @@ skip_context_tracking:
 	tail do_trap_unknown
 
 handle_syscall:
+#ifdef CONFIG_RISCV_M_MODE
+	/*
+	 * When running is M-Mode (no MMU config), MPIE does not get set.
+	 * As a result, we need to force enable interrupts here because
+	 * handle_exception did not do set SR_IE as it always sees SR_PIE
+	 * being cleared.
+	 */
+	csrs CSR_STATUS, SR_IE
+#endif
 #if defined(CONFIG_TRACE_IRQFLAGS) || defined(CONFIG_CONTEXT_TRACKING)
 	/* Recover a0 - a7 for system calls */
 	REG_L a0, PT_A0(sp)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
