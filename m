Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF170109024C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQJ2WiU5XnLJUWNKnIMEtxzh+hIbO+IkJXJ00pG/2Z8=; b=jfj8R828Y2sJeZ
	qAJXxjaBo6hwuUuC5i4uAfXRI0QZK518LqyL8rDPl3odM+wX8d5FbmMEXfFKQ9G3NWv5jNEPpGQDA
	SONtCscO81Ys8xskVc5whaDcqBIopOL6EbHvcDwpyVyr4yPmi3Gmkd/LBu2lYfSsoSodeF/6Z2PL5
	QaXqOD2h1HeV1e6PGBqchcrc+Wmdm28qQ36mYK55h7nH+guSAg5ZdqjuHvye/OaWU+oNjI8yrOJhU
	Sy9IC6v8m9S5/9QcGf5Jq0x2ii056j9RSeKYqaHBdHIT4BbEYSthBF9W5Ka0GCCRMQDimZLzoaorc
	rZFHfNFkIF75jj2QyeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHt-0000000B5FH-2wGb;
	Thu, 19 Mar 2026 16:31:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHq-0000000B5EH-36p2
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74A85440DC;
	Thu, 19 Mar 2026 16:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1D3C2BCB0;
	Thu, 19 Mar 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937914;
	bh=dDFNz/T2xe/eSJre+9Pi9oZ43RYZjCSo4zFbd4aQ8Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpOkEc66b4o3LYrDoDPxPuA3DM2N48YRr/s8MZ9bdy3x24ypLd0bLrSwZxxszV1RI
	 ZD+8ZDw3T7CvCmmtfRD2+YsYj8v7XbV5PKqLRzF7EMKsrTLFRGTVxmZPqy1E/vjXHJ
	 XOzHOHAVLnsPfjGa9/Ci0/6wDbSlGAtVl9JItuENFzaX5dY58OUbcU2GccBgyJfvbM
	 CM04+OxlLFXVXPMporDvR2z2hOHG21R6vULrVOD8twPARakuQaXvYfzakF6mOGtufd
	 URsokauyv3bb2JKAcKfSgoxxBjWedJ1fciaYs0YsGDAEuJHq9SfIfkpioXaowHCJ0i
	 GWjQqaqRtVHBg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 5/5] riscv: dts: microchip: add gpio line names on beaglev-fire
Date: Thu, 19 Mar 2026 16:31:19 +0000
Message-ID: <20260319-silliness-follow-a53828f1379f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MEbSWdODM6nyqAj8PlnaLkIFvl2GmdURbDtDn2FTXtI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK7+01DuPfm7XOb41Ijgzlxfmcj2mY0Vs4vbt3orG LXniV3vKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwERSrRkZbjhOjg5k/PDlrJdB wtd/cqdZbxj5mN6b+StrzdzPVy9OuMTw31+Ec0X+mU6/w7NWPXx0WMVG0EL4FdurpkcPNVMypmz 4xAwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093154_801794_643EE2FA 
X-CRM114-Status: UNSURE (   7.64  )
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

From: Conor Dooley <conor.dooley@microchip.com>

GPIO controller 2 has the gpio-line-names property, but the two other
controllers do not. Add the property for these controllers too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index e8d0a825a5bfc..99c1e05d4d169 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -95,6 +95,8 @@ &gpio0 {
 		     <21>, <22>, <23>, <24>,
 		     <25>, <26>;
 	ngpios = <14>;
+	gpio-line-names = "", "", "", "", "", "", "",
+			  "", "", "", "", "", "SD_CARD_CS", "USER_BUTTON";
 	status = "okay";
 };
 
@@ -106,6 +108,9 @@ &gpio1 {
 		     <43>, <44>, <45>, <46>,
 		     <47>, <48>, <49>, <50>;
 	ngpios = <24>;
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "ADC_IRQn", "", "", "USB_OCn";
 	status = "okay";
 };
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
