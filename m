Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03DEC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1OQdfaOF33R0esXvtt1O8NCS5p4fKRHfJnPH8OoJF8=; b=eS0+sJZrt1/5/c
	6n6VEdAvMxpbFd2dMsDzh57Crmf3MXWnMkLyCLKHEyASwMR0nKx4ILs/BeXKpUjaWrG5sEtPWAC32
	9eAE6+pwW07x4uRHHF3hqKnNmHSl7e4tQ4qKd5jX75z8VdqQwNkwQk5rLDf9wL8BouGImr/yRbXp8
	P4Y7nISmkO94hX5JcBoInuKwwys3HMbeBp53BBfWtC1NVaS0leAzIzW3RJ94Se4xSiE2GZrNso7Wt
	2xfzr0slFa/meKYoGBvVAoCspCcpC5CGNumsK08uVyjdIH9vjAWeSITNTnjYKzchnDFavQew+I1A4
	53Rl/F6gZ7gufaPN6NTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafWy-009wWl-13;
	Mon, 28 Aug 2023 16:56:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafWu-009wVw-32
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 16:55:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bf55a81eeaso16026675ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693241753; x=1693846553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6dADE4JIoKuUoycP8WFqBlOjWsd0tbTmdi26jg+QDk=;
        b=H+L/lGRaj6MK/tpGUc6blUwt3DDTYu7mJtJOgIyN14lRYKg6khYtlHYNH9kBwJka1T
         YQ6IdkmAHC11sn+RAc9IyYyVBWoThWoUZNU/YuUkJjks3RDAkE1Bn9E2kn6GGzEDK5Wl
         G0sA/iUII5ZtIqPoZcOiOYllq+7YwIf3wkyQ1dHI0ZOpij8vl5hbx2W0GJ9BOUBk9zkT
         MnswFWqMpYxwZ1TWJLcxtegKgd+84Daq3WmD86fKI08ZEaHPTi9TYBCo0OYSQhdBykiI
         8WcXVhrB7cmh0b2QzoccQt4LM4RviIJZnszGAFQiTHbRmx8XP7o1s651iioUhVCl8fJJ
         aZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693241753; x=1693846553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6dADE4JIoKuUoycP8WFqBlOjWsd0tbTmdi26jg+QDk=;
        b=Demxo5riNjonkziH/2FKU3NyS2Cuulo/mLmt10JKji6zqOGmT3++W2dffqaWxVAibA
         IPBNeu9l9QmuvuqEixMkBYfBNbhC6DNYTiiVbgAllk2COrbodF0LCLVtqcmeLd3G245R
         hYIJZfC4PGfPS97ZRJzwHzjorSCNFwSX1CZ/SSxiT+p8KOAWW8dvZSH+ip1YJClZm6YV
         zsM/wysrarZKTLeBKuSYhXb7eK3aIusF3iZEvRE9ccYb/gwLjOzB6w3mOSAuy0b+SLU8
         iQ2tz5l5gPJP0Y9jq/UGr5quRsYfxjH3y3iOi2rGYLeFQdS18CsddARSjx9Q0eP8z4Qx
         9eLA==
X-Gm-Message-State: AOJu0YxlVSHRs02pbgTFJ33YaKemoSx/tGMFVJMg8g8c4q4bJY78TwCn
	G8Z355noA1jKph4ItLrzPQcNYA==
X-Google-Smtp-Source: AGHT+IHFF/gIZkhacXlClIHJCi+9dnhw50HJVjAW+DNR5VJTfWdI6L4DWboWU+fwKX1fkjW+GtR7wA==
X-Received: by 2002:a17:902:eed2:b0:1c0:dc8b:f982 with SMTP id h18-20020a170902eed200b001c0dc8bf982mr5820329plb.38.1693241752686;
        Mon, 28 Aug 2023 09:55:52 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1499:9915:c376:361b])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c25500b001b89536974bsm7626052plg.202.2023.08.28.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 09:55:52 -0700 (PDT)
Date: Mon, 28 Aug 2023 09:55:49 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <ZOzRlerSNjfzMYGH@ghost>
References: <20230827-turf-parched-b965bc697882@spud>
 <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
 <20230827-primer-conceal-b6f24b29e692@spud>
 <20230827-divisive-happy-cf93058c49bf@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827-divisive-happy-cf93058c49bf@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_095557_000244_5B17342D 
X-CRM114-Status: GOOD (  54.59  )
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

On Sun, Aug 27, 2023 at 01:25:27PM +0100, Conor Dooley wrote:
> On Sun, Aug 27, 2023 at 11:28:33AM +0100, Conor Dooley wrote:
> > On Sat, Aug 26, 2023 at 07:00:47PM -0700, Palmer Dabbelt wrote:
> > > On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> > > > On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> > > > > Provide checksum algorithms that have been designed to leverage riscv
> > > > > instructions such as rotate. In 64-bit, can take advantage of the larger
> > > > > register to avoid some overflow checking.
> > > > > 
> > > > > Add configuration for Zba extension and add march for Zba and Zbb.
> > > > > 
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > ---
> > > > >  arch/riscv/Kconfig                | 23 +++++++++++
> > > > >  arch/riscv/Makefile               |  2 +
> > > > >  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++++++++++++
> > > > >  3 files changed, 111 insertions(+)
> > > > > 
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > index 4c07b9189c86..8d7e475ca28d 100644
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > > > >  	  If you don't know what to do here, say Y.
> > > > > +config TOOLCHAIN_HAS_ZBA
> > > > > +	bool
> > > > > +	default y
> > > > > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> > > > > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> > > > > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > > > > +	depends on AS_HAS_OPTION_ARCH
> > > > > +
> > > > > +config RISCV_ISA_ZBA
> > > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > > +	depends on TOOLCHAIN_HAS_ZBA
> > > > > +	depends on MMU
> > > > > +	depends on RISCV_ALTERNATIVE
> > > > > +	default y
> > > > > +	help
> > > > > +	   Adds support to dynamically detect the presence of the ZBA
> > > > > +	   extension (basic bit manipulation) and enable its usage.
> > > > > +
> > > > > +	   The Zba extension provides instructions to accelerate a number
> > > > > +	   of bit-specific address creation operations.
> > > > > +
> > > > > +	   If you don't know what to do here, say Y.
> > > > > +
> > > > >  config TOOLCHAIN_HAS_ZBB
> > > > >  	bool
> > > > >  	default y
> > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > index 6ec6d52a4180..51fa3f67fc9a 100644
> > > > > --- a/arch/riscv/Makefile
> > > > > +++ b/arch/riscv/Makefile
> > > > > @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> > > > >  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> > > > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > > > >  riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
> > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
> > > > 
> > > > AFAICT, this is going to break immediately on any system that enables
> > > > RISCV_ISA_ZBA (which will happen by default) but does not support the
> > > > extension. You made the option depend on RISCV_ALTERNATIVE, but I do
> > > > not see any use of alternatives in the code to actually perform the
> > > > dynamic detection of Zba.
> > > 
> > > I guess we kind of have an ambiguity here: for stuff like C we just
> > > unconditionally use the instructions, but for the rest we probe first.  We
> > > should probably have three states for each extension: disabled, dynamically
> > > detected, and assumed.
> > 
> > You mean, just add some comments to the makefile surrounding each
> > section or to some rst documentation?
> 
> Also, the code here doesn't build w/
> 	warning: invalid argument to '-march': '_zba_zbb_zicsr_zifencei_zihintpause'
> so there's something else wrong with TOOLCHAIN_HAS_ZBA :)
It is odd that this is missing 'rv64ima' or 'rv32ima' at the beginning of
this string. What configuration are you using that could cause that to
be left off?

Compiling with defconfig automatically enables Zba and appears to not
cause this issue. I realized that I put the header definitions for
do_csum and csum_ipv6_magic in this patch instead of the next one so the
code will fail to compile from this but not due to march settings.
> 
> > 
> > > > Note that for fd & v, we add it to riscv-march-y, but then immediately
> > > > remove it again before passing to the compiler, only allow them in
> > > > AFLAGS:
> > > > 	# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> > > > 	# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
> > > > 	KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > > > 
> > > > What am I missing?
> > > 
> > > FD and V both have state that can be saved lazily, so we can't let arbitrary
> > > code use them.  The extensions formally known as B don't add state, so they
> > > are safe to flip on in arbitrary places (aside from the issues you pointed
> > > out above).
> > 
> > I probably went about this badly since you missed the point. I was
> > trying to point out that for anything other than the compressed
> > extensions in the block above that we only pass them in march to the
> > assembler, and not to the compiler, in contrast to this patch which just
> > always passes them. I should have pointed to how we handled the
> > in-kernel Zbb stuff & asked how this was any different, would probably
> > have been clearer.
> > 
I supposed it might be better if I submit these changes in a different
patch so we can have more discussion there. Zbb was previously only used
by assembly files (arch/riscv/lib/strcmp.S, arch/riscv/lib/strlen.S,
arch/riscv/lib/strncmp.S). I wanted to add them to the compiler so that
that C programs could leverage these extensions. However, I neglected to
consider machines that compile the kernel with these extensions but have
cores without these extensions. The purpose of using these extensions is
to save a couple of clock cycles, so if it is necessary to first
check if the extension is enabled it may not be worth it for these
functions.

> 
> 
> 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
