Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B942AC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 01:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZC1Sh0lNURNv/tazJektoXTLhOTCj27zyRdWFiPWC8=; b=Pq4rDSkrP/Nzt4
	WkkAczP8nDGp7JL48d7MKpLg4gN/uzD9oAxkNBRyxFeLFR9Bp4U4daOk+3bvd+RucQEOnmteI6YRr
	bcYW7A44ZMckow53XJW/JvA5CjGajtf3/GOrDVXQltpjuAy8g4cMV/4DQesF7wOUp7dTdzY8xqnDI
	I6+0GboS4flcwV936X40dWwpdpr+t3DZexABWfxePcrS9Aa3i0jy+CL/8Q/+o1iIRdXEQitTtLG82
	2s8sf7er5o3dvld99l+9kTkjEPXGWWVHevxwYUGXApwCbpuiDkITZI4XUdtTfnJUzKWLwFknIcLM6
	z9tpfu6wh4UBQnNde+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubU9u-00000003hGx-3rcs;
	Tue, 15 Jul 2025 01:08:38 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubU9s-00000003hFn-3x4T
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 01:08:38 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC25E340E39;
	Tue, 15 Jul 2025 01:08:33 +0000 (UTC)
Date: Tue, 15 Jul 2025 01:08:22 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: pll
Message-ID: <20250715010822-GYA539814@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_180837_007980_1EB0C63B 
X-CRM114-Status: UNSURE (   8.93  )
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

Hi Arnd,

  Please pull SpacemiT's device tree changes for v6.17,
Note, I've included an immutable shared tag of reset-binding
in this PR.

  Thanks

Yixun Lan

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-6.17-1

for you to fetch changes up to 57fa4ba6d0a4669fd8f2557e760442d684374f3c:

  riscv: dts: spacemit: Move eMMC under storage-bus for K1 (2025-07-09 13:49:27 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.17

- Add DMA translation buses
- Add PWM support
- Add Reset support
- Add eMMC node

----------------------------------------------------------------
Alex Elder (2):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      riscv: dts: spacemit: add reset support for the K1 SoC

Guodong Xu (2):
      riscv: dts: spacemit: add PWM support for K1 SoC
      riscv: dts: spacemit: add pwm14_1 pinctrl setting

Vivian Wang (3):
      riscv: dts: spacemit: Add DMA translation buses for K1
      riscv: dts: spacemit: Move UARTs under dma-bus for K1
      riscv: dts: spacemit: Move eMMC under storage-bus for K1

Yixun Lan (2):
      riscv: dts: spacemit: enable eMMC for K1 SoC
      Merge tag 'spacemit-reset-binding-for-6.17-1' of https://github.com/spacemit-com/linux

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  10 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   8 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 485 ++++++++++++++++-----
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 ++++++
 5 files changed, 558 insertions(+), 113 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
