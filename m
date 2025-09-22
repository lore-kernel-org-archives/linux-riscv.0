Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A34FCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TynfxSCOf1gJ12C7GvHgvvqjbibIyR8WUyiHGr31LKY=; b=V/XUbN7ninnIxD
	EUyt+HLYhY/5A5v14rMGlyuklmFkhTvD/Px5E0NlbGNpv1mwjJUp5v5HY/b0YvJ9Dx1qdDSWI+lIH
	ksPZlzghA6bov5OOLlU99VeoX3VB+T3cEiYSXMKDK4vd2f9rVuORBIk39a1JwBnqAor7fTDCP4IRB
	JKES2bcdnc5HmHxT0XZC4MVZwxsOhd2hxnlp+ui8YDM0otNZdw5q3OzUZgdrUJIELWw8B1qgKXV2L
	ToJtjkQVDI89wSOVIW+/4pfC+wfhSzCtB5fUkyNlh+lXGp5weFk7Pz5PX+/5n8B2YiH9MCBqNNzhu
	57+93THSmweA9VrKaJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0na2-0000000BVKS-1a8b;
	Mon, 22 Sep 2025 20:56:14 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZz-0000000BVGM-3zDO
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=bgQCp7CA1XODO0c4sqWCuEz1Lkml//ftLZS1eQvEnHw=; b=VdPr7U5WX7c+DPpyALWzTkyeN5
	OJK8cdDVLEklr/DqAjxdg/QQKcBkM9T0MFIUNBx8T+oiDx7VjFrTbo9cnHznd9DxLFdyr1ZWhXIvX
	H9KERN9r4b2mZSsiLu2vRav53XTrFpkDdHDvQzYdpbBSzpBXLtHofDrRi9ykqKOrd48WX+msouj+A
	oKdAqvQPGTspKxyCMqIbZQny9fpm8KGrzEtw7jIh2SK3y7ROImsU/XfJLwvysM3fg32Coh/7YWU5Z
	leG1m2aVv1p2TpTEEAUg9RyjCV0xKrvqFvlY1SgawqTOoO4NIZIqmYxWy5kv706tggfwxQaxOTYOL
	3VEn4vqw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZs-00AlWP-2U;
	Mon, 22 Sep 2025 22:56:04 +0200
Date: Mon, 22 Sep 2025 22:56:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Message-ID: <aNG35Dwg7wWivSHJ@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135612_001665_581691EC 
X-CRM114-Status: GOOD (  17.56  )
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

On 2025-08-27 15:39, Troy Mitchell wrote:
> After calling spacemit_i2c_conditionally_reset_bus(),
> the controller should ensure that the SDA line is release
> before proceeding.
> 
> Previously, the driver checked the SCL line instead,
> which does not guarantee that the bus is truly idle.
> 
> This patch changes the check to verify SDA. This ensures
> proper bus recovery and avoids potential communication errors
> after a conditional reset.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index c1656b78f1681729ccc2ebca6e290259d14889d9..4d78ee7b6929ee43771e500d4f85d9e55e68b221 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -172,9 +172,9 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  	spacemit_i2c_reset(i2c);
>  	usleep_range(10, 20);
>  
> -	/* check scl status again */
> +	/* check sda again here */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
> -	if (!(status & SPACEMIT_BMR_SCL))
> +	if (!(status & SPACEMIT_BMR_SDA))
>  		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
>  }

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
