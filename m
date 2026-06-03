Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE128CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 19:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVnjSgtOvFNfEpgsKD+MK3X+natY149CckmSgNBlELM=; b=YWgLdswPXjISWY
	+ozJbLfRsg2Q/OrMIcWoK8pZnK/aCXUaZUORW0Io0bZ4qqekpvlZkIk9XewF87pi9kAM3xqQrFteM
	aKIsqL6Dci7JUlUbeAeyePNXWrKZDuNTxzACQoeDLRmqbx8Ls6GLMlF/KrlemJk7+OJVnxMdO5V8d
	Y1aqYwrlJjp0PSCxPRYIk5yIk0wfZQWOl36k9OL2ghB09JM3dWIo2awC80RSeAmXpPB/6qHwNMLHf
	fDcCcnXT9w4vOSORVPScWTc2HXw39lkElnFS37YK0azk/a1ohcq02vqHUorA/+OCD0hiGgpGyxHHm
	IxzqAGTeRpz2N2i4RTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrQm-0000000FlXj-1hXs;
	Wed, 03 Jun 2026 19:39:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrQl-0000000FlXX-0plK
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 19:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 397E460142;
	Wed,  3 Jun 2026 19:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8B21F00893;
	Wed,  3 Jun 2026 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780515549;
	bh=EzB2IsBdNRu0of+pThM80jRxM4rNsXXG9AzhcclpjqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WbO2IHsU6s+khrUH5yy+yV+hwelFLhuLbx5AArrdTpiUQYEa26coaopE9rbpw5bbH
	 3SEq3YYB51R983jNZjL/jVFMCOdssKI/ta2JiSn8Q3Het2y2OHnfjMYd+aXaJy8dTJ
	 VnxNy2ipGBxkL7sl/VGWH8l+UojJNAPVuT31tGs0yP4Ka0w4yr9plBKPsM/QOGVvbP
	 q59OZDwnvRp/kl9/4vGN+32WCeTZRyDAOF3K923naFgoFJWSd2i8Jpq5sQY3GCZqib
	 LSwDrNcCPqo/N3kM/3tsr2OJ2uSeo9e1DmkbbvzA0oyBxj6xOJW/gvfBBa3zJHpkQV
	 dBp9OYr/mu6oQ==
Date: Wed, 3 Jun 2026 12:39:07 -0700
From: Drew Fustini <fustini@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <aiCC21nUsYIp1l3M@gen8>
References: <CGME20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c@eucas1p1.samsung.com>
 <20260603082132.3200787-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603082132.3200787-1-m.szyprowski@samsung.com>
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

On Wed, Jun 03, 2026 at 10:21:32AM +0200, Marek Szyprowski wrote:
> Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> LicheePi4a board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 08445df56006..a51a423d53f4 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_SIFIVE=y
>  CONFIG_GPIO_SPACEMIT_K1=y
> +CONFIG_GPIO_PCA953X=y
> +CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_POWER_RESET_GPIO_RESTART=y
>  CONFIG_SENSORS_SFCTEMP=m
>  CONFIG_CPU_THERMAL=y
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <fustini@kernel.org>

Paul/Conor: what is the right tree for a arch/riscv/configs/defconfig
patch like this?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
