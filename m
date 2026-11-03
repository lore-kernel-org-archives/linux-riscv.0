Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15725606A32C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RCvgS30Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KtjOBiMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=luisFn6D6Y/jM50sr8PWhRPPtULlnENsbHjnhuPOWkE=; b=RCvgS30QUJVE7PIKC9IPaPnfQE
	QyVRMOxMam7RhvnXnpTYjCrJYaFePFY8GotNxvOpWYoAL4danuDywdeo7Hb7JImxb9oo91sNceaf2
	BdtyIE5OD8Wccen/2qxxqrcsDW0RFJambMIKOnq6Go0I6C0yJBtlN0sgTMhQ2Tzr6WeQle7q07mjg
	hhX0tr/+7otXmr8HAxqDkpf3J+msRLO4id9qDqE8qjfeWb2epM5YI6bTLZwZxM3zUvjUKK/n6Scyg
	5F1Tt+S972kchoiQz8T084WUhJCCMXjaJxd/q+tmfWopsdRcOP+LW0S6at8AeOJHRfkxO3H4TvzHP
	GFHPyr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAME-00000001f3v-35A2;
	Tue, 03 Nov 2026 08:59:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMB-00000001f37-3Qih
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so407513a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696340; x=1794301140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=KtjOBiMnx1HsdopRG3bTpy1IUeM7Jb/2bFQCV3cjmKIja87uG+qsp6lSDQqs8D7n+l
         5vTvmkYG0szlrYy9zMM2ZSOjmOHtdSOKeWvIaXWnU4jCaGxkxv0DS8HrN88MoC0bdVKy
         F9pkfmxkvXRZUySgZTK7P/hRyhww4Dr6y8nO+hrxGI1IkaMJ/11h6wWDF/wo8z6TxwQ6
         F8VxYZIGR2EdRh63hNJGWeoTkgyEnbgzxAcYv8BfvlT0GvVlFTLLuQyL47kGmZJEiWPL
         lwWnvPZb84ekVhNgGJHzSgMcjyb5SGYM020Wr34og/39rKM5EO7YLiJ2wTp9Kh0yLyJp
         iJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696340; x=1794301140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=QpCP8n/OWYORTyBQGwgEaT5r0Yb1ln7Jx0WYYmzH6Mq0yrza+cDdODV+1GDCPTvvLA
         neDhVEMtZAPLA/kplrIj8md4DuVJUDiGoC7LXPwLJp4plok0fAaeYCCMLKxx+92kPTym
         l0EyCnxEeRIBfZX+/ycTtYUBv6Acjq7/SW2WxgjVa6ezLDSBErctOrKXJVrEJSeHBj7c
         SHbybwLKnqmjdP2XmBQig3LSPWE3STCAxwQaQlpY9nV1X6Zp7bSjCwbIU0Q6S84eAUki
         3/xVXn8dmF04KxULuBhQ/UyRGgMJHUgDESVjCCjzErDzAQuzruDWB5D8zKObfgIeF8Fk
         yOJA==
X-Forwarded-Encrypted: i=1; AKwUvBxduJaqB6BmMusLY1Nfjer2TfnV/E4cMarFr+ZrjX5y05sc0ERtK6OpAOQb6NdCynjCAGkEqb3v4kL5Kg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8rT22sm9kbAMwil1klZUiPCutK4rSLDeNyWX1r69zg45rn8eAz
	SAVZd6KiqEsK8plR7kqEA8QJxc44u85ZXzjnp/EoRJ+kmaQCvnF8c0j/
X-Gm-Gg: AYBFou1tavQK8Vazlae8J70D79N1/B1pzGBBIJR5rItc9n9TYph/gsz6Jylyw9ii31e
	79dWt7N6g7aJ7nll6bM3+qsXXr2lbwPdPU/91YV5RHt8BMLYKg/TeuaEnBJzCU9CnLzu1qnOOE+
	uu/wDEKPPKHa+ktMt0Xf15oih4cc8GyVH8dnAmZa5Pia6o5S46LZpG1SRxVazciyh48QD9OCQJ/
	a/n2moUv3ueegZMiFVAzG0dTT8efPLPcvKAQEkqZDDXJ3J/Ze9/Wbx86FI6wAft2naveQuXdB6X
	mg8bxH+Gm93OYGCZ3YWfkozmr0oR3K0RFOyGr5hJxpZlX6TetA/lerTQ4PMWzqvhUO1ALlzLrG9
	5F0Bp6dqff2gTlI4X9GEWWgRmx8cqOAPepykFTnbO6zHH+MiwOiRckm7HRwwAHWAQRoACwajJIs
	xVOYzCdOfNI848sjnfJo9LMAePPvAvugmc48GRWYAIgW63d6cZvxBMQyyUVf74B9qQU4cJn+VT5
	A1SdE/hmo1VqutZMcEAO2iwc+Zxnvv+AuGf/+Y2YwErlS5LBusXwu4JMnb3nhArC3eJiGo5z1h6
	/qoc8XdZptGcplRpuIY/oSEI2CnrC9rOrCifQVev+jhv9C+y/7SKBdw79AaWz08LkJadsgrCScQ
	gm1UvNK2xCNM70mUymfveCph6ou7V5J7Qnw==
X-Received: by 2002:a17:90b:1652:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3ae895a0406mr17203844a91.1.1793696340127;
        Tue, 03 Nov 2026 00:59:00 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:58:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:44 +0800
Message-ID: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005903_911870_4B143747 
X-CRM114-Status: GOOD (  16.50  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This makes one DTB work as both USB host and USB device on the Milk-V
Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
peripheral mode works on mainline, how should dr_mode be handled?" on
the sophgo list. There, Inochi pointed out that a dual-role switch is the
right way and that the default should match the vendor image.

The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
through the GOTGCTL session overrides while VBUS is present, and
GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
the ID override in the top syscon and lets dwc2 follow the Connector ID
change, and this works on mainline too, without any change to dwc2. So
the role switch lives in the PHY driver, which already owns those bits.

Test setup
==========

Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
CONFIG_USB_ETH=y. The series itself is based on current master; the files
touched by patches 1 and 2 are the same in both trees.

Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
applied through an overlay. Test 4 ran with debug disabled and the
board DTS from patch 3.

In the logs below, 
R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch

1. Default peripheral, bare board on a PC, nothing done after boot
------------------------------------------------------------------

  # ls /sys/class/usb_role/
  3000000.syscon:phy@48-role-switch
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

2. Switching at runtime, same setup
-----------------------------------

  # echo host > $R/role
  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # echo device > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

The switch was repeated without an interrupt storm, then:

  # echo none > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0

3. Default host, on the USB & Ethernet IO board, nothing done after boot
------------------------------------------------------------------------

Only role-switch-default-mode differs from patch 3 here.

  [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
  [    3.666655] hub 1-1:1.0: 4 ports detected
  [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [   74.804484]  sda: sda1 sda2 sda3 sda4

The USB stick was plugged in by hand at about 72 s.

  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # devmem 0x04340018 32
  0xF300081E
  # devmem 0x04340440 32
  0x00001005
  # echo none > $R/role
  # cat $R/role
  host
  # ls /dev/sd*
  /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4

4. Patch 3 as committed, debug disabled
---------------------------------------

Bare board on a PC, nothing done after boot:

  # cat $R/role
  device

  PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
  PC: usb 3-9: Product: RNDIS/Ethernet Gadget

On the IO board, with a USB stick already plugged in at boot:

  # cat $R/role
  device
  # echo host > $R/role
  # cat $R/role
  host
  # dmesg | grep -E 'usb 1-1'
  [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
  [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2

Before this series
==================

With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
SesEndDet storm, and so does boot without role-switch-default-mode.

With dr_mode = "otg" and no role switch, writing the ID override by hand
worked:

  devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
  devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts

Three round trips were all correct, and ping over usb0 afterwards was
5/5. On the IO board, the hub and USB stick appeared after one toggle,
but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
had already set up for device:

            at boot       after one toggle
  GINTSTS   0x05000023    0x04200021
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Test 3 above reaches the right-hand values at boot without a toggle.

Not tested
==========

 - A USB stick already plugged in at boot in the default host case.
 - Running on a master based tree: all tests used the v7.3-rc5 tree.
 - Boards other than the Duo 256M. Nothing changes on them, since the
   role switch is only registered when the PHY node has usb-role-switch.

Question
========

With patch 3, the hub on the IO board needs "echo host" after each boot.
Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
role-switch-default-mode = "host", or should it stay the same as the
vendor image?


Chen-Yu Yeh (3):
  dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
    properties
  phy: sophgo: Add USB role switch support for CV18XX/SG200X
  riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
 drivers/phy/sophgo/Kconfig                    |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
