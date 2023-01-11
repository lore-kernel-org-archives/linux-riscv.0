Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5DC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLq3wALDhfNJzoIJt8GeD4pMFdq9HSmKeoMQURJJ9fw=; b=d5lGqRqmDrUmaz
	KhZe6jfUpWZlXVQcKvQEBbLcVCqNZpSkuWSf/4xxmK0T0rwCejJCBescfPw8h/5VFbmYWWNy+ah2U
	vq3VkjL0jamJbUjMBKQF8WcRim4Hh7wuYwsaB5fbvMlWcw3EPdzrOX+oURFgt3ozBnrgvujGnPZMC
	4B5lZo26IjQrc58+ntjU+Tn57bCboxjboNK7b1Vxyl0E1KQZHhTe/SvUlG0xRM0yNZLWdtiFVUIRZ
	UmzND6XYpCDm15X3yZpQqJM4/3xGCMuZJv9+gtgwQrVKoE4V0goNBd58QNe8yfBGIqSy1rOBrQ+AX
	PHQz7rWLWHo1E6ZjpYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFb9j-00BZ3H-Ua; Wed, 11 Jan 2023 13:28:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFb9h-00BZ0I-3a
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:28:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D50C6B81BDB;
	Wed, 11 Jan 2023 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BF2C433D2;
	Wed, 11 Jan 2023 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673443711;
	bh=j9zNO6W7KDLQBuu896go7rw+1NxuoTmpdt9rUa0akAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JU4a9R9MuhE1JFZpR6FdbfCv/qgEeodLCXGvVXcIQLZFTMOJs3zn+GL2rodqhiRcX
	 qWMB9KtdufnEuFzXJ4GX4MGlFXbKe4UkFjFLRbmLBTP1bzNQ/sJwDxxAIAKbbJd7qf
	 wotEFDG7eG15uM9G1QIqYeF0x5W3Gh1it0AmTy25bA9K9v2EfOgV02k18hBNS+AjuT
	 bfRu1min7qCu/oIeSuphEwpODx2+fClTwGEGcry/FzSIo7ITnOSwEucqa5l56Ji9bD
	 2DwgfVHalUSW3OyXU95Fme9Vlxf0styxoSQVkt6om419/55v3Yjq9NPlKLyRyU11wK
	 Xa7UGw2Z5Tjig==
Date: Wed, 11 Jan 2023 21:18:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Message-ID: <Y763FrvFkrNGkIDN@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_052837_315663_4777BC41 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Jan 09, 2023 at 07:17:53PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Alternatives live in a different section, so addresses used by jal
> instructions will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.

I already submitted this in a month ago.
https://lore.kernel.org/linux-riscv/20221204174632.3677-2-jszhang@kernel.org/

> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/alternative.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 6212ea0eed72..985c284fe9f4 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -79,6 +79,21 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
>  	patch_text_nosync(ptr, call, sizeof(u32) * 2);
>  }
>  
> +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> +{
> +	s32 imm;
> +
> +	/* get and adjust new target address */
> +	imm = riscv_insn_extract_jtype_imm(jal_insn);
> +	imm -= patch_offset;
> +
> +	/* update instructions */
> +	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> +
> +	/* patch the call place again */
> +	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> +}
> +
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  				      int patch_offset)
>  {
> @@ -106,6 +121,18 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
>  							 insn, insn2, patch_offset);
>  		}
> +
> +		if (riscv_insn_is_jal(insn)) {
> +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> +
> +			/* don't modify jumps inside the alternative block */
> +			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&
> +			    (alt_ptr + i * sizeof(u32) + imm) < (alt_ptr + len))
> +				continue;
> +
> +			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> +						  insn, patch_offset);
> +		}
>  	}
>  }
>  
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
