Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8E2C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 08:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C3B214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 08:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rb7GLDP/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lGu+GYtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C3B214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wQglA4wX0PQDEyCpAx8no3CWNh7RHCyz+iP0q9u+dhs=; b=Rb7GLDP/hKFz1h720GwpC8Fmc0
	LcnyGJV7qQ+fWpe/Hw7D7bHdXBMz4vSxun8/rEkknkMWdVbwvQZz6ukCVNIy2nwrBPwvhCxrGaDfA
	nW22fyx0cpnUy5kHS0Fau2Aa1McMr5OWn36K25XavPov30DOwFoWAbo1WNEJCKAbQhvy+MjOYzYQZ
	M9FwhKUtYunpmibnK0341mKM82/2eEouYw2OPZfQ9nzwwHqi3RL6zktrpOXT4zPZKj1ZUA0/tA/2p
	/09ZQm1nRBpG8dmADXw+XKtm5lDFSthlytUxwxoUBadgBG6m1cGlO3q4KFLroe08Q6ZyI6q5PqYw8
	XQ5PD+qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3cVt-0004Se-Ti; Tue, 12 Mar 2019 08:11:53 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3cVq-0004QE-IG
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 08:11:52 +0000
Received: by mail-pg1-x541.google.com with SMTP id u9so1221711pgo.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=lGu+GYtXCa2KasGFdXUqJUz+iwF2LhIXbYg01AKZ+WKV4SBVy6niGFyEFdS9XxtHj3
 gLhfKpQeKbe9PWH4HVoBu3mbnWLeCJMPxSA7Rf57/aonJtxSbL7+yVzbwYKCaP3+DoBg
 pb6sLhJT2FEiGojX8DeuCxrky18XzPEyvESbmrIkbcPoPYDPvPA2qNo+XMqGZLid2Wls
 zm4oJ4Bxd2InuKitan2TnPkaz1MUkYaHGNdcVSJjDlflDsQ33OSaLCTXgPp0Wgg/0quZ
 kXPqNmMAq+A0zobyTXwaUMnHrcouyVWFjXnXbwXI+NmADWhk3I92gh8BLRq5jDUNo10A
 9HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=jTMKN9TcCtZ44mbCnKUffPAMYE3YLBdsdTwK/1Ua9VQvBmkE5B95hInPtM1y/mctNL
 eV08rcTG8CR2z5Fz6eVGu8AgcreesBf3fJon0HeDv7kwDpqh16yjCfPbHDfoUK1SYUxJ
 yjjLmJfBcHHhZxFJ2maYtYScMgV+ffLCxtLp6YRyEHna4t+wUtqASNgwP33Qsz6pXx93
 CtMZ1U0UoYGPVjp3sIxjQUxqQqoAEi+bzzqe5yItvW40EljBUuFzL7iT31AgBTB6w3Mt
 sXjJ6f38yTzYGgm+yBwEAvlkVpHJJRLOI4H9hA2ZtPWwOYOpWcYS2UTNsvg4Oy9YsIvJ
 BUXg==
X-Gm-Message-State: APjAAAXA087cLYvvgCNW+Te7F7NfqPlcoHfMjQOp6S8+SeWqdcVWrzox
 t2yFct8huNzRk8NA3rLzdhdoUg==
X-Google-Smtp-Source: APXvYqwg28NUQM1tdtYjUyUtv4zmoULOuJaBTJuEYzhP/D9nixTYJJhbLvG73H95w1fSDzInBbmWVw==
X-Received: by 2002:a17:902:2f:: with SMTP id
 44mr33245296pla.139.1552378309879; 
 Tue, 12 Mar 2019 01:11:49 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id o5sm3687795pgc.16.2019.03.12.01.11.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Mar 2019 01:11:49 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Tue, 12 Mar 2019 13:41:28 +0530
Message-Id: <1552378289-27245-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_011150_608710_F21A7CBE 
X-CRM114-Status: GOOD (  12.80  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..36447e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,33 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. All PWMs need to run at
+the same period. The period also has significant restrictions on the values
+it can achieve, which the driver rounds to the nearest achievable period.
+PWM RTL that corresponds to the IP block version numbers can be found
+here:
+
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
+
+Required properties:
+- compatible: Should be "sifive,<chip>-pwm" and "sifive,pwm<version>".
+  Supported compatible strings are: "sifive,fu540-c000-pwm" for the SiFive
+  PWM v0 as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
+  SiFive PWM v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details.
+- reg: physical base address and length of the controller's registers
+- clocks: Should contain a clock identifier for the PWM's parent clock.
+- #pwm-cells: Should be 3. See pwm.txt in this directory
+  for a description of the cell format.
+- interrupts: one interrupt per PWM channel
+
+Examples:
+
+pwm:  pwm@10020000 {
+	compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
+	reg = <0x0 0x10020000 0x0 0x1000>;
+	clocks = <&tlclk>;
+	interrupt-parent = <&plic>;
+	interrupts = <42 43 44 45>;
+	#pwm-cells = <3>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
