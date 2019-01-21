Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC016C6777B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 10:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F0F20879
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 10:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jzYJtHro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KW0hsGUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F0F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XnJk04/avwFK5GMdPd9B4tQqIbfgv50iNdxIxgAK/y4=; b=jzYJtHroIcHwJBgHoSz71w362C
	cB85a5VJV58mStFuPNJJeTwSDgyj8dlI1KfsyHfNX0wzpedTB27MOojSsWbTkWyI30WWyAi6bSz9N
	EZSurU3Xx57VF7tZ2p8Di0SpopsXzRrQIGrl81iOKzKPXaEe72r+lUgAFVz54ucnmvikDb4D/XNSp
	Ff3RV/NhAVGSxovWLGA8uMd4mMlKPsGOzdalWF5xDeFXe0HaoDLVeFFF9jyRblw3HC0kuMmmwctdU
	BPGFLcxE4jYUTieA5gFLH7mb0p8R/hC0qa0xzjlwh5xrsNtXngZQob8ojaJGAN/iMi/yHX1teORdB
	nFOJhB4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWhd-0005eO-Q6; Mon, 21 Jan 2019 10:21:13 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWhb-0005dP-B1
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 10:21:12 +0000
Received: by mail-pf1-x442.google.com with SMTP id u6so9918314pfh.11
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fmoJrVzwYFHZWOk1bMmXKD4eQEtHgLKeyJmB+PpZY1Y=;
 b=KW0hsGUc4Q45vgSw8HKUIJpINXbRFHPOTcS+MDH6hnslwsHUZbmm8fDkRh4UllYsa4
 ACBqFiX1CcIK44IzlyuA0w2F/sqvf18oED1FOEEzwC9eTLBdXp2sPSNq7SdhV+Ak6+Lt
 x1gEjq1qLzRcCcWn8KKbVBY1uRfYNFW6gsl6S0ErKkjzrBECo+hjEusp8J4YgBUVFxET
 fKENmHl485ThiRGIZbkCbW6+cjKSobWRn1gPxrGwf752ant7zV6N8dWHcGkQevrTe6Si
 dYsyGKcJS+Rsshlc1aq7JSEVgpvF5JTVLsx81XtOlyquF9Q/A8iDfUC4oyqu5juQFggI
 t8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fmoJrVzwYFHZWOk1bMmXKD4eQEtHgLKeyJmB+PpZY1Y=;
 b=KlKfqshc5Ya3xoDiPw7mOZ06zgoDDX2//xvYsMQ7FOv1LKj9c4Q5GIFVrL1vVo/EiO
 OwwuPN+FTD1/RNP2DHv/qNe46RRR3PGn8/FAop0wXQdmNlNTnb4ALF7wthXOc4wXwykw
 80VLUVqnrA/RQuXeZ/PRFNm0SIVHcqoDi1N/qJVwXFu5wHvM/bp4hcFkb/1d2pnUxet9
 YU/5DG/M99sh6dFHTE92T5E7JoZVQ0F5TFOX0Gno6c9sctyEH+XHzMskRXV4L8vTzXGh
 bs+jdB49dI8/ABm8P2nH81MLS7oHIsTbOErepI+zFnxx1O+CJMplhsni+u5dqC5/5FwB
 nQvw==
X-Gm-Message-State: AJcUukcunhd/qWIMWq7fGqhdVIlabF6OIqdnCZ4IfowULroOFIZA+BnQ
 r2aVsLgQvlPRUa6zslOaodfZag==
X-Google-Smtp-Source: ALg8bN5x+22efiFnU/FtDH3OQ8cc56IzsUwzel2+8q6gEF5nL2uq9xo6kRp7+f9PouaDwcCj17Zq3g==
X-Received: by 2002:a63:d157:: with SMTP id c23mr27380659pgj.170.1548066070793; 
 Mon, 21 Jan 2019 02:21:10 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 m85sm20048874pfj.171.2019.01.21.02.21.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Jan 2019 02:21:10 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Mon, 21 Jan 2019 15:50:42 +0530
Message-Id: <1548066043-1252-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548066043-1252-1-git-send-email-yash.shah@sifive.com>
References: <1548066043-1252-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_022111_380567_4F25D0D3 
X-CRM114-Status: GOOD (  12.87  )
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

DT documentation for PWM controller added.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..b207908
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,37 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. This is set globally in DTS.
+The period also has significant restrictions on the values it can achieve,
+which the driver rounds to the nearest achievable frequency.
+
+Required properties:
+- compatible: Should be "sifive,pwmX" and "sifive,$socname-pwm".
+  Please refer to sifive-blocks-ip-versioning.txt for details.
+- reg: physical base address and length of the controller's registers
+- clocks: Should contain a clock identifier for the PWM's parent clock.
+- #pwm-cells: Should be 2.
+  Refer to bindings/pwm/pwm.txt for details.
+- sifive,period-ns: the driver will get as close to this period as it can
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
+	sifive,period-ns = <1000000>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
