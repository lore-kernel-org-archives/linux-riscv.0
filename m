Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEHp5oiVDWl0vwrJZ18k8DIc31mhHONqLfdGuti4UuQ=; b=UjWBg6jZDpIqh1
	pJGf2W24c7sERxmLcPKRGv8zBZlLmSwEG4zJkBzJ2RudkTg0eUJ0jUSvMYcdD/ME1ilUH3Zp3hdCZ
	f3Ep+J3qNrB9Jzh65tpZJ8IvF4OzkyyNHOUyygu9MRjfGHa3cpLlYDp0Uf/Y1C0sATerXDLYdfPUS
	J1kVYZe4PCV0Xwfav4wIyMv0nFIEmWLCzQ21Q/KjoweswlPDP4Syuv6sr7fH160NDpRkrCYL8rFlF
	R3z6QW47Jms8C2FT/bd9+QFONySuhDt/WVuP4hhVoivdpdTy/7poUu1XAOKH7P+eEs6Tkh0uPaxLZ
	o4mZgpnKO89p3CMjp0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNckS-005fYo-CV; Fri, 25 Feb 2022 15:43:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNcji-005fJh-Uj; Fri, 25 Feb 2022 15:42:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E5E0B8325C;
 Fri, 25 Feb 2022 15:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C18C340F2;
 Fri, 25 Feb 2022 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645803741;
 bh=LTpyZW67H6AqS8NEkTYiulq7m69rWSy25aC9ZjGcrfA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KugaL8/34dsoYm1tYvWbo/jnp2V/mihze12aGgHWldgnQcFk7VV5ERWqdLZURe40j
 6RIpMyNWI68JZ/6NbQTjVrkTVgLkzbeO1f5k06U83kTYvDS4fjqNlHstgtjJnF2Jwc
 9wLVZtMQwg/0V5AoxEvVGRrAole6BkzW087caapwAXdhEQ/E7MYSv6pBkfwvpLEQZe
 tKj6lMuGEyxlOg9pwrFRfd7mgvQGb9v3DuOA2TDAwCB3pe34gjxn+XGEbAp8CZvLbE
 Lfv6OMXNBXdaHYu8VaV5J+/JzmPEIdrEEcy/x8M+U5BszRjA9VvbpDWw9i5in0ZFrS
 CdpnQ5GePyMbA==
Received: by mail-vs1-f46.google.com with SMTP id d26so5970850vsh.0;
 Fri, 25 Feb 2022 07:42:21 -0800 (PST)
X-Gm-Message-State: AOAM533l1mOUWJlSe5mcrSd+Nf7erm3lvZjCCWYtIY0/f7u6OmcXq0Vr
 wBZNhoLiRu7gT51EtIAY8HKwS+PTq/DtDFmRQm8=
X-Google-Smtp-Source: ABdhPJzkkZzRIcTVnaKqfYtdNhKQA/tUKntASaj7B1Yk2uWOXdsLiKYE8wFNLhZCqckzP5h22WOoM706CycXuYVo0dw=
X-Received: by 2002:a05:6102:806:b0:31e:2206:f1c with SMTP id
 g6-20020a056102080600b0031e22060f1cmr3498723vsb.59.1645803740502; Fri, 25 Feb
 2022 07:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
 <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
In-Reply-To: <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 25 Feb 2022 23:42:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
Message-ID: <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_074227_320532_BE9E6B4C 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Arnd & Palmer,

Here is the new modified compat_vdso/Makefile, please have a look,
first. Then I would update it to v7:
===========================================
# SPDX-License-Identifier: GPL-2.0-only
#
# Makefile for compat_vdso
#

# Symbols present in the compat_vdso
compat_vdso-syms  = rt_sigreturn
compat_vdso-syms += getcpu
compat_vdso-syms += flush_icache

ifdef CROSS_COMPILE_COMPAT
        COMPAT_CC := $(CROSS_COMPILE_COMPAT)gcc
        COMPAT_LD := $(CROSS_COMPILE_COMPAT)ld
else
        COMPAT_CC := $(CC)
        COMPAT_LD := $(LD)
endif

COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
COMPAT_LD_FLAGS := -melf32lriscv

# Files to link into the compat_vdso
obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o

# Build rules
targets := $(obj-compat_vdso) compat_vdso.so compat_vdso.so.dbg compat_vdso.lds
obj-compat_vdso := $(addprefix $(obj)/, $(obj-compat_vdso))

obj-y += compat_vdso.o
CPPFLAGS_compat_vdso.lds += -P -C -U$(ARCH)

# Disable profiling and instrumentation for VDSO code
GCOV_PROFILE := n
KCOV_INSTRUMENT := n
KASAN_SANITIZE := n
UBSAN_SANITIZE := n

# Force dependency
$(obj)/compat_vdso.o: $(obj)/compat_vdso.so

# link rule for the .so file, .lds has to be first
$(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj-compat_vdso) FORCE
        $(call if_changed,compat_vdsold)
LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
        --build-id=sha1 --hash-style=both --eh-frame-hdr

$(obj-compat_vdso): %.o: %.S FORCE
        $(call if_changed_dep,compat_vdsoas)

# strip rule for the .so file
$(obj)/%.so: OBJCOPYFLAGS := -S
$(obj)/%.so: $(obj)/%.so.dbg FORCE
        $(call if_changed,objcopy)

# Generate VDSO offsets using helper script
gen-compat_vdsosym := $(srctree)/$(src)/gen_compat_vdso_offsets.sh
quiet_cmd_compat_vdsosym = VDSOSYM $@
        cmd_compat_vdsosym = $(NM) $< | $(gen-compat_vdsosym) |
LC_ALL=C sort > $@

include/generated/compat_vdso-offsets.h: $(obj)/compat_vdso.so.dbg FORCE
        $(call if_changed,compat_vdsosym)

# actual build commands
# The DSO images are built using a special linker script
# Make sure only to export the intended __compat_vdso_xxx symbol offsets.
quiet_cmd_compat_vdsold = VDSOLD  $@
      cmd_compat_vdsold = $(COMPAT_LD) $(ld_flags) $(COMPAT_LD_FLAGS)
-T $(filter-out FORCE,$^) -o $@.tmp && \
                   $(OBJCOPY) $(patsubst %, -G __compat_vdso_%,
$(compat_vdso-syms)) $@.tmp $@ && \
                   rm $@.tmp

# actual build commands
quiet_cmd_compat_vdsoas = VDSOAS $@
      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<

# install commands for the unstripped file
quiet_cmd_compat_vdso_install = INSTALL $@
      cmd_compat_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/compat_vdso/$@

compat_vdso.so: $(obj)/compat_vdso.so.dbg
        @mkdir -p $(MODLIB)/compat_vdso
        $(call cmd,compat_vdso_install)

compat_vdso_install: compat_vdso.so
===========================================

Here is the make V=1 output:

make -f /home/guoren/source/kernel/riscv-linux/scripts/Makefile.build
obj=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
make -f /home/guoren/source/kernel/riscv-linux/scripts/Makefile.build
obj=arch/riscv/kernel/compat_vdso
include/generated/compat_vdso-offsets.h
  riscv64-unknown-linux-gnu-gcc -E
-Wp,-MMD,arch/riscv/kernel/compat_vdso/.compat_vdso.lds.d  -nostdinc
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include
-I./arch/riscv/include/generated
-I/home/guoren/source/kernel/riscv-linux/include -I./include
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi
-I/home/guoren/source/kernel/riscv-linux/include/uapi -I./includ
e/generated/uapi -include
/home/guoren/source/kernel/riscv-linux/include/linux/compiler-version.h
-include /home/guoren/source/kernel/riscv-linux/include/linux/kconfig.h
-D__KERNEL__ -fmacro-prefix-map=/home/guoren/source/kernel/riscv-linux/=
   -P -C -Uriscv -I
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso
-I ./arch/riscv/kernel/compat_vdso -P -Uriscv -D__ASSEMBLY__
-DLINKER_SCRIPT -o arch/riscv/ke
rnel/compat_vdso/compat_vdso.lds
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
  riscv64-unknown-linux-gnu-gcc
-Wp,-MMD,arch/riscv/kernel/compat_vdso/.rt_sigreturn.o.d  -nostdinc
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include
-I./arch/riscv/include/generated
-I/home/guoren/source/kernel/riscv-linux/include -I./include
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi
-I/home/guoren/source/kernel/riscv-linux/include/uapi -I./include/ge
nerated/uapi -include
/home/guoren/source/kernel/riscv-linux/include/linux/compiler-version.h
-include /home/guoren/source/kernel/riscv-linux/include/linux/kconfig.h
-D__KERNEL__ -fmacro-prefix-map=/home/guoren/source/kernel/riscv-linux/=
-D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -I
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso
-I ./arch/riscv/kernel/compat_vdso    -march=rv32g -mabi=ilp3
2 -c -o arch/riscv/kernel/compat_vdso/rt_sigreturn.o
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
  riscv64-unknown-linux-gnu-gcc
-Wp,-MMD,arch/riscv/kernel/compat_vdso/.getcpu.o.d  -nostdinc
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include
-I./arch/riscv/include/generated
-I/home/guoren/source/kernel/riscv-linux/include -I./include
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi
-I/home/guoren/source/kernel/riscv-linux/include/uapi
-I./include/generate
d/uapi -include
/home/guoren/source/kernel/riscv-linux/include/linux/compiler-version.h
-include /home/guoren/source/kernel/riscv-linux/include/linux/kconfig.h
-D__KERNEL__ -fmacro-prefix-map=/home/guoren/source/kernel/riscv-linux/=
-D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -I
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso
-I ./arch/riscv/kernel/compat_vdso    -march=rv32g -mabi=ilp32 -c -
o arch/riscv/kernel/compat_vdso/getcpu.o
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/getcpu.S
  riscv64-unknown-linux-gnu-gcc
-Wp,-MMD,arch/riscv/kernel/compat_vdso/.flush_icache.o.d  -nostdinc
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include
-I./arch/riscv/include/generated
-I/home/guoren/source/kernel/riscv-linux/include -I./include
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi
-I/home/guoren/source/kernel/riscv-linux/include/uapi -I./include/ge
nerated/uapi -include
/home/guoren/source/kernel/riscv-linux/include/linux/compiler-version.h
-include /home/guoren/source/kernel/riscv-linux/include/linux/kconfig.h
-D__KERNEL__ -fmacro-prefix-map=/home/guoren/source/kernel/riscv-linux/=
-D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -I
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso
-I ./arch/riscv/kernel/compat_vdso    -march=rv32g -mabi=ilp3
2 -c -o arch/riscv/kernel/compat_vdso/flush_icache.o
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/flush_icache.S
  riscv64-unknown-linux-gnu-gcc
-Wp,-MMD,arch/riscv/kernel/compat_vdso/.note.o.d  -nostdinc
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include
-I./arch/riscv/include/generated
-I/home/guoren/source/kernel/riscv-linux/include -I./include
-I/home/guoren/source/kernel/riscv-linux/arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi
-I/home/guoren/source/kernel/riscv-linux/include/uapi
-I./include/generated/
uapi -include /home/guoren/source/kernel/riscv-linux/include/linux/compiler-version.h
-include /home/guoren/source/kernel/riscv-linux/include/linux/kconfig.h
-D__KERNEL__ -fmacro-prefix-map=/home/guoren/source/kernel/riscv-linux/=
-D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -I
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso
-I ./arch/riscv/kernel/compat_vdso    -march=rv32g -mabi=ilp32 -c -o
arch/riscv/kernel/compat_vdso/note.o
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/note.S
  riscv64-unknown-linux-gnu-ld  -melf64lriscv   -shared -S
-soname=linux-compat_vdso.so.1 --build-id=sha1 --hash-style=both
--eh-frame-hdr -melf32lriscv -T
arch/riscv/kernel/compat_vdso/compat_vdso.lds
arch/riscv/kernel/compat_vdso/rt_sigreturn.o
arch/riscv/kernel/compat_vdso/getcpu.o
arch/riscv/kernel/compat_vdso/flush_icache.o
arch/riscv/kernel/compat_vdso/note.o -o
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg.tmp &
& riscv64-unknown-linux-gnu-objcopy  -G __compat_vdso_rt_sigreturn  -G
__compat_vdso_getcpu  -G __compat_vdso_flush_icache
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg.tmp
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg && rm
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg.tmp
  riscv64-unknown-linux-gnu-nm
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg |
/home/guoren/source/kernel/riscv-linux/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
| LC_ALL=C sort > include/generated/compat_vdso-offsets.h


On Thu, Feb 24, 2022 at 6:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > There is no vgettimeofday supported in rv32 that makes simple to
> > generate rv32 vdso code which only needs riscv64 compiler. Other
> > architectures need change compiler or -m (machine parameter) to
> > support vdso32 compiling. If rv32 support vgettimeofday (which
> > cause C compile) in future, we would add CROSS_COMPILE to support
> > that makes more requirement on compiler enviornment.
>
> I think it's just a bug that rv32 doesn't have the vdso version of the
> time syscalls. Fixing that is of course independent of the compat support,
> but I think you need that anyway, and it would be better to start
> out by building the compat vdso with the correct
> architecture level.
>
> At least this should be a lot easier than on arch/arm64 because you
> can assume that an rv64 compiler is able to also build rv32 output.
>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
