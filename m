Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F658C6FD19
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJS1Wg7kul/fUCqIx9Swszp2rPvZgAZMAr+nj0CpaH4=; b=1BbiHcJKl5upQEZtUusPnrbh1P
	fQF8StbvenSW8jae9Uriq6BudOklfsiTskIT1OABrK8TLCIfBAxGSQedwDHUiwAZ/XZsjTjcnf11G
	noT6HylwqOtJsqlIRvoaSV7PF5UX7RtN0LxWPwLh/wWgEa3P3+Z6SQ8dnRmxjKI7J6mfSygaJ2/3s
	9cYQN2cuYvJVhIOm20AVYOx8FTG2EfWux0Sfz6fI5jcXOCef8RcGpOkX9cIvTH5ooBK/MOmeQ1UdA
	NOzrRdhP9tAqnqfYrJLkjFtSSzqN6MqyRpfxd923Qyz6R33FyHqNcATqu2aoHnm6vyOfkdNoSrzTX
	tJqm+m7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pai8Y-00FsF4-Tt; Fri, 10 Mar 2023 19:10:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pai8P-00FsC0-VS
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 19:10:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id v11so6668952plz.8
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678475426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZGDv5DIYIxsnE885FfpP47ttfnvxSWFDU6bB1hvtRM=;
        b=SM3O0AGaHw4g2GV96u4cTK6Tpc6Elev94rU1WSnz6dEk7mnnAQwWdN1tW7EILcJ341
         DWcfezFDow6lmCagtiwzRHZDBT0QpiWThRbybIdeeeP4eTP7eZotF9PfL4eraydzAtL5
         K5Iit5j9g6fy3Uc64mkZypeF8BA0HsgfQf31h7iSpQzmBabxGGETmiz8znYMC+Izl0MG
         T9TvguHRM2xzVnv3rMkXtSS4Lf4C+ZNnx4PIy/w8t7QMD3sM5Bwn4m1yvxjxb5MnW/qI
         KfoEtbzF+NvUILwpeZc63uONvGbouRT1wJQzF0BEbG8e0QnbCKpF6BxWNAWVcUbOEYZx
         UTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZGDv5DIYIxsnE885FfpP47ttfnvxSWFDU6bB1hvtRM=;
        b=RfpwGDd2Yi4nnjLoWgNx780SKylHJQR2dBjsQPh11Ch2BmPdsNsALdQu+2q+DD5ew5
         sXYc9msFtrrx38hPSWLughlNFcWwge3YSNivSd+pUEyfffv9ktT6UVpYWIQtpfRHwxSG
         ANp2bNQDSS4LhV6sUHrxyHIn7PHWVCcUVy7LiaZpFePSd/PMvv72qm1W7kpDaMIGwVN2
         AcXNHi26S2B6kNqOMUtl0V3lb1ngy1jcO7AqVDIGHbA6MJIVROzjBidfb2haFWWtd44p
         7Obfx2+LmnW8cyKnB8BeigGwXjePLOjqvru19j6JrZzLp+zMT0BJfBIKHmmmGe35+qH3
         X6rQ==
X-Gm-Message-State: AO0yUKXLHXwQVCnZTS/mDct7E6m9JX72muzgHLp0A7xsVaJr9io8WnNk
	lQcSw1YnURDSWD2SKWf5hF/ylA==
X-Google-Smtp-Source: AK7set+VmSF9aMozDA/zTApnsLW/h0LbKWWDE3MjBMjenGf4VotI5Cgco4B/N63Va2NujYg8V1UOdQ==
X-Received: by 2002:a17:902:c3c5:b0:19c:c5d4:afd2 with SMTP id j5-20020a170902c3c500b0019cc5d4afd2mr283201plj.11.1678475426123;
        Fri, 10 Mar 2023 11:10:26 -0800 (PST)
Received: from google.com (25.11.145.34.bc.googleusercontent.com. [34.145.11.25])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b005a84de344a6sm183124pfo.14.2023.03.10.11.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:10:25 -0800 (PST)
Date: Fri, 10 Mar 2023 19:10:23 +0000
From: Fangrui Song <maskray@google.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20230310191023.p25brljzyojtmn7e@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
 <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
 <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
 <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
 <20221221235147.45lkqmosndritfpe@google.com>
 <ecd41da2-d986-8890-a519-3dfc83019593@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecd41da2-d986-8890-a519-3dfc83019593@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_111034_031188_AFBAF64C 
X-CRM114-Status: GOOD (  29.46  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2023-03-10, Vincenzo Frascino wrote:
>Hi Fangrui,
>
>Apologize for the delay, I totally missed that you had a new version of yo=
ur
>patch since it was threaded with the old one.

Thank you! No worries.

>On 12/21/22 23:51, Fangrui Song wrote:
>> The actual intention is that no dynamic relocation exists. However, some
>> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
>> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
>> relocations. E.g. ld's powerpc port recently fixed
>> https://sourceware.org/bugzilla/show_bug.cgi?id=3D29540) R_*_NONE are
>> generally no-op in the dynamic loaders. So just ignore them.
>>
>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
>> not called "absolute relocations". (The patch is motivated by the arm64
>> port missing R_AARCH64_RELATIVE.)
>
>It makes sense to update the name, it started as "absolute relocations" bu=
t then
>it evolved into something else.
>
>A part that, did you perform any testing with the generated vDSO libraries?

I checked that the built vdso did not change (the patch just changes
some post-link verification). =


To be more sure, I used commands like
https://github.com/ClangBuiltLinux/tc-build/blob/main/kernel/build.sh#L305
to build a kernel and commands like

     ~/Dev/ClangBuiltLinux/boot-utils/boot-qemu.py -a arm64 -k /tmp/linux/a=
rm64

to run an image for a couple of architectures.

The initrd images run some init scripts along with

   # buildroot/overlay-poweroff/etc/init.d/S50yolo
   cat /proc/version
   poweroff

I think these have exercised vdso.

>>
>> Signed-off-by: Fangrui Song <maskray@google.com>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> Change from v1:
>> * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "=
grep -E"
>> instead of "egrep")
>> * change the commit message to mention an example GNU ld bug; no longer =
say the
>> patch fixes a deprecated egrep use
>> ---
>> =A0arch/arm/vdso/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 ---
>> =A0arch/arm64/kernel/vdso/Makefile=A0=A0 |=A0 3 ---
>> =A0arch/arm64/kernel/vdso32/Makefile |=A0 3 ---
>> =A0arch/csky/kernel/vdso/Makefile=A0=A0=A0 |=A0 3 ---
>> =A0arch/loongarch/vdso/Makefile=A0=A0=A0=A0=A0 |=A0 3 ---
>> =A0arch/mips/vdso/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 ---
>> =A0arch/powerpc/kernel/vdso/Makefile |=A0 1 -
>> =A0arch/riscv/kernel/vdso/Makefile=A0=A0 |=A0 3 ---
>> =A0arch/s390/kernel/vdso32/Makefile=A0 |=A0 2 --
>> =A0arch/s390/kernel/vdso64/Makefile=A0 |=A0 2 --
>> =A0arch/x86/entry/vdso/Makefile=A0=A0=A0=A0=A0 |=A0 4 ----
>> =A0lib/vdso/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1=
3 ++++---------
>> =A012 files changed, 4 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
>> index a7ec06ce3785..e58197bba776 100644
>> --- a/arch/arm/vdso/Makefile
>> +++ b/arch/arm/vdso/Makefile
>> @@ -1,8 +1,5 @@
>> =A0# SPDX-License-Identifier: GPL-2.0
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
>
>I would still add a comment here to say why we are including the generic
>Makefile to prevent that it gets accidentally removed (similar thing for e=
very
>architecture touched by this patch).
>
>With that:
>
>Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for vDSO, aar=
ch64
>Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for aarch64
>

Just sent v3
(https://lore.kernel.org/all/20230310190750.3323802-1-maskray@google.com/)
with the comment changes. Thanks!

>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0hostprogs :=3D vdsomunge
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Ma=
kefile
>> index beaf9586338f..1f2427b13410 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -6,9 +6,6 @@
>> =A0# Heavily based on the vDSO Makefiles for other archs.
>> =A0#
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_AARCH64_JUMP_SLOT|R_AARCH64_GLOB_DAT|R_AARCH64=
_ABS64
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0obj-vdso :=3D vgettimeofday.o note.o sigreturn.o
>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso3=
2/Makefile
>> index f59bd1a4ead6..d014162c5c71 100644
>> --- a/arch/arm64/kernel/vdso32/Makefile
>> +++ b/arch/arm64/kernel/vdso32/Makefile
>> @@ -3,9 +3,6 @@
>> =A0# Makefile for vdso32
>> =A0#
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0# Same as cc-*option, but using CC_COMPAT instead of CC
>> diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Make=
file
>> index 0b6909f10667..86c8c4de1b0f 100644
>> --- a/arch/csky/kernel/vdso/Makefile
>> +++ b/arch/csky/kernel/vdso/Makefile
>> @@ -1,8 +1,5 @@
>> =A0# SPDX-License-Identifier: GPL-2.0-only
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_CKCORE_ADDR32|R_CKCORE_JUMP_SLOT
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0# Symbols present in the vdso
>> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
>> index d89e2ac75f7b..1b2e0f149f55 100644
>> --- a/arch/loongarch/vdso/Makefile
>> +++ b/arch/loongarch/vdso/Makefile
>> @@ -1,9 +1,6 @@
>> =A0# SPDX-License-Identifier: GPL-2.0
>> =A0# Objects to go into the VDSO.
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JU=
MP_SLOT
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0obj-vdso-y :=3D elf.o vgetcpu.o vgettimeofday.o sigreturn.o
>> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
>> index 1f7d5c6c10b0..c060f3596304 100644
>> --- a/arch/mips/vdso/Makefile
>> +++ b/arch/mips/vdso/Makefile
>> @@ -4,9 +4,6 @@
>> =A0# Sanitizer runtimes are unavailable and cannot be linked here.
>> =A0 KCSAN_SANITIZE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=3D n
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_MIPS_JUMP_SLOT|R_MIPS_GLOB_DAT
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0obj-vdso-y :=3D elf.o vgettimeofday.o sigreturn.o
>> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vds=
o/Makefile
>> index 6a977b0d8ffc..83c347e9136f 100644
>> --- a/arch/powerpc/kernel/vdso/Makefile
>> +++ b/arch/powerpc/kernel/vdso/Makefile
>> @@ -2,7 +2,6 @@
>> =A0
>> =A0# List of files in the vdso, has to be asm only for now
>> =A0
>> -ARCH_REL_TYPE_ABS :=3D
>> R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_=
PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRT=
AKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0obj-vdso32 =3D sigtramp32-32.o gettimeofday-32.o datapage-32.o cachef=
lush-32.o
>> note-32.o getcpu-32.o
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Ma=
kefile
>> index 06e6b27f3bcc..d85c37e11b21 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -1,9 +1,6 @@
>> =A0# SPDX-License-Identifier: GPL-2.0-only
>> =A0# Copied from arch/tile/kernel/vdso/Makefile
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0# Symbols present in the vdso
>> =A0vdso-syms=A0 =3D rt_sigreturn
>> diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/=
Makefile
>> index 245bddfe9bc0..e795fdbbf484 100644
>> --- a/arch/s390/kernel/vdso32/Makefile
>> +++ b/arch/s390/kernel/vdso32/Makefile
>> @@ -2,8 +2,6 @@
>> =A0# List of files in the vdso
>> =A0
>> =A0KCOV_INSTRUMENT :=3D n
>> -ARCH_REL_TYPE_ABS :=3D R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_R=
ELATIVE
>> -ARCH_REL_TYPE_ABS +=3D R_390_GOT|R_390_PLT
>> =A0
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0obj-vdso32 =3D vdso_user_wrapper-32.o note-32.o
>> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/=
Makefile
>> index 9e2b95a222a9..47dbbfdfad68 100644
>> --- a/arch/s390/kernel/vdso64/Makefile
>> +++ b/arch/s390/kernel/vdso64/Makefile
>> @@ -2,8 +2,6 @@
>> =A0# List of files in the vdso
>> =A0
>> =A0KCOV_INSTRUMENT :=3D n
>> -ARCH_REL_TYPE_ABS :=3D R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_R=
ELATIVE
>> -ARCH_REL_TYPE_ABS +=3D R_390_GOT|R_390_PLT
>> =A0
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0obj-vdso64 =3D vdso_user_wrapper.o note.o
>> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
>> index 838613ac15b8..b292c24acb8e 100644
>> --- a/arch/x86/entry/vdso/Makefile
>> +++ b/arch/x86/entry/vdso/Makefile
>> @@ -3,10 +3,6 @@
>> =A0# Building vDSO images for x86.
>> =A0#
>> =A0
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined bef=
ore
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS :=3D R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RE=
LATIVE|
>> -ARCH_REL_TYPE_ABS +=3D R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
>> =A0include $(srctree)/lib/vdso/Makefile
>> =A0
>> =A0# Sanitizer runtimes are unavailable and cannot be linked here.
>> diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
>> index e814061d6aa0..9f031eafc465 100644
>> --- a/lib/vdso/Makefile
>> +++ b/lib/vdso/Makefile
>> @@ -5,18 +5,13 @@ GENERIC_VDSO_DIR :=3D $(dir $(GENERIC_VDSO_MK_PATH))
>> =A0
>> =A0c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) :=3D $(addprefix
>> $(GENERIC_VDSO_DIR), gettimeofday.c)
>> =A0
>> -# This cmd checks that the vdso library does not contain absolute reloc=
ation
>> +# This cmd checks that the vdso library does not contain dynamic reloca=
tions.
>> =A0# It has to be called after the linking of the vdso library and requi=
res it
>> =A0# as a parameter.
>> =A0#
>> -# $(ARCH_REL_TYPE_ABS) is defined in the arch specific makefile and cor=
responds
>> -# to the absolute relocation types printed by "objdump -R" and accepted=
 by the
>> -# dynamic linker.
>> -ifndef ARCH_REL_TYPE_ABS
>> -$(error ARCH_REL_TYPE_ABS is not set)
>> -endif
>> -
>> +# As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>> +# dynamic relocations, ignore R_*_NONE.
>> =A0quiet_cmd_vdso_check =3D VDSOCHK $@
>> -=A0=A0=A0=A0=A0 cmd_vdso_check =3D if $(OBJDUMP) -R $@ | grep -E -h "$(=
ARCH_REL_TYPE_ABS)"; \
>> +=A0=A0=A0=A0=A0 cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE=
 | grep -q " R_\w*_"; \
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 then (echo >&2 "$@: dynami=
c relocations are not supported"; \
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rm -f $@; /bin/false=
); fi
>
>-- =

>Regards,
>Vincenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
