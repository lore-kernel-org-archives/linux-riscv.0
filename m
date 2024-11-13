Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05468D41C08
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLZ9LgLgR9mZTiOQ7GpYmgEBH2zdxsg0WNSp8yxYGwo=; b=dCWFXGNbiXmwQZ
	xk/a4NHcNblxYgOu5+QnGoNM0ccvvlT5zdcelkghY5AHA04C61SYpDlz6hWib2XUR70a079NmF3Dj
	si5tvwdoQUAXLhVChvqu/hAgfBhI2k1PRdCcPmmLRTHqhnlKixlSVvczwSVpEEn5uhWL31EKwaxPF
	T2Rc3J02MrzHTLr+LByuF2vBZOlZAImCIMRpYrP3g+Moy5HnkFcZJvlCKIEeWMe/9qs0bpbQigo+D
	fmwIVFEIg/Isq7fHTES6XfUzLhA7s/M3w7n6yS3EDAhkkg4VyeuQrEbv/pJ+mCnHLBJbga3XKJ2JC
	jYmu5UlxhqgDxCLmkHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB74Q-00000005v8e-0Oac;
	Wed, 13 Nov 2024 06:41:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB74L-00000005v5r-1jv1
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 06:41:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54BA8A4028F;
	Wed, 13 Nov 2024 06:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E24EC4CECD;
	Wed, 13 Nov 2024 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731480096;
	bh=wyQyDHdXtyzcRPz2ARXn4TOAdhuwmr5UYlMO4VyOe08=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=iVg+GVaf7TzsDb5ROiATlK6YmnGZpnTPtCf3ZmkWVtyv82UJ8wjnMoTdGV7OUFsXR
	 zRXhsdxSYW0pwa6XyMRIlpafSWfukENwg5e9/zPrVTWGnAEXhg/jTz0ujtdRcWEBCT
	 8Mcroin3/IfPwuNjNzUNd+YXFoViyHTmkVE0lU5VU8cdM1QeumcPnsWbqWsg5RQzFO
	 oGxXTVaJwGFgAN9OfkqUz25JkoZA84UU3mLTEy5CM3dXfl9gGWfGcHc4ckBikrsvH3
	 wtu+TCjXxNoiWiG7ioSnX5+Xh+syE2YNenbQByTt9DGuh/kJ4LFWztPJrDm+4MQMcU
	 PQFaW19ZiB6lA==
Message-ID: <e3ff8ec3-1995-408d-aa75-6afc11f51ebd@kernel.org>
Date: Wed, 13 Nov 2024 15:41:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v3] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113063611.5330-1-zhangjiao2@cmss.chinamobile.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113063611.5330-1-zhangjiao2@cmss.chinamobile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_224137_565056_3BFC2764 
X-CRM114-Status: GOOD (  11.95  )
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

On 11/13/24 15:36, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is no need anymore,

You forgot to fix "no need -> not needed".
And you forgot to add my review tag as well.

> use its name in the #undef statement instead of
> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
> v2->v3:
> 	Modify commit info.
> 
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index caf20215aaba..eddb01796a83 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -181,7 +181,7 @@ static const u32 k210_pinconf_mode_id_to_mode[] = {
>  	[K210_PC_DEFAULT_INT13] = K210_PC_MODE_IN | K210_PC_PU,
>  };
>  
> -#undef DEFAULT
> +#undef K210_PC_DEFAULT
>  
>  /*
>   * Pin functions configuration information.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
