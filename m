Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C4C6786C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 06:21:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E6D20811
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 06:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gYxQbY7X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X8t8L5Lr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E6D20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lITJcXkBKsByixcqe5ODXkEM2R9OyZkk07MrAPSQmKk=; b=gYxQbY7XUh8f/cYTDihGKXAvq7
	l3nm/Id9idlhZDl9sSFF5JqVyEcoBJ6/JIg7WaygFktK6XGcjcEFiA9sy6O8PA42oEI0h86Nlsx3J
	zrfxVhGNHWcnFcPSjXJeZKxQ1DA0xjjdJj7I6w0pG8QBOTKxlEOJTPiGEsPxcsJD4QBf8sSHS20u6
	Bgtt0FX4+C86H4ZUVhSIhZPUCOYoY6N2UOvgIH94Nxj2q9J/nlqy3/DXZlVeoJzuJ1Jigcgj+bJyQ
	t19c65qLUp+h/hBfO03uc+qQWQ3erjzY3AnkXK9poTKII7KR9nMDHCqXZ2VVXt4yvgzFCyJc7V5i1
	Q6EuApFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXgr5-0003KI-GX; Fri, 14 Dec 2018 06:21:47 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXgr2-0003IF-Ta
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 06:21:46 +0000
Received: by mail-pg1-x542.google.com with SMTP id t13so2201164pgr.11
 for <linux-riscv@lists.infradead.org>; Thu, 13 Dec 2018 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y2uFCXiJuXowKbjYO6BVNjHU6wQk1zGPwNY0PMaxB4A=;
 b=X8t8L5Lrcf998Ry9QkXcSsKXXfFvEcQOFPFvGwzZDNgzkrIqTm0c2/FAw6oLntUu8V
 HFX/Wm7lBcAHONkBQ7Ph5YpFxaQt8TbHa/g8ua5shT8ij4yvqmZuAAnwH78DaIeQ/GbX
 7QZ8usiAxLusob+tkP4d8GQM5tvEOlg+Bxs1MsS93IzKzhWmnOXu0wEthqULHK7W/nfG
 vdNAChftTblNo0hRsa0x95hTxYoaXmrjNoQMO/Dbj5yZrPvnbqkhwcAaM7gzufjnn41N
 BaCI74p8ySBF66WrCW8fiOLJtsfdk5BnepjMRsJR8nf/DGyNfpD8iI3HGNJJm1VoIwMJ
 R64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y2uFCXiJuXowKbjYO6BVNjHU6wQk1zGPwNY0PMaxB4A=;
 b=lHOH9cxoBVe8F2B/kP7c+teUcLVu4Zxp5DY/JhCvYs4w9EbrJD4d+ynXhpDqeG8i2t
 tLrHcasJpBp2hklU/KwPIgYoA2MhF+K53a0xKOY+xEVPnv72cEgXQyd3n2zYJ0E2Bh0L
 5W36W/Ig1EOSUnQmA24XQ0Dab3Glj7pNyxSQxZLDBGISvKl65KWkpSKoSAP5lVr83aha
 olIXYs8Prguyx9L4QkWzVpvFX5fLT99tqKa9ej09BTzazR1gsIJUeTEL9wlyxZIprngh
 SbaT/7fZAi8cJiLYuN31G7BYIC6qSqMWZtzWZsmiGaa8yRx/epoygH/Gab4SFsvBYrOS
 0/5g==
X-Gm-Message-State: AA+aEWZ7zmAvp0xwXR2bWZ1F2YliQiy0aPchu8Jz3iojiKi9R18ab6Uc
 XFlpgTaR4qS+qtpFQF+YfUaA9g==
X-Google-Smtp-Source: AFSGD/VEStnIFYNojR+jlGrPT+98KR2dnXiG+KSAOGn8gu0KsUA+RHRAZrEFQr6S7RO5wyTqB/RP4w==
X-Received: by 2002:a62:69c4:: with SMTP id e187mr1740518pfc.50.1544768494383; 
 Thu, 13 Dec 2018 22:21:34 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id i1sm4841703pgb.46.2018.12.13.22.21.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Dec 2018 22:21:33 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [RFC v2 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Fri, 14 Dec 2018 11:50:41 +0530
Message-Id: <1544768442-12530-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
References: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_222144_952354_2EC03EC8 
X-CRM114-Status: GOOD (  13.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT documentation for PWM controller added with updated compatible
string.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..250d8ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,44 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. This is set globally in DTS.
+The period also has significant restrictions on the values it can achieve,
+which the driver rounds to the nearest achievable frequency.
+
+Required properties:
+- compatible: should be something similar to "sifive,<chip>-pwm" for
+	      the PWM as integrated on a particular chip, and
+	      "sifive,pwm<version>" for the general PWM IP block
+	      programming model. Supported compatible strings are:
+	      "sifive,fu540-c000-pwm" for the SiFive PWM v0 as
+	      integrated onto the SiFive FU540 chip, and "sifive,pwm0"
+	      for the SiFive PWM v0 IP block with no chip integration
+	      tweaks.
+- reg: physical base address and length of the controller's registers
+- clocks: The frequency the controller runs at
+- #pwm-cells: Should be 2.
+  The first cell is the PWM channel number
+  The second cell is the PWM polarity
+- sifive,approx-period: the driver will get as close to this period as it can
+- interrupts: one interrupt per PWM channel
+
+PWM RTL that corresponds to the IP block version numbers can be found
+here:
+
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
+
+Further information on the format of the IP
+block-specific version numbers can be found in
+Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
+
+Examples:
+
+pwm:  pwm@10020000 {
+	compatible = "sifive,fu540-c000-pwm","sifive,pwm0";
+	reg = <0x0 0x10020000 0x0 0x1000>;
+	clocks = <&tlclk>;
+	interrupt-parent = <&plic>;
+	interrupts = <42 43 44 45>;
+	#pwm-cells = <2>;
+	sifive,approx-period = <1000000>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
