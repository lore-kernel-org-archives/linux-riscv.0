Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4D606EEBB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pGUp6lcj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BybccZRb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hVfwWVs9cE6gUEBohBs5w9KalNl27lnM1jFex56zbb0=; b=pGUp6lcjMhJ2Z+P2DV/JBIWeru
	Y02A5Hg4qeOmQ1DFNmh2+20GA+dtzfJBDTBI4NY9sg1yeVQkldTmozubDgXsi4IpvkTyD/oMw7AFG
	AlE76TwjIqylboV+7Hz8gfTYXd47BcAjNkorwsk9GDDKBv8g5K4ZJZSxrrsVkNwn1io85Fmisp/sp
	lRo2uJGMv95Ar9jd/6wyYL1sJ4Bke9nwEUHsAPq2MBuJNROyJ2apoHJVy4eUKGkZNbC3rWfxktisN
	bUDUfUKD6NKVyAePezqfBnZ5OSunPohjbEbYjRM2evZ07sUEnBkBttlz3b6Y7T/+PN8f25s5Wk6TG
	2nG7P90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYa-0000000142P-431K;
	Mon, 09 Nov 2026 15:45:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYW-0000000140l-0oEZ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8814775e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239110; x=1794843910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=BybccZRbhLaIDeby+H7QFcyfdBia+RrrdV6nRFEaKIAnBOrrCxPU5D0eDaBRwNi0He
         BMiwXmdXfB5MAMcSAHqnnGd5lOpqCwuWwr3qIEJFNM/ema6adiEAelD1/vtrXLrSX75Y
         JGt9GmsLyiPhw0kQ/6dlpgY2BPjGKxTJX8iq8DWZVqKgUB+NoNHQ9vxaYmHaf0G1LEeU
         lUCPJQc68yG7fOxM4un3V6uDcJ2ZxbyhTKLWplPP8FxLRoPuJVRTmj6G/k7mg4FPVGs6
         PJc6rq/5OgWRmFWd2qvjzLCNObOOmAxEZK1Tnubwp46chxDo1eB0ajGuIDQC/QtGkbXe
         B2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239110; x=1794843910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=WE/deQr2SjnbHPoZjg+VxK9mq7UFN/mADvGYduX2LItXBaljHIhQvoLySU/rgKWeOa
         Uh2JE4HUvAyy4BOYtn3h5ua5/c/qo/MKrN1DuIVosrGS0Iz4hp46muY9DkfiXJ+EIXjA
         KxcLIViRfNNOuW8Qvve32Y1K3YJfhUPT1wEz1hgAVU2IuB1HOCpaoQdsQ9m8nhXkUv47
         2A1wWRTQ+Ua8Jloa/gmtfch5XZ+HcR3YJL0yefCXVkDYs28DjnZjczyW7Fbovu73o358
         Py7oiMA7to9UqJDqgy/e8MNOcBsUcNTzhbNCRF+yU4UchpRObtsgrRiS0ge9DSxE20jK
         Pcxg==
X-Forwarded-Encrypted: i=1; AL+hErFldePli7WIYcTWaXftusjcgvK/MltXSr2w7+lsRm+KOcSL03ZBV/wKEbqTwLAMQo/y7sbzcpMm1g+roQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/poO022eWaXEOeN1VfJzo3B5Y0U712A7uh/+XMS+hG9rDDgllo
	TSHWvu7jqjB5nSUhV9Gydq6iQiXMVdpObIhUgfEj/CAiozfrUtZki7rn
X-Gm-Gg: AYBFou3ShoZBh/Geh7p5OsGzXSITpAOxeiDvb4wkQC2qE4DRVH/PfR+ewBBvNpKlFlV
	pqztUj+G9m22Kjbd4HEgnKwp+DZLK7HFksQ68/XYx9woZ5AXwn6yMGqfI691u1evwUEKUSQWIU8
	VZIQKEYSBJHgz6a7kSpengYjQbiV44ri99O60f3cBqlk6hFEWrw2pZXaYlMXVJqmWc28wq74alK
	IfpsslCtLvgxP3RY9Md2PehwsQVbFpuv1ASDoQWiWKJZP9jly6h72BD6KKJrPIozRSxNlwt3LnG
	PTlc2pKl8imEBF+6VuH+VwRHEFDPPpcrpTtOyYm0r9vdgIB4a9OS1G8mDN8Fbgtfz8zZB45JUCj
	GmmP6/hXJfaXv5scG8ihKWQxVMMJ6vOmkyJovHLO/ZWtwk10ZB48WCSG7nwr3iabbAsUJJ60epg
	WujuhcH8SHDW6TaukDMhZ4Qe456lKg4EV/yuFgRX3lCoLPagPambEd+hSRbXxQZ2G6sRZnDE67/
	wzgYzcgGF5XDrgb8J25ftaMq/tWhVYmotk8SFCd5DriZohksYxGzAMDD4LEZO/MxsYQ9cMLEpyP
	hnLy8k+bfOx036veUrK7SW5ASPJhHGcRIQ==
X-Received: by 2002:a05:600c:5397:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4b963c8d7ddmr76018955e9.33.1794239110309;
        Mon, 09 Nov 2026 07:45:10 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:09 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Mon,  9 Nov 2026 15:45:01 +0000
Message-ID: <20261109154501.63762-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074514_594650_9794A6AB 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..817898eab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		soc_rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
