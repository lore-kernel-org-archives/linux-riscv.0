Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC45DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxlHhFYMNxphek0ybD+vdz2sIVnt77OuJB59pL4CL4E=; b=V4HNUb9dDJRQNP
	PIYyVpzhdtZYwsZBVgTVi42wel5xwviOBSDy4L1ZsdpE+LJhAP2kTBoAG0aWEWHzYo4kCrjBqVhaO
	TSQmt215eXIhOFDaaW4EHgbubF0ou7ivGXTdPLbE+PwFI2rIR7bWmK8G+ubVnUBhr59hgPfmAm7vJ
	5bVqImOWx4Hz216ofw1po4CVp+KfPl+E7NTUHlx96WS4uSEpO2mFc91DTvL3BlTFkFsKJDu6Nc6QZ
	TiUHnxviqoxT2yLeE3ahOfW0hR48vWpUzMGQGXUH7en10WBtWfgXciYAo90rynNF5eXkm61Zxjn8v
	8uf8tHZGH6v9Ft17yb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm2En-0085Qb-QC; Tue, 03 May 2022 23:47:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm2El-0085Pq-2v
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:47:24 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm2Ea-0004eV-To; Wed, 04 May 2022 01:47:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 5/8] riscv: dts: microchip: make the fabric dtsi board
 specific
Date: Wed, 04 May 2022 01:47:12 +0200
Message-ID: <1892011.PYKUYFuaPT@phil>
In-Reply-To: <20220501192557.2631936-6-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-6-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_164723_179557_88552CA9 
X-CRM114-Status: GOOD (  19.54  )
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

Am Sonntag, 1. Mai 2022, 21:25:56 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Currently mpfs-fabric.dtsi is included by mpfs.dtsi - which is fine
> currently since there is only one board with this SoC upstream.
> 
> However if another board was added, it would include the fabric contents
> of the Icicle Kit's reference design. To avoid this, rename
> mpfs-fabric.dtsi to mpfs-icicle-kit-fabric.dtsi & include it in the dts
> rather than mpfs.dtsi.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} | 2 ++
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts               | 1 +
>  arch/riscv/boot/dts/microchip/mpfs.dtsi                         | 1 -
>  3 files changed, 3 insertions(+), 1 deletion(-)
>  rename arch/riscv/boot/dts/microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> similarity index 91%
> rename from arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index ccaac3371cf9..0d28858b83f2 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -2,6 +2,8 @@
>  /* Copyright (c) 2020-2021 Microchip Technology Inc */
>  
>  / {
> +	compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
> +

I don't really understand the meaning of the added compatible yet.
It will get overridden by the compatible in the dts and also the
fabric dtsi for the polarberry does not contain a similar thing.


>  	core_pwm0: pwm@41000000 {
>  		compatible = "microchip,corepwm-rtl-v4";
>  		reg = <0x0 0x41000000 0x0 0xF0>;
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 84b0015dfd47..739dfa52bed1 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -4,6 +4,7 @@
>  /dts-v1/;
>  
>  #include "mpfs.dtsi"
> +#include "mpfs-icicle-kit-fabric.dtsi"
>  
>  /* Clock frequency (in Hz) of the rtcclk */
>  #define RTCCLK_FREQ		1000000
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index cc3386068c2d..695c4e2807f5 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -3,7 +3,6 @@
>  
>  /dts-v1/;
>  #include "dt-bindings/clock/microchip,mpfs-clock.h"
> -#include "mpfs-fabric.dtsi"
>  
>  / {
>  	#address-cells = <2>;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
