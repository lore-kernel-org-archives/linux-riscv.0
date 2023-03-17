Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F03C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HlXXbj6yrPv0UGvaipEOFSzLhRJau+7MmY25E8buk8=; b=KXobOq2Epb96us
	7Whn7UjM3NWulSTxjTKXrz9NKqa4oUA0Zy3I4+b6xOYGZ7YRY9ndRSJuzH+VLoBN9VIZq0JpWsoom
	/rMUsOJ++CO9XWK9ZXrRFVU3x0xF4O46LJCToHUY3IVVcpbcoRuiQJd7xBQEaL4jGLeQj7iPt8d0s
	6YBWUqjQMqmCUcCVrgiQTihL5VuG/PiU/PNxnMVYe1tsf5y06AIEICORT0I77hKOrYJJEIUgZYCVF
	r3bipJqlOIYxxsmTk1/JsEqOipAY5FJ0N3qUXqlbVOULFukKv1YZjKMX1Godv6dbok2GLRIXKwP3i
	42o1mrQMVmfnyoXkAjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd71I-001rIX-0B;
	Fri, 17 Mar 2023 10:09:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd71A-001rFr-1p
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 10:09:06 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pd70n-0000QK-7c; Fri, 17 Mar 2023 11:08:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>
Subject:  Re: [PATCH v4 4/6] RISC-V: hwprobe: Support probing of misaligned access
 performance
Date: Fri, 17 Mar 2023 11:08:36 +0100
Message-ID: <1846748.tdWV9SEqCh@diego>
In-Reply-To: <20230314183220.513101-5-evan@rivosinc.com>
References:  <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-5-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_030900_608364_71902C74 
X-CRM114-Status: GOOD (  28.36  )
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
Cc: slewis@rivosinc.com, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, Guo Ren <guoren@kernel.org>, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Evan,

Am Dienstag, 14. M=E4rz 2023, 19:32:18 CET schrieb Evan Green:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.

I really like this implementation.

Also interesting that T-Head actually has a fast unaligned access.
Maybe that should be part of the commit message (including were
this information comes from)


> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> =

> ---
> =

> Changes in v4:
>  - Add newlines to CPUPERF_0 documentation (Conor)
>  - Add UNSUPPORTED value (Conor)
>  - Switched from DT to alternatives-based probing (Rob)
>  - Crispen up cpu index type to always be int (Conor)
> =

> Changes in v3:
>  - Have hwprobe_misaligned return int instead of long.
>  - Constify cpumask pointer in hwprobe_misaligned()
>  - Fix warnings in _PERF_O list documentation, use :c:macro:.
>  - Move include cpufeature.h to misaligned patch.
>  - Fix documentation mismatch for RISCV_HWPROBE_KEY_CPUPERF_0 (Conor)
>  - Use for_each_possible_cpu() instead of NR_CPUS (Conor)
>  - Break early in misaligned access iteration (Conor)
>  - Increase MISALIGNED_MASK from 2 bits to 3 for possible UNSUPPORTED fut=
ure
>    value (Conor)
> =

> Changes in v2:
>  - Fixed logic error in if(of_property_read_string...) that caused crash
>  - Include cpufeature.h in cpufeature.h to avoid undeclared variable
>    warning.
>  - Added a _MASK define
>  - Fix random checkpatch complaints
> =

>  Documentation/riscv/hwprobe.rst       | 21 ++++++++++++++++++++
>  arch/riscv/errata/thead/errata.c      |  9 +++++++++
>  arch/riscv/include/asm/alternative.h  |  5 +++++
>  arch/riscv/include/asm/cpufeature.h   |  2 ++
>  arch/riscv/include/asm/hwprobe.h      |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h |  7 +++++++
>  arch/riscv/kernel/alternative.c       | 19 ++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c        |  3 +++
>  arch/riscv/kernel/smpboot.c           |  1 +
>  arch/riscv/kernel/sys_riscv.c         | 28 +++++++++++++++++++++++++++
>  10 files changed, 96 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 945d44683c40..9f0dd62dcb5d 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -63,3 +63,24 @@ The following keys are defined:
>  =

>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as def=
ined
>      by version 2.2 of the RISC-V ISA manual.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
> +  information about the selected set of processors.
> +
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misa=
ligned
> +    accesses is unknown.
> +
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> +    emulated via software, either in or below the kernel.  These accesse=
s are
> +    always extremely slow.
> +
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are su=
pported
> +    in hardware, but are slower than the cooresponding aligned accesses
> +    sequences.
> +
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are su=
pported
> +    in hardware and are faster than the cooresponding aligned accesses
> +    sequences.
> +
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses=
 are
> +    not supported at all and will generate a misaligned address fault.
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index fac5742d1c1e..f41a45af5607 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -10,7 +10,9 @@
>  #include <linux/uaccess.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
>  #include <asm/errata_list.h>
> +#include <asm/hwprobe.h>
>  #include <asm/patch.h>
>  #include <asm/vendorid_list.h>
>  =

> @@ -108,3 +110,10 @@ void __init_or_module thead_errata_patch_func(struct=
 alt_entry *begin, struct al
>  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
>  		local_flush_icache_all();
>  }
> +
> +void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
> +			      unsigned long impid)
> +{
> +	if ((archid =3D=3D 0) && (impid =3D=3D 0))
> +		per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_FAS=
T;

When looking at this function I 'm wondering if we also want to expose
the active erratas somehow (not in this patch of course, just in general)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
