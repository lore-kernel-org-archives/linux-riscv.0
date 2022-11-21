Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3B9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFKOSqKLDXDsVQOYXpZ2v5HSFs1Eq2NYPKDZU7Y1Amk=; b=bx0LhfNm5czjmv
	FHL5S///Poh0Lapk4A+dbZQJrIzwBDU4prZJJyhiVgLFiEeyG340sRlKNK4achmnqDZWNuJVNw8SH
	2qi4cP+GngRhTPAHsRdV60IgzUQeCe9jJ9rcqDQ5oEYNly8/9j9b98z/yzCR1uxu8dDb8Ya0Fobov
	3XjOk02cmXC1HMBzeWmh35UvRegieZAWw/7Xy5DYNqlUnQOKPOvRcQiLGoz6wmbWt//PU+50AGLY1
	cxhEa4g5eh0HID775ktx2RPzz7uFvwh8SWFNLACNj6EJnafgGw35zEzqXkeTugt5b9UBgugYPMuU7
	384pHjrnmloUX/eKPsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7S-000mO9-Ck; Mon, 21 Nov 2022 22:18:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7P-000mLf-3B
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D981E6149F;
	Mon, 21 Nov 2022 22:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F76AC433C1;
	Mon, 21 Nov 2022 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069101;
	bh=WcD2ybXJSAZYlOtR2LSjGbZlpJ0NRs6W6tIvU9o+TD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jU0WSjjDmijf6hS+mp6F71jPCF9V2rsgIiHK7e7eEJzFY6pf5mkgZnzt3iBR7SgH0
	 fZLka0h+gI4baVfQHNmm87bbR+CU5G7c6jKrQneQUYOWBFXDuxjKbD2qll8G/LIMzq
	 q/Fk2XuETtW6nL8DvNUzmmx8BU1V63mJy/etIqwVR2huOKQ1eyCZxS5U/DgBaGth68
	 fE0il/bW3Ntcmf/bDyuxt+D9Finuwo4ZtpZ4glY1CTpgQeP5T5ilPLfdwJbPE+1H6G
	 kifVQL3CUzHIXSPrws7wczHX08qkIXrSH5EzNz3fHIoeVZhyvm5GDGlTPVweksHQiM
	 +zyPTnQPYuP0g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v1 3/7] RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
Date: Mon, 21 Nov 2022 22:14:11 +0000
Message-Id: <20221121221414.109965-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141823_229992_AD9C6298 
X-CRM114-Status: GOOD (  11.94  )
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

Convert all non user visible use of SOC_FOO symbols to their ARCH_FOO
variants. The canaan DTs are an outlier in that they're gated at the
directory and the file level. Drop the directory level gating while we
are swapping the symbol names over.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Makefile                    |  2 +-
 arch/riscv/boot/dts/Makefile           |  2 +-
 arch/riscv/boot/dts/canaan/Makefile    | 14 +++++++-------
 arch/riscv/boot/dts/microchip/Makefile |  8 ++++----
 arch/riscv/boot/dts/sifive/Makefile    |  4 ++--
 arch/riscv/boot/dts/starfive/Makefile  |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0d13b597cb55..46a520c1273c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -131,7 +131,7 @@ endif
 endif
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 ifeq ($(CONFIG_EFI_ZBOOT),)
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index b0ff5fbabb0c..0c97d673b775 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
 subdir-y += starfive
-subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
+subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
 
diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index befe4eb7527b..520623264c87 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
-dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maixduino.dtb
 
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
+obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 7427a20934f3..259c3c802cab 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
-dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
-dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
-dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
index d90e4eb0ade8..6a5fbd4ed96a 100644
--- a/arch/riscv/boot/dts/sifive/Makefile
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb \
-			    hifive-unmatched-a00.dtb
+dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00.dtb \
+			     hifive-unmatched-a00.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 039c143cba33..7b00a48580ca 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
