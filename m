Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24169C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDF1222B6
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEDF1222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CN3Zz+K5j3a6oLdZlViZr98CW/lAmZNL6eMOEGnxk+w=; b=viaQ8IjUWEMnpVSFcuN3jN+D4
	0BgPKuqyP4XqCZFdf/Lq+IssYOrcIz7H+LePgEf3iECNC6hyzb90emRwQgavC4XIzatdoWKQfi/zn
	uBsfYlOfIWUG9rTXPcMOzwIksHue7woeprVTuIptdlyPksWotHXEqyJUqTAP6cSm3u8b1s35JfYRr
	zwVBaD/e/2MVFPc6LcK06zLKrzMViSzo4jLFnFqjO5vb4wRtCsU0dr87QWt4Nj4wwDPy9tUUDzySo
	5PmKBjqqEW8CVy20xoNl/EQjG30TtbaYeyH3dk02nJCVMot5uxrJViThKHKSmAlc9AapQK+6lByzV
	CFatq8CKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmJ-0000CX-Vg; Sun, 13 Dec 2020 13:51:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmF-0000AJ-AM
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867468; x=1639403468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muoLqIq9oUwVuEYLXSApkgkU2WvgA1DCXiwKKEwbKSU=;
 b=m5Hxh7q00YIZbLDw3XLvjGYkIRewTXRTQF1iObYxqXlTOaTXgxjzR0/f
 whWh8bEf0CVJ9JUvyRyxWomnT+pQympX23HongKvxOfmZjidrLE3ex4wk
 Kn5ysFY7v8qMNezAuUklcghQtnIYXM8AI7sJbmOz+PIFw9VTYGCCUZo4U
 bQZStddM664JnHVYz4VEkH7pWtUeFOFo1Ni5TayBrTyLTgdutHzKShbqw
 +4m9zKyp76NA34gIAU10mbzdM3PbdYxWmUNMhgQsWvFEahLp0Mt+pyWQF
 xFTI55rhBKtCEa1xjZlMSvKpTrOVvido70Qrcv+o5ZuNemAFmW3QXos3T A==;
IronPort-SDR: 7Mwm3EjS1wpIzZsxcCx7lcojmxRFpjDRTfRWB2IZS4nXa+rqOb1lu1sIU03jt5Yyzi94VaV2Mx
 QV8XcASqBi7hvZktkgSzIffkR8aWJwmHBToQ8Kcu7IAk5VEk9NsdKakf6k7qTc7QUovtHKLTbg
 Cs7qnMA8y55YXjVYep6syQES+NAmJiBX/FCSaGTfhxSxANN/0uxhTIi+GPefkFbmDSs/AqgewQ
 Lo7jHenhs0D5aADt3W1ea0fFO8lhqerPq/3xSOyzZ4t7I7e0pmXqwiQoegPsCDB12sXfiq2+7T
 rG0=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242555"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:07 +0800
IronPort-SDR: 1CTkTooQnZnUbhQR7LDC6cb043lgl2YSLRjBZXnsdmpTomNTEw2Pp+YT3oXNInVFiuV8fwwk4S
 u+7xXOy7DMtcNFQQzb25JcUOPgWI+ioCkKb149WhFhNMfk/E7UVt0oxf/fdytA36LIh61pNR6Z
 zckeJZWm324vtR3S5RmPnwlAYecHtvWec4En/omvJK+FfliwArliC0b9DRsCbIYH5USTkoS18Y
 W63DAJ5oHtY40OCJvJ6xW+G5Ck+lxIf7gURgmK0NYQSsrSWLc1dPMnF7qblXYMThsZ7JtnuUq7
 JcsNyb0gaw7RYsXHtbIwhJR2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:34:51 -0800
IronPort-SDR: bRDipNHKqEL0s4xlUO9/ssQBxqhIMyPNGyUZNKHEg8JMBPhv/nFcK8Hoe8Vnl3JtUmm0vZI3X8
 8xfE8RrAVFb+FXsip/awUQx+nk79J/1m/WIvkalToNHQZHfGZqT450xqz1kp46sQMDj+yweG+l
 GbHOBRbjR6QPJfxQNIVofUNSj1SAeZ0m1/FxpJeXMp4LxS8ZPix8jCCPQ5CY1e//VWCmCdPOYc
 Kus1TAw5dsw+D/urE8r6icoH1FNdc9qocyjGWFGWRhzyUlV9YWWpu0Cic3eEymVzPMPoOFl8jg
 kcA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:04 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 03/23] riscv: Enable interrupts during syscalls with M-Mode
Date: Sun, 13 Dec 2020 22:50:36 +0900
Message-Id: <20201213135056.24446-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085107_490686_349FBD9C 
X-CRM114-Status: GOOD (  12.19  )
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
