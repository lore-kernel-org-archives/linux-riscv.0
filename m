Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FBC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA5322D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA5322D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CN3Zz+K5j3a6oLdZlViZr98CW/lAmZNL6eMOEGnxk+w=; b=aKeOvaa+LTef0o9xAJOI4rNBL
	acfs3QMfd8NCBkY2TT490tWHen/jXdaZHRUxJu5QXZZEofcfd2uVpM12GOmiuaGXry6bveb/vywOP
	hN7TmqSKSwCqBMA7kWICtN5Kc1LdnktYQERYNBrckmxFnyU5bRy9MFeJWsMPDBbgscI0eaSinEtCO
	jIqe80Ckqn6CCpxP3z/ZkB2EPMw7B5NOVf6g93H51hiWuzvQ/pTFXp9mMfnzQCi84C3xVViojKYbM
	nsHdPAEwsu5R1Jil31Snc103de9tb9q3yO/KMTQhE4NEgTBq7STw1foCWDypxArY6rgWFUgwZVLzB
	Vt7lduhAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSj-0002Vg-OR; Sun, 13 Dec 2020 08:10:37 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSa-0002SE-67
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847028; x=1639383028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muoLqIq9oUwVuEYLXSApkgkU2WvgA1DCXiwKKEwbKSU=;
 b=BqGeCLMOnbKW+MWwyCvvkdX1Ow83VXBV0mdGbnP1JGFsC7IuKlJY2bjG
 UL/H5XvUq174llY9HG16fD+OWB5BvhcrTh2zy3HLbwq60BO6D/rKchZme
 okGdAvvDYRGDYxEcLFZ6Si4JP3clNiYAjvIXJrbKgor6e0uZM/gcoChRH
 SMq5zQtcsx5R+R+UATXkzeUC5lJQSSQFWlIvt6nnXvU1TUnS/wk77eBnr
 YHlbUWlWC8LDskHncQei7SoCJSVhHKTaeD6aShPmn1+3whgbYVv4ElT05
 g5BjIxdVo2PSrsnsJ3DlCPqLymsg6HCw/0vIrpU9L0I8EeYTbMKYlzgag w==;
IronPort-SDR: 6JOItdEVxjvkYNYDDMwfn6a1h6Z5i5tAE3Eq3dABEfIsw3i4nRIy4P8dKY9rG+CB+c64jXJ2hz
 AJNvAINszsIDzEl2xdBrtDIuqyHkRd0vTD17qKQZzB/PFj+dyclgZvLpTY33v8Lt8G91dm7LVk
 CsC3yCM+Cvh54dh+J3EwN24HMb1/FZUahLo2GxZfVZ/t5c1/8Zbx7DJfHxd/prQWyKOintjV+/
 jovjVJGeMDyQEQInLo6khALSlXeFX1Z/zQLKBVellu/7DoDCX3OJ3PSjfW0rRbUmRwPkdNKAjI
 43Q=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235144"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:27 +0800
IronPort-SDR: 4OG6a8CedZe6dop4OCcEOLm6ot4S7CvJf20okaKNQtnafVv3LVRmOh+3DA0iuhngjupYYJw83u
 /PGD78I3EshSQ6KDs7/OPUkg6YW+3YcSqKwM7n/QEVo3k8csJdfNlhboINjOdoVWIJsDS0dd9Y
 Kz6LSRHhohBf4TB2XCThQLyYYhiTjVF7mhXShHfuFMOtzOFErurAVh2hpuHjmLjKa9f+6wzrS0
 qdf8taF/Udt/bOR9umFUhncdgQaSNMonCm4l+q3CDdhQFeI5VBFz0APeaQBDoByestWj8lXiOU
 2272iEYzpoNXCEZYrAQkl8Dr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:15 -0800
IronPort-SDR: JNYt3tKikLR+31qmHDtIbo5dDeSqHeVtS19c9DBzbMhE1f0aiK1UpEoNaT/7NfnRIxihfR1D9U
 l8wHqO7xh7V4j/W5qzweqpRLk9Sy2JRJHYZYR3ZN00PF/QQ9fOa71it5Ykg5iGP+wpI+CwLzPg
 g8y18DqbH5xLMX9tj5rhyqZHwMByZtOId4L5BBmBzNyq5RIaRDrVHjN6cFbcprI80l+qULzLGX
 HS6Coe8gwCabV/Z/0gGgl3vM6ix6KF2uy85UTsXeMDoWPHlIiVyoncOgEZffc5OzcnvqL3batN
 wZ8=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:26 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date: Sun, 13 Dec 2020 17:09:57 +0900
Message-Id: <20201213081016.179192-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031029_116568_4F310820 
X-CRM114-Status: GOOD (  12.11  )
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
