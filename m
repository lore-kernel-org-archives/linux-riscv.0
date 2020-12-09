Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC69C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049A023B23
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049A023B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=mhJHnYpeH1sUZmGBUN9k35s9R
	teSPPJyBozt5L1c4b61e+isjeUuKEWM9xFG4J0kpGNpHCzs1xEA4eqwD0Oo3lU3cPB7uXtEqmiFpZ
	0sRysVN00Cw2CswP0QQ3e1vX7jrZc4tEpcL32jhm0Z5V7iFMl2F3E1WShqZR92tPcPMcOH7jKyxve
	ipmBiQzh9ngd+Mu66+LyE/4LBzxRPrEcMNyn9F7cjX1GXPLcHxLihaqd/SxJQFV8wL2oiFca7gPJy
	Zu2lkKciBx8acfV6wlU2/qCL7slQ7yOS8q23RTVhDNZHumOj3V1O8RfjNqjZnkrFnrpM35FqkTkGl
	sNrLppsdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kms8F-0007qP-V3; Wed, 09 Dec 2020 05:35:20 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kms8D-0007os-Ld
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 05:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607492329; x=1639028329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=P8jpS1ltq5xu5YioXQFFuYBEMY+EIAjSACUZjvH1ZQMoXbihnEWWaC2C
 1vpsIrAjAuEDlgGPtwyg9zr5zciD5JXnuMYdpUId/HsJXFHh5S1DXL1kF
 /p9YBbB2/aAAGGL/zRJzNUboGskFbgDZh6dy5fJ43c3gFfccq9PBKgDQr
 FUAVj0XSdBGB/xV523uVKVuOAeSC+JT1KaosLIicDkIK+QkKefRQlGh6N
 wrNnsmW/epwOf4VPQDCKrVRGlom6w0WHDh3WvZIU0ZaioRgo85Wa/Nq8v
 hVG3JcmHV9sZYTv9kTAjSOiPq2Pmbo0WuvC8RE1hzV2hi4kqTVc4G3uz/ A==;
IronPort-SDR: j4RqBXuWLS89ibjBiYHNH5O+SyQxbYUdcZd8z69sGxhfvI5bMprHACUCMktRe6Lt5J2TDDjbkN
 O75tvJrjgx/hfrGTQd9RDZdiSktR+D5gu2JPwI3FGwidZIfuWpbzDXMolUya5HV8FC8iojAH1w
 Qu9x0xohm0gDatD3LIk33DjlT8jz+MdKwLhCw3wfocRyNyICCg6iy18N0mPipq30Ya9YZLNYGv
 6qSO7UJfx+uTIIzSF9WA6QBQhkC87LaC15Hr+YwKWsaxg/i1ASMM2HkLrwpZjZ34kV+Y+lgsLT
 r3U=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="258465524"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:38:48 +0800
IronPort-SDR: znqRtWXecnGqekwvbFvTUT24L1FtNVGZoSyyt2DiRq1ZcYKdzHRMlw/Gh9Ra9l4uMBxESIYDCo
 eJ7Og43rbSIl9ZaiL2sbyFfdesiHDm7Z0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:20:43 -0800
IronPort-SDR: iu6zfrJ1Xxa9LJ6UMRH605p9zx2AKacZzxHV6epO9ppGgRlNxGjRn47Weu3fthLMtKE72CWvgD
 CNOoWUT6M0KQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:15 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date: Wed,  9 Dec 2020 14:34:47 +0900
Message-Id: <20201209053506.122582-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_003517_843829_98FDBC49 
X-CRM114-Status: GOOD (  10.91  )
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
