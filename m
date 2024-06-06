Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352B9C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 21:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZvXgO4xQyHvBsAIMCR8F6Mf4sPnah2pRVO69Wgsji4=; b=S4ExalPw/zkco1
	KgEb41yjx/tOGaT8HVEIEr513S3dtU4ixHQZ9R/UeOJhnx685U3GUa8sKhVwzqnmTW0/5b4vmwz6T
	hJo7+XpmTcPUZOllr/jNzq1lOCT14VhbNCsvEBs29rw1dnXAOJXqojFNh7vQFKNeIUA6WRmsT5sPH
	UyqL4qdE1leh05gCyiPr4LuxiPVsMhvZdoPY1VcIqR8FLlTSL+H/ULFQ+uKGOMv9DmJLqxMdheLj5
	WmSnuwSfWgPoM7hNUaeMIBJuKBSZaq3iKAg6fcvMDY5nxEYlZgBaRwX2efBjJ8LJNbEFeKMQBJrpW
	NlDb+F/Wfk9kAQsuviJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKfs-0000000BQSI-1CGL;
	Thu, 06 Jun 2024 21:29:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKfo-0000000BQR0-1sQT
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 21:29:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6d4bf8eb8e2so1125295a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717709367; x=1718314167; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDTE411mTxOuR/5XZPY30ReLbWK9+c2whvgGc0y4PzM=;
        b=onorKglpiEQazXmetKXetHw63J7E9kK3m/0T1JJxSufMDKI79zSI+nR/aqxHh2E2b4
         YlVar0Kif2313dKwM3YbaGWl8G3vi2hnSB7CbGHwzI41w7N37m4bcanoNZkj+RV37fK1
         /PLNPNYaM4H6dA+Q5Pz6+O3oqatpivr/FcjIrjwysrpdBujpSziVfd/afvn/t9zhaIta
         ETzhVJRuo9ms00GXJmFrZDSwrNIhjLl9w9N0sHvTxdy8UmG9sjE8/WkijN0ICUQbt/MU
         q3SucLb4kckfoLHqXVhoAHdIfo7WldnukBFVcY3XBmcNWZxOanXbJjLtVFofxSUawTfn
         yBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709367; x=1718314167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDTE411mTxOuR/5XZPY30ReLbWK9+c2whvgGc0y4PzM=;
        b=eLbjN5UHUmHo3xB0MfZt73JTKVt3OW1A3L1jrcXoA5VqzISA85I3jmcrvxz4NFpzjE
         Ofug1C+3nCrlJLA9FakSMJYtNXuDDdWsqlc0D2AXzLGILkDuhIMd8iCLAdRjL8lYDKR6
         Yaeb8HYQkaJj20b0rws+6ajJDI09pQ9aAe8c5oqQXhQnicHi1Ps6UzXkA1SbI07p3ESc
         CAUb4NT9gmLXlb6SFxoKyYqMk2lfgfgL86Oo5ruTTpBgocI1Ptsi8NE9cG/CJhWTunsj
         7hD2+QheySGc/g+oro1l1eZFG1AVf47qMq6mVLJOw4abFFMpbIfcj83aFl5zYWJ6wZy8
         /asA==
X-Gm-Message-State: AOJu0Yx9bmxU+Rrq9HhyCWcysGwvapsIww+61ze3hett3aLoR+c2cbCw
	hqM+NqO516BK8Jf1IiFrMc9XGRa0BYDWkcKQv79e3t6xQlXY/DkLKtfRn88UfgU=
X-Google-Smtp-Source: AGHT+IFT503paQih9bhGSZ5ScUik5DCtMfnY3O26MDtJDdKnp1ytzdIze0p82GIikHcUzQCOjhfTIg==
X-Received: by 2002:a05:6a20:9689:b0:1b2:184d:c1a4 with SMTP id adf61e73a8af0-1b2f9ddd312mr682491637.50.1717709367061;
        Thu, 06 Jun 2024 14:29:27 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7cd297sm20474965ad.165.2024.06.06.14.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:29:26 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:29:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RISC-V: Detect unaligned vector accesses supported.
Message-ID: <ZmIqM3Cuui0HAwN1@ghost>
References: <20240606183215.416829-1-jesse@rivosinc.com>
 <20240606183215.416829-2-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606183215.416829-2-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_142928_636697_3990957D 
X-CRM114-Status: GOOD (  34.74  )
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

On Thu, Jun 06, 2024 at 02:32:14PM -0400, Jesse Taube wrote:
> Run a unaligned vector access to test if the system supports
> vector unaligned access. Add the result to a new key in hwprobe.
> This is useful for usermode to know if vector misaligned accesses are
> supported and if they are faster or slower than equivalent byte accesses.
> =

> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h        |  2 +
>  arch/riscv/include/asm/hwprobe.h           |  2 +-
>  arch/riscv/include/asm/vector.h            |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h      |  6 ++
>  arch/riscv/kernel/sys_hwprobe.c            | 34 +++++++++
>  arch/riscv/kernel/traps_misaligned.c       | 84 ++++++++++++++++++++--
>  arch/riscv/kernel/unaligned_access_speed.c |  4 ++
>  arch/riscv/kernel/vector.c                 |  2 +-
>  8 files changed, 129 insertions(+), 6 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 347805446151..a012c8490a27 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -35,9 +35,11 @@ void riscv_user_isa_enable(void);
>  =

>  #if defined(CONFIG_RISCV_MISALIGNED)
>  bool check_unaligned_access_emulated_all_cpus(void);
> +bool check_vector_unaligned_access_all_cpus(void);
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> +DECLARE_PER_CPU(long, vector_misaligned_access);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  =

>  #include <uapi/asm/hwprobe.h>
>  =

> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  =

>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 731dcd0ed4de..776af9b37e23 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -21,6 +21,7 @@
>  =

>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
> +bool insn_is_vector(u32 insn_buf);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
>  void kernel_vector_begin(void);
>  void kernel_vector_end(void);
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 060212331a03..ebacff86f134 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -68,6 +68,12 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_VEC_KEY_MISALIGNED_PERF	7
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN		0
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED		1
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_SLOW		2
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_FAST		3
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED	4
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  =

>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index b286b73e763e..ce641cc6e47a 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -184,6 +184,36 @@ static u64 hwprobe_misaligned(const struct cpumask *=
cpus)
>  }
>  #endif
>  =

> +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
> +static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
> +{
> +	int cpu;
> +	u64 perf =3D -1ULL;
> +
> +	for_each_cpu(cpu, cpus) {
> +		int this_perf =3D per_cpu(vector_misaligned_access, cpu);
> +
> +		if (perf =3D=3D -1ULL)
> +			perf =3D this_perf;
> +
> +		if (perf !=3D this_perf) {
> +			perf =3D RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +			break;
> +		}
> +	}
> +
> +	if (perf =3D=3D -1ULL)
> +		return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +
> +	return perf;
> +}
> +#else
> +static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
> +{
> +	return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +}
> +#endif
> +
>  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  			     const struct cpumask *cpus)
>  {
> @@ -211,6 +241,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>  		pair->value =3D hwprobe_misaligned(cpus);
>  		break;
>  =

> +	case RISCV_HWPROBE_VEC_KEY_MISALIGNED_PERF:
> +		pair->value =3D hwprobe_vec_misaligned(cpus);
> +		break;
> +
>  	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
>  		pair->value =3D 0;
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 2adb7c3e4dd5..8f26c3d92230 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -16,6 +16,7 @@
>  #include <asm/entry-common.h>
>  #include <asm/hwprobe.h>
>  #include <asm/cpufeature.h>
> +#include <asm/vector.h>
>  =

>  #define INSN_MATCH_LB			0x3
>  #define INSN_MASK_LB			0x707f
> @@ -413,10 +414,6 @@ int handle_misaligned_load(struct pt_regs *regs)
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> -	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_EM=
ULATED;
> -#endif
> -
>  	if (!unaligned_enabled)
>  		return -1;
>  =

> @@ -426,6 +423,17 @@ int handle_misaligned_load(struct pt_regs *regs)
>  	if (get_insn(regs, epc, &insn))
>  		return -1;
>  =

> +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +	if (insn_is_vector(insn) &&
> +	    *this_cpu_ptr(&vector_misaligned_access) =3D=3D RISCV_HWPROBE_VEC_M=
ISALIGNED_SUPPORTED) {
> +		*this_cpu_ptr(&vector_misaligned_access) =3D RISCV_HWPROBE_VEC_MISALIG=
NED_UNSUPPORTED;
> +		regs->epc =3D epc + INSN_LEN(insn);
> +		return 0;
> +	}
> +
> +	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_EM=
ULATED;

This unconditionally sets scalar unaligned accesses even if the
unaligned access is caused by vector. Scalar unaligned accesses should
only be set to emulated if this function is entered from a scalar
unaligned load.

The rest of this function handles how scalar unaligned accesses are
emulated, and the equivalent needs to happen for vector. You need to add
routines that manually load the data from the memory address into the
vector register. When Cl=E9ment did this for scalar, he provided a test
case to help reviewers [1]. Please add onto these test cases or make
your own for vector.

Link: https://github.com/clementleger/unaligned_test [1]

> +#endif
> +
>  	regs->epc =3D 0;
>  =

>  	if ((insn & INSN_MASK_LW) =3D=3D INSN_MATCH_LW) {
> @@ -625,6 +633,74 @@ static bool check_unaligned_access_emulated(int cpu)
>  	return misaligned_emu_detected;
>  }
>  =

> +#ifdef CONFIG_RISCV_ISA_V
> +static void check_vector_unaligned_access(struct work_struct *unused)

Can you standardize this name with the scalar version by writing
emulated in it?

"check_vector_unaligned_access_emulated_all_cpus"

> +{
> +	int cpu =3D smp_processor_id();
> +	long *mas_ptr =3D this_cpu_ptr(&vector_misaligned_access);
> +	unsigned long tmp_var;
> +
> +	if (!riscv_isa_extension_available(hart_isa[cpu].isa, v))
> +		return;
> +
> +	*mas_ptr =3D RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED;
> +
> +	local_irq_enable();
> +	kernel_vector_begin();
> +	__asm__ __volatile__ (
> +		".balign 4\n\t"
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"       vsetivli zero, 1, e16, m1, ta, ma\n\t"	// Vectors of 16b
> +		"	vle16.v v0, (%[ptr])\n\t"		// Load bytes
> +		".option pop\n\t"
> +		: : [ptr] "r" ((u8 *)&tmp_var + 1) : "v0", "memory");

memory is being read from, but not written to, so there is no need to
have a memory clobber.

> +	kernel_vector_end();
> +
> +	if (*mas_ptr =3D=3D RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN)
> +		*mas_ptr =3D RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED;
> +}
> +
> +bool check_vector_unaligned_access_all_cpus(void)
> +{
> +	int cpu;
> +	bool ret =3D true;
> +
> +	for_each_online_cpu(cpu)
> +		if (riscv_isa_extension_available(hart_isa[cpu].isa, ZICCLSM))

zicclsm is not specific to vector so it can be extracted out of this
vector specific function. Assuming that hardware properly reports the
extension, if zicclsm is present then it is known that both vector and
scalar unaligned accesses are supported.

> +			per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_VEC_MISALIGN=
ED_SUPPORTED;

Please use the exising UNKNOWN terminology instead of renaming to
SUPPORTED. Any option that is not UNSUPPORTED implies that unaligned
accesses are supported.

> +		else
> +			ret =3D false;
> +
> +
> +	if (ret)
> +		return true;
> +	ret =3D true;
> +
> +	schedule_on_each_cpu(check_vector_unaligned_access);
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(vector_misaligned_access, cpu)
> +		    !=3D RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED)
> +			return false;
> +
> +	return ret;
> +}
> +#else

If CONFIG_RISCV_ISA_V is not set, there is no value in checking if
vector unaligned accesses are supported because userspace will not be
allowed to use vector instructions anyway.

- Charlie

> +bool check_vector_unaligned_access_all_cpus(void)
> +{
> +	int cpu;
> +
> +	for_each_online_cpu(cpu)
> +		if (riscv_isa_extension_available(hart_isa[cpu].isa, ZICCLSM))
> +			per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_VEC_MISALIGN=
ED_SUPPORTED;
> +		else
> +			per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_VEC_MISALIGN=
ED_UNSUPPORTED;
> +
> +	return false;
> +}
> +#endif
> +
>  bool check_unaligned_access_emulated_all_cpus(void)
>  {
>  	int cpu;
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kern=
el/unaligned_access_speed.c
> index a9a6bcb02acf..92a84239beaa 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -20,6 +20,7 @@
>  #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
>  =

>  DEFINE_PER_CPU(long, misaligned_access_speed);
> +DEFINE_PER_CPU(long, vector_misaligned_access) =3D RISCV_HWPROBE_VEC_MIS=
ALIGNED_UNKNOWN;
>  =

>  #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  static cpumask_t fast_misaligned_access;
> @@ -264,6 +265,8 @@ static int check_unaligned_access_all_cpus(void)
>  {
>  	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
>  =

> +	check_vector_unaligned_access_all_cpus();
> +
>  	if (!all_cpus_emulated)
>  		return check_unaligned_access_speed_all_cpus();
>  =

> @@ -273,6 +276,7 @@ static int check_unaligned_access_all_cpus(void)
>  static int check_unaligned_access_all_cpus(void)
>  {
>  	check_unaligned_access_emulated_all_cpus();
> +	check_vector_unaligned_access_all_cpus();
>  =

>  	return 0;
>  }
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 6727d1d3b8f2..2cceab739b2c 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -66,7 +66,7 @@ void __init riscv_v_setup_ctx_cache(void)
>  #endif
>  }
>  =

> -static bool insn_is_vector(u32 insn_buf)
> +bool insn_is_vector(u32 insn_buf)
>  {
>  	u32 opcode =3D insn_buf & __INSN_OPCODE_MASK;
>  	u32 width, csr;
> -- =

> 2.43.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
