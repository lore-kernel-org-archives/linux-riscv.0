Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F046C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydlChjDeb7QsNN0C52B949oPSSON3QpYbMQImUnsh+M=; b=Sz9aH1gZ+k9KqT
	UjLUCQwTeXf5+wpP4P6R5XMVB1/5hglQtf+qDSusvtZwq67VA4bCG728Wz3chD3+mzRbZ3LPfskvO
	SY7GI+cmwTA6238eiV423PKox1UxSZCnA0DvUo5SD1sa7/H7lyFaNJvYTP3FHWOb4C8440yq0Wera
	cnWPycusJcGiFrRWAWiKvJ0DRvmjwzwK8j+4532dVcsBbWA/njoFundmHCR/TeifAzVRNw56R+DPf
	WPVyKEwGGQ593N/5mR140hGaS6WwUz+eII2d9ZHy9MxBJIdehn+aKCAv0yY86/zOmrPJ8L2SVdkgP
	9p6OHcXeaEBfdhOAfsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZG5-000000050Mj-2RHc;
	Wed, 23 Jul 2025 13:11:45 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYzK-00000004xA7-0MYy
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 12:54:27 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC9C5335CDD;
	Wed, 23 Jul 2025 12:54:22 +0000 (UTC)
Date: Wed, 23 Jul 2025 20:54:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: sboyd@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
Message-ID: <20250723125416-GYA738759@gentoo>
References: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_055426_155045_D19B1F0D 
X-CRM114-Status: GOOD (  15.21  )
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

On 14:40 Wed 23 Jul     , Hendrik Hamerlinck wrote:
> The function spacemit_ccu_reset_register() allocates memory for an
> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
> these resources, resulting in leaks.
> 
> Fix this by using the appropriate error handling path.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
Can you put Fixes tag before SoB? I'd suggest to follow tip tree's docs

https://docs.kernel.org/process/maintainer-tip.html
4.2.6. Ordering of commit tags

otherwise, looks good

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  drivers/clk/spacemit/ccu-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 65e6de030717..5bb85e32c6cf 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
>  	ret = auxiliary_device_add(adev);
>  	if (ret) {
>  		auxiliary_device_uninit(adev);
> -		return ret;
> +		goto err_free_aux_id;
>  	}
>  
>  	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
