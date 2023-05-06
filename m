Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44005C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VU8KNpbCGAAnMXDdUx9OVxvndgbXw9pDkivDQ0dtOIY=; b=dpCQRUPAGGVgcM
	9x5qsoDFUw1RIcVL4pXSi9E3S54th1Ddg5KK2EeDGWTwBxkxeiDu53fhA/uxsAdIyEwrm+OCYTDvl
	nOYHGkO+GLT+S3n5LpgjB3ckOKrAxJz/I5AhYju9QhWjE3ahBI814bkddgcQYaqFD/ufkf8WvcEs/
	ZZBXR0kyh5OluDQY0VLAs01T0W4opXhQeXUTjzOq9mxjVJ3+HOhJL2lpF90AdbaXLvcX4pF5vukQT
	gfWAGWo5FLVwGEAR533jsRQkMcB3J9QkZN+oOU6hc6wTeNeaDdIU5CHolTUDXLQr4YzWWJZLaTjwF
	FooqZPXAXO7CZeaNOacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCOd-00CmXZ-0Z;
	Sat, 06 May 2023 07:31:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCOZ-00CmVi-02;
	Sat, 06 May 2023 07:31:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f315712406so120671695e9.0;
        Sat, 06 May 2023 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358312; x=1685950312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phdCEqZu3n0Q0Wg7bdC8dDiY0m/BBOG9trxmvJBnuV0=;
        b=EmYJDALXFxdDPFsrmRDu+d/XkHAg5PrzsgGsu7gdmUPud/ECs6SeQyohi3vUiNJhf1
         3nRrANbV+2MRtwrT99zmzM17zc7S0pDrMd/MF/XCBu0McLhkDk4GVEdbK5U9Y3UCBqRx
         0DhzxinyLRO5fNf9MxvVHEdTNY3n4yJ0c3nG5+Y3Y2vPZ+ILKiC+1lUIoUQ8ku1v0wz8
         E7U0dVgDtJezUZwtAN6DMU8bONc/GbGyINwsvjCfRGVwHJwN4m3oUWRKqZMxR61D7hXN
         z8uTpjqwgdZ6iTk4hJsD+/UqWUjKHQARk6zAsmcHGN6RGY+rUke8efCi0pSFddgAbdJN
         zkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358312; x=1685950312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phdCEqZu3n0Q0Wg7bdC8dDiY0m/BBOG9trxmvJBnuV0=;
        b=T2oxyymoyzeWpk5WiaN2QCa+WejV0/QGnhVs/d9OJNxxuhtb8sptGvXBWUVfiq3VwD
         RMgl+mAWLra7REIV0IStG2R7yKXrVf3yNgRZ87itC+LhBOqDACZiCwB8Pz3oW2+YgveP
         pGCBguejn+wyND8R0m0H+CEgYOJKnLCwl74loHlU46uAz9rGfGbNBfPtGxqBd37HH3AU
         gcOniNKGGHoxDgVjtRdxl787kzGhkquhnfgajOD8m6ARS3NbVZcwo5mekgyakpbAZxu9
         mcqlO7Bs+4ZypnbZlEKv+ryJ0OL2PMKyCDd8pxvpPZ2S6YDdUU2DcvAV4sgPyfNLjj9i
         I+SA==
X-Gm-Message-State: AC+VfDw1lN1poZGli6tursQEIDBY3CxCKExH+HcEUolNEwG4u5GkqBw6
	ut2PKi0L55O4+rwF/BhsFEU=
X-Google-Smtp-Source: ACHHUZ6uYqqHl1zE5ssDd0SB9fMCXSY/0N7JQuBfmBIoG8JTeduQMOsvb99MhYcItZ9oquxrH0l3tA==
X-Received: by 2002:a05:600c:35ce:b0:3f1:96a8:3560 with SMTP id r14-20020a05600c35ce00b003f196a83560mr3424900wmq.10.1683358311473;
        Sat, 06 May 2023 00:31:51 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:31:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/6] Allwinner R329/D1/R528/T113s SPI support
Date: Sat,  6 May 2023 10:30:08 +0300
Message-Id: <20230506073018.1411583-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_003155_052266_A2528331 
X-CRM114-Status: UNSURE (   9.52  )
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

This series is attempt to revive previous work to add support for SPI
controller which is used in newest Allwinner's SOCs R329/D1/R528/T113s
https://lore.kernel.org/lkml/BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/

Previous discussion about D1/T113s support
https://lore.kernel.org/linux-arm-kernel/20230505224611.00c281f6@slackpad.lan/T/

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner R329 SPI
  spi: sun6i: change OF match data to a struct
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329 SPI controllers

Maksim Kiselev (2):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner D1/R528/T113s
    SPI
  riscv: dts: allwinner: d1: Add SPI0 controller node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   6 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  21 ++++
 drivers/spi/spi-sun6i.c                       | 112 +++++++++++-------
 3 files changed, 99 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
