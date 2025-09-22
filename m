Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5484CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+6dYE4pJanWDLE+J6ZFVI+RZf3H1uVBhd2+ldg0JlA=; b=vdN/TbHms7VUhp
	H16l3+1fk+x8RzkN22xvbQvw0qu/mYdwa26w36s3TCAGsh2UIRGCnV/6pDLDBlVEHqvW9QGPQ6PzB
	5ddS3OVFfS817toBI910POrQP4Us1Bg7SeA9hb2aLaOyQn9fXRW7AJf4YfO/CAA0G0nzjlGKnziTV
	MayJsYJXzyHDgTXS9GMfofRqcWgo99ZChDSEANXgugeUzw/1BS1lSrYRUmRORwhPzrNIBi5Qk/vWn
	uxu7++O+GDGioWCSgJkxrpMeBITeLSxSFPTwElB86b65hCh/YXOWsBh5yeRbjbpGrXeaRURqeYQV5
	CcAd5vy2DY1T+HKIpS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZo-0000000BVAI-3hVk;
	Mon, 22 Sep 2025 20:56:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZm-0000000BV9H-3Y1k
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Z+xT5ZAidydnDUxknzskzkjKYUH13sdYH5kSDT+jEyw=; b=oOcM84juTa02LQPGCuI+ms728O
	86S8AWolcYy4F5+EG8d1PLQwvsnuzQcIrYFfjKPDIx+wn919L0WQpr2YvPlyAFwB3jOqL2vsmilOi
	MdHXaPO8VG02lW7W5kxjQ2ttcW9n1b6HH/QbkldhamJZ/ty89VieGJERGIz2dDLWfp8lORWOLR3eK
	XwjiO25s7NLK2REpFXIkrVdvR9v/lRkTsup29/++XVgxaFkNnnlheN/enrUDvGpESL7p/FZZiu2g9
	HxTx+ZnevlyRrIZieAq2REW8yvlAEcOJ98sUkj5dXuOGCeJLywsFCFbtSG8WE5swR/7BqYJkaW//v
	17cjvihQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZg-00AlUy-1y;
	Mon, 22 Sep 2025 22:55:52 +0200
Date: Mon, 22 Sep 2025 22:55:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
Message-ID: <aNG32F7QlaSNmg-y@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135558_886018_52C83062 
X-CRM114-Status: GOOD (  16.55  )
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
> spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
> error code on failure.
> 
> Since 'ret' can never be positive, the final 'else' branch was
> unreachable, and spacemit_i2c_check_bus_release() was never called.
> 
> This commit guarantees we attempt to release the bus whenever waiting for
> an idle bus fails.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index b68a21fff0b56b59fe2032ccb7ca6953423aad32..ee08811f4087c8e709d25dd314854ed643cc5a47 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -476,12 +476,13 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  	spacemit_i2c_enable(i2c);
>  
>  	ret = spacemit_i2c_wait_bus_idle(i2c);
> -	if (!ret)
> +	if (!ret) {
>  		ret = spacemit_i2c_xfer_msg(i2c);
> -	else if (ret < 0)
> -		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
> -	else
> +		if (ret < 0)
> +			dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
> +	} else {
>  		spacemit_i2c_check_bus_release(i2c);
> +	}
>  
>  	spacemit_i2c_disable(i2c);

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
