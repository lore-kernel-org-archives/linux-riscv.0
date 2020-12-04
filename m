Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBFFC4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F04222B6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F04222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X51VZaXjbWN9znaqSMOVTMwkwNIlThCHgfD5RFR8VYY=; b=Nb5ZfQCqqCzugmZol2QX3zwlb
	xnKCVfu+ITjPQQL8dbEca26+fj4Zs2zoPdfB/fxeu4nal+Xc3twpF49btemtOmuLi1KuSx57M1FAd
	ZC2UrGFUlfbcUhOyKCke5FfeVhiiyR9orzAmoY59J1rysZbE8GqZaQElMtJla2jeWhmrERpntZFWU
	OpNx3oQRij2hitcPZqesKbAsj6431Dx8JRTkIr0F4CbVKfCrIcDCXo20dB29zNUgqAZihdJS/Z1RS
	fNWznpEHKKhEAplIF8hPadE+QRu3xsQlCKmpfleO/lvGhNE0MeI+zS56+l2ZtCPFCYklcwFFr/m5T
	Dv5d9+o1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6vX-0002il-UJ; Fri, 04 Dec 2020 08:58:55 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6vM-0002d2-4L
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607073490; x=1638609490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsMTPr1uoiD7uSWtC2NTZsYFHWtaa6TVrHx8UkOU+tQ=;
 b=cxMBIvwKbuozfV7Rlqf4MU1dGdLqv9cQQpC4chrJUQffUomTpV831W7K
 hg+rS9APk8s8ekViqQYmw19MubW2pOjlMRcpJuM7R7vt2OhI2W0rB+clr
 +ddMPsHcmTi9jWSvYx+HR8OKxXFYPGhkWJ5YG9W0nfW3aJiSEaZ8hFEsX
 rZmgawtuyvy9E8HFGJ6i+L8jl4wHKcKLetrXEvbzx+cy2q0IAJ/SpVgft
 M1xXcG9NZqblB4W750iGIWiaIBXmknz89NbAOwIpaJWyh76qsimjPA/8Z
 zXtjQBvgWWOnHfIzEaElisA0+p08ds+Ch+ENfoWRuJ9fm2tMoi43+a+Bj g==;
IronPort-SDR: F1oDDKMCXGSdkSBKm4ycksKXNp/b1JDZ6fBDaaIe+Z3XD9CkGoza7w3/jBcParYuxx0Y1Yh59W
 yyaiSm+Nz1eV3sGMF2tLKmvGMEczRJF3KnzFOUydRTTxnq0GXeYFtQI47v7CpKL1F7z5YCPPrg
 6fTkEwlPU1VJ7WjfTwvphvOHfsoi+6kl5S74qQh/8hJ6QGIrtj0bSvqgTmFNNxqjmhlDZHv68w
 r6Fk/CdngCLfWxyDqDsUZkVvEKSOM49u31vuWbFF6EcetDoN4+8DeEIyxZhHTYc1SEbfXvbVwU
 DWo=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="258129850"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 17:18:06 +0800
IronPort-SDR: VrESfi0IxD1ZJSNloAwBC8Uj4b+fs6iwm4SZzBo6Ot1bsp0DogZeX6PWQKY/5HMZkYPuJ/qj4Y
 l74YoktShGHlSHg9SjXJcKDqcqBfBtuDI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 00:44:13 -0800
IronPort-SDR: 7ysOSLT+8jkn51QPqEzKKgtz0AeLVWlVMGXCuxxhMB1Z+4wuxgbJg8cu77hJ9lHVZjvX5dciqi
 264C+b/g3SUQ==
WDCIronportException: Internal
Received: from cnf010505.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.200])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 00:58:41 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] RISC-V: Enable Microchip PolarFire ICICLE SoC
Date: Fri,  4 Dec 2020 00:58:34 -0800
Message-Id: <20201204085835.2406541-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204085835.2406541-1-atish.patra@wdc.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035844_368006_FDECE8CB 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Bin Meng <bin.meng@windriver.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Conor.Dooley@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable Microchip PolarFire ICICLE soc config in defconfig.
It allows the default upstream kernel to boot on PolarFire ICICLE board.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d222d353d86d..2660fa05451e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -16,6 +16,7 @@ CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
+CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
@@ -79,6 +80,9 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
