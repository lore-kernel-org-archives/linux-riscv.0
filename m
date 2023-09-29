Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C4DE743D2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7cOT3ZwUGviZ1fUiq9zPgJJdbG9wu98I4pHbc7rVcTI=; b=EORiNDo3QYV8we
	/CMTWQfNXoYGzoPCRjmPY4EyT0ZH6dXLLtLc5R+kT9iBC6gCCodZV4tVuHVoBvHBeMX5YkLVDZYjw
	Ock4u1JHE7b7zzc54467QGbUj5PN/HVw44pN++K8aYSeNUAoswMyZFUNwO+G9XPuKmgDA+IXPYSHp
	Vvt7YTUdFGogufowI6ytMUEcHEYHKeDmWN+vBAelt9IMuKZvyGT2VvwUSnMEmWXyUAtQN54w0gJrq
	PdYN1QfQ8+MzCaDtv7d2FG4egsAE/KxA3XlIHy1X+0Ny+LSJLh9GW6mkjoigZ7dgEk7hG6VWS4G6i
	oGoedTzaWt6EFFK5DcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12m-006tm8-1P;
	Fri, 29 Sep 2023 00:07:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12j-006tkz-1b
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40528376459so139322315e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946058; x=1696550858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8MO+V9BSn3lqUf4u1am2/WES2bAF3+wTi6NHVIZgf4=;
        b=EWSPQ7l0yziwkdgm2mPmmUj4YCQ5O1XOBpX3sQ7bdgqwSzUBu9pOz0Y7aT6ditf9yN
         bi0d+uhQBbl3rn7nMYe7neDtGnKkKuzQVxhoJynsCv3K9fWeqf5nAVKx1KQlo4ISTSpi
         yXKXx3jY4jSkiigdSsTwFkCLhAlZCE23TZTZadi1QIJbYowToyr7tU7BGJiP/u025R4d
         Fq+IP7ogdhvsUu4pvJYta+HilTf7GTpU3uh6UbwXhrq+jSh27HZ+aLAvoZxwUzWgIElw
         NWqc2VsHlLTG042ea4vzxUMlcRNTJW0nuB8Fxl6wFJb5fuMivaqaV2DUlZiJ2cBGtQ/u
         OfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946058; x=1696550858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8MO+V9BSn3lqUf4u1am2/WES2bAF3+wTi6NHVIZgf4=;
        b=Y7PKhsikZtQx3K/qhIywq3IzQl+Aa7oXpaCXYoXoSunN6jG5rqO1OyZibaqnih6J0Q
         iYhVPphR24USaa9kXlBZxHAdiG/FxE8tAFgbbzdjC/y0Gimd2aBg8boOxxi3omU5rEZo
         CCibAzQ5SaRE9LS3vIXj9VVzf3P9rkaBVHToI2Gd/BC2aGXz7lJQzyPH9ExXdAz2phGW
         nv36Z8Ywwdjx/naBI7tjXVirO4dn26okuG/Npc7ApCLQ8vpPmlE74ND2MTBDyO2EICHB
         XyLWWwvPQ4Tfbj1N3H2Q7F7nInjwMbhkqjasvGWuM2CxynHOFgbhIhIRc3ygiUnmwUUo
         Jx9w==
X-Gm-Message-State: AOJu0YyMdo5nqDnI8muXTYvGkL2FZGVy2VQS+mJTdel/2zQAcjBdB62w
	dC9hfJZfq8XvS813H9RG4zk=
X-Google-Smtp-Source: AGHT+IEtRcSt9NVo1uDsW5hbfoZYLFuod5ANYVN39ChaMR/+GUeRCvkoEW0Pz+Q+0bhKT3iivXQNsA==
X-Received: by 2002:a05:600c:207:b0:3fe:f74c:b4f6 with SMTP id 7-20020a05600c020700b003fef74cb4f6mr2440929wmi.17.1695946057510;
        Thu, 28 Sep 2023 17:07:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Enable peripherals on RZ/Five SMARC EVK
Date: Fri, 29 Sep 2023 01:06:59 +0100
Message-Id: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170741_577311_7337E96C 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series does the following:
* Adds L2 cache node and marks the SoC as noncoherent
* Enables IP blocks which were explicitly disabled and for
  which support is present
* Enables the configs required for RZ/Five SoC

Cheers,
Prabhakar

Lad Prabhakar (5):
  riscv: dts: renesas: r9a07g043f: Add L2 cache node
  riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
  riscv: dts: renesas: rzfive-smarc: Enable the blocks which were
    explicitly disabled
  riscv: dts: renesas: rzfive-smarc: Drop dma properties from SSI1 node
  riscv: configs: defconfig: Enable configs required for RZ/Five SoC

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   | 13 +++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 23 --------
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 55 +------------------
 arch/riscv/configs/defconfig                  | 52 ++++++++++++++++++
 4 files changed, 67 insertions(+), 76 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
