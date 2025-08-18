Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033ECCA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzTFT1aWECEe8sa+MHREFjGZDw+/ON4NeJk23ot4qhc=; b=3+XYyX1hcPLlAT
	qOgLrWLfYVvC/UCXdJ2Btml+wFrlAXMYMaDRm8nsMUNnnci5AiuHwxWeDmh3JYqFePhkEG6PxbH/O
	fiZpiV6Q5fPi+flYn8RObl/VNvh+mW5UGA574u4YzbWGzCCd+C5eUlSXmDOQBro8TujJAJ+dgtHHI
	TahVjYlcB8PlxCziR4eu19Jqko3EdgwKbsVkq2nm2BJLPP5jQ7wNO1YpHoLEApCGnPc3Z8FnJvddr
	w171wWXn8/ZLJaR5bLIoYL8rvNs4V2uarfIUZxwOaMpQvYzT54qdeW91P1ke3KsiIUg9Al84N1O9n
	uGhUq69cQHuvjj9Yy+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpF2-00000006In8-14cs;
	Mon, 18 Aug 2025 02:04:56 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpEz-00000006Ild-3FGR
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 02:04:55 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 6FF9A12FB458;
	Sun, 17 Aug 2025 19:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755482689; bh=vmgf6Iy8E5Y06hvRZJiCIQpCML8yq75/Wn8/BgaN/5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoO947ABqI1/DEJPMNYnCSQHsTMbnmfI1Dw3WxPN60lOd+AfnT95cNlkpGN+hWtpa
	 9FK8YEcEHT/Cu6ofmanL7cwc7FjzGyIAMcAz0+p5uOLAG5kn4KKSofCeSph9hzh52l
	 1qMPUi6k+WeW/DIxRPaF1cYMLvW+32NXSSYflvoFMtsmUPiU2+s9X4GB5xR2vGHBmd
	 CbsPTQiorEseJrrqF5cOBEc7N3D1ahjiG3d/PtBOPn9FQvjTfgQHUA5BZzDetVnSan
	 dMmZdWWCE9PrKwBX4vIR/hwa1K8BGunLCQR+f1ctE+vzMulPIOqtvFP1Aoew3LzTQA
	 xFYiQUUZaVy3g==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LgxnyKFoWQD; Sun, 17 Aug 2025 19:04:47 -0700 (PDT)
Received: from ketchup (unknown [117.171.67.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 4DB0F12FB42D;
	Sun, 17 Aug 2025 19:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755482687; bh=vmgf6Iy8E5Y06hvRZJiCIQpCML8yq75/Wn8/BgaN/5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgVT2PLTL4OMlp9rouNeBHxswTSWdep5o/b02lF0rD+/ILW7rlhHbHW/SogckXhdO
	 D+l4QKgmzWKYVNiMw7q8fAAhjEWMMNyq5RUJKy7NEBk4hh7A0tOD4Hz3j0VBt83NNh
	 wyy24ZW1W13qmwRg8kptJ5+n2+KLnK5P46JCCk1nvz8BoQCYMkjLLyU0VJYLKresRe
	 t2jur8XtTJ2Gee5ziFU5CVtHXX3pBRcqbRWXD7nY6ygMhRawzrbdO0h3aRVj+q+tPI
	 VHvaJmRjtz+yCnB7MC/mVbefU6ZkqFOwMkPk0JzhQpvT7IyXCWp6JhBcruTCyJpNv8
	 C5RI6TTj8dGiA==
Date: Mon, 18 Aug 2025 02:04:39 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 2/4] clk: spacemit: introduce pre-div for ddn clock
Message-ID: <aKKKNynq-w89YeAx@ketchup>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
 <20250811-k1-clk-i2s-generation-v2-2-e4d3ec268b7a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-2-e4d3ec268b7a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_190454_115385_8BEB1E32 
X-CRM114-Status: GOOD (  18.23  )
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

On Mon, Aug 11, 2025 at 10:04:28PM +0800, Troy Mitchell wrote:
> The original DDN operations applied an implicit divide-by-2, which should
> not be a default behavior.
> 
> This patch removes that assumption, letting each clock define its
> actual behavior explicitly.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu_ddn.c | 12 ++++++------
>  drivers/clk/spacemit/ccu_ddn.h |  6 ++++--
>  2 files changed, 10 insertions(+), 8 deletions(-)

The code change looks good to me, but

> diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
> index a52fabe77d62eba16426867a9c13481e72f025c0..4838414a8e8dc04af49d3b8d39280efedbd75616 100644
> --- a/drivers/clk/spacemit/ccu_ddn.h
> +++ b/drivers/clk/spacemit/ccu_ddn.h
> @@ -18,13 +18,14 @@ struct ccu_ddn {
>  	unsigned int num_shift;
>  	unsigned int den_mask;
>  	unsigned int den_shift;
> +	unsigned int pre_div;
>  };
>  
>  #define CCU_DDN_INIT(_name, _parent, _flags) \
>  	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
>  
>  #define CCU_DDN_DEFINE(_name, _parent, _reg_ctrl, _num_shift, _num_width,	\
> -		       _den_shift, _den_width, _flags)				\
> +		       _den_shift, _den_width, _pre_div, _flags)		\

You changed the definition of CCU_DDN_DEFINE without adjusting consumers
of this macro. If I'm correct, this creates a build failure.

>  static struct ccu_ddn _name = {							\
>  	.common = {								\
>  		.reg_ctrl	= _reg_ctrl,					\
> @@ -33,7 +34,8 @@ static struct ccu_ddn _name = {							\
>  	.num_mask	= GENMASK(_num_shift + _num_width - 1, _num_shift),	\
>  	.num_shift	= _num_shift,						\
>  	.den_mask	= GENMASK(_den_shift + _den_width - 1, _den_shift),	\
> -	.den_shift	= _den_shift,					\
> +	.den_shift	= _den_shift,						\
> +	.pre_div	= _pre_div,						\
>  }
>  
>  static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)
> 
> -- 
> 2.50.1
> 

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
