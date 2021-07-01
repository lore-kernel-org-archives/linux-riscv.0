Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831C8C11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:22:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E63461452
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E63461452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HxF06/PenWaVku+bMet0F5xxIDBTOI3TPK9qmojU+3Q=; b=x5jieq7iJ/MYs0
	vAzQozMqF39s9lqakocdexKuWGdw/igSJNgqgJI3ylqB2shRBaXGeGXfqG2rIK84UanJ8h5qqtC5Y
	rjMVx5wGzkl7aaj8+st9r4f5oRrBhdyo1e4erZlKKuAHeFBUzrbz9PtjsOHzgkg8ovabpmca3eIpI
	UIobs9lcbqRAd61y/F200kKAGWpFaifL3w+vkufYebAxc7AgM7/0KB6IjvM+5dFTx8sy6bppPgpLH
	Rj3oRxmxj5cMswQpG8Z613g4ErFJ5Sq6wo4gpc8AM8LAjS4Xysh/IkqlPni5tr9GSyRYpk3Sss3zz
	6d0zj4HZJXPkj/9D2MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lykTK-00FfHc-8D; Thu, 01 Jul 2021 00:22:26 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lykTH-00FfGU-C2
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 00:22:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id y17so4371150pgf.12
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 17:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aDnQQVopiKheNy1UmrcDKnk3g5arjbzcZ1y90JZZMEs=;
 b=M3wYEGtW3GTTHBiLO2Frsst4YQL4Cnl39+BXgG/RQwxVotP5Sa6p9h/ATQ2/JVZtlp
 CP3mu+tG5NrGUOI91b9fsO9nk+eXzOkzYWywp3TRvFLqtlfB5lzxdxYh7fGkAKSoOEM2
 CSMmS06vByZZiYM+bewyGDYmzsaOUfPpd2xmpju4H3+E4wI22B0SXPkaUUddMyIjHJ+o
 D5QUhNAPC+FTGZbqegNyctpPLY8yuKHRcRdeaByJkVb2jxikijyl6BujzqTQMaqbOxUu
 msWn589rNB72uXXM58oR3bSxMa/r/mxx8yVHRhma3JuJgAisLMrWPJxZ8P2wkgTNs2Zs
 gQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aDnQQVopiKheNy1UmrcDKnk3g5arjbzcZ1y90JZZMEs=;
 b=iMtaLATy1Vt6balQQh850X0meWpMs185olhdMy3PXHeIjyfAQS6UVmPmc0Wzr8Ssig
 zPsOa8E8/tAb6gPp4jNx4ftQag9kJnIJvhE/WfWvEPYgVBIMUOXSHz8YE+epA0PJ2n8E
 YWMcA89w11U86n6pdQvBtjwjaKF6rJCSAUfjbKnYHRieQ4P9OKeQ5DaqxjOpSXzlZntH
 LWRkYWHO2ZjZwSYmCtckprFYEylUEEAHqA7i71s1KVt34Ng0bE5ideZabRYI65r7dMr+
 VDY66hHctXYrooZ58b6qNCAieu3gONHrTspxK+MP2e1m8Yd5VHYcXAhpizjUdU6xDAut
 tdkw==
X-Gm-Message-State: AOAM533SGHVqfEeqkbpsUzzFwhcRSuom24/rydXO3iiGLy6diJMLbMRq
 5I0RLpH1jDrkPyaA3RryQary2Q==
X-Google-Smtp-Source: ABdhPJw9dHks1Q2cYpLQ4+BAPxfbpT1UUQrH7in4l6B4aRPRkgWDW4GfL5ler7PScrKh481PnMGNDQ==
X-Received: by 2002:a62:e309:0:b029:310:dd66:a4ba with SMTP id
 g9-20020a62e3090000b0290310dd66a4bamr2138162pfh.13.1625098941778; 
 Wed, 30 Jun 2021 17:22:21 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c0:4701:ae70:8687:fcbc:6b3d:c844])
 by smtp.gmail.com with ESMTPSA id v6sm25117495pgk.33.2021.06.30.17.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 17:22:21 -0700 (PDT)
From: Drew Fustini <drew@beagleboard.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Drew Fustini <drew@beagleboard.org>
Subject: [RFC PATH 0/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 bindings and driver
Date: Wed, 30 Jun 2021 17:20:37 -0700
Message-Id: <20210701002037.912625-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_172223_505060_CDD55E3F 
X-CRM114-Status: UNSURE (   9.99  )
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

Add device tree bindings and driver for the GPIO controller in the
StarFive JH7100 SoC [1] used on the BeagleV Starlight JH7100 board [2].

The dts using "starfive,jh7100-gpio" is in StarFive's linux repo [3] and
is being cleaned up in preperation for submission.

[1] https://github.com/starfive-tech/beaglev_doc
[2] https://github.com/beagleboard/beaglev-starlight
[3] https://github.com/starfive-tech/linux/blob/beaglev/arch/riscv/boot/dts/starfive/jh7100.dtsi#L262

Drew Fustini (2):
  dt-bindings: gpio: add starfive,jh7100-gpio bindings
  gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver

 .../bindings/gpio/starfive,jh7100-gpio.yaml   |  60 +++
 MAINTAINERS                                   |   8 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-starfive-jh7100.c           | 425 ++++++++++++++++++
 5 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
 create mode 100644 drivers/gpio/gpio-starfive-jh7100.c

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
