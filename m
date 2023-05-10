Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B298C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnU2Ml8DlGhnkOZ1UMuDUhfaglm1ro3/petM0Brcvhg=; b=yLt2Nc0negC/JR
	LIdytb0aRxyvwFz356Jycw14xFRgR2u4noYbpYM19V7TTQDs+xt6vEBhukDDxKIu0/ETRdByB6dX6
	PZTw63l22O07oPdvKbuEfPAzlcl9RHj9KhcYnl1kCbArvE3RfQRFDfVQ8yfdgVsXRpCRXQjq57YXm
	6zQFdBSu6YQcAg+Q7heqopnGMuyMD3djoD+L7GPjpSHQgzU2KUL5FbXqTqPg0hdm9rPXUrL+lFXDo
	9OVAnNyEHqJNXcMQQjGRLB3Wy5J7YNk+xDhw5loRAUGOArw169yk6iF+lNeZQtykDeb9DHPssVCSP
	jyvhvJLGCFS94mS5oePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwtZW-007Hix-2z;
	Wed, 10 May 2023 23:50:14 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwtZU-007HhW-0k
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 23:50:13 +0000
Date: Thu, 11 May 2023 07:49:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 1/5] riscv: Add the T-HEAD SoC family Kconfig option
Message-ID: <ZFwtn2amurR-qKuB@ofant>
References: <20230510204456.57202-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510204456.57202-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_165012_302081_D14CD696 
X-CRM114-Status: GOOD (  15.08  )
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

HI Yangtao:

On 04:44 Thu 11 May     , Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> The first SoC in the T-HEAD series is light(a.k.a th1520), containing
> quad T-HEAD C910 cores.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1cf69f958f10..ce10a38dff37 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -41,6 +41,12 @@ config ARCH_SUNXI
>  	  This enables support for Allwinner sun20i platform hardware,
>  	  including boards based on the D1 and D1s SoCs.
>  
> +config ARCH_THEAD
> +	bool "T-HEAD RISC-V SoCs"
> +	select ERRATA_THEAD
> +	help
> +	  This enables support for the RISC-V based T-HEAD SoCs.
This help section is a little bit short.. better to provide more
information about the T-Head's SoC series you want to cover?
> +
>  config ARCH_VIRT
>  	def_bool SOC_VIRT
>  
> -- 
> 2.34.1
> 

It would be great to have a cover letter for this series plus having an overall
history changes

Just curious, so you've taked to Jisheng, to take over this series? and will do
follow-up version bump?

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
