Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FBDC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTIHoBYM3aMuzAoKGLfUnlmLUgso0lX1oz/+9yb+QmU=; b=qxkIXXJbTNS5LG
	umBThsFE3wTrsSL4vmHhtKCkhuTI/YCS815CwmY554x5SYHQB5LKHz3zg7ChVjBqupv/IqkPndV6O
	/KXIe1j0z6XdS3963Rpw6E1lipnNi+ApAwDd920SiAyymnq/QgvzgQmZt2c9Qhh+Fjqzb+Bf/jBCg
	AYZC/gR6XcM1jJ/184NcfuPVfy5imzvYbaPD/O+DXcuEd6Ru5tiTBDsZZL12RRRTxRXHKMrT0FIO1
	5FxrZKKfKjswLiaeUpJOA+Wb1+aVEwC5tD8uMWJD24oQ1NnalAwti0Tb4Y7pDZfvKczCWO3xJ9hsZ
	oY1RpQXg40h3g978YYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0AEL-00BfEY-Fe; Tue, 29 Nov 2022 23:41:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0AEI-00BfDl-4M
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:41:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 703FA6195B;
	Tue, 29 Nov 2022 23:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30B1C433D6;
	Tue, 29 Nov 2022 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669765292;
	bh=CYHW8r9qkFUJx7A21syrcjItnEzkH3hKd9ASeVHtBxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWy/QQzylQuzmng5InOcCrgpgdPDRhgwFZsxH+WLFw9xiV2zGlcd0PanHruJx75T4
	 iRVJANHFe7nI1KFRh7EdMdyDG0LS9lOcuYPn1+qHs+xtCWMhvmZllaRcasEp74LTJc
	 z8kyWUwuG2cniPVVbdjnKDDmaNDM4OTlNpm4X3C11tJXGlF1xsYKeQiSW79BnLfdbx
	 U7jN5TIDXloEkpsELhz2hLRSKKVUu5FOAMxG+zuGmYLXx8EfoI4oIWOVGej49zQVOr
	 fw8pEBUeFHITqQ1xtSgF/mzYgqG2Vu44bHXezdDzHB8SAj0sAhm73lcKNH7dg8cTDw
	 KlWxIt7UGTEFA==
Date: Tue, 29 Nov 2022 23:41:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 09/13] RISC-V: add rd reg parsing to parse_asm header
Message-ID: <Y4aYqI5VpaoZmBEr@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-10-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-10-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_154134_232030_B7101541 
X-CRM114-Status: GOOD (  17.93  )
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

On Mon, Nov 28, 2022 at 11:26:28AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> RISC-V: add rd reg parsing to parse_asm header

Same as all these patches, they need the header name fixed up :)

> 
> Add a macro to allow parsing of the rd register from an instruction.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Again, looks to be otherwise the same as what I left an R-b for on v1?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/insn.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 1caed8fe5204..ef4b1c18cbdc 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -60,6 +60,7 @@
>  #define RVG_RS1_OPOFF		15
>  #define RVG_RS2_OPOFF		20
>  #define RVG_RD_OPOFF		7
> +#define RVG_RD_MASK		GENMASK(4, 0)
>  
>  /* The bit field of immediate value in RVC J instruction */
>  #define RVC_J_IMM_SIGN_OPOFF	12
> @@ -244,6 +245,10 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
>  #define RVC_X(X, s, mask) RV_X(X, s, mask)
>  
> +#define RV_EXTRACT_RD_REG(x) \
> +	({typeof(x) x_ = (x); \
> +	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
> +
>  #define RV_EXTRACT_UTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
>  	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
