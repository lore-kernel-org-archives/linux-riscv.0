Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB4C79F8C
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPB8omS2rGtDTcg+rsLtaHwUcK5JZ1S6ZTO98Nary2A=; b=UApL0h21F/xfMo
	5Q1h45vRDG9qajnr/cF1SMGWN6eaKiXJq2aRyZS+Urujt51k79LAP/xrQh42rI8RpBDJeHQVcdnpL
	82dZMtzazqiolOpQrtWEx1wYxHGmsoI2+kpD/gThtsyszVJBlY7airic+V8FRidiT6fQUfiFbwKJ5
	bRB/xQOpk3BVu2DGIMMhRCavmFoF9jL47wITR8Z1S/NnwcHsEu0ccTbhJGcml3hPEEpoFnyg17ABX
	8XsXLrW+SAa2B5RETRP0CYYvmOHFB73u9p0RWTWjbP3wh8iLwwtX2KyqpKSZzc5Ntz2fXsT+QKFoD
	U4xwEtWH/Xzzt8jI33Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3LBg-00000005bTn-3dSz;
	Sun, 06 Sep 2026 22:18:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3LBg-00000005bTh-0sK6
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 22:18:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8F504359A;
	Sun,  6 Sep 2026 22:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F29A1F00A3A;
	Sun,  6 Sep 2026 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788733086;
	bh=+7p7btSCYhDSdZs/Bh+9xSEG4TmZ0dUXb7Y2iSuC/5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oos3MjvMWFegc5+grwHGWAK6WQdTR0qM/HCagHgtXJrG7qazW/WRu4bT+HX9k9DVX
	 LvDt8HwIl8A8bNwVlERunhO3BaFtnGLyC2MYFh+wijrurxpihI7StsNBFNA84aW6m0
	 Nusidts+k4Y2gXiq/mUuS8xuaprXHKw2Yig2qij2xRZx2dtLymBgdE+y3r+DiW7LgG
	 AjjhIXlW4xrzC3nj4xJhD/WCC4bEEpIaTAl/oFg99t9mQF+sIFSJRBtxTNt2KRkSzc
	 xIPgb24wi0vLsGRTn3Xg7Sc7lIE065w/NS4GAaX4SXCkjCPbOh4mp5y5y9fjJA7F7x
	 lbC2Smg3KP1DA==
Date: Sun, 6 Sep 2026 22:18:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
Message-ID: <20260906221804-GKB2330@kernel.org>
References: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
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

Hi All,

On 21:29 Sun 06 Sep     , Troy Mitchell wrote:
> Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
> support.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Having an empolyee from the company to help review would be beneficial,
It's an honor, but also means more responsibility, thank you

Acked-by: Yixun Lan <dlan@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..97ca10e2b7b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23589,6 +23589,7 @@ F:	include/linux/mailbox/riscv-rpmi-message.h
>  
>  RISC-V SPACEMIT SoC Support
>  M:	Yixun Lan <dlan@kernel.org>
> +R:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  L:	linux-riscv@lists.infradead.org
>  L:	spacemit@lists.linux.dev
>  S:	Maintained
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260906-spacemit-add-reviewer-7b1660880f58
> 
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
