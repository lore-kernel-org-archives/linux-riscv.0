Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47701C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMoToqyql5M2Z77QOvd7SjOYaP1rB+HEcqXtKBVAlpI=; b=VoNZ4Ofr/KYLgX
	Bust/LHsgSOCYf8qWutUoleCoZHBUz4dmryq3F7cLkhTF12yRX9uwlj/JIC86duBoankJi4ABnpS6
	T2GAopzYYgRFBSR8oD8ygvTGNEqLCKBXnTz7vLDc68VZPiW6XJ055PxqEDhOCfl11nveAUF4gI7PM
	SNXsl+4hdJoSMWxZxOuACN9b5X1jRCtcqTfT/Jsek+gcQWk+HYLdaH+lkarpFXRf2rRmJsEJDuzjQ
	4Nb+SdPELQ2fWhGV9cDNZ3V5/0ZRfXM0n88k4sTm1KfWCAC8dNd2YInGW/ZfZgmIcqj5PWgdyeXQz
	8HjGKDocT6S5yZato9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow06R-003oaN-K8; Fri, 18 Nov 2022 12:04:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow06O-003oZM-Vv
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 12:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 902C0B8238D;
	Fri, 18 Nov 2022 12:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E643BC433C1;
	Fri, 18 Nov 2022 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668773050;
	bh=16/eZrNzuo6DfZkPEAFwMOchB87kodvzPf3XhDp0Vgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6ZAgd/uro5BfypVAdiqv7UtMzbw0VlsnIMF5F+91W+F+e75VGz/U/ORYFwuPBYRr
	 OLWCQQwUW+9R4MgwH6B/WoE6qgRf9rbCZGAHWq15r9K+6FpbfSG6iSFhzbOXzTPani
	 bXKoZHiA7cryOSx3dJlJlJRP0dY2ftGHwNP/Y9b7nR9yO5GjGxCu4O1ckeX9XjWQVc
	 rBoamjnG5gkvNseRhmSm2Vjud4KL0f9MWtzIUvdgQojop/oh2lXXcHsDkYBH/h8AWt
	 n/UXWgnoyLNUUma/2Nj8SZpyMtW1yP0MRWovLw5qV/pjHOR/y8grusi4JwORATYOLK
	 KIcTPDPIAlf3Q==
Date: Fri, 18 Nov 2022 12:04:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Message-ID: <Y3d0tL6UoAbdhHKE@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-9-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-9-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_040413_195768_7800D9D2 
X-CRM114-Status: GOOD (  16.90  )
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

Hey Palmer,

Can you take this patch for v6.2 please, as it kinda just equalises
things for the existing jh7100 stuff? Everyone else can boot defconfig
other than the visionfive v1/beagle v.

Thanks,
Conor.

On Fri, Nov 18, 2022 at 09:17:14AM +0800, Hal Feng wrote:
> Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 05fd5fcf24f9..a23d022974ad 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
>  CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
> -- 
> 2.38.1
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
