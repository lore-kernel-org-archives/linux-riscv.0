Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B617CC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoNHDVbIDd4mAiSsrAkFqwFn6KZlNl8BKLM+ZBN87c4=; b=avbtL7m1ix5wbh
	RZNZyAzNqVWq/JujTAJH42vMXLrm6RHLjhQXiSxFzl+sHwAZRhk4p1jHr25e2E7sx6fbKcPEJ/fZI
	25qS0xH0F5vA4Lv8wkHc3l7KiLBUvi0vmx0d7KU8OjNh8oEAMeqAYM4gBwrMHNdoO9hoOnrHTyFck
	uHT1OUjLSNEt31sLliEEKLzPV3DQzcXj8Ao5bUp3U2q1dw7UPgg/F1MLk56QyOGGDhAyzU5GYbFPK
	o90EFJhBtQQ45MB5QlYOrsVtnbjIsXlvHEwkau31SYtVFl4GU9WUU/EGZmraDdARzn/Q4XacFcFE6
	RH6Zbah/vMTM/anUFHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhI4u-0000000B9Gw-0jQq;
	Mon, 04 Mar 2024 23:50:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhI4r-0000000B9Fx-0IKM
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 23:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 028FECE021B;
	Mon,  4 Mar 2024 23:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B69C433F1;
	Mon,  4 Mar 2024 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709596234;
	bh=FUqV7V3jF4155KU2wYQ2VpqDEN8BLRgff07ULcK6dDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TV8VBHum6DhMa9heo77mkcgh5EBnsNaX7tquiD7C18YX4iQEgSqwDrOXJcKqWKyDQ
	 xA2/V+2wisq0K2kay3/O1WyD74yhX6ITb6oVQnUEUouULKCluzUMqEuD/9iPC75fEO
	 7nY4DCfKezJgEqYAoYisyEbqtRPwy6L7yQOLB4q+ooziskwwYQBgPBLd51R7DkbWKA
	 0zlVreg1ZmTWPewFZSq3y/0xV8YPYlmA39gahM2hlMsHYzbE9eHxKDQt1KCnRYl0Z2
	 yfK/aj1itIUE+WpsSPw9CPjfui40ZRp5CGrlD6BkBWjxwBedhicj5nnMbNhRwyX4/W
	 Gc+21lWvvFW1w==
Message-ID: <2a206c9b-b570-4081-b4e4-d177343482f3@kernel.org>
Date: Tue, 5 Mar 2024 08:50:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] riscv: config: enable SOC_CANAAN in defconfig
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_E2812086B695A334EE5E8C70C85CA3171F06@qq.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <tencent_E2812086B695A334EE5E8C70C85CA3171F06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_155037_354139_110F5368 
X-CRM114-Status: GOOD (  13.03  )
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

On 3/5/24 06:06, Yangyu Chen wrote:
> Since K230 has been supported, allow SOC_CANAAN to be selected to build dt
> and drivers for it in defconfig.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 89a009a580fe..20b557ec28df 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_THEAD=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_SOC_CANAAN=y

Given that the k210 need !MMU, including it like this in the defconfig is
odd... I do not even see how that could work. But that depends on patch 5,
which does not seem OK to me.

>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_PM=y

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
