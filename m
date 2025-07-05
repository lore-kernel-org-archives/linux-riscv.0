Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F04C8303D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4EJ1XLrf5vKL6Cy3cDZRVF2HP1LqepRPpZ2gY9kKg6I=; b=kZIaSeh5+nbPwe
	kHFcKKg4mxdW1jc24+1nCUGkA2mT53Yj3eWfxk7P2ij6zGJ1ov63t4Xw4bSvt3UuBaYfNZwDElAAt
	+mVg9GiC+VQXH+zWfpVXaqPC4jdt2SPCaKpHF6dUuFQuwJv5H2evfEoJ3qvYZqYNZVC6QdN0H/Ciz
	Njm8aCfBoXA4V52Tc7wwUiKuNSsMLE/uhG0AHk+2aF4r4J41zrNVaaDdoBvl5eCelX0ySSllen7er
	80qtLFHt4Q7CrnYMmqxrGKCpj0GxDQcw0EyWGuSod5m5XCFy6b05JcZuXodylfQ6xtRYykRzYxMRN
	6J+tJIJ2Dy5An4r0j/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi6-0000000GFYN-1P0O;
	Sat, 05 Jul 2025 07:53:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxVV-0000000GEWo-3X2D
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:40:23 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-73972a54919so1382057b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Jul 2025 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701221; x=1752306021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=DHS9z6kRytUOiWWvikY957QhotFyfmn2xX8JRFp8yYZmrduIGmUf+uFErckShGa99G
         5fi6Cn10pY1/ubzWDr4cKjFNzLG9DUiP824lycTVD9LJ3cNx1d7alUtUhc6xhvzBITYs
         vr7mpYiRtx1hIUfrst5S8OwjC2EFVUOy8jfwvFr+27UlWU2LjvXkFHmpsYO1shZ8/zc0
         m6VV5X614lH+nkuu4Vu45rsa/ddr4JS2+RWFTQbUZx3iwraIsNZQR3ju4PKcZy5cyC87
         a64NFR57YwXfZvnE2mlYqAA7VJUbbeNrZXssIR1sAJBkipckOky1jrBu/0G8NeCEcQaW
         /2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701221; x=1752306021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=BN56/E3opdtUYbQHJ0D0RlteAtg1c7Dd0HmZXgcIOAnaxrNgNiJNIlmbQl8MP+YlMh
         LrU+5Am2gAW/e/iu2+OlLZkoYaaW3o4cr5OUsJ/f3OrDSDNG02AsmchXCTgIevmJbC80
         G2RG2tgNkYouGvj2ijInyRDzRu7yqKyv3BMIqdoLoxOVVfw3DAr80PAxS2/xXSUGHXFm
         8H44z5+JHIr84Drt8cxmJLzQWORnAwBcpE0Ni1muY0WledhT2an9TArz4mKDRXYTqQQY
         D3Gle+QOWG52pBweiM2nS7XiBgOJp1UHpzIEBkHi73oGh2KmqTcacVP4Igul6IIQ3Hzu
         eLcw==
X-Forwarded-Encrypted: i=1; AJvYcCX4QDOZrdvuE8RxIKolKsUuuvNeyuX1a0W02FYAJQJsO4+c0dFfkRJ0AmIPQOvM46dx9RgVlNQocBhDFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHZoHaTLd+01/fY1+PtdWmAZHiZaNCzF5GV2X6/057fIHlGiBW
	9ZRm6CzU7lvzsTW+xSOEjg8Atr5En5peGIVT0tRBtsDJAa2fSEkAWzkZ
X-Gm-Gg: ASbGncv6MSHN37LeRf6WSnwUeUJMU40ckVi31/W4RgbhRhsa7wQyFgMIsfFATixqy+a
	KlnQoUV1Fqz7JeRtOIU0YWbCVLX9quJmVw52nnk4+wQauK5GaAhUxlj71ywTIOb+eCdN9JSsX1b
	AP60A7nc/0goXEY9fpeqY1FE1yIkTXcLr3G1gZ9oOh8sufAghmWfGkXa6kqp+LGHVFAGgH4dIkR
	OaPaYyS3nhP8ZPxWxKLQFWUQ/1zPuj24FEcwleg+7DIimD0QRh556X880JP3pdajyCVQPmx2J5h
	gg4DKiKmGsMZONfHQ6bl7ROLbQ55GnsclyhVO9k2stH+hmU+7b8XL+cB63oxJY7vllgLBiSAIJA
	C7TjWDys=
X-Google-Smtp-Source: AGHT+IEHsZMB8Rt3ySNMA98IFcpj7ykAyWeeEOZtesKG64iloxS1vXwaT1pyycU737qfyAG5dcZ0mg==
X-Received: by 2002:aa7:8893:0:b0:736:3979:369e with SMTP id d2e1a72fcca58-74ce8841fc1mr5530451b3a.9.1751701220593;
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add Sophgo EVB V1/V2 Board support
Date: Sat,  5 Jul 2025 15:39:53 +0800
Message-ID: <cover.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004021_881615_BF3FBCD7 
X-CRM114-Status: UNSURE (   7.66  )
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

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v2:
merge v1/v2 binding
v2: https://lore.kernel.org/linux-riscv/cover.1747231254.git.rabenda.cn@gmail.com/

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (3):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 233 +++++++++++++++++
 4 files changed, 482 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
