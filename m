Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8471C74A44
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNgmzmRrPmBEmuiskinw/abKuqM4tWiy/ytH4fn4vFQ=; b=h8fRFIuMWqdXef
	KUFteskeHLzvKbNA0TfxATv5YjaWu+Bgm0Mgpof3NnQFIAxj9d5S8zwAbNX/eA8Pk9SfZVZuRD2OP
	aPwg2vJ0D5MIwBvU3g83DpYRDeqqM65HgfZfylb5BjbMSQZD27mMIu0ufkLlp4bpE2QKkXP9oQo20
	P3Y/VjaTC61zRt/rVahZr5XO8ibqOQoeh2VggOPLUqKYEahXF3ZnMMMUDJhndCaO+9KNuKWb+Sd2O
	jx79dhFFmRsJw73+E2DAmJY/F8aPvEfe4bVuO+NSMbvOPe37i8w+FthFqY/vplb0EzY1fa1YNKLHl
	K/WFfmBMoqGesbc4YuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pauyM-00HWuB-PA; Sat, 11 Mar 2023 08:53:02 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pauyI-00HWss-EI
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 08:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=oGlz0x3waUETRxmcy9pz+bC50AW+Mj+vbt06v0RUcGI=; b=k8vkyBbcUPKoQCtzQ2jgVV/flg
	sLhI9zILLXp4T/qCOsob3BNijz3pCsR6e6oUleRMvu2Agn+QG/HLjvmV+YX9BUaFKqPnLcsF/xsH+
	yPH9U++3miVB5IjiCG6AkOE/lqGT5EMRoThhfRYRig66Aim1nRmjvPfr2tnIqtkLE+YmeCNL3yssH
	EQN2MF74lntRkUavlczPBIBXX/iI8FrCJY6/oVTi5lFQYbU1R1vzNjdcVv5G2FE+jb4HeBXXuFDje
	YjrRKmbHJvFF6S1+FdcRy43CrSXnx8bhUdkX73g0uoydBASnHc2F5Gii0x9WilfgKFlP/st6m91Vk
	XwYrfmIw==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1pauy1-00Bga5-4p; Sat, 11 Mar 2023 09:52:41 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1pauxz-009Tvm-1c;
	Sat, 11 Mar 2023 09:52:39 +0100
Date: Sat, 11 Mar 2023 09:52:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: conor@kernel.org, conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	naresh.kamboju@linaro.org, nathan@kernel.org,
	ndesaulniers@google.com, palmer@dabbelt.com, palmer@rivosinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
Message-ID: <ZAxBVwLsUr1yQ4GZ@aurel32.net>
References: <20230308220842.1231003-1-conor@kernel.org>
 <20230310150754.535425-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310150754.535425-1-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_005258_947060_B11DC485 
X-CRM114-Status: GOOD (  29.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-03-10 23:07, Bin Meng wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The spec folk, in their infinite wisdom, moved both control and status
> > registers & the FENCE.I instructions out of the I extension into their
> > own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
> > spec [0].
> > The GCC/binutils crew decided [1] to move their default version of the
> > ISA spec to the 20191213 version of the ISA spec, which came into being
> > for version 2.38 of binutils and GCC 12. Building with this toolchain
> > configuration would result in assembler issues:
> >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> > This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binutils
> > 2.38") by Aurelien Jarno, but has proven fragile.
> > 
> > Before LLVM 17, LLVM did not support these extensions and, as such, the
> > cc-option check added by Aurelien worked. Since commit 22e199e6afb1
> > ("[RISCV] Accept zicsr and zifencei command line options") however, LLVM
> > *does* support them and the cc-option check passes.
> > 
> > This surfaced as a problem while building the 5.10 stable kernel using
> > the default Tuxmake Debian image [2], as 5.10 did not yet support ld.lld,
> > and uses the Debian provided binutils 2.35.
> > Versions of ld prior to 2.38 will refuse to link if they encounter
> > unknown ISA extensions, and unfortunately Zifencei is not supported by
> > bintuils 2.35.
> > 
> > Instead of dancing around with adding these extensions to march, as we
> > currently do, Palmer suggested locking GCC builds to the same version of
> > the ISA spec that is used by LLVM. As far as I can tell, that is 2.2,
> > with, apparently [3], a lack of interest in implementing a flag like
> > GCC's -misa-spec at present.
> > 
> > Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS when
> > GCC is used & remove the march dance.
> > 
> > As clang does not accept this argument, I had expected to encounter
> > issues with the assembler, as neither zicsr nor zifencei are present in
> > the ISA string and the spec version *should* be defaulting to a version
> > that requires them to be present. The build passed however and the
> > resulting kernel worked perfectly fine for me on a PolarFire SoC...
> > 
> > Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [0]
> > Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4 [1]
> > Link: https://lore.kernel.org/all/CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
> > Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec-version-misa-spec-gcc-flag-equivalent/66935 [3]
> > CC: stable@vger.kernel.org
> > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > I think Aurelien's original commit message might actually not be quite
> > correct? I found, in my limited testing, that it is not the default
> > behaviour of gas that matters, but rather the toolchain itself?
> > My binutils versions (both those built using the clang-built-linux
> > tc-build scripts which do not set an ISA spec version, and one built
> > using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec version
> > set) do not encounter these issues.
> 
> I am unable to reproduce the build failure as reported by commit 6df2a016c0c8
> ("riscv: fix build with binutils 2.38") by Aurelien Jarno using kernel.org
> pre-built GCC 11.3.0 [1] which includes binutils 2.38.
> 
> [1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.3.0/x86_64-gcc-11.3.0-nolibc-x86_64-linux.tar.xz

I guess you mean https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.3.0/x86_64-gcc-11.3.0-nolibc-riscv64-linux.tar.gz

> The defconfig of v5.16 kernel (commit 6df2a016c0c8 lands in v5.17) builds fine
> for me. Anything I am missing?

I can't find the corresponding source and unfortunately binutils doesn't
record the configure options in the binaries, but my guess is that it
has been configured with --with-isa-spec=2.2. This is not the
recommended way to go, but given the mess many distribution went that
road.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
