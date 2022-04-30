Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A8BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxhS3XhBB2PtaLRuN4UVorOQQG/TI5jjpzeFVzFq3v0=; b=tPK4QzXg3D2C53
	fwVQ4HUmdp5SSlPLo5IiGQjMw10coNI9SrOeYOoRfsJracItg6sIkhB3YRpAS21Tc6pqmbsqeHSOQ
	1PeU30r5FR7npyX6cd3xlEU0QphMbU6ahMXaNsNMvSiMZjJHDTPPYHbumpOOGYeIgdbBFBq2wWBBU
	DvTkaUrewYKTmBuJZIS4slChE7d26m1ak7S7l6hQmJXo58xnF8nV7gpLH+1Z76vhIfoDjL3bCiBh/
	PAEPTg28GaGwpfWix0/jP4eJHByjpsFSaDf2erQj9ZlC1Emg0uKoZFE6EReVB0a3LqbZdQFk0dSKp
	G159n40iBnseRLh4eDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuC-00EJMc-4o; Sat, 30 Apr 2022 13:13:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmu9-00EJKp-8R
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:12:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c11so4218832wrn.8
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVWCR05ZRCnz9WBLjzE6WX4F3rgPdcPSc5sIdW/BRc8=;
 b=Fuq8dDB473Duj1wOyKi9RIB5oacDfg2lZPXFYJBTmv3oql34YpY1yy/TR1JDQVyHbz
 AGXoa+ixLrNEqDiLuTwDWDV+HedCDxWVkJ9MqI+9F5p3goGeGicJJGujfDPkBtO/X8d5
 iKCaVZF9KVSlcC8N9+h3fgQcKo7Lvtt2dqRwp9NvZf3gCfAEjvd8E4BS3CORXaGdzzZi
 HHbcMIMixGJ667kl25mSQjC+S6AdjkUkG1zmAfIa+NUkSc5Kc2E8+NQLRTFItAbX3ho+
 3FO9qm+MbWmM/712rCErZ6OKNkA7v2/XxaYS9JJIsn6szqeKoz8VeDD5yYFuyRzzJuJL
 hnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVWCR05ZRCnz9WBLjzE6WX4F3rgPdcPSc5sIdW/BRc8=;
 b=6FSY8UHxzor49spqiS/07uP6bqUYOim5BjOFJ5GIYlBiD/XfBHWbJB04WT5wnhoa/6
 9bX23MNV2tY497xrJ4NFAMoRqqDBbJrtDbMHdkP/V4k2psKp3YtRy/e3MkhAzkhff7md
 VvP18WXKtxOcw1OLnBAjIwRARKyfGYYkKbFYZRB9oln9B1Xk9rw3PCbZmLbT33A6f3OZ
 l3gvJBRn/wxpNf8gTRVLzPcJZ6y2WaOe5xSNSnzNzQP5uB3HM2VR3m1PpwxwOtco1ZDu
 j16B7WmXvD6Q5iyY6qbFCLb/JkrtThd0msVT+CrGN3cKOVkyf4+hneaBoEfuF8Apb9sC
 lTcA==
X-Gm-Message-State: AOAM532OOJbGf1cIoZUa/SiXTuznpiz657lxGmKXeKsOdwsCGm2EmUI6
 sKe+M7OUMSxMuPEUzvQMHhvymDZWuDg5VUo+
X-Google-Smtp-Source: ABdhPJyl2s3fwLi7RIfq04FmLzyI9JYAxA0nKnSPYZExKssylLd4kz/NODo167kGwIs2TOt+YwwEOQ==
X-Received: by 2002:a5d:4e92:0:b0:20a:cafc:ebf1 with SMTP id
 e18-20020a5d4e92000000b0020acafcebf1mr2938721wru.17.1651324372658; 
 Sat, 30 Apr 2022 06:12:52 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:52 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 0/8] PolarFire SoC dt for 5.19
Date: Sat, 30 Apr 2022 14:09:15 +0100
Message-Id: <20220430130922.3504268-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061257_535273_0020BC89 
X-CRM114-Status: GOOD (  12.78  )
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

Hey all,
Got a few PolarFire SoC device tree related changes here for 5.19.

Firstly, patches 1 & 2 of this series supersede [0] & are unchanged
compared to that submission, figured it would just be easier to keep
all the changes in one series.

As discussed on irc, patch 3 removes the duplicated "microchip" from
the device tree files so that they follow a soc-board.dts & a
soc{,-fabric}.dtsi format.

Patch 5 makes the fabric dtsi board specific by renaming the file to
mpfs-icicle-kit-fabric.dtsi & including it in the dts rather than
mpfs.dtsi. Additionally this will allow other boards to define their
own reference fabric design. A revision specific compatible, added in
patch 4, is added to the dt also.

The remainder of the series adds a bare minimum devicetree for the
Sundance Polarberry.

Thanks,
Conor.

Changes since v1:
- fixed whitespace problems in the polarberry dts
- disabled mac0 for the polarberry as its port is on the optional
  carrier board

[0] - https://lore.kernel.org/linux-riscv/20220425104521.132538-1-conor.dooley@microchip.com/

Conor Dooley (8):
  riscv: dts: microchip: remove icicle memory clocks
  riscv: dts: microchip: move sysctrlr out of soc bus
  riscv: dts: microchip: remove soc vendor from filenames
  dt-bindings: riscv: microchip: document icicle reference design
  riscv: dts: microchip: make the fabric dtsi board specific
  dt-bindings: vendor-prefixes: add Sundance DSP
  dt-bindings: riscv: microchip: add polarberry compatible string
  riscv: dts: microchip: add the sundance polarberry

 .../devicetree/bindings/riscv/microchip.yaml  | 12 ++-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/riscv/boot/dts/microchip/Makefile        |  3 +-
 ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |  2 +
 ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} |  5 +-
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 ++++
 .../boot/dts/microchip/mpfs-polarberry.dts    | 95 +++++++++++++++++++
 .../{microchip-mpfs.dtsi => mpfs.dtsi}        | 11 +--
 8 files changed, 132 insertions(+), 14 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (93%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)


base-commit: a91b05f6b928e8fab750fc953d7df0aa6dc43547
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
