Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE9CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/WvNNiuPCTsMKzRDarT3a8ceVeYac2z8JwsoJGC4kY=; b=0UnwBfORclbHM/
	Mtn4LrBR1sqJn1ORMRoczXbM4jqYzCSG9PBeqPTvurSidL4Df8EToWwIMWC3eknoGXe+GFGa8IScQ
	IF4/zL/FCafHcvW+rY30Mha4MKFqWHOJe8HhqNe/b/ijPX5IU+fIwiellNd55Kf8UeTEaUGbYxjA3
	bb+DnkcUwig0Bm8+JrvzezlezRT6i5qkYqr2xMIcuMxR3fvh+GUSZgU6dpObcP2SUNw/URio9NpCh
	QdKJHiA6SEpymr9I2zojbwj8086GMfH6Th2sSkSl+vuevikSXK+1LtgBhf9lY432hzQz7hxSmnejM
	QERr0TY7V77QUCR3Fhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8Em-000000088At-3sD3;
	Fri, 24 Oct 2025 03:13:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8Ek-000000088AU-31Yd
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E4044966;
	Fri, 24 Oct 2025 03:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAF8C4CEE7;
	Fri, 24 Oct 2025 03:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761275584;
	bh=cYnEgn9OhkqDcAc8AyEd+1mKzhq8sWdJmpMcwyA23tU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LLSID/LSn36+uNSqbF+etSdj3DgGymlBU64pmDeXu2cNhKiIV3hYFi8nIo2qpOK1j
	 xuhjB/5V6hxsCG4gUEVtB5siXohlxg2lvcU0r0n5rE6oeBx++Ad6AG8GZwC60PW0lB
	 MUOXXJwSLm8T1pxzh+uf5hiQAjOwi+JkTFlQpqcLK5b37uEiV5WEFPpr7kCv3M20R4
	 DNpCMFxtlLdhBsQ1t2FOZL2NNptuR6cKuUMNwFI6hcKqweJ7YrUdvvwTIGROCnH34x
	 Z5EKGHcIF4jIfnG0MJq5uRPF+HFm3Xu62we93M8gU+LaxgxueCOMMFhAHg7XybvaHP
	 jGHC4rCWw6Eyw==
Date: Thu, 23 Oct 2025 21:12:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, ajones@ventanamicro.com, macro@orcam.me.uk
Subject: Re: [PATCH v2] riscv: asm: use .insn for making custom
 instructioons
In-Reply-To: <20251023174040.1037765-1-ben.dooks@codethink.co.uk>
Message-ID: <f9dba0cc-50d7-5960-91dc-e7e3496387e0@kernel.org>
References: <20251023174040.1037765-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_201306_870910_A89A866D 
X-CRM114-Status: GOOD (  17.35  )
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

Hi Ben,

On Thu, 23 Oct 2025, Ben Dooks wrote:

> The assembler has .insn for building custom instructions
> now, so remove the .4byte which also ensures the output
> is marked as an instruction and not as data (which may
> confuse both debuggers and anything else that relies on
> this sort of marking)
> 
> Add an ASM_INSN_I() wrapper in asm.h to allow the selecting
> of how this is output so older assemblers are still good.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
>   - fixed #ifndef v #ifdef
>   - added custom MIPS instructions too
>   -
> ---
>  arch/riscv/include/asm/asm.h                    | 6 ++++++
>  arch/riscv/include/asm/insn-def.h               | 8 ++++----
>  arch/riscv/include/asm/vendor_extensions/mips.h | 6 +++---
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 

[ ... ]

> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index c9cfcea52cbb..a7860e6b908d 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -256,10 +256,10 @@
>  	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
>  	       SIMM12((offset) & 0xfe0), RS1(base))
>  
> -#define RISCV_PAUSE	".4byte 0x100000f"
> -#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
> -#define ZAWRS_WRS_STO	".4byte 0x01d00073"
> -#define RISCV_NOP4	".4byte 0x00000013"
> +#define RISCV_PAUSE	ASM_INSN_I("0x100000f")
> +#define ZAWRS_WRS_NTO	ASM_INSN_I("0x00d00073")
> +#define ZAWRS_WRS_STO	ASM_INSN_I("0x01d00073")
> +#define RISCV_NOP4	ASM_INSN(_U"0x00000013")

This looks garbled.  Is this intentional?

>  #define RISCV_INSN_NOP4	_AC(0x00000013, U)
>  
> diff --git a/arch/riscv/include/asm/vendor_extensions/mips.h b/arch/riscv/include/asm/vendor_extensions/mips.h
> index ea8ca747d691..bcdce3ef3869 100644
> --- a/arch/riscv/include/asm/vendor_extensions/mips.h
> +++ b/arch/riscv/include/asm/vendor_extensions/mips.h
> @@ -30,8 +30,8 @@ extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
>   * allowing any subsequent instructions to fetch.
>   */
>  
> -#define MIPS_PAUSE	".4byte 0x00501013\n\t"
> -#define MIPS_EHB	".4byte 0x00301013\n\t"
> -#define MIPS_IHB	".4byte 0x00101013\n\t"
> +#define MIPS_PAUSE	ASM_INSN_I("0x00501013\n\t")
> +#define MIPS_EHB	ASM_INSN_I(".4byte 0x00301013\n\t")
> +#define MIPS_IHB	ASM_INSN_I(".4byte 0x00101013\n\t")

Same for the above two lines?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
