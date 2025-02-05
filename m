Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFDCC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bM7ZBxEu87riEu0hTahsapZivFPuw+mvfFCqATzpWHA=; b=oCySwzUSfqRNWJ
	k0MGN2gEbIGhscS/bhhkpUVqL1nb8YcqeaJKtAD87bzSaN2YdGjaHZ8ZPJsAyURVlGaj1+ii1ZaTy
	3M1PtS+ewg6Rt4K6PIG+XMB71EXSJQ+jDLVCedwPfqPIvEGQpz+BjV7f3B5VuwjU1p26ipzpVw8C7
	QMg9LX9QPrvRO6zIldhsmEhqYh4S7Et8nIB0WXpfd+Ol/DnlQI9tY/cweSzKiyq+YPw+f843h0BZS
	4nZoLvAdwFKd8uykKK2jmdN2suU5WLBfxBy7Ro2zZUQIHyMrhzG38Vtgk2ZR3stLnRHSZvqcxILT0
	hNuyT/ybaqjWrAd5sFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZR6-00000002TX6-2HiI;
	Wed, 05 Feb 2025 07:03:00 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZPs-00000002TLJ-1EUs
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 07:01:45 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ebb1652729so3607653b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 23:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738738903; x=1739343703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VetlIju5pkNjg/WmtiNabYY/80QVE5zZqTlQOK48sTE=;
        b=MDWWq79Qh/nprPylRN4Ma7XiNPuwKOvXZueXmZsw8aG+/I60+JD5wGPoM3xBIvE4VC
         FpL0w+rXSOwNvar9K9OHwu6zDzwdyLhOkUSS2owWvnX2QAuxzNLjJ7stIreDQG6WDFJa
         6Qnj//OVY+Eq0IpR8fyOy6Y7f/Uu04R8dy+fdaKwUkWkSiyRcoMnjZN0771fvteifudy
         T0OUVo/uVMcvlWTVgK37dQtoXkhGA6IZ+H+lfK6baBJSfs0UIvDfldBV2HAP4Opve3r4
         ui0N8ZRr6IHsH3uczJdRE2lSQtnjORARaG0j40v5S6UoW6ozVsqkQcIwfTwev3S1ZgqL
         fjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738903; x=1739343703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VetlIju5pkNjg/WmtiNabYY/80QVE5zZqTlQOK48sTE=;
        b=EKfSi3ZKzc1i62MufzVl/ApW4w4dAAjafOH7vrg9kUVAgJrZYlk8o+O95Sp+w2sB6v
         E8UvtA8qoYp51PsDsqyayddp6WvrG1FrS1dEscZ1HtwWz8MwkghcHFlLiyFzUI57hsxh
         NTGal4gARmOZVhxI7G1TrgzFJT2PpBA0Tnp2dvGNpNzG+e6scTCc0nYEsWID5ldKpvBT
         d2sJHW+OBdIp7wKZj95M9ErTG3lIJlpPuN5nwB2EfEmK2JMY9uHhhhsaS8N/t5tYHFTo
         dIiiXIFm1rjLxrqv7LaXODeqFfIrOU/WhxPoN3pq7fOWMEh6tnUUsra+cQr9MKcEyico
         HUvA==
X-Forwarded-Encrypted: i=1; AJvYcCUJGLy01ROsXJEh+i22IWIOF623imILX6CgOWOWNsbrb9Lz9vL2Fghxpaa21dxtC14/qHQ7fZ3Uq2cAiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGric0Koxhs76h0bZZnM7gClmBQtvEDsDqodRGtQJ6+LaKZDN6
	J4T26lSjRNiViAbkvA0ffOu2XTCxBGoJwNz5eBpc4+ASGl+K7+ua
X-Gm-Gg: ASbGncvJdG24Gw7jUAXWFjsQHumMjvKjTXStdtfEpytKJkZ5EhnChEvsE2m+CK71uJX
	wTvuae0C1/RDlvI5kop3xTZSHo8ExFB4YU8d2OCwtPcvocNUGhVjNxWGTMqEsOZg3u9V7VxNOPq
	HsoWQgszS5rcgAfvOrUWJwpAtBOsYWLrlKYdesFsJ1YXP4EiyZtnHOCa9ZQ/8UYTNMZb0ONdDpT
	kIQYmmP6Mnr3O+QA+Md0Ism6DghAsfPrbS6h8xPcMOFrGB8h6b0Sch+SC6Z47q0hyqMlj/XkXim
	zHBqbrT1lXXkzZ5m9vVdiCQqlA==
X-Google-Smtp-Source: AGHT+IHsN/LcSCw5m80/mGufauWzvwto1G8RpGC+M5RvbFWxlmw2NwUKjbpX1R3EQj/I7XUX3H7gJw==
X-Received: by 2002:a05:6808:3c8a:b0:3eb:638d:5e28 with SMTP id 5614622812f47-3f37c0e5a0bmr1104846b6e.4.1738738903247;
        Tue, 04 Feb 2025 23:01:43 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33367f6c6sm3441313b6e.42.2025.02.04.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:01:42 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v7 3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
Date: Wed,  5 Feb 2025 15:01:34 +0800
Message-Id: <f376e16c0ee0cdac51bb91421d78defc0601627a.1738737617.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738737617.git.unicorn_wang@outlook.com>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_230144_331580_02642249 
X-CRM114-Status: UNSURE (   8.09  )
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

SG2042 has one PWM controller, which has 4 pwm output channels.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..4449c762d663 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -165,6 +165,15 @@ port2a: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@703000c000 {
+			compatible = "sophgo,sg2042-pwm";
+			reg = <0x70 0x3000c000 0x0 0x20>;
+			#pwm-cells = <3>;
+			clocks = <&clkgen GATE_CLK_APB_PWM>;
+			clock-names = "apb";
+			resets = <&rstgen RST_PWM>;
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
