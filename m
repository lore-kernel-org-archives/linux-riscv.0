Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8276FC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ut99LvY95accWuB8CGUJwZfLj1qExlC1He2ljzmaPU=; b=LtQPnL+dABfN8X
	NuhlbpqPv/MAacEw1cxaVg5tbkwJKPI4KdZyq7ff12PJEeWFFR/mcLAQ+Fvz6RP/4kond6NU4uPxb
	2ibVQX5iWR4O2P1FekUMiziN8oHRMuXIo8J2OIiDfa+YNarYB9DPKm1T+GPKPYmRThX3w1zR6d7CI
	c1Z5baxXe61nrDeXSGCitbStFMvBZeqMwRmVNv5KFMc3uZ8C3GJWgEq+NX2ZGwJRbOKIlu1lpsIMJ
	AFaiVKO7kFlMnN5/C7GqrCNNoTyRRJ1QN3ktOy+qL2OswIySav4hAz7CbZZY00RIJGinD5IGEEGxt
	eqJmSSo3oRComxfFyy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuZg-007NNL-2N;
	Thu, 11 May 2023 00:54:28 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuZd-007NMj-2W
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 00:54:27 +0000
Date: Thu, 11 May 2023 08:54:19 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <ZFw8u9uqaRvCEQCI@ofant>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-5-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510204456.57202-5-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_175425_841020_FBC8ECC0 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yangtao:

On 04:44 Thu 11 May     , Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Jisheng:
> I would like to temporarily maintain the T-HEAD RISC-V SoC support.
> 
> Yangtao:
> Wei and me would like to help support and maintain too.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -add Yangtao and Wei
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e..592769efd1d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18155,6 +18155,14 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/riscv/
>  F:	arch/riscv/boot/dts/
>  
> +RISC-V T-HEAD SoC SUPPORT
> +M:	Jisheng Zhang <jszhang@kernel.org>
> +M:	Wei Fu <wefu@redhat.com>
> +M:	Yangtao Li <frank.li@vivo.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	arch/riscv/boot/dts/thead/
> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> -- 
> 2.34.1
> 

Don't get yourself wrong, no objection personally..

But as I saw, none of contributors has affinity with T-Head, so no idea how this will
work well.. always better to take over maintainership after show enough commitment..

Anyway, raise your comments, and I'd more than happy to be proved I'm wrong

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
