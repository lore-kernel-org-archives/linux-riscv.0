Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 04:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKHeG00fDEoDq2MFpITf+QbZLHH5/pFqMPSkO6RcJ4g=; b=xZ+SdzbzXKPjUP
	rdkE/NUqDZvWFNWsMM/IMJfZ2yqqmn11yDzlx6W6sE0Ed1w5tUrDNvNDE58Kq9LtNk6DdduNmRzTI
	UWUZLXJjtzmnMWtRs9fPElZrQio29GNbTUmOazLYOCc8ZDwB0Vgd+QGl1e7Q9tv/K70uP/GV2cxOT
	WROcPf23NsW0HBKa3pWvez399SCxwVvOgcnf8fRRctsWtwhNyE1yTrUwHtPfUAliIslbDUk03m7DR
	SIvsITpThffdskbn1975vGJQmc6Dhn7XNXGbByqOifYG1KaIx8v87meZj+EtvZwuox/InGNNH+3rk
	Pm3cY8nhvarlI41+WIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzQZ-0000000BN7Y-430G;
	Thu, 22 Aug 2024 04:28:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzPr-0000000BMxb-1KU6;
	Thu, 22 Aug 2024 04:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f/MH8BUejV0tr4tV5BVVkxwx0+s0oPJc8U2uhWUHpj0=; b=cYqXqAM6Mnfde03jxzKilde5Hy
	LFEK3/5NZ7jC8HMa4LFJReOGG4+DcmoqyvUTTlnswSLKbMnBjuuqfsYtAiTd7vCJkBTzUKrD7JYWN
	WN5Yxm+Lsc+t5FkR7RLyQ2z8f5UQSkAT7jblBz9+jz3UHHha588ORf4hn03jI7fymE3vKsyuEyyBx
	voROrrJkeGYCQOeJlZSEssBbyqZf9FxjB9sq/5koxudQ4mhQMbjufw/JAZyZwD8JHp3oG2WfuK6vk
	iLnr/cJc2EiggCIOGRfNzdH8fER6haA9KRLPS467mQti5ywroD2rFS0ETmVjhAEm5GZC+Zp5UNDzY
	pgna/tYg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzPW-00000009plz-1mLJ;
	Thu, 22 Aug 2024 04:27:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7748A4212E;
	Thu, 22 Aug 2024 04:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CC6C4AF09;
	Thu, 22 Aug 2024 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724300815;
	bh=vH1hkgrRUpB1Fxi+zqhCcwdl2caWcSsBMzt+Av44d8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrR6V68Z8TGghTu18GVdIYBnnYJuF6Y4AgCuC5UHChF2yXmeUGeckuea7LW+e9rkS
	 ta7WlFoiZcX5QOndp2e16UjCVE4V9AEf/2+5ieqxWTtogySnjD3/vcBlSmZDmjXdro
	 BggdDNNagVnfEf0Ix+s1pFWhf6lABC9rktij+kLc=
Date: Thu, 22 Aug 2024 12:26:51 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
Message-ID: <2024082240-gallery-stinger-5901@gregkh>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
 <20240821121048.31566-3-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821121048.31566-3-liulei.rjpt@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_052659_248836_9F994E34 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Aug 21, 2024 at 08:10:40PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 1a6317e4b2a3..6e99e75f1acb 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -2398,14 +2398,10 @@ static int pxa_udc_probe(struct platform_device *pdev)
>  	if (udc->gpiod)
>  		gpiod_direction_output(udc->gpiod, 0);
>  
> -	udc->clk = devm_clk_get(&pdev->dev, NULL);
> +	udc->clk = clk_prepare_enable(&pdev->dev, NULL);

You didn't test build this code :(


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
