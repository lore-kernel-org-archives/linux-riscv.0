Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DFEC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYm1dANdZZg33N7x6HTYLrIGrrPsUettqYtLOJQi3g0=; b=NeOKs8CetyXBih
	glXqFlFFbb4io0h+boNe7w7V/y2fG6scdAnjaJaeuJpKG7iyqaPq3RL23NPW3h97Guoz9KWq9P7Y4
	ZhtlsKeH+hFcu0Qrf8p1x0GCLcQA6xegQmGwBnysYzJpsWA/uYKGZi9gMJe815FY9JxwAvbmW0SzC
	T91SqhHyzE+hYIrzO8dQlQc3tzJlTuLTP3ZShfUm75RFlHlJJA8LJqYnVxnNqsE4FugDxKz/FYJ7h
	6ZzFE3CmL01PMUjsAJnZagEwD1MFYNQY2FJ48Gr7ImE+p7V92vwvJIp2IJ5RZrwwd33lM+X5gK2jW
	y8bJNAoNt+phB4Gi/itQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiXy-005v2w-Ae; Tue, 20 Sep 2022 19:04:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiXv-005v1m-SF
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 19:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 998F16234F;
	Tue, 20 Sep 2022 19:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925CCC433D6;
	Tue, 20 Sep 2022 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663700678;
	bh=kvsruh0WoeblnoHDEdOPPdmKpvzZcvA+fIKhnFGnW9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFw+4qq9ECby9II3tm0Gw5kZAI1itCOsXnI1OY2gs6VInItg7juMnRBLh64Iyv/gt
	 3BAVkL/xZKPYW/OqMoptaVQgnKG4zfEl8ezZe2CCvxh3lMTih6I9U1fVl66e+KtKLZ
	 nr3eLrthAXI2RbKooDp5+TWauVA9BnIiCn+EWT1jS2ogh4eWH+ZpmQeQ+gBM1gr6y8
	 FmJjNwl62tYWu5u2CS0BaABUqPX9YvbaJz27pUjM0u7R5sVd6InfPcpqNNLEzsh/Se
	 4gatbfzw/R4xBalNiuEXKq46oZr8VYO4I8WSj6M0px+au6vKC4t52TbMFQebYYfByO
	 fJd2fZ34gvsKQ==
Date: Tue, 20 Sep 2022 20:04:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 05/10] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig
 option
Message-ID: <YyoOv9Jx+h0JzfX0@spud>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920184904.90495-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_120439_993831_2DBCFBFA 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, Sep 20, 2022 at 07:48:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
> We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3 -> v4
> * Dropped SOC_RENESAS_RZFIVE config option
> * Dropped explicitly selecting SOC_BUS/GPIOLIB/PINCTRL configs
>   under ARCH_RENESAS
> * Updated commit message
> * Dropped RB tag
> * Used riscv instead of RISC-V in subject line
> 
> v2 -> v3
> * Included RB tag from Geert
> 
> v1 -> v2
> * No Change
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..5c420ed55ef9 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -80,4 +80,9 @@ config SOC_CANAAN_K210_DTB_SOURCE
>  
>  endif # SOC_CANAAN

I am not asking for a respin for this since no-one likely cares, but
I think a future goal would be to sort the file alphabetically. I'll
probably do it with the other 30-something patches my Kconfig.socs
rework series has got to now - but if you *are* respinning sorting
alphabetically (ignoring the CANAAN) would reduce future churn.

Thanks,
Conor.

>  
> +config ARCH_RENESAS
> +	bool "Renesas RISC-V SoCs"
> +	help
> +	  This enables support for the RISC-V based Renesas SoCs.
> +
>  endmenu # "SoC selection"
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
