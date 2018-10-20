Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E42C67863
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 10:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CE82150F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 10:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYZAVyHG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UQ/ifgKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3CE82150F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnjflPtTSpHDh/uhGGYkNlD/wwRtSbowz2AF6oB2lek=; b=GYZAVyHGcLA4i8
	GAmtPUtifXtvdX7LCZiViV725PoSt6mg3fmMChESlUsATGK4/yLAaUGUTAHsltXqr8yj/iDjXF5lY
	9HQN1mx3LsBTheV0MPWDmQ/3lb7MUP0o56BjHHNqqFO8yggIKFwbNeoH4IfBIUYJGXa7oKQ+B9Skc
	QrPJtdV/P4C2F0CUzpMuUmLyCul2/dwedICzDDUetnObwcb1AC2kU42sTH9AvAkM+Srj/GQB/Qvqi
	KBb/0BJfss8JV/VdUbWQWX81HzzjfMKEwnveKvi/U7t0tjabpZIK5ww7iXvWP9Ma1ucFwrlXleRuc
	ziMtAAhiZYo99jXodeqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDoFE-0008DV-NW; Sat, 20 Oct 2018 10:12:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDoFB-0008B6-Fo
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 10:12:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id f8-v6so359477wro.9
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wASbXyBYFMcRIkQoK4CDFHurMQnCI3R8vyfKJiCMxpo=;
 b=UQ/ifgKTmwDizP/mPww3MG4vreiMpQ8AIMKtieTEAr/e5NNsOKHszM+NRRM5OWqRsR
 qd7ENY4cc1KqZyzybNUHmPRaqI6hA4icH9yhk/XO/ZBZfrz6kYQx9AeN67iH+tBwv+FU
 V0RC56nui14BWbtNn9eSkTrSwa54zWoy1tp6eRuJzqVI59aqjD/I6MaLS8bPm9LHklNb
 skVlnVaiuJ1Oprg0CLRSONC3L12mEW3lgYXtpwuxPX+grGwr2ieMHUVwhx2wbVa9g+Ao
 vDpf340Npqsz22uc4wCjnpaa2VXxa05BQcbbC5DP5C0sUQg5fjAOPqw/un60bBBRGGwc
 h83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wASbXyBYFMcRIkQoK4CDFHurMQnCI3R8vyfKJiCMxpo=;
 b=WK9iwgk1qGJ1u/VnJjCjZqB2En6YypP1WV5+06zXbA4zcVUhMDiST+Y6+q4xP6aep0
 QTYVZZprpz+bQVGGN2rSx/JTZhqeuqg1WOuoU8RClsdyIi9XYd7IPJsxgoN/DCVF4Sn5
 G/SqztkvvEzYWtXOoLtHjjXdrI0ZjWY5ZMPpAR3V4+CP4OOy5gdQAwim3j7MbrUoSU6D
 HLQ8IDmKKuZQdZEgYMT+LJHo5Exe74OD72GRCBhiCliMFa4IZ4S6dKkDqrpSb12kGzfB
 jE9P/PMPJbm61tfesi+Z7cgREIlNbAyjfht39WUzb75i3KRl1kH+qDKPdSAOeP4E00M2
 lqww==
X-Gm-Message-State: ABuFfojVFTeLhVkkJUqIRreWElKyTw0SiYcoFyiap9WzGUiURcVU7xnu
 +uotW0kk5ErziuoQLx+f1Kee/A==
X-Google-Smtp-Source: ACcGV61ZRzN6qFa7EQQvAdvDjUdCAOdb5iqDYDLhqLEJ6Z8ehDOvwiwg5DMGbTi4qEM7MxgN/YkMEg==
X-Received: by 2002:a05:6000:1284:: with SMTP id
 f4mr16331584wrx.140.1540030337812; 
 Sat, 20 Oct 2018 03:12:17 -0700 (PDT)
Received: from viisi.sifive.com ([37.152.39.96])
 by smtp.gmail.com with ESMTPSA id 2-v6sm23773438wro.96.2018.10.20.03.12.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Oct 2018 03:12:17 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
Date: Sat, 20 Oct 2018 03:10:46 -0700
Message-Id: <20181020101045.15991-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181020101045.15991-1-paul.walmsley@sifive.com>
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_031229_538705_B9B8F578 
X-CRM114-Status: GOOD (  13.99  )
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
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181020101046.qlwf4Zga_vyJZjnJZ3UI4ET5-5tUs1jxTQPfA2J5C74@z>

Add DT binding documentation for the Linux driver for the SiFive
asynchronous serial IP block.

Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
v3: update description and example for compatible strings, per
    discussion with Rob Herring.

 .../bindings/serial/sifive-serial.txt         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
new file mode 100644
index 000000000000..a426b18ba049
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
@@ -0,0 +1,33 @@
+SiFive asynchronous serial interface (UART)
+
+Required properties:
+
+- compatible: should be something similar to
+	      "sifive,<chip>-uart<version>" for the UART as integrated
+	      on a particular chip, and "sifive,uart<version>" for the
+	      general UART IP block programming model.	Supported
+	      compatible strings as of the date of this writing are:
+	      "sifive,fu540-c000-uart0" for the SiFive UART v0 as
+	      integrated onto the SiFive FU540 chip, or "sifive,uart0"
+	      for the SiFive UART v0 IP block with no chip integration
+	      tweaks (if any)
+- reg: address and length of the register space
+- interrupts: Should contain the UART interrupt identifier
+- clocks: Should contain a clock identifier for the UART's parent clock
+
+
+UART RTL that corresponds to the IP block version numbers can be found
+here:
+
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
+
+
+Example:
+
+uart0: serial@10010000 {
+	compatible = "sifive,fu540-c000-uart0", "sifive,uart0";
+	interrupt-parent = <&plic0>;
+	interrupts = <80>;
+	reg = <0x0 0x10010000 0x0 0x1000>;
+	clocks = <&prci PRCI_CLK_TLCLK>;
+};
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
