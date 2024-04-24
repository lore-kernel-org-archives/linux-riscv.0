Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7909BC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfubAcHmogGPJV/Ck9HUBMhMo4f3qt1jeqpdciLvjgo=; b=gLuKwng7stmd1f
	MX7EcfSx5oxRryPJr5AgxvCWvA17ww4IMlgNuw4K/vKQ7T3SM6OfHOlm48wMx6NB87wGSvrOnBQDV
	ta8SH0cK3RHbq2qkrD9Bkp0VWza6+jl3tr9EeuMYLrnAfbXZdHC2HH2QdFPj+L3DUjt7y8JLLAbgi
	px5lTLbmyUxPM8jT9gfIwYwx0FC3EJbXRcs2F+wpdYwk1EBl1CbcGfjobURuOWPObnCQ7jO+iSCLj
	usGaB5V915eLU/L+1Y64/Yl7+A49LDXWYHvLAtSUdPW3GG4inB816VHz8Z2uQrOamw1LLFaqYGyIX
	InAklfqxd1vmzCioRH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjCW-00000005uqe-1rif;
	Wed, 24 Apr 2024 20:26:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjCT-00000005uom-0KJk
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:26:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F6120003;
	Wed, 24 Apr 2024 20:26:35 +0000 (UTC)
Message-ID: <46925bcd-ad92-4c02-90f3-11da5c627391@ghiti.fr>
Date: Wed, 24 Apr 2024 22:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] firmware: microchip: don't unconditionally print
 validation success
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <cyril.jean@microchip.com>, linux-kernel@vger.kernel.org
References: <20240410-opulently-epic-8654bdac3422@spud>
 <20240410-throwing-sandworm-7d03e4e2f4e8@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240410-throwing-sandworm-7d03e4e2f4e8@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_132641_341491_C2D5D31F 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 10/04/2024 13:58, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> If validation fails, both prints are made. Skip the success one in the
> failure case.
>
> Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Update support")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/firmware/microchip/mpfs-auto-update.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
> index 33343e83373c..298ad21e139b 100644
> --- a/drivers/firmware/microchip/mpfs-auto-update.c
> +++ b/drivers/firmware/microchip/mpfs-auto-update.c
> @@ -218,10 +218,12 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
>   	if (ret | response->resp_status) {
>   		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
>   		ret = ret ? ret : -EBADMSG;
> +		goto free_message;
>   	}
>   
>   	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
>   
> +free_message:
>   	devm_kfree(priv->dev, message);
>   free_response:
>   	devm_kfree(priv->dev, response);


This should go into -fixes, but not sure if you take care of this or if 
Palmer should, please let me know so that I can remove this from my list :)

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
