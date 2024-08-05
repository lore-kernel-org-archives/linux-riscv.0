Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0502FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZnuTpFsCb2aepTBY6cwMZys2nPY2RK78zEYXNpt88c4=; b=R9KmnixE1vpm5L
	Bl1JJz2o64VKOKY4zB1WEIz6j6B+H2TwWdA3cjmW/LZ6oL9T6FWy0y3j7eT9nxfFaFkYG6ghjU9jm
	UPVIkgOA1HKmQjAoVaP+26c8TeQKgf8cjt1jBqeXw5C1mKKzblI1cjn+XNJ8XLMXql/kuY/NGaNyM
	GaOSpNogCi04NDtbDPcGnd2jmmETyPlJ+rUuz+GX7muR24+VC4LuZQj4yRoo6jAIrIPzBPVo7odO4
	xqFBERxH5MdwI4BLXmb6DjXoDd9lQ4mLwTCIIHo0XMFnUYiQieNoW7unDqFTzQaQ6ne8gSlRAXE3E
	cU/I38w/4k/dce7Sfomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satoT-0000000FF9K-0Z3l;
	Mon, 05 Aug 2024 09:15:33 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satoP-0000000FF8a-0FZy
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:15:31 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7093abb12edso7678506a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849327; x=1723454127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3+rIztQE6WRU9ZBeY+g9kfmjd9A7zQwu+i8aRi8HSU=;
        b=jAx5XLxhgRGCUUW/caPudh5pferuco+12k6XQj4x9pqpIUin8cNqAnH2D2GL/Adzpv
         0CR2Y6FlXKV/PqxDrhKzizxhSD1Etk+vUJ1CAWSosFtgtWMHySSELefnkS/xEovhyXuJ
         a0xPe1CDBGfjNR4IEc3fdygjcl0jzJHql7Fxfpq8KI92V+pgPcBJEOuNDlbDaoOZIWpZ
         Az4Bu3stfwQWi2RnDbJ6XKUwZDRxtGXn0br6wu4xP9uJhWtGjUJeoT3RgM8QvoBH0KtM
         +Lodv794yG1NbW61zYk6XdcFpfyxx3ogF7y2zd4H+3LfK88S2C6LXPZZiNV2lHfTUVQQ
         mi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849327; x=1723454127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3+rIztQE6WRU9ZBeY+g9kfmjd9A7zQwu+i8aRi8HSU=;
        b=lCHtbDydr6vvOts0vQuCG/5piWrAmsf4eIX5xryQHzSEOMzY2G7M7TsNzeRnD/Glui
         pxYxBnO/MV+PG+bgLbfRwa/lodpp+wQau/q8BdCv5ja+gpUN1XCrdKex0Tncr2pA8f3C
         AwtV1W1+tUKG49VGss+ECAIKPF6l2Zo1H1Rue8Uku4n4yArY1PMWAO5c0SXeYYp0bXVs
         H0niQ6zz9Qj7MqWJ0qlQoXYmfjsCl64WFTlGvbhG5+WTeHqPQSIAwvDIyaSqLPwT1J+o
         93j9yYuVr7knY4DTF7narh99vR/yf2EADldBeNcKAVJ6VPAzqqDrSJXGwdFZ6fQfZwS6
         aLiA==
X-Forwarded-Encrypted: i=1; AJvYcCV02DnyQgxZuIMOrFBJF7pe1oNYXxX8p3IUzPk/+kvZX1UwCF9RqANQPVHYfymPn1exRr6pY3tlU9Cfb21gzUnF0ie19SAXvTYY1RHt73NI
X-Gm-Message-State: AOJu0YyqLHQxeEQ5hYYcqKp+MEMAIwNBc8k09u9yKDaa34ZqdQY87N89
	JsTJUp2IV1g3I4GLP9UZNBi4P3ExqDrtCaD4us3NYFjCYhCuMeE/
X-Google-Smtp-Source: AGHT+IEhCrVhi6RjKsMaNG35hoJ2syJpEEnWGuaWja14l87nxPCwfBClsO+7Fw8Kz2q8MRArLRT/mw==
X-Received: by 2002:a05:6830:3509:b0:70a:9876:b76b with SMTP id 46e09a7af769-70a9876b930mr11856521a34.2.1722849327046;
        Mon, 05 Aug 2024 02:15:27 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a76ef7fsm2899595a34.74.2024.08.05.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:15:26 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v6 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
Date: Mon,  5 Aug 2024 17:15:18 +0800
Message-Id: <cover.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021529_503998_5F5C8D4D 
X-CRM114-Status: GOOD (  16.29  )
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

This patchset is composed of two parts:
- one is the improvement of the sdhci-of-dwcmshc framework,
- the other is the support for sg2042 based on the improvement of the
  framework.
The reason for merging the two parts into one patchset is mainly to
facilitate review, especially to facilitate viewing why we need to
improve the framework and what benefits it will bring to us.

When I tried to add a new soc(SG2042) to sdhci-of-dwcmshc, I found
that the existing driver code could be optimized to facilitate expansion
for the new soc. Patch 1 ~ Patch 5 is for this.

Patch 6 ~ 7 are adding support for the mmc controller for Sophgo SG2042.
Adding corresponding new compatible strings, and implement
custom callbacks for SG2042 based on new framework.

Patch 8 is the change for DTS.

By the way, although I believe this patch only optimizes the framework
of the code and does not change the specific logic, simple verification
is certainly better. Since I don't have rk35xx/th1520 related hardware,
it would be greatly appreciated if someone could help verify it.

---

Changes in v6:

  The patch series is based on latest 'next' branch of [mmc-git].

  - Some minor improvements based on Adrian's review suggestions.
  - Added Reviewed-by and Tested-by signatures from Conor/Drew/Inochi.

Changes in v5:

  The patch series is based on latest 'next' branch of [mmc-git]. You can simply
  review or test the patches at the link [5].

  - Based on Adrian's suggestion, split the first part of the patch into 5.
  - Updated bindings and DTS as per suggestion from Krzysztof, Jisheng and Conor.

Changes in v4:

  The patch series is based on latest 'next' branch of [mmc-git]. You can simply
  review or test the patches at the link [4].

  Improved the dirvier code as per comments from Adrian Hunter, drop moving
  position and renaming for some helper functions.

  Put the sg2042 support as part of this series, improve the bindings and code
  as per comments from last review.

Changes in v3:
  
  The patch series is based on latest 'next' branch of [mmc-git]. You can simply
  review or test the patches at the link [3].

  Improved the dirvier code as per comments from Adrian Hunter.
  Define new structure for dwcmshc platform data/ops. In addition, I organized
  the code and classified the helper functions.

  Since the file changes were relatively large (though the functional logic did
  not change much), I split the original patch into four for the convenience of
  review.

Changes in v2:

  Rebased on latest 'next' branch of [mmc-git]. You can simply review or test the
  patches at the link [2].

Changes in v1:

  The patch series is based on v6.9-rc1. You can simply review or test the
  patches at the link [1].

Link: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git [mmc-git]
Link: https://lore.kernel.org/linux-mmc/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-mmc/cover.1714270290.git.unicorn_wang@outlook.com/ [2]
Link: https://lore.kernel.org/linux-mmc/cover.1718241495.git.unicorn_wang@outlook.com/ [3]
Link: https://lore.kernel.org/linux-mmc/cover.1718697954.git.unicorn_wang@outlook.com/ [4]
Link: https://lore.kernel.org/linux-mmc/cover.1721377374.git.unicorn_wang@outlook.com/ [5]

---

Chen Wang (8):
  mmc: sdhci-of-dwcmshc: add common bulk optional clocks support
  mmc: sdhci-of-dwcmshc: move two rk35xx functions
  mmc: sdhci-of-dwcmshc: factor out code for th1520_init()
  mmc: sdhci-of-dwcmshc: factor out code into dwcmshc_rk35xx_init
  mmc: sdhci-of-dwcmshc: add dwcmshc_pltfm_data
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
  mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
  riscv: sophgo: dts: add mmc controllers for SG2042 SoC

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  60 ++-
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  17 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  28 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 451 ++++++++++++------
 4 files changed, 383 insertions(+), 173 deletions(-)


base-commit: 538076ce6b8dfe5e8e8d9d250298030f165d8457
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
