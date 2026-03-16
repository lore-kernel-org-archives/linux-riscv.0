Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDF6F506D9
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7S/gRMZqD0fBXb3OCRdashsK1J+At9wOuomWexcprAQ=; b=xKG8mggbYbn78B
	LNXmO42BTc0sx6aFDz6kbjGyBN8zEwXB/8o2IOka/n8Tcbrm8OjOfodb8eyg9N0LhV8y/SCJwP4yX
	5G/JXyIYHlF+YMY6zhobp1qV41+7QoeACFm7NkQYk0Q7+X6T+7SbkjWmF5Raknq+WlTlGWD/w0TgY
	UDsZqInfBMYGOuBaMplQVUIiJ0gIfqrHcs2BEnEL1LYunc0OoR84YwyOkjnAe8i7717nC1/70yBEu
	7kv2Dthi0ateijvi3N1njD/Tye27u3Q+w1hAhG5BH9wg4QPabYHoXmStUkKub7wDqvh9YWeUY0Eht
	77dzF5NqL4CZjqDD2AaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pk-00000004ARX-2DDL;
	Mon, 16 Mar 2026 14:22:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pj-00000004AR9-38Zj
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rCiQ7r9hHEhSUVh9d7R+U0a5N1ipko9lEeJud3TU6bk=; b=awKBtkcGZ0/wTSTuwpaT1MdyYa
	p7pBkMKZ5o7jtPdmvkmZiLl2Og0RmTA7wB5YnAytGz/xgpgZsqim0sZ6lc4VeZyUy/Dfbqp2rG/r2
	KICyNmX1Jb0dBO6IPDK1urf5fzG8Ra5KDPdI7mjEXDHd7jKXTcN3Js/vyu1VfsZdr7Iy60t+btQ0f
	NrXs6uMOCOGXiaYp/gz20Jf/rQQ6gPjl7YqhsxVL4skWi/QRe4GDlO2HsAAjrcDThOomWqY9f0tbI
	g1GOYOGeyjCrvh4m6sLsqEoSa9rHOwNlasJMAYS8kNGOnibN+ddGAZLrV1cwTOBwqSLOTLo6oANfW
	ndrZ0Y5A==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Yd-00000006tev-2OU2
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4553298f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669874; x=1774274674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCiQ7r9hHEhSUVh9d7R+U0a5N1ipko9lEeJud3TU6bk=;
        b=gD64GPOn4ml6Dudpmxkg1oU3RP2VFrmP/CgnTvWWi3/Yt0arSTjVMLDf1ABVsf4Wud
         eIxiCTJYHW+38X8H5X0CpeOU2a7pBulsYAmu6TYM+I9Xhb0KmaQeL60CrmeNUGGVnK+7
         uG5AK1FHu/jw//MpNFagpJtQKUDIa7agaRu8cVol0Yvvpce7LZxpZt9dMC/9dezgQIKD
         ic0bgrTdcNm/ivHspi9sUZzWjBZnj4iUPMR8kM/aQkZ7Im9r9Jcq/OhuxHnPAVYgjI0t
         LNYYRgmDpZxxDk7FD9t3S5Os5lbxRyx6NJTIpWgk8HiAiBgsrxJIY5Q+sYGGHSQ89B1t
         P4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669874; x=1774274674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCiQ7r9hHEhSUVh9d7R+U0a5N1ipko9lEeJud3TU6bk=;
        b=bUMC0oZ+PlxFwMacqKpRrgOq6eYipMAN6EItCKxEHstjUj7piKtEqFBBVws52Rolx8
         FVIJ3s90uX8+M1TiiN3dKQ4QpLoztV+MsDwXGaMXQE2wYt5GpnCFMA+pqhRhy8uxOnzl
         R9D6rxlGT2rwhiDCuA4ac5t9wTrGnQlFZ+NdQcZ+jAbjwW6veaGlMb2VMg/mQToOMSCg
         IzK96NLFgM8A3N7hELfO65xcE3ucARUVRpQvxBnJVYASU5qlu3Wt3g9dgb/rAhyt0It/
         CTajUZDKx7zhbCX9KlYx+MkiMwxIXvdAMNHOGya3jiKJYCVtjOr192SGjGO6FH0YeT6/
         cJRA==
X-Forwarded-Encrypted: i=1; AJvYcCX0g/Wzlw7Y/F4hI4Bi1Fev+sgeIyY1py2pzaNjeHilX6YUh2YNjMX+AaEz3+RZqE1kaCgY0YtNwzWMLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRVuLYj7XRmVhozVbHyMSZINWg2Fr+qlDHAb5S/dwh4zVu0Gc3
	v5rxcqIbr0LF55E4OOjYPdy7M0z2sUEt5RxAQxi/fkZL9Uy3/VGIGBTp
X-Gm-Gg: ATEYQzwsKYkQWE05fJ0NqZIBsUESTyO0CEyt2icsmLJ8ory7QhHYFLZdjfKk3Yj4V+5
	tfR9lsWEYcqQ3QmNPQ3pI28OhICz1HUAWmba+8u9uTuiXnkKVcyQW6NTdYs1e25CTaEQaRR+uBZ
	j09PhIugYQ8H9SZib2GSVjsRbDTBYMAjfUoYGlIVdZ6S7Wy0Ebn6FKP/Sre/VWx/7Cvl6kBh2FH
	yZa9oJrCb+JhYFETZzZN3EuHtkUZLZ6wtpgP7mIzXyUL4+y2qcOSZcCkl310O+oVySsSJNuZC6V
	1SfvfHlCgkvyaRQiivgnLE99VzZnb9ivF6EScn/iAqVsX5Dt+HQ7XhofKupPwnHKbGPiOJIyTWm
	dpr7zBQ30lXRpgDDm4M379h2j1YWxq+BzJJBmifdfZEejCVQEVwkowj1mEs1Enz884RsQ1C9qT8
	ZemUNs02VrC3wHGOotqEKkpltuje79ZUcBN6Mt5j3ag+GbIrKgd8IiOswHRnV6Fj9m
X-Received: by 2002:a05:6000:4012:b0:43b:433f:48a9 with SMTP id ffacd0b85a97d-43b433f4a42mr8024247f8f.15.1773669873688;
        Mon, 16 Mar 2026 07:04:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:32 +0100
Subject: [PATCH v3 4/7] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-4-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140435_711326_622C9513 
X-CRM114-Status: UNSURE (   9.53  )
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

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a2abcc0cb88f962053 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d2015201f8e5adff8bda75712036b8dc2b79bcb5..3952c4d0ecfb26e9d215955ca8791243bbd1dab7 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1211,6 +1211,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
