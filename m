Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21504C28B30
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:From:Mime-Version:Cc
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BLCoWue2nvVBwvuFFLgXirFz/w9kFTKMlfDQrNmF+HQ=; b=0aCx77bc1jFKWn
	wfJcvEwS5h389GnAbRLOPPmnBn6MpWOyWrH602FIK9Hc/HnjK9a63zkE1J957yoieyaWjUlb+nkRa
	S08Of9GOK14rm7bAtR1zG9v7GRaeaPcJ3wjyTC1RqXcE1gI0tSqCMqXaUEXDGAK3ED+zAhE32Fpmc
	wb67Sx4/UrIZpE5euDD0l9NUOs8APbrykwV9QYpKX3W8E6A6Tj6fiHGv0ekOXyDVA0dowFh6wwOU5
	tucOJr9Z3obZVQkGkcGEoXdib1L/+U9aYTAAqYWx5fH7K5/v/ZuQPlsxbiV61YMAJArHyPatH3may
	2TuTxaazn5ShMm1JWY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twXH0-000000023XU-0b74;
	Mon, 24 Mar 2025 02:10:42 +0000
Received: from va-1-14.ptr.blmpb.com ([209.127.230.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twXGw-000000023Wd-3myt
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 02:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1742782226;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MHPZt36x34vKdZAyw073ovIPsPHQlX62Odd0waj2844=;
 b=quo6wPGGLhcfyASii/E/Jvy8gO00cdYWvQB6/vYC0FoQLmipXB44NDbn3wYc29TBEdU71T
 Tv+iMGW1ntm8Iu88PHVj9OasAiFFYFmopCTpFA8BK432Dupe9/evlVE/X98KJKYURqJBPg
 KVSrja/BuL1dQLMKjhJZgFptjpWwg7PzThhJwJqXvNDYpV4c6GFHjEnQ88T4V4R80nm8dG
 ZZT0AGSPKvOMh33Enb403LseM03sjzg6rX2tpRZgjwElDOtWaQKdcO+9zkvfZBaRL4ofxi
 FVZam48ocRnozQtLQ4HW6H6LukkeYv2cqf5dG469+6imC0raGzgKyPh6/a0HHQ==
To: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
Date: Mon, 24 Mar 2025 10:09:58 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([61.141.249.154]) by smtp.feishu.cn with ESMTPS; Mon, 24 Mar 2025 10:10:23 +0800
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<sandie.cao@deepcomputing.io>, 
	"Maud Spierings" <maud_spierings@hotmail.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+267e0bf10+df6461+lists.infradead.org+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0 port
Message-Id: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.34.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_191039_456274_516BDC04 
X-CRM114-Status: UNSURE (   5.68  )
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
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
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
