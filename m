Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E4C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hc1YA4tLPAlOoDCE9yow8xw6KmUDdvn0WHctkpqcl8g=; b=G9Fg5Q+qeX27GY
	b3M0hTh+lFI8u9M1zPCr0GJi8jGVQjtJxD3vrqMvpBSRVdcXXYoDyVuTwxN/C9mCWnoFqbWS4y/rC
	1QMpgi81Oivd17BDHV6YgDaUgfeOtFLXHiCDYQNVKMXIwVeeV5asN42DzpVU5yC1N+wWxFlTp3stg
	AsTuSM/TVWEPXOibpfq7gRtYv7iScRgFcUgrtgVH0yZBjNeQCoVaB5l89nW+746VGt3dxHaNgPU+x
	ClcS26HuWUIe6BeRzskgFclSEYDCISpepCoIgfyZW1ElmLkvNm8eOyxcnJ2fmaxBva/ilEr7BrM49
	JNUFfsOJXw5rohUkuwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8B-0000000GWyK-325f;
	Fri, 18 Apr 2025 14:55:51 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6W-0000000GWOG-05we
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:09 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476a720e806so16510041cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988046; x=1745592846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=F1+hpAiTeR9ITeFjEoLbac70Ro8RAEZHbcwo2CTRf6recBzHcTUgCVNTUUoziZu1Dw
         X2HvkzbtJCfKnIgUyuqZ74jBj2MOtSJULjJxmrfneMqUeCu1VLECi64lr97tHUej4Y5b
         qEmpUOHcULmCoUqRZozHJYfSOYW6F/plFTpsDjgyUtNj+76gpUe212vuIzKlURFOj9ow
         nA1eaCUx0DWMhiZEz39KiUVAqncjh/VJ1jWCfiEv8Sl6ACTWLGgAvcuQA45n5IdQRRru
         1VoiIdfdnWscIj1F5z+5A9vTGcoeAnhqoC/mqd5xgB1p0Bwddkar2WYuc2oqREcREXC5
         Osnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988046; x=1745592846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=P5lpr+8WQh4GsSdp3dkvgcKMEHgWo66cAfRyWWGPj3kFzy/upWj3FNFeeMtXTFVgT9
         nMD/Sc35eNMBvTNvifMAx594o7Fgu4uEpcJ8MIcv54ow4hzHsvHbpB3pjkhQ2u43d4y9
         w360wGxzN7HP3gJbzKbaB78moe8p7TDSx6e4kb2eGXB0BAs9LkuHSMAX+O+HB2vSfcq6
         7WYkIL2pOdIkAy/Fb2Dl8Fh3/5poBRlhimsIczs2lFP3p0BKWzhLtobG3AQsVWf/cf/m
         XfKXnbTck1Y/o+uNeQnc8SLCCMzwEL+LkgW2pack2OHKtqGDxZCb5V3dooHBBNlom3eF
         3bYA==
X-Forwarded-Encrypted: i=1; AJvYcCU9HKGAamWftrB4VrVSNEUVlWsoUCHjdMiaydmH6ZHtSRvl80BZC2ycFBvMCiW86udaIEbcjVDdbZhYnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV++xXZ3sg7Qh6TgYNmRefuPxjTBxYvkE4rXAE/Fym3Yi3rXTg
	k9tpUk0iv24EcI30PxOnDXxFb7jtfF5isCwoUCTbmajRz2JlYSxudi50p85tQr8=
X-Gm-Gg: ASbGncsHazeYYzpDOUyc7K5s7ioZX5qwMaT0pvy7g/vjQ/DWPSW/0+obqfeN/xKoSkL
	VpsnNQgY+BCkwrqX7m5PrHWgzWe9phfhSd9d62Q48T8jnV9vyBGpoywy7stQccnXabwHb1m54H4
	qVByjeLiXR2DIYf/t9HAEcEjw/1RAaYlGrcFYdEvZvuX3M0a+HQYaOdzb3Smh//YdjIHf87cmKt
	eMJ97LnKSrb6hHXipCXAqRY8CtpHchAFMYk/2z3pmQ7p/cDcEF5FYemSF+PZ3n17IETug72LcYS
	aR+xmSarfBEz5nOS3Vfyd+apW1TNNByJP02Qvw0E5grwTEiZi3j078ES4YdgsE3R8aQbD5L0YdV
	B8awiVAKr9vmspePMYv69rSVH
X-Google-Smtp-Source: AGHT+IHiEG1eSrMtmu7ABawgdFJIO6lV2wB6Q3AXU/kHDB1pdQpbBxefqDVD369wLGK+b6k5u7CG9g==
X-Received: by 2002:ac8:5a92:0:b0:476:7327:382b with SMTP id d75a77b69052e-47aec396ac0mr52829231cf.16.1744988046352;
        Fri, 18 Apr 2025 07:54:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Date: Fri, 18 Apr 2025 09:53:52 -0500
Message-ID: <20250418145401.2603648-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075408_269548_647E5CA0 
X-CRM114-Status: GOOD (  16.46  )
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

This series adds reset controller support for the SpacemiT K1 SoC.

Most of the the clock controller driver that Haylen Chu had out for
review has been accepted (at v8).  So this time this series is
based on the "for-next" branch in the SpacemiT repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v5

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/
*** BLURB HERE ***

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 482 insertions(+), 23 deletions(-)


base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
