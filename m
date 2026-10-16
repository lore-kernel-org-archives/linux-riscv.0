Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2863CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OP/RMIDCQA+tgVc9mg/nwFy7Ahd5rv7MGNnmtj3gApA=; b=iLYrT9qQY1SJa1
	WMMpbQ2STnlSPJ0QnEjtUGvL3LW7P4jcSqD9nErNlr4x51ApxclZPGdpkG5o60seaDx816Yfq4M3J
	IWcXDjTZZ9/oaOARW094ew7P/oYGScEUnDs5/ZscmIGbMjjkvDG/nlUoa7uNunnIjKL5SPQp2zZvs
	4LhcGU2kblw3eTaMy4eoQfhTjp2iKqXRt/PNp34+pvTiT6uO++Z8HRzzrhroDX+nvwBfjlmVfeaUr
	scawBfSAvjhnRUZKk9nAGQwxS2IgzAynk0XU7Gw5QlkGw8953Y0QyDw3e0ANANoRyBnD6ayPR/zB5
	XbhT+ELSKMiIgWQhSW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHliu-00000003Yd8-1u6O;
	Fri, 16 Oct 2026 17:28:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlit-00000003Yd0-2K54
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 17:28:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04CEB60A6B;
	Fri, 16 Oct 2026 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D6B1F000C5;
	Fri, 16 Oct 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171682;
	bh=7WqrARHI6gITSJlqMvjpdrjAfDThuDj/nJr63cYnjdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IQXGJcFRVXhUEssTT34hpQbvBYbutqaOJG0zIdc/r/0pHoToA6DLxoJlTwu/bQZHR
	 W5TLmnYXJODl/+mHha0ohTFRXDwkDpMivbB+0RXM6aTKey0paDIFlvuff48Tzhr/e3
	 qp5n52HBuu6hEKHxcJwPYBCiFiECfeOOeFZoIJvSWxxOrR8w31skYuLreSZsv7p9uK
	 r/G9q8xqZMELFfyIXteWtqNqKXEqtwxu1RTBMZTNmPUiZIO9q0ajaG7JaOWj4p/7yU
	 05l0B0BfKvWvY3NckaXgIymcbLfDVu1lOTcCSWCV2b1LvEK3HZtFGJRQc4HO9V/0wy
	 epSAGoj+0LGgw==
Date: Fri, 16 Oct 2026 18:27:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Samuel
 Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cache: sifive_ccache: propagate IRQ count errors
Message-ID: <20261016182756.443ebd0f@jic23-hlaptop>
In-Reply-To: <20261015084502.3061706-1-thnkslprpt@gmail.com>
References: <20261015084502.3061706-1-thnkslprpt@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Thu, 15 Oct 2026 11:45:02 +0300
Avi Weiss <thnkslprpt@gmail.com> wrote:

> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
> 
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
> 
> A negative count skips the IRQ registration loop and
> allows the probe to return success without requesting
> a deferred retry.
> 
> Return negative IRQ counts so the driver is reprobed
> when the interrupt provider becomes available.
> 
> Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> Changes in v2:
> - Combine the negative and zero IRQ count checks as suggested by Conor Dooley.
> 
> v1: https://lore.kernel.org/r/20261013095756.1084568-1-thnkslprpt@gmail.com/
> 
>  drivers/cache/sifive_ccache.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d52..f2428f7ea373e 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
>  	quirks = (unsigned long)device_get_match_data(dev);
>  
>  	intr_num = platform_irq_count(pdev);
> -	if (!intr_num)
> -		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
> +	if (intr_num <= 0)
> +		return dev_err_probe(dev, intr_num ?: -ENODEV,
> +					"No interrupts property\n");

Align as (assuming local style isn't very strongly matching what you have)

		return dev_err_probe(dev, intr_num ?: -ENODEV,
				     "No interrupts property\n");

>  
>  	for (int i = 0; i < intr_num; i++) {
>  		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
> 
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
