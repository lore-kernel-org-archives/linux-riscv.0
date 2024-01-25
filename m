Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B7C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73AKnxU1f0qnhMFsxhj7ApFhi0h+uncsdGCPDDyYHnc=; b=uC90LEQ3X71CaM
	NwoPIpjOeAuYlaiPE8bytzX+q1OmLf3nLyo8JAlfh6iYYNuQQl/W8BJlMfn1QU4LvDIMttfJz2Nmw
	ci+VM8s6WAAkEt6gOBZks5XgT3cTSaPVowOox1fdqz8Ay1N5eMxgUnklOPocL7BtAbfVoHicq89oq
	0z3stNEBE2tVxDuBYUgpc3A+MjxpEurP0ydYwODtK6PABM8+YqCUYBoNO7I0b+5TxM/02z6UkbD6F
	3GsxDcuPtW4fmENbVmUrS6k4klz58UwgpQw4pLwGqBbKvRQHz26+WcvJZuAkP0SixgDNe/pS0wFqI
	PnoLCWrwOPqAvXkXMo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu3y-0070tO-36;
	Thu, 25 Jan 2024 07:22:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu3t-0070ja-1A;
	Thu, 25 Jan 2024 07:22:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50edf4f478eso8411342e87.3;
        Wed, 24 Jan 2024 23:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167315; x=1706772115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=ObVP4RArc561hVh5wxUeiBtPReLqjoIoZ0jAelVWGt4LIplHc8JAbD3lMRw6XZOd59
         BiWNSBCphDkXLj3xSh8q9oba+gs7t6X5xDibhg8eQX0gZI8r10IQih9eX9UgSbyE8Q7m
         BS1GUCh4Uxln9X4StaP/rP8XgRcKOV9utesN23sBRBhkpcau2mk8zM4E1Tey+RYSME1h
         WoB6WALBVUXOBNHLMYbc8u6onAh/zMMh4Yj1r40njZJyBtHUJSY/58IdVXcnKsHRFEra
         gEyJnYkK8GynQWLfmCKSFMz0w4hk1ti86cT+XlzSZSplVm351r4FsueF7Ney4f+7WAME
         EMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167315; x=1706772115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=AqJDdpE1HNEXZOVSYNmEJfj+pmMVTy5iCByHJU98g4kWjJJ0mwirXKNCAiRLe5q9b3
         weD3m7418lH8dfNp5dMr3747hwvpsMC3tWjjK2wLeDADAW0awTsuqgOF1XsQ5HdDikl4
         lESvsrWbHC8mQP2px23RneNJ+5pVU+1PaDtItu0YIi1CxbRQMsThNauSTG9upQnT4Ojx
         dWvn81jpl1EN/3u+Wk9gJxfYhEiSy8Dt2RZxrAm1Q2tDoy7C9hNOZjKB8MjJjhGDt0OE
         TthCHnQq+rsZwh+g33rXV/t8srayI82hxiEnXuJ6GfuTo5TBK1KumtbEecTfdu/bDUYv
         KkAA==
X-Gm-Message-State: AOJu0YyAGuMfIyojZq+UAXphMeTeOoDbG/PmAY1Se5/6R9o19t8iFUXf
	5lR+5E35wLPqKVWfPBuRPRvh4v0NfktHNyka0FN3yrGfQDTzg3E=
X-Google-Smtp-Source: AGHT+IFTxwPgOv3/EtmvxxaaVICzQhm+m2RVQrsyK4AF0mtOzgJAMENWDpCC6bgpZ+U8d52vHyPnhw==
X-Received: by 2002:a05:6512:3687:b0:50e:8ead:3889 with SMTP id d7-20020a056512368700b0050e8ead3889mr182905lfs.75.1706167315214;
        Wed, 24 Jan 2024 23:21:55 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:54 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 25 Jan 2024 10:19:43 +0300
Message-Id: <20240125072032.1151383-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125072032.1151383-1-privatesub2@gmail.com>
References: <20240125072032.1151383-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_232209_399764_C7EA6851 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: devicetree@vger.kernel.org, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..435a1e66aa6a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb0";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
