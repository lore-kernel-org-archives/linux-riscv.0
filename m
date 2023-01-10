Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B8DC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtn5/MiX7yGN2L/idleg2lCRK3j+F5Sy/zYXb9p+LhM=; b=s5Q1BG6bJFV6Vk
	KqbSCLP9DS4K2J53d3q0M8z36QXRKQ9ImqO4kxsdXr8PIJImbwXiuBWCdoXBCFBl/SHZ17HeE/VCY
	o0rg4tX6iA2OWQ3NcYuz3nHJ7NKmImrircU1Ju5lSZ/vTma0dkpoHwdcsHKvDJiU8NyaBgMJFYJjs
	gcqyslkyQJw+/Imx5OvwrsqMMt0eScmjHuDlzyovlJEItMPwLvGcrgj5ARBX1eIpfLg1OJ7+yOB+g
	CbqGyor7nfgv+2JW3CIb5Szt4Q9A3PVMij5hynl3YYb6qp8W0M7o/KX3UyrEPLeAsyQbSiCszJyAk
	VbZA+pPSxNyCKjdXxrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAvZ-006682-UI; Tue, 10 Jan 2023 09:28:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAvX-00666Q-3p
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 09:28:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ay40so8301524wmb.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=efQ9lXI0mEpe03gYvHlDhOcfBvws8vPR7MGf/CL20FE=;
        b=hgERtYL3zeLGMpvoCeiE0Am60cSojPo5gfn7vpzZO7l3a/YngEZnsXOemiKQV961Rq
         rne8mzaDU5JO+usNitN+mm3+z8eCcEXHY70H9Nu21vDxhqVZ6Z5kuclPDrFoh62XcpRT
         +4gQPOYw7RFN/YKDe4VcgBpNyZGL7x8TYO1w9KlJHIVuaxp8x/mh7Zw8yOurxFJYe3SN
         1DR7zvLAxzPkwiLbT/cS+SKycn0fsm24siuYN9Df4Uto4GXCIm7aiFnu7K7o10Ppr8S+
         4OtAGLC68gIFGozZNyEm7vwSHdoyydmntBR5lT13fS8jjTDuLYznhV9+sX1XD/RRGurp
         XWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efQ9lXI0mEpe03gYvHlDhOcfBvws8vPR7MGf/CL20FE=;
        b=OoRjpkWHJ86Zl1hYJZtw48e0cQkFSsGkurUuT/PTXKqzFFvsf17tYXqmsuIwhkuopS
         0cAu8VkIDDYWNniU0cOH6J/cGP3hx+uHD8rKnopHOGmjn0KvpSdlW4BF/UW/xaBwhb3a
         5oosIwRpuQUmxh8ikwV9sqyaFKVMcfW+y7JqoDl0ayxEv8OamKOya3NRIBzqcJ0X9h1u
         UmDaCjDK5ME8YAnSoaz3ZKotEsfiinY4IKj+WwrEgSgS4nfEHlYaAjUXHhDiBy8i4fi+
         VSFp4KPL0Jemh2ov2mb9PXUpY0d6mC3JW+jkNZ2wQYI1yGEj/sq5fyfJiMsHs7oQj41p
         MfCg==
X-Gm-Message-State: AFqh2kpRHjwB5/zujflxFzzFXkp8auaaeOGaO2PRBUoWGm/hCsboBTrw
	jx2daa9RMYNkEkm6SGUFvf9tiw==
X-Google-Smtp-Source: AMrXdXtVYXNv3CaentoF1Ns/xr/iRE5ico6s7lRkb8sajQaJ7/DntaPI6XZhMx4pp2joQFR1OklMHg==
X-Received: by 2002:a1c:7c14:0:b0:3d1:f74d:4f60 with SMTP id x20-20020a1c7c14000000b003d1f74d4f60mr52386845wmc.22.1673342890605;
        Tue, 10 Jan 2023 01:28:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b003d98f92692fsm15616366wmq.17.2023.01.10.01.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:28:10 -0800 (PST)
Date: Tue, 10 Jan 2023 10:28:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Message-ID: <20230110092809.nvad7vac2liivqs3@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_012815_176864_DB8D43FB 
X-CRM114-Status: GOOD (  23.79  )
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

instruction

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

I think we should add an i++ here. There's not a problem now, since we're
only adding a fixup for jal, not jalr, but we should future-proof this and
there's no reason to revisit an already fixed-up instruction anyway.

>  		}
> +
> +		if (riscv_insn_is_jal(insn)) {
> +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> +
> +			/* don't modify jumps inside the alternative block */

Don't

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

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
