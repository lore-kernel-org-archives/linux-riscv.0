Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070D7EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijR0aNxt5QEMMa0pRT4WSwv9oRN93H4cemW+Tcp9Zoo=; b=TgLX76+klWpli1
	OL6Yc1IKibQo6KvQIMODsRJADCwpA+Z/jVpnH7FgaV2cJ3ANu/mGpdT476Kj+wG2UK2an2PE895iF
	pqp+h3pvb6EYxOU9J8p8Qx/GJ9WR8FaZhiJMEzpQk/+9vFVdKlbZe3FpGqjEWuC8aohltthdKfC8C
	yfIB+s6UuN5yeY2lCmRU0q0UIFET2ISQDJeDp7s5dJ8FQKfDxmsOgO6nhHSRj2TT9aOcExwyzWm4l
	MiMxDkcheMtr8L1jDZ4rYszRu23ixsbacbEOJaB/q/Xirc6toHlfkYrujrfyFBJRuMpsmfDT1LT00
	7ePNg8du3CQA+kzMbp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38h-0061J4-1l;
	Sat, 24 Jun 2023 13:17:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38f-0061HV-0x;
	Sat, 24 Jun 2023 13:17:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fa0253b9e7so14312345e9.1;
        Sat, 24 Jun 2023 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612636; x=1690204636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAYPGxSTFPjM3RqhwW9I/u0fjI7Fx45EUbdLcf3Fbbk=;
        b=RTqZRv+kicZW7QzVJK3ZagJlTPPID3erCQjK8DbAaVPTMWw3b0mjuGV5SQVg3A7Hfp
         kTP3MO1AV9lx1/fyLW3WpWXj4HmKkLq3zsShiKr+AZkRpIUvDHPemFoM8d6lYuJBkhVf
         VwXLSS0PvzKxnzoIXhwxmKBAloifepGmC78ZDgEmk5MbVTY+UmUcnQs8jnP7jUKTgQ1t
         ovA2xPB5nkCELrRww6By/LY2lIhiGufo89h+gKofzrfcx/6CnBLsCo++cVmYMzLAiVW3
         P2v56HjmRyol/JePLMkvownV0cd+4jPAN3a3PkXbpyjqgTMgtriUwWMRfhDtyahMiisK
         i7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612636; x=1690204636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAYPGxSTFPjM3RqhwW9I/u0fjI7Fx45EUbdLcf3Fbbk=;
        b=VL4qmPvKqU3PN+Sm50S2o9iI3c4iACE9ptXarlQPGr+KD9v9avHm5owVAIByy1LybV
         qRVeyWpTzGfhY1XEuv9/frfc4oRQtG82WbVhrx7Y736eoAikGf3DQduTwYwD5ugyAWzF
         p9GN5JRcvvgRx+NDMnY76zTtccmPf3MI2hCE8R4MZu3HTiowO5TLmPWrBTMReZb6GTMB
         vD6uqPQPxd5bvYPhu5HPB9eDNAJEqilcR5pY11FLc/UFT4uAmNckzanYIlLVfyElnkn5
         9mjsMXAeah3i2wLW+LbFebzdKOBsGdqOtHbWf3RRoBAM8fGQORTtH8rhbgkPMI0PPrqN
         dVSA==
X-Gm-Message-State: AC+VfDzkx/WagPim7qXB3LxH/WAZmWoVio5tnYg4GIzoBmcqJu8dlXPL
	HVUthNk5wLmufwoSWr9ZPWI=
X-Google-Smtp-Source: ACHHUZ6AxRD4qR+dRoN7S7SE01tpvdTdIi7AeyJugnitjFY045wLn75ojjvOMv78elsfe85Qmldkag==
X-Received: by 2002:a05:600c:245:b0:3fa:838d:adbd with SMTP id 5-20020a05600c024500b003fa838dadbdmr1749644wmj.1.1687612635438;
        Sat, 24 Jun 2023 06:17:15 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:17:15 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add QSPI pins node for pinmux PC port
Date: Sat, 24 Jun 2023 16:16:24 +0300
Message-Id: <20230624131632.2972546-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624131632.2972546-1-bigunclemax@gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_061717_338456_30CC9AFC 
X-CRM114-Status: UNSURE (   9.47  )
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

Add pinmux node that describes pins on PC port which required for
QSPI mode.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1bb1e5cae602..9f754dd03d85 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -131,6 +131,13 @@ uart3_pb_pins: uart3-pb-pins {
 				pins = "PB6", "PB7";
 				function = "uart3";
 			};
+
+			/omit-if-no-ref/
+			qspi0_pc_pins: qspi0-pc-pins {
+				pins = "PC2", "PC3", "PC4", "PC5", "PC6",
+				       "PC7";
+				function = "spi0";
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
