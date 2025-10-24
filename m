Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FECCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Qjqu0NHJNoY6nsqMgfDlD+jgs1r4wRy22rrI0Q8j4=; b=obGImTPZBqHSN1
	3jzhyJIBUtxfalEMa19vgn7jgOveKz0F4yd0qCrTICfPlpPJmaOR60FMoNFkQpV93nvRjeXdoDq6H
	/8ZiCNfIg8m66RsXDojvtpBLdDJ857Va8S/624iMOgYHhhJ96i0gqqgZpTAB2n2CeQrI41M4t2W2e
	xkX/65BgfX+DF23aC001zxQfaFb0JXnPdQQV9bHGy7wVXxo2Lx4/Ho7/j2FpmKmhj+aW+vJ6M9ppB
	1nOMXOd1PoDb2FYNfhQzBvPZ3pX+RVpMXDGO/p30JzWzfXconQV0NW+lgGCL17VseW1hd4kntJRAA
	hQxm+zDH1F3+7Me5Ph3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC888-000000087Dx-3uuT;
	Fri, 24 Oct 2025 03:06:16 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC886-000000087CY-3sz3
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:06:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso1170635b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275174; x=1761879974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=S+687DxcT41LvOrZcafw0ucSMB20bkXFiOcoocZbxnpF6d546MirGi+RMDlvbMnQb4
         lCWh2n+v9W6yGF9+AFjTW2yZcEwW9AYzuqDbRDRFYoLv+XTF4sT8QVml1kP1Aud8NilN
         8gI9uzXk0nqPF5xcRFrupcwtxSk6cG4xL8KjIDOAjbQf2+OBJyAMUknZpkuMsEvU6SFD
         KhwQDlbuWdECQjmB08ksBGOm4tD/ghlBG9uwMYqAIS2Uu+N0v9tXgffCY0hiBMDnWMDy
         wNYXMtJOe3tJV4FQYPEGMMg4JRCiknIE1A1PRzbBoGhXY3Ww8Vu4/+qVFy/HexrRC8Q7
         Sfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275174; x=1761879974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=vx+JE61HjXFq/qrLmRdklAXZf+Zc7tg9KxHRFFwHEGyRHpf65RzVpDr0QQxwJ2xc0K
         4TbiJBFTw8tvu5UGxFY7lutOAnkolrHOtrUgajW3uuI1YN2GdK/eK7BUJz2rCAg1pvqS
         3+kxu9kF4G7gLQ0psUsdT6+t5M9BetXeZdrGZ24fIvWzN/Q8bsTTwC2bt11jNT5VjO8w
         QA+jFdOAcawmOxAyWdFaXFI1jr/du8b+O2KKx5rCVWgxlpd8FMW1HrjQ4ERRNC5ECxZ+
         w14I0iXB6EM1yl/2pqhlEfY1NdZEDYzCTFZ+48vLmPCkJfyU5cQTYEXe49PPmMk+kPN6
         SBJA==
X-Forwarded-Encrypted: i=1; AJvYcCVFRR+UfLdOJeTJPhhaZHfTv3hIhUUSPI68K21GwY2Lp79+9pDEf19REBenPTFDwxuVKTqEh2IYD6knCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2znLRFC4gL9Eavs8zwByJWT2zOB8bXaveUTxa6kQ0nnfPyEWS
	DBZ0Ft17+avNmIRIp7VLf9iKOGQDt1TnF9wQvi4F5S5mSZV/95piwMhj
X-Gm-Gg: ASbGncvIRnPvfSBL0866tO5jrxPbtuUqqK9LsJ8zQOS7WvzSiSgrWUGLThRBZ8wnYtn
	XR2NZnoMA9Pq5JbKAqoNvadVCotUSQEKs+Xbdhy9QjdIDPwa2bsuxxgMDMwwS51276j3zXOi9pv
	rdo4otOyMJhT8E6Igyr2RX5RctV6hyU46s45uTmRLTKb7SfqnRfmUkpG50eMUL/TvlopewHG9KI
	5tD4qHG96+8hDe1VFuqEGA+vV84RCIXh2/HJwKqXBb3BJ9EJPb8H+MYc1u14K6wjGJ+s9n5oukO
	68TwcwTkLyu0D1UyGwhZmtQXAvXWvAPd5oWkd5felhUN4bcNJD3i5FPO0S+olAScuZyAQjZLGjW
	MK0LTkxhf1hc1eI2ah4o5PK9jc7kTdt7CbfY+XHla3H1EJDZSeQOSW0ZC7YlrwOer+SMr3LXZKE
	sC+ZVVqWbRoOW9GcM+
X-Google-Smtp-Source: AGHT+IE/XFUouf2Y2+Ufb3mHguZuerhicLnASzdw3OZ91/123tlViakv7Utbf09cEb5A9VJEhESMKg==
X-Received: by 2002:a05:6a21:6da6:b0:303:8207:eb56 with SMTP id adf61e73a8af0-334a850614bmr36652432637.5.1761275174071;
        Thu, 23 Oct 2025 20:06:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:13 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Fri, 24 Oct 2025 11:05:15 +0800
Message-ID: <20251024030528.25511-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024030528.25511-1-looong.bin@gmail.com>
References: <20251024030528.25511-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_200614_964619_DA78E142 
X-CRM114-Status: UNSURE (   8.44  )
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
