Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7CFA3758
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pfp1WHcRNaYGGC6RHMrKQCp9QOTzHk3ffisI9vKQQxo=; b=PQB64bPApVMgdW
	SrJS7tzxhAqgIeFwfH4goTCHr4Dli2TV4rwJufv5CjPrzbCoQIquVUkgZEGT2l39dk7CM/FeEvQ/m
	tBZFtzVrxKzYGsInDkM3UbBB/0/3iccA6BnzZ8nlkvVeNvpLcJJR5GvZJJ9QpIJIs8EsogdtEDIgo
	Z3HK940pilZwC4ABckI9pr2GDL9tpKVrRhS68XySTNX/1FoZdG2LSJeywGcTBDq8l1peJAz/pU9jk
	XxfCgiuNEy/hOXa3HlvzHme8RCZfCJexS/8jbfHlIWtTeBUlrrGje3RYeGSB2wlkxO+ddPJEiDzn+
	Y+3KvIdJp7+FO+hPDWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqoSZ-00000007a3O-2b88;
	Wed, 18 Sep 2024 06:46:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqoSA-00000007a2E-1h3Q
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 06:46:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a7a81bd549eso768510966b.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 23:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726641976; x=1727246776; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9jyaeiIinZNttzIHR6Qx8fod17PkNkLP2EMDotjvPw=;
        b=Gas+xSxNQwm9fmJoAbwAFPWRU3l3VXIoMiVVRZRRu+KHMaGsW7ORuKEfV3rDNVkHV7
         yBWoJf0uJTaGYTiU73iBm+4yg0D13h99GxH0g3acXeo2q4IF/3lSrs2RX63EYjRD1zYc
         g7ecG0BN9kKmZOqi/YYHl5IuGr+22Yf7QS+thkll58FJp+YsbSVreFonkKazyxxbEEnC
         1jlI8aMMpo5U8RKWxDL1320QLWhaE3qK0vBlNf62eJGEZMLSVJYUMZqCNsqM6EKcAtYW
         RNhOsOlWNryajUW6g71Ymsc/yLuP9EgahODCoz6poEhlaIzicRuBiKlB/uQU11zz8ibF
         8Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726641976; x=1727246776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9jyaeiIinZNttzIHR6Qx8fod17PkNkLP2EMDotjvPw=;
        b=e3wlyvf0XFS+z4GRtE6ry8rupsJhvbLdqYHtRWD3yAhDhec2chGk0S44WigVcjBxay
         //sai14sW47eOM6umZNazJHTOgHy5IpNOy3dt29BtGFIFtBT/vx22KkWVw7DJXmPyV1K
         DJoKeekoBTdRsRfUB5edYcJ0IXkyRqlrHd1oHZ2B4ArBFWeM9121Olg9+IZUMdjEcv5u
         caG0hoDTrO6oM8f3rp8VFnr5GAZa3c7t2IO7MKUjOibUX+e91/s8K06RwNo3XdTDiKg/
         AkZJgi23ZDi7m7QR3Ahl7EDzoSu1kQElrP4McydkBquKi+LHrCT6/RLT/5K0YlrcY8Ul
         K+2g==
X-Gm-Message-State: AOJu0YzRDvLUyHfyEkocziptOSzm050pTilwO77ibK3QndVAQLrs+jGH
	49PHdd7a2YMnxvYrGj6XJ7l7RDnmg6xHNNGLruRNUBOC2b4hlZeMOuI5536/tIoELMOWi12zove
	R
X-Google-Smtp-Source: AGHT+IEatDvlPcocBy9FXk4yAitfgkZ6DStIDw/UZ5DXxkWPsywPsD4aAxD5oIAmLntLCsVaSVgbdg==
X-Received: by 2002:a17:907:e6a2:b0:a8d:64af:dc4c with SMTP id a640c23a62f3a-a9029505570mr2291921666b.25.1726641976241;
        Tue, 17 Sep 2024 23:46:16 -0700 (PDT)
Received: from localhost ([213.235.133.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f440bsm540330666b.86.2024.09.17.23.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 23:46:15 -0700 (PDT)
Date: Wed, 18 Sep 2024 08:45:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv: add trap and emulation for RDCYCLE
Message-ID: <20240918-a465abde626cce8b72ba4758@orel>
References: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
 <20240917130853.18657-4-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240917130853.18657-4-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_234618_757773_E0853751 
X-CRM114-Status: GOOD (  25.15  )
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

On Tue, Sep 17, 2024 at 02:08:53PM GMT, Ben Dooks wrote:
> Add a trap for RDCYCLE and emulate it as RDTIME instruciton.
> 
> This is an initial PoC and should probably be made more generic
> way of trapping and dealing with bad instructions
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/traps.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1c3fab272fd1..51ea28ebf54d 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -167,6 +167,35 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>  DO_ERROR_INFO(do_trap_insn_fault,
>  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
>  
> +#define is_system(__i) (((__i) & 0x7f) == RVG_OPCODE_SYSTEM)

We have riscv_insn_is_system()

> +
> +static bool riscv_try_csr_fixup_user(struct pt_regs *regs, u32 insn)
> +{
> +	/* expecting a 4 byte CSR instruction (*/
> +	if (unlikely(GET_INSN_LENGTH(insn) != 4))
> +		return false;
> +
> +	if (is_system(insn)) {
> +		u32 csr = insn >> RVG_SYSTEM_CSR_OFF;
> +		u32 rd = (insn >> RVG_RD_OPOFF) & RVG_RD_MASK;
> +		u32 rs = (insn >> RVG_RS1_OPOFF) & RVG_RS1_MASK;
> +		u32 funct3 = (insn >> RV_INSN_FUNCT3_OPOFF) & 0x7;

There are are a few other macros in asm/insn.h that can be applied, such
as RV_EXTRACT_RD_REG(), and more could be added if necessary.

> +
> +		if (rs == 0 && funct3 == 2 && csr == CSR_CYCLE) {

We could probably create a riscv_insn_is_csr_read() and RV_EXTRACT_CSR()
for this.

> +			u64 val = csr_read(CSR_TIME);
> +			/* we've got a RDCCLYE, emulated it with CSR_TIME */
> +
> +			printk_ratelimited("PID %d: process using RDCYCLE, emulating with RDTIME\n", current->pid);

If we add current->comm it may be easier to find applications that should
be converted to CSR_TIME.

> +
> +			regs_set_register(regs, rd*sizeof(unsigned long), val);

nit: spaces around the '*'

> +			regs->epc += 4;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
>  {
>  	bool handled;
> @@ -186,6 +215,8 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>  		}
>  
>  		handled = riscv_v_first_use_handler(regs, insn);
> +		if (!handle)
                     ^handled?

> +			handled = riscv_try_csr_fixup_user(regs, insn);
>  
>  		local_irq_disable();
>  
> -- 
> 2.37.2.352.g3c44437643
> 
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
