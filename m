Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC38C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqVEMkayRzTUHE93rpNHDJWB1VgkSiGDiSzpdNM/g4c=; b=s0vrhL9RsKTWnY
	Zea4UsQXjChAOOP5NT4vGd0LXHIksE6DtZrY2szT4kZt41baIjAYXw/fIxyNUtwJ3VOnAn+/Bnj5t
	BSjF7j5/pwZnHOyQSmYAT96gY3MRCa6EfAa3iOhtu6p7Q8BfBZA9bpwU8klwLy1slLshBIN3hZNUo
	Kokd4/qNqY+mdAAbedUJEglTyAtdfZkr4XM4ze48jdL1F9ZSsyNQBnNr2KCsmOvP++WFDSfna/GM8
	bgHeitTR3UOwYMONoa4r2gXwzqt5fPJwphCgRkM8GFkhlyH6TXeuOhVCYvV00lDCDvm0C2XZCKpeq
	JWEtYlI+7h2hYQ0eSeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyxU-00000008Um2-45xn;
	Sun, 16 Jun 2024 23:06:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyxR-00000008UlU-2FLI
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 23:06:47 +0000
Date: Sun, 16 Jun 2024 23:06:33 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/9] riscv: add SpacemiT SOC family Kconfig support
Message-ID: <20240616230633.GB3988639@ofsar>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_D935633C42BE1A7BF8C80553B5571C737009@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_D935633C42BE1A7BF8C80553B5571C737009@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_160645_664513_CD5628E2 
X-CRM114-Status: GOOD (  12.39  )
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

On 01:20 Mon 17 Jun     , Yangyu Chen wrote:

> The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
> cores with RISC-V Vector v1.0 support.
> 
> Link: https://www.spacemit.com/en/spacemit-key-stone-2/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index f51bb24bc84c..8a5775586845 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -24,6 +24,11 @@ config ARCH_SOPHGO
>  	help
>  	  This enables support for Sophgo SoC platform hardware.
>  
> +config ARCH_SPACEMIT

should this be SOC_SPACEMIT? as it contradict with patch [9/9]
> +	bool "Sophgo SoCs"
> +	help
> +	  This enables support for SpacemiT SoC platform hardware.
> +
>  config ARCH_STARFIVE
>  	def_bool SOC_STARFIVE
>  
> -- 
> 2.45.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
