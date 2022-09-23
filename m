Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C788C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq0WsMePkvOFSDXS3otKvuT/xFrjedTa9xwN2lptA50=; b=fyL/FkBWJziJie
	OZshg/7jY1Jywf88cdQfLoAdptUPZmJltkuCA+7cYxhD62CPzhG7oPUdnB0pgWQE2UhewAzTBNeH8
	WbvDL8fwZmSVTqUNQ8PDBi5WiFYKYLxZ5wT1Vu2mqTIwJfWGqQBJC7k+TjkcmQvHzWytNTEarD0D/
	nCDz+r5iIjnAyPEn8j4KzlLEqvIzLLs40n/+EwSW9XU3n7uh2pc8K0xGhzVJKAtp+AB9fThKPPfxB
	s+9+OxeKWUkc8VgV9OP0/MmLQtoM6FuCKhFs3/uKPww9IpmzPuIm9J/UQNRBArh6/C86ZiOsofZ0N
	rgP5h1D8Ja2mfo+aa6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsh-005RUg-TQ; Fri, 23 Sep 2022 18:58:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns3-005QrJ-QI
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64B02B819FE;
	Fri, 23 Sep 2022 18:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E48C433B5;
	Fri, 23 Sep 2022 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959473;
	bh=TfCNYdBdPbiW1QyZ/lJWrcYHBDNZY0b1uJJ8XoTOIeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYQrJfbxvYgBnECWzd3qGnK0rIbEn4qr2gw5XwYx3YsM1F25KRVIGzlepNZqmI4F2
	 7gmGOmPSiX7k3VZqztXnPmswYCWh4dGVQTVMRRkMZw9USvanTIyFrQr+nAKXThSvLV
	 1f9ahdZslVSJNj9y0ULV/9Jbshd2QI2wUO2p++cVRwYTaB82zhKKMM5b81VGM34hW/
	 LhvgKR8K+zZXY/97ghwsstEWzIKqsjM08FTba35v/R/xhqWXso79QC+T5CFwFfjjjP
	 wQLQ33CVhIeCEmY4U4FbJmFBnXhwy9Eyh/fq6tE1tmapIEqbeLQhvnzkaQPjUGVZgm
	 QKJ+bE3pecvqg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 20/27] wireguard: selftests: swap SOC_VIRT for ARCH_VIRT on riscv
Date: Fri, 23 Sep 2022 19:55:59 +0100
Message-Id: <20220923185605.1900083-21-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115756_034178_7DB609AA 
X-CRM114-Status: GOOD (  10.68  )
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

At LPC we decided to convert all of the SOC_ symbols in arch/riscv to
ARCH_ for consistency between "incumbent" vendors and those with a
legacy from other architectures. To that end, swap SOC_VIRT for
ARCH_VIRT.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 tools/testing/selftests/wireguard/qemu/arch/riscv32.config | 2 +-
 tools/testing/selftests/wireguard/qemu/arch/riscv64.config | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
index 2fc36efb166d..2500eaa9b469 100644
--- a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
+++ b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
@@ -2,7 +2,7 @@ CONFIG_NONPORTABLE=y
 CONFIG_ARCH_RV32I=y
 CONFIG_MMU=y
 CONFIG_FPU=y
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
index dc266f3b1915..29a67ac67766 100644
--- a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
+++ b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
@@ -1,7 +1,7 @@
 CONFIG_ARCH_RV64I=y
 CONFIG_MMU=y
 CONFIG_FPU=y
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
