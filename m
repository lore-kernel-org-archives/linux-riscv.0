Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F139C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBZzvWgMGNJFZRcN0SUW6VoUeVIhadtNLhAbZMcccm4=; b=FA+SgI7BDau2yN
	8Az7l6T9AHoKpoCBgyZFKU3FKgaiqm6NczDZzBrvI/XqY4twKFihl5pqdsBTlTlc4fLFjE0ZK8BiM
	7rnRYs6EA+MAjH9AZTlOa5V0+PMhZVBPBNd/PRXuvEo3a1CVyW0OJ8VJnfqT3N3hc+OYrhj1fVPYe
	DV0ji5XS8UKLRgTCeBlFCvV60RlDn27IqJIJ5RChQHXaTXFzIbOKZNmkEUMIOqnHgHKhH+attR7Mx
	bn7Yvkj1cJY1TTv1tWt8ghHPxwF5SykDdOAqnEh2acRFZQwtm02sUCBd1LT2QvnGt5Qgsk45uwDKg
	uk9Vmj4zSeZ6UpksRC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSzs8-00E84l-4r; Fri, 17 Feb 2023 12:29:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSzs4-00E82b-Oz
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 12:29:50 +0000
Received: by mail-ed1-x530.google.com with SMTP id co2so3155679edb.13
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 04:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owHO+6hTU2ouz0uogNlGw+4ukbVs6LtcIj1FaIc6ylU=;
        b=IN7oUN9MYAGNu0eC5xo/ZJ+6pIBCOwIc3g5MLbZh0iDahoKTwpLW+4qJ3qc78siA93
         xPLXfG16PWftxhZWkXdfjuD/y9xHy4FdBJT6ivHwQtWSKRsD2uO8t5vUy5fUsVIwgi3u
         6d1EvXrMOwMXxCuIdRV0fU1ikA+T+vUKQj1PwkFMuqKnwSae8nMG0AmxvmgfB0oiXj66
         zWFfRLk0MoqhaDt0ZSCYndOQMVuQbeYjs0yZsZi998xJZH5WsQQ7YVFpUqSnA0XfUb1y
         b6zG48Zhd7IV3cMiSCfSk0+JIkQ6IZjsLXqoreIXddXD2A1thm5+2trvDVyHupZUEDGK
         s6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owHO+6hTU2ouz0uogNlGw+4ukbVs6LtcIj1FaIc6ylU=;
        b=tzorgGUOnvzwCUnm05nFtTb7+3PYt6EzIrkUsCt2HdK9N9psET9mF45xeB42kt5ZAv
         u7dwwFjO7InGpWfZLfdfZdqEI7On7XardIALjuQnjJiK/P/B6suX57vWpfPGB3sQahbO
         ULZt54yEovQYDzryUWXya123xWkeCSuFvEJODAJ6WJu4UWQybkTuIx3rvZsVHg6tUO40
         AfQxibIY18PECVdgTMpC/fuGZuCB1bKsKjJhn3k+gIh7X1irBJK2vNoOdbTkuxR4R8fI
         WxeqMEa2vOsqoUJqqHLCl97KsO90F0VPV/39TnfF+JuDk9JjX1kvL4XfF1oN3zkZ+cYv
         HCLQ==
X-Gm-Message-State: AO0yUKXp/EA3gxxenaVoGL8ltV0WHzgmFlr5Of0Zv2puWMJQ5aiXAEGJ
	XdOa6RZxBrIhoAXSi/KFWwTInA==
X-Google-Smtp-Source: AK7set9N7xVNqMd0G9iIwCDESBeEDD5Uz3Gi2qu6Ti19IdUZpRxNeWSlDpZJjBuxK/19pMqkO3pPvA==
X-Received: by 2002:a17:907:2ce1:b0:8ae:e30f:4091 with SMTP id hz1-20020a1709072ce100b008aee30f4091mr6119942ejc.30.1676636985822;
        Fri, 17 Feb 2023 04:29:45 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jy28-20020a170907763c00b008b17b123a47sm1242060ejc.208.2023.02.17.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 04:29:45 -0800 (PST)
Date: Fri, 17 Feb 2023 13:29:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230217122943.24caosketyvfcc4f@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
 <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_042948_844140_0745C4B3 
X-CRM114-Status: GOOD (  48.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 17, 2023 at 10:50:07AM +0000, Ben Dooks wrote:
> On 17/02/2023 10:18, Ben Dooks wrote:
> > On 09/02/2023 15:26, Andrew Jones wrote:
> > > Using memset() to zero a 4K page takes 563 total instructions, where
> > > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > > takes 169 total instructions, where 4 are branches and 33 are nops.
> > > Even though the block size is a variable, thanks to alternatives, we
> > > can still implement a Duff device without having to do any preliminary
> > > calculations. This is achieved by taking advantage of 'vendor_id'
> > > being used as application-specific data for alternatives, enabling us
> > > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > > loop and continue after 4K if the page size would be larger)
> > > =

> > > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > > only loop a few times and larger block sizes to not loop at all. Since
> > > cbo.zero doesn't take an offset, we also need an 'add' after each
> > > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > > is small enough to not cause icache misses.
> > > =

> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > =A0 arch/riscv/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
 13 ++++++
> > > =A0 arch/riscv/include/asm/insn-def.h |=A0 4 ++
> > > =A0 arch/riscv/include/asm/page.h=A0=A0=A0=A0 |=A0 6 ++-
> > > =A0 arch/riscv/kernel/cpufeature.c=A0=A0=A0 | 11 +++++
> > > =A0 arch/riscv/lib/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > > =A0 arch/riscv/lib/clear_page.S=A0=A0=A0=A0=A0=A0 | 71 ++++++++++++++=
+++++++++++++++++
> > > =A0 6 files changed, 105 insertions(+), 1 deletion(-)
> > > =A0 create mode 100644 arch/riscv/lib/clear_page.S
> > > =

> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 029d1d3b40bd..9590a1661caf 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -456,6 +456,19 @@ config RISCV_ISA_ZICBOM
> > > =A0=A0=A0=A0=A0=A0=A0=A0 If you don't know what to do here, say Y.
> > > +config RISCV_ISA_ZICBOZ
> > > +=A0=A0=A0 bool "Zicboz extension support for faster zeroing of memor=
y"
> > > +=A0=A0=A0 depends on !XIP_KERNEL && MMU
> > > +=A0=A0=A0 select RISCV_ALTERNATIVE
> > > +=A0=A0=A0 default y
> > > +=A0=A0=A0 help
> > > +=A0=A0=A0=A0=A0=A0 Enable the use of the ZICBOZ extension (cbo.zero =
instruction)
> > > +=A0=A0=A0=A0=A0=A0 when available.
> > > +
> > > +=A0=A0=A0=A0=A0=A0 The Zicboz extension is used for faster zeroing o=
f memory.
> > > +
> > > +=A0=A0=A0=A0=A0=A0 If you don't know what to do here, say Y.
> > > +
> > > =A0 config TOOLCHAIN_HAS_ZIHINTPAUSE
> > > =A0=A0=A0=A0=A0 bool
> > > =A0=A0=A0=A0=A0 default y
> > > diff --git a/arch/riscv/include/asm/insn-def.h
> > > b/arch/riscv/include/asm/insn-def.h
> > > index e01ab51f50d2..6960beb75f32 100644
> > > --- a/arch/riscv/include/asm/insn-def.h
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -192,4 +192,8 @@
> > > =A0=A0=A0=A0=A0 INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),=A0=A0=A0=
=A0=A0=A0=A0 \
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RS1(base), SIMM12(2))
> > > +#define CBO_zero(base)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > +=A0=A0=A0 INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),=A0=A0=A0=A0=A0=
=A0=A0 \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RS1(base), SIMM12(4))
> > > +
> > > =A0 #endif /* __ASM_INSN_DEF_H */
> > > diff --git a/arch/riscv/include/asm/page.h
> > > b/arch/riscv/include/asm/page.h
> > > index 9f432c1b5289..ccd168fe29d2 100644
> > > --- a/arch/riscv/include/asm/page.h
> > > +++ b/arch/riscv/include/asm/page.h
> > > @@ -49,10 +49,14 @@
> > > =A0 #ifndef __ASSEMBLY__
> > > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > > +void clear_page(void *page);
> > > +#else
> > > =A0 #define clear_page(pgaddr)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memse=
t((pgaddr), 0, PAGE_SIZE)
> > > +#endif
> > > =A0 #define copy_page(to, from)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memc=
py((to), (from), PAGE_SIZE)
> > > -#define clear_user_page(pgaddr, vaddr, page)=A0=A0=A0 memset((pgaddr=
), 0,
> > > PAGE_SIZE)
> > > +#define clear_user_page(pgaddr, vaddr, page)=A0=A0=A0 clear_page(pga=
ddr)
> > > =A0 #define copy_user_page(vto, vfrom, vaddr, topg) \
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memcpy((vto), (vfrom), PAGE_S=
IZE)
> > > diff --git a/arch/riscv/kernel/cpufeature.c
> > > b/arch/riscv/kernel/cpufeature.c
> > > index 74736b4f0624..42246bbfa532 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> > > =A0 #ifdef CONFIG_RISCV_ALTERNATIVE
> > > =A0 static bool riscv_cpufeature_application_check(u32 feature, u16 d=
ata)
> > > =A0 {
> > > +=A0=A0=A0 switch (feature) {
> > > +=A0=A0=A0 case RISCV_ISA_EXT_ZICBOZ:
> > > +=A0=A0=A0=A0=A0=A0=A0 /*
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 * Zicboz alternative applications provide t=
he maximum
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 * supported block size order, or zero when =
it doesn't
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 * matter. If the current block size exceeds=
 the maximum,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 * then the alternative cannot be applied.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0 return data =3D=3D 0 || riscv_cboz_block_size =
<=3D (1U << data);
> > > +=A0=A0=A0 }
> =

> =

> =

> > > +
> > > =A0=A0=A0=A0=A0 return data =3D=3D 0;
> > > =A0 }
> > > diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> > > index 6c74b0bedd60..26cb2502ecf8 100644
> > > --- a/arch/riscv/lib/Makefile
> > > +++ b/arch/riscv/lib/Makefile
> > > @@ -8,5 +8,6 @@ lib-y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +=3D strlen.o
> > > =A0 lib-y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +=3D strncmp.o
> > > =A0 lib-$(CONFIG_MMU)=A0=A0=A0 +=3D uaccess.o
> > > =A0 lib-$(CONFIG_64BIT)=A0=A0=A0 +=3D tishift.o
> > > +lib-$(CONFIG_RISCV_ISA_ZICBOZ)=A0=A0=A0 +=3D clear_page.o
> > > =A0 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) +=3D error-inject.o
> > > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > > new file mode 100644
> > > index 000000000000..5b851e727f7c
> > > --- /dev/null
> > > +++ b/arch/riscv/lib/clear_page.S
> > > @@ -0,0 +1,71 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > > + */
> > > +
> > > +#include <linux/linkage.h>
> > > +#include <asm/asm.h>
> > > +#include <asm/alternative-macros.h>
> > > +#include <asm/hwcap.h>
> > > +#include <asm/insn-def.h>
> > > +#include <asm/page.h>
> > > +
> > > +#define CBOZ_ALT(order, old, new)=A0=A0=A0 \
> > > +=A0=A0=A0 ALTERNATIVE(old, new, order, RISCV_ISA_EXT_ZICBOZ,
> > > CONFIG_RISCV_ISA_ZICBOZ)
> > =

> > I thought this was meant to be a CPUFEATURE_ZICBOZ thing for the
> > alternatives?
> > =

> > I may also be missing something, but when backporting this to 5.19
> > to test it on our system the "order" argument is in fact the vendor-id
> > so this doesn't work as the alternatives don't get patched in at-all.
> =

> So it looks like when backporting I missed the updated in
> arch/riscv/kernel/cpufeature.c for testing the block size
> which explains the issues I was seeing with the assembly
> code.
> =

> I'm not sure why it wouldn't assemble for me with the
> RISCV_ISA_EXT_ZICBOZ being undefined.
> =

> With using vendor-id with the RISCV_ISA_EXT_ZICBOZ as the
> errata-id, would the RISCV_ISA_EXT space need to be reserved
> for any vendor specific IDs?

Hi Ben,

I'll be sending a new version where I don't touch vendor-id anymore, but
rather break errata_id into two parts: id and application-data.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
