Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F48C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9y5cnabIRu8e9osWlWd9J+rb0b3n5DkzDrx0opYnA8=; b=t47IL/SJCKUWsL
	5lxTOMSLXxaX1il4uLHZsizppQfjq0ndKoySbK6SgwHGbodkPhEDcxEYt3nZvVExqSu4wiJ1JkY/p
	jJNzKJjn1BONHucJMsvO2lUNcFy+WX3kg5twp4JFxdAzvShN/sozPxgJe/Sfa4OU5umPZxh6PR8O9
	8y82X65OnM+isrxS6EOntF3jfwXXIYCWVtO31CxB+2z+++MpsDocBB2P5YiOq4n8rawdpnGamD7kN
	bCnYo2XaddN4b1Pl45Ss8xGb1deiAySrSGjxIDazKQsjupTe8E9DHwyuaEuHXEdWH9zvkhPv0kN1e
	KQBaKgbWQAm9bIqnExkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYFA-00000007CSG-1bol;
	Mon, 26 Aug 2024 11:50:44 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYF7-00000007CRr-0yL5
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 11:50:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0255CE0003;
	Mon, 26 Aug 2024 11:50:35 +0000 (UTC)
Message-ID: <9cdf868a-e937-4be3-8e7a-a7d12d3fe5da@ghiti.fr>
Date: Mon, 26 Aug 2024 13:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix toolchain vector detection
Content-Language: en-US
To: Anton Blanchard <antonb@tenstorrent.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240819001131.1738806-1-antonb@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240819001131.1738806-1-antonb@tenstorrent.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_045041_437350_04461012 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Anton,

On 19/08/2024 02:11, Anton Blanchard wrote:
> A recent change to gcc flags rv64iv as no longer valid:
>
>     cc1: sorry, unimplemented: Currently the 'V' implementation
>     requires the 'M' extension
>
> and as a result vector support is disabled. Fix this by adding m
> to our toolchain vector detection code.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   arch/riscv/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..939ea7f6a228 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -552,8 +552,8 @@ config RISCV_ISA_SVPBMT
>   config TOOLCHAIN_HAS_V
>   	bool
>   	default y
> -	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> -	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>   	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
>   	depends on AS_HAS_OPTION_ARCH
>   


As Conor noted, we need to backport this to stable releases so here is a 
Fixes tag:

Fixes: fa8e7cce55da ("riscv: Enable Vector code to be built")

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
