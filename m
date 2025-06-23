Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F6DC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 00:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iQGgxCoLdxPCQnTV29lWtfiy5/BU5QpR78/cLgvkhc=; b=E6XLhAf9d7Uarb
	3bphO9FdYiM7y3KogI3kPQSqRXzcrx9SZDOSeYYypwjFJ7LbTf9IZ5yEuWEowGxzKyMrJ2GDB1DP2
	IokPFi7K9W0Xcr4Frwdid5QTsD36jOFzQPUoqaHIYuhCQA9W2WIzuGlhDDh2JnjT4u3iFYsl3uxZ+
	ZDW7fu6lQfUZmFuqAzRdA5ng0t6lMXM9paHz3QCNiZefkSn6IoDA2zZe/cTZjZe6QnKkBiieC/bpi
	S4FX4VpTpFqLJsunAvXzp+nAVIa0qsjOF41GLz8mI4V+3s/6xY0bU7RZreXg7lQVboMHNjx3KPppr
	Ueu08MiM4bTd2eKHjLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5b-00000001M49-0KOL;
	Mon, 23 Jun 2025 00:31:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5Y-00000001M2m-2a39
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 00:31:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-234b440afa7so37033385ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 17:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638668; x=1751243468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3DJOTF+zABOGXS6R+n2iHwCpUm4ATi4UcMKKDrEt9s=;
        b=Ux/BmKU9qZBttxw50Jjx+9eDEsG+AJ6IyPTUGER/DaAfiFXPeNbv3L2Phf/ddtwXOk
         2T8dk8wxUN6JZC8mYIIxMj1cdlmsHMrpiKnDiPwnX0j1AhEPLZVv8bSo3NhaJ23wzpen
         48alyCN4Ot1GrvNv2IeuyQkju5g3zJDjfY8wv5c73mUQANGsSrPAW2JU4363wH1gZETT
         drg3MKF36tMHrVPkRKJXTpgMe0XAN6qzZh0Wm5Pc5qLSf42HWQYpM/Z/SlxGpy2Q2VOz
         7QC4ofJBJGHVD9d3HmkeBY5OOJsVv1eX/L+2lM964R3LmzMd/KATJYs3V/tq283i/t3+
         F/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638668; x=1751243468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3DJOTF+zABOGXS6R+n2iHwCpUm4ATi4UcMKKDrEt9s=;
        b=aTInemgr69RXAYQtnfvlK7w91cApDYCpPFlzuNPbZ+eTjnPXvdHw+V7u+gq3HdIoH+
         Ylpexm9DCOs2QPm2JVSUVK+wLvzGq8jdKqWzyep4mTHL1RKbAVZpRlBZ4HIs32QmIYpn
         Q5NwnOCwxDsN5WLBjOOUH8PBLKlt+3/ro986LqxeJCFI3tlzyNI/TOgQ5JurHNLQRCXr
         5ZOiCQlN4SzY1kT+IE2Le6nazY47tQ1NJSaYWuDursL67vICBGTElnCgiKn7AR0gAMII
         NjwVUMQXUJQIfryc4QJ9gDuPTk0rYCWbEzzw5yb3U3t53bpNw/nAhT3s1DpQLKpC1t59
         bqWw==
X-Forwarded-Encrypted: i=1; AJvYcCWzCpfpdflJ9AopSmcUm/i7Lz4AXwtgdca9/i9Gb+h2xRf+bzJtq3DjqOLg39JGsm1B+HNXPbsV3EnXow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLE846RMDWD5nIZeowW3oA2f60FH3ODRINB257W1+FPlMFRqgy
	0CMF9jGJHwa2FMoQS9qnT+2u3E+1gLZH7lbINDS1VPT7R5gHpDq6KYqh
X-Gm-Gg: ASbGnctPJuwB+IIk+WcGaaDz/DWJ01qEAiPP3x+XubtGCTj8GWleOsKYT//E2SLzpgc
	Z9iT+1FYmWts0PjZGyahOVBrDOSdZMu800QVw/0g1oLcrAU5lPF4Tilq8+cvEpkgAQDJE7v4/oG
	XxO598cZHhcQFVftRZQp0RnNmBQbXlN65yUHssXdIoPEdZMwZVjOpt8IsZj1FpsoO+R99XY4Yyt
	3iNlm/DskPy5fU3rSYq+0ybynyLkh876JGmTwkEryRktLQak36f3D7Tr0fMICKh8WwGiTITpKsY
	RbYVmJjnhYYlTjUxorZEOD7UXGembFRyowZYkKcG8ITwR+FnjMdv/JQC8avaJQ==
X-Google-Smtp-Source: AGHT+IEPurWQUxaEWPyN4+mm9MSHoAtR/TSkQSrkdqynb1L9lfATLd6vGy5CZaBedpCYL0fvbN+EeQ==
X-Received: by 2002:a17:903:2305:b0:233:ab04:27a with SMTP id d9443c01a7336-237d9a746b0mr174827965ad.53.1750638667818;
        Sun, 22 Jun 2025 17:31:07 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d86101e0sm68637875ad.96.2025.06.22.17.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Mon, 23 Jun 2025 08:30:45 +0800
Message-ID: <20250623003049.574821-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_173108_651007_0BE5EBAB 
X-CRM114-Status: UNSURE (   8.52  )
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..01deb27a95b6 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,33 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009800 {
+			compatible = "mdio-mux-mmioreg", "mdio-mux";
+			reg = <0x3009800 0x4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			mux-mask = <0x80>;
+			status = "disabled";
+
+			internal_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+				};
+			};
+
+			external_mdio: mdio@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
