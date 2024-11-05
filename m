Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7611ED12676
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcnhRNkJtBwLw5weehiuA9XBlWolICcE5uYeO0Xuu9g=; b=NsGqJTk8IgylSK
	WUAFv3h0L8pWxt8PQdM4D/irJFNRMeA336Jv2Qb529gIHTK+Dujyk41NZZKI62gm7OH2ggSIldBNx
	AxH/YYK8nEI3gvAbWK0dosQHqwy81opfxQ8nNnEqaMZ6SzQcP73LpzA8NWzeaonOn6+KTRMaO3zig
	VKQB1vJxZ0Wl2/dYLcHy4uf4YG+BfRmUOf5vUbl3FvhAGsF7BMqitAfYhFhXYwGyGyP5rPkvSGqF3
	Dsm8fFor5nWEIx3wuckVHJtBPyoT37SXy8a/ps9uVU2rljFkumB086BVBi037Rwfffvvv3fiziqSP
	wgp/UKKRFte8be9XxqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GSV-0000000Gcqc-1MTU;
	Tue, 05 Nov 2024 10:06:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GSS-0000000Gcns-26pX
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 10:06:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 488EFFF802;
	Tue,  5 Nov 2024 10:06:37 +0000 (UTC)
Message-ID: <20db5f94-5606-473c-9c5c-ebb0e4488090@ghiti.fr>
Date: Tue, 5 Nov 2024 11:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] riscv: ptdump: Only show N and MT bits when enabled
 in the kernel
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241102000843.1301099-6-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_020644_704369_DE2B5136 
X-CRM114-Status: GOOD (  18.19  )
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

On 02/11/2024 01:07, Samuel Holland wrote:
> When the Svnapot or Svpbmt extension is not implemented, the
> corresponding page table bits are reserved, and must be zero. There is
> no need to show them in the ptdump output.
>
> When the Kconfig option for an extension is disabled, we assume it is
> not implemented. In that case, the kernel may provide a fallback
> definition for the fields, like how _PAGE_MTMASK is defined on riscv32.
> Using those fallback definitions in ptdump would produce incorrect
> results. To avoid this, hide the fields from the ptdump output.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/mm/ptdump.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 9d5f657a251b..58a7322e9a82 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -135,11 +135,13 @@ struct prot_bits {
>   
>   static const struct prot_bits pte_bits[] = {
>   	{
> -#ifdef CONFIG_64BIT
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>   		.mask = _PAGE_NAPOT,
>   		.set = "N",
>   		.clear = ".",
>   	}, {
> +#endif
> +#ifdef CONFIG_RISCV_ISA_SVPBMT
>   		.mask = _PAGE_MTMASK_SVPBMT,
>   		.set = "MT(%s)",
>   		.clear = "  ..  ",
> @@ -215,7 +217,7 @@ static void dump_prot(struct pg_state *st)
>   		if (val) {
>   			if (pte_bits[i].mask == _PAGE_SOFT)
>   				sprintf(s, pte_bits[i].set, val >> 8);
> -#ifdef CONFIG_64BIT
> +#ifdef CONFIG_RISCV_ISA_SVPBMT
>   			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
>   				if (val == _PAGE_NOCACHE_SVPBMT)
>   					sprintf(s, pte_bits[i].set, "NC");


It makes sense so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
