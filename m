Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE25D74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPIjD+WiNfuR2K1U6U3SQkbWJnlDkgzCSN1UwKZoMjY=; b=JBef8DDElX2p62
	FxTPfkMdsfnp2fqylyQBnLQo/VUL4BcuAZKvjpQHPDBfEChdoZD8q7lkEyI5gX1k6T6uLgrtWatnA
	c+QlTDHDJpM742HsQQB3zx7DELCf5pfdCeYQLF7Q0v8m0oUiU8jYq3xEaTH11jLUE28XNK+fjzb8S
	trdsI4VLh+oEtKg32Y/+iyf87b7HyUwX4YZyoLN03szDKERRWXc/Az0uLizRviAtffqMC/Uu7BetM
	QWDAA9tMfI4CZL1F5QfthnFNoq4cp/tLV9O0MqpNSHkQnmSpsh2g+fveRdpRmPo2XKCkKB49bTn3S
	7k51xiU7+XojLn3yW0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8a-00000009ls0-0Qva;
	Fri, 19 Dec 2025 07:42:56 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8X-00000009lqc-20C1
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 07:42:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b75e366866so771677b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130173; x=1766734973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=DeypwqBjuM78/3o8JHDSeCaoZHrljwrZnTF2n3QNrO8iXttIrlziV9f4gUHmsZMwWA
         qHLtlmxV8qZexiME07XUFXu6rWdNnyjpJ9XlZ8Cdne6icy4H6ii++oUlOChx0UAnb7vh
         STi1SBN6+/CWn9N1XwFQDwjvwkZwEPVJ4B27n5HHyXZtQqkCetpPglHb3LhDF3Uw3Zjg
         Bcj/1rBULoWnduayOl5znQrsJKq9yGwGewGi/XbOyr73Dg44P7/RWXMhTc7SF1m0Ftbv
         jFz53jZhgaoZ7ZI4gdJRKW6cq78cEFrNaXckbUebbr/4VL48Vn/23HKcNKLuVP7Z8wd7
         XTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130173; x=1766734973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=FM/UyAOPUlz84I3ZaMMcNjFZR8eL2cxyFkMPaumwVihpYERl6xUSZXLWuPiD0ozL04
         CsSDc3mh4NvHsRVUO8TbkPtnMQyg0+lZPN6JsA9BGsxE7gVkiiT0LfXS2pWIx8Ec6E4c
         p15JDOiwlZqVYjg7q2SPZy6tKVM5I5AYDvE0KS7Mri6dXh4Q6ASFZrvnBjN1pa7+6OJ7
         nKBsQLsvtt+Bv0y48AvuR4tnZ14xre+VKWBRx13gdXPe+833CHXqoYCeP30g78Fh4Y9e
         ieQ7+0cPU9qkSdlWMfKvMsFMk0ze9f+1laHqhvi8coBVqbIF+GNYQr9ayCSMWvtui0mY
         YO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEko7pWgDjokkU4NzZUi18cdFlPhIQkqwpZ9P9eN8tk2Kx91YL9RBhxQIjDVbanckj3l60a+4wcurscg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYJH6AqGk3efpPB9NMVi/6L5alj0BLBJogrf3xSS9rMPepEDnh
	nmwNqLQ2gy2UJTDAVdU76wgjqyTJ6ZP4tQWjTHa0kq3eBvRtH9tBYIgy
X-Gm-Gg: AY/fxX4COtP/hXKDt0c6wn+SqNKzmv9O4UGTMW/vrpBDkn3CfVEH6u26IdaGyO/KMYk
	sg7srNy3hs67BvZfGFwXdebYPbE404FpkA60OWXU6dLHC2ZvgopxF3LOc13YaVW1EAC3RGoBxcR
	IHazXOSMd7bV6XhpHnnpifWJ8OtBidL7qqzngT97UBbXkzIlt7xgIEM8swNwy2aU9p+Gz2BFSDX
	msf5fUNlHX3n2TNBgxPq3QcZvF9IWuh1NCCb562vPpbg9DbSm9WsuiAgIMcGcLWK3HPMGn1Ha5F
	aIBC/V0tmqms8ts1tWOiN0uZPwDq0LEYTTcbXrPZAub4egIgrYDopM0IvggaXLvCxnSkPtYjGwd
	x2zGw2cnpNJvWCfgSZj5bJcOjKY2RXnWQg7aZ4Yo6FZd2Q14w94/+
X-Google-Smtp-Source: AGHT+IEOHBbwLfzOsV5D+3VGSzAKq+pDw6xwaXIZis6jWHwmpPR8IDpm4tyhNORstF0bxJlGHlff0w==
X-Received: by 2002:a05:6a00:600e:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7ff66d5fca3mr1889071b3a.37.1766130172539;
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1490499b3a.50.2025.12.18.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:22 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add reset property
MIME-Version: 1.0
Message-Id: <20251219-i2c-reset-v2-3-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=2324;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=G72T+WZDY27E2UhxRAm4MPRhTxWqCOs6OHY4x2Qdsqw=;
 b=HD0df5Haj/AFbxGbKco41n1PvKa6CLMqswLAGzmIzGdRjAEs0GfnJLJj92IFCCKm3Vernga+E
 iBGpVisLTtKBV2nM7Bgx3FZe9xadiIx0GzOForjakC0eN69GVHirVw5
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234253_532673_0472019A 
X-CRM114-Status: UNSURE (   7.58  )
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

Add resets property to K1 I2C node.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..085987643638 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -367,6 +367,7 @@ i2c0: i2c@d4010800 {
 				 <&syscon_apbc CLK_TWSI0_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI0>;
 			interrupts = <36>;
 			status = "disabled";
 		};
@@ -380,6 +381,7 @@ i2c1: i2c@d4011000 {
 				 <&syscon_apbc CLK_TWSI1_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI1>;
 			interrupts = <37>;
 			status = "disabled";
 		};
@@ -393,6 +395,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -406,6 +409,7 @@ i2c4: i2c@d4012800 {
 				 <&syscon_apbc CLK_TWSI4_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI4>;
 			interrupts = <40>;
 			status = "disabled";
 		};
@@ -419,6 +423,7 @@ i2c5: i2c@d4013800 {
 				 <&syscon_apbc CLK_TWSI5_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI5>;
 			interrupts = <41>;
 			status = "disabled";
 		};
@@ -443,6 +448,7 @@ i2c6: i2c@d4018800 {
 				 <&syscon_apbc CLK_TWSI6_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI6>;
 			interrupts = <70>;
 			status = "disabled";
 		};
@@ -546,6 +552,7 @@ i2c7: i2c@d401d000 {
 				 <&syscon_apbc CLK_TWSI7_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI7>;
 			interrupts = <18>;
 			status = "disabled";
 		};
@@ -559,6 +566,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
