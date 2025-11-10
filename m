Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D715CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XCHkVRCHzNSgoO4WRJ6FLkfZDvbGWO564rwLezUcZg=; b=2+vzheKDQJBjnt
	OBlJKygCRudGnQ02543nPnOjz4CZEbLoylGjU6dF+ZNw3LQQ0fX7OMY4Y3iNm8FwVIlyWjANrv4ZY
	KyDOzraeyEDiT9segyQTKsKKdZVvjOIHPHzZGTowHHGWnSaJdteazEgV4EPTJGPe387dZSk2SEWmZ
	I1Ku8vKoZEVNO0Pv4C8wxuVPtkl2hwfH9uEG4a0yjVm0735ASN0mS3CV5b87jEt+bgxB/dMEl+AbY
	tIbh0pHWtzYypz90CC9QI2BnvQiKFljUCEaxfXsEZLTK4fCY/HVBy3tAJ1KwplaBP00JLYlqeZCl7
	3n2nuEw81DJVzOfKbGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXIY-000000060wH-2XFt;
	Mon, 10 Nov 2025 19:11:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXIX-000000060wB-40b7
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 19:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1963560144;
	Mon, 10 Nov 2025 19:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA4DC4CEF5;
	Mon, 10 Nov 2025 19:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762801888;
	bh=H4rp7RZQupzK9V1V6jWQ63JhkC5HQCmbB4coEew+cFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJqXI5pbwcnDAHtxT5eqiavC/EURQOStdQ4WIkrjc1Kz0i9BrZ2i/tucEiqv7RgFl
	 YzNEflTmwAgiTOCSR3hUrqZAs5f62inkGTj8HRtjZv9X+5b1M98VnxaeiegqYWpwV4
	 58dWSPdCecWB0wsD9yg2SYOHUApR0zRKGmUVkB5i0GWzEtHZ773O07j6Ch2B9hQpjK
	 vyLnCfgXcc2uDgKAiODOLEW14mPNpaIeFZoN6SZLziPS4I6Z6KLHUuS/RkFtaTQG25
	 mdUqsliTIktZRlwb1/dnSNPph4+3E2LBBWYP9uvvwzN+Fxk0WATghBaDqUjQR2KSZA
	 KHSS2SSg0lHiQ==
Date: Mon, 10 Nov 2025 11:11:26 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Message-ID: <aRI43i80Z5AdhGro@x1>
References: <20251017055414.7753-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017055414.7753-1-johan@kernel.org>
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

On Fri, Oct 17, 2025 at 07:54:14AM +0200, Johan Hovold wrote:
> The purpose of the devm_add_action_or_reset() helper is to call the
> action function in case adding an action ever fails so drop the clock
> disable from the error path to avoid disabling the clocks twice.
> 
> Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/mailbox/mailbox-th1520.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
> index a6b2aa9ae952..626957c2e435 100644
> --- a/drivers/mailbox/mailbox-th1520.c
> +++ b/drivers/mailbox/mailbox-th1520.c
> @@ -435,10 +435,8 @@ static int th1520_mbox_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_add_action_or_reset(dev, th1520_disable_clk, priv);
> -	if (ret) {
> -		clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clocks), priv->clocks);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	/*
>  	 * The address mappings in the device tree align precisely with those
> -- 
> 2.49.1
> 

Acked-by: Drew Fustini <fustini@kernel.org>

Jassi - are you able to take this through your mailbox tree?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
