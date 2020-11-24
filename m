Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7288FC8300E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F622087C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tc/DAHi2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cg2NuXVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F622087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=Tc/DAHi2qmXIQE/9Oi4b31vc4
	mMV8TWU82kufDYyMcoN9rGif+vDQK7ckj4l9Crpc6Uir2WtGaF7Om6kqvbXmJherFXBXS1XWmTFLG
	PZqI9j42gWIezNtHdMV1rQutTzpRFNzrzoS2rBD0yXYTiSBmgl9Ftfxy0SCdhwhGh1ktpMyy/DjnR
	5K0RaHXdWDlFFRnirowFPKX0oyzfTcyn/qpTCIMHnPFyrCmqgADyEe1fr1y4Y0A95igzunAadm7oH
	Bwm1tBd8hK6DiErUXLewTy3ElLjmYC0KafW665PB6j+U53jpUo8k6OogBL04v9AcM21x+NaZEHSoX
	St7YLaPSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5G-0007Pw-0z; Tue, 24 Nov 2020 04:37:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ5B-0007Nj-R0
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192657; x=1637728657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=cg2NuXVMdrQwdo7Fj30fUvihzhyK+WnlHhevmL7l4+8HIxKIpCrVKOgc
 Outi4SS50InjgwYD/xeQrsX3pPiy3mT3ytYISx8u92Jln4TPfJ6MYLW9C
 73YCYonEocTfMOFIRyEYjqu+8YLW6haKgIIfNdTKGA2/l3zS6tqKfSXHF
 Uog5QEcjDCLpZfDkwivaQX8TyracVc6MAL1NL11EqJ7j9g+9XniIX3I2G
 WxjArW1FiVgUK1RTjKypMUWYJ3uErE4psLuljKw/ZMDknfbOmFqQaBrsO
 xUYnW5zg33gnsV5jTiElnD+o/JdhU9yH57LmK6mloWwRR9tbRlUHN3z1r w==;
IronPort-SDR: UXdb+ZHx//snrBoaPhLvLbjZunXBggBfEzcRloRAV100zGfPn/UZeqE8uD0RdnFYuH0eXKmKkB
 5R1cwUZrDO6xD5WpUgBwBQJe+YHHyOuTzkO/GHlfv3hnl8AMeECYervogCyi6dQANGwY/1SPuS
 F0H8GCyOMyvpXioi5hrSjlbECGSizykoXy8kUZK65zA4z0MxcUZ60St8q5BXpsWLg8Lwl/QGrl
 AbyS4WnfA1U5nW/prgkwuNGmF8piG47h+AvfhhM9Z+iDacFsM6cfQcJ0mZRWCtMTXx4ryahIAT
 Xfo=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768573"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:37 +0800
IronPort-SDR: krFMugT1cZA7ou+Qk3AisaDiyYXThu1ZyXPOFSm+mGHdlbOmzF2AhhB1dj4qBt8I3qbf3mVUUS
 02VHLZhg+tBmiw9ndU0elBpEdwM8YI0fo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:22:02 -0800
IronPort-SDR: +GJRS9u0nUxBOguxN99UNrglnLx6r2UfTkUb1JzQQ1VXyKr+GFadfoi1Ket/4sgvocApic1KjT
 0GXKWXTHUbTw==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:35 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date: Tue, 24 Nov 2020 13:37:10 +0900
Message-Id: <20201124043728.199852-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233738_077270_2FCC1057 
X-CRM114-Status: GOOD (  11.57  )
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
