Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89117C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+vhAPGMuGbJ1gKKMQ2iVRZG5OsUhSJcoY1psk72D3b8=; b=kfx5qu9GldM+Mv
	44JbyJyOLNdH+03+ytIfo15oKUPacUmWodArJYO4mAnY8JZ3pD7WjN+4IPEkXsff4vV8eKddLUvx6
	K+qA/jimMM9xSRrRkZ0pwqlRtJ6CSHaqMlj2UY+vH+l83JA4vg2SKEWN+pXOUu/aKrv+iulmbC56+
	pT097KDlK8U7lqVtzgtSC4MhBu5MlaS/gCnzF3LwUphix6+cA2is95sdiB730wRzKnVGXMyKa5eFl
	McLHVrrWwRAuj/59zX4TypeDjvn8JUSkPaGS6o3z64y6aFzp6antH3JpZ05RAk7IXnTBqIEheJXLh
	yOb5q6B32zEeBi9RufnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8TA-004GXn-02;
	Mon, 04 Dec 2023 12:54:40 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8T7-004GVE-1w
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:54:39 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-589d4033e84so2681452eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 04:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701694475; x=1702299275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/xu9nwzbmHnEYotXUPce3P+9ytlR88YxCwCFXrncBQ=;
        b=j56MNUwC3WUzPrKg2WnczytNj9JL+AThoM5AoMkJDz+pHnpRLvKyO+NtEGGUfaWpOa
         L5C/RmdCrjL/K5NWVJxAMdMG9w+0289wLu4QhVsKmPfTQpPks4q0nHouxaHd7YyVkSz8
         cmlsipKS76DY+nB3Jhil5ymwQytn2q5/2QQA2jfeG2p7hvQivU5kNxfDtVSgwahWm5HH
         Q8zQBRm/19/I4s/YeJm2wuzOVwgDPsNFhsk9N4O3FVAK5RN8JvUd7s7QNI+2Si1XcGMT
         JnFESH/5X56w0U8+dXH5uJzH/9EnDKAWfSg8Zeri1PDEB2FkYqmhf8lPs24gVbDX0SuM
         wH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694475; x=1702299275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/xu9nwzbmHnEYotXUPce3P+9ytlR88YxCwCFXrncBQ=;
        b=G1UNkU9NrcOkf6Y6txpp+cIOq0ViybB2otvWWVDYtNDzYNp3Ig4liYAxcNkAqzi5dG
         I9wIgfnD3JD6SVC+KYxmFUhDEbHeElh2GTZf3PCekkq58v1NAPf/bgTrXOKd9xY32njD
         6gc7mCXVKTL/zbVN3zIfitiH9vd1T/ckwezAZHpgyw/fmnYmfBlMawm0nlkzvIPk/+SZ
         VErcjGaEzwD7Hvz6wpIJ98crxv9XNeyBXvCfQEFNB+jSHj/BnoFGoggIi36+Ofe7u+Gb
         SU97jETbZ0hW1dshH2OmRntJMiGzS8qMjdFCPmgKKV9/9E4YK0gSHzgMxfxfTA4nJLO/
         EKIA==
X-Gm-Message-State: AOJu0YzfsdzuREFlajgHwFiHVeBjUZSbJuDB756IFtDtCQUSdK2u4ekk
	NmH3dZftyxaLOSOCAFvKLRM=
X-Google-Smtp-Source: AGHT+IFZHG4AC4TOrdwhcJaZ3XL0RRIPK/tNTU1fuESVfRAIIm33CjmYgFNjdPKxK8OINpa69r4WEQ==
X-Received: by 2002:a05:6871:58f:b0:1fa:f52a:ad2b with SMTP id u15-20020a056871058f00b001faf52aad2bmr6168296oan.8.1701694474816;
        Mon, 04 Dec 2023 04:54:34 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pa18-20020a0568701d1200b001faff1908d3sm2068107oab.53.2023.12.04.04.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:54:34 -0800 (PST)
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
Subject: [PATCH v3 0/4] riscv: sophgo: add clock support for sg2042
Date: Mon,  4 Dec 2023 20:54:24 +0800
Message-Id: <cover.1701691923.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_045437_665132_5D6DF48C 
X-CRM114-Status: GOOD (  11.42  )
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

Changes in v3:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [3].
  - DTS: don't use syscon but define sg2042 specific system control node. More
    background info can read [4].
  - Updating minor issues in dt-bindings as per input from reviews.

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
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]

---

Chen Wang (4):
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: Add SG2042 bindings
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   50 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   35 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   79 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1371 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 ++
 12 files changed, 1953 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
