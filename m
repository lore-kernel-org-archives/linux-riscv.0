Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A61FC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85xKiE943hw3LzCF54XXAkWg5FEV/IcF/l5jl3dbfs8=; b=Fs3Xq1Gq3sk56T
	wTwBHzq1/P7UcwRe9xNK5jQAY38VkXVXjzbpcs26BX+sktrIegwFyQgp0ENuHISCyxJoMfU1GX4iW
	o978OMDv0ycgOjhLDZso4ZUT+94HW6UT7+uJqOt7e4WuYFCLGu97tysTyrxJ/M8gak4Dgca40MUul
	OaHUNzazpfn2KkZvF954TrOyNCoZKDNaqx7UpEnlCofYTzuDKiVtzQNKxV//yGm5phmbQyquj9RW5
	Ju3PGbMPxTjkt/KSvngwMBT0Q2HoAqwNyb0Bw+O3lyZtt6IhV2ce3zmyGQKWGOD2wE+tAux1zA0Nn
	fwgfebgxfjBdd5HUvFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZ13-002lPJ-PR; Fri, 24 Feb 2023 14:25:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZ10-002lNh-DR
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:25:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id p26so11503754wmc.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8qKTtHqQK8FLA0oJfjcFw5f3kDArL6vpjGMjMuVjHZQ=;
        b=nd8HW1Bhh9OrCVBEdCsVUMa6KTpS6YpAOKY3q859cE+I25VLmTRUX18mZ1Xel/y706
         ctT25t7oSQ7SVk3kQ8xi8rigOWFQxgVbKHGrq04+dIb9qpPVZ0vWexSjO45Ps7QwboX9
         0BlAIluZD0sQNkJ5ySnYVnDEb/RXxH8SlzRjC9G4E9y0WkhO3o0unz2Sz3VaRuLdSgyl
         a9lQbfuqT2B8Ahoaa01nEBOxp+5g8h697EvPVkliT6EAIgVbFcI/HCvHvQgJDichoLnp
         dwjBbyBaFM5lPgvynqaRp2EMgOja7FxwbmlEqiP9Pl6TkmAUnk0xrRCJkPwFXov8wCVR
         fJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qKTtHqQK8FLA0oJfjcFw5f3kDArL6vpjGMjMuVjHZQ=;
        b=rvnt0gcR7XjUxS72l/ngR3zq2CmER3HiBqoNX+LmZO5mT+pas6APyWHsGAwgZ6+F/n
         ZGNRpIs70Uope3w7SwHYXTrYrvNn1arwMSDa4GuqYs3El6/mRqVWCug7Z0Ws3cM3cq7h
         wiSClC/5vgRMGvVbqzReJrUS8RgE2tpRpPGbzQnDHs9l8/WCsCM6g7ONqUbbpoSv2zAw
         C8s3kp+FZeHgk2SDU6NWSpfvNaMiLvElKF1pdcklgAP1h4rzYlPAoP3MypAtYhPaAaFS
         4N5uIp6u/Ke4yumlBt0+WKejjcJJSeea1vghtpC02Y2/amWnseNuPUThj2IO4/jYKlQ2
         REeA==
X-Gm-Message-State: AO0yUKXmCK/CvUqF5pi4zLgpLizNCL1zpFNy9Yv3bYHQHMZEG4JwY5GG
	gLka41L6YSZOXFCOEb2lU35SdTdJSuD53Tos
X-Google-Smtp-Source: AK7set+g8JgeU1vskte/hTUnZ/R8FC6OFclYVPvQ4kF+CeDjWK2egKrXcNce2gY/uiKkMiBC0hJGHw==
X-Received: by 2002:a05:600c:4d25:b0:3cf:7197:e68a with SMTP id u37-20020a05600c4d2500b003cf7197e68amr12480922wmp.18.1677248732121;
        Fri, 24 Feb 2023 06:25:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id be6-20020a05600c1e8600b003e89e3284fasm3115986wmb.36.2023.02.24.06.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:25:31 -0800 (PST)
Date: Fri, 24 Feb 2023 15:25:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org, 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: Re: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230224142530.mq5qzfycvyvtnqiv@orel>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-7-ajones@ventanamicro.com>
 <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_062538_466807_05B3E387 
X-CRM114-Status: GOOD (  33.79  )
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

On Fri, Feb 24, 2023 at 02:00:44PM +0000, Ben Dooks wrote:
> On 21/02/2023 19:09, Andrew Jones wrote:
> > Using memset() to zero a 4K page takes 563 total instructions, where
> > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > takes 169 total instructions, where 4 are branches and 33 are nops.
> > Even though the block size is a variable, thanks to alternatives, we
> > can still implement a Duff device without having to do any preliminary
> > calculations. This is achieved by using the alternatives' cpufeature
> > value (the upper 16 bits of patch_id). The value used is the maximum
> > zicboz block size order accepted at the patch site. This enables us
> > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > loop and continue after 4K if the page size would be larger)
> > 
> > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > only loop a few times and larger block sizes to not loop at all. Since
> > cbo.zero doesn't take an offset, we also need an 'add' after each
> > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > is small enough to not cause icache misses.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   arch/riscv/Kconfig                | 13 ++++++
> >   arch/riscv/include/asm/insn-def.h |  4 ++
> >   arch/riscv/include/asm/page.h     |  6 ++-
> >   arch/riscv/kernel/cpufeature.c    | 11 +++++
> >   arch/riscv/lib/Makefile           |  1 +
> >   arch/riscv/lib/clear_page.S       | 73 +++++++++++++++++++++++++++++++
> >   6 files changed, 107 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/riscv/lib/clear_page.S
> 
> [snip]
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 0594989ead63..4a496552b812 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -292,6 +292,17 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
> >   	if (!value)
> >   		return true;
> > +	switch (id) {
> > +	case RISCV_ISA_EXT_ZICBOZ:
> > +		/*
> > +		 * Zicboz alternative applications provide the maximum
> > +		 * supported block size order, or zero when it doesn't
> > +		 * matter. If the current block size exceeds the maximum,
> > +		 * then the alternative cannot be applied.
> > +		 */
> > +		return riscv_cboz_block_size <= (1U << value);
> > +	}
> > +
> >   	return false;
> >   }
> > diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> > index 6c74b0bedd60..26cb2502ecf8 100644
> > --- a/arch/riscv/lib/Makefile
> > +++ b/arch/riscv/lib/Makefile
> > @@ -8,5 +8,6 @@ lib-y			+= strlen.o
> >   lib-y			+= strncmp.o
> >   lib-$(CONFIG_MMU)	+= uaccess.o
> >   lib-$(CONFIG_64BIT)	+= tishift.o
> > +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> >   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > new file mode 100644
> > index 000000000000..7c7fa45b5ab5
> > --- /dev/null
> > +++ b/arch/riscv/lib/clear_page.S
> > @@ -0,0 +1,73 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/hwcap.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/page.h>
> > +
> > +#define CBOZ_ALT(order, old, new)				\
> > +	ALTERNATIVE(old, new, 0,				\
> > +		    ((order) << 16) | RISCV_ISA_EXT_ZICBOZ,	\
> > +		    CONFIG_RISCV_ISA_ZICBOZ)
> > +
> > +/* void clear_page(void *page) */
> > +ENTRY(__clear_page)
> > +WEAK(clear_page)
> 
> out of interest, why the __clear_page() entry and the
> WEAK(clear_page)?

I was inspired by memset, but, in hindsight, it doesn't make sense for
clear_page to be weak.

> 
> Just followed up with a patch to fix the modpost.

Thanks!

> 
> So far this seems to be working with qemu and a backport to 5.19.x

Great news!

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
