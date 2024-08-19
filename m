Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8020BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioGZ/hp0wz3UUqy/CL3pRvSPQwhfk9TTSEAnNzMRE04=; b=ayM9ZGKLOHzmE9
	Fw63fsdfgQD4KPK+/D6974qq9U1FbyXu4pHsxDgVqeXbJpUDSFINxxpiyQ9b0DRc37lFb6Ge4KkYw
	xoZanHbS2Uj0wyIky+SbjSkqKbFER6ymxVvK7YF39IZF/bkq2ehwDOnUfCCyA+9nTWrzGV4TMfXXJ
	bgZhsQfUEIg93WEX/vAzO6LUKS+LXn416JuV5LsZilJOUa2O6XJsVzfcKny36TYy3SvDe4pxKpgnN
	u6g+9eBuGJ257duhQNUD9Fxnf6Ay+bp+igcu4OBtmC8wiZUOMa1jj1PehdZNPoD8p3vWcDle8/WUa
	x2D6Mp1udMPZzp0z5yFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfxRs-00000000j7W-2YKG;
	Mon, 19 Aug 2024 08:09:08 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfxRp-00000000j6y-0QqB
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 08:09:06 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db19caec60so2611779b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724054943; x=1724659743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoQpEAbr6X6DF3JMAeXgzIajk1r2oZJlDoDuARKzu94=;
        b=FwfNrWcDUbc7D0Ydhadt7Hub5iiDmK9q+B0Xq1QoZmOPY2StlpFzZMXNrxpMyBaf+D
         VqlZdqkmgybbj31Z1omi58Na8sJyAg+lPIaHpvSQq5zN9OtyO4Aou7Smb0y6IWaysa+q
         VNSq88lyk2xB14zkdzkr5ks8+OmvrOt15XxujCgQ185JI3r2wZz3FaJADupYuoYtrGQ6
         94hLIK7/1GM5UApvpLtVy7yf7YvK/QB6Klb7AE2jJIO+MlsdXEa8580GOKxiIcm6K/sj
         2RI7iQ5aNLJv6qBSauXQHH3l6X6UmNGDXuN7KodTDWGkSbhaTcTS2uBng8Z69l4ik253
         a84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724054943; x=1724659743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoQpEAbr6X6DF3JMAeXgzIajk1r2oZJlDoDuARKzu94=;
        b=Gy22SGfMkCwRxwrf5R9Zv3FfcAewfacJm+h5FStNjZpBzpMwhDv2Gz2TZeyBXSG9fb
         obKgpb++98UDWSgNOoZKobzHTjL456ysiJN0ZYxKpia6yuuDymDuQZlGnF7oIhWS8Xte
         SO9K5RgFxuiDwhLi5dweZvOi4d+AtJAJxCRmcBfmgAmliTETBUJwz24HoWlK0Me7jkhY
         fDYYTJTs0FLM75YOrpvGx6rUtaV+jBVT5+gQCRNjgd+NwbQJaPxp078cfBAX4k5n/a9A
         bwHeBpsNMykdtWidIidyW7GUnbcjYnNZQ8gFB8KmZUU7I7Wen7edYsusiU5KT5X8y+4V
         DsZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYXVQOxSaGCtMBz/9Ly9Pv3DEExmLnyFRPLoIsJt/YatTy/vsZQWRG8rTNj35N192dfQHHkXT2pBqo+1Z7lNIJhfQCj4I1sFBZqTJQVThj
X-Gm-Message-State: AOJu0Yz6f2m0SLV66Wx+uJitaon8jT6qcfoiKVXzsCsLDuJKrODys8Ji
	5yHeI9BzEbEcKYPJ3AWsr1aieZIP92IhNpwo9RdXmZ6i47+bjGMN
X-Google-Smtp-Source: AGHT+IFod2ekzS/mbwOYQcZZfonp1HP9EFILJJlkZ+G7BPDhSISSpdEZ0Wc89uSKO0iswQcvNkw5tg==
X-Received: by 2002:a05:6870:4726:b0:261:1ffb:4ab2 with SMTP id 586e51a60fabf-2701c3c75a5mr12138640fac.20.1724054943340;
        Mon, 19 Aug 2024 01:09:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-270049f7539sm2795526fac.47.2024.08.19.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:09:02 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	inochiama@outlook.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH] riscv: sophgo: dts: add gpio controllers for SG2042 SoC
Date: Mon, 19 Aug 2024 16:08:51 +0800
Message-Id: <20240819080851.1954691-1-unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_010905_166057_53FC9D6E 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add support for the GPIO controller of Sophgo SG2042.

SG2042 uses IP from Synopsys DesignWare APB GPIO and has
three GPIO controllers.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index eebd6817520e..6aff718dba4a 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -99,6 +99,72 @@ i2c3: i2c@7030008000 {
 			status = "disabled";
 		};
 
+		gpio0: gpio@7030009000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x30009000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_GPIO>,
+				 <&clkgen GATE_CLK_GPIO_DB>;
+			clock-names = "bus", "db";
+
+			port0a: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@703000a000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x3000a000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_GPIO>,
+				 <&clkgen GATE_CLK_GPIO_DB>;
+			clock-names = "bus", "db";
+
+			port1a: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <97 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@703000b000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x3000b000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_GPIO>,
+				 <&clkgen GATE_CLK_GPIO_DB>;
+			clock-names = "bus", "db";
+
+			port2a: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <98 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;

base-commit: d9773e09adddf5cd69889545a5feeff119dc9034
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
