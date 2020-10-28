Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CD9C55179
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594D9207BC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tx6XNOMX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AecRE7GL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 594D9207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pa5HMRni6nLBvBDf2s5qjSFxkDsMMTlyyMMIRyU1TBM=; b=Tx6XNOMXYurt5bPzXvgREBPLA
	qYveOM18HDU64lrH5XJQzkzWWhWU56ie9yMQkJzbLfV+MUjjIPGLKc9O7onTAuev85BA7DsMlmJmV
	V51+zly+5NgrT4ep1kWQlw4nMq2ApjAG9+P4IpIbrT+LkHNmQb5jl0AU9S8VSlceUWN26+GQJIXhZ
	iOS08N3Z9PiwAiwx0CdoR1CDa1KPxldjSbeNmz+U9/PL66qSMJx+WKRTQjCV0VO/tedita5ex7gqa
	nPvc16f5hm4MlWWvYaOfYvymPMLtxHaELs3xoEvnNNpZ2P0e2zQvBoODIW/5E033zQna4OqF37bnE
	EbwHhH7ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXurV-0002ri-80; Wed, 28 Oct 2020 23:28:13 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXurS-0002q3-4W
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 23:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603927690; x=1635463690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJAk/HlCEdByWU/6opUy/B9SIlWfZOpnQb53UvC9we8=;
 b=AecRE7GLTw+hk5CqAmxJGG5t4PQpIqAm0M20/ixHiKAFg5OMSGpjN4A4
 HGzfbzfXaiiMPCCGdZNDwrDB27UEUFwf0uzFU09bD9XxjUpWKdGiNUcPz
 +zx15TIsSc9sGKdL+xWj8OhORg6Ml7jIQ8AZfWmIWAb5onKMqmaqSd/qH
 Q9mdlj9flrrE0hAu5TTSWOoZxLS60WAHrswfPg8L4ZR5eqdWvcWDBc9Hb
 ZXUELuuxmy2J0p6P6Ry3fi2N2XPbEWa0Ku9jkAfxv9ruXGDy6zKM4tpwE
 b0E0MlXRWqKmk6NQIkZh53SD4SmfSJtlJOXreZkXiAZTA+bDGLUEMWOvf Q==;
IronPort-SDR: 2a4rfZ+5Tr08/x6DTKIvWG7BqFd1F8z8Qau0eN1uuVx4Yxx7xVwuOvEYRaJnCy5XHKnGOwL6pN
 2xZoyVe7VfL+umJwp9pq8ct15HGkf5y0UE83Q4sBFeYoE3+t9Id2dNQdKxQAQCtgU/evqi8Vhm
 sV1z7FQwazzu/0yJ49xQ9/6IpQsiip6pYyyxWui/BoyEflYmO4KYPUUG00XxfA9Cam3Vvpt0or
 hveAGmsf95nBTswhcZYiey7pssMtG9baW+YOD5M/UAPuNyH+3rMJP+hyYFRCLGz3frUz4aLckq
 vjE=
X-IronPort-AV: E=Sophos;i="5.77,428,1596470400"; d="scan'208";a="152388621"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 07:28:08 +0800
IronPort-SDR: 7wq8s1+kCPSkoYuIk9m4vWS5l6L6eHKJ7glzEWDnlMA9xbSfh02hfBCozLSr1NxgXpQ6PMZg8b
 Ssait8zFPxJvp+amMWHYF6nF67QAGVCOpmQ2AcYgj5+bW50XUYaUNwOG5Mqijd3T5lkLMqQ1DG
 Z2ip72BAgNOA1TyGvekkL9QX4LdKdf30MrlxLksq3q489nUiIOCtuPAJG8ULgw5KVMBl2Mme7r
 gSiMt6+JuAVfOhTSP8IFBg1yiqa4dTz4WS7o0++k/H13qq0nRlhaDRcIf/PwK5MDvxW+O0+OTz
 gN3oLszQECOETJAI14nksnhM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 16:13:16 -0700
IronPort-SDR: 94lWjA8ui21z5dRyHN8PFZLWc4UbJh3udYMvZwY9leNLlEB8hUj+d1Z/jiMQcWUW7nsSihk7lE
 De3GYYbvK3lkjiMk/0VstuQyyR07X7e7Nu4hoRn9agFLCYiKJt4QQ50Tdh80eMih/LGBigp8M0
 YF4Oro9CD5i31jZTZiMSllyoN6XzPvseyy2jZQK0GjkEhFzFJ6aj0z5kIPRf8wtwUdctUo7UdD
 gKiq4jBVFuM6YFUEVh5FVbmmXhPISPJ9c5N8NAgSnNMt2dHBWCDeA5nRnyKMt6UNmLAA7y793f
 8fc=
WDCIronportException: Internal
Received: from myd002180.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Oct 2020 16:28:08 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] RISC-V: Enable Microchip PolarFire ICICLE SoC
Date: Wed, 28 Oct 2020 16:27:59 -0700
Message-Id: <20201028232759.1928479-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028232759.1928479-1-atish.patra@wdc.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_192810_316478_447E9D80 
X-CRM114-Status: GOOD (  11.71  )
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

Enable Microchip PolarFire ICICLE soc config in defconfig.
It allows the default upstream kernel to boot on PolarFire ICICLE board.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
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
