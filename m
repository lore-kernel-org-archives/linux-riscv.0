Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649C3C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvnisgEs4YsjuJm93mLeaYlJGi6GCvJTAc854KeABEo=; b=AvmtaJRXUriYUQ
	FFHNe6yKt5dcc2lzr2xNeihqU5EtZR/uTe1YR6ryGJG098Ialraqx52QYTn9giS+1ABdMQE6BqODW
	SEWkxzjTyV1km4rRsB8FEQS1l0eSUF9ucSfUyuBiB4IWz3+/bl/11WL5w5SpGachodMneuQg7S2Wb
	0f08HEz9WVr1OOh/LRZQJ9R+kdkWvOYce3Jl4VVw2cA75OEtLQpx47hxuHVihWYP1AAE0+wAWDhnK
	BULidtDdQb44nrPAoGH85v5wdqagHfYIs2K6N7CEvXV9rLzH62WzCDUFXlHE33M4zNQxSvLk5tQHY
	d2XaTJ8uoU/5E3o6qFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNF-0000000DE4k-3udC;
	Mon, 29 Jan 2024 15:16:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNB-0000000DE2d-2VFD
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33ae4205ad8so1417311f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541392; x=1707146192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJgRXuTMoAWmkGwVsSeykflT2WPb6W3nvYvk+W/0dwE=;
        b=SrsB1JM+wy37og/BnOrsmFKcStCnwmmSubu25VP/eaX8XSMEYozfiGUbxynOd66A5q
         aUIjhBkFsaTVRd/uZYwNGVUzr0TJ5YDGndVyZvIgwH6l8NW2T2ef6u2HpqnGmN/qW6G+
         5Mw5QlW50rTPAkdXK6Oo+zNjxMYyoi29+9sp8TG9bXd6RP5Bu6VklkT9yW82AKGvI2Yr
         AeQ11nN9RBP4Vxh+mON5Vs+foiYcMTj/wgQZiFI/gB08o0mZ1V6bGujLJhemvhLTtcF6
         sdULQMFTPADIfgc3STxi9WlCN9pRL8nmjQhuN53z8hr9E0H0YnRTueWIIV2/QgHdFRr2
         VDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541392; x=1707146192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJgRXuTMoAWmkGwVsSeykflT2WPb6W3nvYvk+W/0dwE=;
        b=W3hEE7rGnFHnqtMXwKJvgROlFma3Uk0nXiod9KWFEywNXX+DI4veMFgVpcDrMrWlJh
         l+JQnFUJ+qojzFDrHSHRZIqNaT+FJhsL7lX4443bYFAseEZxIq5KjDRcI58xbxh2HwMf
         Gg1ha35m6rBIqNy1JqBWZbBg0FzPUossbhbvTMEU5JT1D7/Rv5/RU4pYa4+SkhYi1loW
         GmdOZhuooOJ1xPIKh2z9/IK/SYUf8BN635SgtdqcqK9kM9BHXtctoz+zlZaGKsxgWL48
         3DljWsMDakgy/XGNMbdi0JZmvLtTV+/3nFYgmfXfULSNfsKr6GTeds3zAVLqPY2FU7TP
         Ukjg==
X-Gm-Message-State: AOJu0YwlwOBK4Co7nZWFFG6zCw8ISzozGB98RcUl7bb6pEvwOQJAOnD3
	xnXZLDSb+G5bA7zEV8exFTEEpR0QFRjnj9Vc2TDEPxeT7E3nMxx7
X-Google-Smtp-Source: AGHT+IFwq3XWk7GpIaGHC4p6tV7o7Q2uoZ+gdSfO/MQj7Ut/Qs87y1mR3yt8SnlfoQQg8m2U9NMLHg==
X-Received: by 2002:a5d:444a:0:b0:33a:e5a9:c22d with SMTP id x10-20020a5d444a000000b0033ae5a9c22dmr4041475wrr.25.1706541391673;
        Mon, 29 Jan 2024 07:16:31 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
Date: Mon, 29 Jan 2024 15:16:17 +0000
Message-Id: <20240129151618.90922-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071633_666048_F2679EB5 
X-CRM114-Status: GOOD (  10.48  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Now that we have added support for IRQC to both RZ/Five and RZ/G2UL SoCs
we can move the interrupt-parent for pinctrl node back to the common
shared r9a07g043.dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 8721f4c9fa0f..d2365def1059 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -598,6 +598,7 @@ pinctrl: pinctrl@11030000 {
 			gpio-ranges = <&pinctrl 0 0 152>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			interrupt-parent = <&irqc>;
 			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G043_GPIO_RSTN>,
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 2ab231572d95..0e931c88afa5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -54,10 +54,6 @@ timer {
 	};
 };
 
-&pinctrl {
-	interrupt-parent = <&irqc>;
-};
-
 &soc {
 	interrupt-parent = <&gic>;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
