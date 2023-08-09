Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA254C001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 00:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXvt8cHNWAJaDwSHr7NTuHJHJKyiNKx6if109khDGPI=; b=3lrq0FdKDiY7xr
	wPCp6YdMgOodO9eufXXMj7EKXd+03mlKqJMZhUBGNxNTK9FeEwksF94EIlesG57Ek5w2ikJT2oY3c
	fKrdYrLEdRcFMRnosV1X1zB0/N+5JrWzIeFzMo56c0ny+rebB+7Tngmec4oXrPbRNwKHng1YB+gsF
	eg9Pjzc6zYuhbPReWt8Gu3BqoGuY1FW15Shc36nuFuhzJMlhz5Uowz0oJecpLkDak1PKnKkZSJ8X5
	dhFUhptrdq55Z4NNsQLE+6vO5VNLOkUxSAC1Oa1ONVo6ZF1fWO4F0wJssbdYpigRYKzWjCZgxRYGX
	U7xHZnJ6j+iQltvMRO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWnt-003io0-0s;
	Wed, 09 Aug 2023 00:11:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWnq-003imw-0E
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 00:11:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso7355945ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691539911; x=1692144711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AT1C4AerJlXwIiNecJBhQV/P+t8hVTh2ACzgYtgXBrE=;
        b=r0sC93j/WMXkSVhGupG2mhApM1DKDknlkIb01eiNXioWHNaKXtc6cKNWIiTPKCq6s2
         KTwSZn2Vw60lzPMwUQMnQMI0VRUO82mogV5vd9zyhsIFD+alyY0sXwNK1pGSM9fjf+IJ
         RwoWK/7509wPgYpDG9r2AQsCVHb4qlbsdHZiHLDYGKusNixz9PRgMajiwl8RwueUQOid
         d4fUVsIWCvca6B4Dmnd/CCybBVKUiqOOJtLdCYFIPZZffWOEOLMdK5HXUXY7gwQRaNES
         TObY5mvrTgsJzmOTLT+7WyJl5DsJ7jDRCs4sBSxY1cYZLaJ71+W0tB9dITHGn3XYvdpu
         Ft5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691539911; x=1692144711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT1C4AerJlXwIiNecJBhQV/P+t8hVTh2ACzgYtgXBrE=;
        b=QwuKQE8OlB33avVZDB+ywUuJSiug8FlMqxl1GhfdKI4/5ZH48RY8rfZjjXppyHJUDP
         LpujnAs/exnOj5MyAf3rz4PaFJJFcMDk8Gav4CMJC2/SBZO+NWBUUnyHl4fPJUoIjC6h
         /ApHTpsyfh5RtP6OwemBcqIEwaoF1Ze3S+ha+vQ+fWFfzXPOR8SiiwUrGQCiIHhEDQBM
         t1in392sVwfLf/mQWRnW7AY+JgBPrH4BQ3gb7qB7GW19BNhbRkkW/lm217JzEaFo/7lE
         LWbfoKAb+tF1xN8ls7zWfrNFrELHqqFuHCelTC5WJpi42xB2fqvuuls6+jZQi0qWPUzU
         awZw==
X-Gm-Message-State: AOJu0YxlhK3OQzk4tg51LkesWz3ZBunFtXujtont2wcLYBhbEQFjZxLF
	AIrnwGrHkYiCcj2D+bu5z+r6rqbg4X3wwA9VNsc=
X-Google-Smtp-Source: AGHT+IH84L0Lj4niri8+x73RnRq6aCUwjs8P/OOQlxApk4kGCMI8KyIKsJ9TzMnoltLfoEdgpF48Cg==
X-Received: by 2002:a17:903:2283:b0:1b8:1b79:a78c with SMTP id b3-20020a170903228300b001b81b79a78cmr1260219plh.44.1691539911175;
        Tue, 08 Aug 2023 17:11:51 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709029a8500b001b8b45b177esm9562281plp.274.2023.08.08.17.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 17:11:50 -0700 (PDT)
Date: Tue, 8 Aug 2023 17:11:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: kprobes: simulate c.j instruction
Message-ID: <ZNLZxIRM5iIjmdcD@ghost>
References: <cover.1690704360.git.namcaov@gmail.com>
 <6ef76cd9984b8015826649d13f870f8ac45a2d0d.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ef76cd9984b8015826649d13f870f8ac45a2d0d.1690704360.git.namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_171154_109702_C044A733 
X-CRM114-Status: GOOD (  22.84  )
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

On Sun, Jul 30, 2023 at 10:27:07AM +0200, Nam Cao wrote:
> kprobes currently rejects c.j instruction. Implement it.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/kernel/probes/decode-insn.c   |  3 ++-
>  arch/riscv/kernel/probes/simulate-insn.c | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  1 +
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 64f6183b4717..39adb07a342d 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -29,13 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	 * TODO: the REJECTED ones below need to be implemented
>  	 */
>  #ifdef CONFIG_RISCV_ISA_C
> -	RISCV_INSN_REJECTED(c_j,		insn);
>  	RISCV_INSN_REJECTED(c_jr,		insn);
>  	RISCV_INSN_REJECTED(c_jal,		insn);
>  	RISCV_INSN_REJECTED(c_jalr,		insn);
>  	RISCV_INSN_REJECTED(c_beqz,		insn);
>  	RISCV_INSN_REJECTED(c_bnez,		insn);
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);
> +
> +	RISCV_INSN_SET_SIMULATE(c_j,		insn);
>  #endif
>  
>  	RISCV_INSN_SET_SIMULATE(jal,		insn);
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 7441ac8a6843..3ba45c612cd8 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -188,3 +188,27 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
>  
>  	return true;
>  }
> +
> +bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	/*
> +	 *  15    13 12                            2 1      0
> +	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
> +	 *     3                   11                    2
> +	 */
> +
> +	s32 offset;
> +
> +	offset  = ((opcode >> 3)  & 0x7) << 1;
> +	offset |= ((opcode >> 11) & 0x1) << 4;
> +	offset |= ((opcode >> 2)  & 0x1) << 5;
> +	offset |= ((opcode >> 7)  & 0x1) << 6;
> +	offset |= ((opcode >> 6)  & 0x1) << 7;
> +	offset |= ((opcode >> 9)  & 0x3) << 8;
> +	offset |= ((opcode >> 8)  & 0x1) << 10;
> +	offset |= ((opcode >> 12) & 0x1) << 11;
> +
> +	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
Can you use riscv_insn_insert_jtype_imm() from insn.h since it is
already created? It will also sign extend for you. Don't worry about
creating a similar function for the branches, I am in the process of
refactoring the insn.h file.
> +
> +	return true;
> +}
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index 61e35db31001..4bd6c266e7d3 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -24,5 +24,6 @@ bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
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
Thanks,
Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
