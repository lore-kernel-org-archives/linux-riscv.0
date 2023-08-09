Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD1C001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 00:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fe0jnn6xcDZk2K6htf3TbvcVJoozVI2iTOdxKoIYZ8=; b=drZ4L9D5B3pDru
	rgb1bIg03/tT89vhu6HoH29tIAsFKy/n8ZBBQmPqg9RqvIcCY3X5ZYR4IHPQkfgvdZpZUItYFzGFb
	6G2B4uLh/PnzDPGkXyL28HUKd6eKyAILX9OAgHwfR6iPg47r/fFI+M/COKMN41iGQauk+rl47f++t
	JZcSsiCMsR2ctMdXwjMI3rMrnPB6YFWPwqXlany5Jx5+NjjZjkfgGmnuEHJgqXUwCJWmwaAkMVVmq
	EDRtz1HRG2PSbZRL/LCMrIPtMryQAe7h2juvJ3nK/ei20RDLq04gAIQNymabkcx9y2/HAdDoQhwFB
	a0pO2yZb68qJiiNmP43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWhH-003iEc-32;
	Wed, 09 Aug 2023 00:05:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWhE-003iDv-28
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 00:05:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26948743648so2433136a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691539502; x=1692144302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0frE2f0ZwmwDpwGntxAbYu1s68vRKA54Dy0bxFno04U=;
        b=GuM9mr85ilFJlInrXd6nystKeoCGRZAkEDwAnLldE9vyoHURH4Wcz8gWeUhOvhLpcy
         84TVATmPvfSoFszG2SrtpDg9Co3zoB6sds0IKptQXozWwZLb1xi/PPk/WsApOt7tLSJZ
         w1je6C0uRZ9c+8N5bfSasMpdQRZRitBLT8yios04wyZb6rMYG+KG3WjDr0GTqpvcj7nv
         YgOF3hmEnLXD7npICqG9R6AH3kAPxKEXRYubcF8gEYG3QHTysHv5Alrs6wht97PBxDNJ
         vNrpMrcPteFtbJkgfdoo6WkNtZE+ukHGAewrbfcw9WNydObs4G4HS+h5TCUyJRgTX7PZ
         8roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691539502; x=1692144302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0frE2f0ZwmwDpwGntxAbYu1s68vRKA54Dy0bxFno04U=;
        b=PM8OGXacCXMpK/KDpkC6I38Nc/xp9PiOhlweVbePb9poP0Cz3KO5Rs2ITra3oeRfrO
         EPwr0mi5DXHnLCh2uCKffPo9pmFkmcyqU2uEJ5NsUmeMk9X3B6wAX/Ts+WWYz0jYg+xA
         jRMPiUbKlgUJbTx1UU7vnvESfi0xWxtDg2Bwusq7ApNswqhOoihz72VdfCgapXbdNh8v
         DymJZ1BJEJ+X/wolGJb9jlWfhnTShuEn/3N2anb8mqGL1DAtus2NV22m0GaeKPB4xXGU
         9fBTzaJXd8DFxRsmJWIAHZ06O/h5ZgZDyBGiE37nZbfaYd8OLcSs928dqNiUs6T6chui
         MhOA==
X-Gm-Message-State: AOJu0Yy48RUzbncgiKY4pdg9szGbM8BvnmWvXJulLOlUZ+ZHgN8fYFm3
	LbjVkDeMkWMhjRILU586wkmhlA==
X-Google-Smtp-Source: AGHT+IGSSXwefr0+64H0kQkpXvTdBuqS8Z5UjODkmDhotkSB2RHkwLkDVHZfodi9zPHyCKzIWF3R8w==
X-Received: by 2002:a17:90a:8a0f:b0:269:303f:8fec with SMTP id w15-20020a17090a8a0f00b00269303f8fecmr904984pjn.42.1691539502157;
        Tue, 08 Aug 2023 17:05:02 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id az9-20020a17090b028900b00263f5ac814esm108984pjb.38.2023.08.08.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 17:05:01 -0700 (PDT)
Date: Tue, 8 Aug 2023 17:04:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: correct riscv_insn_is_c_jr() and
 riscv_insn_is_c_jalr()
Message-ID: <ZNLYK/efGcZ0uSyN@ghost>
References: <20230731183925.152145-1-namcaov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731183925.152145-1-namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_170504_885878_7FDA7BFE 
X-CRM114-Status: GOOD (  19.49  )
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

On Mon, Jul 31, 2023 at 08:39:25PM +0200, Nam Cao wrote:
> The instructions c.jr and c.jalr must have rs1 != 0, but
> riscv_insn_is_c_jr() and riscv_insn_is_c_jalr() do not check for this. So,
> riscv_insn_is_c_jr() can match a reserved encoding, while
> riscv_insn_is_c_jalr() can match the c.ebreak instruction.
> 
> Rewrite them with check for rs1 != 0.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/include/asm/insn.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 4e1505cef8aa..fce00400c9bc 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -110,6 +110,7 @@
>  #define RVC_INSN_FUNCT4_OPOFF	12
>  #define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
>  #define RVC_INSN_FUNCT3_OPOFF	13
> +#define RVC_INSN_J_RS1_MASK	GENMASK(11, 7)
>  #define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
>  #define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
>  #define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
> @@ -245,8 +246,6 @@ __RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
>  __RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
>  __RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
>  __RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
> -__RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)
> -__RISCV_INSN_FUNCS(c_jalr, RVC_MASK_C_JALR, RVC_MATCH_C_JALR)
>  __RISCV_INSN_FUNCS(c_j, RVC_MASK_C_J, RVC_MATCH_C_J)
>  __RISCV_INSN_FUNCS(beq, RVG_MASK_BEQ, RVG_MATCH_BEQ)
>  __RISCV_INSN_FUNCS(bne, RVG_MASK_BNE, RVG_MATCH_BNE)
> @@ -273,6 +272,18 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
>  }
>  
> +static __always_inline bool riscv_insn_is_c_jr(u32 code)
> +{
> +	return (code & RVC_MASK_C_JR) == RVC_MATCH_C_JR &&
> +	       (code & RVC_INSN_J_RS1_MASK) != 0;
> +}
> +
> +static __always_inline bool riscv_insn_is_c_jalr(u32 code)
> +{
> +	return (code & RVC_MASK_C_JALR) == RVC_MATCH_C_JALR &&
> +	       (code & RVC_INSN_J_RS1_MASK) != 0;
> +}
> +
>  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
>  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
>  #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> -- 
> 2.34.1
> 
Good catch. You can add:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
