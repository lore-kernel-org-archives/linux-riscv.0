Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DFC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kkourzFU2J+Av75xb2jlgrt6HcAZ/i54GuzlvHobKI=; b=z8pb1qeh//1Eum
	JAhOmhgDGDf1uGITVRs5oUSxTDjcVkASqytVV/i8SMdan4msyi0rbburjQORLsUsmccsYnd0FBB50
	8Lq8iNmbWWChryUy6K+aCrxb7M5a7Pxe8KPfkWEIt+8NG3D+xFOuX9kzSJGsLTTg1JgjJqqDXuEj6
	e+9ENcPWgFc07CzPID43YgeY34CkavI/w6TrgWCrkVABdAWb3qBwKNYv9GrMvfWyGjTQYByZdEU9t
	1PZtxXxO48v2SbT83B2G9CIzVp7AfGYGRrfZNzbwhkkEJAniEOqvBfiuz5Ub53Nroa0DcMOe729JG
	0WAFjfIcS8srknXht/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXmn-003n9U-2w;
	Wed, 09 Aug 2023 01:14:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXmk-003n85-1I
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:14:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso5941942b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691543681; x=1692148481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWT4JhC42VfaKttFZ++aGV4mz8fzIMvfW1JXvYZt6jU=;
        b=AKPPIdzgf5z4ql2dIwRxYxtZgU6yihBrCucSx1FoB56iu2tFoCtrmXI68WMZ12d8OT
         9vnGfLJtNFfmQNbcdJHkSR+ku34GWr8t9T7RFEj6uWjjeTa8RAgbw1iv0y0t8TPlz+D6
         TDT7DDK2kDfhkbohGyXha8IGl9cLCy4GFUTodqIlGwt0fil85hNUJfiX6ATJC3jA25r9
         SVwHKLOzhuOR6hDTdTB3VIhKmyxuirENwL5/mOm9aRHGMyphfTdeANcRy9JFx8R2RVD4
         f4C3c0JJTBCA5Rssnhcubux5aH4uxZki5vACwEtHAMfBQoJP6TTmDzp+Oljkh5qigmx6
         tLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543681; x=1692148481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWT4JhC42VfaKttFZ++aGV4mz8fzIMvfW1JXvYZt6jU=;
        b=NMACDPMfNR/9Z0uJncYtEDEEnnjar8g5da3a1BQGRIWko1iAdUmEPwKL2JP8hmrzBE
         lqXFujrcVOnB4GIUANO+F9ABowER6x9LQrHQo1WUfO6iDuREaCgOfVU6OUbOMYC35t43
         aJ70fyBf6VJgDDSETz8XHcobseNuuepqexjN8CCCCYRFhgplug6DjYNLzjlCFb0Beyh/
         0VwW1lhq0h9VMuqrjedb6ie6l6iGnZOnYa9gTVFS/rH6PZtICJjDVXkvSLOuHV9qwIK7
         ll6MyiKS6hhk2AkhDdAy9O+p11Yb3BRlXxaVRcY4HDjPyzX88NkV88fczBseIk2O4Jxs
         nd6A==
X-Gm-Message-State: AOJu0YxykAp9tJhEB4DQamfebayhrMv0URtxRAJ3paXmmbiBW1Ja0IGl
	BEk8ERMldPV+Bg/Jy1tiV2C82A==
X-Google-Smtp-Source: AGHT+IE/iLSVocB1sUWQOlB0rXMjY7Smu2LPsv2p8+xBp1gQzKa7hcnl6+aGjso9Wvnm5iI9l0XN9g==
X-Received: by 2002:a05:6a20:1385:b0:11d:4c79:90ee with SMTP id hn5-20020a056a20138500b0011d4c7990eemr1218698pzc.25.1691543681550;
        Tue, 08 Aug 2023 18:14:41 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p27-20020a63951b000000b00563590be25esm7232226pgd.29.2023.08.08.18.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:14:41 -0700 (PDT)
Date: Tue, 8 Aug 2023 18:14:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: kprobes: simulate c.beqz and c.bnez
Message-ID: <ZNLof08CrlQ8eNAg@ghost>
References: <cover.1690704360.git.namcaov@gmail.com>
 <1d879dba4e4ee9a82e27625d6483b5c9cfed684f.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d879dba4e4ee9a82e27625d6483b5c9cfed684f.1690704360.git.namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_181450_446118_637E858E 
X-CRM114-Status: GOOD (  22.00  )
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

On Sun, Jul 30, 2023 at 10:27:09AM +0200, Nam Cao wrote:
> kprobes currently rejects instruction c.beqz and c.bnez. Implement them.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/kernel/probes/decode-insn.c   |  4 +--
>  arch/riscv/kernel/probes/simulate-insn.c | 44 ++++++++++++++++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  2 ++
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 6dba23a55ac7..65d9590bfb9f 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -30,13 +30,13 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	 */
>  #ifdef CONFIG_RISCV_ISA_C
>  	RISCV_INSN_REJECTED(c_jal,		insn);
> -	RISCV_INSN_REJECTED(c_beqz,		insn);
> -	RISCV_INSN_REJECTED(c_bnez,		insn);
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);
>  
>  	RISCV_INSN_SET_SIMULATE(c_j,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_beqz,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_bnez,		insn);
>  #endif
>  
>  	RISCV_INSN_SET_SIMULATE(jal,		insn);
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 1ead6f4951f9..d3099d67816d 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -249,3 +249,47 @@ bool __kprobes simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *r
>  {
>  	return simulate_c_jr_jalr(opcode, addr, regs, true);
>  }
> +
> +static bool __kprobes simulate_c_bnez_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs,
> +					   bool is_bnez)
> +{
> +	/*
> +	 *  15    13 12           10 9    7 6                 2 1  0
> +	 * | funct3 | offset[8|4:3] | rs1' | offset[7:6|2:1|5] | op |
> +	 *     3            3          3             5           2
> +	 */
> +
> +	s32 offset;
> +	u32 rs1;
> +	unsigned long rs1_val;
> +
> +	rs1 = 0x8 | ((opcode >> 7) & 0x7);
> +
> +	if (!rv_insn_reg_get_val(regs, rs1, &rs1_val))
> +		return false;
> +
> +	if ((rs1_val != 0 && is_bnez) || (rs1_val == 0 && !is_bnez)) {
> +		offset =  ((opcode >> 3)  & 0x3) << 1;
> +		offset |= ((opcode >> 10) & 0x3) << 3;
> +		offset |= ((opcode >> 2)  & 0x1) << 5;
> +		offset |= ((opcode >> 5)  & 0x3) << 6;
> +		offset |= ((opcode >> 12) & 0x1) << 8;
> +		offset = sign_extend32(offset, 8);
> +	} else {
> +		offset = 2;
> +	}
> +
> +	instruction_pointer_set(regs, addr + offset);
> +
> +	return true;
> +}
> +
> +bool __kprobes simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	return simulate_c_bnez_beqz(opcode, addr, regs, true);
> +}
> +
> +bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	return simulate_c_bnez_beqz(opcode, addr, regs, false);
> +}
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index 472a1948ec4f..44ebbc444db9 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -27,5 +27,7 @@ bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  
>  #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
You can add:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
