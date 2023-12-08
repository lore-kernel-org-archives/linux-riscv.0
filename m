Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB12C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G6u5mfkeQyXwqCQm8TVSv9VAcuUpTc9xiMDaeBgiVRs=; b=lIjiNMQ6WnTKyB8cop0kIMjtPk
	cNZSmIme2m8NOUl0PUo1Hhu15OwZa+hDhpDRLDfn6uz+zdJIorgoKFJr1Zkko3rObPPDK6gEOqzdR
	6rMWA4sNMiLRtPrkiMGQWIyUsDTot4lhZ4tsk8DztpKMv0hWI63YJO4+jRYRAgp0WIcueQn8TvbGx
	/DDB19/hRw7NFMPotntFGMZvOyfBB0jPwPVxGmkTQOMaf6P4rCD9qnnwB02Syj2qPeKiMP7PoldsL
	LqJblTWErQ5lyUkWlvLv4AiQYR/Hb25ggVJ16xZ2cX5P4iNewFMgE9h+L41Wtn11JovswUIrbDMhV
	bgh1L3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBe5n-00G61J-1n;
	Fri, 08 Dec 2023 16:52:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBe5k-00G60r-09
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:52:46 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D22FA3F4CC
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702054360;
	bh=/Bd1WbAs6qqomxx2kkYhHR+Yd/EnW7VyJ0zhFUm1arc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZO1JkcUwURDx3F4LyNI7uSYhU7PxBEzR5P2XVkYyNbLYTeEh4jZEae5cVzENfy+aO
	 t5zDW0EpxXwbVA+mLXu69C55w6rW+bRffLQhur4VaTGgxdoBHfsSpt4m0L9zfn6ixd
	 /uymLaoTK4jKRe0BCLPhLnZI1fby+reRtiF6Qqm43qpghPQ43wR13VCLIlP9Z3jiVi
	 eQdfz46SYniD6PHmx1FS9eS3VyzMXkqHRBNiiLmaaWibZ5iptczeE6T+zkpGIgAAyd
	 OnWMFF/j9l7zdttbMMjF9dFF/+okqRk7ZU+rHIPkQ/UUSV9XhzqkSj5GQeNY7Ln5VL
	 46mdBfHuxpggQ==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50be5bdae9fso1759213e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702054360; x=1702659160;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Bd1WbAs6qqomxx2kkYhHR+Yd/EnW7VyJ0zhFUm1arc=;
        b=poQT8+2QC6vn8I1X8utarJVam0vBtkuJFwamxQC0WU0HV0cq70xqNGClbDZov9IE60
         sdnmRu4/Nfok3U+nN15AjpN/dX2YTpEAZixi6AqDwKE1oKryWmGH6O8MmWbFf2c3mHIh
         BKEHubhz+4mpdE6s4suv88aRSHCUYC1BPgsp7QQYYZ5QwujzCam8st205ZJYz0gsSAyS
         lUFU8yF0dwS0tkqQ2fdJScPwUspLS3dsTeoLku7bvD5jQB54G8BvYMXXFt6UsRJiN59j
         P+rcDd04pBBvt1F87woW258Os9yudJdXJmOsz1ckiP4TGKwNW/7MJSGEM3t/OwaONaOH
         7fVw==
X-Gm-Message-State: AOJu0Yy9UW+PVx2KN/EVL5hMVx1mPnz48ey+U35HPloTS9oiGdQPe4U7
	5oF0pnkjxkQPOjEI21mlqJJ3hy49U3OhESKCLwkp3mmYabeImGfPTsC3+j4Sdxb2Fe6ImE3yZd1
	Y+TU80As6wtk3Nw9If5HdP2pYKktAuERjnotKmD5/oaoAchiBAUMpwg06ww8r6g==
X-Received: by 2002:ac2:4c3a:0:b0:50b:f2f0:2b0f with SMTP id u26-20020ac24c3a000000b0050bf2f02b0fmr84002lfq.133.1702054360232;
        Fri, 08 Dec 2023 08:52:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0PijjlqLMVDLUKgcONltdJP4HQSQPKwjj3DWwcCvbfjgx6I0eC4m1N1xg0Tj+6jTQMSHxMH3QI1YkxoNxO2w=
X-Received: by 2002:ac2:4c3a:0:b0:50b:f2f0:2b0f with SMTP id
 u26-20020ac24c3a000000b0050bf2f02b0fmr83988lfq.133.1702054359905; Fri, 08 Dec
 2023 08:52:39 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:52:38 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:52:38 -0800
Message-ID: <CAJM55Z_nnrFcU6N8ZELUoGLe6Dp358aXH7VGf1i+USbZOsbpnQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Basic clock and reset support for StarFive
 JH8100 RISC-V SoC
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_085244_363519_DFA1B57B 
X-CRM114-Status: GOOD (  16.27  )
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

Sia Jee Heng wrote:
> This patch series enabled basic clock & reset support for StarFive
> JH8100 SoC.
>
> This patch series depends on the Initial device tree support for
> StarFive JH8100 SoC patch series which can be found at below link:
> https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
>
> StarFive JH8100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the 'jh71x0' naming convention are renamed to use the
> 'common' wording. Internal functions that contain the 'jh71x0'
> naming convention are renamed to use 'starfive.' This is accomplished
> through patches 1, 2, 3, and 4.

I'm a little sceptical all this renaming is worth it, but if think it's likely
that future starfive SoCs can use the same clock drivers I'm ok with it. Just
know that you'll look a bit silly if your "JH9100" can't use these drivers and
you'll already need different starfive and starfive-gen2 drivers.

/Emil
>
>
> Patch 5 adds documentation to describe System (SYSCRG) Clock & Reset
> binding.
> Patch 6 adds SYSCRG clock driver.
>
> patch 7 adds documentation to describe System-North-West (SYSCRG-NW)
> Clock & Reset binding.
> Patch 8 adds SYSCRG-NW clock driver.
>
> patch 9 adds documentation to describe System-North-East (SYSCRG-NE)
> Clock & Reset binding.
> Patch 10 adds SYSCRG-NE clock driver.
>
> patch 11 adds documentation to describe System-South-West (SYSCRG-SW)
> Clock & Reset binding.
> Patch 12 adds SYSCRG-SW clock driver.
>
> patch 13 adds documentation to describe Always-On (AON)
> Clock & Reset binding.
> Patch 14 adds AON clock driver.
>
> Patch 15 adds support for the auxiliary reset driver.
>
> Patch 16 adds clocks and reset nodes to the JH8100 device tree.
>
> Sia Jee Heng (16):
>   reset: starfive: Rename file name "jh71x0" to "common"
>   reset: starfive: Convert the word "jh71x0" to "starfive"
>   clk: starfive: Rename file name "jh71x0" to "common"
>   clk: starfive: Convert the word "jh71x0" to "starfive"
>   dt-bindings: clock: Add StarFive JH8100 System clock and reset
>     generator
>   clk: starfive: Add JH8100 System clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-North-West clock and
>     reset generator
>   clk: starfive: Add JH8100 System-North-West clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-North-East clock and
>     reset generator
>   clk: starfive: Add JH8100 System-North-East clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-South-West clock and
>     reset generator
>   clk: starfive: Add JH8100 System-South-West clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 Always-On clock and reset
>     generator
>   clk: starfive: Add JH8100 Always-On clock generator driver
>   reset: starfive: Add StarFive JH8100 reset driver
>   riscv: dts: starfive: jh8100: Add clocks and resets nodes
>
>  .../clock/starfive,jh8100-aoncrg.yaml         |  77 +++
>  .../clock/starfive,jh8100-syscrg-ne.yaml      | 158 +++++
>  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++
>  .../clock/starfive,jh8100-syscrg-sw.yaml      |  66 ++
>  .../clock/starfive,jh8100-syscrg.yaml         |  66 ++
>  MAINTAINERS                                   |  15 +
>  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi  | 180 ++++++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi      | 115 ++++
>  drivers/clk/starfive/Kconfig                  |  49 +-
>  drivers/clk/starfive/Makefile                 |   3 +-
>  drivers/clk/starfive/clk-starfive-common.c    | 327 ++++++++++
>  drivers/clk/starfive/clk-starfive-common.h    | 130 ++++
>  .../clk/starfive/clk-starfive-jh7100-audio.c  | 127 ++--
>  drivers/clk/starfive/clk-starfive-jh7100.c    | 503 ++++++++--------
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |  62 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |  72 +--
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |  94 +--
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 523 ++++++++--------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |  74 +--
>  drivers/clk/starfive/clk-starfive-jh7110.h    |   4 +-
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 327 ----------
>  drivers/clk/starfive/clk-starfive-jh71x0.h    | 123 ----
>  drivers/clk/starfive/jh8100/Makefile          |   7 +
>  drivers/clk/starfive/jh8100/clk-aon.c         | 275 +++++++++
>  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
>  drivers/clk/starfive/jh8100/clk-sys-ne.c      | 566 ++++++++++++++++++
>  drivers/clk/starfive/jh8100/clk-sys-nw.c      | 268 +++++++++
>  drivers/clk/starfive/jh8100/clk-sys-sw.c      | 136 +++++
>  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++
>  drivers/reset/starfive/Kconfig                |  14 +-
>  drivers/reset/starfive/Makefile               |   4 +-
>  ...rfive-jh71x0.c => reset-starfive-common.c} |  68 +--
>  .../reset/starfive/reset-starfive-common.h    |  14 +
>  .../reset/starfive/reset-starfive-jh7100.c    |   4 +-
>  .../reset/starfive/reset-starfive-jh7110.c    |   8 +-
>  .../reset/starfive/reset-starfive-jh71x0.h    |  14 -
>  .../reset/starfive/reset-starfive-jh8100.c    | 102 ++++
>  .../dt-bindings/clock/starfive,jh8100-crg.h   | 430 +++++++++++++
>  .../dt-bindings/reset/starfive,jh8100-crg.h   | 127 ++++
>  ...rfive-jh71x0.h => reset-starfive-common.h} |  10 +-
>  40 files changed, 4485 insertions(+), 1242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-aoncrg.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-ne.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-sw.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg.yaml
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
>  create mode 100644 drivers/clk/starfive/clk-starfive-common.c
>  create mode 100644 drivers/clk/starfive/clk-starfive-common.h
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
>  create mode 100644 drivers/clk/starfive/jh8100/Makefile
>  create mode 100644 drivers/clk/starfive/jh8100/clk-aon.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-ne.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-nw.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-sw.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (55%)
>  create mode 100644 drivers/reset/starfive/reset-starfive-common.h
>  delete mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.h
>  create mode 100644 drivers/reset/starfive/reset-starfive-jh8100.c
>  create mode 100644 include/dt-bindings/clock/starfive,jh8100-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jh8100-crg.h
>  rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (50%)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
