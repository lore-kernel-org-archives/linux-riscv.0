Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15606C5DF70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MacUHUgKCNX7m+AKeJQkg1bxpzTaiK004QuGCSfSyc=; b=X0Uz6yXwyggmu8
	hsCPJeELQLd4JV2WNbYGs/XzWQ1zKiPOuqTxAmCbfdn0LQYiKwJl/F9vTqups5YanVTletaU5ztFE
	hwAyi8BNDhmCaLm2YRHlLadct9TbJF6ZAQcYlxyCw6QQFx2OcRadyIjA37NoYQuAt+CuQkBUS5MZ4
	tpK4JS4pFrhUePc9MQ2P+xqc6HTNea+bE6ySG3DfB6fwlKvN68VYeWNvCRoqBi0AkfOukmYxlIHhr
	vNya4ghYo1aiIdVvEQh0MKjfcfkCgqobavhkAHrtRaW//g9gFUQNtHNy4TJol56ukfSFTcrjO8buR
	gotTwiBGP/Ewz1T9WH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt34-00000005jeB-1OLJ;
	Mon, 17 Aug 2026 08:50:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt33-00000005jdz-04J1
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 08:50:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99FBB40531;
	Mon, 17 Aug 2026 08:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06281F00A3A;
	Mon, 17 Aug 2026 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956624;
	bh=Uc7aL40On+N+owN43pREKxKVuYx6yh3KMGJHIRHRr+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m7g9ylkHRhKs8rGQtvNnGNQvSsQeDKdhZqNE4JFdCFAh8VV6jL9h5kLUzFYQR/ODB
	 888l22EMeOBNcHMqO+Sf9WbbQ+NLxV1ASriq/bX0DWpcAkaeovMa81dg/ZJzy7WRLh
	 a+nK32Utj3gdApPAzxZhnh8TAP94OzqFXgdo4Uzio8gm0QsV5mhoMLKpknnIA0MRXZ
	 fi6eaYP7dwDDR2QRtULZ8PjaxeD1qkMMhgRPqDp5ieUmvsyRiELMP+c3coUhHkNx6x
	 L/jFD/oUqm+uCD3J9bpHlYpZcFa0ey3HmpKzhaxypNHogF44ZLqBlstSIyMplbpvxd
	 zd/rzOhfyyv6A==
Date: Mon, 17 Aug 2026 08:50:22 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	junhui.liu@pigmoral.tech, stable@vger.kernel.org,
	Guodong Xu <docular.xu@gmail.com>
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
Message-ID: <20260817085022-GKB571540@kernel.org>
References: <20260817033038.2286436-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817033038.2286436-1-guoren@kernel.org>
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

Hi Guo

On 03:30 Mon 17 Aug     , Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
> 
>   riscv,num-guest-ids    = <511>;
> 
> According to the SpacemiT K3 User Manual this values is incorrect
> for the X100 cores:
> 
>  - Advanced Interrupt Architecture (AIA):
>     - M-mode MSI: 512
>     - S-mode MSI: 512
>     - VS-mode MSI: 64
> 
> Therefore, S-mode IMSIC (simsic) needs num-guest-ids = 63.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Cc: stable@vger.kernel.org
> Cc: Guodong Xu <docular.xu@gmail.com>
> Cc: Yixun Lan <dlan@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
> V2:
>  - Drop the riscv,guest-index-bits change for simsic: the property
>    describes the number of guest index bits in the MSI target address,
>    and the per-hart stride on K3 is 0x40000 = 2^(6 + 12), so 6 is
>    correct as is.
>  - Drop the mimsic changes: already fixed by Junhui.
>  - Reword the subject and commit log accordingly.
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
