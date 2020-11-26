Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1688C56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB7AD21734
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fr0Aeuaq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EFPNSrhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB7AD21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZJVsJLRXQqc3eATmRpuQVppXVW/PhjFmxdkmJ2aDHW8=; b=fr0AeuaqeR+q0PV10mDt04CwIy
	bR0bKzQMidPvqnWJBq+Nw8xPS3A4ZSu/B1xiriitCKnNGDVzcj98yFNLqarj3le68ZfEdpzgiXnf8
	hfyJbBGSA9o8UtcvPXClK8FYTTlHV6F+IK26JkRsCmEGjhNcAZZKByURIPW4nc5Fn2Y0lcsJzg+sH
	brX5XRr6moJ2Ymh8d+4vAzHtsi0iQqhcfrUCUWbXm6axrXEiDEkb+PbZkW1a3sUQIVJBXaS6r+E66
	6oQEbtnXtUIb77zsSgZJXdChJ+F/pf6jhigAy5cE5+ghEjGv0IZrw17gw+scHzzSr3EbRUlU7aV38
	X43vq78A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki7Wh-0007JU-R4; Thu, 26 Nov 2020 03:00:55 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki7We-0007IY-F1
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 03:00:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t21so491799pgl.3
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 19:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGy6irohT0f1tWD/mm+Ymd5mnTZ2qIfD7SCUyRih0uQ=;
 b=EFPNSrhZhrvcg/8kPsEw0/6/KGCVTW/U4tL3dia9WRhqh8fktxXhEh0onyuuA4xEss
 JKt//yl3RnphApbznkwNRTAEi7+cmvsRtc7L7n4sy5hga6/qEfxRtF+8MH5B+8MObP2c
 Pxdvyz61EwO4TdO6DsnhPYd/1G4cLBBdS+qDL1PfkCH2yzam8qs24jVY69mLrXYFtUYy
 +kJ1IhYj8S3N8Qu/Z3mxjEWx+BdCWzERk+NwFL+Iwo9zYdYwtUfmZYGYr91ROsP9GLX9
 Y/lD95PTfUtMCVFbsYKsYyN9daXOuKSprQwoUbt/JlpSECcZKE7nl14scKVwfbcZB0uk
 A+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGy6irohT0f1tWD/mm+Ymd5mnTZ2qIfD7SCUyRih0uQ=;
 b=XOi4dwsNsMAhATZsm1iSYYGQ46+8Q3+ApGt5+eX1HR0UxEVULtee8E6NTXtEZ34DCi
 7arb77x+i5hMF8BJjxf31CAk6fPbR4xcFWlAf9Dp3dNMjaa/Uezc7kgUo/GcjM4Z3353
 AGENVZWQDjCdSqibkt+vbMkf6icQabg5UpEd06klRy68Dvb0eC9xKX5qs7MKL+S9SPaS
 25dWy/k+MgRb2b6/mAliaMI/gPF8oWfslHNWKZIZQavabECj14DybPwYircLsAb91c5j
 GuElvxcNk0rVte9KbbuDfHGWNvID15aMEcM9cNKisAHcqK/87Vm8Kw8kzyS4zbfpJ6YU
 4I3g==
X-Gm-Message-State: AOAM532OfX0c7eMn9UEbuBGg42q7s/XoZWZL24ydKCn0oZaMcbDpQ7Kp
 k46HsUhr3Q7ReHy//iuN0J4W3Q==
X-Google-Smtp-Source: ABdhPJwg7TmxhRtsDO0z7BK3t08FW6TEtxmleXh8/VWrBOjgOOJgyhWVu/0QilTxqH1ENYkKsDoWzQ==
X-Received: by 2002:a17:90a:4889:: with SMTP id
 b9mr1038424pjh.79.1606359648430; 
 Wed, 25 Nov 2020 19:00:48 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d2sm4322057pji.7.2020.11.25.19.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 19:00:47 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: fu740: prci: add YAML documentation for the
 FU740 PRCI
Date: Thu, 26 Nov 2020 11:00:43 +0800
Message-Id: <20201126030043.67390-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_220052_697736_ED5D8AF7 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add YAML DT binding documentation for the SiFive FU740 PRCI. The
link of unmatched board as follow, the U740-C000 manual would be present
in the same page later.

    https://www.sifive.com/boards/hifive-unmatched

Passes dt_binding_check.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../bindings/clock/sifive/fu740-prci.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
new file mode 100644
index 000000000000..e17143cac316
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sifive/fu740-prci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive FU740 Power Reset Clock Interrupt Controller (PRCI)
+
+maintainers:
+  - Zong Li <zong.li@sifive.com>
+  - Paul Walmsley  <paul.walmsley@sifive.com>
+
+description:
+  On the FU740 family of SoCs, most system-wide clock and reset integration
+  is via the PRCI IP block.
+  The clock consumer should specify the desired clock via the clock ID
+  macros defined in include/dt-bindings/clock/sifive-fu740-prci.h.
+  These macros begin with PRCI_CLK_.
+
+  The hfclk and rtcclk nodes are required, and represent physical
+  crystals or resonators located on the PCB.  These nodes should be present
+  underneath /, rather than /soc.
+
+properties:
+  compatible:
+    const: sifive,fu740-c000-prci
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: high frequency clock.
+      - description: RTL clock.
+
+  clock-names:
+    items:
+      - const: hfclk
+      - const: rtcclk
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    prci: clock-controller@10000000 {
+      compatible = "sifive,fu740-c000-prci";
+      reg = <0x10000000 0x1000>;
+      clocks = <&hfclk>, <&rtcclk>;
+      #clock-cells = <1>;
+    };
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
