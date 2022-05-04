Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABEFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5IIxy83P8g4TvW0HbN2wxLSCRPGeLWnJPZURre2hkrg=; b=QEP8m+LL17rlJS
	ZorQxbhaViq+SvaaYa/X2tENUe9JKBzm1dfxWYxnfIUAdnuseAvNJTF67E/ikEj1j5bmXl9MZYGrA
	9CTVzSGykdKY2geRyL8KlB0e/iXs3BQeqXn3+0WR2t3aly4YUuCWLNmH+qysWxP7oSkujLrHwIhhh
	ZzrQPMn4P7NHNnMnvhe4jFR5Ccy9gDwUBjc1DNyZOEU3L3Kzd85Bq0vVGlNYD5CKyu5gywmY1xVqp
	ljnaZpqgOAgW6YRfbQB6vk4Rg5bs3PQljtHv0ehQqNCROWC2A91j9rQ6EMHNzsY3HgZwysfJVhPN6
	1DAROvOcYGPHyT9uKi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLiO-00Ca4p-JE; Wed, 04 May 2022 20:35:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiL-00Ca4O-Jl
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e2so3511454wrh.7
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEoxvbJ2coXtM9GkcSeuePyVXx2vfaBQhN50CPNKAwM=;
 b=ceU4b1kucAjbAxpJDSZu8SD9ryaZ3nHTD+M6HqFhW70BCTtOrdC+EPy9KZeIm8HoV2
 aCRfI+UaOXVibKEAuFdYMUESuMZyEP5gC0oMizHF8cc44rrIaEcaZ9W9yMr86MEJdjjK
 6MHEevKxbyOTkh/At8tuqzfrpw6AASit3NWA323FibIlrS7H3lps6AYWLOe9rgDOZJ6x
 xF+e8aK9lLYkHyBODgw5nTpEooV0dHu3+bPssrstdvu2rCXpFPVKZhdHVoNOXtDzApF2
 4W+UXqxV4fWkGlwhPnlaTU3OENAdnGyNNDunp3WOO17odKf/XSOKAVW4rP2kDL5+UPeO
 xnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEoxvbJ2coXtM9GkcSeuePyVXx2vfaBQhN50CPNKAwM=;
 b=XEm8VLkO+u3zBDktVBnmduk6ZWl/Qp4PADYsQwjT/H9rySW/AKAEAJMr0cHsvXqz97
 ZHp5L7iruZIQ54P6NcOv8jQp27CMa/zg8idiKJQTwx6+SXY9ftIWYbH5oQQLhKyaUj07
 5TOKZgyFydI0IEenEQ008P2EEc5YPuOnfXbmZyUS0t69meDQM2zwtxNxXWvbA3Tcfsf4
 +p5YfXZqTGINfjH2jtvdBKSIUXnxE9JmeVDS4T3IYOKm435K5XX6OSUZANPIvgMqil7L
 tslziymekBNhNdd8e66YwTi6JaHXjMQk1i/Ed66c1ApNyyvVjtMgkTz0Vx4Yji45OLA7
 ObcA==
X-Gm-Message-State: AOAM532qiRikpuoM2qwED2/oFyH7tMPPE80VH1SzE1V5kT0siA6x0skT
 tOlADCqxN6Fev5ADMcqoRgPn0Q==
X-Google-Smtp-Source: ABdhPJy6R0Oj6A1OuDX+ULxfI9lWNvJfwlUvuzXOEl90OAaIDqnk5zsRJ/sasn/yJ1t0AkgkVW725A==
X-Received: by 2002:a5d:47af:0:b0:20c:6701:50be with SMTP id
 15-20020a5d47af000000b0020c670150bemr10881810wrb.148.1651696511558; 
 Wed, 04 May 2022 13:35:11 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:10 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v4 0/8] PolarFire SoC dt for 5.19
Date: Wed,  4 May 2022 21:30:44 +0100
Message-Id: <20220504203051.1210355-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133513_708359_3C8DCCAC 
X-CRM114-Status: GOOD (  13.84  )
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

Changes since v3:
- remove an extra line of wshitespace added to dt-binding
- remove unneeded "okay" status & sort status to node end
- sort polarberry dts entries in ~alphabetical order
- add a comment explaining why the second mac (mac0) is disabled on
  polarberry

Changes since v2:
- make ,icicle-reference compatible with ,mpfs & put it inside the enum

Changes since v1:
- fixed whitespace problems in the polarberry dts
- disabled mac0 for the polarberry as its port is on the optional
  carrier board

Conor Dooley (8):
  riscv: dts: microchip: remove icicle memory clocks
  riscv: dts: microchip: move sysctrlr out of soc bus
  riscv: dts: microchip: remove soc vendor from filenames
  dt-bindings: riscv: microchip: document icicle reference design
  riscv: dts: microchip: make the fabric dtsi board specific
  dt-bindings: vendor-prefixes: add Sundance DSP
  dt-bindings: riscv: microchip: add polarberry compatible string
  riscv: dts: microchip: add the sundance polarberry

 .../devicetree/bindings/riscv/microchip.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/riscv/boot/dts/microchip/Makefile        |  3 +-
 ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |  2 +
 ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} |  5 +-
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 +++
 .../boot/dts/microchip/mpfs-polarberry.dts    | 97 +++++++++++++++++++
 .../{microchip-mpfs.dtsi => mpfs.dtsi}        | 11 +--
 8 files changed, 128 insertions(+), 10 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)


base-commit: b6b2648911bbc13c59def22fd7b4b7c511a4eb92
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
