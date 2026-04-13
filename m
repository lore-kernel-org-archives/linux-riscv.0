Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0EFEBFD0F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y86gSPUx0qTpqLuPjbTCtDWX5BTfL2GxoJVrdRh6FA4=; b=lZ13lpbJnM2R3Y
	sL7LNgCyGzZ27zbl1Ume7OnJBTEzm00KDZrMSIostMoJqXfuMGMI7gFxQ9NKX2ZyyDIuXhn6DqbKQ
	4E04MWjMTlb+xW5ZUE8mL6uxq8dOxMSIgtq8La99maWt9i3t2JOB+omTvylqYA1Ykq7FlYQvuRba3
	bvzDzoKYnjCFEhFKdcBJnfaYVgjln4LE+AO6x8P3v0Md4+Uj6Q1zynC23kmw7NrnjZ1UHWFiurUY8
	8UTAPYSqiMCr7E5zAJNALEB7pYnwo3PaWCvuJu7QhcBwrPCDoMvacqrEFqDgN7q9yvFfPogxhXXnV
	YcqDwBd09U8yr2a/5u7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFx-0000000FDGx-3qtC;
	Mon, 13 Apr 2026 08:02:53 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFv-0000000FDDw-1jil
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:52 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c745e18a0so471202066b.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067369; x=1776672169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=tCC6r24OzhhTcmjaoU2q7FEJS5MjOkotynRgcpsNiyaFrH8Xib1iyt45rcaQwA1Px/
         Ra5tB+gUYG8MJSADz8EPE7pI2/MjnklEEiZpfXt6LiB/A9LNGbuX0QdwpfbyKEt56o34
         /n9VWN4E4P+6Dr7dt5CZ+BZ3lysla0AkdJ6lh0Jb8XbpKqjuocVvJwvxdv4YR07bbLLa
         x9wqJR8ybx13QuVj1Bbl7X9XmLvmNNdbRv1/4ZKkWRalTz3ZmcCNClu4ySika8+Yu3W2
         zVvQpOKMD60Q9AQq/1hYwupD6E43jOHshUxcxlub0HioNflqE3T/1TeIYnXSVDjUhHjg
         +ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067369; x=1776672169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=SWFR+EUDKlBKWkv4BN0xotlpRAgkuQBXhXWRo3KTukyQjxcN1HS/bSNuzweJp/YKK0
         Z+SjHTygrQRvy2Bd0suri2XUFVWmaLnQLLT7uiLgFGnWeDtggwyY+IsJdRssBp0b9EpG
         pg52pRq+0ToJHo5nC4DmgocxXj1nUojzqaecT6WP6VtrKtOm/yvvsPtrJ0qdnLAeAtMT
         GYSmIdjt9PGn3zMyO9jW9NJlUkMhYvA/1uXmYNpyDZLetzvWs/oLe3YEWKZNjkh1Qwtb
         qW2ap2PCv0JLXVtLtA1uhGiHdPSiChmVr/7jdj7wDfrOEPieJRKesMc4Egct9CAHbNVt
         CdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN7TbP31A3EUFKu5O0xen1lc4gJKKufJqsfg4GaK60cxruJgi5zvkukB9+m+WnAa6jWRbasEqtXPUuNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8P1TlDZTmsWhEz8gs8TMTXblPRlIhuQwO4H5vKHnoPx0552Xx
	NRYETrcCVbMOnMsdWEePhNJnz2pSkStyjJx9cqjxjUtepn1JenBLbQfL
X-Gm-Gg: AeBDieunLqD6OuWvMJhwGrXa0M8Kwrp6bqk+M/ZgbV7fGO0fdIr+HHmYtwVffJG6iWl
	JUVnaUlLQiP1go/QOcWGGLA8eDneVzEZZQe2pOkTpUA42BsqguyoQqIhHFLdPV5nBZnK2f9g8Wa
	wfXXL2Pva2584lUWDSa0OIrfA4VlrrXpJnLKGnoO3H3hcM0g9+V2iQCwYt9VjrKpjW7TPg3NurI
	afIKAiC0SNy31ZDHJPx896fZPnHfQ2z/MJuxP5KqAHSUUk9oZKULWk4ZZW9WohWrRcMsXMdB9Y1
	sZa125xYq7Djn9IIH/H+lRygzZmu3mzIrXxHpZi/x2rcjEDpztNwXHZb22zlt/+aNwGU7ZCzMMM
	nCOrdXvpp+2stZaKlUi8AaR/dfNbX140QvXfml4BB+IhlWXLiaKNzQXvlEGqCROLu1WSF1p1n/L
	gd1CcQJoaMJzUpa9Yi/zn/4t/YaNP/UHVhQb7yQIql8EFsLTbRphpigUDnIGQsDsvS1z1M968ZN
	us=
X-Received: by 2002:a17:907:60cf:b0:b98:8494:3174 with SMTP id a640c23a62f3a-b9d46265d98mr798014566b.24.1776067368357;
        Mon, 13 Apr 2026 01:02:48 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:47 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:16 +0200
Subject: [PATCH v8 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-7-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010251_466892_ABEEF6ED 
X-CRM114-Status: UNSURE (   8.28  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
