Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FC7CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLACBq0UOaA87pWtMBpPUQXs/9WnTRluPXIRSMyuzio=; b=AnBRPGBUsgkYfV
	YH72K1FeZENlaXK/vTPHPOTNUjyjfse0K8ymUtk07ag3DlPEXu7qWodekynxYUhU2jrDw1AZfSWOf
	c4RzaswFJ3CdEDwqJ3CktfubFl4vgju6UXCExS/awW8K8F4gIPVhx7U3vPElQcpHxCe0m3Jyptb3O
	UAH+XWBluSOexKVB/MX5kULC461u71iD4ghFvOEt10R36+CKln7Z2CkmiBO57kqidQNrKKZ+hXN+Q
	sPVFQBPgfWsz6NIjjoo60oztnG0btlhtIu2zu+C/DLw3UE/fLoVAoV+35K10Sk7rt3oQ51JopoWGL
	8WitY+oP5SSp4bt4bKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitFy-002QZj-2Y;
	Wed, 20 Sep 2023 09:12:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitFv-002QXh-31
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:12:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5907D1BF207;
	Wed, 20 Sep 2023 09:12:14 +0000 (UTC)
Message-ID: <57862c7c-3158-c37b-baae-db6801f4d7e8@ghiti.fr>
Date: Wed, 20 Sep 2023 11:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/3] riscv: Introduce PBMT field to PTDUMP
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, david@redhat.com,
 akpm@linux-foundation.org, alexghiti@rivosinc.com, bjorn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: conor.dooley@microchip.com
References: <20230920035522.3180558-1-peterlin@andestech.com>
 <20230920035522.3180558-2-peterlin@andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230920035522.3180558-2-peterlin@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_021224_107288_3B1CE81D 
X-CRM114-Status: GOOD (  17.53  )
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


On 20/09/2023 05:55, Yu Chien Peter Lin wrote:
> This patch introduces the PBMT field to the PTDUMP, so it can
> display the memory attributes for NC or IO.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2
> - no change
> Changes v2 -> v3
> - Add ".." when PBMT field is clear
> ---
>   arch/riscv/mm/ptdump.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 57a0926c6627..13997cf3fe36 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -135,6 +135,12 @@ struct prot_bits {
>   
>   static const struct prot_bits pte_bits[] = {
>   	{
> +#ifdef CONFIG_64BIT
> +		.mask = _PAGE_MTMASK_SVPBMT,
> +		.set = "MT(%s)",
> +		.clear = "  ..  ",
> +	}, {
> +#endif
>   		.mask = _PAGE_SOFT,
>   		.set = "RSW(%d)",
>   		.clear = "  ..  ",
> @@ -205,6 +211,16 @@ static void dump_prot(struct pg_state *st)
>   		if (val) {
>   			if (pte_bits[i].mask == _PAGE_SOFT)
>   				sprintf(s, pte_bits[i].set, val >> 8);
> +#ifdef CONFIG_64BIT
> +			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
> +				if (val == _PAGE_NOCACHE_SVPBMT)
> +					sprintf(s, pte_bits[i].set, "NC");
> +				else if (val == _PAGE_IO_SVPBMT)
> +					sprintf(s, pte_bits[i].set, "IO");
> +				else
> +					sprintf(s, pte_bits[i].set, "??");
> +			}
> +#endif
>   			else
>   				sprintf(s, "%s", pte_bits[i].set);
>   		} else {


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
