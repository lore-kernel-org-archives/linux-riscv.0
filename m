Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8E9C193FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F5823A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07F5823A6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=IxWuSLXS5M6PyRiyJNTaoB+YW
	SF7Q3yZYMZH3fyc2CY0MSi1rDVHZRIyHdfFXvNyE5kQEXxjgIR+yEGlnQHqZMyIYI6ISK2kFnMI/d
	CxPY9PXpnBFU8VNd+wwgngS1p15Oil2OydIMInihV5QO53LGlqcwYW+snBayPEB44ptMViJJW36Bw
	oiibEz+VPuoKadTPBGabHbHj39khNlaJItQXXG34QlKghxMPc8wT5JYq4OZrvBB9ISGu0sAZn4OWk
	e20Pymo8h7GG0NP5IUW55gGLpuwxVqpv0APSlgPD8n/Xe8NXpG4CZ/DPfpuP7VlF39egq4AK+EUwd
	yA+Tg1A3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXVi-0000B3-6j; Tue, 08 Dec 2020 07:34:10 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXVe-00008V-ON
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412846; x=1638948846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=f9PQnv8NTxROQ/C10EpvolwxUi4aXhUsouMmQdynz3w/PcOVUqd3ct7f
 o+KoyQLCcXhrqnyntD0XnpFhZ4H3I9TmROIXLx/kydU2mcj4SsTqWOdEq
 ecSRDhwCOsi+R4WpvPn/vKkCzUPzRg+d1rmUzqNfank64XyvH2fg9YmxM
 VPUQiRgkAqdwNSlhCd7BGpv2JLUMcotrxlOrrh8Al9hdNdjAyyMv3Rv0j
 X4/KjtOhMUAKOvbT3SLOHdxE8DBoeleMhIWSiDZXVJLzosfo5JSHNumeN
 fke3KEi72TDcfhHavYEWSaZLKCa1cyzSS/QLWSiy+znIcwYv3PWazzn9O A==;
IronPort-SDR: jVbzUqMUW7k1UuiqVr+Sx4BosOnxoyA8mFUNsic5n673x4s7eNIQC3rmrR/NgPPTiKr8mhrJE/
 Jl8/nITlNMR3Ut8jOREVraC6Qa2LR/4jEn4WJdZkwRPRMGRyxetL5ZmqHq0URwAhP8Am9TtILk
 BiEyNlCT5EShrKfcwBh9O5LoPd2mqvnoYJERabFjrIfB2GK5kkWJDtRXkUsjEwdtoClaFBgAMK
 B8vhv9WZd0zJ3Eug8dAZXM5XgLnJtNWGk/AbM845cVtXg9P6BW/GHHEkbRbQETaPkHspgluyTc
 1xo=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714883"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:06 +0800
IronPort-SDR: 9N4IUM/GV6ugOcsdySA7EBnaWc1QU0nrmPCaZdGUuKesEqAZ37c7fXT8R/lrk6IeW1K1YJ0cfA
 /7gW5O3OSKuaoCnqmRLWpWRFrDHdwWnpc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:19:34 -0800
IronPort-SDR: sGfnrbNomyJN+r99NCkMNBFtPemtnagjUpamcF3oVwnFEZVKZ/C36EnezUmMBHWUMHtHm8DHCp
 xEbw0WO2iw/w==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:05 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date: Tue,  8 Dec 2020 16:33:37 +0900
Message-Id: <20201208073355.40828-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023406_993296_2AACCE69 
X-CRM114-Status: GOOD (  11.05  )
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
