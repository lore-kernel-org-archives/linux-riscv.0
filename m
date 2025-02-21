Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5231C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 05:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:To:Message-Id:Subject:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5SL88COSj+uDB3dYjGlIM7OIJTXBN8764o1awk+eG0o=; b=ETI
	XZ8Gb/2V/MD58VCHTV/TfwV1ottnYMMuJEfHgSUg1OS0WvzCCrI+9zFWMwf2szoQTLCbepC/kB5hM
	p29x/0cj8SE6Ovt3BBU0ukq5jSAcY7TOHIZdH4pw2Yh9jr0u64u2Fqo9rJoQxjftIwIqeF3OlDAL+
	PRaVth0mxHGZQklX8SUdTk9igVwtJBdRuUrJ5xnrRARCRHmPvIRZSmeLbX2bb4FhU6L+Gz9v07aCz
	8X+fZfWPqgynsJVw6zFD9I5NlVLTXovgdbFl/1HYYR92xi2ApPh1HEF24aUcDu1xftRnStKl3AQ+k
	Exqy5kBHh05zCoqtSdDl5KjQxN00bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlM4a-00000004IhM-3zqA;
	Fri, 21 Feb 2025 05:59:40 +0000
Received: from va-1-13.ptr.blmpb.com ([209.127.230.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlM4X-00000004IfW-0Lze
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 05:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1740117566;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=BiMZmOITyEUPnY+3LucOL7m+LxVP9/9g5AtKDW/M6a4=;
 b=RRxUJVlsf+2eRg+eyh9qCYD5NxGE9AaldGR+SAxrROwXmUz6xBoRwojeePpaR1j9zqIePn
 fA1+BSzyphOOpU3LDcGnSyvJcDFp3bZDdTEx6RVK87OncIE/9fw5wgdUeq37XK1WpB6SWj
 XAUM5TckuKnGY1yyF9aeBrSN09ZL1V0xLhEk7S2QeOc5B8a2f+4GipAxMomLbUa3H59+2p
 Xh+/oIfKYmM9oex1Sad4r1owbWjUY6aAun+Cr6E+IIbou0iGAvTV+xGhhHQ9NGrseAPYSj
 /L4uNjvudi3A5kzxW7gmWbwpH2XNKWCc78ChHdTHQxdQOELBUkRts9XPY9rqqw==
Date: Fri, 21 Feb 2025 13:58:57 +0800
X-Mailer: git-send-email 2.34.1
Mime-Version: 1.0
Subject: [PATCH v2] riscv: dts: starfive: fml13v01: enable USB 3.0 port
Message-Id: <20250221055857.481992-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+267b8163c+6573e7+lists.infradead.org+sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([113.110.143.117]) by smtp.feishu.cn with ESMTPS; Fri, 21 Feb 2025 13:59:22 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_215937_773610_C69E1A13 
X-CRM114-Status: UNSURE (   5.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add usb_cdns3 and usb0_pins configuration to support super speed USB 
device on the FML13V01 board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---

Changes in v2:
- Remove space to pass checkpatch.pl.
- Add usb0_pins and pass test on board.

 .../jh7110-deepcomputing-fml13v01.dts         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 8d9ce8b69a71..f2857d021d68 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -43,9 +43,28 @@ GPOEN_DISABLE,
 			slew-rate = <0>;
 		};
 	};
+
+	usb0_pins: usb0-0 {
+		vbus-pins {
+			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
+					       GPOEN_ENABLE,
+					       GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &usb0 {
 	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
 	status = "okay";
 };
+
+&usb_cdns3 {
+	phys = <&usbphy0>, <&pciephy0>;
+	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
+};

base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
