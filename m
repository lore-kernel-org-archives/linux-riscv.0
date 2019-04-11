Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC07C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8A52083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqLxE4S+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A73YNgB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8A52083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhoxGlzCADw+IVg/8ikxxFZDVOCZpQYh+hlnMahY2jc=; b=eqLxE4S+8QjROH
	2QecRlEyMLIZ7JwTXPChv5FRncEDg5i/dQLuTz9PVM1ez6HkwgEL4JcHGBzIu+dJxMM1mCaNPoXoE
	HSX95KJmZ2oD8YG5NcMp5ECy4n53yNhQN2/uvuHnlY7ubVl2Il13ANgCH+FxsZ3d8gX210xquhtXR
	C/LwkDsgOVXcq6nD1satN2cKHI15+Ylw+E9NkiB/Xdp9CieoNBcvaMaTdZd3cKwqTusEvE1D92326
	v5WX3V5OvWdzio7iNJyI5kJ6dq5+YAU2XXijFCXHtS1OOPIOcf1lFrMLkbjMZqUvTAT47Pas9qqH/
	+8Ws1EkF+WA1yvwuDT2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEV4A-0003Ks-Le; Thu, 11 Apr 2019 08:28:14 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEV47-0003KP-PT
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:28:13 +0000
Received: by mail-pg1-x543.google.com with SMTP id z9so3152750pgu.10
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fs9k/ofObdjUeCTYkQB8LCaYi1pDWe1mex0AK1YWiFM=;
 b=A73YNgB9Tlzp9/1ThMjQJzZ0XzoiY6z0aCZiR9tfQL7lugFQtA5YSHA12G0l9wcrhN
 g1I06uRFoajRwB8nN2WVL7pacMNFhyJLNnAjvUCS/yMky9IPQcSw6KzlzVOisnSy5wJg
 SRztDTZh1UXWXh6RfYhhZpWe0bx18XLeTwRm1fsZgUkja3ESOHwaF+eOtdYZT9W4Jif1
 e5JivajHWeGWsBrxbHAHZqRVPt3i9WxGNAvJ+DSIdUoI+U+4yfXmo8pM/0ZCfIhnoy/o
 bInuPxH3WxGVPmWYSowlA48Qx4zxLHhBhNXJCrhLIvA4nUbPisLN2FuqZdrEm+S6lD35
 kNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fs9k/ofObdjUeCTYkQB8LCaYi1pDWe1mex0AK1YWiFM=;
 b=fMQyWboq4NqXKUMw/8xWCYufz6HT4UwFGiBRYEuloVe4l6AK9X2oVKSSzxup4+XKkR
 3jzzmusFIM1bGZCK3DOqejifSFkfwkGyTF2fvOgobr+26qqiopbaUqnVfBHCe2LnT9zN
 UG10XKpopfSE6g6/4C9xifU4BubyWNaGTeNneyqTvXwaMvJXK3zoMOHEoHwK+nAWA+Wa
 jZc6N2Vbj5RU4AYA7qV2v0BZQpu7Awq/isaZb9MJp6RYZlqyHC0CfwlJ25qlZVwZVy4d
 HtGX273qjndpaNd/QCFIy2eERO7PylkxLR/fayzXX6Y3//I2fUr2jFAHfGcz16I55DLX
 8xAg==
X-Gm-Message-State: APjAAAUpBTNcllW1iHuJ5TZgsWhJUsS/ONYOFGXD1n4eQo7RJlcO/Hr6
 yMqjFVu0xVjY5c8wKXNQZ9KkSQ==
X-Google-Smtp-Source: APXvYqzUVRFPufaj+05dU9sy/fCHaliilqvViAD6XI3gLfNv0DolX8Rzu1wfYKffz2EBgaRfSABbhQ==
X-Received: by 2002:aa7:8609:: with SMTP id p9mr48274019pfn.166.1554971291183; 
 Thu, 11 Apr 2019 01:28:11 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x28sm41043430pgl.38.2019.04.11.01.28.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:28:10 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Thu, 11 Apr 2019 01:27:34 -0700
Message-Id: <20190411082733.3736-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411082733.3736-2-paul.walmsley@sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_012811_826564_899ABDD0 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>,
 Stephen Boyd <sboyd@kernel.org>, Megan Wachs <megan@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT binding documentation for the Linux driver for the SiFive
PRCI clock & reset control IP block, as found on the SiFive
FU540 chip.

This version includes changes requested by Stephen Boyd
<sboyd@kernel.org> and Rob Herring <robh@kernel.org>, and
fixes some errors in the initial version.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/clock/sifive/fu540-prci.txt      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
new file mode 100644
index 000000000000..349808f4fb8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
@@ -0,0 +1,46 @@
+SiFive FU540 PRCI bindings
+
+On the FU540 family of SoCs, most system-wide clock and reset integration
+is via the PRCI IP block.
+
+Required properties:
+- compatible: Should be "sifive,<chip>-prci".  Only one value is
+	supported: "sifive,fu540-c000-prci"
+- reg: Should describe the PRCI's register target physical address region
+- clocks: Should point to the hfclk device tree node and the rtcclk
+          device tree node.  The RTC clock here is not a time-of-day clock,
+	  but is instead a high-stability clock source for system timers
+	  and cycle counters.
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock via the clock ID
+macros defined in include/dt-bindings/clock/sifive-fu540-prci.h.
+These macros begin with PRCI_CLK_.
+
+The hfclk and rtcclk nodes are required, and represent physical
+crystals or resonators located on the PCB.  These nodes should be present
+underneath /, rather than /soc.
+
+Examples:
+
+/* under /, in PCB-specific DT data */
+hfclk: hfclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <33333333>;
+	clock-output-names = "hfclk";
+};
+rtcclk: rtcclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <1000000>;
+	clock-output-names = "rtcclk";
+};
+
+/* under /soc, in SoC-specific DT data */
+prci: clock-controller@10000000 {
+	compatible = "sifive,fu540-c000-prci";
+	reg = <0x0 0x10000000 0x0 0x1000>;
+	clocks = <&hfclk>, <&rtcclk>;
+	#clock-cells = <1>;
+};
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
