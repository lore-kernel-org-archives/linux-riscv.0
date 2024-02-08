Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A005C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tGExyMcSauviKEi/QSbmQ+2rc06lVNrxmSjitG+UJ0=; b=d7WTdNhFaeJyIK
	1+9/NCEiScr9OZRuDAbNvcofp3Nrz3bvsatreX2uB+G7LIYR88zx/NpjwpBD1lF3Ff76Fi9mhFsMO
	Je4MuRreJgLPOnevb4hVIsLDddnT18C9wyomeyAXfOKr68q2PAyZ8ADt8/h9jyufwOOXja2xgRbFb
	Ofr27BwrRnWx2I6mwv6HkaAunvXwy61VkRt/MBMhBNSjsqIIbo6wlZmko1FOTAkGZ+T13UL0585LQ
	tqiiWeRIMEZsPyxxp+wS73hdTWk7uxcQxEmPSDQqk6yGwtxBEo0VuGo/Ops/CDuetGW12NO22XTOq
	V91phKBqu7ZXGOgnJZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kx-0000000DlVu-2UIs;
	Thu, 08 Feb 2024 12:43:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kv-0000000DlV7-3IuQ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so471818f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396231; x=1708001031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ntIc4Xd+YZj5HH2Wt0TNsIkkpEJY2U3yN2SR97JFpk=;
        b=MmFYasRWNEwN2S7DFquZprLjqLji9M+ZUAkj7tW+Jr+RBW6XMs9lqFOxMDS1Gjel0t
         Sf4JMZf9V6/bhuRETs4zJFBusb1j0CuZBOsbrtsjoWomQZM2jaTaXQRkEuZ0xrRX3OI2
         YRf1fR23pTVs4IE1cMcse8lb6TolksIvLB/GPxSI/pIh/a7MiHC8pGKtQXevHZ9Dxahz
         blNzmLg9l0vIvmbCTBi7xlA+TvLlTo7tt1FHLwl10soNn6v9Nzm+T7VhsGrgxGLKwWGJ
         0rPGoGljuA5sdVqZqaztkV5Wp7tScIMlVeTCvtjJJnBISm+MoRsmZKDTRI4vSyueQJ1K
         08tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396231; x=1708001031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ntIc4Xd+YZj5HH2Wt0TNsIkkpEJY2U3yN2SR97JFpk=;
        b=boU6ooVpNW6EBSxiudtQyV0FyTaMtg9s3a4O0BG+kmGJ8SzDjvwR2U2MPSyWYTRubl
         I6MrHTW6dqzq6utBrWyOeY2VukiIC8m+G5OBjoGP+T+e39ALFt1YTxiRnIcjGaBvG8ww
         ToaeiavsrjsBFkS0TrK8fxKizG1zTJfc1vzWNLQ2jAoTN2W+3pWbHx2m9+xwuXHH5fFg
         BQdeAq4+h5q6w5sipnOGTMYIcPYOHRjJXl5JrUV/X1ApmwOK1HO7jDG92Pv/14BWFrRW
         /0G5gfZCmDvQ1I1Gp0ydHCLj812R6oTYm4nj9jex+s1NYX3c5qxjLHr17jwNLFGd8u0I
         8kSQ==
X-Gm-Message-State: AOJu0YwPleCpkjXre6reXQgpUzUkfnod5XIc972Egm2FoBKGHRmJm5FG
	zbhndRVih/9WcuyQRcjGi7Pn+AnRh/W108lQYJkgtAL3q6nNojBgXQ8BQSuLLSc=
X-Google-Smtp-Source: AGHT+IHVs2lCJKy/UUZC1BNBkvIBfeCLLHIO7OTiYKoC1EFECe4p+YbLsSs5xxIM3yw0i3cximWUwA==
X-Received: by 2002:a5d:5392:0:b0:33a:ead3:6438 with SMTP id d18-20020a5d5392000000b0033aead36438mr1921387wrv.33.1707396231405;
        Thu, 08 Feb 2024 04:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmFgAW+Skjw1lnmXbQXSf/9hq51jiHJjDAVQk/4K6QzmOq/O9rXIdU/p6mQ301ukgVBqm9o3SqZiK1KTEZS371ZL3D8guYUX1220vQ3lKtetn5ReofmJLqM8ihrVHEhouSo5NuTYAj7t38SFPmAoUEi6yDYC7hiJt0XMBmT+6lRYSy8dB2bKZCcMcd0e4nEGhiuqi82zhv9PJbv40h0N2C+ECiFqdOM5OP+4ha6aqrH44Trrd2RCMpVVre6hcviWQTMbcXaUhhjoN40hIwqfMFbxkWD/J5rfQw4c5bhFAkV0cb1O9Xqh7B1QC3WCjE0Jkrp6qErRskPMFP6uw18A+T1jmp+CzLOWgzUWRN4sKgD0a0fvJ/vyScZAOGAqsqdOGlu0TQC8zDOUfI6QznLcMJ0zchmA6kwKVRexIaqqZyLujTcQkCUTWAkVjraYQiQivt+PjbJcpI1ZK82jFTbdeRBED/3HtxNN1kXdnvthvusegfD9NCOY3o1gQinq6MiztY6j+yw6aygjn4izuKrWfTXUwl3n1zurce98xOwIMlKNH0iQaU893nFZbgkDsu3U8=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:50 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 04/17] dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:47 +0200
Message-Id: <20240208124300.2740313-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044353_853618_F33A2A8D 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G3S (R9A08G045) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a08g045-cpg.h | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/r9a08g045-cpg.h b/include/dt-bindings/clock/r9a08g045-cpg.h
index 410725b778a8..8281e9caf3a9 100644
--- a/include/dt-bindings/clock/r9a08g045-cpg.h
+++ b/include/dt-bindings/clock/r9a08g045-cpg.h
@@ -239,4 +239,74 @@
 #define R9A08G045_I3C_PRESETN		92
 #define R9A08G045_VBAT_BRESETN		93
 
+/* Power domain IDs. */
+#define R9A08G045_PD_ALWAYS_ON		0
+#define R9A08G045_PD_GIC		1
+#define R9A08G045_PD_IA55		2
+#define R9A08G045_PD_MHU		3
+#define R9A08G045_PD_CORESIGHT		4
+#define R9A08G045_PD_SYC		5
+#define R9A08G045_PD_DMAC		6
+#define R9A08G045_PD_GTM0		7
+#define R9A08G045_PD_GTM1		8
+#define R9A08G045_PD_GTM2		9
+#define R9A08G045_PD_GTM3		10
+#define R9A08G045_PD_GTM4		11
+#define R9A08G045_PD_GTM5		12
+#define R9A08G045_PD_GTM6		13
+#define R9A08G045_PD_GTM7		14
+#define R9A08G045_PD_MTU		15
+#define R9A08G045_PD_POE3		16
+#define R9A08G045_PD_GPT		17
+#define R9A08G045_PD_POEGA		18
+#define R9A08G045_PD_POEGB		19
+#define R9A08G045_PD_POEGC		20
+#define R9A08G045_PD_POEGD		21
+#define R9A08G045_PD_WDT0		22
+#define R9A08G045_PD_XSPI		23
+#define R9A08G045_PD_SDHI0		24
+#define R9A08G045_PD_SDHI1		25
+#define R9A08G045_PD_SDHI2		26
+#define R9A08G045_PD_SSI0		27
+#define R9A08G045_PD_SSI1		28
+#define R9A08G045_PD_SSI2		29
+#define R9A08G045_PD_SSI3		30
+#define R9A08G045_PD_SRC		31
+#define R9A08G045_PD_USB0		32
+#define R9A08G045_PD_USB1		33
+#define R9A08G045_PD_USB_PHY		34
+#define R9A08G045_PD_ETHER0		35
+#define R9A08G045_PD_ETHER1		36
+#define R9A08G045_PD_I2C0		37
+#define R9A08G045_PD_I2C1		38
+#define R9A08G045_PD_I2C2		39
+#define R9A08G045_PD_I2C3		40
+#define R9A08G045_PD_SCIF0		41
+#define R9A08G045_PD_SCIF1		42
+#define R9A08G045_PD_SCIF2		43
+#define R9A08G045_PD_SCIF3		44
+#define R9A08G045_PD_SCIF4		45
+#define R9A08G045_PD_SCIF5		46
+#define R9A08G045_PD_SCI0		47
+#define R9A08G045_PD_SCI1		48
+#define R9A08G045_PD_IRDA		49
+#define R9A08G045_PD_RSPI0		50
+#define R9A08G045_PD_RSPI1		51
+#define R9A08G045_PD_RSPI2		52
+#define R9A08G045_PD_RSPI3		53
+#define R9A08G045_PD_RSPI4		54
+#define R9A08G045_PD_CANFD		55
+#define R9A08G045_PD_ADC		56
+#define R9A08G045_PD_TSU		57
+#define R9A08G045_PD_OCTA		58
+#define R9A08G045_PD_PDM		59
+#define R9A08G045_PD_PCI		60
+#define R9A08G045_PD_SPDIF		61
+#define R9A08G045_PD_I3C		62
+#define R9A08G045_PD_VBAT		63
+
+#define R9A08G045_PD_DDR		64
+#define R9A08G045_PD_TZCDDR		65
+#define R9A08G045_PD_OTFDE_DDR		66
+
 #endif /* __DT_BINDINGS_CLOCK_R9A08G045_CPG_H__ */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
