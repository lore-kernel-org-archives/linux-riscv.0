Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F323FD0BB63
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZf2QorE2rHaOrENmDwQ1bmsigyI1Um7AcxPKFozO58=; b=ocdCr8wvakANmp
	wY/WRg5+eWYKmqTmLPTgCZ7oSN4MuZ+K+8MbPbnHB2p09XR9WBdb5v3gJnOwCDNFHzdmS1S3LySY4
	yGEhvXquA6KQOVu+zuEVLUdRr1W6+NW2l1ftAMLKCYEH4LDdoiGKjn93GJL5oqiSg/bOfCZxOr23P
	1+h0q928ompn6HR96pEjJFbsPAn/7OEBaSMCzm2Xqbf0if6Fwvirca1k+erLbfqIF+Kxk8AFhyXok
	GiR7ckuNgqA79XUlCfjR9k6Ny49D86P9lbc5fRfVLswJuvhz0DgDvu43d2W4u5jzkvGRHNpNMiaeO
	BmeXyLPAIJT1zuoJQxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ra3-0000000GxRP-1ZAa;
	Thu, 24 Oct 2024 06:44:23 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rZz-0000000GxQC-2eF7
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 06:44:21 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-288a90e4394so317179fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752258; x=1730357058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FoyLE/Cf4zQLw+m56F5a8lGY5yFq1EiEZ4WN3sp8cs=;
        b=CQ7bBRxj+2OqwrXEevmveJbTVtlgIhj0PSKkk64WmNBOZ28ngdcntUfBPBz5fk/0dt
         ktncHtjJLrntXLU8tR1KtOioPA3jVH6e6ZvmOfIKVNlS0KFo5w1mJ98oFWdGSMXPU/e5
         BOVSjiBnRad0F6Q/3pntiONE/+6m7jItSyjus/fQZ7/+eRzHsyXEj1B5xqcYmJvWOmS+
         fa7vIeZiM3aTiOYVOoojJkIujQknru5T1Kpf9RNKyRvFeZfM/0tbPYZbmBa7zRFi1jHA
         pkVqrAvCda/ANdA+QPohaliik5KJ2ayfQcKIDvl2RLuVg1ZDtZe2Kc9jF/fDybldp9HM
         ODVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752258; x=1730357058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FoyLE/Cf4zQLw+m56F5a8lGY5yFq1EiEZ4WN3sp8cs=;
        b=cGRho1r7DlljVaK2w13gfISXriMVP8AvxGbA5F8rgJeG0zN2woDpKninsAux17S73a
         aW3nr8qxdZtJepFVFvk/6C3yru+w7WCLddPKaD5u7fxQ3wZav8IhKxj7WbjiLZJuQKnz
         kKCetMCpBAkq6KjcasXLcw+wlSUPsLQbFkq8grbPvWV52k77sZ854DV492hR13oiBCGs
         UE7EcC57iu+9POIRkdTwRkd0xx0v0kJ4060a6SHr3tunidiYn8xYkBYvexmG0fgCYDub
         j4Dx253d40ZzrcwxsIIA0251A9MAvSgv08kPRlo2SvMXvlcOvDc806rMywcwU6yCb/wJ
         JqOA==
X-Forwarded-Encrypted: i=1; AJvYcCXpSFeKI18yPJTOd9riy8bCb1MoMIawjsM+2lvFKuCvWucfhZnx3JJuokYf7/SmK6K5VRBU4KqobY37tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YymNmLkrESq6TBS4F4jzVyfD9q9adkbZRpT1OhsZ8CCFU2nvp9T
	YeHCTojB9eVQFlH3xeQ1lfqzXyLX9lQq7JleoP7GJF6LmPWS5P7W
X-Google-Smtp-Source: AGHT+IGZ+O2r4XtVYPHiHdNtVx8h+km4OBAtGWY/VsB1qpgXll72J2UuhE4eux2WpZ4NG1pffRU0nA==
X-Received: by 2002:a05:6870:1701:b0:288:816a:72e6 with SMTP id 586e51a60fabf-28ccb44c8c7mr5021125fac.7.1729752258523;
        Wed, 23 Oct 2024 23:44:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312ccbsm7311977b3a.1.2024.10.23.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] riscv: sophgo: Add pinctrl support for SG2042
Date: Thu, 24 Oct 2024 14:43:53 +0800
Message-ID: <20241024064356.865055-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_234419_688445_E6902C97 
X-CRM114-Status: UNSURE (   9.22  )
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

SG2042 has a simple pinctrl device for all configurable pins.
It supports setting pull up/down, drive strength and input schmitt
trigger.

Add support for SG2042 pinctrl device.

Inochi Amaoto (3):
  dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
  pinctrl: sophgo: add support for SG2042 SoC
  riscv: dts: sophgo: sg2042: add pinctrl support

 .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  72 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   6 +
 drivers/pinctrl/sophgo/Kconfig                |  14 +
 drivers/pinctrl/sophgo/Makefile               |   2 +
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c   | 583 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c       | 642 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h       |  50 ++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++
 9 files changed, 1661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
