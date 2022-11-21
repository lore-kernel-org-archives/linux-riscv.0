Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B04C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtHp5G3BdewSs7vUP1vTgyGrVauQWTJ8ZImjtvxXr7w=; b=c0j2qxwxEcmRTJ
	pudzc+x4cYckIKr1mUw0M68TRWgOEqKgRXd2FOmQMJbl7mcIZbgPRHwam8qXLrBKFaH2dmC4Xf2m+
	AizhOr9nqzOxWJjx5XLGBTjCVKyWaqglEBqzwD8VFQ4bb7J86maHGOM6UwRm8lCvHpFvr4NMmvmiE
	cR4Rts7WUoEYxYA0lHD94ilAEv2DLo1NPazvSkYFJGZwsMGsMG15RfrpBIrAdPVmsMbVSegJ3aVbr
	TjJ8hr8Sjcf/hbRWl99eQbngXHOMAFbLienR+n8MxENkxWOfTzsG326YkMBUSt1z7hlHMlUz1wAlA
	c03WATFKuu6CIohRTDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7c-000mWk-3M; Mon, 21 Nov 2022 22:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7X-000mS0-Jy
	for linux-riscv@bombadil.infradead.org; Mon, 21 Nov 2022 22:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F9dwLVPu6P2oUAzC3l3yTlMOXFBeu92k4vvqcAFvDJo=; b=j+rZKSeQVRT4XoJsb7Df2BFwpt
	OJPCfbSAulk3TeT+7HOJdjhGnwV4xLeGNSkZlR2Ir80inVmf0ao1gWotL0JAO1XyTKDeUZ7XRJc7L
	pAUN2uzqHefl4VVBEnf+ciDa62Yfu5hgzamS23R9j9Ni2XvOKheQFbk9rKYVYLTErA57RwjtSwb5V
	TEs7Xea45uajT6dpjCZELKCa1oXue0+BD59IKOn/CKIPZ/3vo09MH49+1o03LJefHB8CJ2ggOJ+zo
	rZGrQjEvHW4P8BZKkZGVhZGSkXZ9kb/GuI1US1gnHtb6cxNrgl1EivLi+X3Ni3dXBwC47FQTXD4NC
	bhG99pNw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7Q-003EqI-4H
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E73AC614BB;
	Mon, 21 Nov 2022 22:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC3DC433C1;
	Mon, 21 Nov 2022 22:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069096;
	bh=duMxqm14Ap93TJhRSakjhgfdtF7u1Tplr4ZYzrvbSmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oq0EmPaciqO1BTQeRscZHdZxhQDvz6A9bWDqQnYV4Uftj7+zWcokMKiXU5zVKGK6I
	 NZi+krSSRflSboV2oBCkGRrqULTN2SQzc7k4VVL12HJVPzBGjBCqfF7KKxGVoNbpjH
	 8tg1s/fOwsybf22vO9fsJJguc9Cf1bmKX+I/sPThd6BWiHqI2nkCUebzNyLUsfAat0
	 je9dEPJOjQIU4QMNQojmcS6sb8KjwfrWn8xWxLZe0v5eVlFNqs4iciGSlde+ZbcvtV
	 xfA8U9fpHCASsESNaDm8c9TX8QgH8GVU4sXjmVh0vzORTW3Z/WlK0O53kUH0d56Xt5
	 sWmN4HVDEM10A==
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
Subject: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols
Date: Mon, 21 Nov 2022 22:14:09 +0000
Message-Id: <20221121221414.109965-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_221825_633864_CD23993A 
X-CRM114-Status: GOOD (  13.18  )
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

To facilitate a transfer from SOC_FOO to ARCH_FOO, over a release cycle,
introduce some aliases so that drivers etc that use the SOC_FOO symbols
can be converted.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
To me, the most straight-forward conversion looks like so:
- this patch is applied in week 2 of the merge window, to avoid
  any conflicts with the Renesas tree
- all users of the SOC_ variants can be converted over a release cycle
  (or more) & no trees need to merge an immutable branch.
- we convert defconfig etc over after all users are converted
- doing it over at least one release cycle means that `make oldconfig`
  will keep people's configs working as they upgrade
- any new SoC families added uses ARCH_FOO
---
 arch/riscv/Kconfig.socs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 75fb0390d6bd..58cd2304b82d 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,8 @@
 menu "SoC selection"
 
+config ARCH_MICROCHIP_POLARFIRE
+	def_bool SOC_MICROCHIP_POLARFIRE
+
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
@@ -12,6 +15,9 @@ config ARCH_RENESAS
 	help
 	  This enables support for the RISC-V based Renesas SoCs.
 
+config ARCH_SIFIVE
+	def_bool SOC_SIFIVE
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
@@ -23,6 +29,9 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_STARFIVE
+	def_bool SOC_STARFIVE
+
 config SOC_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
@@ -31,6 +40,9 @@ config SOC_STARFIVE
 	help
 	  This enables support for StarFive SoC platform hardware.
 
+config ARCH_VIRT
+	def_bool SOC_VIRT
+	
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
@@ -46,6 +58,9 @@ config SOC_VIRT
 	help
 	  This enables support for QEMU Virt Machine.
 
+config ARCH_CANAAN
+	def_bool SOC_CANAAN
+
 config SOC_CANAAN
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
@@ -62,6 +77,9 @@ config SOC_CANAAN
 
 if SOC_CANAAN
 
+config ARCH_CANAAN_K210_DTB_BUILTIN
+	def_bool SOC_CANAAN_K210_DTB_BUILTIN
+
 config SOC_CANAAN_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Canaan Kendryte K210"
 	depends on SOC_CANAAN
@@ -73,6 +91,9 @@ config SOC_CANAAN_K210_DTB_BUILTIN
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
+config ARCH_CANAAN_K210_DTB_SOURCE
+	def_bool SOC_CANAAN_K210_DTB_SOURCE
+
 config SOC_CANAAN_K210_DTB_SOURCE
 	string "Source file for the Canaan Kendryte K210 builtin DTB"
 	depends on SOC_CANAAN
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
