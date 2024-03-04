Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D66C54E49
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 23:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D38c9Er1ziKzsUDNOqeI1oIc6ab/ooKZKsDR66Cmi5I=; b=FEQniwek7pMTop
	4S+XYjialzt9CgYf1tHV4ek8GVdf9n3dAOVUhHIo5YKobHXUTWCxpirZURy+hMd2SE1ReWyvHS+kd
	Kdqa9DdFSgelV+0Dr9WrXqA+4jUkDb/Mi/nxAtvXBEFZirppm5O1K6FEibxkX6He+aOiuPjxWH5RP
	tbHtA8fGlu5EoQ/eOGKaOqi0/yXKPcpsYxgQrJNmjQN/7YJW+N5SRWLeP7f7KThacCmDcslVS02af
	8/dge78SgVpOUs0Qc7qu9YLrkj65CuodrmHXvfdkstLPlA4YMXV8bQNT02ZQOjC7zHDNcJBzfdmnC
	5+vGs+1n82gGhMPop5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhI1H-0000000B8mv-47Si;
	Mon, 04 Mar 2024 23:46:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhI1F-0000000B8ll-2MvI
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Mar 2024 23:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gfcMEGF9mZCBdCOoE4T1vovbwQI4guRQBV6tumEtZF8=; b=oQKYXjdYxtgMnxs1JQWNmaZFYc
	uowSG0owu7equLKP3NZ7n1eYBhBT55BMUsv0dZbsNVi4N1sZr9FtbjMF1jZkbQ6T/LPPvuFaQpYzc
	K9/WDEorD3KZf/XvA6yF25WmwaPGPBSk8vSutuxo/upLV4cqfyjAOLQP3oB95DFy6tEn+I/bVS6og
	O/O5XTkNTfs782sRNPjmWyFDm2dfvhqvSI1FQIstqfVANjNr+04rTdsz9tedlOxU2e6pWPHPoTX8F
	Ucoqyw3HaJPRbyM7iiSbxYTkgMVRZNniu4SsiuzDw+JnliJnzntkXMlIheBGWQ7i45qW6TviowAL8
	iDAM73mg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhI12-000000058Bp-2FDe
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 23:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 088E9CE021B;
	Mon,  4 Mar 2024 23:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65789C433F1;
	Mon,  4 Mar 2024 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709595993;
	bh=7WNSrD/gX6pibCjhneUKu3M0LMXGqqIQ3WUVG/m73CI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nIjIbBWftHai18rNn9jTJowhR3eCHntl3VdVe+YCqfo+/Aw8Ogr3jceQj2XoJG6vn
	 OR35iMW+pnXfkgwM9cxbv2g1a0rEzNBpeCRdo4SPH/AXH+LcP1Y2ovA187cJ/Ul04C
	 jbkmWH/HKPwkqlzQpGOqxLGHTqF0rEH9FRbboVRrziiTdnCLVLPlR9c2cqj+2iSDZy
	 lZ8l2wyalfWn80EzB7dar6xRtYfPIdE5Z57oMwafPjzlV2ks1Q+oei4WZL5B35qp+o
	 UezBaw+B49MQ3T0kGoZgCOZPoJPdl9+r7bga9PIH+zFY6w0mzoIxsoJVtVNB24kyVm
	 OE3cVtk6QxuPg==
Message-ID: <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
Date: Tue, 5 Mar 2024 08:46:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_234646_398752_9DD39824 
X-CRM114-Status: GOOD (  14.86  )
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

On 3/5/24 06:05, Yangyu Chen wrote:
> Since K230 was released, SOC_CANAAN is no longer only referred to the K210.
> Remove it depends on !MMU will allow building dts for K230 and remove the
> K210 string from the help message.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig.socs | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 623de5f8a208..b4e9b7f75510 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -75,13 +75,12 @@ config ARCH_CANAAN
>  	def_bool SOC_CANAAN
>  
>  config SOC_CANAAN
> -	bool "Canaan Kendryte K210 SoC"
> -	depends on !MMU

This seems wrong to me. The k210 support does require no-mmu. So why remove
this ? Does the k230 have MMU support ? If yes, then I do not think these 2 can
fall under the same SOC_CANAAN.

> +	bool "Canaan Kendryte SoC"
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select PINCTRL
>  	select COMMON_CLK
>  	help
> -	  This enables support for Canaan Kendryte K210 SoC platform hardware.
> +	  This enables support for Canaan Kendryte SoC platform hardware.
>  
>  endmenu # "SoC selection"

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
