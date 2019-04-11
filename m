Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FD6C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 09:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70FE22084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 09:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7TfT25J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YjzrK8ED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70FE22084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6CV0Ke/z1/GO2UAcsesHM6T/vGhAaeBLBIMO/uoW50=; b=E7TfT25J4ELoQw
	SQVubobn3wUEt7JSn16bEbuoIxkv3g/8QhEJ+S5/ZJfEGQxsmmNGj3g2IX2M6iw0pjvdsRkEKR8u1
	yaMhoPVKpGaUh1HhE/XSc+UNu7ZN3/AhtFWb00SEc74SIPBfd0wySVpSEqBXXXrr6VP2nQv8CXiN6
	VahOcQDCvXHdWuUsSxES/wB/yt2e5kDNdGoOIwnQ33v6LiQR6Fp+bvJjpNFEyCeJwmWpr6F0jLDnv
	q3L7lGpQtmgu/waqAcspNcIK1I77hJWM3v/Yh4HsuP6TiGeZjn7AtRXUqZbJpxlpKXmw2gAT78qdt
	RWSQw4Yo/r4XrrGv5lpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVZz-0001AN-AQ; Thu, 11 Apr 2019 09:01:07 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVZw-00019i-HS
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 09:01:06 +0000
Received: by mail-pl1-x642.google.com with SMTP id n8so3083356plp.10
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTF2E5ylTuzDMJPP0P/IBxfb/0jpKGQmyA7LKmJUhec=;
 b=YjzrK8EDpinqDyuf+0WcBG1czU3cBjLySNPlPbFj8F7zwCaovVSQ0D45HHeNZSejDT
 hKiE/E/5rvXNVUNFnjqA6ru/i/uFCk/8KbPzGLzXjEfr+n1zFljh1aHzCa2TQzXx59ES
 S0lf9CWNKLzObegKAw1apyctW1Ez4t6wEufimawPjVtvOOGDt62rTFdqY4jH4CWNm7YX
 z3KPkdBso4jH+OtB0/rj2zcSUaAI4KPKEXmeSp89QBHLa/sd1ug1gTwaSWPy/wYb2av4
 rsfy3E0Fzt5pxSNWLR6OL0nJYyYlcVOZr/9gJyKNNSh38NqApJttIvc6Oj9Rr6Y15v3y
 Xomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTF2E5ylTuzDMJPP0P/IBxfb/0jpKGQmyA7LKmJUhec=;
 b=OV7g7F7gC3E6fsBK57Per0b8sv6uuOHc/8ow7e7j488KjNyuZw8i4WDp6HkW04RxjI
 hvIf+5wQD35MYl7Qb8ycczqbUCKSY1L0wL66uHrRONe0TGolxGnyMBovno65AyU9m0Iy
 syxSJNGSguSoMvyMKlyUWTVfJvvFfe652171gbs4Ed6FNos90g3zy58tzdR/CHyZl9gT
 8aC5sDv1b4hmZEG9EIhtipRfDje5ayrgnEVoswOGBkql5K85F/kgSXlHWSTmrAA23ZNG
 o4mGk0MdIoekBd/8Iex0xEqFoa4yHygsuYWrQyCO+BezA0pnnN8ANqoxC9Hr5DBnMyCb
 s0tQ==
X-Gm-Message-State: APjAAAXeSdt4N/I6cIVOEkyyz0em6yo1z0n3dCopUChGNDSNvQvRgJyZ
 uZOBaxt+KM0iq/VNnD8HNZ49mg==
X-Google-Smtp-Source: APXvYqzewUZ3f+WjnmQRAZB/rayetaRpUjtNnyzQu95VWVo1xU922WP44urHqsL7acerFot1dTWncw==
X-Received: by 2002:a17:902:b484:: with SMTP id
 y4mr48779055plr.88.1554973262483; 
 Thu, 11 Apr 2019 02:01:02 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m2sm64317272pgr.74.2019.04.11.02.01.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 02:01:01 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v4 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
Date: Thu, 11 Apr 2019 02:00:28 -0700
Message-Id: <20190411090027.8670-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411090027.8670-1-paul.walmsley@sifive.com>
References: <20190411090027.8670-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_020104_577767_A35568E1 
X-CRM114-Status: GOOD (  13.74  )
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
