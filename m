Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B66CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vi8leI1UFD2HhVV+1mrQCYXm9hInOLs/786Uiyguss8=; b=vnN+EpvINOVYds43C2PqtOVYTS
	v2SbSCUs+CCDEY5nwdrEiTcAhmLCd3uE1IDTIYx8jbL8o3l5Rmo+Km8/osI4Vce1DUw38QsW9bRZu
	ZBwafr83xtmD3OL9Bx1kLXfdaTh7m+3S4YoP6Zvc77PcmbNAVL5aLnMxnvMqb7pcuUTy0cG8kKBBA
	eAP1IvvqiVwMAhwy2IiR+rDtCat3q9GNSQVFYETmwcE49zkGDx6ZYEjvxJhPKEp+C1DT5htxywbLG
	M3G5a7jztzL6e0HOuFwohmBFSLpyhh2beFHqksEP0qMJGwGcR/is3EyJeetAAxfGWlmsfYe4QxOgY
	gdoEs9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNsY-00000002ytH-22FP;
	Thu, 04 Apr 2024 14:15:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNsV-00000002yrf-1Hjd
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:15:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dff837d674so8875795ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 07:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712240142; x=1712844942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dQTK01Mc93Hqq7XN7ozDnupNum3f6cBI1vXeUhrQTs=;
        b=HNuDoAZQnz4y3OB1iJ8pT/Tx1OkGkqCpwJRI+yYY/zmSykvCP2bhUaiI8f+vcBdrCq
         Eq6hiB4FuWLFobLXNYzSE8HKGGXxeUqhfGFtupSSHtILP22efWgThzbOBOhilOrXJo2o
         OzU+rnkxqEK1HHcKduI8jcgKJg6zN3wPGFMgDP4Hv13v/3P2YTyswedFuYzgt9Egvev8
         F8p6nd0J8Y1zUvJaCLnvgh+6pyl44/94IzyFd6EjR/EXoJ7CXx0gx3GiuqYy/R4c/nn5
         sHmPzNxcLySFRyliMfc5KBrBDgTlt/vGjd5DmH+kDNWS8A+clCupnTejcw1YfBtkg/V7
         JdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712240142; x=1712844942;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dQTK01Mc93Hqq7XN7ozDnupNum3f6cBI1vXeUhrQTs=;
        b=kmHG9SDJjkuB0Pt5M4i7tLM49hmCHh1sFumke30qtBkmWJMZHPXiElzzm2xInhgjSb
         42z9vKCWQ/NVanD8uDOuVw/ewhp5OfwiqQ/BKj4EtjvSzuaQNcaMLSBHF8kdtSFks+Yi
         RjlyHudVC2ybeTfUx1LfnFq6ycgMu49X5snXCrtIbP3JyiU2KIPNhipqHe7mxp3a+JlT
         5yRKIVtPl64pNC21ZHUhsrm+g90J5ogrEXH7vO/BTf8ypeaLF0TD2M3g/gskeybh++NN
         JkF1+jk0cViPt5uSbWfL/VP2YHSN145qHYBKpyMccqNnIRRh/xpfLZahk33FqFSk3bXa
         rP7g==
X-Forwarded-Encrypted: i=1; AJvYcCWfgTcskMCr9aJkkWcIF2S9J9Gt0HqhlgVqzHgkw4KaEUJx4AbeLtNGjLiO0pomNw3i0bog06MIudPczA2CtzqsfbU36voYTWeT2r0BXvZW
X-Gm-Message-State: AOJu0YzH8beM70SZyTuz2s5CLXiy8Nlv7m8eLBMtGJPEz1EMwWSx0tR9
	ud1ZPiSWgG4VKAGyzMkyO7CD8EICzCr6+Rr+tVMLuQuMWyzqImgsilMo0RS+Tek=
X-Google-Smtp-Source: AGHT+IFe8EfuHyfR6/MI5fUajRdSh/iNX7dmkKRiYA/xzF9WgxpkGHT5zehtXJ97sF4LICcgy/mGgg==
X-Received: by 2002:a17:902:e542:b0:1dd:5f85:118c with SMTP id n2-20020a170902e54200b001dd5f85118cmr2773574plf.62.1712240141481;
        Thu, 04 Apr 2024 07:15:41 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902c40500b001e252f2bdd2sm9133829plk.289.2024.04.04.07.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:15:40 -0700 (PDT)
Date: Thu, 04 Apr 2024 07:15:40 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Apr 2024 07:15:36 PDT (-0700)
Subject: Re: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte cmpxchg
In-Reply-To: <20240401213950.3910531-8-paulmck@kernel.org>
CC: linux-kernel@vger.kernel.org, kernel-team@meta.com, paulmck@kernel.org,
  andi.shyti@linux.intel.com, andrzej.hajda@intel.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: paulmck@kernel.org
Message-ID: <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_071543_471939_8EC4A5CB 
X-CRM114-Status: GOOD (  21.92  )
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

On Mon, 01 Apr 2024 14:39:50 PDT (-0700), paulmck@kernel.org wrote:
> Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
> and two-byte cmpxchg() on riscv.
>
> [ paulmck: Apply kernel test robot feedback. ]

I'm not entirely following the thread, but sounds like there's going to 
be generic kernel users of this now?  Before we'd said "no" to the 
byte/half atomic emulation routines beacuse they weren't used, but if 
it's a generic thing then I'm find adding them.

There's a patch set over here 
<https://lore.kernel.org/all/20240103163203.72768-2-leobras@redhat.com/> 
that implements these more directly using LR/SC.  I was sort of on the 
fence about just taking it even with no direct users right now, as the 
byte/half atomic extension is working its way through the spec process 
so we'll have them for real soon.  I stopped right there for the last 
merge window, though, as I figured it was too late to be messing with 
the atomics...

So

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you guys want to take some sort of tree-wide change to make the 
byte/half stuff be required everywhere.  We'll eventually end up with 
arch routines for the extension, so at that point we might as well also 
have the more direct LR/SC flavors.

If you want I can go review/merge that RISC-V patch set and then it'll 
have time to bake for a shared tag you can pick up for all this stuff?  
No rush on my end, just LMK.

> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: <linux-riscv@lists.infradead.org>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56b..4eaf40d0a52ec 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAS_VDSO_DATA
>  	select ARCH_KEEP_MEMBLOCK if ACPI
> +	select ARCH_NEED_CMPXCHG_1_2_EMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 2fee65cc84432..a5b377481785c 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -9,6 +9,7 @@
>  #include <linux/bug.h>
>
>  #include <asm/fence.h>
> +#include <linux/cmpxchg-emu.h>
>
>  #define __xchg_relaxed(ptr, new, size)					\
>  ({									\
> @@ -170,6 +171,12 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
> +	case 2:								\
> +		break;							\
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\
> @@ -214,6 +221,12 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
> +	case 2:								\
> +		break;							\
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\
> @@ -260,6 +273,12 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
> +	case 2:								\
> +		break;							\
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			RISCV_RELEASE_BARRIER				\
> @@ -306,6 +325,12 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
> +	case 2:								\
> +		break;							\
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
