Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B08DEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCUV5ZLmrRA4WewQh3y9OmSwaIXI7VIKXd555YDjvqI=; b=dP5Cv+yedkKpT1
	JLAinmEkrgJMWs1HkhSg+nz+H8T4Z5g5XLDWX3e2zcecT7cf2NSWjz5hyfM9YiPq+fRAvhurY15Mk
	G8yESgYisM/3laxyNg6b10dEMQverjZrC74s6RKaTxNEHKkr5aMKJNH8J+73qD7tBz0xFvCcd47GS
	5bmQs7svFFfN7SMe8yDUCMdO7Jfe3DEq9cSa1NJk8nTKsL58Mkh5sH7RB3T/gXfjBvFB4Jx0VYeyy
	p57Q02Johcf7aw2eKCJmaSAG56OcpfBxtQNHSS5+sqnDzoZQw/YXTj2Cj0DOm9BrnqeVM7debFIf8
	WOxntCh78FNQ5zjYtKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiQA-003tCh-1s;
	Fri, 23 Jun 2023 15:09:58 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiQ7-003tAB-2A;
	Fri, 23 Jun 2023 15:09:56 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b475b54253so12737921fa.2;
        Fri, 23 Jun 2023 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532993; x=1690124993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=sXiFVh8mY4yRjMQ5IDRS3cdjZB3EQPHWCuZIj6T60Sk4ybZiSnmXIs8m6+e0J+kRXR
         QyWq6q/MRb3rSbsQGNAkCkPh087W0VWgSiSo5ojaGLCHomXibYIGnq7aLHmKjkx7/864
         lMSIZEHjuVmaivRjWAiG3+vqrRHCwculvuB73JKZcDnWDXNe5fyW+7oymLyl5Hyt20eA
         JQIAm18JoJefEQUpn7wf5z9ZFwjb+W/r7RTHOalryMcC1FF6V5cm8EWVk2J5NYJ4wJH7
         1JBhZLJqTXRGbgoNm8qWTFOfPNrogHwSYD4uQtCp+GDPDOE8pUwYI+vzJXZdMS0KBLys
         dNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532993; x=1690124993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=OnqG5jqrpvJXNcrvvMitZqWozMWtg+raqCyRwATaOEIY4rdQYtKiwxB9gUTGsPMEFk
         EKSlFZxaYFboTx65GdbFWjYAPH3cO/BU3QyqgsvEinbzUMZL6XT9rJe+Kvkk87IwRKmu
         mQL9Cqde4DqWTF0a2INAtfjAk/ae21i1Tu8cPVwCB+pjdOxdsJhC2C1zsfvkA2TnTwK3
         LmS+Zc748qewakgVq8Vjz6KCYKt145EQ7tJ0/WBrYVy88nl8IqaSFkEmLwRZAUzHwR8B
         mvcmkbcwNXzgZ18/PZxMLwBMzdxvuXnUdaZXnTNJtIctrbwF3V1qijrOUAuBFiTauejC
         yPug==
X-Gm-Message-State: AC+VfDzDnwyN7jOIZ2FrIvv3EzGO/PZQDZJW/oFc666zPoCCdQBjX/ML
	Ok6df+y7bi9vmOn75417oA==
X-Google-Smtp-Source: ACHHUZ7z54b932g35QQQnfiEtWSCAb/7Udc6dQREd6ky5WQPL1j9+L467bjzNGx/Y3G3O42+0hDICg==
X-Received: by 2002:ac2:5f93:0:b0:4f9:d9d:eacb with SMTP id r19-20020ac25f93000000b004f90d9deacbmr7825166lfe.8.1687532992750;
        Fri, 23 Jun 2023 08:09:52 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:52 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Fri, 23 Jun 2023 18:00:01 +0300
Message-Id: <20230623150012.1201552-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623150012.1201552-1-privatesub2@gmail.com>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_080955_712453_8C64CC7E 
X-CRM114-Status: GOOD (  11.00  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..50f0f761527b 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			allwinner,pwm-channels = <8>;
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
