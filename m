Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06FC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 22:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWmaoqvnvSw7XlHMQZ0fEmwbzxtgzPLlMZZRa/BReM4=; b=0OodL7tJaXGKkm
	TpYmOcu5twkMwuQ1icsBLtMULYjnc2JyrLXQeeftVMTbN+EZ24mh9iggvUqjy4FriyfERK/6sQ08S
	4cxV4wJDQn6k3GjNuXCBfDuGRgXNx5JkOJ45blOGyuUfYPPDbwfLKjnACXiPaeEypLV70WK6FDOAv
	RY8Haxm58MWeV+0Wo32FFS+XJM8jMBIdCeice0yub4l4awMy9EgtU187/qdMQ6QeeMuTsZ50hhWVc
	DsG3BK/aN65bZ0XVHcgoIhowZhlT0CDRndWEhLKOBovMgC/cn6KDTAEbnbhRBR7bWSovjJoMmzzHG
	DfH1oWhMI/ZetO27tRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQM7-0000000Dve2-06sh;
	Tue, 05 Aug 2025 22:42:03 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQM5-0000000Dvde-11zo
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 22:42:02 +0000
Received: from localhost (unknown [116.232.147.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CFE16335DB1;
	Tue, 05 Aug 2025 22:41:58 +0000 (UTC)
Date: Wed, 6 Aug 2025 06:41:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linus.walleij@linaro.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: remove extra line in debug output
Message-ID: <20250805224149-GYA950625@gentoo>
References: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_154201_320014_A2EE0259 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Hendrik, 
On 17:07 Tue 05 Aug     , Hendrik Hamerlinck wrote:
> The debug output for spacemit_pinconf_dbg_show() prints an extra newline
> at the end. This is redundant as pinconf_pins_show() in pinconf.c already
> adds a newline in its for loop.
> 
> Remove the newline to avoid the extra line in the output.
> 
> Example current output:
> $ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> ...
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 9996b1c4a07e..fb361f2acb54 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -707,7 +707,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
>  			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
>  
> -	seq_printf(seq, ", register (0x%04x)\n", value);
> +	seq_printf(seq, ", register (0x%04x)", value);
>  }
>  
>  static const struct pinconf_ops spacemit_pinconf_ops = {
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
