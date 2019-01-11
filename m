Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7302DC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 08:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DCD20656
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 08:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgcsKeEI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Wa2Rv+u2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DCD20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VPmbJjSZsMD5vT07BAvIgp1SsHifckkpWDRosK6gsqw=; b=qgcsKeEIq0L8RcQ/OicCZFMmkS
	/2gG4vFnwYLAd2Amst46EXXHcjXtxoYxkOkGPK0dgTRAvx2ceyW5iAPkXKN5bZV2wQiN3YcbhXCgn
	UOTQ9xkPIJX5hKE//gS+XIYR+h6kYhik9oM9V+E5xtnBb2uLoCSDXdGQmgNmhIpKAeVCFhqr9vudt
	x3BpOvFr41citcEWYk/9y8nisPiKRS4zPVd8ZBdXVQ+ZRua64j1jnrJZffy8d4zFAzsyu+v8oNPEQ
	oHP0aMCqihjpi+08MaKlOoyWqsoaWV1ASkL6mqV7ba3YvCypeCIpmgO4x4QoPAL/CrdahujuFgatA
	leHxbGtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghs5s-0003bG-8Y; Fri, 11 Jan 2019 08:23:08 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghs5p-0003Yz-39
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 08:23:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id y1so6449620plp.9
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jan 2019 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rfrxSQ6IO/YES72IRHCzaimUMiJ/XBASjBb5WLpKsYU=;
 b=Wa2Rv+u2eQdwyiYlbICKQpQ6NdaX1jaPNjz+94IyQ3tJ0hR3uHDkJCCsTtKzQ6GcSP
 Mv1GliSKAmXBM6XfDZM8Zxoxk+J5oAAf6139xX2U8xk2PDnccvIB8Lr6GygT2rhb8PqJ
 z8riLpZsXWNgaZHH4qalitXZ4BAZKie/qAQkazMDYdazrHXwNynT3lzYt13sl/CYYEwr
 KqdhDrHLKULzrb12U0tRsT0bZSh/LTx+tA96igtn+7N11RKj6471wwElpSTGeHILRJ2o
 mBmoCn5uNliSoiOeRsa79BDM8slG7xjswevCZDoX+XDtgkhncMDw82sXfxfAM1ae9IYZ
 fZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rfrxSQ6IO/YES72IRHCzaimUMiJ/XBASjBb5WLpKsYU=;
 b=JWCOyQGo2IglAKttqa6G5J1ZI1xKetu29SUJcB9w0iPt8sypjOFuhJKOop3ADjKG/3
 2Ws+jfJiyTSql9/pATPPbabUbZOncR6sIN6qwd/Q4+nHtSCj3wxMiUvzz8Bb+29pIikt
 1ga+IZl+DBovHzGM/NfkJTLkMcAoTloMXmtIGMObYkzppISTj9MGAwe0ZLFKKP0IZZ7Q
 gK2T5g7EzSvjFSXfSNCF9K8YYlqxY4pAQHaloA/BnYSntN2rl5tczNjiIZAYTP/vGrah
 FhliKREqP7YWrfGSxSWEWypzvrAMC4rRlfNKaKjTFV06moZOoROpIg2pxdMc5VGBzAjv
 yhpw==
X-Gm-Message-State: AJcUukf4KczEUWSR7LVT4zM2nMkRvtsPzvImcmGOV7bknXF1xm/3mkHO
 eOdrgmLm/QABoyNr6tKXaSH02w==
X-Google-Smtp-Source: ALg8bN72ihbGuSWy1bMDOflT2VfuMHUJbW1W9Q6keqQ5CAC8S1Uq9kyL/c6Kn2Vjow7joP31sw4nhw==
X-Received: by 2002:a17:902:76cb:: with SMTP id
 j11mr14023595plt.179.1547194984490; 
 Fri, 11 Jan 2019 00:23:04 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 t87sm248422324pfk.122.2019.01.11.00.23.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 11 Jan 2019 00:23:03 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Fri, 11 Jan 2019 13:52:43 +0530
Message-Id: <1547194964-16718-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_002305_146359_D9C89686 
X-CRM114-Status: GOOD (  13.30  )
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
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..e0fc22a
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
+- compatible: Please refer to sifive-blocks-ip-versioning.txt
+- reg: physical base address and length of the controller's registers
+- clocks: Should contain a clock identifier for the PWM's parent clock.
+- #pwm-cells: Should be 2.
+  The first cell is the PWM channel number
+  The second cell is the PWM polarity
+- sifive,approx-period-ns: the driver will get as close to this period as it can
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
+	sifive,approx-period-ns = <1000000>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
