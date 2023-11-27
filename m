Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED1AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 00:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+bArmsQtkD74UGH+o2dFqqQYLkvl3hAlxGu+tzHXbJE=; b=Xf3Ox+oFS8wptt
	pCeJTONbS5lsVdoPTtjRA7we/ZTnjBlyCr6T70mvVb0q6oIEOvS3QYU9hNZghYj4NFCAYDPS6SQg8
	mrnCW+6V3KZ2RiXMxiqAo1NNCEIKu39RzlZqjjKW4gV7miFNTXtZHGZl+zMZGXQEyOVROVF29dTxT
	Y+fRqhRLNX1V5ksXAVpDHO71v5Qe5sLSTRW79lz1nlOrB6idfzsh1zfp36/0cr0C3Miy0k8O7nvKn
	aiQedM7lKGUpG58qfHJAMCjvU3Inlp+1+vQIivUnkOZ/zUh2thfH53i+4AiLI1xp7kCxgre77S9nE
	hF/3Lh6J7vj22+kCXpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Pwg-00HXky-2e;
	Mon, 27 Nov 2023 00:57:54 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Pwc-00HXgi-0T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 00:57:51 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b2f4a5ccebso2502185b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 16:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701046667; x=1701651467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anuKUTT2qQ23MO72ERy79Xb3CqrQxY2OTkF5ssDc4FA=;
        b=E8MF8tuFi8a469xemI4RxhsMGDmn03pJU97vX2M+s5+MN4EpNh8Pu9kz9UfD/CmXCX
         EnZq9VfWN+QcJo9NixsiLkyVGWa4cUsv+gTfZ/K3xtXIUFwBj06RBZdylxxRFyCoqwdn
         +gF8ON8f/3ezwqYULLOu8coA4pDT9a9vjj2gCwR1LfbqCkUq19iBV4dEPaQAlATm7iEP
         GiJt009mnB76w78G/BDbwdwUhh7PI8B5bmtqXe+YerzgXF2FebTpPxbt9MnJ4tvny8vD
         7AUWVioPfu9mCRDNTyDoOCvoJnSBU5P2buVRe5HHb6wZf1O4Bx4SCQ6O0oF8QCcCsuTn
         gk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701046667; x=1701651467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anuKUTT2qQ23MO72ERy79Xb3CqrQxY2OTkF5ssDc4FA=;
        b=nQDARhbWp7/r3cXEV5C6mpEK8Ec+ixjkdZnSpVfHCNikohYclDxp58zdKTliw920y/
         o+vhy0ltX8cGa9+Rl83BuFoP631ipReyS3YNqPNO9ephe6wfpwpmZjgRLDNy9DXupy0q
         ooixmSHXTiDGZHbw3VumhsvFfcS6FZLKQDFF2auQ5ELfmI/oFLJL6S/DZ7YAf1SCTJj4
         LNSS5/WpQhsv24a6dfHaB1jTlr5ArqDsv0nEPL0p3SyaahEOu7bomLtuuO70cvxWjRif
         MSAghx4EqOi9OG1XT58RsxrSxE1/zdf8k2wEEX8aP3W9SSIuj3Lh2n+K7Yi1FK+yhfLZ
         cjvA==
X-Gm-Message-State: AOJu0YzNLe6kcvPf1rsychQ1wbkCwukNCexIVA8RM8vaqCCbz81Mw3+8
	jPrzybCi9EIuxCP+n1rDM0I=
X-Google-Smtp-Source: AGHT+IHTXVRmvu8R/pFriTl3YpWLtwnkQFp4TQPulykiB18SUXQvFyQZ+lHa0vp89dnaAul0sfyj4w==
X-Received: by 2002:a05:6870:5490:b0:1fa:2fbc:5906 with SMTP id f16-20020a056870549000b001fa2fbc5906mr5838689oan.42.1701046667393;
        Sun, 26 Nov 2023 16:57:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pi10-20020a0568704c8a00b001f9ec4edbfbsm1651566oab.50.2023.11.26.16.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 16:57:47 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 0/4] riscv: sophgo: add clock support for sg2042
Date: Mon, 27 Nov 2023 08:57:38 +0800
Message-Id: <cover.1701044106.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_165750_201511_D493FC0B 
X-CRM114-Status: GOOD (  10.78  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This series adds clock controller support for sophgo sg2042.

Thanks,
Chen

---

Changes in v2:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [2].
  - Squashed the patch adding clock definitions with the patch adding the
    binding for the clock controller.
  - Updating dt-binding for syscon, remove oneOf for property compatible;
    define clock controller as child of syscon.
  - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-frequency
    property of osc to board devicethree due to the oscillator is outside the
    SoC.
  - Fixed some bugs in driver code during testing, including removing warnings
    for rv32_defconfig.
  - Updated MAINTAINERS info.

Changes in v1:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [1].

Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]

---

Chen Wang (4):
  dt-bindings: clock: sophgo: Add SG2042 bindings
  dt-bindings: soc: sophgo: Add Sophgo syscon module
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   42 +
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      |   58 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   77 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1357 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  222 +++
 include/dt-bindings/clock/sophgo-sg2042-clk.h |  169 ++
 12 files changed, 1948 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo-sg2042-clk.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
