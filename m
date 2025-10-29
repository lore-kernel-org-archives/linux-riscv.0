Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217BACCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ObV3rHLf1Y9joUOe8Yza7QipyiPYi0poPcKEqt8xdE=; b=TNNAlkv5u0xYnf
	lPFmgRYQKJR9dcn5ftY1gjCFoa/eEUDRIAjFO6t198dysHSBCEThQYLWGlosX1SrRSB4GHMP2Sz0E
	xfP2XWTpLKCK4ip7SZeS8Zwvpg8narZvsnPSH02LhZjUgX/dwJoKENWwbGFLItOtosbqxc1U0heND
	c1quTvnvWNQvtDWWl5LxV09Joir1HaSNSPs0zkSu/BIfvgUfvMzHhiNn+S3lCsQHQ1ksGfDazEy8P
	/rzJPoK6Y0/mERMx3ZbDPJxVp+A/iP5WJUz1xxZwjnR0In59ZETCNLvyiTRPzgyY1DJ2oIClPXTKx
	wAJoG/Ctp9Zee6D6FUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9qn-00000002BAl-0IE8;
	Wed, 29 Oct 2025 17:20:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9qk-00000002BAf-1Njh
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 17:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6903061201;
	Wed, 29 Oct 2025 17:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03BFC4CEF7;
	Wed, 29 Oct 2025 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758441;
	bh=fRO3N8gBJsLWYOcvvMBetHyoZTIc2Qfk5OoctK9z4cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/EdVFt+7i6uw00cv7W15qxY7Dr3YFHx9glHH7ILW38C+Ro4XjgKVnNAeSYuXGs+h
	 83iRqmQY02PCGvYZvtxPfhBjcVh3u/wW02siqXIUTgZJEDMS5/kokTX++ycNzaCsH5
	 yXTaoXuyWLchtj1D6pw75IljWYLOkqwfSReZ8q3x/v8gWcUVDv35XjMKhwKqdYEr9U
	 9NYPlhzk6120ifvtn1Hl9IY/bdPKM8/XWrBXzkRNwPyJzXIrQmU5YLF9yFF4oA3B73
	 GyBHOyWlnt5mEAqTZGQyzBi6opsPdBcArpCaRBIimRxBuY/OKziszCnKk5J8vE5197
	 2/XYNOwAcv3Vg==
Date: Wed, 29 Oct 2025 10:20:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant
 warning for LLVM prior to 17
Message-ID: <20251029172036.GA1130586@ax162>
References: <20251029-isolation-shield-b66aea79a9a4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-isolation-shield-b66aea79a9a4@spud>
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

On Wed, Oct 29, 2025 at 03:29:35PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With LLVM prior to 17.0.0:
> 
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
>         MPFS_IOMUX0_GROUP(spi0),
>         ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
>         .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
> \#define BIT(nr)                 (UL(1) << (nr))
>                                 ^~~~~~~~~~~~~~~
> 
> This is a constant, but LLVM prior to a change from Nick to match the
> gcc behaviour did not allow this. The macro isn't really all that much
> of an idiot-proofing, just change it to the same sort that's in the
> gpio2 driver, where a second argument provides the mask/setting.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2140
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks a lot for the quick fix!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Not entirely sold on the fixes tag since it's to shut up an old
> compiler, but no harm in it I guess.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Nathan Chancellor <nathan@kernel.org>
> CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> CC: Bill Wendling <morbo@google.com>
> CC: Justin Stitt <justinstitt@google.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-gpio@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: llvm@lists.linux.dev
> ---
>  drivers/pinctrl/pinctrl-mpfs-iomux0.c | 36 +++++++++++++--------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> index 49d9fcec0a16..cf5b2e4e8f5b 100644
> --- a/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> +++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> @@ -73,33 +73,33 @@ static const unsigned int mpfs_iomux0_uart4_pins[] = { 11 };
>  static const unsigned int mpfs_iomux0_mdio0_pins[] = { 12 };
>  static const unsigned int mpfs_iomux0_mdio1_pins[] = { 13 };
>  
> -#define MPFS_IOMUX0_GROUP(_name) { \
> +#define MPFS_IOMUX0_GROUP(_name, _mask) { \
>  	.name = #_name "_mssio",	\
>  	.pins = mpfs_iomux0_##_name##_pins,	\
> -	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.mask = _mask,	\
>  	.setting = 0x0,	\
>  }, { \
>  	.name = #_name "_fabric",	\
>  	.pins = mpfs_iomux0_##_name##_pins,	\
> -	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> -	.setting = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.mask = _mask,	\
> +	.setting = _mask,	\
>  }
>  
>  static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
> -	MPFS_IOMUX0_GROUP(spi0),
> -	MPFS_IOMUX0_GROUP(spi1),
> -	MPFS_IOMUX0_GROUP(i2c0),
> -	MPFS_IOMUX0_GROUP(i2c1),
> -	MPFS_IOMUX0_GROUP(can0),
> -	MPFS_IOMUX0_GROUP(can1),
> -	MPFS_IOMUX0_GROUP(qspi),
> -	MPFS_IOMUX0_GROUP(uart0),
> -	MPFS_IOMUX0_GROUP(uart1),
> -	MPFS_IOMUX0_GROUP(uart2),
> -	MPFS_IOMUX0_GROUP(uart3),
> -	MPFS_IOMUX0_GROUP(uart4),
> -	MPFS_IOMUX0_GROUP(mdio0),
> -	MPFS_IOMUX0_GROUP(mdio1),
> +	MPFS_IOMUX0_GROUP(spi0, BIT(0)),
> +	MPFS_IOMUX0_GROUP(spi1, BIT(1)),
> +	MPFS_IOMUX0_GROUP(i2c0, BIT(2)),
> +	MPFS_IOMUX0_GROUP(i2c1, BIT(3)),
> +	MPFS_IOMUX0_GROUP(can0, BIT(4)),
> +	MPFS_IOMUX0_GROUP(can1, BIT(5)),
> +	MPFS_IOMUX0_GROUP(qspi, BIT(6)),
> +	MPFS_IOMUX0_GROUP(uart0, BIT(7)),
> +	MPFS_IOMUX0_GROUP(uart1, BIT(8)),
> +	MPFS_IOMUX0_GROUP(uart2, BIT(9)),
> +	MPFS_IOMUX0_GROUP(uart3, BIT(10)),
> +	MPFS_IOMUX0_GROUP(uart4, BIT(11)),
> +	MPFS_IOMUX0_GROUP(mdio0, BIT(12)),
> +	MPFS_IOMUX0_GROUP(mdio1, BIT(13)),
>  };
>  
>  static const char * const mpfs_iomux0_spi0_groups[] = { "spi0_mssio", "spi0_fabric" };
> -- 
> 2.51.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
