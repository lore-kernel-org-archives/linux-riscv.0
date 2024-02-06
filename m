Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6700C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 01:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa+eY/je6U2FIEjnPOSem3a5l70B1muw4qfkUkVhmEw=; b=OgsD9tEDYg77eR
	ZibUWSdkS0bjx7/bVJAWxhgVFdcSYRug1HjodfX/tduUUI3JmtuIZk1kfe5OKssFDD26CzKAFMB+M
	J9ovAjIR3wjfMK5ei5weiXvMOEc0iWSbFpdia2yvlLTXPNewrd3NHPy4nM30eW1VqenlLQ3tPnn5k
	UMjlNTXPfIy7dbgxj0jHgBNQV+sGArFk9apmrnpbrzNhrcsKjQiiyxW7n7hD59oDCmr+JxkdcVNRV
	j0CuzLMElsc0+mBfGbGA8iOiPRiwoCuEQ1qHiGX95SqV7t9v4Kf6ZonINl2Ml8DtrnXAxnrOusSjj
	+STDnvW7dUBuu3mP38Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAXN-00000005jVv-0A3A;
	Tue, 06 Feb 2024 01:46:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAXG-00000005jUU-1N8R
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 01:46:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-29661facbd0so74076a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 17:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707183965; x=1707788765; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sDcb8i0bIvKHIHQ3dC9FxopkFric8IR4ltWwgV9c7o=;
        b=C7hdiDwDz8W4kMXFUdjLIZEnbKbohqB2yRGV+gst7LkvkAgzy+CB5VSW4nlFef1kV9
         t5T+csu830BKkPldlDOpU8s+RIwVGcQQKbt0CK218L1Ai3Wfii1vZnzwv4asSs+AP3qo
         NSx2jxBWql9J2ZUOcaRuzAW0FrCEIT1/sSY1GjakMTpdRlS9x3D1zj8kfJcAQb5McEx2
         8lu0maldk+llNFVyJxIgfyjgKc4ihmlrgop9mW/0NW72HcBOMjR/S90DywhNit8n0W5q
         jCQ7R+rHIlrfmhVbVhDX6pPgMVPQuXPi7oQtYk9JS+aoTUq9Ak0nIvoPAm1LEmekltfB
         JA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707183965; x=1707788765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sDcb8i0bIvKHIHQ3dC9FxopkFric8IR4ltWwgV9c7o=;
        b=hBTN3Hy/dbcTDWv0dfGJTnEkGeQDPWxdcPWriqUYcRGl7pNCMw+hekA/gmbC4EAPVE
         /umVuDLnXY8hpM5TnzwWvmHXdt9XlAmaL6Z0dimAAHqqbAWuA27BSxt9Dh70aiSTp5F1
         zpkISUe1E/dqhI7/Orhmt0fhB6vYiaFp7fuYDEPrIedZ3o8C85tkmnp6mAalGxb6quZU
         LvL/M1LWkJp+aTk3jPpZKeFgCf34+LwERgzxMieyR9D+fefWgkDaF6vQ85g0spkookOo
         sRfHdmiJpigAhvf4qNz+U+EvR8wapfARDPvrD8Ojdrr/Ei8wWrazwww9ibGaqL8HZHs/
         yy4Q==
X-Gm-Message-State: AOJu0Yx+yVVhhaoFI/65CpfrXayTHhEjBEGiKmM8EWYRAiYf9UiBklZJ
	EDd0GvUWEGu61TYh0/PKiF7jvkbEKkoobgzWnsv0SE/2a9XrzF2bfR4U3KA9McM=
X-Google-Smtp-Source: AGHT+IHN8f4hiD/vd9K7ytjwEPOBqGk3wlnNNl/5pSoXEuVbxZ50nQ/XvZY2EiIibH6snwRgOjrk/w==
X-Received: by 2002:a17:90a:55c8:b0:295:aaaa:74fe with SMTP id o8-20020a17090a55c800b00295aaaa74femr1951102pjm.14.1707183965199;
        Mon, 05 Feb 2024 17:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWpF1nA3lpEkGTYXCiSU62i0HHPtXpGoYqFRGPLj0W+LAOiq4VNrrvb+6szqjtfIwfSLsiShqwUVOTNjzwfB716a4XiW2ZR81ZRGjjDmW3UPKADH0JpITj1e4WY/UdPSDDzz2D0oc+Mr+3/pXsTP8YgZGpYojKJhFwYvS6cxgPo+WKUrq/bqnytt6ayaf0+bkp2H2iXBcNIgbF42PKLFRFosLuIBOoP8TFNNVGcWBjvDUVvPb0RNNVKuM35LVrw6hh4HrT2+Bd5y5WrTIWu3BBwRLghtg2uuWN+p7pVQnxn
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902c75100b001d8a81e22cbsm556736plq.14.2024.02.05.17.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 17:46:04 -0800 (PST)
Date: Mon, 5 Feb 2024 17:46:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] riscv: misaligned: remove CONFIG_RISCV_M_MODE specific
 code
Message-ID: <ZcGPWrGRi92Chtj8@ghost>
References: <20231128165206.589240-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128165206.589240-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_174606_613388_510B186F 
X-CRM114-Status: GOOD (  30.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 28, 2023 at 05:52:06PM +0100, Cl=E9ment L=E9ger wrote:
> While reworking code to fix sparse errors, it appears that the
> RISCV_M_MODE specific could actually be removed and use the one for
> normal mode. Even though RISCV_M_MODE can do direct user memory access,
> using the user uaccess helpers is also going to work. Since there is no
> need anymore for specific accessors (load_u8()/store_u8()), we can
> directly use memcpy()/copy_{to/from}_user() and get rid of the copy
> loop entirely. __read_insn() is also fixed to use an unsigned long
> instead of a pointer which was cast in __user address space. The
> insn_addr parameter is now cast from unsigned long to the correct
> address space directly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> ---
> =

> Notes: This patch is a complete rework of a previous one [1] and thus is
> not a V3.
> =

> [1] https://lore.kernel.org/linux-riscv/d156242a-f104-4925-9736-624a4ba82=
10d@rivosinc.com/
> ---
>  arch/riscv/kernel/traps_misaligned.c | 108 +++++----------------------
>  1 file changed, 18 insertions(+), 90 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 5eba37147caa..38af97f4819c 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -264,86 +264,14 @@ static unsigned long get_f32_rs(unsigned long insn,=
 u8 fp_reg_offset,
>  #define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
>  #define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
>  =

> -#ifdef CONFIG_RISCV_M_MODE
> -static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_va=
l)
> -{
> -	u8 val;
> -
> -	asm volatile("lbu %0, %1" : "=3D&r" (val) : "m" (*addr));
> -	*r_val =3D val;
> -
> -	return 0;
> -}
> -
> -static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
> -{
> -	asm volatile ("sb %0, %1\n" : : "r" (val), "m" (*addr));
> -
> -	return 0;
> -}
> -
> -static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_in=
sn)
> -{
> -	register ulong __mepc asm ("a2") =3D mepc;
> -	ulong val, rvc_mask =3D 3, tmp;
> -
> -	asm ("and %[tmp], %[addr], 2\n"
> -		"bnez %[tmp], 1f\n"
> -#if defined(CONFIG_64BIT)
> -		__stringify(LWU) " %[insn], (%[addr])\n"
> -#else
> -		__stringify(LW) " %[insn], (%[addr])\n"
> -#endif
> -		"and %[tmp], %[insn], %[rvc_mask]\n"
> -		"beq %[tmp], %[rvc_mask], 2f\n"
> -		"sll %[insn], %[insn], %[xlen_minus_16]\n"
> -		"srl %[insn], %[insn], %[xlen_minus_16]\n"
> -		"j 2f\n"
> -		"1:\n"
> -		"lhu %[insn], (%[addr])\n"
> -		"and %[tmp], %[insn], %[rvc_mask]\n"
> -		"bne %[tmp], %[rvc_mask], 2f\n"
> -		"lhu %[tmp], 2(%[addr])\n"
> -		"sll %[tmp], %[tmp], 16\n"
> -		"add %[insn], %[insn], %[tmp]\n"
> -		"2:"
> -	: [insn] "=3D&r" (val), [tmp] "=3D&r" (tmp)
> -	: [addr] "r" (__mepc), [rvc_mask] "r" (rvc_mask),
> -	  [xlen_minus_16] "i" (XLEN_MINUS_16));
> -
> -	*r_insn =3D val;
> -
> -	return 0;
> -}
> -#else
> -static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_va=
l)
> -{
> -	if (user_mode(regs)) {
> -		return __get_user(*r_val, addr);
> -	} else {
> -		*r_val =3D *addr;
> -		return 0;
> -	}
> -}
> -
> -static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
> -{
> -	if (user_mode(regs)) {
> -		return __put_user(val, addr);
> -	} else {
> -		*addr =3D val;
> -		return 0;
> -	}
> -}
> -
> -#define __read_insn(regs, insn, insn_addr)		\
> +#define __read_insn(regs, insn, insn_addr, type)	\
>  ({							\
>  	int __ret;					\
>  							\
> -	if (user_mode(regs)) {				\
> -		__ret =3D __get_user(insn, insn_addr);	\
> +	if (user_mode(regs)) { \
Nit: formatting was changed here (previous indentation seems better)

> +		__ret =3D __get_user(insn, (type __user *) insn_addr); \
>  	} else {					\
> -		insn =3D *insn_addr;			\
> +		insn =3D *(type *)insn_addr;		\
>  		__ret =3D 0;				\
>  	}						\
>  							\
> @@ -356,9 +284,8 @@ static inline int get_insn(struct pt_regs *regs, ulon=
g epc, ulong *r_insn)
>  =

>  	if (epc & 0x2) {
>  		ulong tmp =3D 0;
> -		u16 __user *insn_addr =3D (u16 __user *)epc;
>  =

> -		if (__read_insn(regs, insn, insn_addr))
> +		if (__read_insn(regs, insn, epc, u16))
>  			return -EFAULT;
>  		/* __get_user() uses regular "lw" which sign extend the loaded
>  		 * value make sure to clear higher order bits in case we "or" it
> @@ -369,16 +296,14 @@ static inline int get_insn(struct pt_regs *regs, ul=
ong epc, ulong *r_insn)
>  			*r_insn =3D insn;
>  			return 0;
>  		}
> -		insn_addr++;
> -		if (__read_insn(regs, tmp, insn_addr))
> +		epc +=3D sizeof(u16);
> +		if (__read_insn(regs, tmp, epc, u16))
>  			return -EFAULT;
>  		*r_insn =3D (tmp << 16) | insn;
>  =

>  		return 0;
>  	} else {
> -		u32 __user *insn_addr =3D (u32 __user *)epc;
> -
> -		if (__read_insn(regs, insn, insn_addr))
> +		if (__read_insn(regs, insn, epc, u32))
>  			return -EFAULT;
>  		if ((insn & __INSN_LENGTH_MASK) =3D=3D __INSN_LENGTH_32) {
>  			*r_insn =3D insn;
> @@ -390,7 +315,6 @@ static inline int get_insn(struct pt_regs *regs, ulon=
g epc, ulong *r_insn)
>  		return 0;
>  	}
>  }
> -#endif
>  =

>  union reg_data {
>  	u8 data_bytes[8];
> @@ -409,7 +333,7 @@ int handle_misaligned_load(struct pt_regs *regs)
>  	unsigned long epc =3D regs->epc;
>  	unsigned long insn;
>  	unsigned long addr =3D regs->badaddr;
> -	int i, fp =3D 0, shift =3D 0, len =3D 0;
> +	int fp =3D 0, shift =3D 0, len =3D 0;
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> @@ -490,9 +414,11 @@ int handle_misaligned_load(struct pt_regs *regs)
>  		return -EOPNOTSUPP;
>  =

>  	val.data_u64 =3D 0;
> -	for (i =3D 0; i < len; i++) {
> -		if (load_u8(regs, (void *)(addr + i), &val.data_bytes[i]))
> +	if (user_mode(regs)) {
> +		if (raw_copy_from_user(&val, (u8 __user *)addr, len))
>  			return -1;
> +	} else {
> +		memcpy(&val, (u8 *)addr, len);
>  	}
>  =

>  	if (!fp)
> @@ -513,7 +439,7 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	unsigned long epc =3D regs->epc;
>  	unsigned long insn;
>  	unsigned long addr =3D regs->badaddr;
> -	int i, len =3D 0, fp =3D 0;
> +	int len =3D 0, fp =3D 0;
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> @@ -588,9 +514,11 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	if (!IS_ENABLED(CONFIG_FPU) && fp)
>  		return -EOPNOTSUPP;
>  =

> -	for (i =3D 0; i < len; i++) {
> -		if (store_u8(regs, (void *)(addr + i), val.data_bytes[i]))
> +	if (user_mode(regs)) {
> +		if (raw_copy_to_user((u8 __user *)addr, &val, len))
>  			return -1;
> +	} else {
> +		memcpy((u8 *)addr, &val, len);
>  	}
>  =

>  	regs->epc =3D epc + INSN_LEN(insn);
> -- =

> 2.42.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

The changes here logically make sense but I don't know how to test this
misaligned access code on M-mode or in S-mode. Can you provide how this
was tested?

There are also some merge conflicts that were introduced in 6.8-rc1.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
