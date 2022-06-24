Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FCBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KutAeDh64i1woXMQPqIWp4Rz3f2WhG2X7TEmfnm2EvE=; b=WZk0kjM1c35hIv
	nU5SOkB1uzsBAzpocKZVngxiKKH3GCO1x0SbhTL9dds7tEDcKe+QLlTxnXnL3hOqJzhhtizJltnZi
	YK2LcoI+v96tDvM2l4wd6T8FZuqfS4Cr4vZtqBcdJ+/2a8tntZi38fQC7JewLL12w+TuJ+XMhqpFe
	UI5XVlsB044eZJ+ZubYu3be/UDdGKBvQC/36oNHmdXkoFo9F1C8ELj0tgvIrnsBYc+4nY6Y0G8uOr
	ElOZk+17PH1IIax9EL3QoS0RX2UgpKooL4LhDd4HYFUvPtR7qCbrYbzuyircBHP5nrosPOFeewvy+
	83owlDjtALiEXszxNWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hkX-001zPl-9z; Fri, 24 Jun 2022 11:45:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hkE-001zEy-5d
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 11:45:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23FD662230;
	Fri, 24 Jun 2022 11:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBE7C3411C;
	Fri, 24 Jun 2022 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656071099;
	bh=/juf5uhRx4ref2vuTs7Hpo06T65AVQbyQOqQDhjmWU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDFVvIZPp4ipTFbNzLCLY2ngcLnNYWoXHX/GzPbN8cyROyLW4td75MRwsyhRgn7zM
	 cXka7AsavQuuFK7GAbINaUSf4rveA/+sfSUqHie0Z6MF2T0DGDipSwWMlGtc/iyfVa
	 AmWiS7kApkn+paPWGLqt7+XBVclDlrb0caJvhd98=
Date: Fri, 24 Jun 2022 13:36:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: lewis.hanly@microchip.com, conor.dooley@microchip.com, b-liu@ti.com,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: Fix missing error code in mpfs_probe()
Message-ID: <YrWhyppxkpQQ6Y8U@kroah.com>
References: <20220624072515.123646-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624072515.123646-1-jiapeng.chong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_044502_337192_1DE34778 
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

On Fri, Jun 24, 2022 at 03:25:15PM +0800, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-ENOMEM' to the return value 'ret'.
> 
> This was found by coccicheck:
> 
> drivers/usb/musb/mpfs.c:185 mpfs_probe() warn: missing error code 'ret'.
> 
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/usb/musb/mpfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 99666ef8af06..c8bf6570bcc4 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -181,8 +181,10 @@ static int mpfs_probe(struct platform_device *pdev)
>  	glue->clk = clk;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> -	if (!pdata)
> +	if (!pdata) {
> +		ret = -ENOMEM;
>  		goto err_clk_disable;
> +	}
>  
>  	pdata->config = &mpfs_musb_hdrc_config;
>  	pdata->platform_ops = &mpfs_ops;
> -- 
> 2.20.1.7.g153144c
> 

Dan beat you to it, and provided a better fix:
	https://lore.kernel.org/r/YrVmLEc/FOEzNdzj@kili

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
