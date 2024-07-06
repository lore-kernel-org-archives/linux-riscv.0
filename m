Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84AC3271E
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2y/0b9vhv8biXq/X9RqjQx7eJga6yrjw8V94len8Rxc=; b=Nq4PCNlwrX2b8u
	ZtBnLXMEcf4i8mvPjlsbm2rjAK1sTF/LeXtGMpagg9tAe+KuDSPn9uXrcPx/vRRfAobpMdBd08i1u
	7bdSAAgrE80v6Fqg7BoDCAfuc56lhN+DGKemBvfIrgYzCHgJoEn1gkJY208dvT1+gtQl/tnh/hfKZ
	GdVv3EZuf9lg7WuOuowl5Iix7qSU82lKfdaunghFaO7p+5bvOQeio5kGSv2/wc1vCBNSdFqVl1lXO
	6nQtiPzaUlf+s1iI9o5NcRG0RRpcL72cgpCD18J1FFtRyJS1qh/hLJrrs25xjr4RVioTyA9Cq6PVR
	vJxitlzNSTlMD6DoSzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtqk-0000000H5wp-0S7l;
	Sat, 06 Jul 2024 01:04:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtqh-0000000H5vO-01SA
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 01:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 572DC62CFE;
	Sat,  6 Jul 2024 01:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA81FC116B1;
	Sat,  6 Jul 2024 01:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720227862;
	bh=1VaEWo6PugNMlQB4WbArRAI3mDoDE2X6SITcDlMPHWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1kTf4ozGXtICJCRVaBLk/EyqTLd0Q//xdIFcpcTRcr3NVYfnUvx3LEs5nV23GN+H
	 k2bUsyJuCZ+l4l8y0zvDRMLycQ9+hvgiJ/RC8qQKv6k+wsJ9OsghvhGCX9CCJtrUKV
	 Gv7/bIJVSIQ0admoUICk7sA+h5p63S4s5k85YznjJgbWDYkKM6KWyPl17Frv8YbWvs
	 +90zyL+TKyqjB8621uMpbewxlKx91wbMkVWJItovKH0VDUfHJC5t+teiL4MY90YSeu
	 ZEPxIK/gS1hmIissh/wsFVf1fuUZgbJkyPLJlvJITM/jh2dnozlTnocgcugnpAatnQ
	 IXalWU/hdvCuA==
Date: Sat, 6 Jul 2024 08:50:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: define ILLEGAL_POINTER_VALUE for 64bit
Message-ID: <ZoiUwsFIHcteBSms@xhacker>
References: <20240705170210.3236-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705170210.3236-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_180423_112474_E1E35A47 
X-CRM114-Status: GOOD (  15.05  )
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

On Sat, Jul 06, 2024 at 01:02:10AM +0800, Jisheng Zhang wrote:
> This is used in poison.h for poison pointer offset. Based on current
> SV39, SV48 and SV57 vm layout, 0xdead000000000000 is a proper value
> that is not mappable, this can avoid potentially turning an oops to
> an expolit.

Maybe I also need to cc stable? This is a secure hole fix patch.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> Since v1:
>  - fix typo:s/SV59/SV57
> 
>  arch/riscv/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c51b32a8ddff..c992eabbd002 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -313,6 +313,11 @@ config GENERIC_HWEIGHT
>  config FIX_EARLYCON_MEM
>  	def_bool MMU
>  
> +config ILLEGAL_POINTER_VALUE
> +	hex
> +	default 0 if 32BIT
> +	default 0xdead000000000000 if 64BIT
> +
>  config PGTABLE_LEVELS
>  	int
>  	default 5 if 64BIT
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
