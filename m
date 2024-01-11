Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D21C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6fg75UOdd6X958gtxDqFWaNPSwYU9l10bwgTYTpqz4=; b=I/JJ9HMXAayrv0
	dOaHimhDGiKxYynaeAfkYsVC3QzksSqRAyU9vzsrlqgSUcG6I/pWxUyzi8CnomrRMOqojD1GmV61C
	KvPkyTjWQPffpK9Eoq9D+9yqTjoea8Djc0XMeszV+3oHnlNT7GTSsC9u9lOmBlE/NoNfhQkXV+pqQ
	uF484Y3v2u3N8PrNSNrJBOpl3fwJH4qB4Csh7PbpmzHWtsGcklIVyFkI78zBVlvcuMlAkFzmtewjl
	2GpY5ZEvXrO5Tey05tn1Mxgg+gArUFo7MPOy+9RHK/QJ+B6VON+9HiXnc79NF6eaSgdMgTGG1WJhY
	xo5r85u3Pe1Z69vCJ6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsZP-00H4Ox-2a;
	Thu, 11 Jan 2024 10:45:55 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsZM-00H4Nd-25
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 10:45:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50e741123acso5906657e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704969949; x=1705574749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pp/RzTW2ENIeMjvlT7QtnBz9isedj0q651h0e5oZKPg=;
        b=VXj+8yO/8t7YcnSjrY6pQ2LGWehgsY0XEkb6HAd8Qq9qudL4eH3V58aLVAZtPxWwVl
         Tabm+C7gPmwbZS/XKmDZ/X376i6Ja9htQdmbc5pRcAfiGfi5jas70ax30AOjAYkLC/rL
         dtBwqhDdbvHu8lhDzm9ClrFBkD3Vi2Ho2RZMwxwcrdJid9oyB+0l2fnS5JoNZq0vnrQS
         sj2BZZtiIfqcyhot2MGoMHm1rkxzCZIPgM560cqcLkR2/k28/pyVo0YqgNNhdMW8j/eL
         4tK47I0rH1puw+phkX1DMxYnpsBtdPEa4dLQfdllcMzlYMlAqnU7rSye1dVYuVSVNSAE
         Kceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969949; x=1705574749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp/RzTW2ENIeMjvlT7QtnBz9isedj0q651h0e5oZKPg=;
        b=KCPr6f1dyGzPmIJzRPwWfNsdE07lJGZ/bi6uzSIpeKv+mSLRX43KQTBwAyDmOcEE8e
         0W2OXD756DbGWFS4dhh7+K33jr2GV5T+oz6wj5hCn81yKLK0H80mDEp85HcyjqQB2Xxp
         J/oX04HTwKqTIvqbHzhR0rXXR6jOs9pbwm9P4KlimQJeiLW1DdJJpacjRJ9xw+u4C5dV
         FqeJOFfSURaTXsjQraQpJiuDmgS0KA6ee6wIRUy6I0ItO+fLRPPBKYZ6hXlYKyX3a9XG
         woj8ZaR0dEjwHDPgtjfbMWZc/7QkIVca7DFxOV+zyNHm6muLhq3QizPB/7Ow5tkycdOC
         V7lg==
X-Gm-Message-State: AOJu0YzfxK146g9uEywo6U3UT2q3prPCF6G9Qm0oSsjmxJMIoB6pOoUp
	yUuZiMmph6asthTBaY4WclfYf1eqrdyF2Q==
X-Google-Smtp-Source: AGHT+IGW0ew9/5bfKezah2jEzOP3drhNFEIse7ZrReUyXJN7PysmLkabQFgAofPsMXAVqeDNTFjRcw==
X-Received: by 2002:a05:6512:11c8:b0:50e:3e26:8e54 with SMTP id h8-20020a05651211c800b0050e3e268e54mr398666lfr.60.1704969948566;
        Thu, 11 Jan 2024 02:45:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090654c300b00a2a2426728bsm421171ejp.178.2024.01.11.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:45:48 -0800 (PST)
Date: Thu, 11 Jan 2024 11:45:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Subject: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions &
 cpufeature
Message-ID: <20240111-416377ebfcaff924b71fb419@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <6bce1adb-6808-40df-8dd7-b0b2c6031547@rivosinc.com>
 <20240103-77f6b0856efb7a9f4591c53b@orel>
 <331610f6-9987-4d1b-8d57-f21311a43f5d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <331610f6-9987-4d1b-8d57-f21311a43f5d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_024552_689494_B9AB4347 
X-CRM114-Status: GOOD (  36.28  )
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
Cc: panqinglin2020@iscas.ac.cn, Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, wefu@redhat.com, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, linux-kernel@vger.kernel.org, bjorn@rivosinc.com, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 11, 2024 at 11:31:32AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 03/01/2024 13:00, Andrew Jones wrote:
> > On Wed, Jan 03, 2024 at 10:31:37AM +0100, Cl=E9ment L=E9ger wrote:
> >>
> >>
> >> On 31/12/2023 09:29, guoren@kernel.org wrote:
> >>> From: Guo Ren <guoren@linux.alibaba.com>
> >>>
> >>> Cache-block prefetch instructions are HINTs to the hardware to
> >>> indicate that software intends to perform a particular type of
> >>> memory access in the near future. This patch adds prefetch.i,
> >>> prefetch.r and prefetch.w instruction definitions by
> >>> RISCV_ISA_EXT_ZICBOP cpufeature.
> >>>
> >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>> Signed-off-by: Guo Ren <guoren@kernel.org>
> >>> ---
> >>>  arch/riscv/Kconfig                | 15 ++++++++
> >>>  arch/riscv/include/asm/hwcap.h    |  1 +
> >>>  arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++=
++
> >>>  arch/riscv/kernel/cpufeature.c    |  1 +
> >>>  4 files changed, 77 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>> index 24c1799e2ec4..fcbd417d65ea 100644
> >>> --- a/arch/riscv/Kconfig
> >>> +++ b/arch/riscv/Kconfig
> >>> @@ -579,6 +579,21 @@ config RISCV_ISA_ZICBOZ
> >>>  =

> >>>  	   If you don't know what to do here, say Y.
> >>>  =

> >>> +config RISCV_ISA_ZICBOP
> >>> +	bool "Zicbop extension support for cache block prefetch"
> >>> +	depends on MMU
> >>> +	depends on RISCV_ALTERNATIVE
> >>> +	default y
> >>> +	help
> >>> +	  Adds support to dynamically detect the presence of the ZICBOP
> >>> +	  extension (Cache Block Prefetch Operations) and enable its
> >>> +	  usage.
> >>> +
> >>> +	  The Zicbop extension can be used to prefetch cache block for
> >>> +	  read/write fetch.
> >>> +
> >>> +	  If you don't know what to do here, say Y.
> >>> +
> >>>  config TOOLCHAIN_HAS_ZIHINTPAUSE
> >>>  	bool
> >>>  	default y
> >>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> >>> index 06d30526ef3b..77d3b6ee25ab 100644
> >>> --- a/arch/riscv/include/asm/hwcap.h
> >>> +++ b/arch/riscv/include/asm/hwcap.h
> >>> @@ -57,6 +57,7 @@
> >>>  #define RISCV_ISA_EXT_ZIHPM		42
> >>>  #define RISCV_ISA_EXT_SMSTATEEN		43
> >>>  #define RISCV_ISA_EXT_ZICOND		44
> >>> +#define RISCV_ISA_EXT_ZICBOP		45
> >>
> >> Hi Guo,
> >>
> >> Since you are adding support for the Zicbop extension, you could
> >> probably also allow to probe it from userspace using hwprobe. Add a few
> >> definitions to sys_riscv.c/hwprobe.h and it will be fine.
> > =

> > To expose to userspace, we should also start parsing the block size,
> > so it can also be exposed to userspace. Starting to parse the block
> > size first requires that we decide we need to parse the block size
> > (see [1]).
> =

> Hi Andrew, thanks for the thread.
> =

> I read it (and the other ones that are related to it) and basically, it
> seems there was a first decision (expose Zicbop block size indivudally)
> due to the fact the specification did not mentioned anything specific
> about clock sizes  but then after that, there was a clarification in the
> spec stating that Zicbop and Zicbom have the same block size so the
> first decision was questioned again.
> =

> From a user coherency point of view, I think it would make more sense to
> expose it individually in hwprobe  so that zicboz, zicbop and zicbom
> have their "own" block size (even though zicbop and zicbom would use the
> same one). Moreover, it would allow us for future evolution easily
> without breaking any userspace later if zicbop and zicbom block size are
> decoupled.

I agree and QEMU has already headed down the road of generating
riscv,cbop-block-size (I guess Conor's ack on [1] was interpreted as
being sufficient to merge the QEMU bits), so we can add the Linux
support and test with QEMU now. The work could probably be a separate
series to this one, though.

Thanks,
drew

> =

> Cl=E9ment
> =

> > =

> > [1] https://lore.kernel.org/all/20231029123500.739409-1-dbarboza@ventan=
amicro.com/
> > =

> > Thanks,
> > drew
> > =

> > =

> >>
> >> Thanks,
> >>
> >> Cl=E9ment
> >>
> >>>  =

> >>>  #define RISCV_ISA_EXT_MAX		64
> >>>  =

> >>> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/a=
sm/insn-def.h
> >>> index e27179b26086..bbda350a63bf 100644
> >>> --- a/arch/riscv/include/asm/insn-def.h
> >>> +++ b/arch/riscv/include/asm/insn-def.h
> >>> @@ -18,6 +18,13 @@
> >>>  #define INSN_I_RD_SHIFT			 7
> >>>  #define INSN_I_OPCODE_SHIFT		 0
> >>>  =

> >>> +#define INSN_S_SIMM7_SHIFT		25
> >>> +#define INSN_S_RS2_SHIFT		20
> >>> +#define INSN_S_RS1_SHIFT		15
> >>> +#define INSN_S_FUNC3_SHIFT		12
> >>> +#define INSN_S_SIMM5_SHIFT		 7
> >>> +#define INSN_S_OPCODE_SHIFT		 0
> >>> +
> >>>  #ifdef __ASSEMBLY__
> >>>  =

> >>>  #ifdef CONFIG_AS_HAS_INSN
> >>> @@ -30,6 +37,10 @@
> >>>  	.insn	i \opcode, \func3, \rd, \rs1, \simm12
> >>>  	.endm
> >>>  =

> >>> +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> >>> +	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
> >>> +	.endm
> >>> +
> >>>  #else
> >>>  =

> >>>  #include <asm/gpr-num.h>
> >>> @@ -51,10 +62,20 @@
> >>>  		 (\simm12 << INSN_I_SIMM12_SHIFT))
> >>>  	.endm
> >>>  =

> >>> +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> >>> +	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
> >>> +		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
> >>> +		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
> >>> +		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
> >>> +		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
> >>> +		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
> >>> +	.endm
> >>> +
> >>>  #endif
> >>>  =

> >>>  #define __INSN_R(...)	insn_r __VA_ARGS__
> >>>  #define __INSN_I(...)	insn_i __VA_ARGS__
> >>> +#define __INSN_S(...)	insn_s __VA_ARGS__
> >>>  =

> >>>  #else /* ! __ASSEMBLY__ */
> >>>  =

> >>> @@ -66,6 +87,9 @@
> >>>  #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
> >>>  	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
> >>>  =

> >>> +#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
> >>> +	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
> >>> +
> >>>  #else
> >>>  =

> >>>  #include <linux/stringify.h>
> >>> @@ -92,12 +116,26 @@
> >>>  "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
> >>>  "	.endm\n"
> >>>  =

> >>> +#define DEFINE_INSN_S							\
> >>> +	__DEFINE_ASM_GPR_NUMS						\
> >>> +"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
> >>> +"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
> >>> +"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
> >>> +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> >>> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> >>> +"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
> >>> +"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "=
))\n" \
> >>> +"	.endm\n"
> >>> +
> >>>  #define UNDEFINE_INSN_R							\
> >>>  "	.purgem insn_r\n"
> >>>  =

> >>>  #define UNDEFINE_INSN_I							\
> >>>  "	.purgem insn_i\n"
> >>>  =

> >>> +#define UNDEFINE_INSN_S							\
> >>> +"	.purgem insn_s\n"
> >>> +
> >>>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
> >>>  	DEFINE_INSN_R							\
> >>>  	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\=
n" \
> >>> @@ -108,6 +146,11 @@
> >>>  	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
> >>>  	UNDEFINE_INSN_I
> >>>  =

> >>> +#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
> >>> +	DEFINE_INSN_S							\
> >>> +	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
> >>> +	UNDEFINE_INSN_S
> >>> +
> >>>  #endif
> >>>  =

> >>>  #endif /* ! __ASSEMBLY__ */
> >>> @@ -120,6 +163,10 @@
> >>>  	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
> >>>  		 RV_##rs1, RV_##simm12)
> >>>  =

> >>> +#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
> >>> +	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
> >>> +		 RV_##simm12, RV_##rs1)
> >>> +
> >>>  #define RV_OPCODE(v)		__ASM_STR(v)
> >>>  #define RV_FUNC3(v)		__ASM_STR(v)
> >>>  #define RV_FUNC7(v)		__ASM_STR(v)
> >>> @@ -133,6 +180,7 @@
> >>>  #define RV___RS2(v)		__RV_REG(v)
> >>>  =

> >>>  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> >>> +#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
> >>>  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> >>>  =

> >>>  #define HFENCE_VVMA(vaddr, asid)				\
> >>> @@ -196,4 +244,16 @@
> >>>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> >>>  	       RS1(base), SIMM12(4))
> >>>  =

> >>> +#define CBO_PREFETCH_I(base, offset)				\
> >>> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> >>> +	       SIMM12(offset), RS1(base))
> >>> +
> >>> +#define CBO_PREFETCH_R(base, offset)				\
> >>> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> >>> +	       SIMM12(offset), RS1(base))
> >>> +
> >>> +#define CBO_PREFETCH_W(base, offset)				\
> >>> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> >>> +	       SIMM12(offset), RS1(base))
> >>> +
> >>>  #endif /* __ASM_INSN_DEF_H */
> >>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> >>> index b3785ffc1570..bdb02b066041 100644
> >>> --- a/arch/riscv/kernel/cpufeature.c
> >>> +++ b/arch/riscv/kernel/cpufeature.c
> >>> @@ -168,6 +168,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >>>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> >>>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >>>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> >>> +	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),
> >>>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> >>>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
> >>>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
