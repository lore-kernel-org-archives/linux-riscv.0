Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD14C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2664523C18
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2664523C18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=63iHsuArXsVwf5P4TdJul0Gj4XLrlimp+LrD9X282oo=; b=2+BYbG1LQc8apz3u2csmu6cH7
	kvZd1us8o8Io55X1JqWVL2sFhwqP0OhNJ/54Mufv1BjAinfXK4ozwj7YagXN+E25hbHcMGSDThSF8
	H5RhV2+9eGktxEeq0MIlGxG8wYSWEcWG951NvssMuzCDkAWfjZcPxCTYP/JgC5/qaZoURpilsvlUr
	mJUxxR057k3NPqsvv5db9NJmkkXdQhMUA9cHLwINU6AJ4exBkbjQ59TrAdAJJIwPcZpaP5G3eRnwN
	CLXkF4c93vMI0n8fumdVMtlIORVxTiv2Y5Omeu7SFdfnK86O/xyRoWCZI0H1sK9++Tt+9nvVyalv3
	zWrs9i8bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMXa-0000OI-LI; Thu, 10 Dec 2020 14:03:30 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXV-0000LO-Kn
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609299; x=1639145299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZEv6fldcIfyPLrkGFKpdtaHk67JtLplADjR9GiPnjU=;
 b=BoEyjaJtirmiqfCh3pm5bHVQH7GIiTg5XBfYQkXttpl1RHK1ND5iWPXC
 mxsdo2ICUXDcYvzg9kOZMfonHy9PzGAtVJV6jh+dGs1txFN3u1n2kHPO0
 nWfBejW1T79E5O4lOk8G4jMq5FV0x3SsTRhWl6kimCWrq+ngAIaymKur+
 oxw3ygqjjk4IdnJJEzRMCOkcB+arzA7sNwk4KzftLbxqRHAm7GmYuH0yQ
 W4J3gI+k/nBwcSd9XN76xzmzkwr+sWfX9OZs5BsIY1XW3hpoTbNDAObvd
 YfzCogaTAxQrMPUyWZx4/JjxNbY96W4NBclvbFvaiSF+1LE0d5U1XtOAi g==;
IronPort-SDR: PegrFFgXPSIk7bjrjTHxug3GD8ZBfrTk36pfS+cMmpIMAI2+eUwQ0tT0UyISR+XK/CYm+hSTcK
 DUFbQa+Nms3U3Dt7X9jdXLBVjNPA+l2iH/i/uNr5ZgCyJolV7SzUN2UEIy+6I9KVPH1u4wynAX
 HMGx5YCwcPaJsU5NFFtUzw0Jc1uabeGTXf0jUzqm/3I8w5DGcSjXOcZQo4jZp82siXEJFR7VaF
 PqYIY1Le0RXl9C6l8QLYKvyX9+BB8gCJNs/610aFAaRAHUUD+l17BuCvVys0alKpcmp83DgeGW
 spQ=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584812"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:17 +0800
IronPort-SDR: u4X7nW3Nnj+pn7aZtBjYPhjTNeC5gZBzhg2QU7Sg5C5STqBNmm9g4jQuPG6616hOnL8relpwat
 X0B03yKTfL1cfrYTJ0TYJdOXUP3r7gh3A=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:16 -0800
IronPort-SDR: IOS+pg1LeKBlKFWi0ugz5lr9e0jpEh3Pqr+r27y2sT3h/PteAqmHhQViXx3eGkBThmeQM6p9wo
 2eqznYo+dOpg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:23 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date: Thu, 10 Dec 2020 23:02:54 +0900
Message-Id: <20201210140313.258739-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090325_880601_A0A4194F 
X-CRM114-Status: GOOD (  10.74  )
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
