Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD67C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 22:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGiLvrCCpiKaog0AgRrCyP32pDr/pzeYu1CF8zUzY2g=; b=3/2PFJORZtdZaD
	6gd2t1x9wpz672F4J4hI3ujq13CB7fSsIobFBnr4Cg8uyEkaHgN54ONhUJqyzzJyRdQ/DsXcseafq
	VxI3jRhpWeYWG7n3C7m/ZMSS5+v/eLC926aEPvoAvfIuYLl82B3hvjjFEp6P3ZVniRBUxhOPoRXz3
	W4uB4CPjL67OVIqqadgQ56wPexMT6QdCs+IVcAe1QHSXuqWubWtpztjPXKbSRsOvb1JXJCmeZ1wYY
	lb5zk8ycI1UWOJGyIH3NPGlaPHMk2hAhf27Z5Lu1ZjS1IoDdRO4ujTRou2l84yuOY6SGCDxAJ6DD+
	tzT71ZgPaGqu7KU/Up+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4R4-00FP3I-Tk; Tue, 15 Nov 2022 22:29:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4R2-00FP2p-KI
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 22:29:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14A8E61A44;
	Tue, 15 Nov 2022 22:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2875C433D6;
	Tue, 15 Nov 2022 22:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668551379;
	bh=5RTPqbqRHo17DhuTc7evD4YG3pNYusiYUpf6yFn71Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAlCAat6PiIT8BfzXkVnLtXkgTT9/M6YrwN+0+km30efTdPdnaGrliKPnN0RomA61
	 6NXgBR4pb2GZprFVGudycwIM8R0mh3mLUtEv4eVBwGaUMrVJy6xwsiE46FHwKQ4GgE
	 1Lq7t6YSOFPkhCLELvSuQ4y3wXuYEvRc2Q1Q3sk5y7ESy7Bjv0ni/4OTBGAjnpjU2C
	 EhVEEpgzX4zF5iZh9NrKysV7Sk0eX0hdVn52TAgGr5YSc7JEP5542l6jmta69gfyIw
	 jKN/HHNerlPyp0px0Bx9pUZFZQaCK6OzgNoeJ1LGyjABRKYUhdYbIFuUQqSKd/3/Zg
	 7StinEPGyWvow==
Date: Tue, 15 Nov 2022 22:29:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, palmer@dabbelt.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 8/9] RISC-V: Select APLIC and IMSIC drivers for QEMU virt
 machine
Message-ID: <Y3QSzkvV/4UvR1ME@spud>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111044207.1478350-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_142940_724830_80F1819C 
X-CRM114-Status: GOOD (  20.11  )
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

Hey Anup,

On Fri, Nov 11, 2022 at 10:12:06AM +0530, Anup Patel wrote:
> The QEMU virt machine supports APLIC and IMSIC emulation so let's
> select APLIC and IMSIC drivers from SOC_VIRT kconfig option.

I'm kinda torn with this as I've been trying to get rid of the selects
from the file in the first place. As Maz seems to have decided that the
SiFive plic driver is really the RISC-V plic driver - is there a reason
not to either:
- select the sifive plic at an arch level, or
- put a "default RISCV" type thing in the driver entry?

Similarly here, should we default the APLIC and IMSIC drivers to enabled
for RISCV rather than using selects?

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/Kconfig.socs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..c16b32eeadff 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -35,6 +35,8 @@ config SOC_VIRT
>  	select GOLDFISH
>  	select RTC_DRV_GOLDFISH if RTC_CLASS
>  	select SIFIVE_PLIC
> +	select RISCV_APLIC
> +	select RISCV_IMSIC
>  	select PM_GENERIC_DOMAINS if PM
>  	select PM_GENERIC_DOMAINS_OF if PM && OF
>  	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
