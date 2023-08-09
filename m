Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B29C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QAndUKQCr0YNDfATPwlaGUYSEl77IEyyGxn6bYXYsM=; b=attkO3xcSRF4u4
	bL8S7In0GB01Cn1tQ+HkhuIGmlj0hYkiiGTBpSlKduKHnRxZN/tKU2p2DhAokE51GFZCfSWeOv1e/
	VovR4eevBUWMFoYOC8tVgoJb15hljLCKhOoa/9LbAqLvS3QdwLn2TAr/A/MsF9pZgsMYAxvdogGlM
	RPUpcLh0C9ChRU+22tMUNv0TIAnPe0f309616hT+fnWh68xc+TAZj4BWTWBFULZBFDhD05Gt4TlL7
	IhcYPUznDtzWvLiHfG/Dek+/cJRB9JZcsDVMMNo51eENWTy2yo9l/zsjQ+oQAPhb+bmAI1ZpCFoRL
	YINvPv3TtWoDusaJBM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXfM-003mVp-1A;
	Wed, 09 Aug 2023 01:07:12 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXfJ-003mUG-2R
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:07:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-564d6aa9abdso297332a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691543218; x=1692148018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDlgdWSio+yXC/Nn1OBq/QVRcrUPGuqsehLIooX+ZW0=;
        b=BQapDrqI+OjZfikqLkxLY65qdTymK0gAxbUzjF6zV8We6Vb2d8vMz7oJTWweMvHFrq
         EqboTd20jkq/w2uBIqGD/gNu13ECL4seqIw0bOMihPy41IdAyn636ZmQsYjpsOkCRtZ2
         klKj/Gsje16RMljkXyjI1n5+mEXA/tWxS0+o3VD+nILn4UO2Vor4K7G7QipR4oyGOOgm
         tEJPdhJ0YpgCp+HavKPFuRkjEENq3uEOu7EiBz/VuNb9/0UB1DrGveJtLyXSHL/Wxnb5
         otzCnNmSDQPfEoXCjt4MPXGFi+GeqcVvbYKVnakwsDZyE7DoWPRFKZ69Qc1h6LgF9ppV
         /Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543218; x=1692148018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlgdWSio+yXC/Nn1OBq/QVRcrUPGuqsehLIooX+ZW0=;
        b=Re17s+xfXa9qNpkIW8/NEIB7HJavNTv0eeM3hSh1yoWBs0OfwDMzEEZ5a8r/KzbvdI
         gHQ/b5FVnXVyvw/yft+1LK0x3zwnA4faacjZ0Kho1Pa6V5J4fKGfIZfF2XgdC+acHdv8
         SjEQwlQ5N+2MSiUSulo6nfSFwNo4h9vut3Dll1S+wpEV2wmmSZwX5GtXpPoHZPu8rBhN
         2ixej5Rqn5wnG2dSh/XpIhXeKZ06NJzC5uI1pckxRiWsN+F4NMIBG29OmkImQKIvj3u7
         SdLKx2XGYuv+xjveSvtLZbHWwzySepaEuvW9pMKX0yqlSrBZyNcy8F6EXvZvjA3J4TkE
         VcOQ==
X-Gm-Message-State: AOJu0YyOVPvY+MPwK8u72J3sAYeJ+aAx6AB46VBZccEep6NAu0CsmTke
	yh/1m0zyuB9aEytAENE3rfiSnQ==
X-Google-Smtp-Source: AGHT+IF/KuDoa6Xy7Sv9D2QnbMq24T7k3TtXKaq4Eap7G32v0u2qaPX5My72Dth6grb2O2/jypJi9A==
X-Received: by 2002:a17:90a:674b:b0:268:abf:6431 with SMTP id c11-20020a17090a674b00b002680abf6431mr1548680pjm.24.1691543217835;
        Tue, 08 Aug 2023 18:06:57 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a898a00b00263fc1ef1aasm161087pjn.10.2023.08.08.18.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:06:57 -0700 (PDT)
Date: Tue, 8 Aug 2023 18:06:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: kprobes: simulate c.jr and c.jalr instructions
Message-ID: <ZNLmr0S956z76hkg@ghost>
References: <cover.1690704360.git.namcaov@gmail.com>
 <db8b7787e9208654cca50484f68334f412be2ea9.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db8b7787e9208654cca50484f68334f412be2ea9.1690704360.git.namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_180709_791866_9345C6CE 
X-CRM114-Status: GOOD (  20.56  )
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

On Sun, Jul 30, 2023 at 10:27:08AM +0200, Nam Cao wrote:
> kprobes currently rejects c.jr and c.jalr instructions. Implement them.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/kernel/probes/decode-insn.c   |  4 +--
>  arch/riscv/kernel/probes/simulate-insn.c | 37 ++++++++++++++++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  2 ++
>  3 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 39adb07a342d..6dba23a55ac7 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -29,14 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	 * TODO: the REJECTED ones below need to be implemented
>  	 */
>  #ifdef CONFIG_RISCV_ISA_C
> -	RISCV_INSN_REJECTED(c_jr,		insn);
>  	RISCV_INSN_REJECTED(c_jal,		insn);
> -	RISCV_INSN_REJECTED(c_jalr,		insn);
>  	RISCV_INSN_REJECTED(c_beqz,		insn);
>  	RISCV_INSN_REJECTED(c_bnez,		insn);
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);
>  
>  	RISCV_INSN_SET_SIMULATE(c_j,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
>  #endif
>  
>  	RISCV_INSN_SET_SIMULATE(jal,		insn);
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 3ba45c612cd8..1ead6f4951f9 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -212,3 +212,40 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
>  
>  	return true;
>  }
> +
> +static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
> +					 bool is_jalr)
> +{
> +	/*
> +	 *  15    12 11  7 6   2 1  0
> +	 * | funct4 | rs1 | rs2 | op |
> +	 *     4       5     5    2
> +	 */
> +
> +	unsigned long jump_addr;
> +
> +	u32 rs1 = (opcode >> 7) & 0x1f;
> +
> +	if (rs1 == 0) /* C.JR is only valid when rs1 != x0 */
> +		return false;
> +
> +	if (!rv_insn_reg_get_val(regs, rs1, &jump_addr))
> +		return false;
> +
> +	if (is_jalr && !rv_insn_reg_set_val(regs, 1, addr + 2))
> +		return false;
> +
> +	instruction_pointer_set(regs, jump_addr);
> +
> +	return true;
> +}
> +
> +bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	return simulate_c_jr_jalr(opcode, addr, regs, false);
> +}
> +
> +bool __kprobes simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	return simulate_c_jr_jalr(opcode, addr, regs, true);
> +}
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index 4bd6c266e7d3..472a1948ec4f 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -25,5 +25,7 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
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
