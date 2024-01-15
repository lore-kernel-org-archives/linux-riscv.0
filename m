Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3499CC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W94c++G1atmTjU3bUgJUqRv7sioVBwTPZskIZHquE4E=; b=f6k7xpexAM+Vlx
	Nh4lQnPq46O5DntkbcEr0T13jYSjdI48Px8ime4DcsgLcqpItOc5DMAmyPA2a6mTbQKkHZadkLIO8
	rLN1nIgKNd90EZyba8kk/gyroH8eSLgOywwhu9DCLPmT5e/bF3gmudwSdyG2b71TvU+2NqNNW57t+
	vPir/cIx7YfxeoiO28TTv3Wt1kh25k3/Y952z8Zu+NXUwHuwYywCQH0jwSF8T10bZw1EAtTQxsfPX
	nGG0WwZsZpTeVtygvhCAA1GioAetoKZ/bJ2vrZBm5YuehAfg+qclVoa9t3jEVzjELe/oY6PQtidOa
	3pfgvHioXTZXu4mAwypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhW-008zlY-1b;
	Mon, 15 Jan 2024 13:08:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhT-008zkx-2w
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:08:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3376555b756so4808206f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324101; x=1705928901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3m3PViSSSvRBvvAf8R0G1zKDb1jwNa59pfSuNx39IjA=;
        b=OIkPXY43FmS0YCJquw7oWhKPTh7s3J33LcmAiWUS7aGx1leyQOXhExLLLGctmeeLhN
         z20gY0hhmIbuWPzfCDjBsF7VKa0Vbtb+pUB+l8nYMqRkTbxRN+yIXPzUInDdFS6+/G9h
         +YYzLlfgTz2jPiJVS7YPILyVBZePf+ap3e2fynXIemfFZpYeiXFLgNzhGVsLb/gJ/KKJ
         M66AtmfWen2IT+z5t/5X0I6C6NzeHps+UIC+++zLAVIGrSLuOiiD2dcREqXOTSswCZLV
         W1YMJgcmgi/sD/JJTp/bb2c6Cj76A95X2UB+vNXk5feHRJ5BaaOPSg7j+l5+jD1xnWTe
         MDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324101; x=1705928901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m3PViSSSvRBvvAf8R0G1zKDb1jwNa59pfSuNx39IjA=;
        b=c9pKGCUiHKMGt4wZskdvvc8YYtAfLMb/6oXMD4tSIAQV9xepNx2UoqVuMRpsvfQzVA
         DfSj74vDxpFKBOPUe4gUUGUk+2tvxTrb4XUXfoW4QDUWR+AzI4F/q245+IVFAZX/vNlM
         0OOm8DptYj8eHrOCE7KJw97Ufcptsg8ruA2BbvjJw0+vJjL2rM4I2Mqd7nnMh4f2Ch9+
         31XfFS7dIB9eO/O+XdR+hyJPjuf2G60vPbPK8x6wBACc3y4O2Ce0Ch7vB4KbSV9CzQCo
         cvd0A+JRKABIw9r0X+uepsQkwaYXjPVQNX8vqEsEx/TSy5CLLc2PWkDEypFEsKrKbHND
         IVqA==
X-Gm-Message-State: AOJu0Yw9aEcLzOR5S5VubBUepdukFXEJnrjF7f6hr/0c5WQfT9KdP76U
	J2JGpvUHYPx+mv/Niy/s6uE=
X-Google-Smtp-Source: AGHT+IHYQfEs5XGymkxoK+hmT+5FEpzfUXZVunTBJ4C+DExa/kiwAN/9Ms0uGtOrL086Fib4Yb2a8g==
X-Received: by 2002:adf:fc02:0:b0:336:7934:9b37 with SMTP id i2-20020adffc02000000b0033679349b37mr2871427wrr.25.1705324100705;
        Mon, 15 Jan 2024 05:08:20 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3d67:232:2eec:2430])
        by smtp.gmail.com with ESMTPSA id d13-20020adfef8d000000b0033739c1da1dsm11843620wro.67.2024.01.15.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:08:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/4] Add missing port pins for RZ/Five SoC
Date: Mon, 15 Jan 2024 13:08:13 +0000
Message-Id: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_050823_966145_934BD124 
X-CRM114-Status: GOOD (  10.71  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

Cheers,
Prabhakar

v4 -> v5:
* Made struct rzg2l_variable_pin_cfg variables u32
* Updated PIN_CFG_PIN_MAP_MASK macro to use GENMASK_ULL() as reported
  by kernel test robot.

v3 -> v4:
* Rebased the changes on top Claudiu's patches
* patch 1/4 is new patch for using FIELD_PREP_CONST/FIELD_GET as
  suggested by Geert
* patch 2/4 adjusted the code again using FIELD_PREP_CONST/FIELD_GET
* patch 3/4 fixed rzg2l_pinctrl_get_variable_pin_cfg() as pointed by Geert
* patch 4/4 is unchanged
* patches 1-3 have been boot tested on g2l family

v2->v3:
* Fixed build warnings for m68k as reported by Kernel test robot.

RFC -> v2:
* Fixed review comments pointed by Geert & Biju

RFC:
Link: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com/T/


Lad Prabhakar (4):
  pinctrl: renesas: rzg2l: Improve code for readability
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 284 +++++++++++++++++---
 2 files changed, 248 insertions(+), 40 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
