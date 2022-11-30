Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BD1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29dmzGzLFrlNT6B2hVbGBlEXbCoAGHAsNlcnCa3oKz8=; b=R2lq6gu8BgLC6M
	qW3bYNud8dUJL71fOdhC4XV4vayMqcJB/vbV5UeZZeQQenjAZfypIjyjGi7JNQogQnCUrqryCNt+T
	Bk7CgmNtaLjC0VnQNe9SBISvZlx01L8w8S8o3TNP6O7Nw5sldkvz8ehZSz7y8WwBbe4egj/lGacX8
	cu8/aGALFfgCYBsTg4TguOKne7tnteBeyhMAbci7HLprSe69CK/+LDK1Il2A7e4gZSBvkaPRPrZgf
	i18PUpxhjsajQtvo/kRVkVhJg9l6FSL0CEzDi90d6Saw2HZn3tzJc8urUohwjh0MeqNLgFf30B4Oq
	gcaFXqlPkebjqksRwXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ORQ-00H5oa-Bw; Wed, 30 Nov 2022 14:52:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ORN-00H5eO-40
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:52:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id s5so24330801edc.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idoO300UeY772+woOz7ghVdThdLjPNFwqTdXYUWOHDI=;
        b=R88bFw6KgLSKxkoF9Da9sY2nLLsM0B4FLlDHADJi0+nFVmEO+upmUo7RWlJmcikfn9
         /QrGlFCEqkG0nalqrRys+DQk4DXT4nGDcwQKmosXz2jYBc2rTQucFQ73zMvfocbIHVBM
         I0hF7fusAafvPh6nTTS1aAURsqRVLR1oqWaIO4K8h3ag8nfG4oqnot2wGOfGznM/pKUp
         1Z4B37VwnpVcY7ToLABeASWP/exwOmZjjPwS9Glrw1xMiVq/c/oHhrIgMaVg5Kz6pzC/
         QFQSd8Tqo5xMA++aS8hEWAP5G2BTzdCy3Wp2QBijBxJFeU5NfrOFbJISxBXZsXCQYBnx
         1gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idoO300UeY772+woOz7ghVdThdLjPNFwqTdXYUWOHDI=;
        b=tdjJ5oE0RNpNZcj8ZKKSgaRlIReI8Hb855SO8GIwZrigojCOEyBf5BkOBcD8JGrjgx
         v69dHL7dry96nDHyuKZbdSSlqE9XrFzPIZhhFhPH1zMQpjzLklIKBE79FBIuZ17Qn76T
         kXJnfnnqILGjRFnSJESiOJ20xMu+aXFCxGpIH4J8FWYbX92CepNEi/mFSbXzxeQy8IYt
         xUMKK80vFI1O+TeMDoIqeX33z9EdD5Ru2tgHk77zdg8J2MGg5XgFY0qIis2D/9Mk5CUO
         SMvbFEBzjcTyes60Daj4dcym3fQx2KNWOFP3vIjbEgEjWRVB3HcidT/9u2UPH1+An30g
         Ws7w==
X-Gm-Message-State: ANoB5pmJ7MrmmiXnKrGDfSv300J5VA564qF2vLTytz3Dzc13qTENWq6i
	PoafRZI0a7rky2PNkH8u6uSb2w==
X-Google-Smtp-Source: AA0mqf52muysc6bhpetOV3Ymd9vNlU5Zr4oJf8kV+ctuJolp7CXZnY/w5nbBdt7eJsgFaY/xVCPm9A==
X-Received: by 2002:a05:6402:48d:b0:461:c3d9:c6a3 with SMTP id k13-20020a056402048d00b00461c3d9c6a3mr38658690edv.154.1669819909647;
        Wed, 30 Nov 2022 06:51:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 14-20020a170906318e00b007aed2057ea1sm708788ejy.167.2022.11.30.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:51:49 -0800 (PST)
Date: Wed, 30 Nov 2022 15:51:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Message-ID: <20221130145147.gmuwxvkh4irq36fk@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_065201_211525_A5EF013C 
X-CRM114-Status: GOOD (  19.80  )
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

On Mon, Nov 28, 2022 at 11:26:21AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Only carry the actual values for the funct3, funct4, etc instruction
> fields without directly including the shift to the target position.
> 
> Instead use macros to move the values to their target positions
> when needed.
> 
> This at the same time also reduces the use of magic numbers,
> one would need a spec manual to understand.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 100 +++++++++++++++++------------
>  1 file changed, 59 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> index c52b8ae02cfe..e3f87da108f4 100644
> --- a/arch/riscv/include/asm/parse_asm.h
> +++ b/arch/riscv/include/asm/parse_asm.h
> @@ -5,6 +5,15 @@
>  
>  #include <linux/bits.h>
>  
> +#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
> +#define RV_INSN_FUNCT3_OPOFF	12
> +#define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
> +#define RV_INSN_OPCODE_OPOFF	0
> +#define RV_INSN_FUNCT12_OPOFF	20
> +
> +#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
> +#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
> +
>  /* The bit field of immediate value in I-type instruction */
>  #define RV_I_IMM_SIGN_OPOFF	31
>  #define RV_I_IMM_11_0_OPOFF	20
> @@ -84,6 +93,15 @@
>  #define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
>  #define RVC_B_IMM_5_MASK	GENMASK(0, 0)
>  
> +#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
> +#define RVC_INSN_FUNCT4_OPOFF	12
> +#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
> +#define RVC_INSN_FUNCT3_OPOFF	13
> +#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
> +#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
> +#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
> +#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
> +
>  /* The register offset in RVC op=C0 instruction */
>  #define RVC_C0_RS1_OPOFF	7
>  #define RVC_C0_RS2_OPOFF	2
> @@ -113,52 +131,52 @@
>  /* parts of funct3 code for I, M, A extension*/
>  #define RVG_FUNCT3_JALR		0x0
>  #define RVG_FUNCT3_BEQ		0x0
> -#define RVG_FUNCT3_BNE		0x1000
> -#define RVG_FUNCT3_BLT		0x4000
> -#define RVG_FUNCT3_BGE		0x5000
> -#define RVG_FUNCT3_BLTU		0x6000
> -#define RVG_FUNCT3_BGEU		0x7000
> +#define RVG_FUNCT3_BNE		0x1
> +#define RVG_FUNCT3_BLT		0x4
> +#define RVG_FUNCT3_BGE		0x5
> +#define RVG_FUNCT3_BLTU		0x6
> +#define RVG_FUNCT3_BGEU		0x7
>  
>  /* parts of funct3 code for C extension*/
> -#define RVC_FUNCT3_C_BEQZ	0xc000
> -#define RVC_FUNCT3_C_BNEZ	0xe000
> -#define RVC_FUNCT3_C_J		0xa000
> -#define RVC_FUNCT3_C_JAL	0x2000
> -#define RVC_FUNCT4_C_JR		0x8000
> -#define RVC_FUNCT4_C_JALR	0xf000
                                ^^ this looks wrong

> +#define RVC_FUNCT3_C_BEQZ	0x6
> +#define RVC_FUNCT3_C_BNEZ	0x7
> +#define RVC_FUNCT3_C_J		0x5
> +#define RVC_FUNCT3_C_JAL	0x1
> +#define RVC_FUNCT4_C_JR		0x8
> +#define RVC_FUNCT4_C_JALR	0x9
                                ^^ and this looks right,
				   but we should fix that with a separate
				   patch

>  
> -#define RVG_FUNCT12_SRET	0x10200000
> +#define RVG_FUNCT12_SRET	0x102
>  
> -#define RVG_MATCH_JALR		(RVG_FUNCT3_JALR | RVG_OPCODE_JALR)
> +#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
>  #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
> -#define RVG_MATCH_BEQ		(RVG_FUNCT3_BEQ | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BNE		(RVG_FUNCT3_BNE | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BLT		(RVG_FUNCT3_BLT | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BGE		(RVG_FUNCT3_BGE | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BLTU		(RVG_FUNCT3_BLTU | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BGEU		(RVG_FUNCT3_BGEU | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_SRET		(RVG_FUNCT12_SRET | RVG_OPCODE_SYSTEM)
> -#define RVC_MATCH_C_BEQZ	(RVC_FUNCT3_C_BEQZ | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_BNEZ	(RVC_FUNCT3_C_BNEZ | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_J		(RVC_FUNCT3_C_J | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_JAL		(RVC_FUNCT3_C_JAL | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_JR		(RVC_FUNCT4_C_JR | RVC_OPCODE_C2)
> -#define RVC_MATCH_C_JALR	(RVC_FUNCT4_C_JALR | RVC_OPCODE_C2)
> -
> -#define RVG_MASK_JALR		0x707f
> -#define RVG_MASK_JAL		0x7f
> -#define RVC_MASK_C_JALR		0xf07f
> -#define RVC_MASK_C_JR		0xf07f
> -#define RVC_MASK_C_JAL		0xe003
> -#define RVC_MASK_C_J		0xe003
> -#define RVG_MASK_BEQ		0x707f
> -#define RVG_MASK_BNE		0x707f
> -#define RVG_MASK_BLT		0x707f
> -#define RVG_MASK_BGE		0x707f
> -#define RVG_MASK_BLTU		0x707f
> -#define RVG_MASK_BGEU		0x707f
> -#define RVC_MASK_C_BEQZ		0xe003
> -#define RVC_MASK_C_BNEZ		0xe003
> +#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
> +#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
> +#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
> +
> +#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
>  #define RVG_MASK_SRET		0xffffffff
>  
>  #define __INSN_LENGTH_MASK	_UL(0x3)
> -- 
> 2.35.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
