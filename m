Return-Path: <SRS0=/XvO=RV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAA6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 11:47:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14E520854
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 11:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bEXXMVzu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A+Lp22au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14E520854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wQglA4wX0PQDEyCpAx8no3CWNh7RHCyz+iP0q9u+dhs=; b=bEXXMVzuyiO5dxBb4j+2lxLzTF
	mFgQAzak5xMrtqPVA4lPpx2k5ogLupM7FfDzs8RRiPxR5twfEWxh7SIBPrKBMJwtp+IJQd4fuLXQH
	tQBxi3b+cpNJky84ZNHWNLW9bkxADzADegX5ptZISw6BmOp1M4VWaU/KpjCk1ePNSkyjSKRjPnoUG
	PdXGvKqhen8N1LjpD5v6B024ROaYOwr8P4ZO1kGNEtoRYr6ndJ8vtJHzz8xLqcRc6wW910SRqay4U
	FyyUHuogtfNjmv6kPzYjZ8Zqno2UVZAMZdlLGynwpXoD/3SWaLQVUlU6w8eyaj/ILBrrned8AA+eh
	D5FTif8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5qk8-0004Kz-Df; Mon, 18 Mar 2019 11:47:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5qk5-0004Jc-AZ
 for linux-riscv@lists.infradead.org; Mon, 18 Mar 2019 11:47:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id r124so11210364pgr.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 04:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=A+Lp22au2IpiEUVbLQYCzRe6O7nA6kXOrqv8Cdn/PvL07941Cd3VH9jUMGSq1HXljq
 HV2IzoZcAV50LLpaXdzsTq2f7i5vDawmDhKwpKFem8xsYtR4v9HQMoze8rN+iN9kygY/
 pyypyp0Ptir2ZNJJ6PLM0J6sbewyKi/4HaqKihYK19Kl0c/Pm6u2gn0Gk/cVpVYPNyjF
 j7rTuLwMf0AkqzyLA4r4amdE7Ywm8F9spqavN76WwGYqQpwSf3VL01g+V4QPjGQ7RKBi
 HX9JCBLxu5KSW36RlvrEu+a/RmnR+3SPK9sbX3H0m2SaN/PY77MetIXqKQRxTAFeJqr3
 CgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+NvS/bA472zdii99ejJQCZ5ekFJyNtU3GhsdHX2kjcM=;
 b=eYF5ExVXyvRRH880foDVs0WT0Vk04Bw8e0AkOcSVCZJgOM6BF4u09HkIhTzYEDNW01
 HllryuEw3l7zTZGKOv7Ea3aM0+NDDalU/k0sQE5dRhMOQGNGfbYEKEItZ/aYllXrFO+T
 y01dlX/NbCuNlzSvANIbRHG8v+Nc2CXqIVB/fACn0QbhDbSwT0a5ux+LasCd74p9P2La
 YetuKxIZOBxAECL4auoIixzvqmh8Cb/9N8a9uXDbQSQQGwKFmLjnEw27ikgv/ITd9y0h
 7s1nB7N/7rVdmgLFZebuHcnQIVk/gLbNVIT6hNzS/V7f49fI28LgQKSq0YXIZicssPzY
 pqTg==
X-Gm-Message-State: APjAAAVzmtOekxFaec6l7wqcBdzZhNpiduDLFQwdMQRDMLWD8l9yv6Ct
 6DpkyQd6O+9JzBZIJWYqsJweUQ==
X-Google-Smtp-Source: APXvYqwRagNey96hwUm9IdsdRvPDwJX50uH6Y5an/dovc8WW5a2tuWGdIkYfFedo31e1zy46KFPpIw==
X-Received: by 2002:a17:902:112c:: with SMTP id
 d41mr19414188pla.177.1552909664951; 
 Mon, 18 Mar 2019 04:47:44 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id p5sm14403911pfn.154.2019.03.18.04.47.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 04:47:44 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v10 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Mon, 18 Mar 2019 17:17:13 +0530
Message-Id: <1552909634-18757-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552909634-18757-1-git-send-email-yash.shah@sifive.com>
References: <1552909634-18757-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_044745_366034_F79527C9 
X-CRM114-Status: GOOD (  12.43  )
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
