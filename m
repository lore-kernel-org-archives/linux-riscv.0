Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8582DC4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zygDIaCEPiC9cwkfESau/3BDD37TYVMlbLXNGrGaPhg=; b=GjaecKOzvP0nYD
	PUknEkP+XZu0HTTCn+7FqjuDkKcbZMb1ZKvamD4h37j6kRvBKwI1BoW85KxQQoqgMIHRPAKYBH+77
	5iH9OduSlDU4saUjknjEtI/S1m4qVnTO7z39tpQhnJNItULYJGrTQJr8pfYAEclCt2l3zT/l2fRIQ
	yFUtcliZZBE150cGL3Rj1RJj4BQTIVAZ447CIP9zyDqCvRc2eTBJYYiS3X1XZprBxbLgf4Tlu7/48
	uTwCblSIwoaWm5sDaMEPMGykrVM6OUPhukXLAqknhpZG+O5JxUCEzG3P+dA2GylV/b3aX5kBXCACT
	sPtpzYPvnC+VWIaCT4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXq68-0000000C45h-3Xyf;
	Wed, 07 Feb 2024 22:08:52 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXq66-0000000C453-0uLy
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 22:08:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e04e7b687bso706063b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 14:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707343728; x=1707948528; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VP1GaO8yBte8x8UqhhgufPbWp8S+qR3qt5sB/Le/8GU=;
        b=kBVF1gd8ZJGUJ1E9LHFbjtwzzs/TMzwl5Qm4T7P30/tJbhz489upn/ZqN2o5/rBDDF
         zbXK2Camt+ejM0h120IakAv8rklMAYrKf0ujpKaI3cHtiuw2cq0qC2YR/emeNMM9q02M
         wcLyAVw5kI1S+IrH55vXI+A6bm4c/eRoaU0tbRME8cLe8JPgiHOS5rOprImdP1CWIc25
         ocCGb7QQFgmNSGose1LpSrn0M6Le/cxx+UdbfYpKYimL6ZStm607Lfn+MVwkRGi46Ul0
         GgboqmELYWdHpbqfYNQZN86PbYEacq/5I0l3Z8wmYRhM2qe62CjCJQsk3ENQAYFhwrOI
         DpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707343728; x=1707948528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP1GaO8yBte8x8UqhhgufPbWp8S+qR3qt5sB/Le/8GU=;
        b=VlmEeW0sKScJI74PAit+DQ3T9akSO+L1qmS8oetRpQ1fFOUJINZLZhXOLPdHp3CM+6
         4vIe9OqMjGDNEr6Tl4E1t/y4iU24MMmYwXupAjbF88peHSIym4nQ6nz3jqCXoCV/alTp
         VPknSm4cm8W7aM8+JhJgFoOiCyLArA5j9XlA6s7jV0I7O1yy/WKchiar6RQjanycx//B
         dEjT6eB8KRTH+7fskh+671Ffs5Kf2eRccO5gH3B0mvUwCnt/YopHCxNHGKQXlPoyy3d+
         FcxMocyhq5rzzjDk0OSyiUG52i9ebeqkymgi6R6OPNfIjlNe8H9L6+HEGC5HfnFMbgip
         mASw==
X-Gm-Message-State: AOJu0Yxu8fi5wGlAcQd3q9LnjNr8rRjtJIeD8OB/4mWeMKQM3XGyLFaQ
	AsgksS6X2wmV7CMMgmtWFgTYGl+zI4CNpVnGfZf+CU26/lcUdTkizxKfePmwI6I=
X-Google-Smtp-Source: AGHT+IG02I2awJn4mfQEvfbb6d/ZMppfjlJs6l570ZImP3dYCiEQOfqygzvj7rQ8G7iEFIHFRPcgug==
X-Received: by 2002:a62:e808:0:b0:6e0:4759:88f2 with SMTP id c8-20020a62e808000000b006e0475988f2mr3921268pfi.4.1707343728380;
        Wed, 07 Feb 2024 14:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDXNgnEDcri4FjIzqDqj+oozPGRTkmr8lbhyQy2no6rdUcHZvi6WwsQ81v33uB64uKQ7k9AziT0MUaE0EP92kql2RiNMRzyigmvLesaxViHMmIry0JECvXV5Vg33iV68auJeKNsNgfM75UEhhNVjUL3ZDqhyqsb8E4b4H7uxR1j+BuPXm0VjyJ2OV7fOudwEZKt83O9NdMoNglxyr9Uwszwqli0JWR9oLczk8orVLT/pZ6SvWO1BRUhby1T86qun4TbIVEuG8YAnFe9v0=
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id r14-20020a62e40e000000b006e051ec4f90sm2166465pfh.84.2024.02.07.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 14:08:47 -0800 (PST)
Date: Wed, 7 Feb 2024 14:08:45 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>,
	David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v2] riscv: misaligned: remove CONFIG_RISCV_M_MODE
 specific code
Message-ID: <ZcP/bQizfVcwrf3R@ghost>
References: <20240206154104.896809-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206154104.896809-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_140850_440563_028AF6C7 
X-CRM114-Status: GOOD (  35.09  )
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

On Tue, Feb 06, 2024 at 04:40:59PM +0100, Cl=E9ment L=E9ger wrote:
> While reworking code to fix sparse errors, it appears that the
> RISCV_M_MODE specific could actually be removed and use the one for
> normal mode. Even though RISCV_M_MODE can do direct user memory access,
> using the user uaccess helpers is also going to work. Since there is no
> need anymore for specific accessors (load_u8()/store_u8()), we can
> directly use memcpy()/copy_{to/from}_user() and get rid of the copy
> loop entirely. __read_insn() is also fixed to use an unsigned long
> instead of a pointer which was cast in __user address space. The
> insn_addr parameter is now cast from unsigned lnog to the correct
> address space directly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> ---
> =

> The test used to validate these changes is the one used originally for
> S-mode misaligned support:
> =

> https://github.com/clementleger/unaligned_test
> =

> This test exercise (almost) all the supported instructions, all the
> registers for FPU instructions and is compiled with and without
> compressed instructions.
> =

> For S-mode, you simply need a classic toolchain and export CROSS_COMPILE
> to match it.
> =

> For M-mode validation, the following steps can be used:
> =

> Build a nommu toolchain with buildroot toolchain:
> $ git clone https://github.com/buildroot/buildroot.git
> $ cd buildroot
> $ make O=3Dbuild_nommu qemu_riscv64_nommu_virt_defconfig
> =

> Test:
> $ git clone https://github.com/clementleger/unaligned_test.git
> $ cd unaligned_test
> $ make CFLAGS=3D"-fPIC -Wl,-elf2flt=3D-r"
> CROSS_COMPILE=3D<buildroot>/build_nommu/host/bin/riscv64-buildroot-linux-=
uclibc-
> =

> Copy the resulting elf files (unaligned & unaligned_c) to buildroot rootf=
s and rebuild it.
> $ cp unaligned unaligned_c <buildroot>/build_nommu/target/root
> $ cd <buildroot>/build_nommu/
> $ make
> =

> Kernel:
> $ make O=3Dbuild_nommu nommu_virt_defconfig
> $ make O=3Dbuild_nommu loader
> =

> Either set the kernel initramfs or provide one on spike command line
> using the one built with buildroot
> =

> Then to run it on spike (QEMU always emulate misaligned accesses and
> won't generate any misaligned exception):
> =

> $ spike <kernel>/build_nommu/loader
> =

> ---
> =

> V2:
>  - Rebased on master
>  - Align macro end "\"
> =

> Link to v1: https://lore.kernel.org/linux-riscv/20231128165206.589240-1-c=
leger@rivosinc.com/
> =

> Notes: This patch is a complete rework of a previous one [1] and thus is
> not a V3.
> =

> [1] https://lore.kernel.org/linux-riscv/d156242a-f104-4925-9736-624a4ba82=
10d@rivosinc.com/
> ---
>  arch/riscv/kernel/traps_misaligned.c | 106 +++++----------------------
>  1 file changed, 17 insertions(+), 89 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 8ded225e8c5b..fb202dd18fe5 100644
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
> -		return __get_user(*r_val, (u8 __user *)addr);
> -	} else {
> -		*r_val =3D *addr;
> -		return 0;
> -	}
> -}
> -
> -static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
> -{
> -	if (user_mode(regs)) {
> -		return __put_user(val, (u8 __user *)addr);
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
>  	if (user_mode(regs)) {				\
> -		__ret =3D __get_user(insn, insn_addr);	\
> +		__ret =3D __get_user(insn, (type __user *) insn_addr); \
>  	} else {					\
> -		insn =3D *(__force u16 *)insn_addr;	\
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

> @@ -586,9 +512,11 @@ int handle_misaligned_store(struct pt_regs *regs)
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

> 2.43.0
> =


Thank you for posting the testing instructions! I tested it and it
worked as expected.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
