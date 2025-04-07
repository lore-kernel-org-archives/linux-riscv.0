Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F232DC3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tss1xAMwfWJjUTPZAoUKceU5q71CAyv3TTC4DuVK1LU=; b=YqLJQW2D7R0zMT
	dEu9o03J77A1OHPl6JUYk0OaMlWFFhtIwjf3iXSLlVNa+85I+5xSk4R9WDwSsBkO8/5txiAz8h/xW
	wibrb8/lhWvRvn9xW94FzmjYT6LS7SG/ofhaUXCfJt+TapCAa9fGgeRIKhVmzHykUUbT2QzuShkqq
	RgHjDgyk6O2yh5Cp2ySN7WymjE0NMZ41o82gILO93fY14a+6srnwWbi5QbLs1kTQnmKjEOH1DgHlQ
	VIVJCBlpj82VUF3aMV2jKk9b7ALp7LkeXYeitjIFg72NXuqwQV8143iDQK5hMIC+nxLLt7sVzAQnC
	NAPasz0MOIeqMAXGZHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax0-0000000G5FV-39RB;
	Mon, 07 Apr 2025 01:06:58 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1awx-0000000G5Ek-1ivT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:06:56 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso69733706d6.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988013; x=1744592813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=iN3Kd+keX5f8iYL41om2uxSdQrkuq9g9bsWTP49944nJnAug8Ua6c8JmBtJM+PP7Kn
         l2ZLsA0wJeglujzdy4+rScY47gzK3B/EjlFqv2nkQrGdj8dvx/2GKOdiYonFKBA+zAPq
         2sU+wLUV6y5+N2ZoeW6mp0ThcEEhByjb/WP6QnN41Skac94oLLU9GZrizZ3zokI15bgO
         JAPk/MY5O+40LVgCthvF7pjZ1GZU/H7EGtaWkcIPivW25cnQm928ZqkdBLt6Z3pX/1VM
         dNO6UKaF9BpJd41khJV1S1mTBYVfHImxhJttSX8MeYUSC2d7Yhgaj5ZdyQigG+4cDJEn
         eJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988013; x=1744592813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=f5sHvU7V8v0Jd2pDtWQPHbn7Unn2mHEKFByYiFFw0PjiQY7J2NXqY/xGv/aApi0kra
         PXNjxoAqp0FqmmRuiskhIGaV2gp5+SxNMv61z7dJqKCnnHiBjuOIcApugtddlIh+hQa9
         29I83r7g2493dtefQlJAgQFSidjCF0SKd9wBdLROySZPTj1Yk2lAT09LIlQV0cQTBCKQ
         2eqKZICQh4+IwSsl3yvvx0+3PPdYBCJPY4JRnm8TMiQyXZG27L708FgZFaObQFsJ/1Gi
         +EzzIajp7qf1v2LQ/XpBHWC7+Pr1jFg+jWJGldky4r48ip41bVU+iPZLBGWQs0W61oFH
         6jTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTeRxf27+442QNSOdcm+dsgYuW7tSXKv6If5NfHNCAJYyEVQn0rmipNm5m2uBXCmnQSbcgo5wyLdBoiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxIaottCLTlfuFGeV6ZOBxlXkAKzqlEq0xD3S+qDGtAuHwtdm7
	5VQnpgKzwERNg4il5B+WOS5EoTSZXxRNLlLlXdhsqmDj2s6xeYFB
X-Gm-Gg: ASbGncs9BDOwhyXidS0qT1cn3KoGfQtzUlY5DyUrdoU+2cFdK62jTWguf9fV4c3wedZ
	K5CieRclRHyjvOMTF0Xq7nT3sq2g32Rjkr132Oby5aFyP5cyDNu0rWfQrmDlYHimcJvdjqo6lSm
	goT3oprcwcJF4Hcs2YXbtdClCiUPgwxgGxAHGQtSUuUr7MKYlRzG9pQIkSOXxd6Her0IxVSuzbW
	9Rk8flTimg5zxNVRPS56dMCvXybJJZgZ3mplNw7coYdgxZpUalwS+TdQVUEJ8PNyMZR6jMNi607
	wMDUvjEJywIkVXkzWODA
X-Google-Smtp-Source: AGHT+IHkC+AE89umfaDeyIGjjiCSVOcB7pf9Ijef1ekZ2c/N5mi+YxnKKu0aH8SynK3OvfNoFND1bw==
X-Received: by 2002:ad4:5d6e:0:b0:6e8:9843:ec99 with SMTP id 6a1803df08f44-6f01e7996demr163789416d6.41.1743988013630;
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00f09fsm51936316d6.48.2025.04.06.18.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/9] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon,  7 Apr 2025 09:06:05 +0800
Message-ID: <20250407010616.749833-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180655_553655_1CD0D549 
X-CRM114-Status: UNSURE (   9.66  )
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

Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
1 microSD slot.

Introduce basic support for this board and Sophgo SG2044 SoC

Inochi Amaoto (9):
  dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
  dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
  dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
  dt-bindings: reset: sophgo: Add SG2044 bindings.
  dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor
    support
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
  dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
  dt-bindings: riscv: sophgo: Add SG2044 compatible string
  riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |    6 +-
 .../bindings/i2c/snps,designware-i2c.yaml     |    4 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    7 +-
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3277 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
