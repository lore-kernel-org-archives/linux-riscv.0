Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1208AECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 18:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E280721470
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 18:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9hZfbgG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QyIDZkhD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E280721470
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yfCJFI85L5ZMmLlpVlJDGDIoik7rVjqF13q9ZMZSD4=; b=C9hZfbgG+KRq+Y
	GPM3cN9ij8pjbgVnYG4UdX4/sl7Jb2TKOAcmpmjbTZ7aIYLYZ0olcM2Arzx5J3akNo6R6JU4ODWFd
	gzlwWwfFEAnWCAQEr1vcGIHFUwt0F0m2YJPpe77QD1el1ycBKxyA710h4bjcu65v9f1R4UKfvqyH3
	u/mxP3kLOoIT11bFrOx6PxRGjS5GWW90eW95s0ltEddG4rG9vd4EPe98soSHsfFa9WFALAC4yncR3
	ytk0M279IRDbJjbTc/Etrvyq3k2bJsadjCq0XKYWh+IduOILlfydIac19OoH3N2mUDC/btduxl9yG
	QXc06BXBiIK9wtOgpv5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDZpY-0002XM-F0; Fri, 19 Oct 2018 18:49:04 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDZpU-0002Ta-4O
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 18:49:02 +0000
Received: by mail-io1-xd44.google.com with SMTP id y10-v6so23582598ioa.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KHJXfG7Y0xQkyTOnP5dwDTuUGV80eAqpfuxXYLtQfk0=;
 b=QyIDZkhDfja4pVEr4POteuKtXIQdBuc2PcMz11Jy4g2ytDD/FBIhv1rxvo9lbflKzS
 3/SOPpGsAliCyDMiwG/+OOUark9AbexNsTM0N8o3tP88D4ZzefJ+OMe9lW4PUU/j5zxn
 wi65cBJhrmD+a5MTTTe1PZX9t97jYN++BZumU25OnUrCrjl5pvujqJ113QqgeYvHzPW4
 RUSMOVbC5MFbXFIPla0jcFmseP5X6x96TXiCdfYRrhtsEqCIGdhKlGlIfE/BUoNLm/3g
 NcXKjrD5gJvXIgPdx7Gi54GHx9iWOu7j8eu8LMEwHqXj5HkC+KPE+/Iaf1/TbxWbK15F
 NFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHJXfG7Y0xQkyTOnP5dwDTuUGV80eAqpfuxXYLtQfk0=;
 b=ZVEaqOOIICWg3hsL9DHFkH17EhruJYH0A14JUPMwLiiWFb0kzff/Vhf6pbSC08hORR
 aVrmMfvbqCpHyUgn86BxjldLqB/gfSu+O+4WJcNl3d0Spv4eVMJQ5dA7rmSeSbW9GCSV
 lbavQ3WzShPfRLJxIctxXEt4JbwjL8AdwwDnsV10ePNd/ST6eCeKrgsn0KYYbnAtYGaX
 bxA7v0TWLGBi7/US8/+x29jZ8IFxqFoH+w/ahoEMgl2mG9Sb4k+K5QYSrxWfVFZ75WXV
 +QXXBXjruX0SxLv10LtbN77aZJZrUqSjLuaDn8LuGvP9aqFCxHmB3MWZGg97deAKXayy
 E92g==
X-Gm-Message-State: AGRZ1gLdhop78jOewWV1pi7EwRzfomR2IissOHQ7wVFGk2NnP+5f1Uj9
 8PYw8MLbGbqSU/U+Q8voyKmmHg==
X-Google-Smtp-Source: AJdET5dI4UtJSsCWSc4FcShxm38Lobwpp0/+NPC/PgybWYKO5lGtbvrgSs3mQLG160JmlaCn0XDCuA==
X-Received: by 2002:a6b:3b54:: with SMTP id
 i81-v6mr3642373ioa.133.1539974929039; 
 Fri, 19 Oct 2018 11:48:49 -0700 (PDT)
Received: from viisi.dia.dnvr ([67.133.97.101])
 by smtp.gmail.com with ESMTPSA id f9-v6sm7528873iok.25.2018.10.19.11.48.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Oct 2018 11:48:48 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
Date: Fri, 19 Oct 2018 11:48:27 -0700
Message-Id: <20181019184827.12351-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181019184827.12351-1-paul.walmsley@sifive.com>
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_114900_171462_A979F60F 
X-CRM114-Status: GOOD (  14.52  )
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
Message-ID: <20181019184827.M5taTgscxROg-bx3zL-G9cN8l3k_kQ0On9hKYdKZNXQ@z>

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
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
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
