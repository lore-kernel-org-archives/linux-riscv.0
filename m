Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC1FC5B54E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JGYOqC88Idc/kKz3WpUWiL+Z4YP6or6YBlng6VGFC/M=; b=LHrss3XozrXYZh
	rIQf9XJHTnQfljc65hZQ1tLjiZh4yi4EXNu+ZbFAx7xMgnP3bSI+BSV6a4gvE4pDhMGDhws38sJvR
	mCvJTqmInA5d8Uh5fsbbuWazEVlcD5CTlqhLcsn4I9P0D1ZUltVUMG8dXRTpM5vmQA77Gh/f6cX0S
	RzTwvHzD6gJS2EA1ocwHjXVNTpyJhoXx1LhogeJiIbmbrlZxabL6PY7J6C1dGZcOiEtQt6o5XpD24
	uQCIullXuFwMb7UOS1UgAyB85O06D4wYUGi06lXB8vKlNlUATTorh6lO3rv0m5mpwqkuQJ+KQ62pL
	hCKWwn4adtXRe+N1Z4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEG-0000000CsFG-3QoX;
	Wed, 28 May 2025 10:41:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEE1-0000000Cs8a-35Ip
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:41:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-450828af36aso214045e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428892; x=1749033692; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=Jrrg2HLoXtNPu+lnnUjInH/5DoitnUbCs3+/CWaxAJ6xh4oIaPL7H+jKI3ExmKuwI5
         rZeREgU3EZogOQdaxAGUOx7+v/ZsxdNuK69rCCv6brfU858rmfa9WJxUpeUVBRl1Ac2l
         PZHTAIBhV9VE5fT9/i2S9bbVsk0ekQ9tINQDx1MYSj8hU02U8xtB8KjhpvaUpD8m+PMV
         E0DQhe/KuMaUxTXxBPRf0YfhkkR1cKPLA+rTEY2YHbxjn32e9ao2uY8gG1RNYD1Tjf21
         qLGBaDCV0lWra9eW7qQBGPXHUJM0OERUrOf8C7y/pHOKIWZafmS6wH5RuH00G7J4+oLh
         mcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428892; x=1749033692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=ELVw2OwYjpwho1UWLFvyfb9L55gLWiBSfNvd0bbN3jUtfk7Dq95aoUAu8oYhAZr5cp
         sPMXjsjKjnPFl9lcPc/vUWYHfWw6ALLseTSGhZv3It4kv4MLHRKGNglEg0qXhE85uwnY
         y6ppmWgDYMYajn1/PizUbpzT0MfrAktyK+wbUyaAbMtLdTqaPM4FkV7d5ZAALxqsRiDr
         Kr/SzGeXOWP4DJumuZGCzlpvWLi2rjUOnouNfuiH66l0OZs6G2/opqk+DB+0brGA7EpG
         GNg3Qxmbz6LJO2SZKtUXd6SajScp78L7EuGi9Ew4/+9JruIPZBC3GtqhkjCpSETUwkkU
         JcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+uSLvfYsUBJUYH2d3SF8p2ivkttMYHd0gojh7BUAs4J9M0cBfZ4/yVe3cbINBifqWycpEO7jmtNyumQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpTwFJoUvIXhMkYMvAj/JQNV/INOCOmGeTt2yZG6plwTKSzAFl
	U+I4mf7cKoCQfjzb0CbT03odW79KQQkhlW4QR0mMM6wN9MXf8XQGQkuooFDzvMw7y4g=
X-Gm-Gg: ASbGncttumtvZTF6r5Leh8bcMw8y78qqHzJiyS2tSvN5weagsPLKQd0sy8+S9OkyeYy
	fBwRxTRuA75uaBgWF4iabNoFPDUq773ed/tz+U2p4TmAP+R1nOlVDFvmYi/0UyoBv/upn7G3qGo
	N9bBkipE0iYKX6uz79ZGzNe0hjgfQaHIUYqs5UUynz7+eBy/Z+mqkpgMhbAzfqUd9J9dKYbjV8f
	nzlNCF0l/nXV/290pP0+nya/qKVtyqOldfAfPI682scKrebsPj83zoEoTfIgFdTUp3xynZGGe4f
	xgjgQqZIHLTEsLprRSxAJNxvYM2Z8fr1wOxwp1mDpbFnesCbd3JmH22mLWWLu8WR3AUC2lk=
X-Google-Smtp-Source: AGHT+IGEfOLQIkgSBlZ2iFouY1f/KgLVcIHYsjuV4CgQ8KecLfZQnSg2l0D8HirR5K2pryTmJCchcg==
X-Received: by 2002:a05:600c:3144:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44ffbf6531fmr6551045e9.9.1748428891894;
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
Date: Wed, 28 May 2025 12:40:56 +0200
Message-Id: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjoNmgC/x3MMQqAMAxA0atIZgO1WlCvIg4lRg1IlUZEKL27x
 fEN/ydQjsIKY5Ug8iMqZyho6gpo92FjlKUYrLHOONvjJYHueCCdQW9cWAlb3xluBybfOCjhFXm
 V959Oc84fseaE1mQAAAA=
X-Change-ID: 20250528-pinctrl-const-desc-3a40e39eca15
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=31q5XaAMlBexIYczbpLSD3TpwdohBFMpqp6LWBCJyAo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhIG4ER1L7WtI9n7LAHBv7yR7/wd9Y62GAPM
 YOkBRMFzV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSAAKCRDBN2bmhouD
 1/WaD/9J3m4W4vBhw2XThuOyRYX1b6hv7wnFg0kwf/oG58B+tqan9UkROsMsYaftbalsBBZ5ZRN
 1M9nkKj1NYeRqNX8GD5zgdOlhg99/xoNAe4tKnXdHhemj/SZnMwRRpjoouoI5MZtU0Wyr3D/iRh
 apzqHY1Bktzyyz3i0o+EX3N6UGXKOyRFk/Nv4gpE89Tnp5pCpCtNpTewhTStIJo5v/+Zbe2YPrQ
 AnR+OeW0EPpY4/9GqX4FIXW/SBGtMEBrUl82vugNf3cxGgJTWmgAVoKYZNsVPsoZ7Cw5w9ZG7UJ
 nT+moUwF280v4jVOMoAy14NfrX3rj2HWST1PKwMiowU5NSmpEaJi+w6xE/2vB6qVh2QW7+3dAaA
 BpZVKNBQeFJMhZ8WdOg+Jh/qQ6uiZPxIFnUZRKqjwl44agPEeENckIbyD1wJJfAA+JkHuc8AiPh
 V9ANQmhknrtWhe7+PeFJI8GfxRXLnum00ByOaQGly2msm7YKUjNC5gshTcRyWaWNB5rCwL7LPa1
 0IdR7g9/Tt/4d5KIA6xWPHTzupJxtq1nsBEZwM9n0z2/82V8a2ByQNlhmzte2qCLPiweUR6oikT
 3AEpIeiINOC5++QtVlihhuU7o9fNUbOyMpEqQNMr5jj0m6eoELYBLii4S7gWJrXGzT0Ya3JNLAx
 mzmNbbD8leWapdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034133_818984_24A0B455 
X-CRM114-Status: UNSURE (   8.67  )
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

In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
prerequisite for all further patches, including RTC patch, therefore
probably everything should be via main pinctrl tree.

I split several patches, although not all, per SoC-submaintainers, so
reviewing will be easier.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

 drivers/pinctrl/Kconfig                            |  8 ++++----
 drivers/pinctrl/Makefile                           |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-ns.c                   |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 ++++----
 drivers/pinctrl/berlin/berlin.c                    |  2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  2 +-
 drivers/pinctrl/core.c                             | 13 +++++++------
 drivers/pinctrl/core.h                             |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  2 +-
 drivers/pinctrl/pinctrl-amd.c                      |  8 ++++----
 drivers/pinctrl/pinctrl-artpec6.c                  |  2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  4 ++--
 drivers/pinctrl/pinctrl-bm1880.c                   |  2 +-
 drivers/pinctrl/pinctrl-k210.c                     |  2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  9 ++++-----
 drivers/pinctrl/pinctrl-mlxbf3.c                   |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c                |  8 ++++----
 drivers/pinctrl/pinctrl-tb10x.c                    |  2 +-
 drivers/pinctrl/pinctrl-zynq.c                     |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 drivers/rtc/rtc-stm32.c                            |  2 +-
 include/linux/pinctrl/pinctrl.h                    |  8 ++++----
 36 files changed, 69 insertions(+), 69 deletions(-)
---
base-commit: 08ea0cc455fbf6f6719b7a4cdcd1d132ea34577b
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
