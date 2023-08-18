Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FCC7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9tj5JEIsrwIhmQYsgwFB6XKQPXYcisS72oaUHF47r4=; b=uhNaA+Fn9SqcXi
	V9XSrjNJABMlBxI162YcJ6ygyIEHtbMfVAcDVX2+s033wk5nZLphvbaxJ55CYEEfUXm8xiwC2raNv
	ZCGIYGU1ET/JXwiiPeisos50wsF5QBzJ9HOtY/0F2ligJKTvT+E399KH6WZ/7EY2bSd35IPkx9678
	YJZUeERcSWPMvWh6vnBbIxx+HXDaOe4gxeU0GM8LaMMp4tWuv+24qMeWEB4UEtGdBiDq7Py1tJZi/
	FlClgDHDv3HTZWi/bN3X9dUiuc2vPAOiACEe5DjfBRl+Ret7ErL5lq0BOaJfks/PzIU/fVp6rb1KA
	4+jsR0gwDa/Sb944ToYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzz5-009RHD-13;
	Fri, 18 Aug 2023 13:57:51 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzz1-009RE4-2q
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:57:49 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9338e4695so14596311fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367065; x=1692971865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YWWR1nS6vb2OHIsahOY5Qls7LOXPtQs7I7ZgEhlX1g=;
        b=CznlxsSftDnKiCJU+W3lkFf52eMZ8aYWBA7JchxklP0oWEoWuXsXvGudx/m3EEZLGk
         nwMfAcTuCIzwToovGL/7/e56dXAWUAM8J/VQSj8Z3HBUV7jEdinC6dKtnb1VV37mQXz2
         p1L3DMxMaZWW89n+FPGnoxO8zVLcp3Ahfbj86N6csa9fTKTLHmpjRe+4Rd3U/9mGI/8v
         NfwgEAinGkj8VwLKwCBxUi/ZKOmgmxsX0w2oprTTlaTF3j5ucg9UOZ1lMxb0J1/wv5N0
         GG8mNaFl3th7bfYonMlx6KBB8PpamaO8XEnn3mcOggTjEX7CBVRrb14E+iVck261f1BD
         cvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367065; x=1692971865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YWWR1nS6vb2OHIsahOY5Qls7LOXPtQs7I7ZgEhlX1g=;
        b=fngxgTtAm5thXZwWKF5PPKPZ0WrToM/NwJ/toycd7hWut+i6Xkytxb35Twmnwq9/ga
         jSxo/Gx9fNVaXiXwKxD7gFgZroXHgi0ITFAwDM0KhXuHoZI0ZpBN3KnFWtqR4C5lxteg
         QXoGSvLcCHg11JWFpUhNt02j0MUgEzpMbMa/SBHkH8Q1Hh2q1ym5nXsR/cdvP9Y2++10
         yV4X+3r7FoVA0Ch2jPLwx/uGOaku2jXZhJNwn6UeT5wRPSZCxruPFTvShUoDJADxop+P
         DB1kt95OKAylBWyuwTCbuQ0zhGRSxeiRt0yT8x087dGiTC4SS2XmMKZFkp4h4MrnwXsC
         Dr6g==
X-Gm-Message-State: AOJu0Yydd3GepMu2vYq8Ko6Ex14Ka1n8AhzOUn+xWTW/NbJEVB8KTvyd
	vFdovUutVde/HqLzVR3IbGY=
X-Google-Smtp-Source: AGHT+IEL69oFLf3nqw2LLZ/AVS7OWP11M44RmEWTICV+XBU/q9SReVOt6vvBx/Ezdw0LpLTugUP3pA==
X-Received: by 2002:a05:651c:145:b0:2bb:94e4:490 with SMTP id c5-20020a05651c014500b002bb94e40490mr1867517ljd.23.1692367064754;
        Fri, 18 Aug 2023 06:57:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:4b30:13e8:1d57:42fb])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003fa96fe2bd9sm6444055wmb.22.2023.08.18.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:57:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Fri, 18 Aug 2023 14:57:23 +0100
Message-Id: <20230818135723.80612-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_065747_919141_6354F08B 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the required Cache management and Errata configs
required for the RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v11 -> v12
* No change

v10 -> v11
* No change

v9 -> v10
* No change

v8 -> v9
* No change

v7 -> v8
* Included RB tag from Geert

v6 -> v7
* Included RB tag from Conor

v5 -> v6
* New patch
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index de31589ed054..67604f24973e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
