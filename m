Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6996CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ck/CozhOz73TSv/OOAf7ncRtKO+XVCFVqQJt+Tnz62Q=; b=Jwjz7Kfab58Ibs
	svSViQGaSxD3vo2KA4F1Yk2dW24tQxarRNUItmtqamKsKdj8BXm1Tf4/j/pCZBBN//M108xRPbDt9
	UkbpHPhFgXbIKFz9a//1QKYHAwx7hId6tAxXRSpMb9TQ/xT7bgeQo2s1SxAjVsfTZwv1id3g+WfAo
	rka00z9r+1scpn6DM3IEx1+zN3bMNYDA+X0Z1HbEc7Ik7j4/Nt9VaiCXpZK2Nzc4HhUIR7jCWZ6uG
	S+r1wY76k8tocyUh+pd3LXhpIf95CUyV1rtsdobJb2/bdfNiCRrFgoPXS9c/+YBqhovXs9v38eBPD
	tzj69SkzyuBvftl0j4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjQU-0046OG-25;
	Mon, 08 Jan 2024 06:47:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjQR-0046Nl-0m
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 06:47:56 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6dc05ddb656so875708a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 22:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704696473; x=1705301273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNqLWwBfGaYn9XJSIaItQtf1MNxpe69O24j9U8v8Pko=;
        b=StCYMNFNws8HT8zQteuoctU9O4StHV34IpA+blefR7MlaZTF3bJAGqF5FClP73iloE
         0sEf3Ll98b7+oXOv6vJJU3y/A8nV42XNp4il4VBELTPyZnB0RpeAk5Q8LKVSq1252PU9
         EmU0IhcIBmr+pCUHpA/TGZzFuiPbnhrHOYFy+3qySe6Yoqrp/CmfYY9BdEGmxGQctE1C
         AKxoZnIkkU00q5FT7OTSa4aiolVCQ5J+NGi3M9JRROsOKicSoJ2AEr9N02Ki9YAA/zHy
         /6RGJNOdjCXB/nK/v7qVll+XUJeNGcKCjEc/iCtzHQmW/r542eposAFeJeBACUnTa6Lm
         mIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704696473; x=1705301273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNqLWwBfGaYn9XJSIaItQtf1MNxpe69O24j9U8v8Pko=;
        b=KLWoPzjZstWzWWngyPmnoblW8DaO6q2Wk+iTcRFdY2UEF1K+aZLPle48ZVkAyCl/jE
         kvhx/gzD7rnbyT/uGTeL+pQ3iSDKtdA4P++TMv7YwNy+1yPsrFC9qNIWgPH6CHY8G5nQ
         A6h9yKWmSXBm532Vo0vtn8YOiAAGmaz7fqVdaWMrSHWb7IEd5RfarMjiuRyyfgbm5FyW
         k9EU8Rbn4ou8DH/QdKU5S9a1Vk4jHAaEJQ/UK0wrByga5c6I9VuJjaqgAQVvQrIumSdu
         NL4xZqN5Kv6iB8DkKwH+W8KechLt628FI/XAtsSHEveAyViI67rZPNcXhilCD/TiaSzY
         hHRw==
X-Gm-Message-State: AOJu0YyfKarKDXE+4qP7Bb2HCdfV/JkzMc418bbRi70BSmktdvPQTy9e
	ccnbVSGWwq22dogfIwLqlSE=
X-Google-Smtp-Source: AGHT+IEAed1LQOm4jnO2eZoQd48MGOblsDN0s+H3MVZ9h3pg6L7uNjJRnOkq3FBkJM9fob5C55G+ig==
X-Received: by 2002:a9d:7308:0:b0:6dd:bf77:480 with SMTP id e8-20020a9d7308000000b006ddbf770480mr1453865otk.51.1704696472954;
        Sun, 07 Jan 2024 22:47:52 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id dw1-20020a05683033a100b006ddd602afccsm102718otb.66.2024.01.07.22.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:47:52 -0800 (PST)
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
Subject: [PATCH v7 0/4] riscv: sophgo: add clock support for sg2042
Date: Mon,  8 Jan 2024 14:47:41 +0800
Message-Id: <cover.1704694903.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_224755_305128_FDAB0E54 
X-CRM114-Status: GOOD (  12.81  )
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

Changes in v7:
  The patch series is based on v6.7. You can simply review or test the
  patches at the link [8].
  - fixed initval issue.
  - fixed pll clk crash issue.
  - fixed warning reported by <lkp@intel.com>
  - code optimization as per review comments.
  - code cleanup and style improvements as per review comments and checkpatch
    with "--strict"

Changes in v6:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [7].
  - fixed some warnings/errors reported by kernel test robot <lkp@intel.com>.

Changes in v5:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [6].
  - dt-bindings: improved yaml, such as:
    - add vendor prefix for system-ctrl property for clock generator.
    - Add explanation for system-ctrl property.
  - move sophgo,sg2042-clkgen.yaml to directly under clock folder.
  - fixed bugs for driver Makefile/Kconfig
  - continue cleaning-up debug print for driver code.

Changes in v4:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [5].
  - dt-bindings: fixed a dt_binding_check error.

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
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v4 [5]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v5 [6]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v6 [7]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v7 [8]

---

Chen Wang (4):
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: support SG2042
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   53 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   34 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   23 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1316 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  236 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 +++
 12 files changed, 1854 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
