Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07303C0032E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/DMjY2XcSWjfzcqrnG5FA9yae5X5jGBCGGgOz6CqDg=; b=hD2EOiokMRBQ7C
	HPGHN0cB5N0MbzIWouUewS8/30QPnrgGn+1xjlZx5nlTQHdONh+n6mz8OEjKZ63yxQqq0nSuIuDIL
	JuB59Vzk+x5k7BIr2iSVr9ona7nGXVzlhwRHwwWr7ySGqIRanxDj0TMAPAuMTkhbnyA6kym0X6eJh
	QzAETzCW6UDynBd/03vFi4eQfMhOHrQBULnuFxV3Lp4k9tRz0+GUvliN+Pbv/AwAUAC23fnmZeOwN
	pjfTe1uKg7TNRUA2tDATvtk/l7qB2/A3cmr7Yd27edbSuarigDu9v8h/V7a0OpM/jig8pJtTYEVvW
	B5NaOl3arpcViqijSfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPa-002LzC-0U;
	Fri, 20 Oct 2023 13:19:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPT-002LwM-20
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 188A8CE383A;
	Fri, 20 Oct 2023 13:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABBCC433C7;
	Fri, 20 Oct 2023 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807959;
	bh=IFYZh0PK+ZqTUr1k/dLRLjLE8s8/0wnHFTC9pViaxh8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gGP7QqDorJF7t5G71u09Yc+IU9HlEG+VSJtLubkKzLvteYGyVHleNncd2/UgRbfSe
	 a41Qnjk880C2g6j26vhCD0/1omgZTYhsTU+gQwOfl8c7AoTlFPAFIgfFXl5vCs5klv
	 jK5TEHBRJV+BGMS0RTRsSuN5zbewfAnsi9Ez7XDOQGib473/MTX8TVnOMzZfP26tbl
	 kL6HeC5CT9MMt3umwpowiqvNVLW30esvOyaaQD3FtM8aQ/6jShJ/GkR+rZ9B1q0SbJ
	 7mK5VilHFL9cryhGZsP4b2eRsUXChZy0B9ziuiER9rQVBVWsDqiWBEmdZhaRbpWQ84
	 WjMKG3JlKh2xQ==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v3 0/6] PolarFire SoC Auto Update Support
Date: Fri, 20 Oct 2023 14:18:38 +0100
Message-Id: <20231020-agreeably-filing-3d48708e6262@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Sx7XDhJn2vtaqpSQPM4WYWdT2f14tTpPwy2yBjd+DQQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdfJNElr5KoEZIY5Fs+O5rDWZtk1m+Gnj8+d2bHtZK Lva1AMdpSwMYhwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmMh0D4b/ji2KjFdXcYtekpw7 qUxSVd6t6ujhOl5twdrG54afJKZZMfyzLy3SbvqVenSpbHL+r5u7ThYfbXvaGhrL9q/079dijmY eAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_061928_018984_E2CED628 
X-CRM114-Status: GOOD (  21.15  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

This patchset adds support for the "Auto Update" feature on PolarFire
SoC that allows for writing an FPGA bistream to the SPI flash connected
to the system controller.
On powercycle (or reboot depending on how the firmware implements the
openSBI SRST extension) "Auto Update" will take place, and program the
FPGA with the contents of the SPI flash - provided that that image is
valid and an actual upgrade from that already programmed.

Previously this driver was added to the FPGA subsystem, but as there is
no capability for dynamic reconfiguration due to the device reset
requirement, the FPGA manager framework is not actually used by the
driver. As a result, the FPGA maintainers did not think it belonged in
that directory, and after speaking to Arnd, I have put it in
drivers/firmware/microchip instead. Otherwise, very little has changed
here, compared to the previous submission.

If this is acceptable, I can add this to my eventual SoC drivers pull
request for v6.8.

Cheers,
Conor.

Changes in v3:
- Move the driver to drivers/firmware
- Rename the firmware upload device: s/mpfs_bitstream/mpfs-auto-update/
- Fix the clock parentage for the qspi node added in this series
- https://lore.kernel.org/linux-fpga/ZDlJxrybiWy3Mk4Y@yilunxu-OptiPlex-7050/

Changes in v2:
- per Russ' suggestion, the driver has been switched to using the
  firmware-upload API rather than the fpga one
- as a result of that change, the structure of the driver has changed
  significantly, although most of that is reshuffling existing code
  around
- check if the upgrade is possible in probe and fail if it isn't
- only write the image index if it is not already set
- delete the now unneeded debugfs bits

CC: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Moritz Fischer <mdf@kernel.org>
CC: Wu Hao <hao.wu@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>
CC: Russ Weight <russell.h.weight@intel.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fpga@vger.kernel.org
CC: soc@kernel.org

Conor Dooley (6):
  dt-bindings: soc: microchip: add a property for system controller
    flash
  soc: microchip: mpfs: enable access to the system controller's flash
  soc: microchip: mpfs: print service status in warning message
  soc: microchip: mpfs: add auto-update subdev to system controller
  firmware: microchip: add PolarFire SoC Auto Update support
  riscv: dts: microchip: add the mpfs' system controller qspi &
    associated flash

 .../microchip,mpfs-sys-controller.yaml        |  10 +
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  17 +
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/microchip/Kconfig            |  12 +
 drivers/firmware/microchip/Makefile           |   3 +
 drivers/firmware/microchip/mpfs-auto-update.c | 494 ++++++++++++++++++
 drivers/soc/microchip/Kconfig                 |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c   |  33 +-
 include/soc/microchip/mpfs.h                  |   2 +
 11 files changed, 592 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/microchip/Kconfig
 create mode 100644 drivers/firmware/microchip/Makefile
 create mode 100644 drivers/firmware/microchip/mpfs-auto-update.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
