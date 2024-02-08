Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D741BC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVt3dd9kQlKACiRMpoofXFLEIRHqYHbJhdshJj/Mdus=; b=J0CzH91iQGegvk
	lVCj7GdZ9XIuE72oZPnrP6ucGIFAg+/5BXNuF72b0dvlHkS2mCxLOl4HPXbEf03U10XvrZXRvuwtp
	cclOR5pVBNpZYZot+5bG8gYLZ3hLqNVkT/nyHZ27zEvFVXXPvwckDlp38KGPcTSBBVW0IZ5u4NecU
	NFNzGiu35ubxPDbY6q5Zf2WhG3mh0QrLFHfHwdr94pQ+1mMtRwaoImhQhmSHyun4xzKZIY8TQZX5S
	Rlr6Qu6BM1IZiRC1CsXUnv6twJDd2Glibb2lg/IrLfbc6vAYAx/8aYLq2rrZAObygBD6F9jwYv4zV
	70Im3FbW+YyR6EdDDvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kr-0000000DlUT-2dkD;
	Thu, 08 Feb 2024 12:43:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kp-0000000DlTE-2fl5
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4104dee26bfso899595e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396225; x=1708001025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ow+faT4hgMer8zeJzCqLwdgg/8xRAzkk8KZPmhSWKQ=;
        b=Fgw4vHiR0afilDSMZEcLKJSfD1J97MDVe4AnrUjsf+ysIlVq+LDktf+lcmTbfHGGVi
         rMRhknHdKPsn/wXPrFMTml3l6UCdfECqAjRq1n7WOocgv2lV1/5Uizxx/Ngg99IxGm+o
         lwPblSjIKrnY5bdN1JwkvJ7P5v1q49OcPAF49/WJqNg3g+6q1yEszXOXnl1scfqWyyFJ
         MT93bGIm4FEIif4nfIzhBf4/SRbJIHb3fu//utJQ25lYpZLroKKCboF4GHRRmaI30s0m
         m+b6PS6lqP7aqrPqvYVAq4djcSpiT1HcPGxvvYFSBW6Sd1hq0nYiz/yqQHlrHtul6FK8
         gY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396225; x=1708001025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ow+faT4hgMer8zeJzCqLwdgg/8xRAzkk8KZPmhSWKQ=;
        b=n4tY4o/nFAuw1gaZMdps3/LmmVTUyQmYpiA8KAJ8APHo5zKrhLgtz8f/DD6xIjtUOF
         WEfeAhds2u6gLiEiyE47fpfZd5pvO2IbA5qUw/tvY8kaUB3IJ9pt3tEKpFWXuMWLrhvt
         40Sa75TR+wxgVdshfxOVjG/+if4UQqVcues3J8f8YSY8napuSiYNxSOi0VFGrYBR+/7y
         Q7x3cRlzi2cHXbNJYrypgcbpYAgvUJI+yyuyP+1kHDau3diavufRYrGkJpA2HckveC6w
         kCfAafBq7Z/Xh/BuDA9KaHh90YxbJBHaLBjj04J3G7mvKJWJI/NKnN7X3rt1serBKGMA
         mwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+mqJk1cqzRnQCVOxttbDP5bcz+2KIbtxMlWfJWQES5Bur+v5JMsUntEorrhD3PEX0ssRFgg96jg0GYw8cEL3/KE2duauc31Zz1bsVAfPH
X-Gm-Message-State: AOJu0Yz2JKHp40uuGady87l3FUJdJuGOfF+yEzaBrnH7i3MV9X/zhSfM
	WBhdPrs/RPHGV7LexwfDZs0DOtiqgU6O0YhhQPb/VF2Bk+Sa3saLLQSk9At4i00=
X-Google-Smtp-Source: AGHT+IHyicTpunbhbhnX+rjeXPskzEszKwXMf0SPmU/yTPpq6ZhIJGuE68xbAcSXHbFjDoluo3Zw9Q==
X-Received: by 2002:a05:600c:3541:b0:40f:e284:d785 with SMTP id i1-20020a05600c354100b0040fe284d785mr6290809wmq.23.1707396224891;
        Thu, 08 Feb 2024 04:43:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVVGi/xnS3MAkwMqoIWQk8nAnvu+37WZW5Rvi60gWHp7p7RVZzIJ4HNQRvIwcBvCRJkmrEZ1VUPOz/UMIEx4HzJ5O5RxsaZ2di9pMwILrqqGRU5rnfoXselU+h6zphoB1TEdFCRxx4uxKhEjeqoAi07NcnfH8Y2/IYIdFkmHsWeWIU6GjenGanoI0bnGwkIaNy51dpyf4UKnvQy8NRE2PWPmlhcCXQc7DpC56DCwBPpZVxLjXkJu0AoPWVkAIlGSsbCpS93Wkm3/6y9foLKe8ki7pxY820sJ7vtLaDyfhTKR7DQT7nCxPiAFVqgcmjE79ik68P5VkYX3LTdDw1GyDLnFdaSYbyCESSJta48Hvzl5A17nvO5/BChMTMM/u4tOBb3kTFl4MjniicR0/Dzi0nR7mJ+wu5t21NkE5q3A2ZDuvcRZE8BdqkAbsGiSn79Mhckj17wVFiXE8NGD+U/3jivnI5ksRuQynVniZjj1AhJyC+Kq/fBhaJNgot19KuomeJa3oLIeg47tVxo64+3bbIH005or6j9Cv27ZyFGwqQiiuCvmL9tyYNPPwhTPEHp64=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:44 -0800 (PST)
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
Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:44 +0200
Message-Id: <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044347_700185_1DC27B55 
X-CRM114-Status: UNSURE (   7.71  )
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

Add power domain IDs for RZ/G2UL (R9A07G043) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g043-cpg.h | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc7..eabfeec7ac37 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -200,5 +200,53 @@
 #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
 #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
 
+/* Power domain IDs. */
+#define R9A07G043_PD_ALWAYS_ON		0
+#define R9A07G043_PD_GIC		1
+#define R9A07G043_PD_IA55		2
+#define R9A07G043_PD_MHU		3
+#define R9A07G043_PD_CORESIGHT		4
+#define R9A07G043_PD_SYC		5
+#define R9A07G043_PD_DMAC		6
+#define R9A07G043_PD_GTM0		7
+#define R9A07G043_PD_GTM1		8
+#define R9A07G043_PD_GTM2		9
+#define R9A07G043_PD_MTU		10
+#define R9A07G043_PD_POE3		11
+#define R9A07G043_PD_WDT0		12
+#define R9A07G043_PD_SPI		13
+#define R9A07G043_PD_SDHI0		14
+#define R9A07G043_PD_SDHI1		15
+#define R9A07G043_PD_ISU		16
+#define R9A07G043_PD_CRU		17
+#define R9A07G043_PD_LCDC		18
+#define R9A07G043_PD_SSI0		19
+#define R9A07G043_PD_SSI1		20
+#define R9A07G043_PD_SSI2		21
+#define R9A07G043_PD_SSI3		22
+#define R9A07G043_PD_SRC		23
+#define R9A07G043_PD_USB0		24
+#define R9A07G043_PD_USB1		25
+#define R9A07G043_PD_USB_PHY		26
+#define R9A07G043_PD_ETHER0		27
+#define R9A07G043_PD_ETHER1		28
+#define R9A07G043_PD_I2C0		29
+#define R9A07G043_PD_I2C1		30
+#define R9A07G043_PD_I2C2		31
+#define R9A07G043_PD_I2C3		32
+#define R9A07G043_PD_SCIF0		33
+#define R9A07G043_PD_SCIF1		34
+#define R9A07G043_PD_SCIF2		35
+#define R9A07G043_PD_SCIF3		36
+#define R9A07G043_PD_SCIF4		37
+#define R9A07G043_PD_SCI0		38
+#define R9A07G043_PD_SCI1		39
+#define R9A07G043_PD_IRDA		40
+#define R9A07G043_PD_RSPI0		41
+#define R9A07G043_PD_RSPI1		42
+#define R9A07G043_PD_RSPI2		43
+#define R9A07G043_PD_CANFD		44
+#define R9A07G043_PD_ADC		45
+#define R9A07G043_PD_TSU		46
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
