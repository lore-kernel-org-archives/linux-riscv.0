Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F058606A327
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpmtbGFa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=J0ckW4To
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bkn8f3uS3apVHQ95BzdeFmugIWa7lvo21rf/7iN+j6U=; b=PpmtbGFaf5zqXNCCgBciW5yjtr
	UWXS4+loYjMeF5M2ljehNOogiEXS5DgohBI01O1dDIsgkoLhOUBmXofni1LE5C88iu7VKOgSjbsa4
	CPkRyuXuvQR4pVHA/+xViwMBre6wUAbvY4UhsiRlVqO7gsSzN1dV/8JI0zrONWESOZ3JhG5R/D06+
	zMZYlgsJ4vngsp3o+PD4DL52ZQxUn1QspZKiQTA8mj4ZaH2g5bmYu4HhSb8njmrv9fKpdU8SRAZt5
	VMBoJBzzOV+hmGvLhhOPFduSKxU8b9cyH4SNC5QjhKs8b/yn0aflqVAFBAoSA3yyQMcYbjUV23L4q
	zejaEQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRubV-0000000DgDo-18pB;
	Fri, 13 Nov 2026 16:58:21 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRubS-0000000DgDE-3xuj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:58:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b336de3d38so9270167b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794589097; x=1795193897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBmE8Vf3e5sMIeBmzI8V6l5q3TEI2ajfxFS8vljHizw=;
        b=J0ckW4ToiHJBCJRp1grG/ii/KrtgELo/QrJv65ABsn7gBcpvm78K86q4yiAObXer0j
         kXEaQUAtPHOF94M0/+JsjsFo38VYWBCySCcfCcWaLhuragYZCoF3rgRdjZBJ4Ann2GQH
         QUxhAnsuF2z3St2HJGOroRRXaxyi1PUiz2AlKNgUR+6Ls1Q3dCi6Vwfvy8SXmdHwcKjg
         YHF2esgyeanxMCKJTaFO2BhD38R8ib54tVjUMoxULpEHj6/iBcVzTOifC8+FpS4fZfFv
         bxIJs4rtcJLs0tbGixojsVw2QawgCy9HuqFXC/6wiCowUzEaHZ3GtNLQ+O2inWmDiSqt
         fKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589097; x=1795193897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBmE8Vf3e5sMIeBmzI8V6l5q3TEI2ajfxFS8vljHizw=;
        b=n7d/yLMZ+rjA6KRwi5NsG/Mxz+GLVflKv9GvYfmLQ128IpFdhVXjFOoepXF2fE1RMZ
         k/BtBMY3dFyUmFd0x2Lxg6UM7PzA+ZjdFysIfMXjYp/dIfvvR0wvzpyiWTDk4mzSBAyX
         T9iVwiGhJ9ryHjjCuu1+7TztrMQBi0kmJf9f5D/eYUlKgyV8BexZwd4Emma7WZ7mEvRw
         RozggVe+NsaQOz4d/B1muAFmIEJfHBwII5s5yx8cswX0kem/x2g3XIMgA0Ei8g2iHJVS
         b7oOgtCG02pHIxZKb8CyOu9HKA7yD/wQoh3T1WYrc+qnBMjcRiaRI//ZGVEsaVKTHR/f
         GjWw==
X-Forwarded-Encrypted: i=1; AL+hErHdDNjjvjRrF/yP+9+b5LjMRVVq3jVjEQOfiO8en+53VK7U0XiWKdRXGuTDT64gB/Pwxp1ipLjSHd6uDg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/I5py0a2OPeH/h2kGaCU3lVfdpprGT6Wtd+DHZwnunxZIhbZdL
	Z/MYChk9HDPu1VDfnUmsM0jOizyPqAk6A8DFZzN9Q0mkL5u5q3lXiHLc0tU2oHNTm3I=
X-Gm-Gg: AYBFou2BBX3r/5oBbrwNNoc9uM28jia0dldFqjwDX6/RPQa//LR6gyEOg6vbU0794vs
	h/NRwBHuFAVztDNqe5rjBHfy6wRdtSpSWSmvOfNPT+qPMzqXqHxHtV0zm7kHTRc2ZjDsF/oy0QW
	Bu6CPggeET9gKmVfIkCiSQ0xnBN8mYrW0MeFQm+Fvo0LzfnR25wQCBhCtyjgxIT5LixqZbb4ybk
	AtYaAC2fUsb5d7Tc4/dmwQvrP3Y2d8CoZ8D3R/OohdNWtrPceLok2mJwft6fm7cz6FhyctDkoSZ
	Wk9meG624cexnjEEI7l+MtDODgtPUqxJR04m83xHbtUbGE4Gv0em5jBaeNAoDD+ewhg6ISrWfWx
	u8Zq/XOwOv/eZN4vKjtFhiroxlrCAYBt8MlGs4bKbUgz1+tF7DsR+enXq/DAlvr5A406dFXqLoH
	Imn5ING3KLrMtlnmCwkA9Of50Iv5WdL9sGAKavsns4V1ydhHaedaY2XXF4LFl3KXA2/mRljZK/b
	D8J9E+C7dvXpJgmbbCfp9imLilYJLWezRP5RwehLe7/CfpTTkfEtDIXe3fhUBZU3AjflonEr/3+
	b7qKcLq9kjzHkUtxXE7ZC53JVUOvhHqrdbtLX5F1njpArJ+ADjLQ
X-Received: by 2002:a05:690c:d8b:b0:8b3:b06d:68b3 with SMTP id 00721157ae682-8b4aa23fe5amr17230507b3.18.1794589097198;
        Fri, 13 Nov 2026 08:58:17 -0800 (PST)
Received: from localhost ([2600:1700:220:5c80:dd1e:1850:73da:bf0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9549fasm24431307b3.21.2026.11.13.08.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:58:16 -0800 (PST)
Date: Fri, 13 Nov 2026 10:58:15 -0600
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, andybnac@gmail.com,
	dfustini@oss.tenstorrent.com, greentime.hu@sifive.com
Subject: Re:  riscv: kconfig: enable -mtune built kernel
Message-ID: <avdBp6PzfgEAUJs0@Tao-Chiu's-Mac>
References: <20261110200800.1073859-1-tchiu@tenstorrent.com>
 <avSGMnFGCw-oKdsP@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avSGMnFGCw-oKdsP@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_085819_046637_414193E5 
X-CRM114-Status: GOOD (  45.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:13:54PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 10, 2026 at 02:07:59PM -0600, Andy Chiu wrote:
> > On a machine that supports native unaligned access, enabling unaligned
> > access code-gen can result in a significant speedup on certain workloads.
> > As the adoption of application-level core increases, it has become
> > essential to build a kernel utilizing what's available on the platform.
> > 
> > Here are the examples of throughput improvement when the build is
> > configured to utilize misaligned access code-gen:
> > 
> > LZ4 compress: +90.6% (Ascalon-X), +35.1% (K3-X100)
> > LZ4 decompress: +9.8% (Ascalon-X), +76.6% (K3-X100)
> > ZSTD compress: +35.4% (Ascaloon-X), +19.4% (K3-X100)
> > ZSTD decompress: +26.0% (Ascalon-X), +7.5% (K3-X100)
> > 
> > btrfs create: +7.4% (Ascalon-X), +4.5% (K3-X100)
> > btrfs unlink: +7.2% (Ascalon-X), +2.6% (K3-X100)
> 
> how much improvement is from unaliagned access, and how much is from
> -mtune. So these numbers don't explain why -mtune is neceesary.

Native unaligned access is enabled only by selecting the -mtune that
assumes fast misaliged access. E.g. there is no single flag that turns
on native unaligned access code-gen alone. The detailed options are coded
in the compiler's souce code under gcc/config/riscv/riscv.cc

> > 
> > To enable such code-gen, the build system not only has to remove
> > -mstrict-align restriction, but also needs to set the proper -mtune cost
> > model to emit such accesses. -mstrict-align is gated by NONPORTABLE and
> > RISCV_EFFICIENT_UNALIGNED_ACCESS, and -mtune=generic-ooo enables the
> 
> 
> Following the same reason as arm64, I don't think we should introduce
> per-cpu -mtune options into arch/riscv/Kconfig.

Unfortunately we are not like arm64 where it has the ecosyetem authority
to mandate all platform to support fast misaligned access. Fragmentation
is destined in riscv and, though not personally convinced, people
celebrate it.

> 
> IIRC, arm64 intentionally avoided adding -mtune options to Kconfig to
> prevent endless per-vendor or even per-cpu option bloat, toolchain
> flag churn, and fragmention away from a sigle Image.
> 

Software that runs on embedded core can perform poorly on a more
advanced hardware. That is the nature of how optimization works.

With the availability of RVA23 hardware and the increasing supports from
distro vendors, I don't see a reason why we should hold back the
ecosystem progression under the illusion of harmony.

> >From another side, when someone needs a custom -mtune for a fixed
> target, they can pass the already well supported KCFLAGS="-mtune ..."
> at build time without needing dedicated Kconfig symbols for every
> core.
> 
> Furthermore, having an -mtune option silently select NONPORTABLE and
> RISCV_EFFICIENT_UNALIGNED_ACCESS breaks user expectations. NONPORTABLE
> breaks cross platform compatibility, while -mtune is just a compiler
> scheduling hint
> 

Again following the adoption of RVA23 profile, we foresee that it is
going to have a clear split of the software ecosystem and it is not
*portable* by design. On the distro end of the world, there is a need
for native misaligned access support, which turns off -mstrict-align and
kicks in generic-ooo mtune, whether it is defined in KCFLAGS or set as
the toolchain default.

We do not forbid people from building software that runs extremely slow in
order to support *all* hardware, and we don't see enabling native
misaligned access would break any hardware that is supposed to run
distro-level applications.

Cheers,
Andy

> thanks
> 
> > code-gen to emit misaligned accesses.
> > 
> > Add an entry in Kconfig so it allows the build system to select different
> > mtune options. Also, select NONPORTABLE and
> > RISCV_EFFICIENT_UNALIGNED_ACCESS when building with "generic-ooo", and
> > "tt-ascalon-d8".
> > 
> > Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
> > ---
> >  arch/riscv/Kconfig  | 62 +++++++++++++++++++++++++++++++++++++++++++++
> >  arch/riscv/Makefile | 14 ++++++++++
> >  2 files changed, 76 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e7891a2a89da..d53225fead4a 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -980,8 +980,67 @@ config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
> >  
> >  	  If you don't know what to do here, say N.
> >  
> > +config TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> > +	def_bool $(cc-option,-mtune=tt-ascalon-d8)
> > +
> > +choice
> > +	prompt "CPU tuning (-mtune)"
> > +	default RISCV_MTUNE_TOOLCHAIN_DEFAULT
> > +	help
> > +	  Select the microarchitecture the compiler should tune the kernel
> > +	  for. This only affects instruction scheduling and cost models, not
> > +	  the ISA, but some choices also assume fast unaligned accesses and
> > +	  therefore result in a non-portable kernel.
> > +
> > +config RISCV_MTUNE_TOOLCHAIN_DEFAULT
> > +	bool "Toolchain default"
> > +	help
> > +	  Do not pass -mtune; use whatever the toolchain was configured with.
> > +
> > +config RISCV_MTUNE_GENERIC_OOO
> > +	bool "generic-ooo"
> > +	depends on $(cc-option,-mtune=generic-ooo)
> > +	select NONPORTABLE
> > +	select RISCV_MTUNE_FAST_UNALIGNED
> > +	help
> > +	  Tune for a generic out-of-order core (-mtune=generic-ooo). This
> > +	  also assumes fast unaligned scalar accesses.
> > +
> > +config RISCV_MTUNE_TT_ASCALON
> > +	bool "Tenstorrent Ascalon"
> > +	depends on TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> > +	select NONPORTABLE
> > +	select RISCV_MTUNE_FAST_UNALIGNED
> > +	help
> > +	  Tune for the Tenstorrent Ascalon core (-mtune=tt-ascalon-d8). This
> > +	  also assumes fast unaligned scalar accesses.
> > +
> > +config RISCV_MTUNE_CUSTOM
> > +	bool "Custom"
> > +	help
> > +	  Pass -mtune=<RISCV_MTUNE> to the compiler.
> > +
> > +endchoice
> > +
> > +config RISCV_MTUNE
> > +	string "Custom -mtune value" if RISCV_MTUNE_CUSTOM
> > +	default "generic-ooo" if RISCV_MTUNE_GENERIC_OOO
> > +	default "tt-ascalon-d8" if RISCV_MTUNE_TT_ASCALON
> > +	default ""
> > +	help
> > +	  The value passed to -mtune=, e.g. "sifive-7-series". Only
> > +	  editable when the "Custom" CPU tuning is selected, in which case
> > +	  it must not be empty or the build will fail.
> > +
> > +config RISCV_MTUNE_FAST_UNALIGNED
> > +	bool
> > +	help
> > +	  Selected by -mtune choices that imply fast unaligned scalar
> > +	  accesses. Forces RISCV_EFFICIENT_UNALIGNED_ACCESS.
> > +
> >  choice
> >  	prompt "Unaligned Accesses Support"
> > +	default RISCV_EFFICIENT_UNALIGNED_ACCESS if RISCV_MTUNE_FAST_UNALIGNED
> >  	default RISCV_PROBE_UNALIGNED_ACCESS
> >  	help
> >  	  This determines the level of support for unaligned accesses. This
> > @@ -991,6 +1050,7 @@ choice
> >  
> >  config RISCV_PROBE_UNALIGNED_ACCESS
> >  	bool "Probe for hardware unaligned access support"
> > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> >  	select RISCV_SCALAR_MISALIGNED
> >  	help
> >  	  During boot, the kernel will run a series of tests to determine the
> > @@ -1002,6 +1062,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
> >  
> >  config RISCV_EMULATED_UNALIGNED_ACCESS
> >  	bool "Emulate unaligned access where system support is missing"
> > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> >  	select RISCV_SCALAR_MISALIGNED
> >  	help
> >  	  If unaligned memory accesses trap into the kernel as they are not
> > @@ -1012,6 +1073,7 @@ config RISCV_EMULATED_UNALIGNED_ACCESS
> >  config RISCV_SLOW_UNALIGNED_ACCESS
> >  	bool "Assume the system supports slow unaligned memory accesses"
> >  	depends on NONPORTABLE
> > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> >  	help
> >  	  Assume that the system supports slow unaligned memory accesses. The
> >  	  kernel and userspace programs may not be able to run at all on systems
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 44f5a439741a..08f1a32228ef 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -89,6 +89,11 @@ CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
> >  
> >  KBUILD_CFLAGS += -mno-save-restore
> >  
> > +riscv-mtune := $(CONFIG_RISCV_MTUNE:"%"=%)
> > +ifneq ($(riscv-mtune),)
> > +KBUILD_CFLAGS += -mtune=$(riscv-mtune)
> > +endif
> > +
> >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> >  	KBUILD_CFLAGS += -mcmodel=medlow
> >  endif
> > @@ -149,6 +154,15 @@ KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
> >  libs-y += arch/riscv/lib/
> >  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> >  
> > +archprepare: checkmtune
> > +PHONY += checkmtune
> > +checkmtune:
> > +ifeq ($(CONFIG_RISCV_MTUNE_CUSTOM)$(riscv-mtune),y)
> > +	@echo '*** CONFIG_RISCV_MTUNE_CUSTOM is set but CONFIG_RISCV_MTUNE is empty.' >&2
> > +	@echo '*** Set the custom -mtune value or pick another CPU tuning.' >&2
> > +	@false
> > +endif
> > +
> >  ifeq ($(KBUILD_EXTMOD),)
> >  ifeq ($(CONFIG_MMU),y)
> >  prepare: vdso_prepare
> > -- 
> > 2.43.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
