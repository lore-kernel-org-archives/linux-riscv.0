Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B74C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyMxcxNkVBoazEyHcm14ufS0AmHBbOyYXkDyjE5Vpd4=; b=MKkG4flrk0EkGL
	LUk0scvfK77/z3olcJ/bLERxQl7tzJQgjgwaulNzFLYmWfVkMlMOY/gEFTCeYF/Ka4C9Kn0PHScpC
	6BqT3q/LghEOY9Jnr3u1tA+eld/itGqAr5P7U/bjfxubGGjwUeXRLxYtMct0CSeLTRNHSp5Xgn+0m
	Bb5leLT5p76XxW4PZMloK+E7oe47NYbAVfsB5DLUOsGWeqi7zv923rn4aawY6jqU+/McvZOh8POQJ
	UlfmJVoD4uOhPLD1YagKbMQjEGXWeuU6qbz6vnLqIGhnNcbCdYMGg9exk9xAzzMg4Wv6xvUxqA9/o
	IxCmugiR1NOqkKLnD/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaZ-00000008Leq-0maX;
	Tue, 22 Apr 2025 19:47:27 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GPG-00000007tO2-32MM
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745339009; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TYyfRxCdzIpIgWKgNSE+gRu2Yx+DLe3sMn33GgGr7AvTLi39f/YcFH9wMs7flSeImNqsRg+QAqT/2Cy0H6ZK9zlmhRkTy45r2XSmaWaYLC8oR32FW2u2MaylctzMY6DgG0yMoFUjjaLRRe5dilad2nVIcTQz3btTgTcXhdF37IA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745339009; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rEwnOtEV8d3LGVq1BDTwLd40sKEfTcqEpmUBhVrools=; 
	b=NtIpdsDq+AjI12Pb+9xq/hCRbdYvsHXfKfLpM6qGjM+y9y7T+kKkjjPZcqjmx27vz7bElJU3KA/0grQW9lAvT4DH7/7Q+YDSsxPvtX7dpvr59y0aBxTGljjQqSxCzXc85JBIbUR1Gi6kxGI00S8f34UICQso4OvCGcRORLlxLhk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745339009;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rEwnOtEV8d3LGVq1BDTwLd40sKEfTcqEpmUBhVrools=;
	b=Pv+e9eH3EKh6j7+yRLxi5l7fqBCBEL7K738huaCFwLg6uf7TaeahOeurbxGaKpT8
	iaK6RoJbFplwI8A0hkGIxNGZ1eberti/pPZjTQo+816vwTKyptrOcIn0bCpJSQkj+vm
	0dcjkXDRzFgPJbuKKP/5uwmM/D6FSmKdnYi8eXLXxH46dcbcKgwz8jhZUmsa4RE1U1o
	uxjahZGw03JQhM14uE6FVkkB8Drh8eprvhh5cauxrxewWctmG66ro1GqS/r/4eujvT+
	ZxFWiEiRp/SgJl5u3Z/P/Mk5YLG1gLbcCVG3DD9RuFVxDCwhTB2ECAT0z12X0H1SY6y
	iGK4zVfquQ==
Received: by mx.zohomail.com with SMTPS id 1745339006390925.2438196310163;
	Tue, 22 Apr 2025 09:23:26 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
Date: Wed, 23 Apr 2025 00:22:50 +0800
Message-ID: <20250422162250.436169-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092334_790541_6090BA1C 
X-CRM114-Status: UNSURE (   8.78  )
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

The Star64 board has no GPIOs to indicate USB overcurrent, however the
USB controller would stop to work if the overcurrent_n signal it gets is
low (which means overcurrent situations happening because of the _n).

Use the pin controller to force the overcurrent_n signal to be high in
order to ensure stable behavior of the USB controller.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065a..dab0e0054e648 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -81,6 +81,8 @@ &spi0 {
 };
 
 &sysgpio {
+	starfive,force-high-inputs = <GPI_SYS_USB_OVERCURRENT>;
+
 	usb0_pins: usb0-0 {
 		vbus-pins {
 			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
