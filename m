Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517EDEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a4EgWdtzguGwfvCuH0OrTVsp8ipO0K013lKYeeHVJrs=; b=1Aj8R3bx6DGQ6V
	1erx6vYYGBoU4qCj2FTqqIzXMeKwyLIaNi8Ks3veTVsgvz0+5LuCc0OICpXLa79oqTD9vCM8VTfyi
	TqctAit1xlJZZCvmJUkgx9n5re0lsbDLDuw9mInmvLoiBbJO1yi648JZSRqXhHMjq5CvspDQ8W53y
	O1Z5tmvjkC23t/yclN3xdvYr1V4ZysarkdFSo5K+CFuDtrmnKeDc1csGwYaVloA4RAN304mu/Expc
	u352+GzwJmf2h+FxaFx4oxBJKOzIhk8WFz2mxGVrZij0JPZJB3q75OM3kRc5CIN56zntoBEU95H+i
	f8krdSdTzdiPVNovc0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiPT-003sxC-1W;
	Fri, 23 Jun 2023 15:09:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiPQ-003svK-1Q;
	Fri, 23 Jun 2023 15:09:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so1000792e87.3;
        Fri, 23 Jun 2023 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532948; x=1690124948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyhSKyzxLiTaX2cHaiVENSWEBc27n/NollVdFdTZL5M=;
        b=HaP8+r9KISVI7nfSmXrI/Dq3qHIobkZcJPoB7bvvpeHg7K4V8muuEU5CjwPF6yz/JJ
         TNWeJFZve0S7yepHqm/kahqRzpEAzlDrzPlWIuWZVGgiE1WJgir+wIZ4zpaKs6yyozxT
         b0R34BOp7MMU8HwBM33r5HaRVufWY/kRaw6XHYa9T7efpI9hoYkAzzOPEKsZK/EjW5RC
         JIWA7ab2IZ/2ZGTSDz6coX0Siuy2GtLIGicw9MtYZ7ZPCGa3O5WJehBpxAL6s6+gB0Wg
         WvFbyVrATONdFafoiUxCU5hEnBLjAi/IPbuXxQ3UHTbxFhAHLlKc4WVUO5ZUu/S+5ehT
         x2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532948; x=1690124948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyhSKyzxLiTaX2cHaiVENSWEBc27n/NollVdFdTZL5M=;
        b=Qm8ItZxREfbMpZ1s4ZMAjr8qUFDR9Mq3Ftu/kwamIu2KTvPq31f1idf7IpF9fGaj6Y
         lZNhXRLUz/bw+NQASrYAI3/0EVUwiLAlO566Xov9xvMtjI8vsyao3suJuFBtz6E/UsUY
         0X+XeUbl/UPY8vVpAs6ti7ArhvKuftPCk9G1kyUOVC2z0pEkwZuh0C4ceJW/2N+SaK0P
         IKrvslfdbiO9EPVdBwlGAvX/9XOCCM2JM4f7dwsKDvEjU5K5CPoqcBsD5tFWP+RcvIjO
         V0yAFdr1hq+Wi//eVg3FsnF0tGGKBCsIKx/JU0XA2kC5dWyFg1K4Px3GMHlimOU+O33E
         Y0YQ==
X-Gm-Message-State: AC+VfDw1Si+oKHuMNFbolU1t7JcWimgVBmfvji2oIl2wJlH7jZJZwf9y
	tiijSl7ZO/7KB/NTnoVjdP/DE9ttpIC1
X-Google-Smtp-Source: ACHHUZ73xQWanjeo0B3wORGVnreb3HkxQCneLZLTQefVJHXDwD6Tmyy2CwDZIzgnt2dF7FMxNeXrUg==
X-Received: by 2002:a05:6512:2f7:b0:4f8:70d8:2902 with SMTP id m23-20020a05651202f700b004f870d82902mr10711352lfq.18.1687532947042;
        Fri, 23 Jun 2023 08:09:07 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:06 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Fri, 23 Jun 2023 17:59:58 +0300
Message-Id: <20230623150012.1201552-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_080912_478352_B4D9CD75 
X-CRM114-Status: GOOD (  12.70  )
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

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

v2:
 - fix dt-bindings
 - fix a remark in the driver

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  83 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
 5 files changed, 428 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
