Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D9C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKnCRON7etA0WIuWntHQEdWihfOrka4BKMWmJ264IB0=; b=to5h2J8g/vPhRa
	ZXnbuby/AuSlHQvzypOwzrG+XZwQH2nMH281aJkkAojzhfePWKWirJmNcZrVbqkMGiZK9clPCeEbW
	heW1EJRsBdLyneE3iuW1mCHzdQ4pMRg2/BKatKkDW3CMKoAXX1Nz2qTLOI5AkGq1YcvzmRDy/4ZNB
	gnbQYJXYMTro4GEadXMkGu6ZgyXL3LSTaELj98fu6QlFBP3kDQEvMVMwy8GBEM3oZ870aMFNP+vc+
	NTODIrvkBvWChxTpKNhjqTr4JHknW5rWOwcM1LfeKHU0PrBzwKq0DN8L1syS6z+MH3u+Thvb72a1Y
	JcbCUO+QShTcxAvtoYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Yvf-0000000DcZf-2Ym0;
	Mon, 13 May 2024 16:53:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Yvc-0000000DcYx-1ffL
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 16:53:34 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a59c448b44aso1197324566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715619208; x=1716224008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1oBPAF2w8fZVPm8NSdnQib33iYXIwPTD6vxiqg/Fetg=;
        b=bgKFY0sJIBm3WffBmawYssOyGhIqKr7aHuZOpdOJjmslf6Yis+lg0jFURWo/0I++tO
         kymDhS0LcIT9We71pfQ27o42YqHx6mO2Rn75hfF8ANnWPjJD4rUbabUNifcw09p7Sq1X
         laxO9/5TyKfaDGu61D+ViUFE2xvDTfros5xONVeWFxYu2VLBSKwv6w1ku1KZfxUDXlZQ
         yE3meNq3srNCl2fHWlClbQmJaWY6wnO55hxQ2g67QkuQmpNYI+U05m6YnXKqVshNRx67
         ty8Yn3XRVV/FV9BoszzXt2iPHafqR3yr9MU+CeGhLin5n1HvlI1Aoc10/CrjofxXJ7Nv
         hZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715619208; x=1716224008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oBPAF2w8fZVPm8NSdnQib33iYXIwPTD6vxiqg/Fetg=;
        b=wNh5Tl27L+wx6XS40uILYykE+NGpiPYVSNT4fI5RUw2rwErFKip+EmyBq3SI0eLUbZ
         g23nQ+bPGkeJMuIOVqzebtfzzNgZumCnFHYqvTu1b4qHGe2+xoebU3UPiei3T7whZ9oJ
         Z6viWV+Wv3tP/ENEfUqcRSgtutFO3dYB6Cr+7+7L/sIYhvx/iX7ZBh5QgZZ/+CQyot1U
         UZSLk3wHsm08MSOXpJIEg59OrL4W/+WtZkYiwCFUDCggZqKInA71+Scq3gNHb0rYghlX
         4taIxSPV7Y9ew1fDXdN8t4+8ZT0msdXjD6+NFMcgj6LzUYA1ReJxC9cMqBNRKjpevPv/
         y6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUHNfCISlOq2GBQlmMthrhWMsUNp5b7onjHCD6K65s+MeR6aUFC0R4+uAqpbIxAYoLk+cENhqbtAaO03I5IjKjfdW2xOFDjph6597cL6oy
X-Gm-Message-State: AOJu0Yz96Ybb3pJhnkGSi4wtIhfcszXeQO1TMJj+6RQWJlkUGrWVkJ1M
	DoXdze2MZtfn9zu+i/Rg256KoWeVKoY2JT/qVB/jSrCiqnG79JtOCFwb+CAICws=
X-Google-Smtp-Source: AGHT+IGdnmvLUxoBJc6VxZdO9jyZljv6lqT40AVcHBqVs5j7MRwp1eJG+AnOtf3UQerVicHm0jYmkw==
X-Received: by 2002:a50:d596:0:b0:572:d4fc:cc3 with SMTP id 4fb4d7f45d1cf-5734d5974d0mr7375118a12.2.1715619208429;
        Mon, 13 May 2024 09:53:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7d79sm6427800a12.59.2024.05.13.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 09:53:27 -0700 (PDT)
Date: Mon, 13 May 2024 18:53:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	pulehui@huawei.com, haicheng.li@intel.com, conor@kernel.org
Subject: Re: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Message-ID: <20240513-5c6f04fb4a29963c63d09aa2@orel>
References: <20240511023436.3282285-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511023436.3282285-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_095332_468056_2F03FA5A 
X-CRM114-Status: GOOD (  24.39  )
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

On Sat, May 11, 2024 at 10:34:36AM GMT, Xiao Wang wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
> v2:
> * Add Zba description in the Kconfig. (Lehui)
> * Reword the Kconfig help message to make it clearer. (Conor)
> ---
>  arch/riscv/Kconfig       | 22 ++++++++++++++++++++++
>  arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..e262a8668b41 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
>  
> +config TOOLCHAIN_HAS_ZBA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> @@ -601,6 +609,20 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
>  
> +config RISCV_ISA_ZBA
> +	bool "Zba extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBA

We handcraft the instruction, so why do we need toolchain support?

> +	depends on RISCV_ALTERNATIVE

Also, while riscv_has_extension_likely() will be accelerated with
RISCV_ALTERNATIVE, it's not required.

> +	default y
> +	help
> +	   Add support for enabling optimisations in the kernel when the Zba
> +	   extension is detected at boot.
> +
> +	   The Zba extension provides instructions to accelerate the generation
> +	   of addresses that index into arrays of basic data types.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBB
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index f4b6b3b9edda..18a7885ba95e 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
>  	return IS_ENABLED(CONFIG_RISCV_ISA_C);
>  }
>  
> +static inline bool rvzba_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBA) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBA);
> +}
> +
>  static inline bool rvzbb_enabled(void)
>  {
>  	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> @@ -937,6 +942,14 @@ static inline u16 rvc_sdsp(u32 imm9, u8 rs2)
>  	return rv_css_insn(0x7, imm, rs2, 0x2);
>  }
>  
> +/* RV64-only ZBA instructions. */
> +
> +static inline u32 rvzba_zextw(u8 rd, u8 rs1)
> +{
> +	/* add.uw rd, rs1, ZERO */
> +	return rv_r_insn(0x04, RV_REG_ZERO, rs1, 0, rd, 0x3b);
> +}
> +
>  #endif /* __riscv_xlen == 64 */
>  
>  /* Helper functions that emit RVC instructions when possible. */
> @@ -1159,6 +1172,11 @@ static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
>  
>  static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
>  {
> +	if (rvzba_enabled()) {
> +		emit(rvzba_zextw(rd, rs), ctx);
> +		return;
> +	}
> +
>  	emit_slli(rd, rs, 32, ctx);
>  	emit_srli(rd, rd, 32, ctx);
>  }
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
