Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10878EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ExKKW+N1Es+/V9t+rWI2MsYWJryNh/ykRa0Hv/3K3/Q=; b=qLJROFOtSr1UsA
	OsRCBtg0O6KvsQKYf5nwYDYm3CFzITsoxYupIGdkpRfhhDTbJDSrMT9Ov+PhFkg0sWq2Yj5rKTMjd
	KVoXC4dSQrSsBmjv5JAoqSPOGkGzqoGvBoav3Mtaq3oRXcrBXgh+bWViWsWpICzknwn4dgzYKzOY3
	rtCleFRkO7Qg4ALzBUwsJPGEDzooVgdvyUYS0r/TxArUyJsGxYUNT+5Eqj9V0prqTwrFSuAuAV/6x
	/sOixz7s0LmTIInTvmcLxMGr4+coadXdT5WYrm/+5uz078OcdbKUE9GQzrH3/g2Kn5I2ZJR6Rz2hv
	M35dcT3wK44NoGA1C4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38L-0061CE-0C;
	Sat, 24 Jun 2023 13:16:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD38I-0061Be-1R;
	Sat, 24 Jun 2023 13:16:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-313e1c27476so352390f8f.1;
        Sat, 24 Jun 2023 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612612; x=1690204612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAPLdJ1hRBKYoDfC7BxuOkW8oX621hvqZ4G8PC6WVsc=;
        b=PH0n1FQU36Z0dHZzPpw68V3rlOsp7moXOEmfaBt3Wbhq8TqBVHJWT2PqEcFduHPw2b
         e8jze0QXE/vtzqa6M9HCgvp9TK5psbOBZ0x72hBRIwQZAbJ7eRs1Bw2udOznVh3/AdCd
         197AotubSzYP9d7b9++XatULfFDzyvw5rs6UO4nWiXCISgarNliSnlLoJwfNgB5lPyrY
         bz8R2pwk/HJLVZq1I6J01bZvQ28CP8hcsgf1o4+RiVCY957zfvLCaxZtjNg6uoPEBwLK
         7MwyExU4U1A1JjBWylSWEG8eZjK/zECNkmFH8n3aAyHy4O1QHGEPgZVcKI9TWwdLGEA2
         Lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612612; x=1690204612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAPLdJ1hRBKYoDfC7BxuOkW8oX621hvqZ4G8PC6WVsc=;
        b=eXsepHcxYK4KUV0M4dgjZqiZ4VHSox2l3agS4z8NSRwbfu4GvPfC+DIeXCrlj3qDTL
         98x09FHrW5W+/0KkkCuvSshMoXTPpXMaCAVdxVeHzyPd/i+vQZOfyrn0kC/HUJWQTX40
         i8/8ACjg1hVyE9BzSVnvVgViTeka4M9HNonRZUDW+5WQKXaOgPFmGY5Qxu6PUklYPfDj
         K1hJqUE7IE7YXX/Z0b/hG0bLmQVP5wRjC7RkVCf6c0uynog83Rn3BylOiKJGOpU+0upg
         ohkoXTpwxZpYWPAJuL7o4hDBQE7xo6q34wdYAqrXAorjxyvaMfxr7AUQEY5dBEJdTo0Y
         2P7A==
X-Gm-Message-State: AC+VfDwmoYUeuwRcKV37LU/CrC7ovxScA+qSgSTnTwid4jUz/4qHZviy
	79BP4lhq+sP5kqF+98oNpTY=
X-Google-Smtp-Source: ACHHUZ7P2aSXnvI92huJ7ELPjVwzFyP5E+B7pL/1YCe1HolDXBTc7AHjIzHzD9wkkH9ja9mRwcXpLg==
X-Received: by 2002:a05:6000:104d:b0:313:e740:4956 with SMTP id c13-20020a056000104d00b00313e7404956mr582260wrx.25.1687612612033;
        Sat, 24 Jun 2023 06:16:52 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:16:51 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Allwinner R329/D1/R528/T113s Dual/Quad SPI modes support
Date: Sat, 24 Jun 2023 16:16:21 +0300
Message-Id: <20230624131632.2972546-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_061654_504916_852B6CC7 
X-CRM114-Status: UNSURE (   8.99  )
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

This series extends the previous https://lore.kernel.org/all/20230510081121.3463710-1-bigunclemax@gmail.com
And adds support for Dual and Quad SPI modes for the listed SoCs.
Both modes have been tested on the T113s and should work on
other Allwinner's SoCs that have a similar SPI conttoller.
It may also work for previous SoCs that support Dual/Quad modes.
One of them are H6 and H616.

Maksim Kiselev (3):
  spi: sun6i: add quirk for dual and quad SPI modes support
  spi: sun6i: add dual and quad SPI modes support for R329/D1/R528/T113s
  riscv: dts: allwinner: d1: Add QSPI pins node for pinmux PC port

 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  7 +++++
 drivers/spi/spi-sun6i.c                       | 30 ++++++++++++++++---
 2 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
