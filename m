Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E722FECDE43
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 23:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB8C2087A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 23:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qRq3KRJj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nExKmF6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB8C2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIamo0NxmECrYbNqjtBJUdhSiB5ItKeNXzcYCyoPC/A=; b=qRq3KRJj/7u1TZ
	cvOk5GZYXjL3HEK58XrFQxTC0PHKpQO4LdM5YiZRq98HYsNb++WCU43Jpz4eg+/A84YsXwH1Wm7VH
	54qt3IBSOMdEYWf7fuwHUCROKxHTCG/QlYhE8zD9LbEugciOqBgchngQ2vsgAQFXz3obmDVWOAWSG
	ADOA/19pwkJ7bjiC2T97xIoKtwUB/y8J4a3jQfAO5lSmv/wwzu2/ynH4dvVaOQGBWP9lBRopm31JG
	Gx1k8Jpnshn+qpG+kdOyd0rUAiBZ8pMDPa/c1H5ESK1URxkW8meVJMwgA0JjQa/iIW04T4KTt0wv8
	qd0i6bqzkk5Of+0uk46g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDHyv-0000ZQ-6n; Thu, 18 Oct 2018 23:45:33 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDHyq-0000PP-JQ
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 23:45:31 +0000
Received: by mail-pg1-x542.google.com with SMTP id i4-v6so14908913pgq.9
 for <linux-riscv@lists.infradead.org>; Thu, 18 Oct 2018 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2MPfrcipe6KjyzuOTKm79jYFeEpW7P2PfxdGu7lFRo=;
 b=nExKmF6iGC5wCAYr0rpd37bS9TW2CGDiDLpdfPmlRUqQuOiNGfNeSIhtqz1DG5lrxN
 4KvZ3odsuoOc8kwJZtWDL2Lf4OTKY6ejPVOLQgRSWREZIntzzii/j5N8/1RmZBQZhuJ8
 wlC1ZyytAj2K+Uuzwq9qiGS0DXY/1W+mhuf+58wwcPExWAaFJAnVj5RLE5Cw9xuRRYYi
 ABrLRWCKux2yat+trPx0HRV2QBf1vyZKFhdtlczf3FPXrxdQFCKhp+sgCIe+gQetLRNz
 jpFObOQUAGXKWR6uAIYP6Nnaw2+1ppSqJXc7AK5zNPL1rXa+J6+odqmgAFBy7NgqrJcH
 QHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2MPfrcipe6KjyzuOTKm79jYFeEpW7P2PfxdGu7lFRo=;
 b=rpFBuLnnAZIoObGT1b7Z2MRlETkVnfLKqdgu6BCAfVPg+nEKV/qqJBuFE/MgyqqgIV
 mlsOQava738rKEsSbUgb/C3fsrvYp9PQU6oISQs2/srKyw1/4zBHQRAZpXF04dfF6Nd9
 uTWbn9lOAjO6eXlsb5A2J5tDlgRTq4KOmHt4kptOblcr6CSNlNf791nY3bAnl0yvTkBt
 F9ePOsiug6fIy16sIz6345m1N94ZzQqJEbrzioU/Q5a+m/0GWVQHdgS1ylgsk4dwwnxJ
 ZNhn0tJIL5Tvv8+t8ccNQz9CL0MhhmQyk76c7k37nbFcI9hE3Zcy8gy7mnk+tmOu+omF
 taOA==
X-Gm-Message-State: ABuFfoikaMTyh6APIOsN53pBtHcU/XF9B4pyavQlu9gZm/HL7QmgD9k0
 dkGgFRxLrURmTKN24Mx4DmYChA==
X-Google-Smtp-Source: ACcGV62M1pK7o5k11hm+dfuIQKOeXNHFeAUMuF/Po+BX1DwKriMxinpXJF0+qR/MnzFP3iOw299k6g==
X-Received: by 2002:a65:6295:: with SMTP id
 f21-v6mr30637759pgv.167.1539906316265; 
 Thu, 18 Oct 2018 16:45:16 -0700 (PDT)
Received: from viisi.internal.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u77-v6sm35701784pfj.40.2018.10.18.16.45.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 16:45:15 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
Date: Thu, 18 Oct 2018 16:43:53 -0700
Message-Id: <20181018234352.26788-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181018234352.26788-1-paul.walmsley@sifive.com>
References: <20181018234352.26788-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181018_164528_640772_A32AFC1C 
X-CRM114-Status: GOOD (  15.00  )
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
Message-ID: <20181018234353.dH1epuDUULpTNKmyy29IptZl7f7aMaNaMTtB-w-nT5E@z>

Add DT binding documentation for the Linux driver for the SiFive
asynchronous serial IP block.  Nothing too exotic.

Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
new file mode 100644
index 000000000000..8982338512f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
@@ -0,0 +1,21 @@
+SiFive asynchronous serial interface (UART)
+
+Required properties:
+
+- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
+- reg: address and length of the register space
+- interrupt-parent: should contain a phandle pointing to the SoC interrupt
+    controller device node that the UART interrupts are connected to
+- interrupts: Should contain the UART interrupt identifier
+- clocks: Should contain a clock identifier for the UART's parent clock
+
+
+Example:
+
+uart0: serial@10010000 {
+	compatible = "sifive,uart0";
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
