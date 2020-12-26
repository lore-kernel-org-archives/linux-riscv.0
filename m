Return-Path: <SRS0=KIN4=F6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C8EC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Dec 2020 00:38:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521CE221FE
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Dec 2020 00:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 521CE221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MovJNkYIe+to0I8TyNgj/EbNKIy5MGTPcH1CHJg3FOU=; b=W7bF0TUno5Y+LM+ZPyXVmGiZ/
	sHh1HTyMIDUIrCyME7KfR0Q2GUKy4Fkt0h5g0E5KaNuC956SGD/X7AfA9VYceXEwk15w9W/cahl8D
	RhqGm3wCtCrqAHr8nGcLiuSl/8nWb8oapjbSnXUd7ZgbpfWqD4vACOLl7jPaGKckR2EjPgpuYxBje
	NUMqMs0F+TCXK1u4Za8rJNIrVZJfCt3JL/acNHkIvY6mqb46nMvyB13ARHqbr9jQEX8KrvRTkeDfT
	VDA2p4o1saFtur+Co4dt4XND8xLcw6gFh7B5BOROVhzqc0HKvouZ2J5wdVl/A0jqWRgCSUw/fAf2o
	+Q00iN5UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksxbJ-0005BG-1t; Sat, 26 Dec 2020 00:38:29 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksxbG-0005Ao-2W
 for linux-riscv@lists.infradead.org; Sat, 26 Dec 2020 00:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=HDKYwVqxnSO78kPzjriOKumvWEUA5kK6eRl+PUX8PiE=; b=hS/KU5KpmpzH2Xmp6NEWhFaiWN
 1tieLCIUKXYFRBYtMzRNeKDUgbGObRAuA61rC6FabjpQJhZvqL9ZNkgdwOXNRuJeAT0O89krXeVqi
 gXcz8OZPkv9g0r6/0MzZ90z3doQXeJy5DWX+WlRU8jl05X94wbs/C8Gh4Wvy0+T1J98+Pui4LwW1q
 AhxDG8Sst7oVcQxuOiijAMaECg0IuS8Y2LO0hTEseOR8cw/3kBxsZtYff0I15/ZNxOThoONWLvFk5
 cx/fB7R5Z1aiEDSgSRUarrZBETNGfmrY/CluO8NVYAnKSZxkQwWE60ASEQR9NmPMLd1wQsFZqGa3A
 /n1VkOJg==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1ksxan-0007CO-0F; Sat, 26 Dec 2020 01:37:57 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1ksxal-001F6s-09; Sat, 26 Dec 2020 01:37:55 +0100
Date: Sat, 26 Dec 2020 01:37:54 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 4/5] RISC-V: Enable Microchip PolarFire ICICLE SoC
Message-ID: <X+aF4q8RyayzTNk3@aurel32.net>
Mail-Followup-To: Atish Patra <atish.patra@wdc.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bin Meng <bin.meng@windriver.com>, Cyril.Jean@microchip.com,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Conor.Dooley@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Ivan.Griffin@microchip.com, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-5-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204085835.2406541-5-atish.patra@wdc.com>
User-Agent: Mutt/2.0.2 (2020-11-20)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_193826_251169_C70776DF 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-12-04 00:58, Atish Patra wrote:
> Enable Microchip PolarFire ICICLE soc config in defconfig.
> It allows the default upstream kernel to boot on PolarFire ICICLE board.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d222d353d86d..2660fa05451e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -16,6 +16,7 @@ CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
> @@ -79,6 +80,9 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_SDHCI=y

I guess this should be CONFIG_MMC_SDHCI=y

> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y

Regards,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
