Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC574C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W2sCeoYgdmzEqWwBYyhV0PScSwPFqI5oZ/LJID68Ff8=; b=rFsTEcsFAzIxm6
	0SQOgf3MCW16jAhJkG46egVm+3HW8kRrpq75HG9Rn/odBGJlLQ+zTpcPvQt+YsA7wv5+JZBPhrfyL
	GSPe2wKeLCBjzY4xlkmq8dlA70V/eVEjlSyqYuBfiiXkGce0FZMfjEt2w2z9FjYPLzhf6Op9L018E
	GvTad7V8jGj1sY5eHFBpZqWtrtRMlkQBWM1biETNchBSn1p7OFhZYzVZkQ46l++onYUqBfKcYnBuR
	RNp7j8ksgIWDGcDmNm87Hul7jLUwWSBh9LPxYqmtRMAmZ1kK3e+3WF8KfTUSp3VJbVuj1/nvnZUAp
	jL+NpCWqVqVO1Y5cBnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WpU-00E2Ch-04;
	Mon, 13 Nov 2023 13:18:16 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WpR-00E29K-0N
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:18:14 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b2e73a17a0so2721949b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881472; x=1700486272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMYVHHaJeCjmpAavU23RMpRyLk0TWskkcBNgC6viZA4=;
        b=DWcwhCC9NM9a4XqXKbHTKIYdK6whwbCN040zIhlU/jop2xAPHp4jiwpsiftJfFeTGz
         EggQtzlcBg0GPhGwd7iBqyPQIHE0Hi25R2E4DUZ8QDnYG8lR7vTk+t3QDm2GSstuaCG2
         1FsmT/aYswk5nBFqcXk+Sdm4y+QtEuk3E1uVndtAGPzPZxVquIe5CIHDbwhutyJzg9v/
         qIXPTZIMB97DUAMCZk0/o+OFoYxRF7Lpve0FZFSwiePsZ9197oZl2SO+onsJPVcRpDuu
         j/7RINwFN/riN6s7KCde3zx5d1Xtp7lndIzU2m3wByngsnz18Juyq1aVCPkCgK+0vfKd
         1jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881472; x=1700486272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMYVHHaJeCjmpAavU23RMpRyLk0TWskkcBNgC6viZA4=;
        b=ggMPrkduGGYyPzccHVA2B+fODsuyRrwtc1kpU/dbUbz2WyLC5zmsBIO0yOxboYquBk
         Cs2gKPQ4ncDwLUqB1ojIhkhsFP/TbL2p0R6VM7LacftR7nKkQ54k+kd94afPGID5ZodU
         POU9yzjwcA22rvlqD4E5/tpkfw/2AA+NqG0PURY/LaecdP+jV4V1HJGutwttAsmXH1kC
         XV3cuyE2BTgssbW370kJ2ctfO3eR4sP9dyVG/9NpLLsx3WZkr8QSaHxy21d61YrFKVXK
         k1lGixGTLMT4GtSLk9rt2v0cq7S3ADV6QpEm7XG4ZtYE5hJflezAFYhR8bnjtmQXqQ9x
         AuHw==
X-Gm-Message-State: AOJu0Yx0csAnmNkf7v9Uum/ofx07jSjDqFrp/DSmLRJlA1tB53NQXP1a
	ITHQt1ANsqDc26+4A+PD8Y4=
X-Google-Smtp-Source: AGHT+IH2iVeNtxuhSNYqil+kIbOodUzZxXB+mr47hLTS7HskUTvpMjqRwlUgtDQCXwNRY57D0S0omA==
X-Received: by 2002:a05:6808:b13:b0:3a8:6b4d:6b78 with SMTP id s19-20020a0568080b1300b003a86b4d6b78mr7628082oij.35.1699881471814;
        Mon, 13 Nov 2023 05:17:51 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id g34-20020a0568080de200b003b2df32d9a9sm773426oic.19.2023.11.13.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:17:51 -0800 (PST)
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
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 0/5] riscv: sophgo: add clock support for sg2042
Date: Mon, 13 Nov 2023 21:16:36 +0800
Message-Id: <cover.1699879741.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051813_153538_8608CA48 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This series adds clock controller support for sophgo sg2042.

Chen Wang (5):
  dt-bindings: clock: sophgo: Add SG2042 clock definitions
  dt-bindings: soc: sophgo: Add Sophgo syscon module
  dt-bindings: clock: sophgo: Add SG2042 bindings
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   48 +
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      |   38 +
 MAINTAINERS                                   |    8 +
 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi  |   76 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   10 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1259 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
 include/dt-bindings/clock/sophgo-sg2042-clk.h |  169 +++
 12 files changed, 1846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
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
