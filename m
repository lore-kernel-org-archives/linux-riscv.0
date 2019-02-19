Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E50C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 11:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923D52086A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 11:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FMRRW0e6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jPXPgTjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923D52086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SKwDcbugtQe0tDBbfA5oUlOBcWQMKGV8tb88cd68UeE=; b=FMRRW0e6Buvsc3aBuONhFgRMM4
	4hW0/wlke6U2o//j5jODKmPSI/7kABazRk/Msz3y2TniyhmaX05/2rhqCrgRGL0CSkVTnP9QjQlEw
	ipXBRx2iwwvnARwOsS5jWmj2QV7hjFFfbGQ0yQilu1in1gFTbH12U1lfckF24cILb8yk7xCFJhk0T
	ZQP9iEY7yZpPRpSF5aWr9MnesaW2i8E0SUsw7npyJf9tLZ5GgNmGddSlUmyXoQ3xGhhVGVVCc1kcV
	CQ9ARxEvquw8J8xG83jj6fRW6sB3291wDaI25lfVlt0UemXCNsIHBUEltt324DgERHaf3loYM7j9m
	WSObKLiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw3ld-000757-8p; Tue, 19 Feb 2019 11:40:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw3lb-00074H-0O
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 11:40:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id d15so3180403plr.1
 for <linux-riscv@lists.infradead.org>; Tue, 19 Feb 2019 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HIz4WqHdWYeQ3lkgJK9b2XM4IGZAxsw+zj/jLhdUw3c=;
 b=jPXPgTjADVt2+smuFo/EEaOowKhqwX/01aQQpu94dpBEHTRqdZHCopqJ48PyFWUn17
 7KY8rIbKUV0L7zhDsDIbs7H3i7rOrmEXdlHQBwYSZ5KJXr3ivJiSOuLxL9VtQploH7vh
 7Ens8nI7UIuMaOKegIVWFfkYf62F/5wwxmXF3z7TXW+7WXASELjtG+uSqVbhl8RRYdJe
 ZowRGNrjstb/mKNMQ7t+il98T+91tjjz/gi3hpA9M11smQuV0WF7E3T9I34qPlxpPCqK
 mM7OO602/MJCNBkpR1OxbraamnM5CfA4PnM8PXu+68VbiIlNQxOeZ3qoGSFz41kUvv8i
 nqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HIz4WqHdWYeQ3lkgJK9b2XM4IGZAxsw+zj/jLhdUw3c=;
 b=ewCXtbIJM5X3nXoD6DX1wT1F7l+jlPH9shX9JIqWp73IyKNfCSj2KhR4FiWclng059
 E1xyFbwxmAS6TEwa7nKVRNFt/s5jzFkvxXnMFqW2IGlX06XhVsb6eGbK/CLB2xaZroh8
 CtMFj5xC9zS2FHJG1pNCAu0QCeOCFcJVRl1PqicFwc3W3CYIycv5nrMLTE6DIISG3Lij
 KNknZHO7GMJqnF8vN0RAaY0RqDLYFIhWw+OemAkDh8hTrwi/lhgrXVNG2+dfr4kl//Ot
 pkoPc9eXPa+zfb95fhuUmuA7Q1Z1txLNC9zJmPeVewpBCDvaD4o9AM0JWKoPCb71HNeF
 nvoA==
X-Gm-Message-State: AHQUAuam1+VqMCsb4VhWFhAmGuRJPwq6KoHTKa7SEGRMry2hg0IQzCCo
 aq3V6N4NbObHUa0vkXq5GBbkag==
X-Google-Smtp-Source: AHgI3Ia4opb4C4j1RKzH/PI1euLWE6o1bbHCPXTT8YroDhOvbZoZL+hUVjvkrJu+a5QTkLZ7sMeHrw==
X-Received: by 2002:a17:902:a514:: with SMTP id
 s20mr20268782plq.242.1550576450476; 
 Tue, 19 Feb 2019 03:40:50 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t3sm32250678pfa.50.2019.02.19.03.40.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 19 Feb 2019 03:40:49 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, broonie@kernel.org
Subject: [PATCH 1/2] spi: sifive: Add DT documentation for SiFive SPI
 controller
Date: Tue, 19 Feb 2019 17:10:06 +0530
Message-Id: <1550576407-17778-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550576407-17778-1-git-send-email-yash.shah@sifive.com>
References: <1550576407-17778-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_034051_049742_917B5884 
X-CRM114-Status: GOOD (  11.30  )
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
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT documentation for SPI controller added.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/spi/spi-sifive.txt         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sifive.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-sifive.txt b/Documentation/devicetree/bindings/spi/spi-sifive.txt
new file mode 100644
index 0000000..3f5c6e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-sifive.txt
@@ -0,0 +1,37 @@
+SiFive SPI controller Device Tree Bindings
+------------------------------------------
+
+Required properties:
+- compatible		: Should be "sifive,<chip>-spi" and "sifive,spi<version>".
+			  Supported compatible strings are:
+			  "sifive,fu540-c000-spi" for the SiFive SPI v0 as integrated
+			  onto the SiFive FU540 chip, and "sifive,spi0" for the SiFive
+			  SPI v0 IP block with no chip integration tweaks.
+			  Please refer to sifive-blocks-ip-versioning.txt for details
+- reg			: Physical base address and size of SPI registers map
+			  A second (optional) range can indicate memory mapped flash
+- interrupts		: Must contain one entry
+- interrupt-parent	: Must be core interrupt controller
+- clocks		: Must reference the frequency given to the controller
+- #address-cells	: Must be '1', indicating which CS to use
+- #size-cells		: Must be '0'
+
+Optional properties:
+- sifive,fifo-depth		: Depth of hardware queues; defaults to 8
+- sifive,max-bits-per-word	: Maximum bits per word; defaults to 8
+
+SPI RTL that corresponds to the IP block version numbers can be found here:
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/spi
+
+Example:
+	spi: spi@10040000 {
+		compatible = "sifive,fu540-c000-spi", "sifive,spi0";
+		reg = <0x0 0x10040000 0x0 0x1000 0x0 0x20000000 0x0 0x10000000>;
+		interrupt-parent = <&plic>;
+		interrupts = <51>;
+		clocks = <&tlclk>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		sifive,fifo-depth = <8>;
+		sifive,max-bits-per-word = <8>;
+	};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
