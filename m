Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A908CD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 04:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5tyJQE8DAseQlWj4wyNum+3SEqn21SMoIraWisdfCc=; b=qJRpcCAB5IyKsC
	tedeM1eS0AKYFI0bH0Tv2FW3TqAf5GspxYUwo1bbaUvstyPczzKXlFK1OrDZGuJLa7W1i8qsjA0nF
	Y5h2yQNhWkwZ9+wLPZj+C+20Qg70x8xWc4mm5HGTiZ9zxW/ksoYCPZOlaJxBzSo3g6uhEBRaRPdl5
	nqB4uJqi4qxnNpkXNdOccr+h/LXnypo8ASxxkjJuMQmkKZGScb3J+FTS7Xd1V2j3u89xbLXQYW4pf
	8swwcvFXEO5yQnKgRKH53UFsBASpr4wbvQOs1aDJ8UJhMzIphMDlzq1lS9Okg2Noezb/TJwyM63Qx
	IqarXLKsARdyvSv+YF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMWK-00000000557-0L5t;
	Fri, 05 Jun 2026 04:51:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMWJ-0000000054z-006A
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 04:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F4E437AE;
	Fri,  5 Jun 2026 04:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358151F00893;
	Fri,  5 Jun 2026 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780635058;
	bh=bU0+VefJghjSWCawddQs9GvsENR8OpQzF3YrEuGB2ZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oYti34+WyeJGUKmpaR3Ve8vo+s9JxQC3+EcMBxPnqxYSWkwo1EtF7Beu2nbaD2Wt9
	 NjG1Zlr/lYKpq9tcVZVOkR7B6euxvzSAN1K1hhdU7JzNRFsW8k8AfcNTZaWczu72ER
	 l8P39+MKmMm1OOAIHam2/PO8YSAmXKQ7DlJAW9x2wm6u6v1oFClqp5aVHtxJyjvFNQ
	 RO5g+Oz/nqWGRF81QJ7+yOBr23KnaR0h79RBxYApVqq+Rm/llso2kYcKhDkqpmTaGw
	 WA1QWS7G6Ncp+gHv9bw6EwSGBRyyWW/0kdubboA8FDKtM/koqN7EkeCV/v8AVUI6k6
	 H3a7l40LzhijA==
Message-ID: <7ffb4a7c-ea74-431a-8be9-1a1d7418b467@kernel.org>
Date: Fri, 5 Jun 2026 14:50:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: thead: enable PCA953X GPIO driver
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>
References: <CGME20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c@eucas1p1.samsung.com>
 <20260603082132.3200787-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/6/26 6:21 pm, Marek Szyprowski wrote:
> Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> LicheePi4a board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 08445df56006..a51a423d53f4 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
>   CONFIG_GPIO_DWAPB=y
>   CONFIG_GPIO_SIFIVE=y
>   CONFIG_GPIO_SPACEMIT_K1=y
> +CONFIG_GPIO_PCA953X=y
> +CONFIG_GPIO_PCA953X_IRQ=y
Does it need to be built-in, or would a module work?

It's not a huge driver (~20KB), but it all adds up.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
