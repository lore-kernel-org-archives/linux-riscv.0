Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FBFC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvqW6VVL7Pjmp4vRk2R092UCEfOLcRfEaxRqdhoEHrk=; b=qx0xRq07b6kmYH
	NQN8CAi4+Cg8wnhgzYbIS97hrXI8Lf3Y/p+deOT15Jts0d6b1dnynvYv1dBWSJoULdak/6PTHpi//
	6vJONOLvL32CJ2BpmotPSsdRsI1JnAAbyI1Mrc8CQHF4/sgX7g4MCdIKsq0qBTLq0wLOSLbWAhHo8
	zvPYutm2qufnu4L/X0e5GNvSaA7hH5I+zBl5UFVyfp2riWKNmZERLFUWG1v9Nm05eaQDS+aBc53cT
	xvJ7Jeh9hC1Nd0JuP2noQj+qXLNytJEfWVg2xDhdIO5RGnMU9t37AOfBB1o+sSHKMh6grxWx+o5tD
	wLPPMT1+WR1MVlVQ3RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMkq-009vv9-3L; Mon, 17 Oct 2022 09:49:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMki-009vtL-JL
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 09:49:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C403B60F90;
	Mon, 17 Oct 2022 09:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8012CC433C1;
	Mon, 17 Oct 2022 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666000183;
	bh=UwY1+57tskbawvtQwNEitDpdaL5Aj5k0Npjk4S4RzBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRv42+9TRbdTsMmVJzw6A+nrBM3Fd0jStzkzoVy25IxWJwBnurudOz5kXzN0OoyB6
	 PBrl8DMNynMtCAeNkmC7OYZBv5mSXJUkxSoGyooHFHAZIfBR8nx6+EDDWINI5nS5fn
	 sNU6q3mJ316dXpI8q+NGeADsLSkr6lm9egAR57TBWAhPPAUFYz9ovSag6RkRZwnzZR
	 AK67MFHtZQfVLPNUFMFxKnuxN4wzketymA//YF0bP0Bo2Ux3yr84Dc/f3F59LO4m8x
	 kJYq4vr6LZWqJWcHYpkyP2aiWvwJ/3amNr77yj5l/h7zDSE86XezoSPREtnIYg06+j
	 gc7VD6Eeklz+A==
Date: Mon, 17 Oct 2022 10:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	broonie@kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] spi: microchip-core: Remove the unused function
 mchp_corespi_enable()
Message-ID: <Y00lMjEncoxwkNiJ@spud>
References: <20221017092141.9789-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017092141.9789-1-jiapeng.chong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_024944_706472_F126F468 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, Oct 17, 2022 at 05:21:41PM +0800, Jiapeng Chong wrote:
> The function mchp_corespi_enable() is defined in the spi-microchip-core.c
> file, but not called elsewhere, so delete this unused function.
> 
> drivers/spi/spi-microchip-core.c:122:20: warning: unused function 'mchp_corespi_enable'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2418
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/spi/spi-microchip-core.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
> index d352844c798c..aeaa1da88f39 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -119,15 +119,6 @@ static inline void mchp_corespi_write(struct mchp_corespi *spi, unsigned int reg
>  	writel(val, spi->regs + reg);
>  }
>  
> -static inline void mchp_corespi_enable(struct mchp_corespi *spi)
> -{
> -	u32 control = mchp_corespi_read(spi, REG_CONTROL);
> -
> -	control |= CONTROL_ENABLE;
> -
> -	mchp_corespi_write(spi, REG_CONTROL, control);
> -}

That's a bit silly... Thanks Jiapeng.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> -
>  static inline void mchp_corespi_disable(struct mchp_corespi *spi)
>  {
>  	u32 control = mchp_corespi_read(spi, REG_CONTROL);
> -- 
> 2.20.1.7.g153144c
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
