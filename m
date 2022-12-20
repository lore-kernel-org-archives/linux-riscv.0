Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3B4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY5twwP0mhYyDU3cUmo+eqLaA5f2rC8eBaBW8U6My9E=; b=G9YjHH9RrQ17m0gEVewvHfZ3sh
	WS+cSq2sG2ZiIBFkEEc54jbL5jFgNLENVFO/z9/WGDmTMAcjQfHa5WBgfKlIVqvarPK5VLUGExvPd
	YS1BlRGCF5L0MSDqFBoQMdD8MClvaSXnAL9GiFIpoFO5KEkKSH+5exFckUZFx0d7i6ipgB7Rlwclj
	0rjsZTa/unP9Akf1leuCMVLqp/DjEqjl7WQn6SxZl7prVjBRjT73U3S23znyRx60VURS/lEJFjvfk
	/zVxFjOpyDYnT2tc+KUA9goJzs1lh7JEo1RyyI9+hvnOULNlXLP9f+7QZou2F1STZkcaDBgUlBjJq
	doIRDdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c9g-00FJpB-JP; Tue, 20 Dec 2022 12:55:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c9b-00FJjZ-AO; Tue, 20 Dec 2022 12:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671540931; x=1703076931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tD88JQR8EdgN3Tk0DTOKqMuCno3Q7oQajZZZjhQjQxw=;
  b=eLhRKNw6YsJvmaMKHwqN8ZnBQkJ5FOlCMoH9h9Ok+TRy8Zi3JhZA95ez
   cZe7NWhpA+kFu/IFOvBR+xJBpGqrAQ2wM1Bb6c10CehA9QrGuFllUbalu
   yzBJV5xLGttirOv12jQuthAml/oEflH53hiThnl3sDPzSDiE1G3SLIT6V
   J7jfqRl2wAy+TAeV0cYCzC7peMLB7k19fArhIr9hVaxfXUgQztIjy/hvx
   wU/HrEKPddxva2Qx0tv2AW66yKDEz6eFYqQyoLZww/qN0JIGfaFdglokO
   jqmB8l+WfgslLy2p/ytFOxVBauGD+WutbplSnMy0MKOJuGKwxJFWfVCAS
   w==;
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="asc'?scan'208";a="192503619"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Dec 2022 05:55:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 05:55:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 20 Dec 2022 05:55:27 -0700
Date: Tue, 20 Dec 2022 12:55:07 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 0/9] RISC-V: Apply Zicboz to clear_page and memset
Message-ID: <Y6Gwq3f6sFa2gBNZ@wendy>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_045531_551012_F40EE883 
X-CRM114-Status: GOOD (  34.47  )
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
Content-Type: multipart/mixed; boundary="===============6843130145198178577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6843130145198178577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V13zJ2q6N0rDiqi0"
Content-Disposition: inline

--V13zJ2q6N0rDiqi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew,

I assume you're not gonna respin this one before the xmas holidays etc,
but a v2 is on the cards, right?

Thanks,
Conor.

On Thu, Oct 27, 2022 at 03:02:38PM +0200, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is less than half the old count (see
> patch4's commit message for more details). Another candidate for the
> extension is memset(), but, since memset() isn't just used for zeroing
> memory and it accepts arbitrarily aligned addresses and arbitrary sizes,
> it's not as obvious if adding support for Zicboz will be an overall win.
> In order to make a determination, I've done some analysis and wrote my
> conclusions in the bullets below.
>=20
> * When compiling the kernel without CONFIG_RISCV_ISA_ZICBOZ, memset()
>   doesn't change, so that's fine.
>=20
> * The overhead added to memset() when the Zicboz extension isn't present,
>   but CONFIG_RISCV_ISA_ZICBOZ is selected, is 3 jumps to known targets,
>   which I believe is fine.
>=20
> * The overhead added to a memset() invocation which is not zeroing memory
>   is 7 instructions, where 3 are branches. This seems fine and,
>   furthermore, memset() is almost always invoked to zero memory (99% [2]).
>=20
> * When memset() is invoked to zero memory, the proposed Zicboz extended
>   memset() always has a lower dynamic instruction count than the current
>   memset() as long as the input address is Zicboz block aligned and the
>   length is >=3D the block size.
>=20
> * When memset() is invoked to zero memory, the proposed Zicboz extended
>   memset() is always worse for unaligned or too small inputs than the
>   current memset(), but it's only at most a few dozen instructions worse.
>   I think this is probably fine, especially considering the large majority
>   of zeroing invocations are 64 bytes or larger and are aligned to a
>   power-of-2 boundary, 64-byte or larger (77% [2]).
>=20
> [1] I ported the functions under test to userspace and linked them with
>     a test program. Then, I ran them under gdb with a script[3] which
>     counted instructions by single stepping.
>=20
> [2] I wrote bpftrace scripts[4] to count memset() invocations to see the
>     frequency of it being used to zero memory and have block size aligned
>     input addresses with block size or larger lengths. The workload was
>     just random desktop stuff including streaming video and compiling.
>     While I did run this on my x86 notebook, I still expect the data to
>     be representative on RISC-V. Note, x86 has clear_page() so the
>     memset() data regarding alignment and size weren't over inflated by
>     page zeroing invocations. Grepping also shows the large majority of
>     memset() calls are to zero memory (93%).
>=20
> [3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
> [4] https://gist.github.com/jones-drew/1e860692cf6fc0fb2a82a04c9ce720fe
>=20
> These patches are based on the following pending series
>=20
> 1. "[PATCH v2 0/3] RISC-V: Ensure Zicbom has a valid block size"
>    20221024091309.406906-1-ajones@ventanamicro.com
>=20
> 2. "[PATCH 0/8] riscv: improve boot time isa extensions handling"
>    20221006070818.3616-1-jszhang@kernel.org
>    Also including the additional patch proposed here
>    20221013162038.ehseju2neic2xu5z@kamzik
>=20
> The patches are also available here
> https://github.com/jones-drew/linux/commits/riscv/zicboz
>=20
> To test over QEMU this branch may be used to enable Zicboz
> https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz
>=20
> To test running a KVM guest with Zicboz this kvmtool branch may be used
> https://github.com/jones-drew/kvmtool/commits/riscv/zicboz
>=20
> Thanks,
> drew
>=20
> Andrew Jones (9):
>   RISC-V: Factor out body of riscv_init_cbom_blocksize loop
>   RISC-V: Add Zicboz detection and block size parsing
>   RISC-V: insn-def: Define cbo.zero
>   RISC-V: Use Zicboz in clear_page when available
>   RISC-V: KVM: Provide UAPI for Zicboz block size
>   RISC-V: KVM: Expose Zicboz to the guest
>   RISC-V: lib: Improve memset assembler formatting
>   RISC-V: lib: Use named labels in memset
>   RISC-V: Use Zicboz in memset when available
>=20
>  arch/riscv/Kconfig                  |  13 ++
>  arch/riscv/include/asm/cacheflush.h |   3 +-
>  arch/riscv/include/asm/hwcap.h      |   1 +
>  arch/riscv/include/asm/insn-def.h   |  50 ++++++
>  arch/riscv/include/asm/page.h       |   6 +-
>  arch/riscv/include/uapi/asm/kvm.h   |   2 +
>  arch/riscv/kernel/cpu.c             |   1 +
>  arch/riscv/kernel/cpufeature.c      |  10 ++
>  arch/riscv/kernel/setup.c           |   2 +-
>  arch/riscv/kvm/vcpu.c               |  11 ++
>  arch/riscv/lib/Makefile             |   1 +
>  arch/riscv/lib/clear_page.S         |  28 ++++
>  arch/riscv/lib/memset.S             | 241 +++++++++++++++++++---------
>  arch/riscv/mm/cacheflush.c          |  64 +++++---
>  14 files changed, 325 insertions(+), 108 deletions(-)
>  create mode 100644 arch/riscv/lib/clear_page.S
>=20
> --=20
> 2.37.3
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--V13zJ2q6N0rDiqi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6GwqwAKCRB4tDGHoIJi
0icLAP95XdX32d/fafDtYXAXx7VX9IoeJuVaQGCTGxf1xBUGdAEAmRnHMf1zdLY3
mDlCpT0/lw2dQpjpK2TCLzn8kU42ywU=
=5860
-----END PGP SIGNATURE-----

--V13zJ2q6N0rDiqi0--


--===============6843130145198178577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6843130145198178577==--

