Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB48C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E2664EDB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E2664EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=je2+fUXofyHsO/+vvh0KGv/RRT7XbTEykT0503XY7G8=; b=IEPVzYuO8MB17TbBKmfe/1EWt
	YwtMneqqHlj7qgvvl8K+WAsf1Yzw9EFMXNJ1ZFlW9v8tpmx+cRptn1+dGbTIcJaxIHuilinmjQI+8
	4QfOWHQxsYdbfaaCchW8W0K6us+eIdhcI5AP2p369kWYKdK7o4++i57vusSw3QypwR+q8Ak/oaa2v
	jizLOjETNFSMFClN7/aVApGI0p/vb0F87i0d8tSUl8/Cj22ocG1ITTj6xouP+H/3vyKFPp1kUdrpp
	CzC9PTYEWG0dcssxdbGFGKhmwClUmiwzVaqTdK9fqGIn8jCnqzPjOKA1RdJ4N82SP5Ewol+u/gt5S
	mGKFV5clA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcEs-007FDq-Jx; Thu, 04 Mar 2021 00:53:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmx-006MJI-Nf
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AHV+fuTLPqrZ6GGsHTxSl+8AWW6r3NFcTuvgyzIPaKo=; b=vs8bO9mes8ZbBadoDbLBW/QLCp
 SqoN3tgfUTtQVhHlUk4xlBgsaPjuhq5Dv+RgGKl7WNcdJ3hB/X6ef+CQUmcPCxgfhviwo9VfssbCl
 ap6wbWVcy9orMDvtqCaCnQdwBqGT1SOr1DGKLV5o+2ZeD0kXKYJzyX7BnWnuxRWEArQiUCcX0yLOg
 8iK+aQfL4IRuOuTR8bFgljKGk30ryIOOimFYzaDzrub6lNmiJMuAvs6Jk0Egsk2iiACY2M13NemBe
 kaWvxc/SvFAYyV/4aJ9VUIwMsZTc8h+/f/1eMJOHmVJgJpZ9vKcwD56zyacIVyli1Te2S6bbqSph0
 4uzQu/Vw==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmo-0041JM-9l
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802078; x=1646338078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbkB+pidnFlT+lkjs/WTIQAzRmvF8TaNvXIHT9jYWmo=;
 b=TUVc/ysIpMp0M17X4a5SLCjuZxnu9917k+7SNUvk6xwQwzE2zAU6ktzP
 3p3e2YYI64d5O5o8VHKz3vCqd4RRXrY/jVrKPCUMwwdoNQsiXs7OnxuVQ
 mxp8ZodOA3TBDCtZfKT1UbnxddGc1HqtOnwWodclUJ9OMoKzFqn8q97Hu
 ofs9WMQQQ9PJquuxGcKGovJi+KAzmN/eYTwumwHw/Gw7GfCNLFmsKeHHZ
 ABH0SfdWz610rZCQe6teJO1nIJgDXMKVxfqT7kE29LTtU0uQScrRBh8kq
 Ij8HcUyDcMw7aAAJoE8lxk8EYKtkf9WFYtv9E7gUcB0gmrgO+wD5iNJg+ A==;
IronPort-SDR: G93NAq/wNaoomTILDdv5P/K7XXZr+XZmxFHqRGsj9htKEtJOtdV3jBNG9WLuBHNsiXjNCLXQiq
 btC5vIppF2YBIVDMnlrTgLVjZexGSZ3TacSStL8YyeA4hJIeIF+ryVJpmhTp3U6ZSpDwjKbJyA
 IGT/fYPDE+la+yjAsKrQLICiBRpfOT9c1L/2Uq/JG8rVCxZFPqT1CP3NnyjGBvAfELDa2XKCgS
 RWagqm8cL5Wjt4vdGVtvRCvLXBUEYJSRRVjV18Q9ngq+fSDnVTdYT0ZuFkolSfmzvLXXg0yQnC
 tN4=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907154"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:06:59 +0800
IronPort-SDR: nDS6606v2ZM3FRBGVoEu3c+51yuP3GZUWjzPDSlGcdJFXya52V+zCaBfaUV7duOluhoI4XJGPi
 g8BApskVMCWs3e57vna7nUQJZ1qvJJlT+H4M0pj9PKygHpli+5w5omSQr8hFBODl/V75tO5YNu
 Xhcf6x2LuRVv8cRJtAL/8nji4H+D4WGcxkw0PSaBRukyGDHYkT48FYcwcttZ8lH3RzhfmfqJOS
 ELbaerFjYE23lO6FgLgIoxsQeJTyG3+nGHLnQexZRp2x2ln3gGPbHBCRPtiVW74s6SY7VH3DJ6
 iDQszleip2eDmFOx2KWuQUDQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:13 -0800
IronPort-SDR: 4MXPqalwVpAnMLzVq/qqbDyC/BDbt7t44EQFJFZNWY5qeccrK+Jz6B3ZGMt74YPkgFGnbfsRba
 Sb7iv5frJlYiIU9mHlKhU130l8yJMFHRzkzKATZJhoiHLRxkVqxDKS+Ajn3ZMjriZ/rdgckjHW
 g7Js5kJXiKYJSCzL7RfTXbXEXdgjbu/gWjd2pX6WXTFwYqIJgIvpPvyTPGHlWcy2fIVdcd2Gcc
 1NFtk42f+5eWm4UDshdiBjFaSH+i2sVfAH/O0HuRaJmLRS8rgGs0t9aL9hvyAguNRVgSBjn/kY
 eF8=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:06:59 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 4/5] RISC-V: Enable Microchip PolarFire ICICLE SoC
Date: Wed,  3 Mar 2021 12:02:52 -0800
Message-Id: <20210303200253.1827553-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200800_751204_C14E1776 
X-CRM114-Status: UNSURE (   7.78  )
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

Enable Microchip PolarFire ICICLE soc config in defconfig.
It allows the default upstream kernel to boot on PolarFire ICICLE board.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 6c0625aa96c7..1f2be234b11c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -16,6 +16,7 @@ CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
+CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_JUMP_LABEL=y
@@ -82,6 +83,9 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_MMC_SDHCI=y
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
