Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF18DEFCBD5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sLb4PpOMzIXOvqd3fsYGu/vnGcPHRwmokMZFBSamE0=; b=3w2KEUqmmddNPe
	ya7ME4yBj5i8lpT2Rg1fSsXKqXBziQrhcibyVI2CnyGVPfFfQVIu8uKoCAvsZZBAUe9Jjavb2Mf5G
	1gC9zy0yNUbuSLlPpDwiZS5ZSgAg0rzMXflz4Q9Ux/fSD1gzBOyUlzf9gE54q/b7uAGenu86ATLbv
	+VFw9O9bzCfCjknFpwt0ofo33Cao84JzgSV+u4tQbPWobdKbH9mQQ0V0E/4In4ct5XM0usD2+f73j
	oOwi0pf6zGFBofo/wO63Db4n6voU7ke3WrH3EvmNAbuNmsBYmn2Ny+/Ndod1YEDmjZnqtWk0xFx4j
	3TRb+/RQGPOeowgxqhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w224H-00000003SKK-4AY9;
	Mon, 16 Mar 2026 07:08:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w224D-00000003SIN-1piX
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 07:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94157444CA;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664FAC2BC9E;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773644924;
	bh=z8b00Wpe0tqY2sdgNkFnxvoSlPzsj0DJD5o/z1/QSgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sBOthhulWuTQZymZACqDS5N6zBdp+Cokaef4/Gqa23BIQRcaJrnJ99Ga/ojflkraO
	 jGrnkonOKdCxfAuIx/CWSVxT2iK2dIZIkoQHhhbZT9chxsZ0iSiT5grX8rSo9UqT7P
	 Exl8S0L5Fsv1GQrhhw9vjZaE4IIt57lkdxoPIkLOi+/KEOroedfOKi60sENSxuid4k
	 QkgHmPXG65aLuM7ae1TJttDEsgMP9qncKaFZ1uMXonMXDy535ftSH23rSr4tfLULVT
	 unhJTjwjPctp8ZtOKDO4OWfpxEYQtGUyTF/sVLit+Cg/7L1iCOE578p3hqd6ba0gXE
	 BoxBF3Hp+EeFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5538DEFCBBB;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 16 Mar 2026 15:06:57 +0800
Subject: [PATCH 1/4] riscv: add UltraRISC SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-pcie-v1-1-ef2946ede698@ultrarisc.com>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773644922; l=955;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=yTvCixoepaOP7H0g0NOlrwpugZtb4VLtAcECC0j8Mq8=;
 b=1g5NIQahZ7vZ6VjqyuGZB5s/gvegIH0PTVHfuyaBYDlH54vV/CScnL3pV3MVIlvRbTwOEuJA4
 ZPs04vuYuvzDhlUXRSp9XodapVXofPuuHk1D5doYu+D+/fmXQnoX+Nu
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260309 with
 auth_id=682
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_000845_504529_2FCA86C6 
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

The first SoC in the UltraRISC series is UR-DP1000, containing octa
UltraRISC C100 cores.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/Kconfig.socs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63b..f49d3ccaacde 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -84,6 +84,16 @@ config ARCH_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
+config ARCH_ULTRARISC
+	bool "UltraRISC RISC-V SoCs"
+	depends on MMU && !XIP_KERNEL
+	help
+	 This enables support for UltraRISC SoC platform hardware,
+	 including boards based on the UR-DP1000.
+	 UR-DP1000 is an 8-core 64-bit RISC-V SoC that supports
+	 the RV64GCBHX ISA. It supports Hardware Virtualization
+	 and RISC-V RV64 ISA H(v1.0) Extension.
+
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select POWER_RESET

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
