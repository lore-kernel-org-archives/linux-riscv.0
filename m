Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6874C35FE1
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 02:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//dHv+OhBZGRJKV1DYU89sCvtPT7wSoRXbr783MEua4=; b=UCBRpAmwcppuay
	n5gS4VeIH3nh1mku2MDqoQF0xigzNmm/ONuEBszfEwVeeVtKmrCq5fC+9bmN7fqeyXLFnwzf2zXKj
	IDsBxubTAZgZuxs02F7kE/gdl3pvAi9hs9UW8lVnab2n9ocdDy3/QhG83OGS5fdc7OfnzIUyzG68g
	TDCCGa+IOq63iP3xMu/DXLXxa+1QFdhPjwi3jmvE6YQusXOXmGPIPPEUomXo4O8YgbPjCMpZ8rLBd
	ER/Aar/Ek0HvODpelsuzI7K0yR+NbslfMmEHsgFa/8PXjhEbeATdkNKIZ2vKfQzRzPst+c6QhYJlO
	pl3sDcJfJqI2nZ1UNPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spfCv-00000001VSG-0U4A;
	Sun, 15 Sep 2024 02:41:49 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfCr-00000001VRZ-2WGO
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:41:47 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6b8f13f28fbso23919347b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368104; x=1726972904; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEJl323ticb7+sWiCTe7PcxkTdrZnxPuus/Daby2Uv0=;
        b=TGx5xiKgTr+YQew7IGHo3Bax4vLSF4ulGN3SF/f1Ktbab3Fk9RU8W7LpPYT+muD8fF
         e0v71uLDP+pESDeBmG9bPemsLDX1JzjyAdBMaWA5dEqQHa/DcQNXcyIJbgJiFG9Ydz3M
         LTlfg6hsDo6WYWXsOTvbnCZgs5O+BGfh6hHMmAMfxaoSDenFAq3yj9IYKsFV+BZIjb54
         zc6ikAVqnjF6YYUKS9tc2fZI8Dx/rxzAanNK9pP+AXXLMrTAwPrIPywMe6lDxqxIPCKB
         xg0l5QzDp3q2bz7B1IVeZZ2ODQgelHMWfzAoc0l5nIYQzNQ8W5a35HOx0a1Yu/bJOnww
         z+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368104; x=1726972904;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEJl323ticb7+sWiCTe7PcxkTdrZnxPuus/Daby2Uv0=;
        b=VP08wfKZi5sDTrXKwAd7f6MZdRI3r5Zs07OH09McmxhyrpdjpL97Vx5fqWOhT6Q0bI
         VvBY7aIKN8+x+rV10DYvx3YbLyT4L7UkC4ajyHTEhbBuLL+7bPK2rXQ8Tw0UHLRQHAl+
         SlqGAhjgQgSMjAQbZsyMbX4CEtEatPYkwxJM40OQhEHyF+m1mosmYKcrpTYPxr7napNB
         hKMpiNlRSh2oAUZPbiEWo/b1WD4TBF+LeJZnDz4TB2szDfZy+i7rDxAErmlEaIu1Cwrm
         f6KL28RIt/4sbMfs2W2fn4O2DI7rixuMG4swuvNy7rMhg11Wk/9ybEBZrQHPBbAnLfOp
         biNQ==
X-Gm-Message-State: AOJu0YwTexdWoYq4xmo9Hp9+nBdsvWs2HJ2HACHgztXhEclDa8TzO4Po
	z3n69zZxB5c6iTHDhlCFh49raPxE/HeDFIdayVZP/vXRRkfnuHAzIUQF+MPCsnA=
X-Google-Smtp-Source: AGHT+IHF8hUJc9aoaLr4B0Uy/HXuQcsgRKmJTkgXaVLV0JaGjzfaP6wbjAmg0K2wYknRt9JrSjNswQ==
X-Received: by 2002:a05:690c:fc5:b0:6dd:76da:dba with SMTP id 00721157ae682-6dd76da1a06mr19858477b3.35.1726368103699;
        Sat, 14 Sep 2024 19:41:43 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:41:43 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v2 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Date: Sat, 14 Sep 2024 19:40:48 -0700
Message-Id: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADBJ5mYC/3WMQQ7CIBAAv9LsWQxQWm1P/sP0UGGxmyg0QIim4
 e/S3j3OJDMbRAyEEcZmg4CZInlXQZ4a0MvsnsjIVAbJpeIDlywtopOcreR0Ci9mLsKgUrPWfQ8
 1WgNa+hzD+1R5oZh8+B7/LHb7d5UF46xvh4e9tmg7Pt8Sur0O6NJZ+zdMpZQfpzFafrIAAAA=
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_194145_693831_F177A3EE 
X-CRM114-Status: GOOD (  13.43  )
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

This adds a pin control driver created by Emil for the T-Head TH1520
RISC-V SoC used on the Lichee Pi 4A and BeagleV Ahead boards and updates
the device trees to make use of it.

Emil's series from January used separate compatibles for each pin
controller instance. Rob did not think this was appropriate because the
programming model is the same for each instance.

This series takes a different approach by adding a thead,pad-group
device tree property to select the pad group for a given pin controller
instance.

Changes in v2:
 - Add thead,pad-group device tree property
 - Change driver to use the thead,pad-group property instead of the unit
   address to identify the pad group of the pin controller being probed
 - Return -EINVAL if no pin group can be determined during probe. In v1,
   there was a bug that instead returned an unitialized variable
 - Link to v1: https://lore.kernel.org/r/20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Emil Renner Berthing (8):
      dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
      pinctrl: Add driver for the T-Head TH1520 SoC
      riscv: dts: thead: Add TH1520 pin control nodes
      riscv: dts: thead: Add TH1520 GPIO ranges
      riscv: dts: thead: Adjust TH1520 GPIO labels
      riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      riscv: dtb: thead: Add BeagleV Ahead LEDs

 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 176 ++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  87 ++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  43 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  28 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |  65 +-
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-th1520.c                   | 911 +++++++++++++++++++++
 9 files changed, 1310 insertions(+), 16 deletions(-)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240902-th1520-pinctrl-d71de44acc66

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
