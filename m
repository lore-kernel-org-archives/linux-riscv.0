Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1CEC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 02:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEE5218C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 02:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HmQ0hGYo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CPfLLhzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEEE5218C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6CV0Ke/z1/GO2UAcsesHM6T/vGhAaeBLBIMO/uoW50=; b=HmQ0hGYo2pzv+b
	C+JDgpLqLDjdGZWeaJqZeRgfC1qPQAn3JmjB+IGOw1f1RICObsXoxT7KZS6+uIiJtfSJX63jBezHp
	cEtQ1ToKsEwujlHxS6mZ/AHBR7JQSjr6IGSjBA/Sop3igVdYvP64zYZVPteVo5tmmTAowPSITaFI1
	SUieJvH9z94In6NmIe9UmnE+4DRzvWTcDYH3gpPafW/v1/ZOWhN9PZngitr/RzvPHDAxdyEeqRfqa
	AJP7uqQJtq6xFiUYGCgLiMsFILRLP35nG2lhtJZqnpsew7oOR6XvCU0E9Hgn/v1QPd6O89s4gNr9P
	fKvZ0bnsq7Bfm//gzpnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hF7zA-0003fb-6U; Sat, 13 Apr 2019 02:01:40 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hF7z7-0003ex-4p
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 02:01:39 +0000
Received: by mail-io1-xd42.google.com with SMTP id v10so10172733iom.8
 for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2019 19:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTF2E5ylTuzDMJPP0P/IBxfb/0jpKGQmyA7LKmJUhec=;
 b=CPfLLhzEBXBWgr/TQWDSJy7ko+31cU3Ek5T/80Is4zI/rTjYZotAlXslVc4H3LD7Ki
 W4I4ynqy/2Fd5rP/QSHnxHvWQptZ1dWsRL0ShjJ+nubGYEnPZ93EbDoGPZrx6ojNsn+n
 shacIrgwg3PayIz8E6kKgbuKr6BFF7zQ+FkmWjt49mFqO74ka4pv4cl1z6n2/3BDMCVn
 5Xac7Exr6lIIf+0WP/fuE+jKozXzxgczS3U7IFfFp0zXn65yVBXNgH88SuSdHjXZe+5e
 2CEYE64IxwhiexQBa80riayxH/4ED4mqsplAdBC1UTq0IjBXvqIwjqc1x23p+w+y6pD6
 C5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTF2E5ylTuzDMJPP0P/IBxfb/0jpKGQmyA7LKmJUhec=;
 b=Imy9F1+A0ou6oykoDlJpAPQulfiSuJ5FvDG20vtUD2mMm2SoOB1lITHqEEXySRxpHg
 q4jruvk9mS0kEFe4dMNrlCq3vG0XeGzOx2DHdpvxJtRAYbgeXbNKPIvJ/p3+UEc2EN88
 NV3pNBlia9YWEhwhQHRXu4dIIuWrx+hgt/riEVWZ6VFios/ISSBA/W+w3/cbr2fWaG3V
 u7QbxH+R60smOy5/fOeDediu0WVUqJifjAPrIal4iLo3ECivzVOQXsfEBgpitaEK+T+k
 Re+euQWaPVAPOfcrYIZB5BZUtOl4YKMeXi/R0li2CR5xoMgQbt/Lcym5wzYYCIMZeoYU
 I4Ng==
X-Gm-Message-State: APjAAAVDUHBmbPdJVvXE3rX92Gd3uTOoSNzc+KaGHnYEx5lIn4oC6XWe
 pYwyDxS4YSRjKDktyuMj8rkCIQ==
X-Google-Smtp-Source: APXvYqwTAkwyg4xZSTOFVQsVRlFhKJyJ6oArCM3JsgqV3x61CX/H5CpTflhLAkBH0Q285KiMrIagXg==
X-Received: by 2002:a5e:c604:: with SMTP id f4mr17399502iok.263.1555120894511; 
 Fri, 12 Apr 2019 19:01:34 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v187sm7198473ita.0.2019.04.12.19.01.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 19:01:33 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, gregkh@linuxfoundation.org
Subject: [PATCH v5 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
Date: Fri, 12 Apr 2019 19:01:11 -0700
Message-Id: <20190413020111.23400-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190413020111.23400-1-paul.walmsley@sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_190137_184955_781E09FD 
X-CRM114-Status: GOOD (  13.06  )
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
 Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT binding documentation for the Linux driver for the SiFive
asynchronous serial IP block.

This revision incorporates changes based on feedback from Rob
Herring <robh@kernel.org>.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
---
 .../bindings/serial/sifive-serial.txt         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
new file mode 100644
index 000000000000..c86b1e524159
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
@@ -0,0 +1,33 @@
+SiFive asynchronous serial interface (UART)
+
+Required properties:
+
+- compatible: should be something similar to
+	      "sifive,<chip>-uart" for the UART as integrated
+	      on a particular chip, and "sifive,uart<version>" for the
+	      general UART IP block programming model.	Supported
+	      compatible strings as of the date of this writing are:
+	      "sifive,fu540-c000-uart" for the SiFive UART v0 as
+	      integrated onto the SiFive FU540 chip, or "sifive,uart0"
+	      for the SiFive UART v0 IP block with no chip integration
+	      tweaks (if any)
+- reg: address and length of the register space
+- interrupts: Should contain the UART interrupt identifier
+- clocks: Should contain a clock identifier for the UART's parent clock
+
+
+UART HDL that corresponds to the IP block version numbers can be found
+here:
+
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
+
+
+Example:
+
+uart0: serial@10010000 {
+	compatible = "sifive,fu540-c000-uart", "sifive,uart0";
+	interrupt-parent = <&plic0>;
+	interrupts = <80>;
+	reg = <0x0 0x10010000 0x0 0x1000>;
+	clocks = <&prci PRCI_CLK_TLCLK>;
+};
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
