Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4BC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nm2ZZS5iJ3RocLA3zfaI14I9shiiNNzQJrKXGCUbTrQ=; b=LPt/vYRaxXm9eV
	agmHXrG1w/1Mbmg8DZ/Feb5do9QXRaa2z29DjNd/lDiOKChIuK2Fi4SiFlh8pERDYTGsH2JSQVMTt
	b5TQZwfeqpAko8ULN3swr0Cti7tFDo/a7RM7Ncoyj79Z6CAUIzIWZpfcZU+7LMKZ99n4b25x9paYl
	ncUKHFwrgyw5Lnf42ka2Rh1OS6GG+Q6hARnX1XNT6OmFzM3lxYumbEw0QYRzsh1mpojf8Kr/D3mQg
	u+fxDgVu5MAGyoP2RHADGsdyWl6jSZbVBaVozmQDlFgwWD7Vkyj/7EiMPQMGtJiv4/8Zgs2MNzRZL
	Wki2ggkt32mDmHbfHXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZi-00000000cf8-3eYe;
	Sat, 25 Jul 2026 17:54:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZg-00000000cel-1OXL
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 17:54:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso178896a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002051; x=1785606851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=RGg7WosKYi+vkwE3XMs1/y0ERvHz5plChO1fUd8kr/olwVV6C9HhJdd6zUib1llI9W
         oi6NXO2qIyqeYwdxXOvT70myTo9+x5AKDPuTIahbJmTEHGZo/HjoE9SFHq3bChJKdefc
         ErOtFBpdFE9FJPfPh+gpysCvIZdo94H001OJk7irxu4kF9QAjNEToL8RCLHKyl4ecs//
         0WGHXfzgXueIwMJC45lB4BKZ+8fyLcXGz62TiCzwxQ7CbAZkxP1IHPeni7m7B2CX+rNB
         K7twdXBsN4lU6svk+98ZG1SswI1X/8u6hKkP2IPBTyOib38dBRr48FlnTIac+e3bGY+k
         j31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002051; x=1785606851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=TnBLWT1EY690Vnm1CPmRt4SuZYcdCQVPDDzPBiPlmHMWvVBPn0GFYZr+HJ6B865kgr
         fb/G7KK95Q20WtDmLZrSV6xi+6kw9o2OgnFwQNKTovOZM/Ld4rZQIjMnmUtJS6VnI67Y
         V+UjTRxuZqaPJiRgYO5MjdbtOKOxxzGVZVxRS1kS+FPM+vJNyeA4fahMJ8FP+31rnnVQ
         oRipOXj6HECQBL7C1cgJ+Ym3da2cLvD4/aaJiwFfKxTWReY3kw3z82iiSwkhNNvuxszw
         XyH29gE+r7LQgAF5QsVDzhFNJvZ40anQcA11xMofJDpqx/7nylPqGTWIJPoqv5eOeJaq
         NgPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYlqExoJBClXkux1XAsPPN05lnGdr4V6/N6JZfnsRy8TXkDvrfDB7TvFc1VmSkp/TFGc8zedEVBRdtig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+p8DMotqiDWKlubio+OilJjV8HofXgycoNm57VZ8SoFOUumD6
	M9HmP14HYh9GkbP2OEl7PUWJ6090o14v7t3Wg5lEPt9zH30ITz/T2oPq
X-Gm-Gg: AR+sD12XOQqulm8w0vzoCJ4cNoafWIhpo4sCQOqEJpLmjaARRSPbKR1HoOb6ErPq5+W
	K6xX0yGrLLkcmN7oudBF3uWJqih73l81d6DWfHgk4IQaE0mCy0vAdkitVUBpPC6TfbkKRceH0E6
	sIGG/aGBRpuuP7e/37jUZ+KqXkqzJz1Gua9wOhyUXRlKBT6RbtNrBwlvoamGGDV9DXl7dFW1wad
	dBft+0Gpg4v2WARXHXOyV6SVkpRFqvlSLlHISAptmn+6GxrtTT9zBX4VYeiZYp87VDtIUnSgZ5i
	eyqp+Uwzv1715iHUXF564wnXyOmPtUu0g5w0xffmn8CA5uR2hMT6V7hxsfU2Nd7bL6cb9DLQutI
	vgUT4PiJBMwcjXhK2JZ1b6irL6nY3YiO2a31sxfktblTsGv6yKLxe4mUfsFcsQy+XDbkEn2bQqP
	dBfWtVynF83w/+ZNP0cGfcmGF3OfCrFGqOhyVBjRqpHtC+M6OF6fQU0aPc0PDr7L+XsrKd58S+p
	W6Ii9sdqw==
X-Received: by 2002:a17:90b:58e5:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38f2926773fmr2113362a91.0.1785002051278;
        Sat, 25 Jul 2026 10:54:11 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:09 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Sun, 26 Jul 2026 01:53:44 +0800
Message-ID: <20260725175346.139173-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_105412_376530_3A6792A3 
X-CRM114-Status: UNSURE (   8.05  )
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

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
