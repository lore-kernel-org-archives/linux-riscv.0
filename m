Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C2C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JqZF7NSEhIX0qfPutg+38JbjmNTplNNLRlWnYVEnD4w=; b=uDT6FIVyooUPfM
	kMfyxbMP1x5EkYRnMHv41x11HQeIfWpe4gxMy1jKkM2ikbXwjhrsEROGnClLKITEIFcAaHxOQvND9
	oGpMFSGZnXiJmXDox4BqCLaSscbXCOn9vsLCeS4xgZ+fAskrOpaPysbU6NodhqnlNkq4fU+QnklUc
	ZvDEcp/qgO3RvB/5WPQmuolvm+lhTaWwmcEP+TPQgmBFYv6wqLVIWJQCgiciYeiR+ER9u1oG7OaAb
	2lUmtiDsy9UTKgk1V/Sxi0AAmzydLCTUWf3bDBA5ar0UyR4k5T38LAnSG66DqqHHowCz/R7/45Y5Q
	MyjkAG/gcJvdiXFDuoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDB-00GnEI-5g; Sun, 01 May 2022 19:26:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFD7-00GnDY-DD
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 az27-20020a05600c601b00b0039431ba4905so860770wmb.1
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPg7Nhc9JbcxQ3e3ol1zL+P+PBZLZ37XfWJrz9DbVuY=;
 b=iX4vf2GeDh+FHZ/JCXBo3HZCta75jFWL58dt0DFfZn1TEBGSEgRbYE0x1Gs1TS7jWV
 UVrT4qHSregQNGY4sU0awJvOoT6vSB7pD6YK1v7dpo0g6laihkGjOPs6YTHuCCdAoCSe
 PiT4QjV5msq+HG8BgOIL5F8IiHwk1tT9QvL+DW2rjtKaNhUUcKbQqPho9V8oGETJwXPT
 iP1sdOnYYfpLzYkV3KWjjV2VbmozXQMFNGr9cDeW1VTvvKKeRZ+PyhFSZ6aXSsEoQPUb
 14yVVjad6uJHYWYQGwEK+0bIRzGYb+Nsf2gJSZiJQ9UWap6swF+hRXisYkjjSkZkt4xk
 FFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPg7Nhc9JbcxQ3e3ol1zL+P+PBZLZ37XfWJrz9DbVuY=;
 b=WOW3CR6l07tA6z8/3unN9UdQT+exTFRzBcat6YPaz7tfNOftR1UZHvz9/kqoOmpHIx
 13YoTlAGqYJQTju2GPWg3pV6ZPo5XRrb/ssAC6nZogW9u2EriZEvrTsEDsx/zeCdGio9
 K+tlzUk6IF2EEddN/2iJ9QhMcUWquuhWUq6mT+tIiY7suIeUeG2aUOt4ONISGL4EeB2a
 0hJy7vFlPZqxkeHrs6FKQm3KWmkGg1ZYYjOp0yNMMuLkEzK7mcXtIqGlYL/dSMmv2Oz3
 54UjVYEv0lCmXqaDQfj6/uHHWvkSh6tw/SDuXePfglITXU3uVIKT+clKq/7foKn9a+sX
 AEqQ==
X-Gm-Message-State: AOAM531sQcVMgU3jsFmJwb1LFo5szBMDV7SeQkGo3HtrC0WPifH5qVub
 vg48DvW92dyDaQ4YVuDBs3vZ+A==
X-Google-Smtp-Source: ABdhPJx+fSgeTpjGHTMYJfT1Aidt+7Y6vzsq69M3lRo7qufT3LsQ/FxIeuBZdP/nB/3nVuJoh7w+EA==
X-Received: by 2002:a05:600c:29c4:b0:393:fdfa:9baf with SMTP id
 s4-20020a05600c29c400b00393fdfa9bafmr12194441wmd.26.1651433180866; 
 Sun, 01 May 2022 12:26:20 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v3 0/8] PolarFire SoC dt for 5.19
Date: Sun,  1 May 2022 20:25:50 +0100
Message-Id: <20220501192557.2631936-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122625_705279_11019E78 
X-CRM114-Status: GOOD (  13.22  )
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

Changes since v2:
- make ,icicle-reference compatible with ,mpfs & put it inside the enum

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

 .../devicetree/bindings/riscv/microchip.yaml  |  3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/riscv/boot/dts/microchip/Makefile        |  3 +-
 ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |  2 +
 ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} |  5 +-
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 ++++
 .../boot/dts/microchip/mpfs-polarberry.dts    | 95 +++++++++++++++++++
 .../{microchip-mpfs.dtsi => mpfs.dtsi}        | 11 +--
 8 files changed, 127 insertions(+), 10 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
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
