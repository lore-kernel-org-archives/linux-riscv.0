Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047D9ECDE3A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C630B214C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="brzL3aRs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="bSV9wZSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C630B214C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DtOTNjzSOyDVb7krVN3/fvJgDrRIxON4NNGtPD0JmRQ=; b=brzL3aRs2fwc+oIRujMgYUwCEt
	Lzpm0g+2rR+nM+u50SI9nvfqsOwJml5fneAcAOcJFwtDqO0j6V+WxqP4HeAUxa/4d/AjpyiF8ODoI
	cXDV7TPhUUHTX14bPBhoV6cs0fZTUlxZW9y1XqU3YUkUhc6mfZBZVm2ZARWgAp6DJZYV0mnB9YIlD
	+zGvTIQKu44vThmUjcFrLtFwA5atuiWCKjky6LfaeS5hnd8CIUVdIxAuqkWnGHqIj+QN4Pj68sb1z
	Q3Hpd/U7WRwceAbyS7BR5MRSemb9+Bf+udeOHhVvw0uO8wxaz01NcT3CYONtdBMc1wnmLOYBujiJB
	84qGfhXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9x6t-0000OS-IE; Tue, 09 Oct 2018 18:51:59 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9x6j-0000Fs-WF
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 18:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539111110; x=1570647110;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TtsfGcDM3h5ap+H9kxy/xjXfnWIH0/v0qN2/iTEdC0c=;
 b=bSV9wZSf+su2ZJ8vl6vy6jPuAeHUs6qUojohArN8TLZeU+ZHddw6inhV
 Alm5NYeUc2DvFC/cC64mr8CdQ0Pli0C4dMWn7EKoON0lFV5adFPu/PVF5
 lqfkFlz8Z5+V0odS7iGp/fiSqxt5gYk/iPn6n6y2EOl36lxQmDHjCAD2T
 CwgKS+WabY2P5wKbf0hjNu3C6vzPcgMpc/9Ds134DWiA55Q4L/6cRcz4a
 5YWFpXve7JRq9Z5xLk5zDz4DNZtOUTt2ZXC4HmSIoWyBuaXzqE9QL8iz2
 pTK36yJj2b+3B0Xj747Clpj1HnR73n8JGyUDSea4PtzwJwJGI35c2YIi/ g==;
X-IronPort-AV: E=Sophos;i="5.54,361,1534780800"; d="scan'208";a="92668397"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2018 02:51:26 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 09 Oct 2018 11:36:53 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Oct 2018 11:51:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: palmer@sifive.com, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC 3/4] gpio: sifive: Add DT documentation for SiFive GPIO.
Date: Tue,  9 Oct 2018 11:51:24 -0700
Message-Id: <1539111085-25502-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_115150_204832_441B90DA 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, hch@infradead.org, atish.patra@wdc.com,
 robh+dt@kernel.org, thierry.reding@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009185124._vOW75yit77Lq0yOVQrQBTZ6cSpJ-_xVsIZiA-JCRuI@z>

From: "Wesley W. Terpstra" <wesley@sifive.com>

DT documentation for GPIO added with updated compatible
string.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/gpio/gpio-sifive.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.txt b/Documentation/devicetree/bindings/gpio/gpio-sifive.txt
new file mode 100644
index 00000000..781fe4ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.txt
@@ -0,0 +1,28 @@
+SiFive GPIO controller bindings
+
+Required properties:
+- compatible: should be one of
+  	 "sifive,fu540-c000-gpio0","sifive,gpio0"
+- reg: Physical base address and length of the controller's registers.
+- #gpio-cells : Should be 2
+  - The first cell is the GPIO offset number.
+  - The second cell indicates the polarity of the GPIO
+- gpio-controller : Marks the device node as a GPIO controller.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells : Should be 2.
+  - The first cell is the GPIO offset number within the GPIO controller.
+  - The second cell is the edge/level to use for interrupt generation.
+- interrupts: Specify the interrupts, one per GPIO
+
+Example:
+
+gpio: gpio@10060000 {
+	compatible = "sifive,fu540-c000-gpio0","sifive,gpio0";
+	interrupt-parent = <&plic>;
+	interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
+	reg = <0x0 0x10060000 0x0 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
