Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4352C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9666720656
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="il0k6hCB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DcTyiDjq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9666720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65RC4ewlD00U5f1Dslm5Xyi9jev5exi5uu8PRfiioQc=; b=il0k6hCBr/q/2L
	kMUmH+sRRSeZoJgbmkkuR/303dYGzgGKJyF9zCU74zPea304S1wiBImKjLsQTWlZO/MjLPzmJ4S+C
	9TpGzzFyY+yfEOphm7B/vof6mN933z3Dfsnk6IG8nuxVzDKhNiEkqDAV15l5rcKWEpXOuhQ9f/sZK
	UJFnTGOC0duGEan/Y5bKh8aMZCffidO9GHFpnD6VUr6+UTAjbSF6ZsH15qG6yWhC/0G9oXEajhpKl
	JY18w3CAb04y8kQiTExjd7mk7EfOTgvKAzf0jqBlZhk5GyQeEmJz8UdfjMt/FETl5bdaMuCg96S2C
	xhBz1jwSbLw+u1/ubxuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2Pc-0004mf-71; Sat, 15 Dec 2018 05:22:52 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PW-0004ZL-Om
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:48 +0000
Received: by mail-pf1-x443.google.com with SMTP id c73so3789574pfe.13
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/liDBIpQXNSCjmDraeSlsWQ6WORYpTFOBdDULIY1SWU=;
 b=DcTyiDjqBzYIaA513uHWLRLPoYRoX5rk9vElhcz0rY+QpmqVnrH4Ih+cVjTwFP9cpB
 P7SjeKKmjWSeZObpJLVNDZTi2mz8KDve72UK/T7rLNNml4QLpXwgcFLo8IxuMIA6CYRg
 I3U2S4tCWFDLFpD1Nq9KwDtFE49uOmmmfb+DVuxsETyiV9/AAg2/TsPOiTF9hFQPPOT0
 3eHXk2Uko/CUs7kMHEHSwADlrWpvOVYCaw/RHBhl/0ijL62pCCqxrO0qyP+zF0kkYB/S
 GNzM9ckJ2wug9vqH+e98YAAgJQsW9Tv0P0c04H+YlpXZsquoUirBZYED1RRrGXfjBYGF
 WGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/liDBIpQXNSCjmDraeSlsWQ6WORYpTFOBdDULIY1SWU=;
 b=q2lc4OcLCgzgkuevCAMku2KDzAWsNNmOaxKRYhyRFic2tk2aqB8JNRIAtFjV0DfOXH
 PPvFww5ny7YEat04oOt9qLMf5HterDSqNPlH5dbUuv0AYsQXW3lhoss39h8LTxKT6FlQ
 vV4MxXEb6hclH1pjd/OTYqw4WwYd29Te4sQ41Lm88BexvU36vSlyBhUyhX+qRbNvkGaz
 VuXNUOT5ERS8ecHOkdrXSsjEoG+AvaEgfHLof6lRcBs/3T2boogY9KBZ056DuVX/r/Iy
 +uXSUOwgui/YLEzOHTrnexr237StN1Bnx0jlkn9Hz9qVGJlaglNeZFoPrsKF3hIj5DYj
 q4gg==
X-Gm-Message-State: AA+aEWbBP+ULl4s+2uQ7BU6cyPoamtRZHr82M3Jrc9WYogr0qq7szVho
 TImnZ9Lyf8+7xfLztQdhwrtuqg==
X-Google-Smtp-Source: AFSGD/UpV6Y5WhGohaLi/Mw4QzdLhEDnYwu8aaLd3eP/aEzvL3y2Sx7CYNM3JAxBafNxujZcs0Ltvg==
X-Received: by 2002:a63:801:: with SMTP id 1mr5044606pgi.275.1544851356054;
 Fri, 14 Dec 2018 21:22:36 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:35 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 7/7] riscv: dts: add initial board data for the SiFive HiFive
 Unleashed
Date: Fri, 14 Dec 2018 21:21:54 -0800
Message-Id: <20181215052154.24347-8-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212246_803475_80211FFC 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial board data for the SiFive HiFive Unleashed A00.

Currently the data populated in this DT file describes the board
DRAM configuration and the external clock sources that supply the
PRCI.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 arch/riscv/boot/dts/Makefile                  |  2 +
 arch/riscv/boot/dts/sifive/Makefile           |  4 ++
 .../dts/sifive/hifive-unleashed-a00-fu540.dts | 39 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 arch/riscv/boot/dts/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
new file mode 100644
index 000000000000..dcc3ada78455
--- /dev/null
+++ b/arch/riscv/boot/dts/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-y += sifive
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
new file mode 100644
index 000000000000..e120ccf5649c
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00-fu540.dtb
+
+
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
new file mode 100644
index 000000000000..0c6afabe69e3
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: Apache-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2018 SiFive, Inc */
+/* See the file LICENSE for further information */
+
+/dts-v1/;
+
+#include "fu540-c000.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SiFive HiFive Unleashed A00 (FU540-C000)"
+	compatible = "sifive,hifive-unleashed-a00-fu540",
+		"sifive,hifive-unleashed-fu540";
+
+	chosen {
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1f 0x80000000>;
+	};
+
+	soc {
+		hfclk: hfclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <33333333>;
+			clock-output-names = "hfclk";
+		};
+		rtcclk: rtcclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "rtcclk";
+		};
+	};
+};
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
