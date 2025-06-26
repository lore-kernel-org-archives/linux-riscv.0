Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B8C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3IBV4K9PkIAQpEz2XKSUK26Vi786NGJW5vWCsLJuGQ=; b=uRH/v9yQdCoXfG
	Q0Ml1Oit4YNvh1T8lEMFVVTb13XzLMcj8n0yTdm1EssnM2PvwshAtqMJCbNR6aLWNC2cq2gk0svuC
	20IDKneM1O3dBFB5SAlm31ntpWTAcvlpDVCyrow+/9XXuCwbePU/OYlGylpWIYXGGfuvCGel18w10
	PPqSQ3PEULc45GjH6ufYu9tpmu4ye9IOydzN/TC6uk0PHSF2S1ZnJA/CjuRfiOyknb7bzNdJb9nyr
	JOMwKuJGj8vZJJHCcyHS7FSYAOMbVAaiV/488SMouCpeFBHGy2Gd9XjR8scQgiz/r7gv7Gj9KbzV2
	gFDzQoug3Y7Z/gkYVq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhem-0000000AtVn-1Iys;
	Thu, 26 Jun 2025 08:08:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhXs-0000000AsPe-0DIW
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:01:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23526264386so7376775ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924879; x=1751529679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFiZF96xm8hXJ6qEv7hyvXI+A/Fh5sgECxhLDPhb+6c=;
        b=B6Z1aWAUFUwVPDTujZxpRllgz2m2JxVlGSZw8By3L8VQEWkHbG8gcwTJphyyh8++Lh
         axH8E3j5EU8hPSd2zCeLJL0iK2D8hMEWWWiiYut2qm8dBzHMG4FDJ6c4L7/zk60nvg0Y
         GQpvllF2eNTOvmsYlJ2r/3B+lVFnd1v6la/LYYOSWBlp+m9S/m2xJk9qZuZ8Te8mPB9h
         Twu1S5dLTxEJZAhFhOL7QMsbhwgf++wNya/od9ugVGNEjc/5zlMmoJ8tgooK4ckek1IT
         YB9vqEW+um9J6n4oxFbGTx9HvuXr3qKrkIu12RADJyKfAnzcdZ3qvDg5XYDifyYJKnW/
         QbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924879; x=1751529679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFiZF96xm8hXJ6qEv7hyvXI+A/Fh5sgECxhLDPhb+6c=;
        b=hdsfvlx4oDUi6i6r/EyC3B0cddz7tG4FGLixsEpo9rmjUfsEoylZ8yGjLsB2Gl38Gx
         HEiF8c4dzyVsl5MrScYnWuhGL7D5f1gCXvRX2W011jDqwDrRp9/SFZYzvszawUe9sU/X
         ACJcSIJF/7IWcP4cnSa4eQXIQ05RheQOmnmPrIRq0XWGuyv3kzhOqpAs1k4k+gD6A7Tn
         TPZBMtK448Uq6jm5VXdiPO6Yxi5vaVYZjIMG3Ur3U4I+6QQfq4/KtYAuh1seyjPgi9id
         qV0jJ2TLLOtCz9NAl+uZLI5XB9fxfWKouhlPbNHHulPU0yhSnzCm5ikF54FLbfZANOe6
         SDHA==
X-Forwarded-Encrypted: i=1; AJvYcCVqMrv48ksp+kp/Kmqjag9DF9BokYAbrf3Xz+XWNao7mtz8ReKp78q9BwQyJNHZdtu/52h2xUM7sTovjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUl2mZEn40kf8gyuIuXFX0skPL4k36snVRgs97jZptgwsXmlKW
	APqDCbzEBgQVegqkOSAXCArgiHacRd2LvZOhXl5y21hM8qRTYTvVXbmF
X-Gm-Gg: ASbGncsDVH9BYWh/0ANMKubjKZEA6bOh0rguChIjN4IsQml2g5sfPXepCPkTfvNhaKD
	TF10FFi0sU8eakM86TKWSg4VFz0OwzQXqkLoDmjtfjUB/xu3hwHjz6Vs4eMaxqLG6YEeMAxooWJ
	Ajuq+M0In0Wfa3/wa6toVzdvPSGLaVBjFJDBQ6/AJ2+7NOSNJgm6gMsGol0JvE7D7z0WobVgxNL
	z5HFEmFYUXeZCa/ni4bzp550glzPRhwNeD74ljGMBH9Pqn1LZYfCbjPSTvgKMSjzCMk92dFbLMm
	Nd/ELXRC/C1Ld87leRbxjYBMfNAKClHDbUxZprwsUeixhx3DSWOoN6aUjV+8tg==
X-Google-Smtp-Source: AGHT+IEa1Hm8a3WI+XQ+UR9EdbEMJuz6B0Te5cpmW0w6UUDcyQFF377cGhIUp8q+Q++YcoVyKJYXMg==
X-Received: by 2002:a17:903:22d1:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23823e51556mr102958175ad.0.1750924879294;
        Thu, 26 Jun 2025 01:01:19 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8393249sm149406985ad.14.2025.06.26.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:18 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Thu, 26 Jun 2025 16:00:53 +0800
Message-ID: <20250626080056.325496-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010120_114680_5052F169 
X-CRM114-Status: UNSURE (   8.13  )
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
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..4c7335ff93a1 100644
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
+			external_mdio: mdio@80 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -196,6 +223,8 @@ gmac0: ethernet@4070000 {
 			clock-names = "stmmaceth", "ptp_ref";
 			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
+			phy-handle = <&internal_ephy>;
+			phy-mode = "internal";
 			resets = <&rst RST_ETH0>;
 			reset-names = "stmmaceth";
 			rx-fifo-depth = <8192>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
