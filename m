Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E497C02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2euPb0A2j/w6Bv3TL5TUdxamL7Fl2gxNI9y221FRmYg=; b=nn9eNmmRxjQYm8injK2XqSLZSv
	uzzMW+qY68b6mNzYcROi6LGZMFGGZXomTfenkfvFJVNWO3sg2TEuLibGqTi35yVn1ViY8c9Lx2jC+
	6YyGLAbfg+wdSwm7UgckQKU0f2GBPcStdrLqxChzMGAPjBq5mqML9oQOxIygjUj/izjNW6h+iYrUW
	sYGRteXiaeS80RNW66hYRqKUErP1Z2kc7UQL1jwfDzKewNrq+5vY24wik+T9FSWBUfv7RGRIuEYg5
	I7GgcR4V5zpIoNDrHc52Yxkmrxo8uGWGvCqTuLt/TCmY+zbS6cw8i7HbiOANoXZX+gBrrpz2yQcDm
	ftvUuQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflsd-00000004XOf-3tcR;
	Wed, 05 Feb 2025 20:20:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflsZ-00000004XN8-3Zzq
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 20:20:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso1099679a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 12:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738786811; x=1739391611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX+Sh5T3PaL+QWEnl0hjKKEH7VOJE9BsDETeBZSLsC4=;
        b=gipzyJ0zCYRXDAwEDqecC71PucCERJZ+QOnCoYmTooFYiMB4quDTEbhcyL7p3+7t1c
         pTGlBoDk/ieWol/03CZ4Ta2rj1ntl2i0yWmtoAea4UNVko8RhJTgtNM89Ct8vS0ejUPx
         bFeXKhwYjoUw4xgWdu5tnr0/DackH4rexhwRs7fZnx8Zk/5jpT4utp+NqVkIsZXxZdga
         rMxPYeWFtVTj1hrqQ+faXUGTgjz5m0joCq6pANt5dOgK0wuqU2x9iTYyorewdY+++2x2
         w+BZwaqf4GwfsDwHruqF/FTWwFIaCb6gpWZpbXiJhQBKAPiGnT84qWQCTeDXpX7j7pJO
         3tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786811; x=1739391611;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX+Sh5T3PaL+QWEnl0hjKKEH7VOJE9BsDETeBZSLsC4=;
        b=cARuAbTSc3aQ0gkky3q0Hre6r0uuLClYZX1VUqxChcYr5d68ZS55M8xishbYtMDfsn
         eU/tHSOibM8osro0FqJl1wa5rsZrUzdfwG1l/47fCtBTDhGq2b1NZ6+pFt3yfy9P1lqt
         pF1u5/0b/Jo4rmD7VqaRO+LlPwHrmbTHK+E5eDTZt4TIYwLUWaS3yeVG3aqXwB16IXjq
         tu1uLEqHVdWyRVYcJ4KeHsSt6xUnIby5nyvGYKlyNHrn1sCt3hyijkF4MTxjfd/ZbQ75
         YTqPuFiPRT3fyWQbfBzbKu2eygnkGLrMrB1VYAZah8fE0opGCO9DGJlfg4mhEaUdmztO
         TKsw==
X-Forwarded-Encrypted: i=1; AJvYcCXYceY35FlMxtaHLZPPk/SD4Ec577SVfd1xTbfiJLJtqjcQH0LGPrOouspscBp94/viXZsm0ui66Zki/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRYhXQlNF5wVEEAM+pGE/PypKl+RzTayP+I1o9cEwJkL5dJGTN
	aqWUqQoLLt83vropNVgGhhLQ/506/VTQr97upWAmQg9zm31H0/bFf7OcFSD4vWg=
X-Gm-Gg: ASbGncvzJnV8VS9qh0ATiR0gnR5eW7ZAgPJYKuIae5bCLtTpnqgqQx9Iwu6hcP+XRD6
	5OKOqLm7TrA9APmxe1IJ21iaLeoBtxXiCmCOn7l2s0tfPTn60xB8iv3J81RaMnOw+PIcpc3aPUc
	Fa9P/3blaNEffoJ7znr6JNrRpuM+sKUareR8X9XUPWn3OxfsbEzJrtjfKJvEjgUqPIiuAgq/NEZ
	TItY12N+fRzMAJ632uamstGNtQVk2l6uQzNeomSuDnTOj3gfMiHA34Lc5Rbep2HOHIGACamCZ4b
	JRKk17JeKYY4
X-Google-Smtp-Source: AGHT+IEFjhGWBA15EiC5Nj97NLp62uuszO3tIVmMaUsJvfBeL6+xT+t6gGEWElptXMC2M0mhdTS+Lw==
X-Received: by 2002:a17:90a:e7c8:b0:2f7:b149:538f with SMTP id 98e67ed59e1d1-2f9ff787646mr1078810a91.4.1738786810832;
        Wed, 05 Feb 2025 12:20:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d77b73sm2228736a91.12.2025.02.05.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:20:10 -0800 (PST)
Date: Wed, 05 Feb 2025 12:20:10 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 12:20:08 PST (-0800)
Subject: Re: [PATCH 04/15] kasan: arm64: x86: risc-v: Make special tags arch specific
In-Reply-To: <cdb119dcade0cea25745c920aba8434c27e4c93b.1738686764.git.maciej.wieczor-retman@intel.com>
CC: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, tj@kernel.org,
  andreyknvl@gmail.com, brgerst@gmail.com, Ard Biesheuvel <ardb@kernel.org>,
  dave.hansen@linux.intel.com, jgross@suse.com, Will Deacon <will@kernel.org>, akpm@linux-foundation.org,
  Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net, maciej.wieczor-retman@intel.com, dvyukov@google.com,
  richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, hpa@zytor.com, seanjc@google.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com,
  glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com,
  rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com,
  Catalin Marinas <catalin.marinas@arm.com>, junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com,
  dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com,
  dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, peterz@infradead.org, cl@linux.com,
  kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maciej.wieczor-retman@intel.com
Message-ID: <mhng-33ede5ce-7625-431b-a48f-fd6abf7f78ba@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_122012_159992_2B19BE71 
X-CRM114-Status: GOOD (  30.75  )
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

On Tue, 04 Feb 2025 09:33:45 PST (-0800), maciej.wieczor-retman@intel.com wrote:
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Max value. 0xFD is the highest value that can be randomly generated
>   for a new tag.
>
> Metadata macro is also defined:
> - Tag width equal to 8.
>
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
>
> Make tags arch specific for x86, risc-v and arm64. On x86 the values
> just lose the top 4 bits.
>
> Replace hardcoded kernel tag value and tag width with macros in KASAN's
> non-arch specific code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  MAINTAINERS                         |  2 +-
>  arch/arm64/include/asm/kasan-tags.h |  9 +++++++++
>  arch/riscv/include/asm/kasan-tags.h | 12 ++++++++++++
>  arch/riscv/include/asm/kasan.h      |  4 ----
>  arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
>  include/linux/kasan-tags.h          | 12 +++++++++++-
>  include/linux/kasan.h               |  4 +++-
>  include/linux/mm.h                  |  6 +++---
>  include/linux/page-flags-layout.h   |  7 +------
>  9 files changed, 49 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/riscv/include/asm/kasan-tags.h
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..45671faa3b6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12227,7 +12227,7 @@ L:	kasan-dev@googlegroups.com
>  S:	Maintained
>  B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
>  F:	Documentation/dev-tools/kasan.rst
> -F:	arch/*/include/asm/*kasan.h
> +F:	arch/*/include/asm/*kasan*.h
>  F:	arch/*/mm/kasan_init*
>  F:	include/linux/kasan*.h
>  F:	lib/Kconfig.kasan
> diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..9e835da95f6b
> --- /dev/null
> +++ b/arch/arm64/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH 8
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/arch/riscv/include/asm/kasan-tags.h b/arch/riscv/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..83d7dcc8af74
> --- /dev/null
> +++ b/arch/riscv/include/asm/kasan-tags.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_TAG_KERNEL	0x7f /* native kernel pointers tag */
> +#endif
> +
> +#define KASAN_TAG_WIDTH 8
> +
> +#endif /* ASM_KASAN_TAGS_H */
> +
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index f6b378ba936d..27938e0d5233 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -41,10 +41,6 @@
>
>  #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>
> -#ifdef CONFIG_KASAN_SW_TAGS
> -#define KASAN_TAG_KERNEL	0x7f /* native kernel pointers tag */
> -#endif
> -
>  #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
>  #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
>  #define arch_kasan_get_tag(addr)	__tag_get(addr)
> diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..68ba385bc75c
> --- /dev/null
> +++ b/arch/x86/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL	0xF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH		4
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
> index e07c896f95d3..b4aacfa8709b 100644
> --- a/include/linux/kasan-tags.h
> +++ b/include/linux/kasan-tags.h
> @@ -2,7 +2,17 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>
> +#endif
> +
> +#ifdef CONFIG_KASAN_SW_TAGS_DENSE
> +#define KASAN_TAG_WIDTH		4
> +#endif
> +
> +#ifndef KASAN_TAG_WIDTH
> +#define KASAN_TAG_WIDTH		0
> +#endif
>
>  #ifndef KASAN_TAG_KERNEL
>  #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 5a3e9bec21c2..83146367170a 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -88,7 +88,9 @@ static inline u8 kasan_get_shadow_tag(const void *addr)
>
>  #ifdef CONFIG_KASAN_SW_TAGS
>  /* This matches KASAN_TAG_INVALID. */
> -#define KASAN_SHADOW_INIT 0xFE
> +#ifndef KASAN_SHADOW_INIT
> +#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
> +#endif
>  #else
>  #define KASAN_SHADOW_INIT 0
>  #endif
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 61fff5d34ed5..ddca2f63a5f6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1813,7 +1813,7 @@ static inline u8 page_kasan_tag(const struct page *page)
>
>  	if (kasan_enabled()) {
>  		tag = (page->flags >> KASAN_TAG_PGSHIFT) & KASAN_TAG_MASK;
> -		tag ^= 0xff;
> +		tag ^= KASAN_TAG_KERNEL;
>  	}
>
>  	return tag;
> @@ -1826,7 +1826,7 @@ static inline void page_kasan_tag_set(struct page *page, u8 tag)
>  	if (!kasan_enabled())
>  		return;
>
> -	tag ^= 0xff;
> +	tag ^= KASAN_TAG_KERNEL;
>  	old_flags = READ_ONCE(page->flags);
>  	do {
>  		flags = old_flags;
> @@ -1845,7 +1845,7 @@ static inline void page_kasan_tag_reset(struct page *page)
>
>  static inline u8 page_kasan_tag(const struct page *page)
>  {
> -	return 0xff;
> +	return KASAN_TAG_KERNEL;
>  }
>
>  static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
> index 7d79818dc065..ac3576f409ad 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -3,6 +3,7 @@
>  #define PAGE_FLAGS_LAYOUT_H
>
>  #include <linux/numa.h>
> +#include <linux/kasan-tags.h>
>  #include <generated/bounds.h>
>
>  /*
> @@ -72,12 +73,6 @@
>  #define NODE_NOT_IN_PAGE_FLAGS	1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> -#define KASAN_TAG_WIDTH 8
> -#else
> -#define KASAN_TAG_WIDTH 0
> -#endif
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  #define LAST__PID_SHIFT 8
>  #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Probably best to keep this along with the rest of the patches, but LMK 
if you want me to point something at the RISC-V tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
