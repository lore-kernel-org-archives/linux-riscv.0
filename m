Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2500606A320
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B7VeI5a1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMp7Dp2D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DoO77mHEpDHGrWTaOZ2xGLTY90thLfLvWxl9pTPqCd4=; b=B7VeI5a11SvLH+0ofx/gDNyvQy
	oCuO64ZpAHrG7ifFwYV2QpH7tfb1PPw1sYxUdvLH2cAIk/5w/ISFmKxgEfUIfRIsIxQUhgJqSNbsP
	xlr63hWcUqsKeYsC7HZKjl+wkkHEbx8IpiIxtrLwH8RLq8T15lBXH1ObGI9moHW/eJjUf2GyBLplO
	7sHup+OPA3dwc+6ZoTljWwIhSuTeYPgVBKgurGD+snqXZ1W/1pWwrZh66/ft6yyQh+pMy69kDcVmS
	SHBz2JKxHCd3APHVwPG5NPvxuhcpFfU5/mbsVKE6dy7am9fYl3jVKAbuuueZoYtvAuvINg6shhoga
	8ylbLg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARR-0000000Gis9-23tN;
	Sun, 08 Nov 2026 21:28:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARO-0000000GiqP-2isp
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:28:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-490d59c3edaso180963f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173321; x=1794778121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=FMp7Dp2DbyFSUTSRqDxi8igzdVeM080ToQPhXaTtHwqig+sCIwkJT22JlgK776M5kT
         L3oRVGDDLglSLlrSbfIcnptDADPr+2KmncbVkwMuQtEArea840buDiR0H/mGasC8Q75P
         xNBVbk1/e+wb7YU/atSNBLAL02YKUnZo9VnGMxpaW32mribSs6BZa3PXZrfZvRzgcQNt
         R9GyX8NTqRCGW8/NmwB5CBC7wmxQBxuGymuw/5ccm3OSJEBT7lPSC+DOVR+Mc8FTZhvn
         c8NjBE9jpVKBPmp0wYpljZn1THNTXIrXQLehYxGr+bn1NE68BJj0DxEY1lgpnoq/gLJx
         gK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173321; x=1794778121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=NaAFJXONviCZiB1v11KnlLOTaNwp3GHku4bSesq/wqXwtqLtN55QNnMUCdyp3AcWIQ
         cXRUph6wG8J3IkL8SyL0idnUp6ZFb6hf1rfBMIjs6rJQGjX3NJTcrXu5hgJHguOWSj/4
         rdDkotAwyWPMDbT0l3zH7UiyabBfU9sBniCNGrOZdnYP+tOHRt4/wrOwISJlN6+6fVcs
         WaE8sf29O3MUcSFbRawQoPBJbN574YPZpNCCjRSJMCruABQrVdZlvpTw6Ssp0QxK+T+7
         f/sn0KseZfxQSs0oHb3P++bEP5WfqorGs6xDk9mD42Mmza69429EKCqrRPPzWxq2GQ1r
         s+xA==
X-Forwarded-Encrypted: i=1; AL+hErElYrL9Upb+4mWSnOBBprBf1EQyFCEVEgKSakzt++Bg/ZEfvcO73hZWVU+uKHzVXxIalFnUmfRzWZ1b7g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8WmaymDUUunSd7BFhAtZFygKRo95ycO8e/vyOMdIBvu5PSZ/uh
	GDGjnX1PIWI7U48f68kxlLjYyxrnda6Y8cWWtDAddQmN7M6oEHIJNujj
X-Gm-Gg: AYBFou3ofQ3iCFnTLTXxxI5BVJdTeMRUwEThcbqkymcxwJnoEMj9m1Mpfpv+UsyRaM5
	kYPD1SKbXYL78OgrwFw9tFBAhqY4tDvWf6Mmuu/ZZj6jPQKtoFQ0X4C/HScpGXpcANtJVA4ohKE
	U5wQzGGtdIV9WRFNlqDFBIlBwyd1zt3R0XGbwtXjIgt7u1xAVw2nfxouKFUhyAV2+QxxbBa+gCK
	RQHWFXcTP9JklwCbg7TThm8cDtw1zmD31463hqgSHqM9KgGZKv3eP8H4lIK+71xCcQWv2Z93uh6
	BerFTGjWVf2ZnL6+rMmz+2hLqABV2rlhzfqiBkA5tmF4J+J0tzwei+4UdjqGLcWDFZZbXRacQD0
	gc0Sx9c4nqMISXnEpJaM8zS6vQ/1+gw2TLfH8O6J2wZzUGHlDJEArV8cQtKo9yUWm6v5U6nnd/A
	jF/TRyEwNK6DGGF9VM7LFlj+ZvAAqFUKJW669q77zQjznK96KQx6BdkRrEj4nM3kQBfITWmtJ5w
	3Vr1CeihdCaVzCIeRLY1V4x6h88YuHMlTl3m2jn2EAEUar49802+XB2gUeqkYvR/WUdOu6gcnjz
	9RXXh0WfrbbvKtmqEZHuHhx8SNK+2Smeng==
X-Received: by 2002:a05:6000:4808:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49589c3e6damr4580107f8f.11.1794173320934;
        Sun, 08 Nov 2026 13:28:40 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:39 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Sun,  8 Nov 2026 21:28:26 +0000
Message-ID: <20261108212826.15890-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132842_696953_918C6620 
X-CRM114-Status: UNSURE (   7.70  )
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
index 82ea63f71..14f92b942 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		rtc: rtc@17040000 {
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
