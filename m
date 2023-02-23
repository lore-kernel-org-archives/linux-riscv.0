Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48339C64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S5UwlByCfZB/0EbOJynWT7m8/QPLJnUKdoUuX8JsSDE=; b=c42m01nWRSIL9zFu3nt6KXlpYx
	YM/1gIQBdEu50MjaMI+zPYb81rUVH+KgFHUe0yL1RaIv1XN4vL2jnthomW9Wk0RHF/dZlZgEp1sCN
	seIOQp/g69Msl7MZr37g/FvTJzWEJVYZJQpi2Tpx526c/5uPdRwMtxaqCRf5JqT6yqtpn7cWId1T3
	vwMPD92qQtsBbPz91l8DT5NSGd8nfNAIqdmm0x4h5xUDC6pVtc+WjVMhIA0OGe0x5sFDjrj3SBhNp
	tKUh1+RIgWy8jW4g8YG7V3fCJEGtx7RY7YoSq5PoHKxC63l5v/+2jv+ROj+OaOE/IG1/+Ijhy3ANO
	0PmIqIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJqr-000SuB-Ay; Thu, 23 Feb 2023 22:14:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJqo-000St9-6q
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:14:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id i3so4280584plg.6
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 14:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677190436;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0asgBIrzU0dOJMKMtwksef+D8Jii3KaOyNALHHRJVfg=;
        b=WwlfFcHVGqmZopBzqlp3C8N2yrJpZcSP1oMHKivHGzT/dCP2Y2Iw0b1U6OYxN6uGVf
         BXjVYlsYgO8IjgPkDtbAytCMti33M3igT56A9TF2Hb2Zpb+7gpJgSRZQjmnxuL4Rv83A
         eO2+di+zJYLeIg0mYeXR83ZhseJWPj8FumUhRkAm/7Yx38xhwdffklLSf+s1h9KY7TX5
         y5bE+are531nPb+Xr7rYefx2my5sefWu3bzJqEDJkfyPfMh1rgRx3Ta8zvC8Mg0vurxW
         hZyGotbdHV8l2XE2NlXu/Ctockdx0IykIlOPIXRu2Arif4lPgm2S2mnPxsl4esT/bt4n
         Gh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677190436;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0asgBIrzU0dOJMKMtwksef+D8Jii3KaOyNALHHRJVfg=;
        b=voeN+t595QtNlrjl4rNM1/jvemeySp9mJbYpHHCtoEHVprJ3C6kuMgbIZ4SkYgshlJ
         X2igJTJca245Dnpc5z7XEY3V/Q+qxJSFMHRMrybunje+9rnS7B1TzL6sQK+UZQSVF+IR
         NWUsx2JWGSnRdYVT43sTL+QbQQaTYbpHGlK32F1r6hdZZ9+2jVvQiv+ebt/iELGb+eFq
         +aVZ1/mmzuuX9QvBS2VyHwboK0Tk2zGu5Wkp7YJBAxoU3FCb5+U+1hoo5obimT3fUWKy
         K2BFl/kfcnlvjOBYrfw6qGk6QwyFlCVUrNom5WxjZMFEckHWqvhx4wQMdwsD5NDaPVJo
         sMXQ==
X-Gm-Message-State: AO0yUKUFLbMVEopCROHDUiIx/xxFPetzTkPaca9sABUHTVQVCs4UDfBq
	XT5AZZsPK9s7S0owso0ck8538JpuWBjpl1ZN
X-Google-Smtp-Source: AK7set8OgDz2ecNF+q/fWc5mPKRjuXW60n0nB/o81FQZ5XtfzUxScHnYA6Sf0wzcg6IPryIVb43qNg==
X-Received: by 2002:a17:903:846:b0:198:a372:3e67 with SMTP id ks6-20020a170903084600b00198a3723e67mr11434779plb.27.1677190436340;
        Thu, 23 Feb 2023 14:13:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y14-20020a170902b48e00b00199536fbc6fsm4959001plr.280.2023.02.23.14.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 14:13:55 -0800 (PST)
Date: Thu, 23 Feb 2023 14:13:55 -0800 (PST)
X-Google-Original-Date: Thu, 23 Feb 2023 14:13:10 PST (-0800)
Subject: Re: [PATCH] RISC-V: Stop emitting attributes
In-Reply-To: <Y/fYCbcHByowuhD1@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a7fa6818-4d87-4a37-a17b-905376410809@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_141406_272929_397D4E39 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Feb 2023 13:18:01 PST (-0800), Conor Dooley wrote:
> On Thu, Feb 23, 2023 at 11:51:12AM -0800, Palmer Dabbelt wrote:
>> The RISC-V ELF attributes don't contain any useful information.  New
>> toolchains ignore them, but they frequently trip up various older/mixed
>> toolchains.  So just turn them off.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/Makefile | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 76989561566b..1fc504e2b85e 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -81,6 +81,11 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>>          KBUILD_CFLAGS += -fno-omit-frame-pointer
>>  endif
>>  
>> +# The RISC-V attributes frequently cause compatibility issues and provide no
>> +# information, so just turn them off.
>> +KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
>> +KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
>> +
>>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>>  KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>
> As requested, the build issues I see w/ this patch applied & ld 2.35:
>   LD      arch/riscv/purgatory/purgatory.ro
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/memcpy.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/memset.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/strcmp.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/strlen.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/strncmp.o
>   CHECK   /stuff/linux/ipc/ipc_sysctl.c
> make[6]: *** [/stuff/linux/arch/riscv/purgatory/Makefile:95: arch/riscv/purgatory/purgatory.ro] Error 1
> make[6]: Target 'arch/riscv/purgatory/' not remade because of errors.
> make[5]: *** [/stuff/linux/scripts/Makefile.build:504: arch/riscv/purgatory] Error 2

I'm not actually reproducing these locally because I don't want to mess 
with the toolchain, but I think

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1fc504e2b85e..7b53f0be56b2 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -84,7 +84,9 @@ endif
 # The RISC-V attributes frequently cause compatibility issues and provide no
 # information, so just turn them off.
 KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
+KBUILD_AFLAGS += $(call cc-option,-mno-riscv-attribute)
 KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)

 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)

should fix the purgatory bits.  There might be a better way to do that, 
though, as the AS in purgatory ends up calling CC...

>   CC      arch/riscv/mm/dma-noncoherent.o
>   AR      arch/riscv/kernel/probes/built-in.a
>   CHECK   /stuff/linux/lib/zlib_inflate/inffast.c
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
>   VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/vdso/getcpu.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/vdso/flush_icache.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/vdso/note.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv32i2p0_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/compat_vdso/getcpu.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv32i2p0_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/compat_vdso/flush_icache.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv32i2p0_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/compat_vdso/note.o

and I think this one sohuld do it

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 260daf3236d3..7f34f3c7c882 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -14,6 +14,10 @@ COMPAT_LD := $(LD)
 COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
 COMPAT_LD_FLAGS := -melf32lriscv

+# Disable attributes, as they're useless and break the build.
+COMPAT_CC_FLAGS += $(call cc-option,-mno-riscv-attribute)
+COMPAT_CC_FLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+
 # Files to link into the compat_vdso
 obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o

>   OBJCOPY arch/riscv/kernel/compat_vdso/compat_vdso.so
>   OBJCOPY arch/riscv/kernel/vdso/vdso.so
> riscv64-unknown-linux-gnu-objcopy: 'arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg': No such file
> riscv64-unknown-linux-gnu-objcopy: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file
> make[7]: *** [/stuff/linux/arch/riscv/kernel/compat_vdso/Makefile:48: arch/riscv/kernel/compat_vdso/compat_vdso.so] Error 1
>
> Specifically this is what I am running:
> CONFIG_CC_VERSION_TEXT="riscv64-unknown-linux-gnu-gcc (ge4703bd0e15-dirty) 13.0.1 20230122 (experimental)"
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=130001
> CONFIG_AS_IS_GNU=y
> CONFIG_AS_VERSION=24050
> CONFIG_LD_IS_BFD=y
> CONFIG_LD_VERSION=23500

With both of those I get no attributes in vmlinux, so hopefully things 
have been sorted out.  It's stuck at palmer/riscv-no_attributes-v2, in 
case that's easier.

>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
