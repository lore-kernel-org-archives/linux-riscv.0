Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7271CC55ABD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A0A20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSDTmeGA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AvNRiFUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A0A20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAmLwP5sYNPHyzW5qvzX1N9JB4rYQq/vtO66cNHjSy0=; b=KSDTmeGAfhRbJHzCfHl0b/T2d
	k7644W4rQKY777xhj2b7KCSoj6jP4qn93R0x2rjEPTdpaz4lVWY2W5aZWU774FNXhbEgofUycCZuZ
	bvVRZNmZUdAu3dwOuoSo4sR58PT7I6dM2E9xozi4orrVW1W34rSVlMOqPiz33OIj2LGY6/nZhwDqn
	ZnjsZVn5vY2Qgbs2a7fp9EZG1VUUE7NTvJaVYgBdNY3gwNU0poMT8ALRtj3u2SXB3fWeSkPtNo2je
	FL+IMGUZuSEPeZnlIFbtKuYETTO+dBgvBfrg006tG4WRsDlKu8Ok93FfNdhEVyyb1/pYyluBdpAG2
	ZiaO4VYGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNC-0000fA-NJ; Sat, 07 Nov 2020 08:14:58 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJN7-0000PH-TJ
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736893; x=1636272893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
 b=AvNRiFUi/g0J+eQMYJhslS3zYVtEWLyGrjIbPYtF1ifpqUII//WJxMWa
 q/CTnJmaJ2miZ3fbNvcBGP9ARxsq9BOmjnuRdy3b1YZsMsLk3rRiclXyn
 F8qTPfF+O8qdKcfXJlT6vMtRrDhB1D3kRafVvQUV+MOqBMSZ5I/GwPwIN
 nv1i/EhWZLXdbn4dzcTVkCAEI2Z/FDOuhYW/Vf4LDX5caRx3YCxNf9q/V
 A+1uiQjZ8kthqaN3lEqSAsAA/f8o7k3vHFsfUOMD5V5b70p2JehrRGCUv
 WaeB4z+GFE2amBr/E50qc9kAbKVXI1vXA197npyovMtaFSKI6gywpUEe7 g==;
IronPort-SDR: vvhd/k3V3uJUqFgjXdQ/qEJ4ZrOTxGk9RLlre+728NMd0JYj4X4yzaml2YLbj+vjOrH86v574i
 2cDMJu3S8Dl/KDd+kJVuBpWXdh6QTPSDZQdclMOsSKbL/33/6fvJXQ/p65Ji4qa6EDDiTYybdy
 VPzGFf4y3tFfiSD5IN52wveaKWa0va073rko1wXAjenKUnJRrF9sBuP0xQ6D6m5F49eIt+Zuox
 3lAcC0U8Ivzc4T1TqDSZz6jYKYNquL63L8HinJctyuAbHjTzSGIlT19SeMTPc9tnkJwtCdfxxz
 aLw=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079288"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:53 +0800
IronPort-SDR: 1ndUuWUV2ytn2ZrvrSm3d5a8HwtpzI8Cr1js4g+zzTdAzntWUiEKzxOqj3aiVmCVnAoMwsTEiN
 AJpHw9ztgEwvUqQGT/f/KACparsiOcPu8QkxvGuqS/MvE5qk7/rGOk1iPV7Wx8DCdRn6tMl+UT
 7m5njoN8k4JAkLjMHHXslb0uxnEJR6Rmqnbonb/dwYBEKzDjHu5tuiZxOvUsqPrzDGaAMgJt1r
 u1DM6MYAvLPzSzI/AXPoeCgCVzfM60QzeSpKtyT7C336uiLAOnYIadd/APYxqtV6HhirbqVgNI
 vP2SQkmYOMZ1Jcr4VPdl9OhZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:57 -0800
IronPort-SDR: fT23JgunU722jRduFvljIERP725lvkEaBUxXqos8amCUHUNMsIduVaQQXwkSxtHAaC+rJkBUv8
 IvTev3D8aeVnB4NxdarvBXucISWuB6ZyoMelBOI2ZIojCbT8rhZKjGN7NqrhDY08NzgXuj1dZD
 BfR5vSeXRdYSz4gjqPEL39VpTt4d3XqZT2b6fs4l9qpgWZna7a0KhuWToPbyg9xfVGxKP4wwS6
 IqL+0nQc6LEjj7EJY7/K0WPS4cmWaTD7UVxP2dOVC1SbZZb0hVOVPGcXAUU1iB90e3fxudnB3D
 vtg=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:51 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 11/32] riscv: Enable interrupts during syscalls with M-Mode
Date: Sat,  7 Nov 2020 17:13:59 +0900
Message-Id: <20201107081420.60325-12-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031454_125303_B7251BF3 
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
