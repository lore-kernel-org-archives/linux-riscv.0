Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E760CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffzUBzVSDgHsRaicsTJj/F5dvDpzYpAt7ziKBkRUszI=; b=El18iW2P1863IO
	5U1WmZvIogxqKXGbLV7T8OAvO5GRZcC7PJTXXb0jxMN0IauNOdDlFX4Eq6htk6Z9qaHreTjJaCc5I
	Tdl0fVsv9HsRj06WCWNJrvZYP31m2Gn5wVLRaG9Z2+L42UV6Guf2adWTex4w3QskM/oEU5JA5vFuK
	wnCygzK4R6q90zj158vjyS2bQETyJ4wsfgxwgCWEneDeSfqwt+5UvkN0UEw95p7GsXD2OCAJ1FB25
	9ajeQjW7A9zbpFKBbIG+InfUInHiPqhcVtrgdK2IdZelDuMFKJJLuiCYxu5lynHHqHJp3ZXgEUSuG
	hFoc4hjzxdP9EKP/9x0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcB4-00000003wXv-2H6t;
	Wed, 20 May 2026 08:21:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcB3-00000003wXb-1Q0c
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 08:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77289600CB;
	Wed, 20 May 2026 08:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20691F000E9;
	Wed, 20 May 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779265276;
	bh=Po3Z5+mOkTPLwxcG4O1YIvwMOZN8HACWf+P1iZYwYdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UUbvHMcyacHh2278Tx93WTf0EVpJu0QoLk3ddNYshHlawJfwzsM3vKUKzCEp6oYAE
	 Qa39lSKeUiQuAYbWRx+GEwwPbRH2OjBJelDAF9P+gBQRgIAUSGDSGCN2WPxGLLbYM3
	 2Atlx5f8tObEi0xhjyk4WaU8acipCKE0pTsPk2d2P9Q8WFbdq1/2lSQ3e4VzzT8qrz
	 G7IiRS3hFIPpMiA9BMSXV0w+3Zbycx7OG7JcWrSqdbkcPayn+/pywkfA3N3mhH64UC
	 Ym4IqA/eatExsTRQVzbEXA/MWeB7LqioV8TAd4NERCajtoeHrsRgDFetSflx3dhbj5
	 Y0NanhEn3GEcQ==
Date: Wed, 20 May 2026 08:21:12 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter
 device tree
Message-ID: <20260520082112-GKA3717228@kernel.org>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
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

Hi Aurelien, 

On 06:12 Tue 19 May     , Aurelien Jarno wrote:
> This patchset updates the Milk-V Jupiter device tree to align with the
> changes recently done for other SpacemiT K1 based boards, including
> enabling SD card support.
> 
> Changes in v2:
> - Rebase on linux-next, which includes the SD card support series for
>   the K1 SoC
> - Mark the eMMC as non-removable
> - Add patch to fix uboot partition offset
> - Link to v1: https://lore.kernel.org/linux-riscv/20260514160356.1642075-1-aurelien@aurel32.net/
> 
Looks good to me, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Aurelien Jarno (5):
>   riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
>   riscv: dts: spacemit: sort aliases on Milk-V Jupiter
>   riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
>   riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
>   riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter
> 
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
