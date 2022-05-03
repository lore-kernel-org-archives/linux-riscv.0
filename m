Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CE0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OK9RRYOI6J9UtZ2jOWeVvfUx2RUOsq0zcEyWrSkC2w=; b=kUN9TbxI8NRYJP
	RQfh5lh8g0bxMlBwFoOpF5Bd8vn+QvIIZdw4zhzjgnPyZ8FNxWSVa1SCCYYx1OP0PvmdcVQH5TwWi
	KEpEZDYzVsUKd2CkGLH2T2cZ9jQeiiXKlybxGFU48NkNjOHUe1xctfOvGIZ0FYgBz6SL1RjF/4QxP
	ue5yI9oj8VbEdkmecTJ/jqnWEFzPRt9sJvhbVR1CZMsRbO9uMw7ejF5ksmDgjK/MDsXZzEsJizrxr
	OO5itGEr1QCHIFCRcoUGT2hztD2+1+waMWKfF5F2D0Y4DLHrVwEGH9dANYRzADJOxRtE/vypkA7HD
	dmkoMcC8OhnNeRWTW8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm25i-0084Q4-7A; Tue, 03 May 2022 23:38:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm25f-0084Pa-QQ
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:38:01 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm25a-0004bi-Jq; Wed, 04 May 2022 01:37:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Wed, 04 May 2022 01:37:53 +0200
Message-ID: <3166309.aeNJFYEL58@phil>
In-Reply-To: <20220501192557.2631936-3-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-3-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_163759_972742_B593032C 
X-CRM114-Status: GOOD (  16.41  )
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

Am Sonntag, 1. Mai 2022, 21:25:53 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The MPFS system controller has no registers of its own, so move it out
> of the soc node to avoid dtbs_check warnings:
> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
> 
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

What function does the "soc-bus" have at all?
I.e. mailbox@37020000 also looks like a peripheral
of the chip but is outside it.

And I remember getting the suggestion to not use soc-"busses"
over in arm-land years ago [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c3030d30d9c99c057b5ddfa289cffa637a2775f5

> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 746c4d4e7686..bf21a2edd180 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -146,6 +146,11 @@ refclk: mssrefclk {
>  		#clock-cells = <0>;
>  	};
>  
> +	syscontroller: syscontroller {
> +		compatible = "microchip,mpfs-sys-controller";
> +		mboxes = <&mbox 0>;
> +	};
> +
>  	soc {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
>  			#mbox-cells = <1>;
>  			status = "disabled";
>  		};
> -
> -		syscontroller: syscontroller {
> -			compatible = "microchip,mpfs-sys-controller";
> -			mboxes = <&mbox 0>;
> -		};
>  	};
>  };
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
