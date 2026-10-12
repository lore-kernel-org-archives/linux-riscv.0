Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD9CA9EC5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bkQZ3l9V9Gpd443KbIi49AO3oCyoUDVZtM43lR6Zi10=; b=127p9sdHFkBdat
	kKEU8vtt4WfKltSBM8lbwdrS/Xd5dQRQlHLxNfOz6h63LAh9KARMvMYwyAdivMRq4ypqfEyZDIuen
	CAuHYJhoIo0Yjki1xNrl0O+QZ/VseaWnwtTYffysIiouKWyTnvW4Bn2a/YMAyCBsfWf6YtEl3bULI
	jEIkB49Ctdb0T+LlvL9heMjmOnJPIDrxfOsObHA+HWK85juMZQ9y4L25DIRU0lVtVezmmaPdh8q4m
	MBhByigFR81AaS0smXNN3ksYd46c/iFzL1X9XOAJSZyDCCyCE7a7QrgSrQiTFELbuWvbaDiZtw4aO
	dlabqtVcz9aGase+Wclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPse-0000000Bgbe-35EE;
	Mon, 12 Oct 2026 23:56:32 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPsc-0000000Bgb5-3DIx
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 23:56:32 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3514b90bb89so4468790eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 16:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849390; x=1792454190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=ZcXG/gTHuTSzCQvsQ42j7td2d8Cma2/jEEApoutNgQQgS1XOJlOX7z0h/UoNwQ6T58
         Ar1EsnI3/y5CwgfecnlB/qH4+f0NFwBRVa9e4N6Lf3S5CZwazFXo6i69Ir0JpqPrGR+H
         5YxCOH+rAA7ABIKsvLY4ci3SeYL0LxdRMlNuKKDzw0bGL2HCRVs4YnfHp72fqarD/Pkq
         zOnYiSoAg+/og3O7MZoJ6eXWTEs1Gc6odcWKphgNA5CxYtbAHvqogf6F+iOiLGQwRae5
         OX7h9HUg+oAUgl1Z6yW9ko9Hk9rqRDRRBok0YXQGa0pDtXARuz9xLAC5NNqRgK7trma6
         EH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849390; x=1792454190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=plkyyPalEuT7wnM+rvkqJu4rL3QUHcQ3aTVBDxBTwRNvMostbZk9dXhnkwCLYnT8yF
         1SsrG6Uhu8ATRBU6prkv4mw2z45KGSET1KwUFfntf48D0+zsjMMW0wRgJ2IX44Vp2myC
         k/JaqXSwROHsh2rhb9uQpdMJlPx/ATwqTg3DvGeADPXW37jPuS/SGcqIXVHyyGVppKYq
         NWt7R1RpGzoMuMN6Jc6qoAx/IybP8QBCc/wpSijBnDtAfM1RO++XWzLg4lSLGR7fTFxs
         uAgyrWc34gYpi1olgWk7FK4BOPwmVMqLkfJYBvOIzjUIRueumO9H7YSeXB5G3RPlSIZM
         SZXQ==
X-Forwarded-Encrypted: i=1; AKwUvByM6Tq5EIZdCB4J5jJbnxW/OtURNuRmcC2DfjbtNNsilcEy6XBEm6GY8tJnn+vR+ZsXEltXD1lLfqNt6g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJlQAWJE05E4q39m2MrU/YBnWRlmeLNHkTbIp27qS4MDYCLdB9C
	GbAt+imNFfGDG/nTUFwxPJVEEBdoyL+VX4fAHg//dQ7E5g6N2DjDGA1m
X-Gm-Gg: AYBFou23sBBAgTnc6emrpRdQrkTcd3EOWBYgaddyzJE72AoaPOah72wJWdDM7cV/NyW
	I2oXmhQWKzQmEspiOuDA93CHsUT/gXHGrNMQORF/f8qfl9hO21yRUgw6d99GJY7Ykh9X+NKRkI1
	Nx+UJ+ZRA/S0/TyjkXVIsWcxVUIIJ2cgUph49YVg3vvi1juEAicPJnRJ36FyeRqn/sh1eNHeccp
	/CH0eKLS9fAIHTyAcYo4oMv15fcaN/tlTZPTgPhZAfoC9Qloyty4aAmKmdVNvHxEEfJ/SQQSmr9
	jv8Jo9wtE9uaDbPBqJEA7FJJ9q2XUu7ddf8nLS/M4R9p2pM3kgomsxCiurWUqj0wM/+q5BAfaZ+
	KxAAPLRdRtLyMdr3gttFJivkdUloRbLGknWgL6n1MsxmWXteKPnYN8YO32xsvaLOMk+1E+I0SIF
	7qFjqGPh3Yl4nWE56jqHtlo2uoITQwdEDM+wgBeLJJOqYRbZiXQ8oYE3CzqiIjBfYm95Q6RbHCW
	1AvqwL/DPwDyXtwmryhukApJhBddGZBGKC7AACmXEcprzR3RXdQbX/YcH2uDas+pcS2q5BNgIRv
	p+cWTgoXzZ7a3KhUm+Hr1d0VWS/3J7baZrtkfP2hdGhNZZTHpfv2DjrnSpysUoWP
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr6631069eec.28.1791849389564;
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:22 +0800
Message-ID: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_165630_811381_B3A9F500 
X-CRM114-Status: GOOD (  11.51  )
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

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi. Patch 2 tags the board-specific
EEPROM, PMIC rails and SPI NOR on the boards that have them. The set of
nodes matches what the mainline U-Boot SPL tags for the BPI-F3 and
MusePi Pro.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 12 ++++++++++++
 7 files changed, 53 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
