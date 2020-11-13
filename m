Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E732C56202
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFD22078B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZnGy89J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iYV1Or2H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFD22078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X51VZaXjbWN9znaqSMOVTMwkwNIlThCHgfD5RFR8VYY=; b=mZnGy89JxbVqD4UG9Py3Px1u8
	Nm9HsL7fFhkwv/sY1HIBF54Wdkg2GwRlc3HMHwjUpIs9VCbcj8gBBU/CzPZe0buB5GGAmgoa57k7Z
	TaRvmNjcs3JyajYMcV77iR8joiQybeDEMgSORfIPAfnW7eMfrY0WZEAZjnvDD+wLN/rn7QmmkYR17
	lWG9so0yOD5enGGB4nWG4ZHyIXGE2Jx5ZGyBZCwgng2Z1XgRodFs0Jo6mzWWPYdI+MZd+6beuArjm
	aVJmIlfObBUpp2mM/b/SwqQKMDK2JskdkNh4XIpT29ZqF8uMJ7P2ZmHQMGbz12JPsaFudxtZFonA+
	RQsxryj4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdfeP-0004ui-Gp; Fri, 13 Nov 2020 20:26:29 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdfeG-0004rx-M9
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 20:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605299180; x=1636835180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsMTPr1uoiD7uSWtC2NTZsYFHWtaa6TVrHx8UkOU+tQ=;
 b=iYV1Or2H3eI1bvO0qNF2djD0ZYa/lSuYJrxbOo0SCzUTJBPxegvJ3QDC
 JmSM+d5tR/cg3QpNdZlg3qhfvYMV3aYjpxkIjFaomt24hVK3T8uNiSgE7
 zAxtnvAs99KiBV1Wbb1De9JtKAHzGaPwdI8DWt/kFb7Bx5dK+W9+t7pOY
 AMyzOUiqeGi4+KP298g7vfoC7gtbBO9GO3pMuzDHklDPuQj40QUiKkkEx
 4f85PHuv5MsFW5KM0RVNuBQzg1Dp9cY2pn//JdC9t0v5Rl+ddEpraGq93
 tBvvRh197QWWhi0qZL+6F4kBp9Pn9e0/F0NXTW0dyNxS3eefe27bHefCT Q==;
IronPort-SDR: 5DJS+BIG8S5fg24LrpcKmqoGP91katfSXzSQ4HGvbx7bauV9vsveufBZANnKHWcvZSSPMml24o
 x6B5VpxYT6XMvl5Jx5mbYL4pS0xNXExrkXEx0ZtxfGnSuw1mx60suVGVjb3lCwNNWfMz8FhEGQ
 t0U0ibi0gYt2T5wsU388yP3lDN1rU5MrBCaJgMPINrJF5xXEOg/aGQEv1ZE/QPYtNy4l+loGSv
 3MEs+B/tN7aG43sZZ3fC55MY29CNbhVXGmr0S9GuBcrA34FxDq/XcUtwLE95nLVDwvi/SiO9a5
 URM=
X-IronPort-AV: E=Sophos;i="5.77,476,1596470400"; d="scan'208";a="152497381"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 04:26:13 +0800
IronPort-SDR: DZRgZcBHUeVSGii5QR2c43++I3MkTfCyySVw1vAmCnXULK31S+g4bfMRVKTFqqx1L8hgxnbM/z
 BOiuS2E7AVaY1wBVKTGMQi09Ov5Htufzx6YESRiUWOQuSgj8HaaejNqWo1WUmYRrSa+eXsOGrw
 zRWSSRirL24EzjEGVoi+cptwEI/Oz4dreNWse3TLQhYvOmj2zH4ncZ2Ksiwdhn/i1ZuuHHEELX
 PWVtAmIsrntIK3UNFAnyZh94w2JuPX2ZlHt0wGjdUkZpIsSq4DVQyV5iamMChEid1LBhhN035M
 1/j5rawt0PNnUd18q8Dnpbz2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 12:12:10 -0800
IronPort-SDR: WQtXQjI1u1jqJXD6Sv1H4OJIG4os8y8WaQHEm7RJBJw5K/R+zHrdF8qQ5qhz0MN4Eqf+Nd+vqt
 U7tBX+9yA1foRDd/yjWD6+kDltN7U51VEH7wTi+mihaH4h+RIfsXuwbCsYLaKPQNHNRfoQw8MG
 H2JCuKF+xxvUzzkwCJYl2S/39SzQZkIuis28Bx6w4+yC65F2RW7h/9i/FahuhZ60j8YPR8PPcQ
 Q9iOi3UF4q1mjsTX4GMrbGdK8vRwKOIQPb66bXJFjwqdDFjU6iq3bJhxWeClKT7z8Xe8+cfw/o
 wQ0=
WDCIronportException: Internal
Received: from usa003372.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2020 12:26:14 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/4] RISC-V: Enable Microchip PolarFire ICICLE SoC
Date: Fri, 13 Nov 2020 12:25:50 -0800
Message-Id: <20201113202550.3693323-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113202550.3693323-1-atish.patra@wdc.com>
References: <20201113202550.3693323-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_152621_267725_F73AE9B6 
X-CRM114-Status: GOOD (  10.07  )
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
