Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA68C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D356F2184D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D356F2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=63iHsuArXsVwf5P4TdJul0Gj4XLrlimp+LrD9X282oo=; b=DTGwPHLZLEItq4bMQqyr0bCts
	r91EVjAgMWHTYhPpeKG+RjsbBrHEM3x6O4fvUiQoPp5IGC8TQXdMurIVg2qYodnQEFncHFXFA6zzv
	YXkez3PwQWor+CA02qsEo/vJ3uoDzguaDw88BHtfXzkH8ebcrDKsrSC14FQ+oSiBcaIMDPgbR9Oif
	loS6CnMRi19ZbxeFoB7nvUmcMzDHsu5VCtYKe4zbmfu1h00ccuO98WOxkcIVsxJVq3Ha9k62yvnmW
	M4CEWZ4/aKX2D8fBFAE+KAbezf8DcxOLMcBtcke+VRSHAWYELUgJTsGIP0H1qD5NiDqpahwKWvHAL
	pjAQqjQ5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCoY-0004Yg-IL; Thu, 10 Dec 2020 03:40:22 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCoV-0004Wg-Rk
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571619; x=1639107619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZEv6fldcIfyPLrkGFKpdtaHk67JtLplADjR9GiPnjU=;
 b=RGJC1qT6KZ1gcl8mqluZARkqT37qvZkAcYtdI//VW7GFpqhgh9AlhHqi
 HynMfnvUcH1zur9qGs9ko3GSbyuodP3w9GVd3ZwWN5dBj5/ErQS+8HADt
 MQCBrYOSkFh1HAEBJtCNjHpVLV63bvPkhJcHih4blwkuiL+7O4ryH/Zq7
 4J4QGQbjtCNI/UFfm8TaSc/hKsWEru2yz/I2KUGKiFwWMqYNPd7354Jev
 6nBI1SsftCRxkIoMoGUyWzjemwba1b35VSsb/DuGM8neIOBS0sre6yKBj
 SrhWjpYZg+ZzLb4x4lMCHpIOj6B70uVnw4U0Snw9xJEeOXHG+JMYfk4kO w==;
IronPort-SDR: LZYqz4rusIiHMddEaJacb/Q3k3Gmk/tiu7iPDLwFnk7jT33rX8ZHTQqY/E78DXOifaCscWCiJr
 OMkFUE6E7TNFNyER5/oZlRKdt+6tqRp82udcduaz/e/Je3oORuAzxqdEUaKNrQG80BQ0cER/s5
 gvAH9FrSdragNBw7Sd+MJwE+ChsTp3byfNbR04mCE8p2GhMU0gcJmvtCWnS6F6cjYheeYt6lBT
 DbqkIYtHpjPyGYjfGZ4TwX5mKvPUH4gtlIL4ZkgkNSja3le8gT5QtWSiqd63xNer9gYbAGcpD2
 vJM=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813111"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:19 +0800
IronPort-SDR: jO2iMthOSR7P4TEINbAWrahrYLK3WS3HI0GqYcQQolORy5tT+QnyolLa+RIC9PyCDQEsAaevm9
 UtkE16fQYcpb6zh5M4NPVr1+GdSOg41X8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:15 -0800
IronPort-SDR: Uo0Xgk7DJ98jUm15Zhyn58dKXxaczTnqsiYrumv5dYcjM4xtQbV7Z3FmF1Z29FDAO/9MZS9sIG
 bUwP4Hjn4FQA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:17 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date: Thu, 10 Dec 2020 12:39:44 +0900
Message-Id: <20201210034003.222297-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224020_084514_B55DDBC9 
X-CRM114-Status: GOOD (  10.76  )
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
