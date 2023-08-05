Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957CAC001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6vFUXGJct2RSgYGnGZ5LiFYqSH7hCVmN/qgztqWWcz4=; b=T7BZ22fLv8pDcW
	5re+x9gqhZed5IZvXjtRY8SNeScIdo5peGdBZDshzfhSknbEDENe0L7e8AUUbUwTfOwUcVSsW7Uky
	ltr/f9NLFFRBowfCTycl3oeiCFZ02uvP4y+h2wGanfaT1pyrsRIKMab+Vw1iTBw4hiknl2sFl1JBa
	jhuCKdyvmI+fBvhslWrKlYWZl0JBhGZP0TCNPGBU/ygUaglH468HIwmNj3QLMGwCdwAQryfxe8DVH
	UVhJJeuSKZNUyRgxQXmC5G1mlewBdKTDqlqhdJIxtv1aikya+rTfllEZhUVwLJwb3I+Z3VVgcCC4t
	8Tj2tMHOlPcuxBN81SzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLeq-00EQig-1T;
	Sat, 05 Aug 2023 18:05:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLem-00EQh6-2V;
	Sat, 05 Aug 2023 18:05:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-317798b359aso2530599f8f.1;
        Sat, 05 Aug 2023 11:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=n0fK/y30pRu67o6OdFtdPg9SBOZqPhrCfGUIUocdWZjGdUAnThcdzYcbzdDR5Cy7ZF
         Tb4BjhaShFAziu49DZm5WGefcbR8geefa8kJjdc8BO6EgWlYcMlFibBJiaEvgj9WlP6v
         qSkkm02uz2+hqpZi66JrB69ZA+yjSKuauQ3jGgYf1Nxlp2aFzSycIoAcf4bklWfTILZA
         v/fVLZmzWwh6YwsMLwsmDw2UMQXXP0k0iol0blojjuQXXalegi1jH91cCOwFeLvT8J2i
         qlEXnndY6XpbggsMj9nzzDdKUDtQpzljDFtYbAqLz+ivTVk0PtRzBfmWnCXbzLTpMeWY
         5N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=QhTLPumY6G4/JHipbaT4Rmvd0wXX04CXLcuOm6X+QPuSuGPejh9QkSYoRt7awAAAa+
         iK60JE6LIZwFHsu5sJPOE54j3dpYOEsvwEIzFSmYDVlcolo5y0RH8YThS9JydjOkLs7y
         77thdzCp4FV7czlq4MZrOm6+9tmLNxziZOkSRRLvVbq7opuXOJQOIUw/xmkkGIyNFY9R
         qixv70rtz19ORG0j5HDBok6TTVCYoxA8C3zGG1Z40yBeTWBr2s2TjWIaE376z+r8JkWJ
         6FdKpOkA8NpKfuDriw/O54iFs7vo/mBNehUpnpymmd/28pRX4dWQdh/vy4JqgsBvNpgz
         U5NQ==
X-Gm-Message-State: AOJu0YxDFS44e0QmVF59DL7DQf9UHk4c7Q8w5QgA9nmC8f1we1BU66pe
	rB3iyBjgwoUkFznV5xQu8wk=
X-Google-Smtp-Source: AGHT+IE+5m/SQ3eshBedJihbRDlO9MZ+wChC74UcCgeJKgphC3WBm37dlSMr1RZdbjAWZFPdnVj2lA==
X-Received: by 2002:a05:6000:10c6:b0:317:6fff:c32b with SMTP id b6-20020a05600010c600b003176fffc32bmr2915238wrx.53.1691258737930;
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] ASoC: sunxi: Add support for D1/T113s internal audio codec
Date: Sat,  5 Aug 2023 21:05:00 +0300
Message-Id: <20230805180506.718364-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_110540_812450_C6AA45D2 
X-CRM114-Status: GOOD (  14.45  )
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

Hi,

This is the series adding support for internal audio codec on
Allwinner D1/T113s SoCs family.

My work based on Icenowy Zheng's patches from sipeed repo that adds
support for the R329 audio codec. But, unfortunately, these patches
were not sent to upstream. So, I adapted them to fit the T113s.
In the future, support for R329 could easily be added on top of
this series. Because D1/T113s and R329 SoCs have almost the same audio
codec IP, with slight differences in the analog part, plus the R329
has two additional ADCs.

The series includes modifications for the existing sun4i-codec driver
that brings support for the digital part of the D1 codec. And adds the
new sun20i-d1-codec-analog driver for the analog part.

I would be glad if someone have a look :)

Cheers,
Maksim

Maksim Kiselev (5):
  ASoC: dt-bindings: sun4i-a10-codec: Add binding for Allwinner D1 SoC
  ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
  ASoC: sunxi: sun4i-codec: add basic support for D1 audio codec
  ASoC: sunxi: Add new driver for Allwinner D1/T113s codec's analog path
    controls
  riscv: dts: allwinner: d1: Add device nodes for internal audio codec

 .../allwinner,sun20i-d1-codec-analog.yaml     |  33 ++
 .../sound/allwinner,sun4i-a10-codec.yaml      |  64 ++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  22 ++
 sound/soc/sunxi/Kconfig                       |  11 +
 sound/soc/sunxi/Makefile                      |   1 +
 sound/soc/sunxi/sun20i-d1-codec-analog.c      | 220 +++++++++++
 sound/soc/sunxi/sun4i-codec.c                 | 364 +++++++++++++++---
 7 files changed, 643 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
 create mode 100644 sound/soc/sunxi/sun20i-d1-codec-analog.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
