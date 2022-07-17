Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707EEC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnaLR7nYneVrjNQ9K0WYY6Pz7yI5laj1eLbl0Rpm8UA=; b=UdxdGuKshrH3lF
	J67vl52t7ecrjDRnK1rX4japa1JSoFw+EWheiQoamDMhfXtVCh/uH3/u4QZpUQJzqY8O96Zam73Z/
	1KyDJzQpKqZlCcpzDTVsJmQe/1Ro1H+oOFlec7mP5eZv5yue0rslW3gsuPu0rKSTJ00RLjPH0jw5Y
	iznRgdrREc2gMZH31jG/f4QMbxBRarIRHH5oOuHBo8oTeYMk80ac8wdFltINqhHX5vKAZjLzz5m5t
	8GnOwerEHlLcGKcQsryGuOoV/aYega4oaiKSHBZDr+IlQ7WHGHIxFPTIL4FrpCgFfUJjH834bJm+H
	Vcmz+fuS3UgeucmuAsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDDi7-009G6z-7a; Sun, 17 Jul 2022 23:30:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDDi4-009G5o-Nj
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 23:30:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18F8360EF0
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 23:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAECC341CE
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658100599;
	bh=iuvMrsWWf7RIfn39Nd1G2GufJgkyRDmJ/6MLS82j1ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u9BOReF9VfUlW4bAm3WJzRxXsTYEmAGpqXSLWQuZC768j0lBLbcvFN2OdhjC01y2+
	 zJv+rKECKq27245lstmSzYhu7Gx/ua2uF33A8+g/3VR7/0/BfvWp32ZWrj+297CXjX
	 zqdS4Q06wVl3bWMIBn+qY/otvdg0yo+yLKsUcn26sHPpGt+mZXb65E6n3WvRzU6uQs
	 dwLnT7ymvBkDGbIolCjOuo9O7q668HM9RxRX91Y9PfMluRfnNCr9Veyg5atgu3dF9b
	 GwESLQLNbVySuUGi6fNFjrLfeXGOYWz2Ax8aa6LY77TzoJOaBHs79De2C9b3GD3SMl
	 0XZip0eiDAW0w==
Received: by mail-lj1-f174.google.com with SMTP id u14so3839294lju.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 16:29:59 -0700 (PDT)
X-Gm-Message-State: AJIora8rhRoaS0AnLxGedHW6/U5Y1Ysn6a02N8/rdRLsLpn2JW9s3Kh/
	jTk/fSQmlwAUzv4lpkMEMa+gFJuBy4iHOlQjvdE=
X-Google-Smtp-Source: AGRyM1sor7H35sIsfAtGoSLbaquA4FbabaYjWXsABnv7y+FcDl8HSB2BdXBTfSPHVpggxda5Z5ZxAHGGp5reUrHnLDQ=
X-Received: by 2002:a05:651c:1183:b0:25d:b04f:23ea with SMTP id
 w3-20020a05651c118300b0025db04f23eamr3068556ljo.116.1658100597465; Sun, 17
 Jul 2022 16:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk> <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
In-Reply-To: <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 18 Jul 2022 07:29:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
Message-ID: <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_163000_878211_9165E753 
X-CRM114-Status: GOOD (  22.59  )
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

I'm just curious who is using vdso_install, thx. Would you mind put
below into the commit log?

It broke the Debian package build
/usr/bin/make [...] -C debian/build/build_riscv64_none_riscv64
vdso_install INSTALL_MOD_PATH='/<<PKGBUILDDIR>>'/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug
make[3]: Entering directory
'/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
[...]
make[4]: *** No rule to make target 'vdso_install'.  Stop.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sun, Jul 17, 2022 at 11:26 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Sun, 2022-07-17 at 22:31 +0800, Guo Ren wrote:
> > On Thu, Jul 14, 2022 at 7:21 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > >
> > > The recipe for vdso_install in arch/riscv/Makefile invokes targets of
> > > the same name in arch/riscv/kernel/vdso and .../compat_vdso, but the
> > > target in the latter is called compat_vdso_install.  Change the
> > > recipe to use the right target name.
> > >
> > > Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code ...")
> > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > ---
> > >  arch/riscv/Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 34cf8a598617..ee763562895c 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -110,7 +110,7 @@ PHONY += vdso_install
> > >  vdso_install:
> > >         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> > >         $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> > > -               $(build)=arch/riscv/kernel/compat_vdso $@)
> > > +               $(build)=arch/riscv/kernel/compat_vdso compat_vdso_install)
> > Good catch, but what's the problem you've met?
>
> It broke the Debian package build
> <https://buildd.debian.org/status/fetch.php?pkg=linux&arch=riscv64&ver=5.19%7Erc6-1%7Eexp1&stamp=1657777338&raw=0>:
>
> [...] /usr/bin/make [...] -C debian/build/build_riscv64_none_riscv64 vdso_install INSTALL_MOD_PATH='/<<PKGBUILDDIR>>'/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug
> make[3]: Entering directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
> [...]
> /usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=arch/riscv/kernel/vdso vdso_install
> [...]
>    gcc-11 -Wp,-MMD,arch/riscv/kernel/vdso/.vgettimeofday.o.d -nostdinc -I/<<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/include/generated -I/<<PKGBUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/<<PKGBUILDDIR>>/include/uapi -I./include/generated/uapi -include /<<PKGBUILDDIR>>/include/linux/compiler-version.h -include /<<PKGBUILDDIR>>/include/linux/kconfig.h -include /<<PKGBUILDDIR>>/include/linux/compiler_types.h -D__KERNEL__ -DCC_USING_PATCHABLE_FUNCTION_ENTRY -fmacro-prefix-map=/<<PKGBUILDDIR>>/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-omit-frame-pointer -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wimplicit-fallthrough=5 -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -fdebug-prefix-map=/<<PKGBUILDDIR>>/= -fno-stack-protector -fPIC -include /<<PKGBUILDDIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso -I ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE='"arch/riscv/kernel/vdso/vgettimeofday"' -DKBUILD_BASENAME='"vgettimeofday"' -DKBUILD_MODNAME='"vgettimeofday"' -D__KBUILD_MODNAME=kmod_vgettimeofday -c -o arch/riscv/kernel/vdso/vgettimeofday.o /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofday.c
> [...]
>   /<<PKGBUILDDIR>>/scripts/check-local-export arch/riscv/kernel/vdso/vgettimeofday.o
>   if nm arch/riscv/kernel/vdso/vgettimeofday.o 2>/dev/null | grep -q __ksymtab; then  gcc-11 -E -D__GENKSYMS__ -Wp,-MMD,arch/riscv/kernel/vdso/.vgettimeofday.o.d -nostdinc -I/<<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/include/generated -I/<<PKGBUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/<<PKGBUILDDIR>>/include/uapi -I./include/generated/uapi -include /<<PKGBUILDDIR>>/include/linux/compiler-version.h -include /<<PKGBUILDDIR>>/include/linux/kconfig.h -include /<<PKGBUILDDIR>>/include/linux/compiler_types.h -D__KERNEL__ -DCC_USING_PATCHABLE_FUNCTION_ENTRY -fmacro-prefix-map=/<<PKGBUILDDIR>>/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-omit-frame-pointer -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wimplicit-fallthrough=5 -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -fdebug-prefix-map=/<<PKGBUILDDIR>>/= -fno-stack-protector -fPIC -include /<<PKGBUILDDIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso -I ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE='"arch/riscv/kernel/vdso/vgettimeofday"' -DKBUILD_BASENAME='"vgettimeofday"' -DKBUILD_MODNAME='"vgettimeofday"' -D__KBUILD_MODNAME=kmod_vgettimeofday /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofday.c | scripts/genksyms/genksyms   -r /dev/null >> arch/riscv/kernel/vdso/.vgettimeofday.o.cmd; fi
>   ld -melf64lriscv  -shared -S -soname=linux-vdso.so.1 --build-id=sha1 --hash-style=both --eh-frame-hdr -T arch/riscv/kernel/vdso/vdso.lds arch/riscv/kernel/vdso/rt_sigreturn.o arch/riscv/kernel/vdso/vgettimeofday.o arch/riscv/kernel/vdso/getcpu.o arch/riscv/kernel/vdso/flush_icache.o arch/riscv/kernel/vdso/note.o -o arch/riscv/kernel/vdso/vdso.so.dbg.tmp && objcopy  -G __vdso_rt_sigreturn  -G __vdso_vgettimeofday  -G __vdso_getcpu  -G __vdso_flush_icache arch/riscv/kernel/vdso/vdso.so.dbg.tmp arch/riscv/kernel/vdso/vdso.so.dbg && rm arch/riscv/kernel/vdso/vdso.so.dbg.tmp
>   cp arch/riscv/kernel/vdso/vdso.so.dbg /<<PKGBUILDDIR>>/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug/lib/modules/5.19.0-rc6-riscv64/vdso/vdso.so
>   :
> /usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=arch/riscv/kernel/compat_vdso vdso_install
> [...]
> make[4]: *** No rule to make target 'vdso_install'.  Stop.
> make[3]: *** [/<<PKGBUILDDIR>>/arch/riscv/Makefile:112: vdso_install] Error 2
> make[3]: Leaving directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
> make[2]: *** [debian/rules.real:513: install-image-dbg_riscv64_none_riscv64] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> Ben.
>
> >
> > >
> > >  ifeq ($(KBUILD_EXTMOD),)
> > >  ifeq ($(CONFIG_MMU),y)
> >
> >
> >
>
> --
> Ben Hutchings
> This sentence contradicts itself - no actually it doesn't.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
