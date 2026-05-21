Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86723CD5BB4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuVchxOvKH2TL4caaSGOSMR1RCPplw+d4N0nC079RgU=; b=wQOea4TtKQ+3up
	MGJYB/hxW0VGNow7ubfdP7zahrcVu75IhfRrPrEScdHcezwEjD0tlns/rdSIqx9UntVGdexjJm/e6
	I9YgJf0B0QslXV96x2rAJf2tyarVbcTq5B4iq5UngI6CpOGsaDhoKtVF+bqds7uw3swSgLVUVpF9H
	59FqFnoog+I2J+r6b/vwI9o5hWQMu6IWKefFhpBnP1YA2Vq8171HIdj4VWwDnqp/oHC8uG0u0P89f
	TUiFNTQ7bIXr7c4241ecHPoR0GjHBTw4pVS+AeySsw5rRSs2sC1Izkz3r2nlVCHMseCdrgZqwAhQu
	R98JkgQBuYzEDPvnUt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Kf-00000007qw7-0Got;
	Thu, 21 May 2026 13:21:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Ke-00000007qvg-0Ay6
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 13:21:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3848C601F3;
	Thu, 21 May 2026 13:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5191F000E9;
	Thu, 21 May 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369658;
	bh=W4c0w+85Yroc3WjrLcNvUhZ+QTTqOpJpxTVRvh4y9fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AG+k7slSRH0fb4MPPbObLlKFoWufoiyknYcfeA5aehfLmQKE0rl7NLQgSXV0nqo7M
	 InIISPyZQnWZugAHbjZNBdx1pOyO2k6zfxIHgyU4z4Kv9edoX+2hjpgDOFrqIftHuP
	 OwormusB0+lsDvp+u9gBh9mvaBzVHpOBSRsCOEL0+YAQk0/nkhewTum9Z0viQUNPq4
	 j+VpL7rGWyYTCZ7YAWvUc2wlzUhg02yD1Xr7Fl7mwFSP/gPFd7L+UyQRJIFk+jskq7
	 E8/LwB/ddcikUe4QQxh2pgA2qEw3OIMDJp518yd8vK1nJsHejk3NsnT/3txWykxDW7
	 j74Ig931IIcqg==
Date: Thu, 21 May 2026 13:20:56 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter
 device tree
Message-ID: <20260521132056-GKB3727373@kernel.org>
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

Applied all, thanks, please check 
  https://github.com/spacemit-com/linux/tree/dt-for-next

(P.S this series can't be applied cleanly on top of dt branch, so I
resolved it manually which break the "b4 thankyou" command..)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
