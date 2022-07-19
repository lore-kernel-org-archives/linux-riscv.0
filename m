Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD00C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb+FO/OYMyYO2Zdu5oJQH7ZyZTM61VEBYylC6Tr2YPM=; b=I1LHxcduiC5dG3
	XHUpTw90AMR5a5Aabt7nfZoMR1jYJc4hX+vnDEInbUJ2IuD7uEfYr2fV5fLrrWj6XgFg3RYjo2+YM
	BArurPVo/IZ/hhmnm42/+P6+91Gafv4LFCMELb/da9XfXw+d7PQ6cPtBL17j6/gPYsC07Fno8Joqf
	DHiiTapThOfYaHIYmOgVa/wusMKP7f95xYiIvSSCkbFTx+zX1FY/ZTTm1qMT2vrq62k/ylsoOAAub
	p0HZwvfBGmmGwl0FHv5pIQ8XbaEX6cnuopKu2APLvtbhoKiG0oaH8Tugj8lNENLqrP6Ydi0hDDHYY
	3Nlv2XEMZhf4GoFt0sHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkH0-007tmG-2W; Tue, 19 Jul 2022 10:16:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkGv-007tf4-VU
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 10:16:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7E5D0B81A82
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 10:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C93BC341CA
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658225766;
	bh=BeemavRdzgys1vR+sgB+ZSREHherSk6fxSFNBReOuKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IdTjtY/Ofj/shxSOakrQsCK+jyz+cwsBwLQ51Zl+E+LBEkMmL7C6KrxG99Rt4fNTT
	 zdo6hiyFwnldQHznlAliYZQEMjTjGW6SG9B563CDnHCIijCNuEbHUoXRc04iHRfQbc
	 mWVB6f6xpatB/DlDpb9b9XFCOHajWD8PgfM+GiZ2mBj3Pptyjnf+cx6Ykm3+Yz7Llp
	 QBHNlGHKcvpxunzdXEw7RLdAmEFE7KjJfhpzE7eoYm9O0WnNXrtqBlwAitB4tt7Mx5
	 DYyvCSOeRD1xg7ERIkr1KVcA0CoszPZJj2Z3crm4J2qPH8NGaEeB2XcchQV+3j+VFX
	 8gSUdcCG6IQ9A==
Received: by mail-lj1-f182.google.com with SMTP id m9so14158578ljp.9
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 03:16:06 -0700 (PDT)
X-Gm-Message-State: AJIora+4QSVFXq0vEr5ci5GCcnHVF1wmRXI0s2bbYjSd0Dqhpjb/UZYx
	FYwXD7JjpuI+p/dtJVBUAVfgscRZGQCa1prrHy4=
X-Google-Smtp-Source: AGRyM1vRCNCBP8vUWn/5wFeG8X5Hhk6X6c0AFOdMO2umcFEwXPsMvfQeGqW8mmdVsfcPXsUo1hq+QscxPZPUzs2S4MU=
X-Received: by 2002:a2e:b8cc:0:b0:25d:ac5c:734f with SMTP id
 s12-20020a2eb8cc000000b0025dac5c734fmr6812730ljp.317.1658225764219; Tue, 19
 Jul 2022 03:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk> <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
 <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com> <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
In-Reply-To: <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Jul 2022 18:15:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
Message-ID: <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_031610_368072_D280AC64 
X-CRM114-Status: GOOD (  33.68  )
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

Sorry, I missed your patch. You are the first person to catch that.

+ $(build)=arch/riscv/kernel/compat_vdso compat_$@)

The above is also good for me.

For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
vdso: Add COMPAT_VDSO base code ...")" in your next version of the
patch from Ben's and add "Ben Hutchings as Co-developed-by:"?

On Tue, Jul 19, 2022 at 5:50 PM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Mon, 18 Jul 2022 at 01:32, Guo Ren <guoren@kernel.org> wrote:
> >
> > I'm just curious who is using vdso_install, thx. Would you mind put
> > below into the commit log?
> >
> > It broke the Debian package build
> > /usr/bin/make [...] -C debian/build/build_riscv64_none_riscv64
> > vdso_install INSTALL_MOD_PATH='/<<PKGBUILDDIR>>'/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug
> > make[3]: Entering directory
> > '/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
> > [...]
> > make[4]: *** No rule to make target 'vdso_install'.  Stop.
> >
> > Reviewed-by: Guo Ren <guoren@kernel.org>
>
> I don't mind which version goes in, but just for reference there is
> already this patch on the mailing list:
> https://lore.kernel.org/linux-riscv/20220625154207.80972-1-emil.renner.berthing@canonical.com/
>
> /Emil
>
> > On Sun, Jul 17, 2022 at 11:26 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > >
> > > On Sun, 2022-07-17 at 22:31 +0800, Guo Ren wrote:
> > > > On Thu, Jul 14, 2022 at 7:21 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > > > >
> > > > > The recipe for vdso_install in arch/riscv/Makefile invokes targets of
> > > > > the same name in arch/riscv/kernel/vdso and .../compat_vdso, but the
> > > > > target in the latter is called compat_vdso_install.  Change the
> > > > > recipe to use the right target name.
> > > > >
> > > > > Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code ...")
> > > > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > > > ---
> > > > >  arch/riscv/Makefile | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > index 34cf8a598617..ee763562895c 100644
> > > > > --- a/arch/riscv/Makefile
> > > > > +++ b/arch/riscv/Makefile
> > > > > @@ -110,7 +110,7 @@ PHONY += vdso_install
> > > > >  vdso_install:
> > > > >         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> > > > >         $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> > > > > -               $(build)=arch/riscv/kernel/compat_vdso $@)
> > > > > +               $(build)=arch/riscv/kernel/compat_vdso compat_vdso_install)
> > > > Good catch, but what's the problem you've met?
> > >
> > > It broke the Debian package build
> > > <https://buildd.debian.org/status/fetch.php?pkg=linux&arch=riscv64&ver=5.19%7Erc6-1%7Eexp1&stamp=1657777338&raw=0>:
> > >
> > > [...] /usr/bin/make [...] -C debian/build/build_riscv64_none_riscv64 vdso_install INSTALL_MOD_PATH='/<<PKGBUILDDIR>>'/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug
> > > make[3]: Entering directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
> > > [...]
> > > /usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=arch/riscv/kernel/vdso vdso_install
> > > [...]
> > >    gcc-11 -Wp,-MMD,arch/riscv/kernel/vdso/.vgettimeofday.o.d -nostdinc -I/<<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/include/generated -I/<<PKGBUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/<<PKGBUILDDIR>>/include/uapi -I./include/generated/uapi -include /<<PKGBUILDDIR>>/include/linux/compiler-version.h -include /<<PKGBUILDDIR>>/include/linux/kconfig.h -include /<<PKGBUILDDIR>>/include/linux/compiler_types.h -D__KERNEL__ -DCC_USING_PATCHABLE_FUNCTION_ENTRY -fmacro-prefix-map=/<<PKGBUILDDIR>>/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-omit-frame-pointer -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-ad
> >  dress -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wimplicit-fallthrough=5 -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -fdebug-prefix-map=/<<PKGBUILDDIR>>/= -fno-stack-protector -fPIC -include /<<PKGBUILDDIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso -I ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE='"arch/riscv/kernel/vdso/vgettimeofday"' -DKBUILD_BASENAME='"vgettimeofday"' -DKBUILD_MODNAME='"vgettimeofday
> >  "' -D__KBUILD_MODNAME=kmod_vgettimeofday -c -o arch/riscv/kernel/vdso/vgettimeofday.o /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofday.c
> > > [...]
> > >   /<<PKGBUILDDIR>>/scripts/check-local-export arch/riscv/kernel/vdso/vgettimeofday.o
> > >   if nm arch/riscv/kernel/vdso/vgettimeofday.o 2>/dev/null | grep -q __ksymtab; then  gcc-11 -E -D__GENKSYMS__ -Wp,-MMD,arch/riscv/kernel/vdso/.vgettimeofday.o.d -nostdinc -I/<<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/include/generated -I/<<PKGBUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/<<PKGBUILDDIR>>/include/uapi -I./include/generated/uapi -include /<<PKGBUILDDIR>>/include/linux/compiler-version.h -include /<<PKGBUILDDIR>>/include/linux/kconfig.h -include /<<PKGBUILDDIR>>/include/linux/compiler_types.h -D__KERNEL__ -DCC_USING_PATCHABLE_FUNCTION_ENTRY -fmacro-prefix-map=/<<PKGBUILDDIR>>/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000
> >   -mcmodel=medany -fno-omit-frame-pointer -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wimplicit-fallthrough=5 -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -fdebug-prefix-map=/<<PKGBUILDDIR>>/= -fno-stack-protector -fPIC -include /<<PKGBUILDDIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso -I ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE='"arch/r
> >  iscv/kernel/vdso/vgettimeofday"' -DKBUILD_BASENAME='"vgettimeofday"' -DKBUILD_MODNAME='"vgettimeofday"' -D__KBUILD_MODNAME=kmod_vgettimeofday /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofday.c | scripts/genksyms/genksyms   -r /dev/null >> arch/riscv/kernel/vdso/.vgettimeofday.o.cmd; fi
> > >   ld -melf64lriscv  -shared -S -soname=linux-vdso.so.1 --build-id=sha1 --hash-style=both --eh-frame-hdr -T arch/riscv/kernel/vdso/vdso.lds arch/riscv/kernel/vdso/rt_sigreturn.o arch/riscv/kernel/vdso/vgettimeofday.o arch/riscv/kernel/vdso/getcpu.o arch/riscv/kernel/vdso/flush_icache.o arch/riscv/kernel/vdso/note.o -o arch/riscv/kernel/vdso/vdso.so.dbg.tmp && objcopy  -G __vdso_rt_sigreturn  -G __vdso_vgettimeofday  -G __vdso_getcpu  -G __vdso_flush_icache arch/riscv/kernel/vdso/vdso.so.dbg.tmp arch/riscv/kernel/vdso/vdso.so.dbg && rm arch/riscv/kernel/vdso/vdso.so.dbg.tmp
> > >   cp arch/riscv/kernel/vdso/vdso.so.dbg /<<PKGBUILDDIR>>/debian/linux-image-5.19.0-rc6-riscv64-dbg/usr/lib/debug/lib/modules/5.19.0-rc6-riscv64/vdso/vdso.so
> > >   :
> > > /usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=arch/riscv/kernel/compat_vdso vdso_install
> > > [...]
> > > make[4]: *** No rule to make target 'vdso_install'.  Stop.
> > > make[3]: *** [/<<PKGBUILDDIR>>/arch/riscv/Makefile:112: vdso_install] Error 2
> > > make[3]: Leaving directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_none_riscv64'
> > > make[2]: *** [debian/rules.real:513: install-image-dbg_riscv64_none_riscv64] Error 2
> > > make[2]: *** Waiting for unfinished jobs....
> > >
> > > Ben.
> > >
> > > >
> > > > >
> > > > >  ifeq ($(KBUILD_EXTMOD),)
> > > > >  ifeq ($(CONFIG_MMU),y)
> > > >
> > > >
> > > >
> > >
> > > --
> > > Ben Hutchings
> > > This sentence contradicts itself - no actually it doesn't.
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
