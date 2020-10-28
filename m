Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C29C388F7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5191A20796
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpbkHbzG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cAZGQT9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5191A20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EB9ZEjRSr6dHC0fHoBA4Rt3JbGnEtd8xR/+pPIgK/nc=; b=mpbkHbzGmxVYGfAziNX8yxnYo
	dG478XNISNuUdhWICwdfMCD526/Wnr5x/MnANs4wnVjPC+pyF+lhvEshsItcolCiAOmp3snceCVJG
	EkoCjRfbWbrPDO0zaDDNwuxhuCkgkGakCi+Z/pnhjfKx4V4aqqUsjCFdzpiwjGtRjYfA14MGYhBTF
	x3JbwX50duZsnt4sAuqOZEPDajosrzxNR+sdCsiFfrmWQK/jdnGe7cBxcduo0xIOeUBFK8P8rV6xv
	8xYyo4TBTAdQvccMWDAXA0Bzj5jTdSx36h1M8FfPH8M0DU0Fvdmy8pJJIYaAA8jM7I9HnPMOUntIo
	xfdB9m1uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXurU-0002rN-11; Wed, 28 Oct 2020 23:28:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXurQ-0002q9-Sz
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 23:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603927689; x=1635463689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6n2d3Nw4+/BvSQCZVekBcYAwmYCImlxAQwh3nDgopHc=;
 b=cAZGQT9iEkovIWeipEL3qCU/eBeiN91Lmj1B2/G2e52p2LFvR/mf3DS5
 2xpOVuu+fAlxNeqnJBvOVU+iqwNw/sHHwq7mXpPTBVJ4qC4gliA+VidIc
 x3tePNq+LAXvhVSQcwWLnlCnChjL1O9GqOXmoDFlPMg1AbwOEExESqRDt
 f/OYtu41OKuQLmaFSFxwmqYrVAYzcsNMiMFJx4CBn+XnRPyBh/yX1EZ4F
 x2h4agn6OABSLPj9PgXaI3CekV275iVG4IzO4CQU9hG+JukBGG13alT9b
 BTUXnLjIMbI83+C/1KrHP5p8YIsfhIYUqq+dQRId2cSMd9FDCengFAyt5 w==;
IronPort-SDR: szAfHuMsFJ3P5wGeX81Q8hjhOF9Asa3KORp0FwApWXRipiyrozHREN40Ub7SD1BAnTHbi/j0C6
 mY2cAWDQiRydlfgHReQrJyKYIdcdKHR7spFP5/vdt7UIZuh7mCGx6ya7ut2o5SMbaUki27jmBI
 MrMq+5D6nfAp8vL7nO9iD+2RRK5z5EUTsRUf5MmNMYi+GOLdKV/Wdp6BxdDshMKQeMaTxxUf+H
 qx55UST9XeQJyLt+1ocNIsLfSk7k8Q9Mdgi39aPxPmE3vUe97qJLTXytuotOg0RhWa4QipUIz6
 2Nk=
X-IronPort-AV: E=Sophos;i="5.77,428,1596470400"; d="scan'208";a="152388618"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 07:28:07 +0800
IronPort-SDR: MeIjZgaDkw1twKjb8aOioUnLLOPjYYI8f+G/bejEat3QSu5XSrncUigllPmmCdchy54j5SZ1o2
 3A1gG7Her3g+3JS3AnHhGAioRVtjcLPuusbrD4MI0Ar3V8xqMv8317AjlNvbAGP6N9vjMm1XFR
 SCTp02zlWIGfjmUk5lj+Rfbd9YOnG6PRevcQgPAtNdaQm3Xo8za1FxxB7frqyl/mZjcdf65lpx
 0UHd3yePtZMcswJIfCHSXYhRnmxWTaVspHWLIJWnfXOfRChX+zW1fN1eoxwfeYMRw2j6iBARcy
 VvpEOvrYUSMyRaX84TSiyeot
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 16:13:15 -0700
IronPort-SDR: dEjHin5uDaUncBBDKai1yiEDYvkh/5xbx9tbjqOIIhUNxWR9COUDwsaTbfD8OhLCHXAKBaH8sO
 JRl/JzxvEXUrLoKVtX0dihBQAcbnboJDogsemdy1o8lwaB7zYsw2Km4OpwbeHRFcpx7AeO83lt
 g3UI16nVWp3Ux4rzKEYXSD5NKtfbJD1AUT3Qh0a3pAs4kQggbMpqlb/nv42qU2VUGP+rmgyGjA
 6eQj7oGORrPbysgCtZOcbPDzR0utnwrJpjKg6+DDH+Wlu1pzyltYsnMrkCMFCRqtKbZydeseKA
 PNg=
WDCIronportException: Internal
Received: from myd002180.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Oct 2020 16:28:07 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] RISC-V: Add Microchip PolarFire SoC kconfig option
Date: Wed, 28 Oct 2020 16:27:57 -0700
Message-Id: <20201028232759.1928479-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028232759.1928479-1-atish.patra@wdc.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_192809_055399_C836383F 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, padmarao.begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Microchip PolarFire kconfig option which selects SoC specific
and common drivers that is required for this SoC.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..74d07250ecc5 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,13 @@ config SOC_VIRT
 	help
 	  This enables support for QEMU Virt Machine.
 
+config SOC_MICROCHIP_POLARFIRE
+	bool "Microchip PolarFire SoCs"
+	select MCHP_CLK_PFSOC
+	select SIFIVE_PLIC
+	help
+	  This enables support for Microchip PolarFire SoC platforms.
+
 config SOC_KENDRYTE
 	bool "Kendryte K210 SoC"
 	depends on !MMU
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
