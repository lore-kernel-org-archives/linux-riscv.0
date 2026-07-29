Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8B0C54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WljmNk9pp4eZjQd/C6nqtuZjsJ+uYoEAEc/KUK91KN8=; b=GJQhVL89NY0GWm
	MyfbWwns0MVZcy6/2ZcivEoMUQIro9JR6+iAAzZFvYOdKzTrZpj1P8bPOH93H/v5HWIFVSrXySsvi
	uLhl9/pVrro35Sy3Oe5v5ovzNzSk1ZouCGgIFF/1qL5hxoWVLU9gfZU+ff5EpBeJYR/tzpdzpIZse
	ALKl7G7zQf1UAlZMRG6d1Gfc9Kc3nrIKuOX3/LzwV64aBSaxRCg83IJavBn/y4aBvn0Ci9E7uSk8E
	wPvT4Ht8WnAx9/YdXgtmpLGl+Fl6Tp9mFde2khNGP03yhq9BooecFWt91AmHZnP4vMxvQ/eDcwnLU
	LbyMkCDyQiWteso3wNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotA5-00000006bfL-2tSk;
	Wed, 29 Jul 2026 01:32:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotA4-00000006bey-0wBD
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:32:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6955960A5F;
	Wed, 29 Jul 2026 01:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2111F000E9;
	Wed, 29 Jul 2026 01:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288763;
	bh=7/1vNgc73oUJAQ9jeWlv9XTN22Njv2ujKAJbi0E3Hk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TaclXzUZou33aqg/wC8VycBxFb0v1++NW2j22jqfztgGfvviNA2C5oxwUUS48cLYy
	 F+qX0ueL/t8YJdbqIqFMM1flg5doJxB6RGHkx040aw9jqtQcyn18VExJLi1tvqV0Z3
	 VHUZRcg8mIHSewhNMttx2L3Twlj1X42+BQ14HPWmH773FdB3j0lpPiht7twWYC3ksw
	 vtIqvBxRyIDLK66jrkPwNT0Ebt6AiJD3rrc0dhMVseOJ7ytjJmBbTmFsRIu/Yajtyc
	 yvBfdw2atuJAgcm0NMPYASFWwBAib6iIkgLGWnAfgxNEnA1FLJXduEYn3Z0JqxYxvz
	 VhUJhIMMLUhKA==
Date: Wed, 29 Jul 2026 01:32:40 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729013240-GKF76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728211020.1248676-1-aurelien@aurel32.net>
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

On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> This series adds cpu scaling support for the Milk-V Jupiter boards.
> 
> The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> 
> The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> the common part, i.e. everything but the model name and the operating
> point tables, in a shared DTSI file. This file is then included for both
> K1 and M1 variants.
> 
> CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> 
Looks good to me, will queue for v7.3, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Aurelien Jarno (3):
>   riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
>   riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
>     boards
>   riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
> 
>  arch/riscv/boot/dts/spacemit/Makefile         |   1 +
>  .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 469 ++++++++++++++++++
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 433 +---------------
>  .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  11 +
>  arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
>  5 files changed, 601 insertions(+), 430 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
>  create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
>  create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi
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
