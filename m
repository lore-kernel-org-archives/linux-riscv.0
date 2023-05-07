Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E016C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cl3lM6cRgVOXx3nvAU3jWVnifajDbkSg0Op7LLEwEvM=; b=H1WapOgRPWgC7A
	dkMWyrgsBiUNoruH24z+0MCjheWOspb9hMw5CdlB8Wf2bOnc0VyWv4vxN1ooU9UyB46ztkJUh8Oca
	A+XSZBzQPPQq9qbEklJdCyQflKX4Sm+laRnYP77XCNsNvN7K8bnBJPDdIijmVZ0ElnmlLfXlZmkUj
	XHxNie9HyJAUwHgZ5VuWUJFjPRxy9jI//r8MTft85rFPQ8w1YeTPs6m2s1rMQZ//MOVe5Scyp5QBh
	zXClsUXxLvcQggJ1WMEZEjdVUF5Tsv+AaLSRutCXtrB29GzFypWM5JG4dIj1KAvZVN83lWuhEM/R8
	BqnQcNGW3zwq9V3nTBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfx2-00GFHT-2N;
	Sun, 07 May 2023 15:05:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfwy-00GFGl-2S;
	Sun, 07 May 2023 15:05:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so36405125e9.3;
        Sun, 07 May 2023 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471922; x=1686063922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1gOIjKe06QTC2zFJd76oybW6RyS2NvpPacxfKSj0+o=;
        b=qfI8xnweP237OM6kO0nttjGF/sPZ1FyaqS37OyLfJUkMl26Q8P/D7/t3H2ZUcN+3hY
         NkzI4xWQibUtdLJgaN5pg5zu7cRkiZEUvqa0h6FeInj2IY1hyiHec/2nwhEvsHJKdx36
         D7c80OfSJf2jRa5fbHjAA+WpN00egLzqo4IYONlqPEKs+JjBlJeQPQKAS3qInBf0o6N/
         JBCJBkr4ReYTtOXXRHdGdGEpbdENxHw4DDIm6IWg9mPt4uNNtly92dbbrPscfT4rqJar
         +0IJz67j9SsHNBDAa1DxACr0LJUZSSWGtdsEmz8m6xxik9MUl7PC9xZawXL4BN/51PC5
         4/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471922; x=1686063922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1gOIjKe06QTC2zFJd76oybW6RyS2NvpPacxfKSj0+o=;
        b=PlqneDVpq74eox7oYCthlQENxGAup8y9+5m7/h4qedqrfyHiL31OutREQG+ivmQTpj
         JrHo2b8nvKEYk3UzMU0N0grfaU4WJK7XqQKdVykXP93I8eurWPKeKl2Ulwc5GCLPnKPS
         DXh4zUD4igrjImaWUj7VA2nttfxvn5ZFlGYIIE2OVN4+IYnF670fGCk9ouArxovtBxSR
         zplBTGy4GVDg7EwghHZRzLle2T5LP7PZeK8HH/6lhAHVQ5jDcCnL/iv7ooM2jDCKcqQ0
         E7sHKLhObCYxHXIyG/SShaOlKQYLJfRBBh89w1z3zc3q6luSPDvC+f3y8PhSf/o98+bl
         4TSA==
X-Gm-Message-State: AC+VfDy3xQVQQc/9UD0k8IZVBA2uGWaCLWLA8amxMv2doa6C3sb7gMWg
	dj5PkxDIzF/YhOkkocZkfBI=
X-Google-Smtp-Source: ACHHUZ49sAKwYQSdkkwmMAeCU56EtVFg4Uecv9K3y8A0Pd7XH4negQYK2N3mKJ+yafcQ5q+Af0p9lw==
X-Received: by 2002:a5d:53c7:0:b0:306:2db9:a33a with SMTP id a7-20020a5d53c7000000b003062db9a33amr5647820wrw.33.1683471922170;
        Sun, 07 May 2023 08:05:22 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:21 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Sun,  7 May 2023 18:03:32 +0300
Message-Id: <20230507150345.1971083-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_080524_841206_74753256 
X-CRM114-Status: UNSURE (   9.46  )
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

v4:
  - fixed SPI sample mode configuration
  - sorted DT bindings list

v3:
  - fixed effective_speed_hz setup and added SPI sample mode configuration
  - merged DT bindings for R329 and D1 SPI controllers
  - added SPI_DBI node to sunxi-d1s-t113.dtsi

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   7 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 131 ++++++++++++------
 3 files changed, 135 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
