Return-Path: <SRS0=TVEx=RE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9EEC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD492186A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSELQACU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DyQG+7z8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD492186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wQglA4wX0PQDEyCpAx8no3CWNh7RHCyz+iP0q9u+dhs=; b=RSELQACUiNRlGiwEbC+rAlItQt
	R2460o68elF3XWRxLiZSOV4H2HJ8WhGQ3DGvRlM0C0ZMXbN0vn6Wp7ZjpB2m2HXYTCjerpkIxjzCZ
	lrOkhIFtJIFNzglDRWvLqNOcSIKABhlwPCgkg2szSpHxQVVwgt6Qq2t3BJxBKKrEjMOa033AgHGt/
	3F+X9xtjbPeng3D3Kv8OFxajfPjIA0vuYBBfcSTcdIRJr0bJbRCo9l+zdHAF+DNRZWgC0DwQdjtZp
	Sj4Y0qXUIbpuSIXJgy3kOqzEDsNIBl62vYrUanjJxGfZ4O0axGq80HSpOZ/GsiK8NC0CQji+rfdaI
	99nq3OaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfnZ-0004Bd-Qi; Fri, 01 Mar 2019 10:53:49 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfnX-0004AY-5s
 for linux-riscv@lists.infradead.org; Fri, 01 Mar 2019 10:53:48 +0000
Received: by mail-pg1-x542.google.com with SMTP id u9so11274545pgo.7
 for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2019 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=DyQG+7z8Z0oltD7YrfBCC9G15K0lTzWOrPjEd6ijYuONRTRwjqt0OPBJ1yLBzZvh6q
 xwnBH4RFFwx+Rk+tXfvvLyocHEDASpYI+Zz5h5DViVn2oqFvK/4aRZTG1fkDcx7PlbTu
 t26YkzYcHDgvX0wO0pY6ctp9HfEbqMYzyx695fJG+E2XY2zKL4WXmp6INU0wpUZ1tEBB
 erxyw68g3BHp66frm5YZofeuYlCXLVfLHx5a+fV16uhiRJN5Cvp+/poiiegcJ+6WPbT3
 u6dYbh1vSubotnzC5eh5OfIjza1PHGJ9emoDNA52psskcnNAMSI/DCmy9G97E9Dd78Pf
 0yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=Tg7WZUITn7Q3Aa4MR++opNBpnLKgCik0aDjFUIc7lg2ipVadJrezh9HtljszQ44qoz
 s7A+ZjFg9EWvCyh03t8KKHUAl/wPlDLyuIj+hvgqnSquvFNF0KuRIhy8gkBoPHxh8Nlz
 uKQ2Mm56gpbVm0QgarGFXE2O+2HA/GHNwsgdhXhjcgnNnKst4E4250AM4DtB4aKYpytr
 woIAmiQ6AXfhZSLnk7VFBZvIIdXqL90+Ef4bwODKip8L56ZYpeK32/UurdjsvtwRyKP/
 2jww58oQdHOTDrPdkBd60eGcAmi2CImulgJfIiZT2zyEN5ruMtLmXnm6b1bLwsi+ihWR
 bWsw==
X-Gm-Message-State: APjAAAUVX5pwJAH9Du4/qm6xvDwTmGXF68SIB9WmnQ/dz85q4mE4UJj4
 3+iYMt2HF6G2V1rpv51uMwbuKA==
X-Google-Smtp-Source: APXvYqyfHMBdI76HvSYhF7xIVLPnbcQzoRf0dxaaVvteSYlzsFKqXECsvMuqvb/jEXyR0nEHJ2Bfcw==
X-Received: by 2002:a63:f556:: with SMTP id e22mr4195570pgk.321.1551437626621; 
 Fri, 01 Mar 2019 02:53:46 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 k74sm49239164pfb.172.2019.03.01.02.53.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Mar 2019 02:53:45 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v8 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Fri,  1 Mar 2019 16:23:18 +0530
Message-Id: <1551437599-29509-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_025347_216201_D2A1E610 
X-CRM114-Status: GOOD (  12.71  )
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
