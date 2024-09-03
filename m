Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74561CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LeFPc0FrfSsKJMwCAIHmg3n468ewIoFUJuRw8a/hhvU=; b=Qz9OaJBkujc1cj
	pVq7kFlx5RfRwYF8PXX1dBwcnehhcLOjF/s3TWR7Twb9GKfymauCXtprhMGSO5l3bhiU1OdvJje+C
	LNYECgid+bfPltk6PmPjX7SYYtZdxVIX7924tfnnULXGmrCt8cyhEu2nUcPX9/FupoXrLe3hpsjom
	Fd6FEpLjdND5ADLKnLkQ2bCPQvr9PXnJjSC4KCnAmTDyR2gATKN+ABr9Gyhqdrwl2rZ/ng015CsZz
	pQJDGJ90Wka2qn5HH7btuymesdjxFW8RbOH7QILYKzT3s5jXenHOv7F3brHALjNR9SfC5ZFDQgSzk
	AdAuj1YsfevxAK9WdsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqf-0000000GFgi-03pt;
	Tue, 03 Sep 2024 04:08:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqb-0000000GFeb-1pY3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:08:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-714287e4083so4346445b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336532; x=1725941332; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmICGzKUGxFewRbRgKis5bG9OZnH3qQ0GE51JyFBQto=;
        b=ajr6KlHwSxkfEQea+tgRa4mcQQu57FV345jCZjF3Iynq+AwqyhByWIQu7yptim/5lk
         fJ87h5eaBFB5Ml8MVP5H35HFBiocqR7/eZFnqAXmsCxWfErcYGzKFrIFIbSlKnsRUmq/
         mLXOejCj5TCqDwEStLJ5RuEUhhAheuJaFXjPTJhDqFfxL7VHX6fzTL0sJ3Ba8gMMlIm2
         mm9gAvAoQkeZOrVbdMY9BTxvLQ0E+C7BQPsyX2NOpLkDqRbL4OzbNepSyRLXfa6m6A9F
         5L05KEcoxKz+zHPd+0IAs/bYnfRLZr1AayLz3YPlUaIooyM/Upx7nOkF1S68y3p+l1e2
         91Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336532; x=1725941332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmICGzKUGxFewRbRgKis5bG9OZnH3qQ0GE51JyFBQto=;
        b=ZSrVbTTTR54aoR7K+m3p1+So/id9xinX6vMaxIvIMFgvRtu7Rj2Vy4khOUIR26i8DU
         x07TSRlJShbwz6SZH2v7U0LBgS0p2ywE9WS06+mklV1Lwl1uW0wMOQ8u/pREmilG3m6b
         JW0Y7GOkqNjysbv6/BIHvZENPAGdoEPEN+cI0V+7INjWVADcoBUmhgHWuAqje40JIUat
         lLmxpnxoRGoaM0WDSMbjX/s2IxFJtyPtiKMXLLYG2jYdx++JgHg5EUs9VZDljdHyRUSZ
         t8Smt0aqUOLnI0YZsd7W4Ky2pX+0Q7sVGO9WTsdXDsg+PSkEDaMZz3dCx32A7KJNLlk2
         PgFA==
X-Gm-Message-State: AOJu0Yx39fZaBwNh6RlzcoUF36AYhJvbNLmrZGQ1y3RM0pA5XKgdlZQ6
	l6B2rhBKAAiJH8GQUEJM0o8w9iYmTaXNjvE6Xwaq2V7ipvGh2V+h0CwhguI11e0=
X-Google-Smtp-Source: AGHT+IF2i9f+kgKGcCcui5eYYnCDwVFRlNfytXr32+QhP8AaKvue5vdZwiryaEdnfKIENqx33uI1rQ==
X-Received: by 2002:a05:6a00:915c:b0:714:25aa:e56b with SMTP id d2e1a72fcca58-7173b5c8644mr10432960b3a.8.1725336531789;
        Mon, 02 Sep 2024 21:08:51 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:51 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Date: Mon, 02 Sep 2024 21:06:53 -0700
Message-Id: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF2L1mYC/x3MQQqAIBBA0avErBNUzKirRAvRKQfCRCUC8e5Jy
 7f4v0LGRJhhHSokfCjTHTrEOID1JpzIyHWD5FLxhUtWvJgkZ5GCLelibhYOlTLWag09igkPev/
 htrf2AWjSjWVgAAAA
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
X-CRM114-CacheID: sfid-20240902_210853_616078_A9BE91FB 
X-CRM114-Status: GOOD (  11.90  )
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
RISC-V SoC used on the Lichee Pi 4A and BeagleV Ahead boards and
updates the device trees to make use of it.

Emil's series from January used separate compatibles for each pin
controller instance. Rob did not think this was appropriate because the
programming model is the same for each instance.

This series takes a different approach. There is now only a single
compatible for all pin controller instances. The pinctrl driver checks
the unit address to identity which pin controller instance is being
probed.

Link: https://lore.kernel.org/lkml/20240103132852.298964-1-emil.renner.berthing@canonical.com/

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

 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 165 ++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  87 ++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  43 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  28 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |  62 +-
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-th1520.c                   | 906 +++++++++++++++++++++
 9 files changed, 1291 insertions(+), 16 deletions(-)
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
