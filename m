Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEE7C6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kof2VhIwUmu/VSA8bXaWdO/56wUiEL5kLN4sNRfCqyo=; b=Ri7JcPdhmYWLKJ
	cyZevX6DMPr87tnGn2/+Fi81jCJQ6eMbVlbcqyWdidJwQiY5XbbwvF9/EUapPbDzGGpI+2z0MUOK+
	+9ZTVAChdWC3ugdfQTLZys3zdw/qApi4GEpenIPg6YNhyeE5mdQZ7Vk542/wiLYJCV0sCFHwzTiMr
	V9HWn6PfWxIY+oJYRfWISBa5PQ/4ZARlIQBkUAhVZp2Lzt0vZYm51VonAaoEVqHsQfJseqW/gchXP
	kFnqPrALD4xVZWi1LxUNirdklY1Xnc9SDeSDtb858tte088/0UNJraqSxxzN/qKrIa97ckC7SyiXs
	ZS193IRu15c4xEv51W2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEVC-007U0r-0M;
	Fri, 31 Mar 2023 13:09:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEV8-007Tyk-1Z;
	Fri, 31 Mar 2023 13:09:08 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piEUg-0003kW-KL; Fri, 31 Mar 2023 15:08:38 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liao Chang <liaochang1@huawei.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Mattias Nissler <mnissler@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 10/20] riscv: Allocate user's vector context in the
 first-use trap
Date: Fri, 31 Mar 2023 15:08:37 +0200
Message-ID: <2409883.jE0xQCEvom@diego>
In-Reply-To: <20230327164941.20491-11-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-11-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_060906_688572_764A56DF 
X-CRM114-Status: GOOD (  29.01  )
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

Am Montag, 27. M=E4rz 2023, 18:49:30 CEST schrieb Andy Chiu:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> =

> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d@lina=
ro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/insn.h   | 29 +++++++++++
>  arch/riscv/include/asm/vector.h |  2 +
>  arch/riscv/kernel/traps.c       | 26 +++++++++-
>  arch/riscv/kernel/vector.c      | 90 +++++++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 8d5c84f2d5ef..4e1505cef8aa 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -137,6 +137,26 @@
>  #define RVG_OPCODE_JALR		0x67
>  #define RVG_OPCODE_JAL		0x6f
>  #define RVG_OPCODE_SYSTEM	0x73
> +#define RVG_SYSTEM_CSR_OFF	20
> +#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)

The CSR instructions are all I-type instructions it seems, but I do
understand where this is coming from, as for CSRs this is not an IMM
but an unsigned value

> +/* parts of opcode for RVF, RVD and RVQ */
> +#define RVFDQ_FL_FS_WIDTH_OFF	12
> +#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
> +#define RVFDQ_FL_FS_WIDTH_W	2
> +#define RVFDQ_FL_FS_WIDTH_D	3
> +#define RVFDQ_LS_FS_WIDTH_Q	4
> +#define RVFDQ_OPCODE_FL		0x07
> +#define RVFDQ_OPCODE_FS		0x27


> +/* parts of opcode for RVV */
> +#define RVV_OPCODE_VECTOR	0x57
> +#define RVV_VL_VS_WIDTH_8	0
> +#define RVV_VL_VS_WIDTH_16	5
> +#define RVV_VL_VS_WIDTH_32	6
> +#define RVV_VL_VS_WIDTH_64	7
> +#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
> +#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS

Same issue for those (FL_FS + VL_VS), but those even don't declare
being part of any *-type scheme in the spec.

So all of them mix content-definitions (RV*_OPCODE_*) with structure-
definitions and right now I don't know how to feel about that ;-) .

On the one hand I like the original separation, but on the other hand it
doesn't feel useful to put these single-use definitions somewhere above.


>  /* parts of opcode for RVC*/
>  #define RVC_OPCODE_C0		0x0
> @@ -304,6 +324,15 @@ static __always_inline bool riscv_insn_is_branch(u32=
 code)
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OF=
F) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
>  =

> +#define RVG_EXTRACT_SYSTEM_CSR(x) \
> +	({typeof(x) x_ =3D (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MAS=
K); })
> +
> +#define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
> +	({typeof(x) x_ =3D (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
> +				   RVFDQ_FL_FS_WIDTH_MASK); })
> +
> +#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
> +
>  /*
>   * Get the immediate from a J-type instruction.
>   *


> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 03582e2ade83..ea59f32adf46 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -4,9 +4,19 @@
>   * Author: Andy Chiu <andy.chiu@sifive.com>
>   */
>  #include <linux/export.h>
> +#include <linux/sched/signal.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
>  =

> +#include <asm/thread_info.h>
> +#include <asm/processor.h>
> +#include <asm/insn.h>
>  #include <asm/vector.h>
>  #include <asm/csr.h>
> +#include <asm/ptrace.h>
> +#include <asm/bug.h>
>  =

>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> @@ -18,3 +28,83 @@ void riscv_v_setup_vsize(void)
>  	riscv_v_vsize =3D csr_read(CSR_VLENB) * 32;
>  	riscv_v_disable();
>  }
> +
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode =3D insn_buf & __INSN_OPCODE_MASK;
> +	bool is_vector =3D false;
> +	u32 width, csr;
> +
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) !=3D 4))
> +		return false;
> +
> +	switch (opcode) {
> +	case RVV_OPCODE_VECTOR:
> +		is_vector =3D true;
> +		break;
> +	case RVV_OPCODE_VL:
> +	case RVV_OPCODE_VS:
> +		width =3D RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +		if (width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV_VL_VS_WIDTH_16 =
||
> +		    width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RVV_VL_VS_WIDTH_64)
> +			is_vector =3D true;
> +		break;
> +	case RVG_OPCODE_SYSTEM:
> +		csr =3D RVG_EXTRACT_SYSTEM_CSR(insn_buf);
> +		if ((csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
> +		    (csr >=3D CSR_VL && csr <=3D CSR_VLENB))
> +			is_vector =3D true;
> +		break;
> +	}

blank line?

> +	return is_vector;

I guess a matter of style-preference, but the other option would be to
just return true from inside the case elements, and simply false here.


> +}
> +
> +static int riscv_v_thread_zalloc(void)
> +{
> +	void *datap;
> +
> +	datap =3D kzalloc(riscv_v_vsize, GFP_KERNEL);
> +	if (!datap)
> +		return -ENOMEM;

blank line?

> +	current->thread.vstate.datap =3D datap;
> +	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
> +						    datap));
> +	return 0;
> +}
> +
> +bool riscv_v_first_use_handler(struct pt_regs *regs)
> +{
> +	u32 __user *epc =3D (u32 __user *)regs->epc;
> +	u32 insn =3D (u32)regs->badaddr;
> +
> +	/* If V has been enabled then it is not the first-use trap */
> +	if (riscv_v_vstate_query(regs))
> +		return false;
> +
> +	/* Get the instruction */
> +	if (!insn) {
> +		if (__get_user(insn, epc))
> +			return false;
> +	}

blank?

> +	/* Filter out non-V instructions */
> +	if (!insn_is_vector(insn))
> +		return false;
> +
> +	/* Sanity check. datap should be null by the time of the first-use trap=
 */
> +	WARN_ON(current->thread.vstate.datap);

blank?

> +	/*
> +	 * Now we sure that this is a V instruction. And it executes in the
> +	 * context where VS has been off. So, try to allocate the user's V
> +	 * context and resume execution.
> +	 */
> +	if (riscv_v_thread_zalloc()) {
> +		force_sig(SIGKILL);
> +		return true;
> +	}
> +	riscv_v_vstate_on(regs);
> +	return true;
> +}
> =


in any case,

Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
