Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8728D41C00
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 04:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwJkoV/Hq020wUOSL8RipOiEuEI9R5YH3Q+c+gp70X4=; b=imfWo93him4vnf
	KBs1yLGjw+aHg/bB7MNYqxJPtd62g26C7HqQQL/YmFghTqlvblenKtFlKPx1xO6QwvO2QD/xTdTrT
	vLn/b6pWN5O1K5f9lFRMO75HvAn+R/ua3bwvAkDdnXhWFgl4aonyhqh2WRYGtaF53yF0LvFJ5WgNH
	JyLMZrnc00wv76nhh4/FBM2yUFVAkD6ezl+PtKijYgfbarxa2OQy2Qat7kG5oKk2TvnK+ODzWX8yd
	ULiE5hvGK+LhAc2Q0QmW92GqqMsUTPgD0wYu/6mSdgmurULVXb7lNrsK9xZZPkcYwzVUZSnEZB9t/
	szStyNSKcZqe/jufmtdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5CK-00000005kOz-0Wz6;
	Wed, 13 Nov 2024 04:41:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5CH-00000005kOT-0c5T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 04:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80E9E5C135D;
	Wed, 13 Nov 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00BEC4CECF;
	Wed, 13 Nov 2024 04:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731472899;
	bh=sc/GOepQc1YjbT4dga3mn7jmrORm8t0iU6gu9oRBFQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VyCNq/94Rn6vu01B7YQZJPtzgLdkBZBqeAROr//Nq4UZlWq3Yl+8ytw5S9Y0hse1J
	 DN1LZJnerkefOoCkFPUi65bdXi8Xxi1rfH0jS0/4blDZMZwX1xtzx7QmPeD57vJ358
	 JjE3Ydu322h796N4buNEGkkpyQ89xbsy8EebYr4PPkYRXjeyibaNiEGdE03Q06vfIt
	 GqtlJZuQ9gY6PlEAMlQzTxI3VWt6GmI0hd4yXos9cbTg3+OfQsw7RDu5OuI3CLqmj6
	 WQU1/UWT3gN1Cl1JC6jwYxt8tPWzcoQC1wGmLD84rctpHGAtwVWm+MOejuicf4C65Y
	 xjjHSeJxe5gFQ==
Message-ID: <deafaca0-63e0-4c5a-8d34-21567f78a5cb@kernel.org>
Date: Wed, 13 Nov 2024 13:41:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_204141_263717_F1F9EBE1 
X-CRM114-Status: GOOD (  12.78  )
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

On 11/13/24 10:20, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> Here shuld be undef "K210_PC_DEFAULT", not "DEFAULT".

Here ? Please be specific.
Also:

s/shuld/must

So something like:

The definition of the array k210_pinconf_mode_id_to_mode is done using the
temporary macro K210_PC_DEFAULT. When this macro is not needed anymore and its
definition removed, make sure to use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

This needs a Fixes tag as well.

> ---
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
