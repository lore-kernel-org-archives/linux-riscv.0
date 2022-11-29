Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD92C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbEftyZgYXs0AlLPv4HPLSSMX4H20a0+ELsX8AwJH4E=; b=TUbuhnPOJD1V8v
	Py41BOHEe1lv8P0vCIsXWtZd2O0kyVibQDhNs+Hh3dF4PfnGWRUL/fQKGNI6aUi3Co4UvTJ6orGis
	IpV5k9TZd3M6Cr9IJz7+0dXudlXldJjz7SzJLTJe6M3A9GnKOh2qoHYTIIDDmUxEsarfqwfk4RTdQ
	0hCqit9EPeDfmW48CtYyTRlbV2J7chwLOtxsONn1UftSu7wVoVYS5nd3cXDmsuQzG0lnw9uCV5csF
	iIv/lPILIyhQ0+gpSTPCg/qsVO3JkVAXZG7XvsrXrSh94G57sL4hL6IxMjqASQnGlb7FK16sq1e+5
	NsxrkeTwnioDCcNW3gbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ABV-00Betu-9M; Tue, 29 Nov 2022 23:38:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ABS-00BetI-6Q
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:38:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B41A461959;
	Tue, 29 Nov 2022 23:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406DEC433C1;
	Tue, 29 Nov 2022 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669765117;
	bh=FrUnOt6YtDF3ZynBcgqOSbbRuepdptZM0S8LSrFnWPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5yxmKscUaY/EAPBBqr++3BJNe9S+z74nwPnZNHFHkmhXezxHIqmBZAm/+NaVOrmz
	 0aTu3XfYj0YKGMs1OEeF3J2hLRJyi1lK9onC3QNWNmcFeWYrRVDqugHcHlpcUWpwGM
	 C3KRpxYdvX4TjVEBbs5vDrUYfOSeTQyuUVwoofr7KhRSkz1OPJwHoaH/zbDTA6IgUU
	 DneNYgrwfwrUpfsbKNtvSQwKCNcqgs0VBVI6yGHlEQof3sb36yEHVg9KSkRUytVayj
	 JX2t3B5thVInr5TqP6vr8VNGA0oHffh5M4ky+e7meBpnjwA3rDHUTapLF1kL9Y0tr6
	 LowRUICSXo+uA==
Date: Tue, 29 Nov 2022 23:38:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 08/13] RISC-V: add U-type imm parsing to parse_asm
 header
Message-ID: <Y4aX+KJ8sC2XRO1E@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-9-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-9-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_153838_293276_EC3D1286 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, Nov 28, 2022 at 11:26:27AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> RISC-V: add U-type imm parsing to parse_asm header

Ditto.

> Similar to other existing types, allow extracting the immediate
> for a U-type instruction.
> 
> U-type immediates are special in that regard, that the value
> in the instruction in bits [31:12] already represents the same
> bits of the immediate, so no shifting is required.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

How is this different to the patch I left an R-b for on v1?
It doesn't look different, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
?

> ---
>  arch/riscv/include/asm/insn.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index f10cb0fdfa96..1caed8fe5204 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -34,6 +34,15 @@
>  #define RV_J_IMM_11_MASK	GENMASK(0, 0)
>  #define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
>  
> +/*
> + * U-type IMMs contain the upper 20bits [31:20] of an immediate with
> + * the rest filled in by zeros, so no shifting required. Similarly,
> + * bit31 contains the signed state, so no sign extension necessary.
> + */
> +#define RV_U_IMM_SIGN_OPOFF	31
> +#define RV_U_IMM_31_12_OPOFF	0
> +#define RV_U_IMM_31_12_MASK	GENMASK(31, 12)
> +
>  /* The bit field of immediate value in B-type instruction */
>  #define RV_B_IMM_SIGN_OPOFF	31
>  #define RV_B_IMM_10_5_OPOFF	25
> @@ -235,6 +244,10 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
>  #define RVC_X(X, s, mask) RV_X(X, s, mask)
>  
> +#define RV_EXTRACT_UTYPE_IMM(x) \
> +	({typeof(x) x_ = (x); \
> +	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
> +
>  #define RV_EXTRACT_JTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
>  	(RV_X(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
