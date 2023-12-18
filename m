Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A356C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJPvjGii5QqA8wTjKxjHyEpePX9UmxEdL3fZ5tWBFsE=; b=ZzmKKT/SrYYAeU
	qJtQzA+QKwEUgdCvxN8Z4g/9gY5r7Z1OtRtf9/977xnArg1TVyMukcdbUNmjBhbcUJgctsYPv1K7z
	qxReUuXyB76XQI13SJrjZFfs7tLjcrJluK72xmArlew0qyerwU1DB6mmn3EfD6jocbWBAnIdjeoIq
	c+QxeeQuf1eyCYAoq08ImOMnZB9Rr+VqQ2luz8kr8hQLIdLsbouu9Z7stOZur9qF08MURMq0NoJdj
	18hBqsTXtdab3nSHWGEzJNtXQlRgLoYJE+JgFAh4s2IANI0iKTdhUxrT0EzMt4C7Ne3L3G0cnWIZg
	cMgFlzcrYFCmrnmrJC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRq-009yTy-2L;
	Mon, 18 Dec 2023 11:06:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRn-009yPl-2P;
	Mon, 18 Dec 2023 11:06:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55193d5e8cdso3318902a12.1;
        Mon, 18 Dec 2023 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897563; x=1703502363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kU1LiiNj9KIu6+7tYv+GKaquR+hqOzQ4EnqPiWM+jqI=;
        b=DieHwK3oFEEbIcIdoLD7uNNaSV+MfZP9b62xlrCkFTvjGcNnPQyF33DKrXWDK6GGTo
         nCxdMVBAEWyYN/OpLWdjZ3xkh2Q5k0Ak+IqznPJGStVwI7oYFaeANapCaMcjk8xKN+KI
         ZmqlpzXk/NVtGUweYM5k9UB5Sevu4ocj0zUoaL41k1vqGSKJ4epchAF+s/yN5DFtvVJ5
         cnXWJ6KP3Hx+cYVr8sbuVOw4EKe33pzE4zEPO0O3vHbNk5WnRzMK4LYw7Uk/rH134asa
         H5Qf8u06A+t27bad5Sm8llz3O0b1ueKk/nhGqd6ug/8F7lfoAJAhNr+hoDV+J2xU9X6d
         UW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897563; x=1703502363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1LiiNj9KIu6+7tYv+GKaquR+hqOzQ4EnqPiWM+jqI=;
        b=TdQfwB6A219JW4mzGIU+cGcGS2M5KleD16CW3Nml3Rs290EhPsHLxuo3hIfTdwPWGC
         2BtBc0uA/hfAA+1euSMi6jITkm8JCDdRkAcCPwwqm2//OVx3iT5XLsaS2SpQqXzAGsl9
         z1Hycxo8Ws3rZdzksoLJNS5P5KLf3ufAkTzfsXopR/cNX7T6NbUydLVPEANE/wvw4Dh2
         pOXjsB5VV+5+Z1b+kjlpKc/4Gk2YP5ZvJJXvURwGqQae1WQVz/yQx/XLHOn3ICDu3RhV
         p5HNm4ZxhB7jT25pDmqSLinpYwA33ukQEN3KmsfaVyO0lVdvVD+XoKsWLKZzk1F/7If9
         J47Q==
X-Gm-Message-State: AOJu0Yw57qBeZBRhQDF21clVRliksm13juMao8BWFe79SMI7iqUdiDJi
	VAFX0XHK4eC7LFek5oNli1I=
X-Google-Smtp-Source: AGHT+IEu4B8/4kbVzadsts53Sxa4qj2ceKCfsDvnjL+HyYXZThTQF8KnpEH1qhhPjPoeNforQTv/XA==
X-Received: by 2002:a17:906:74cd:b0:a23:1000:56a2 with SMTP id z13-20020a17090674cd00b00a23100056a2mr3086326ejl.12.1702897563254;
        Mon, 18 Dec 2023 03:06:03 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:02 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 0/5] cpufreq support for the D1
Date: Mon, 18 Dec 2023 12:05:38 +0100
Message-Id: <20231218110543.64044-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030607_784674_A6DD7D10 
X-CRM114-Status: GOOD (  12.25  )
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

This patch series adds support for cpufreq on the D1 SoC, and has been
tested on a Lichee RV module.

Changes in v2:
- Revert opp-microvolt-speed0 property to <target min max>
- Add dt-bindings for "allwinner,sun50i-h6-operating-points"
- Enable sun50i h6 cpufreq multiarch support by moving Kconfig option
  to drivers/cpufreq/Kconfig instead of creating
  drivers/cpufreq/Kconfig.riscv

Brandon Cheo Fusi (5):
  riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
  dt-bindings: opp: sun50i: Add binding for D1 CPUs
  cpufreq: sun50i: Add D1 support
  cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
  cpufreq: Make sun50i h6 cpufreq Kconfig option arch generic

 .../allwinner,sun50i-h6-operating-points.yaml  |  4 +++-
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi  | 18 +++++++++++++++---
 drivers/cpufreq/Kconfig                        | 12 ++++++++++++
 drivers/cpufreq/Kconfig.arm                    | 12 ------------
 drivers/cpufreq/Makefile                       |  2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c           |  1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c         |  1 +
 7 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
