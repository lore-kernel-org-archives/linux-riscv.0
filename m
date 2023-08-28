Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD1BC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt5UQKHKbf+X+ZCG3pNpjkLRbhUHPUPhL9u8Pc4pEe0=; b=ekRG9XpZLNKf8bFH1Z+E1amhLJ
	KEHfn8pdSXrKbmVnNilJnf9Jtfp9x6DPhmEJNBwL/LV88bhyaWB24U98JXFP7rrIeLmYVh7V5B6YJ
	CGOjUKjP3yDGyButgmfEuNkKQvP2Lk6NNB/KXJSi8IKhEpWoq/qeB3Ba3mtNmlAIqN1hhRx4qunws
	67cHWCCmNXE1Mv6zVOTDuCw9A9Ht+WXmr4TpUDEFG4989I7KDMmV0dzHF0IttyeSMhRqtfOjVFM2V
	SFSDRicMvzrCo87Pjr5ZG0gAyQmBaSWKyROfnE+ZmWa98alxurZopBnKMXbIgNjG/8EKHWFYT+Cch
	YwHVk4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafjM-009y4F-35;
	Mon, 28 Aug 2023 17:08:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafjJ-009y3P-2M
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 17:08:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 221DC64D76;
	Mon, 28 Aug 2023 17:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372B0C433C7;
	Mon, 28 Aug 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693242524;
	bh=y+ljMwjMEPZa/4+qVlDMtUA2Rrect/dW3kIPMzaa+js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUbeXZMjnIw7oVGkbF4ZeJKVQzpOwKLVBqGfXUuN6Wtx3O+NLr9+aayIFGmiMya2D
	 efzTIsUnO35QNXOf6khV2HhIcQSy9wfEvBjjYAThnHrL2c0pRNxzni94GTRGNzahcV
	 e6CRuh7+JTHm92zqrJsSUDKfo9TWkZBLNBhcmystybsCboKeTvdni+zPZGwkJbqqv+
	 6T1RdqBOJj7nRVuuU60YvpkGW4RU70So4+tXRASd/TW1liXf7D2vhxO2/oGfsDB0I9
	 Y5Ggs9mLyByLc5ru/cK52k5VdTlIRO39h+4+kLzpcOjp9VFvHhvROA/FWJ4c+IgX5O
	 /ocTn/5KcthsA==
Date: Mon, 28 Aug 2023 18:08:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <20230828-deserve-paging-25666290e312@spud>
References: <20230827-turf-parched-b965bc697882@spud>
 <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
 <20230827-primer-conceal-b6f24b29e692@spud>
 <20230827-divisive-happy-cf93058c49bf@spud>
 <ZOzRlerSNjfzMYGH@ghost>
MIME-Version: 1.0
In-Reply-To: <ZOzRlerSNjfzMYGH@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_100845_859840_F533AC33 
X-CRM114-Status: GOOD (  64.43  )
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
Content-Type: multipart/mixed; boundary="===============2842934513959444287=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2842934513959444287==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IHEDCekCjrM9VSaO"
Content-Disposition: inline


--IHEDCekCjrM9VSaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 09:55:49AM -0700, Charlie Jenkins wrote:
> On Sun, Aug 27, 2023 at 01:25:27PM +0100, Conor Dooley wrote:
> > On Sun, Aug 27, 2023 at 11:28:33AM +0100, Conor Dooley wrote:
> > > On Sat, Aug 26, 2023 at 07:00:47PM -0700, Palmer Dabbelt wrote:
> > > > On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> > > > > On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> > > > > > Provide checksum algorithms that have been designed to leverage=
 riscv
> > > > > > instructions such as rotate. In 64-bit, can take advantage of t=
he larger
> > > > > > register to avoid some overflow checking.
> > > > > >=20
> > > > > > Add configuration for Zba extension and add march for Zba and Z=
bb.
> > > > > >=20
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > > ---
> > > > > >  arch/riscv/Kconfig                | 23 +++++++++++
> > > > > >  arch/riscv/Makefile               |  2 +
> > > > > >  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++=
++++++++++++++++
> > > > > >  3 files changed, 111 insertions(+)
> > > > > >=20
> > > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > > index 4c07b9189c86..8d7e475ca28d 100644
> > > > > > --- a/arch/riscv/Kconfig
> > > > > > +++ b/arch/riscv/Kconfig
> > > > > > @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > > > > >  	  If you don't know what to do here, say Y.
> > > > > > +config TOOLCHAIN_HAS_ZBA
> > > > > > +	bool
> > > > > > +	default y
> > > > > > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64im=
a_zba)
> > > > > > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32i=
ma_zba)
> > > > > > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> > > > > > +	depends on AS_HAS_OPTION_ARCH
> > > > > > +
> > > > > > +config RISCV_ISA_ZBA
> > > > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > > > +	depends on TOOLCHAIN_HAS_ZBA
> > > > > > +	depends on MMU
> > > > > > +	depends on RISCV_ALTERNATIVE
> > > > > > +	default y
> > > > > > +	help
> > > > > > +	   Adds support to dynamically detect the presence of the ZBA
> > > > > > +	   extension (basic bit manipulation) and enable its usage.
> > > > > > +
> > > > > > +	   The Zba extension provides instructions to accelerate a nu=
mber
> > > > > > +	   of bit-specific address creation operations.
> > > > > > +
> > > > > > +	   If you don't know what to do here, say Y.
> > > > > > +
> > > > > >  config TOOLCHAIN_HAS_ZBB
> > > > > >  	bool
> > > > > >  	default y
> > > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > > index 6ec6d52a4180..51fa3f67fc9a 100644
> > > > > > --- a/arch/riscv/Makefile
> > > > > > +++ b/arch/riscv/Makefile
> > > > > > @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> > > > > >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> > > > > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > > > > >  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> > > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:=3D $(riscv-march-y)_zba
> > > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:=3D $(riscv-march-y)_zbb
> > > > >=20
> > > > > AFAICT, this is going to break immediately on any system that ena=
bles
> > > > > RISCV_ISA_ZBA (which will happen by default) but does not support=
 the
> > > > > extension. You made the option depend on RISCV_ALTERNATIVE, but I=
 do
> > > > > not see any use of alternatives in the code to actually perform t=
he
> > > > > dynamic detection of Zba.
> > > >=20
> > > > I guess we kind of have an ambiguity here: for stuff like C we just
> > > > unconditionally use the instructions, but for the rest we probe fir=
st.  We
> > > > should probably have three states for each extension: disabled, dyn=
amically
> > > > detected, and assumed.
> > >=20
> > > You mean, just add some comments to the makefile surrounding each
> > > section or to some rst documentation?
> >=20
> > Also, the code here doesn't build w/
> > 	warning: invalid argument to '-march': '_zba_zbb_zicsr_zifencei_zihint=
pause'
> > so there's something else wrong with TOOLCHAIN_HAS_ZBA :)
> It is odd that this is missing 'rv64ima' or 'rv32ima' at the beginning of
> this string. What configuration are you using that could cause that to
> be left off?

I don't know, but that configuration is pretty pervasive. The patchwork
CI blew up too & that is using kernel.org toolchains built by Arnd:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

> Compiling with defconfig automatically enables Zba and appears to not
> cause this issue. I realized that I put the header definitions for
> do_csum and csum_ipv6_magic in this patch instead of the next one so the
> code will fail to compile from this but not due to march settings.
> >=20
> > >=20
> > > > > Note that for fd & v, we add it to riscv-march-y, but then immedi=
ately
> > > > > remove it again before passing to the compiler, only allow them in
> > > > > AFLAGS:
> > > > > 	# Remove F,D,V from isa string for all. Keep extensions between =
"fd" and "v" by
> > > > > 	# matching non-v and non-multi-letter extensions out with the fi=
lter ([^v_]*)
> > > > > 	KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed =
-E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > > > >=20
> > > > > What am I missing?
> > > >=20
> > > > FD and V both have state that can be saved lazily, so we can't let =
arbitrary
> > > > code use them.  The extensions formally known as B don't add state,=
 so they
> > > > are safe to flip on in arbitrary places (aside from the issues you =
pointed
> > > > out above).
> > >=20
> > > I probably went about this badly since you missed the point. I was
> > > trying to point out that for anything other than the compressed
> > > extensions in the block above that we only pass them in march to the
> > > assembler, and not to the compiler, in contrast to this patch which j=
ust
> > > always passes them. I should have pointed to how we handled the
> > > in-kernel Zbb stuff & asked how this was any different, would probably
> > > have been clearer.
> > >=20
> I supposed it might be better if I submit these changes in a different
> patch so we can have more discussion there. Zbb was previously only used
> by assembly files (arch/riscv/lib/strcmp.S, arch/riscv/lib/strlen.S,
> arch/riscv/lib/strncmp.S). I wanted to add them to the compiler so that
> that C programs could leverage these extensions. However, I neglected to
> consider machines that compile the kernel with these extensions but have
> cores without these extensions.

Less so cores, since we don't support heterogeneous stuff, and moreso
platforms that do not support the extensions. It's expected that the
same kernel could in theory be used across a wide variety of systems.

> The purpose of using these extensions is
> to save a couple of clock cycles, so if it is necessary to first
> check if the extension is enabled it may not be worth it for these
> functions.

That's still possible, it's what the alternatives mechanism exists for.
During boot the codepaths are patched to use what works for a given
machine, check out the code that makes use of Zbb or
riscv_has_extension_[un]likely(). You'd need to do something like the
existing users of Zbb instructions does, with an alternative used to
avoid the custom asm implementations when the hardware does not support
them. (That's what the CONFIG_ALTERNATIVE & CONFIG_AS_HAS_OPTION_ARCH
options you made the TOOLCHAIN_HAS_ZBA depend on are for).

--IHEDCekCjrM9VSaO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOzUmAAKCRB4tDGHoIJi
0tYHAQDf9mOxIHWOj+mf+EPKlTEcl0XTG7gvddO2W/AJUQhQ4gD/aE6mepT/W59X
lPZKLfzqc64FqL9wxopRaCj2MARYqw8=
=drmv
-----END PGP SIGNATURE-----

--IHEDCekCjrM9VSaO--


--===============2842934513959444287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2842934513959444287==--

