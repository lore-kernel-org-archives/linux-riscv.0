Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4D6C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1532082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p81p6V9Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Kgr6CJjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1532082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTcUqISZI5XQIavlnQ+aWjF2cGanCDgWoKp3Yj+XvSA=; b=p81p6V9ZaYfRBu
	F5m0zXFIqyAIwuFm+7J6H4aMcRQUon+xWBoszhUjfKYTvS+QblMTxUB75vzCeEWoyXGa658FXnpbF
	OtBN84vM8V9kYuxw5RMpDxcaUC6A9/Bb3m0v2SNuIvWm1k17LD6QM6AtcA2mQ7QtFE0999V+FZnqF
	oCb3h1u8t3Ii8e3KIhVHy6V6TkmNVpATAqjEmq8iyi1jgaF2+yltC5DAfpN2O0DGc3i1kVl+7JpJl
	xu9n30rhl6zJfeJhi2d0jOua7lGzw/1Eh+9SMh9jS3vyrZueHPPqpeJ+n+KbPPLWFG1hN9J1ZlNBX
	Rm8kbsi9rKbIVtKjZIqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVJ0-0000pj-KY; Thu, 11 Apr 2019 08:43:34 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVIx-0000pC-QW
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:33 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q1so3168239pgv.13
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqHO8lKeM93haURO5R5tVecQJ8UbH1Kcw/Zab79L6Eo=;
 b=Kgr6CJjAYBSxyonIFQu5rNUAZvcTHIQwudpmELNC7yENvka64jmGeyFcnpd737baLm
 1h63lHGgT6Qx+ZMeMlVjJeiSGi7AnZD2EVy/ZRKbSovA6GYP6KvnWhPC6ln0Rnq7JBTj
 fjZU6Uhjh19wQRYMSmbnQMzg9frYd5FOEtM2aT0msi8ze1zybqeRP2LAZ30zm0c7Y1pK
 qxOH4DYO48oPUA5lrKNQ3arCiOqboIdV/RN7XQjNLTvivuB4fVaEi7qa98n1p7qrtUbg
 +aysP33pjlGcHfUbDwCZMF02zfYHvJJn5yI4mZwNRz9DQ1WLSkttVaf53x0rTEjHuD71
 ZhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqHO8lKeM93haURO5R5tVecQJ8UbH1Kcw/Zab79L6Eo=;
 b=a0lPlBpLfu2NrKdu1JR3csGPzkKUA001JhTAaTSfdA+bboB1xhYXl0qQUJXWAQWJRY
 M5GsY/lvLn8E1MRoNSNx/GA8F4Vw5xXj2tXUVCVwai2wlcMEyZ73nUna9xU2UNxjmiqc
 XaDYczw39kuCNtbUW0b8vqkX8CYME4+dtzekd/pArAG+LT0E4HbyfmoXGdnxsJGT1Tl/
 7am79GyAhkZFa5s5qRMbBCNpESrd14Qyj/ORLmZ8QP1omzC7ruQhfKmUkTiIX3hjLtzp
 1uGpvGBhS0Sy/L2LhuBQhG0duVl/Cb++It1/lPus+4a6AcfVlIxYbNm/AqhN5myCFdBQ
 CsEA==
X-Gm-Message-State: APjAAAVQTdI9cA6SFrV1IP9wIrUy6SfNgOfdhrGkvpnaSbG+wDFYCQ5Q
 rmJCX10caxrwM9aTD+ZW7e4KMg==
X-Google-Smtp-Source: APXvYqyILngJUeKvAkhBQwQyGvruEDKBmzAJ80hxuYFdNukeTQmUPgMamthwTe2deeanGqvmF1O+Kw==
X-Received: by 2002:a62:e10e:: with SMTP id q14mr47618676pfh.161.1554972210998; 
 Thu, 11 Apr 2019 01:43:30 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm61699456pfn.182.2019.04.11.01.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:43:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: riscv: sifive: add YAML documentation for
 the SiFive FU540
Date: Thu, 11 Apr 2019 01:43:00 -0700
Message-Id: <20190411084304.5072-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014331_861400_2314EC5E 
X-CRM114-Status: GOOD (  12.81  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add YAML DT binding documentation for the SiFive FU540 SoC.  This
SoC is documented at:

    https://static.dev.sifive.com/FU540-C000-v1.0.pdf

Passes dt-doc-validate, as of yaml-bindings commit 4c79d42e9216.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/riscv/sifive.yaml     | 26 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
new file mode 100644
index 000000000000..d2808d8d79bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive/sifive.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive SoC-based boards
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@sifive.com>
+
+description:
+  SiFive SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - sifive,freedom-unleashed-a00-fu540
+          - sifive,freedom-unleashed-a00
+      - const: sifive,fu540-c000
+      - const: sifive,fu540
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ec37f17f90e..c02bf352a8c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14138,6 +14138,15 @@ S:	Supported
 K:	sifive
 N:	sifive
 
+SIFIVE FU540 SYSTEM-ON-CHIP
+M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Palmer Dabbelt <palmer@sifive.com>
+L:	linux-riscv@lists.infradead.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pjw/sifive.git
+S:	Supported
+K:	fu540
+N:	fu540
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
