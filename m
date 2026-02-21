Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D92C61DFD
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ByFf1aE+mFgdugxwa+DbVBPn1UclFpZyEVm2Zump30g=; b=cLj31A715OF/ck
	chlK0uowvznLerUs/qiTNEGaiLZ1Atl7pzpigKwJqpmAEOgNnSKMzNiykDeOQjPbN419BdD2hqRwd
	AFPtOgjQdAZJyyK2c5mjWuqsV2TAfDwF6xrCwt4N8ZpJ4WZbiIujtklT2+FtgI5paR+lRCANGyYpM
	GiBClKEJ/x2gsXvXu1fyFlF0cA6tOsSovwFGdvsZlnO0AGzMVSz/LKO8cvc3pEbBfqRc9aGgT9WlZ
	zNr99Jb5yhX10dPX5Wl54sSI/jWndHQACVanShgviOF92jK+0hLiR3zssxh8mjkLN8e0OXCtnAuJq
	3If7KDXXxnFLjKRR+0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqI-0000000GFU6-3NVr;
	Sat, 21 Feb 2026 18:36:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqG-0000000GFTK-3fv6
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:38 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38713b53915so29331741fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Feb 2026 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698994; x=1772303794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=eac3VG41+nD5u82AO0qC9PY4h6S+BEaG6Zr4Fcpn/OW4NBbl+yz7ZmPhbymVf9tRKX
         g0xw3oCVBt5pkbTZ6kcVyPINyyGKoSUpNH3Aak1BY0CqZvVNLEHDYeP0yBmoKnS9xQqW
         8jkh5EhjSwbuwTl6WLU7aKKAGbzJqCPSm2Ft8UgLFQra2APHCogpXA0wQwjGc0DLVGnh
         VzuLKBaUSEO7iZ13MmfmYob+Dewa6NTr7j51sm/DD/65s80DZ5O1Zi9SWAFh8o66fhAP
         vPA7hnaMQMJ116ivlwjLdEb78UajJNWW3r173Lm+qqEx0pnLCy5AnXwIUyVKeUaaHPe8
         r75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698994; x=1772303794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=UyQbd5wRlC/XtEjh5IG1ebaTXviquaRfs24JKDFutMwTf4Ou2/Nnye2fetwgekZgiV
         HwOFFNn+ik4fDc6WadNTMXaqYYz60/cPQCoq49lSYFJhBYQq6X/SzPanrosaErKmfan4
         6ZQq1bC9hNk2fLiTEPt4YmnWKryj3ZFjFBvaTyNgE5TjeJU8ZOLOo1uGiXxBzSLRnspQ
         nstasXVzpzP9S6gkqaNXav8DrRZgDbd0XXNBV0zZLG2+nf/0CEIHn/mDjxK7L7682Y1N
         Ffs0nuuIl6k66X89JIJEEgtTPlxYrjh5bic+t4whr1+ZOQUc9TYSQLgMfyZplZ7QVmc3
         Z5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXteSjXirWttZU7PnA5SV3E1zt7XktDrDUKZSRh5c5t47oioraGD6aGR/Vrk6CkCwBSWggJglwh+jYag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyUvW5ZhbHr7ijOtYMdn/rhUnK8Y9H6K4RxXZjQHWQpSeULFiV
	TEjYtWAfDoGhw03OSGZjZ0FBS1eUp5JYpVD6XYr2PTrz+S8vbiOQnGI=
X-Gm-Gg: AZuq6aIM+aGBi9f1LagEeAUiqZryaxndciplkP9jWNFwB1E7FBPDAeEtjEJGLFWZvxV
	oJMoxI5lywejAhQDExrmBkweYa/5wORYey1o1L8wj+ZTxYOx7EkZasTDr92MOkwepmlFdBkHLHP
	KNrynHNU21jSNaUTT2UDtOKEBItQHpJhEpFCNW+JcvGoKjHLA85nxArEBB4aq0VefJA1NwUp2LG
	ZQ6ERT7FLp8/1HNevoFHkYP/Nm6MDmBBlUieT2tsO5CFHrZOeTPuRGUv4fD00y4IbuM18MF6d7t
	ODIdumPqvT8cgxY2QZ1dc7L3UH8oZHYwJzA/1FfGIiBJHbKvdIiA0orTbJpApiak/vegty8XZtn
	BqMXDHFBZNH7itstjiLyQSy4CHCRJZVKKy7k7jeNTHrnUIDpDtKjrMY1ehEjbZj2IoinhSVQzRu
	bEvDAXr0bl2TVj21s4aku8u1iy8Ro05toLCi532jusSWUH0G0=
X-Received: by 2002:a2e:868a:0:b0:387:e03:147c with SMTP id 38308e7fff4ca-388536cef04mr25730261fa.1.1771698994175;
        Sat, 21 Feb 2026 10:36:34 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:32 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 0/3]  Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Sat, 21 Feb 2026 21:35:50 +0300
Message-Id: <20260221183609.95403-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103636_934319_296851B7 
X-CRM114-Status: GOOD (  12.47  )
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

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

v11:
 - fix a remark in the driver
 - fix compile driver for 6.14.0-rc2

v12:
 - fix a remark in the driver
 - fix a remark in the dt-bindings
 - check driver build on 6.15.0-rc3

 v13:
 - rename driver sun20i -> sun8i to reflect wider SoC coverage
 - drop the misleading APB > HOSC dev_info() warning
 - require allwinner,npwms and validate it as 1..16
   (remove default 8 and silent clamp)
 - adjust clock-source selection comment/logic:
   when sibling is disabled, pick the faster parent (APB vs HOSC);
   when sibling is enabled, keep existing shared settings

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml |  74 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  13 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun8i.c                       | 393 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun8i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
