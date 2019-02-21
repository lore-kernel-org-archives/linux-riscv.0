Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6C8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 09:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D9820842
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 09:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fLCOrrdj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JOy9SsXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D9820842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YkNy2khXPPVAr6/HZW9IFwPAzUt7n6Oi+cw3ySL+Jm8=; b=fLCOrrdjBwuRH2noyVSt+/BP3i
	8qOBIWh7NRaposjfJtdE6cjENst/HWrg/koIVnXqYsEYCNpY1H3L6PVkbyr2ioJ04X1eqfycbcPmQ
	D63noNyLz4V30twVlGJNgef7sIDX0PIa7E4TimQzFxNSp48GOVLVC1LPdqOO8CHs7D6eAObT+Y5Cy
	3MElq1dbXHHJ8eMSSxZIMmBh9g02wOCZkX7ZdmUpB//riMBpERossZB/vy5ZG1xDIIW1ZbmCrRI2G
	w9QDe6Szs0eSw3dNLi9FzdA8wMXjcfXtK3TwhfIdfS12Tq4mi7hCmQlFr3dCQFzLGQMYhO/cUGfIo
	2FMzdImA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkP0-0008Og-0W; Thu, 21 Feb 2019 09:12:22 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkOx-0008OB-4F
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 09:12:20 +0000
Received: by mail-pg1-x542.google.com with SMTP id r124so13489379pgr.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Feb 2019 01:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xuxrk96NNHkj3knJVr7wd98x4RZ/O1p0LvlVCD1BNmI=;
 b=JOy9SsXVAGKamrloePCopLWiScADlecxUZxNmDtbxznXEOvWcoxnEI87fqbrA3l+nS
 4rA+9XQn9BuIqfMtFxYCT3B7ge35jvSlyWpGpoFzmesfcI5j5eecs5Q7+7e7DpIYDPIg
 KKCc36DEtaGQuo7x3Pm9LUi8UAt+opDoPJj36CHhm2hicr7fuM4vvwj7qloRb9bcHQIl
 ygMwIZkZuxshAC/nqd0jUcv4plGc0HfAvJvxEFLQRHdcDxVPJu5W2/qbJwG6lEpWsyQz
 MsDd9P3ioZ7YLmD01CEMT500/ro+D3CaJTdZQqV6QJ101R7rSzTrrd9gclr1xEaluyk6
 SGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xuxrk96NNHkj3knJVr7wd98x4RZ/O1p0LvlVCD1BNmI=;
 b=f0YaDYFRLhbrw8/pzTyRzqk7vwIB0nyZ7BpxKmUr6P44VnVhZ6+EOeW9V6TD+UrMj0
 WQNDT2+B3oDkTKK6bpYYLvkLFvEI87hXp0wt/FkNn1Q8YSyJ4Aa0LemaMWvHOcVVPVWd
 9O1H+qYih8W+o394d/ZjEkHtAFgX5h/9RFK+KRN5UfkIvB/EccbsxLGVn38Nmki9GZoi
 fjGLpOgSKOf/DFT7D9yBR0Qg3RDv8sbNnaTin8cWW9atZ8CQhBn6mNByWmbBAyRgLZ2t
 JBzZHjkzN+wA2UXRYfU9kBhFTJ0pxHNME1vFPhDHkK0VgJv1BdVQc0sJ8BKQxLzh+nxz
 85Tw==
X-Gm-Message-State: AHQUAuaYgrIbBmIAo2GcTZ1T4NPOi+rPhz4TKyfSen56imSyzNK/JDUK
 TnrU5/qwEwzVHHRjMPycWRQIPw==
X-Google-Smtp-Source: AHgI3IYcMuJcsmojQzRSe8wdFjw3NIWIvLMKJ9LNIlfzZsQqhtQg4WKX37Orj5RzJQAi6VqdPBUsgA==
X-Received: by 2002:a63:6ec2:: with SMTP id
 j185mr37224919pgc.341.1550740338709; 
 Thu, 21 Feb 2019 01:12:18 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 i71sm66145208pfi.170.2019.02.21.01.12.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 21 Feb 2019 01:12:17 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Thu, 21 Feb 2019 14:41:40 +0530
Message-Id: <1550740301-10097-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550740301-10097-1-git-send-email-yash.shah@sifive.com>
References: <1550740301-10097-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_011219_169675_A643DB21 
X-CRM114-Status: GOOD (  12.63  )
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
