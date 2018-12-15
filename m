Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5692FC43614
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3794620645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y5e0dgRm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="J62dUlTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3794620645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ixwsMtqg3r+BjFoyDY0gqbdvbJfnqphUlBX5HS6LYE=; b=Y5e0dgRmRTWwx8
	NEwHlEwgCL+l5LXBsAC3bfJsiFYvCp/j3tzO4LbPZ4/QQgkQQnPlFkHG/toscYSq6Hsqk7Sng/Iip
	BLiVKLSir7ILTyUcBtv+tflm/0xxIqdzHWrPAgsv+/EswEu+YephwXWt3efMisqrN4H/7w3rFfdZ9
	+j4eWZFjS6h7Du0qRJph7TQTWp8XEj7D7g3y2l3jEUzcNRijMlZI5vQjeQ1WFYX01GpX4skPjhaSV
	1e2Og0NZDp8yKwj6wpGqgkRtYAuxAtcpV7r5nbKTQvILnTSB2VtQeaYGq2XGo0I40MfVtURPg/0zP
	LP7RhS3DqNzD3khFtNUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2PT-0004eL-TK; Sat, 15 Dec 2018 05:22:43 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PQ-0004Xz-8c
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:41 +0000
Received: by mail-pf1-x444.google.com with SMTP id w73so3790758pfk.10
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rns3Vf+c9+ywyiS18gu90x3HnhyKwds1kllzbtX3Q60=;
 b=J62dUlTtyNLNHvnZF04YuUru8ICvHmE2SBsJz8NXX1KtrklTO5+cFaZHMwOdIrzVFY
 koLJRAqW2pUloCu2eg08Va4ACLiTRZJvrPufVf+RtYFmgFWlBisGxokUUMLZvW7Qvner
 YuoYzGxY8gOMEV7RUoIxlsyFQz8dhLdPTZV4TFcMbqQZUdlrYSVi03ys8INnwfXKuk6D
 oP9xgLCVUXepcvWHn936uwFkYT7PvgzOwtV9AOZUBosrnjvSJmtzZ3IFCYL2Buc7dR3K
 4cnnHhzoONPIfuv+Kms9dm/qQ7Mlkc03aDqZKOmfAnhAd91rdqzzunYUjIaDLhZdSE5X
 8oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rns3Vf+c9+ywyiS18gu90x3HnhyKwds1kllzbtX3Q60=;
 b=e0IuZfOLUp+Gb5JQ2WGTptzQDd3ibXppmhd4wOdZcWMB1ySa4xRNfea3K0D/iDUbKw
 LqZL2B+3qvA5BI4c4T5aZFYlyRiOY7fcXgq8GCSqXCCg4m55eBp1JHJZQB4JlhUTKtw1
 obWHi/w2F2DHuDxitu6U94iTITRKkRbD5dKEQUZYitwHpPOi64ibTQd2xZlqdLjT8Mrj
 328cS2DgJuvgxwmWodHZmyF4bO9q7hozA/OlkdJR+q7yCE8hrKCu2xQka2VJtjYXqAH9
 uQweTS95UrcId/GyyV3UhXLvOQkHhm7xqGqA7MkWJW4WNvekYZzBsHUvhw4OMPc4HxfH
 RQhA==
X-Gm-Message-State: AA+aEWatSDAkn18F410yAQXp4JmAHtqbNlGiaHAk3GijP3+DTvLx0hJv
 T5aiTur7Gq5fbUyy5x6ikKetkQ==
X-Google-Smtp-Source: AFSGD/UlDogYikK2Cu7CiIW3fzMSnX3vpdEhbHO5y3FfDwfYMWATZKkjw4s4RbAGp85j6uQfccSa+Q==
X-Received: by 2002:a62:d885:: with SMTP id e127mr5346845pfg.197.1544851349513; 
 Fri, 14 Dec 2018 21:22:29 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:29 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/7] dt-bindings: riscv: sifive: add documentation for the
 SiFive FU540
Date: Fri, 14 Dec 2018 21:21:49 -0800
Message-Id: <20181215052154.24347-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212240_307726_D7329135 
X-CRM114-Status: GOOD (  12.93  )
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

Add DT binding documentation for the SiFive FU540 SoC.  This
SoC is documented at:

https://static.dev.sifive.com/FU540-C000-v1.0.pdf

This file is originally based on
Documentation/devicetree/bindings/arm/ti/k3.txt.

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
 .../devicetree/bindings/riscv/sifive/fu540.txt     | 14 ++++++++++++++
 MAINTAINERS                                        |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive/fu540.txt

diff --git a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
new file mode 100644
index 000000000000..b5cf2b9f9a75
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
@@ -0,0 +1,14 @@
+SiFive FU540 SoC architecture device tree bindings
+--------------------------------------------------
+
+Platforms based on the SiFive FU540 RISC-V SoC should follow the
+scheme described below:
+
+SoCs
+----
+
+Each device tree root node must specify one of the following
+compatible-string values:
+
+- Freedom Unleashed 540 rev. C000, or "FU540"
+  compatible = "sifive,fu540-c000", "sifive,fu540"
diff --git a/MAINTAINERS b/MAINTAINERS
index 8119141a926f..dee555ceb175 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13626,6 +13626,15 @@ S:	Supported
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
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
