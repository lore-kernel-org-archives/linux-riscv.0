Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DFBEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr2LqGBRYaLH4P0lOjY/QogZboND4sD3MMdKlfL1qHo=; b=pagCQr94S7AO4e
	sOokuA0uY/b7NDRwxNIjqrxAE18f/J6qvzUxBKwbuZQqIlI8GkYEKVkIIas44pzrxLt5pf2b7z8eK
	qTVO6dmHnr3RjFe86KfszfywtkmNVNF1nIRg0d5Kf8IrqumegHrbqORvoGByQbSJMKsQVXJdYA2+B
	gwMRj9UekU/EK9c363W/sfffCRqks3CVBRyQMzGygOkXElt3e1WslrloPah1Xc5s+DuwPkspNYAgp
	Nv29jGppCRkRD3cfSQFvKhsyFG8vTqcW0Ubq8CfICevaNNJrYMIap8HY5fq4/2bpzZKh+CmBTVPJW
	fvce95AVjQY0dT4M9OIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4jF-00Cy7M-2i;
	Sun, 16 Jul 2023 16:36:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4jC-00Cy4X-0l
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 855B660D27;
	Sun, 16 Jul 2023 16:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E900C433C8;
	Sun, 16 Jul 2023 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689525369;
	bh=lfHQs1QwpReacQf4a7V29m1UNZ+jaDDuhifycOp+VJw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s1tpv+SEjLYE+7wws9zlRxVah7idFtwiUgWPTwwKmakHIhUkFpS5HQ+X3AD9wJ9oE
	 QlsZNn4rPy7913Vm5Phor4eAPcJl+s+2OFEJ+ic2XtHSywyZiTvHP9sKvj0dUhT2Hr
	 BJEDOecAkYwS7SrhP6hxY2GnekJa2u7cMU9Tk9Sd7s9JREY4MptfG87yxp+p9rIPyg
	 VJ23cWbSVNeIBltpkUv4oCwERz92NIvHMU2tVpmIe9wsWEMoi56zyW4KTDoi5XCnHo
	 ygVXPwXdmePnZjCSCM5mY0+eBGCUOGGZq+BC6glVR7/NVeCGqqwqHkzLMgJOKkZt5A
	 7u7+ukj5Zmx6A==
Message-ID: <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
Date: Sun, 16 Jul 2023 18:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Content-Language: en-US
To: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230715112523.2533742-4-contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_093610_318596_D35B954B 
X-CRM114-Status: GOOD (  18.74  )
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

On 15/07/2023 13:25, Jookia wrote:
> From: John Watts <contact@jookia.org>
> 
> The controllers present in the D1 are extremely similar to the R40
> and require the same reset quirks. This alone can support sending
> packets. An extra quirk is needed to support receiving packets.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  drivers/net/can/Kconfig     | 4 ++--
>  drivers/net/can/sun4i_can.c | 9 ++++++++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
> index a5c5036dfb94..e626de33e735 100644
> --- a/drivers/net/can/Kconfig
> +++ b/drivers/net/can/Kconfig
> @@ -185,10 +185,10 @@ config CAN_SLCAN
>  
>  config CAN_SUN4I
>  	tristate "Allwinner A10 CAN controller"
> -	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
> +	depends on MACH_SUN4I || MACH_SUN7I || RISCV || COMPILE_TEST
>  	help
>  	  Say Y here if you want to use CAN controller found on Allwinner
> -	  A10/A20 SoCs.
> +	  A10/A20/D1 SoCs.
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called sun4i_can.
> diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
> index 0827830bbf28..06f2cf05aaf5 100644
> --- a/drivers/net/can/sun4i_can.c
> +++ b/drivers/net/can/sun4i_can.c
> @@ -774,6 +774,10 @@ static const struct sun4ican_quirks sun4ican_quirks_r40 = {
>  	.has_reset = true,
>  };
>  
> +static const struct sun4ican_quirks sun4ican_quirks_d1 = {
> +	.has_reset = true,
> +};

Isn't this the same as previous?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
