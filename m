Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EE606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 03:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QH/a57ge;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zboh6BuZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ess/vdtSlO3EWMvaO6mXprf4uEKr1qZUYaF/XgfIdHE=; b=QH/a57getC7Eo0P74B+YJHakxj
	Hzpnwo2igkoVCp58FL891y7DXwDsszmLakNQw1XA3A3EGeb8Cp6dYb2tDxB7kNvst1pyQFB52C8PY
	p3QnOLJ+1mi+XwuW+mmvn5hr/UXFjLwgwXIIOuJsDWM5DfcOKwVdjxcxslvWbOKvjo4DVZhza8ZDM
	whAyfTPb/3fdQqS7PLzpUvDELEI/HCkBLJYPM4C1LGeOSYfAI4YcFH+OWSjlN7JUXpDiCOe+mpzsZ
	1/rM1FlWCS9wBL4a7NjUx6BUbXmPqdSEiu6HHeo2rAEk4Z6hU38jQTHWWDPoKVKR8GaKwi+XM0AvE
	9eiEhcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4fw-0000000FIyF-1Irr;
	Sat, 14 Nov 2026 03:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4fu-0000000FIxc-1BOB
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 03:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15C216128B;
	Sat, 14 Nov 2026 03:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00771F000C4;
	Sat, 14 Nov 2026 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794627812;
	bh=KXSGI76DYXi9MwxnHtWw4b9qDjaklnQXzOYn9RevRNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zboh6BuZ61PEKYSsKrYJ0pUoQS5IirRwguOPb6DHEJQghi3i7kHaG8LYT70TBwkxs
	 LUpb++P+8aakehGYlvHeA2k3WZBwd8obeIR6VnVXhAoE+yf5WqEEE0fir3Ek7cqRxv
	 58SPpk5OEE8B7h6+8RMhBGI1sYvbkux6v3Qn/NbfeVvSQbEbktVmLcvWGWTK8hAI3v
	 mIKemb2dENZpQRxs0g/td1O/ms7CFx6IMVdcB6xNvrwC7JHzqlKSbS/wLfcO+xu4l9
	 BVvVhLBojlpIeZQATUblKcZ//yJ+l/cIxAjHdPY4OomLNBrCb4V5F0OtIgh9FxkSQ0
	 6Xb3xo+Db/tJw==
Date: Sat, 14 Nov 2026 11:23:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, andybnac@gmail.com,
	dfustini@oss.tenstorrent.com, greentime.hu@sifive.com
Subject: Re: riscv: kconfig: enable -mtune built kernel
Message-ID: <avfUJs0wNYzbISai@xhacker>
References: <20261110200800.1073859-1-tchiu@tenstorrent.com>
 <avSGMnFGCw-oKdsP@xhacker>
 <avdBp6PzfgEAUJs0@Tao-Chiu's-Mac>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avdBp6PzfgEAUJs0@Tao-Chiu's-Mac>
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

On Fri, Nov 13, 2026 at 10:58:15AM -0600, Andy Chiu wrote:
> On Wed, Nov 11, 2026 at 11:13:54PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 10, 2026 at 02:07:59PM -0600, Andy Chiu wrote:
> > > On a machine that supports native unaligned access, enabling unaligned
> > > access code-gen can result in a significant speedup on certain workloads.
> > > As the adoption of application-level core increases, it has become
> > > essential to build a kernel utilizing what's available on the platform.
> > > 
> > > Here are the examples of throughput improvement when the build is
> > > configured to utilize misaligned access code-gen:
> > > 
> > > LZ4 compress: +90.6% (Ascalon-X), +35.1% (K3-X100)
> > > LZ4 decompress: +9.8% (Ascalon-X), +76.6% (K3-X100)
> > > ZSTD compress: +35.4% (Ascaloon-X), +19.4% (K3-X100)
> > > ZSTD decompress: +26.0% (Ascalon-X), +7.5% (K3-X100)
> > > 
> > > btrfs create: +7.4% (Ascalon-X), +4.5% (K3-X100)
> > > btrfs unlink: +7.2% (Ascalon-X), +2.6% (K3-X100)
> > 
> > how much improvement is from unaliagned access, and how much is from
> > -mtune. So these numbers don't explain why -mtune is neceesary.
> 
> Native unaligned access is enabled only by selecting the -mtune that
> assumes fast misaliged access. E.g. there is no single flag that turns
> on native unaligned access code-gen alone. The detailed options are coded
> in the compiler's souce code under gcc/config/riscv/riscv.cc

by "unaliagned access" I mean enable RISCV_EFFICIENT_UNALIGNED_ACCESS.
So can you plz show performance gain of
RISCV_EFFICIENT_UNALIGNED_ACCESS vs. RISCV_EFFICIENT_UNALIGNED_ACCESS + mtune

> 
> > > 
> > > To enable such code-gen, the build system not only has to remove
> > > -mstrict-align restriction, but also needs to set the proper -mtune cost
> > > model to emit such accesses. -mstrict-align is gated by NONPORTABLE and
> > > RISCV_EFFICIENT_UNALIGNED_ACCESS, and -mtune=generic-ooo enables the
> > 
> > 
> > Following the same reason as arm64, I don't think we should introduce
> > per-cpu -mtune options into arch/riscv/Kconfig.
> 
> Unfortunately we are not like arm64 where it has the ecosyetem authority
> to mandate all platform to support fast misaligned access. Fragmentation
> is destined in riscv and, though not personally convinced, people
> celebrate it.
> 
> > 
> > IIRC, arm64 intentionally avoided adding -mtune options to Kconfig to
> > prevent endless per-vendor or even per-cpu option bloat, toolchain
> > flag churn, and fragmention away from a sigle Image.
> > 
> 
> Software that runs on embedded core can perform poorly on a more
> advanced hardware. That is the nature of how optimization works.
> 
> With the availability of RVA23 hardware and the increasing supports from
> distro vendors, I don't see a reason why we should hold back the
> ecosystem progression under the illusion of harmony.
> 
> > >From another side, when someone needs a custom -mtune for a fixed
> > target, they can pass the already well supported KCFLAGS="-mtune ..."
> > at build time without needing dedicated Kconfig symbols for every
> > core.
> > 
> > Furthermore, having an -mtune option silently select NONPORTABLE and
> > RISCV_EFFICIENT_UNALIGNED_ACCESS breaks user expectations. NONPORTABLE
> > breaks cross platform compatibility, while -mtune is just a compiler
> > scheduling hint
> > 
> 
> Again following the adoption of RVA23 profile, we foresee that it is
> going to have a clear split of the software ecosystem and it is not
> *portable* by design. On the distro end of the world, there is a need
> for native misaligned access support, which turns off -mstrict-align and
> kicks in generic-ooo mtune, whether it is defined in KCFLAGS or set as
> the toolchain default.

There's misunderstanding here. I didn't say "-mtune" doesn't help, my main
point is I didn't see the necessity of dedicated RISCV_MTUNE Kconfig
option given the well supported KCFLAGS +
RISCV_EFFICIENT_UNALIGNED_ACCESS can acchieve the same effect, while
RISCV_MTUNE adds endless per-vendor or even per-cpu option bloat.

> 
> We do not forbid people from building software that runs extremely slow in
> order to support *all* hardware, and we don't see enabling native
> misaligned access would break any hardware that is supposed to run
> distro-level applications.
> 
> Cheers,
> Andy
> 
> > thanks
> > 
> > > code-gen to emit misaligned accesses.
> > > 
> > > Add an entry in Kconfig so it allows the build system to select different
> > > mtune options. Also, select NONPORTABLE and
> > > RISCV_EFFICIENT_UNALIGNED_ACCESS when building with "generic-ooo", and
> > > "tt-ascalon-d8".
> > > 
> > > Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
> > > ---
> > >  arch/riscv/Kconfig  | 62 +++++++++++++++++++++++++++++++++++++++++++++
> > >  arch/riscv/Makefile | 14 ++++++++++
> > >  2 files changed, 76 insertions(+)
> > >> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index e7891a2a89da..d53225fead4a 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -980,8 +980,67 @@ config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
> > >  
> > >  	  If you don't know what to do here, say N.
> > >  
> > > +config TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> > > +	def_bool $(cc-option,-mtune=tt-ascalon-d8)
> > > +
> > > +choice
> > > +	prompt "CPU tuning (-mtune)"
> > > +	default RISCV_MTUNE_TOOLCHAIN_DEFAULT
> > > +	help
> > > +	  Select the microarchitecture the compiler should tune the kernel
> > > +	  for. This only affects instruction scheduling and cost models, not
> > > +	  the ISA, but some choices also assume fast unaligned accesses and
> > > +	  therefore result in a non-portable kernel.
> > > +
> > > +config RISCV_MTUNE_TOOLCHAIN_DEFAULT
> > > +	bool "Toolchain default"
> > > +	help
> > > +	  Do not pass -mtune; use whatever the toolchain was configured with.
> > > +
> > > +config RISCV_MTUNE_GENERIC_OOO
> > > +	bool "generic-ooo"
> > > +	depends on $(cc-option,-mtune=generic-ooo)
> > > +	select NONPORTABLE
> > > +	select RISCV_MTUNE_FAST_UNALIGNED
> > > +	help
> > > +	  Tune for a generic out-of-order core (-mtune=generic-ooo). This
> > > +	  also assumes fast unaligned scalar accesses.
> > > +
> > > +config RISCV_MTUNE_TT_ASCALON
> > > +	bool "Tenstorrent Ascalon"
> > > +	depends on TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> > > +	select NONPORTABLE
> > > +	select RISCV_MTUNE_FAST_UNALIGNED
> > > +	help
> > > +	  Tune for the Tenstorrent Ascalon core (-mtune=tt-ascalon-d8). This
> > > +	  also assumes fast unaligned scalar accesses.
> > > +
> > > +config RISCV_MTUNE_CUSTOM
> > > +	bool "Custom"
> > > +	help
> > > +	  Pass -mtune=<RISCV_MTUNE> to the compiler.
> > > +
> > > +endchoice
> > > +
> > > +config RISCV_MTUNE
> > > +	string "Custom -mtune value" if RISCV_MTUNE_CUSTOM
> > > +	default "generic-ooo" if RISCV_MTUNE_GENERIC_OOO
> > > +	default "tt-ascalon-d8" if RISCV_MTUNE_TT_ASCALON
> > > +	default ""
> > > +	help
> > > +	  The value passed to -mtune=, e.g. "sifive-7-series". Only
> > > +	  editable when the "Custom" CPU tuning is selected, in which case
> > > +	  it must not be empty or the build will fail.
> > > +
> > > +config RISCV_MTUNE_FAST_UNALIGNED
> > > +	bool
> > > +	help
> > > +	  Selected by -mtune choices that imply fast unaligned scalar
> > > +	  accesses. Forces RISCV_EFFICIENT_UNALIGNED_ACCESS.
> > > +
> > >  choice
> > >  	prompt "Unaligned Accesses Support"
> > > +	default RISCV_EFFICIENT_UNALIGNED_ACCESS if RISCV_MTUNE_FAST_UNALIGNED
> > >  	default RISCV_PROBE_UNALIGNED_ACCESS
> > >  	help
> > >  	  This determines the level of support for unaligned accesses. This
> > > @@ -991,6 +1050,7 @@ choice
> > >  
> > >  config RISCV_PROBE_UNALIGNED_ACCESS
> > >  	bool "Probe for hardware unaligned access support"
> > > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> > >  	select RISCV_SCALAR_MISALIGNED
> > >  	help
> > >  	  During boot, the kernel will run a series of tests to determine the
> > > @@ -1002,6 +1062,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
> > >  
> > >  config RISCV_EMULATED_UNALIGNED_ACCESS
> > >  	bool "Emulate unaligned access where system support is missing"
> > > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> > >  	select RISCV_SCALAR_MISALIGNED
> > >  	help
> > >  	  If unaligned memory accesses trap into the kernel as they are not
> > > @@ -1012,6 +1073,7 @@ config RISCV_EMULATED_UNALIGNED_ACCESS
> > >  config RISCV_SLOW_UNALIGNED_ACCESS
> > >  	bool "Assume the system supports slow unaligned memory accesses"
> > >  	depends on NONPORTABLE
> > > +	depends on !RISCV_MTUNE_FAST_UNALIGNED
> > >  	help
> > >  	  Assume that the system supports slow unaligned memory accesses. The
> > >  	  kernel and userspace programs may not be able to run at all on systems
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 44f5a439741a..08f1a32228ef 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -89,6 +89,11 @@ CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
> > >  
> > >  KBUILD_CFLAGS += -mno-save-restore
> > >  
> > > +riscv-mtune := $(CONFIG_RISCV_MTUNE:"%"=%)
> > > +ifneq ($(riscv-mtune),)
> > > +KBUILD_CFLAGS += -mtune=$(riscv-mtune)
> > > +endif
> > > +
> > >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> > >  	KBUILD_CFLAGS += -mcmodel=medlow
> > >  endif
> > > @@ -149,6 +154,15 @@ KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
> > >  libs-y += arch/riscv/lib/
> > >  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> > >  
> > > +archprepare: checkmtune
> > > +PHONY += checkmtune
> > > +checkmtune:
> > > +ifeq ($(CONFIG_RISCV_MTUNE_CUSTOM)$(riscv-mtune),y)
> > > +	@echo '*** CONFIG_RISCV_MTUNE_CUSTOM is set but CONFIG_RISCV_MTUNE is empty.' >&2
> > > +	@echo '*** Set the custom -mtune value or pick another CPU tuning.' >&2
> > > +	@false
> > > +endif
> > > +
> > >  ifeq ($(KBUILD_EXTMOD),)
> > >  ifeq ($(CONFIG_MMU),y)
> > >  prepare: vdso_prepare
> > > -- 
> > > 2.43.0
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
