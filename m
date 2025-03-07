Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73196C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS7HoU3AHkpLFdOrnWAkCYquRhwNTMkjvkSoUF7Qz9I=; b=dBnqlo6Lqbzx7d
	zR0uG6TGBlTWQVKl1sFpe4egMBz6aoQd27ldiYC2RbwKAIiPf15XVSTiheQv0rmIHQIj9TRIwQ9To
	+5rrCkqUu6cN/cE65Le/+wzv5KS5lDBVJkX2xP9R5iFKFsS3uHn8xkNolTr6c9wfueyxvFV/A3wv0
	yMQY/NiNV7XH1i4WotlByHn/4FndSakXEjiscWyU8tJt5zBHHfUQ0Yk/J8APkXzlifXuMwJg/DOaO
	4VJJnNyys8dhpea02cGDauj8cqMZaW6Hbingz4kZeCdyH2xdCBIx5Hiaw+XJlhFq9wJFvAxH2C4xd
	Ffyhh44/rdMdK2a21o6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqREj-0000000DJN4-3KT3;
	Fri, 07 Mar 2025 06:31:09 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqREh-0000000DJMj-2RDu
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 06:31:08 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id CAB9DEC59F6;
	Thu, 06 Mar 2025 22:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329066; bh=QbIBN2cYPALHuwk835VmCHT20olGGIRk7Frt+363LtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVUK7HEtvyH9RopctGa+q2nO7DTlF9WKs9Unk0B/X3OxmZNCKihro9qCRi0I9YcnH
	 ITlNedSZ7jknmpMmXoQrI4ahi780ANE2CkTVnKTjhOa9TM6ODAk3gWRst++HUEzg24
	 S9VisYglRLgF5tC7OCH/0blS/kyt6tOo1TculZzVhLaDXRlRp1QMVrOfv5nmCbvjop
	 EHxdf7MNTnEBrVvE/UmpzYDRBolpzh0+27mwGw31eS8ARZDzWvIA57Cv67bkfgdAoE
	 qngjcZJhmbNTNqujtBug4O9cyIdFPxecDa2IjiY2Pd5mmkIzAvPBP2odjyFa21KvW7
	 7VQhHSadBkIyw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcNtAdR40R4T; Thu,  6 Mar 2025 22:31:05 -0800 (PST)
Received: from ketchup (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 50050EC59F2;
	Thu, 06 Mar 2025 22:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329065; bh=QbIBN2cYPALHuwk835VmCHT20olGGIRk7Frt+363LtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USo9iDYeupLGfhOfG/Enc2OxgvBUZCQztffyffTK/ZZWiDR6ERox6qdaCVLQxQ7ny
	 ufyGH5rczv27cihJuHg8bn2M7trtL6rFmNQa6IDC3KNx+1oYctVoopbX/d+xBAA8qv
	 WqyRNcsDKDFiTPtt1JNfWL+GrnN2uJCTNCQPNX1b2S5uAhqvfWqx3aD3XLlfHMWP97
	 f3Qo3zvh7TxenaWjGW/GHop8gR7sCZ0GHfvn/yUBE/VDqODpp54/2uKsg83O8OX0Qj
	 aFH2aE4AcgAinbPoe++nkM5mPfBSo2tNntRcsFLnjd7Tdr6mDezcR58MEL4QX5I24f
	 0fRroYRc+Dbxw==
Date: Fri, 7 Mar 2025 06:30:52 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 4/5] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
Message-ID: <Z8qSnBc4dmR3ftOz@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-6-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-6-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_223107_652591_BFE6445B 
X-CRM114-Status: GOOD (  18.88  )
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

On Thu, Mar 06, 2025 at 05:57:50PM +0000, Haylen Chu wrote:
> The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> selection bits, reset assertion bit and enable bits for function and bus
> clocks. It has a quirk that reading always results in zero.
> 
> As a workaround, let's hardcode the mux value as zero to select
> pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> is combined from the real bus and function clocks to avoid the
> write-only register being shared between two clk_hws, in which case
> updates of one clk_hw zero the other's bits.
> 
> With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> controller could be brought up, which is essential for boards attaching
> power-management chips to it.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 5974a0a1b5f6..44db48ae7131 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -558,6 +558,10 @@ static CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents,
>  			   APBC_TWSI7_CLK_RST,
>  			   4, 3, BIT(1),
>  			   0);
> +static CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5),
> +		       APBC_TWSI8_CLK_RST,
> +		       BIT(1) | BIT(0),
> +		       0);
>  
>  static const struct clk_parent_data timer_parents[] = {
>  	CCU_PARENT_HW(pll1_d192_12p8),
> @@ -795,6 +799,8 @@ static CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk),
>  		       APBC_TWSI7_CLK_RST,
>  		       BIT(0),
>  		       0);
> +static CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk),
> +			 1, 1);
>  
>  static CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk),
>  		       APBC_TIMERS1_CLK_RST,
> -- 
> 2.48.1
> 

Oops, I don't split out the twsi8-related definitions completely from
PATCH 3, causing building errors with only PATCH 3 applied. Will fix it
in the next version.

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
