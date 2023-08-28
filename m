Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE0C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G24IN2wgO5PXl+9/yrGWecDUzOdHFCkQmyTIfwBYw/s=; b=dzckA7Uqmh8CVd
	JuW6o9hqEc8J5ub7uYpv9qTyG1sawGKMT7Rt4m8kiZGddOMHwy2+mCZlv+KPYl/k+QA5h+p+MkxLU
	vES4wkpnf5lHtOnv6NGCbohvhwoTCafuCxMg+Kty7wHQNlFSmnHegKUhbRA5iwIsQJbQgVnTVszba
	lXeiMbUTMbg/ySVPFV4bntWStcUUD//JIPu6OrSUCudC4rKTJ2VN+4hj7ss/nOBEAs3Go8J+7U1Qh
	VBDbfIpwLG0Qv1oZDJKNwaWKrtcGnGJ5nPKDxuP1U6LQzkByB5DsHDLYNNy3NTq92gizi41hanvne
	a1VCpPVsJW7qJ+h2rr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qagr3-00A4Mq-10;
	Mon, 28 Aug 2023 18:20:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qagqz-00A4MF-17
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 18:20:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68c0d262933so2002174b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693246843; x=1693851643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FN5cReRcE/IqZFfedM5lG8adhDURm6Zmxuc1ut1q7kk=;
        b=WeAqtd1ntNS0YgTuYZvuwkU6ZM/B/cG/JTeGYaHbuwa0edGOkauQbjP9QUfPvy4HfV
         V/dqiEUmTwtNGzDHpMLZfIfMKUuvWcBXOpPYUQXJScPwiKH5J2vjubVyl429W6rsHOlg
         7grzBQjC/I1RSDdlZ8OR3H9Wfiuwp58UNWUe1N7PghhbLznb8OY8i3kA7um87TT5WD65
         nSmShNf71KD8ueXVatdu9MqAK5eny/zPGYWLSsOzFt7YNsZ3NizZdDLnoWwkmwJiGX4u
         bt281fUeocyL5evTiyh3ngIgkF02EH7ttH9l6H5s3i901Y7wEy2KrcN0Sz4biRp/5N05
         EhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246843; x=1693851643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN5cReRcE/IqZFfedM5lG8adhDURm6Zmxuc1ut1q7kk=;
        b=k3bY3LC+BmBi9WWIzkG7yfr3P8zKRgnEsHz7TsPGN5sgOBb32KMIfe604yjlLQALlF
         805dlqDjIL/1WOQKmh2Dl9YhDHVpRaJHpa2FOrNgkAoZZezkww+cKPncfxC94q42aGVc
         /sC3NQSptNESB4Lhh+CCJH/DQBvwnPNNVXgJv7cN9uQKv/s4fsozFM63eqVr/HXF1ne1
         2ZbGl2dDFREEQNC1uf/Gfh9TCEkxs2gnVwurNueQ5nny2xnixlaAKcR6ODBqgqkT9stB
         +TFlfNJ53St4SJrgXKGhEj5BuSkJ9dRMFAkKU7K1U98F3lKY0IsHaIRGk43lR3xozk4+
         +mWA==
X-Gm-Message-State: AOJu0YyI0WA9Kyv18TP0URAno7+rrp3NRikawSOq+XaKyDm0U1iw6QFd
	BxQHrv5tv8odDkvCQ935CoknWw==
X-Google-Smtp-Source: AGHT+IEBimujj4zlefxpuPomvv7iKDMVCw90Uhnkx9mm6W0jEamQc5Z5CAG92cyNacoMQoOSbNKXGw==
X-Received: by 2002:a05:6a00:1a4e:b0:68a:553a:c0da with SMTP id h14-20020a056a001a4e00b0068a553ac0damr20938442pfv.24.1693246842918;
        Mon, 28 Aug 2023 11:20:42 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1499:9915:c376:361b])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79117000000b00686ec858fb0sm6887959pfh.190.2023.08.28.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:20:42 -0700 (PDT)
Date: Mon, 28 Aug 2023 11:20:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <ZOzld28wZjLpl4Hp@ghost>
References: <20230827-turf-parched-b965bc697882@spud>
 <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
 <20230827-primer-conceal-b6f24b29e692@spud>
 <20230827-divisive-happy-cf93058c49bf@spud>
 <ZOzRlerSNjfzMYGH@ghost>
 <20230828-deserve-paging-25666290e312@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230828-deserve-paging-25666290e312@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_112045_598272_4A32662F 
X-CRM114-Status: GOOD (  70.15  )
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

On Mon, Aug 28, 2023 at 06:08:40PM +0100, Conor Dooley wrote:
> On Mon, Aug 28, 2023 at 09:55:49AM -0700, Charlie Jenkins wrote:
> > On Sun, Aug 27, 2023 at 01:25:27PM +0100, Conor Dooley wrote:
> > > On Sun, Aug 27, 2023 at 11:28:33AM +0100, Conor Dooley wrote:
> > > > On Sat, Aug 26, 2023 at 07:00:47PM -0700, Palmer Dabbelt wrote:
> > > > > On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> > > > > > On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> > > > > > > Provide checksum algorithms that have been designed to leverage riscv
> > > > > > > instructions such as rotate. In 64-bit, can take advantage of the larger
> > > > > > > register to avoid some overflow checking.
> > > > > > > 
> > > > > > > Add configuration for Zba extension and add march for Zba and Zbb.
> > > > > > > 
> > > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > > > ---
> > > > > > >  arch/riscv/Kconfig                | 23 +++++++++++
> > > > > > >  arch/riscv/Makefile               |  2 +
> > > > > > >  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++++++++++++
> > > > > > >  3 files changed, 111 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > > > index 4c07b9189c86..8d7e475ca28d 100644
> > > > > > > --- a/arch/riscv/Kconfig
> > > > > > > +++ b/arch/riscv/Kconfig
> > > > > > > @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > > > > > >  	  If you don't know what to do here, say Y.
> > > > > > > +config TOOLCHAIN_HAS_ZBA
> > > > > > > +	bool
> > > > > > > +	default y
> > > > > > > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> > > > > > > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> > > > > > > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > > > > > > +	depends on AS_HAS_OPTION_ARCH
> > > > > > > +
> > > > > > > +config RISCV_ISA_ZBA
> > > > > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > > > > +	depends on TOOLCHAIN_HAS_ZBA
> > > > > > > +	depends on MMU
> > > > > > > +	depends on RISCV_ALTERNATIVE
> > > > > > > +	default y
> > > > > > > +	help
> > > > > > > +	   Adds support to dynamically detect the presence of the ZBA
> > > > > > > +	   extension (basic bit manipulation) and enable its usage.
> > > > > > > +
> > > > > > > +	   The Zba extension provides instructions to accelerate a number
> > > > > > > +	   of bit-specific address creation operations.
> > > > > > > +
> > > > > > > +	   If you don't know what to do here, say Y.
> > > > > > > +
> > > > > > >  config TOOLCHAIN_HAS_ZBB
> > > > > > >  	bool
> > > > > > >  	default y
> > > > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > > > index 6ec6d52a4180..51fa3f67fc9a 100644
> > > > > > > --- a/arch/riscv/Makefile
> > > > > > > +++ b/arch/riscv/Makefile
> > > > > > > @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> > > > > > >  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> > > > > > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > > > > > >  riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> > > > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
> > > > > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
> > > > > > 
> > > > > > AFAICT, this is going to break immediately on any system that enables
> > > > > > RISCV_ISA_ZBA (which will happen by default) but does not support the
> > > > > > extension. You made the option depend on RISCV_ALTERNATIVE, but I do
> > > > > > not see any use of alternatives in the code to actually perform the
> > > > > > dynamic detection of Zba.
> > > > > 
> > > > > I guess we kind of have an ambiguity here: for stuff like C we just
> > > > > unconditionally use the instructions, but for the rest we probe first.  We
> > > > > should probably have three states for each extension: disabled, dynamically
> > > > > detected, and assumed.
> > > > 
> > > > You mean, just add some comments to the makefile surrounding each
> > > > section or to some rst documentation?
> > > 
> > > Also, the code here doesn't build w/
> > > 	warning: invalid argument to '-march': '_zba_zbb_zicsr_zifencei_zihintpause'
> > > so there's something else wrong with TOOLCHAIN_HAS_ZBA :)
> > It is odd that this is missing 'rv64ima' or 'rv32ima' at the beginning of
> > this string. What configuration are you using that could cause that to
> > be left off?
> 
> I don't know, but that configuration is pretty pervasive. The patchwork
> CI blew up too & that is using kernel.org toolchains built by Arnd:
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
> 
> > Compiling with defconfig automatically enables Zba and appears to not
> > cause this issue. I realized that I put the header definitions for
> > do_csum and csum_ipv6_magic in this patch instead of the next one so the
> > code will fail to compile from this but not due to march settings.
> > > 
> > > > 
> > > > > > Note that for fd & v, we add it to riscv-march-y, but then immediately
> > > > > > remove it again before passing to the compiler, only allow them in
> > > > > > AFLAGS:
> > > > > > 	# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> > > > > > 	# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
> > > > > > 	KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > > > > > 
> > > > > > What am I missing?
> > > > > 
> > > > > FD and V both have state that can be saved lazily, so we can't let arbitrary
> > > > > code use them.  The extensions formally known as B don't add state, so they
> > > > > are safe to flip on in arbitrary places (aside from the issues you pointed
> > > > > out above).
> > > > 
> > > > I probably went about this badly since you missed the point. I was
> > > > trying to point out that for anything other than the compressed
> > > > extensions in the block above that we only pass them in march to the
> > > > assembler, and not to the compiler, in contrast to this patch which just
> > > > always passes them. I should have pointed to how we handled the
> > > > in-kernel Zbb stuff & asked how this was any different, would probably
> > > > have been clearer.
> > > > 
> > I supposed it might be better if I submit these changes in a different
> > patch so we can have more discussion there. Zbb was previously only used
> > by assembly files (arch/riscv/lib/strcmp.S, arch/riscv/lib/strlen.S,
> > arch/riscv/lib/strncmp.S). I wanted to add them to the compiler so that
> > that C programs could leverage these extensions. However, I neglected to
> > consider machines that compile the kernel with these extensions but have
> > cores without these extensions.
> 
> Less so cores, since we don't support heterogeneous stuff, and moreso
> platforms that do not support the extensions. It's expected that the
> same kernel could in theory be used across a wide variety of systems.
> 
> > The purpose of using these extensions is
> > to save a couple of clock cycles, so if it is necessary to first
> > check if the extension is enabled it may not be worth it for these
> > functions.
> 
> That's still possible, it's what the alternatives mechanism exists for.
> During boot the codepaths are patched to use what works for a given
> machine, check out the code that makes use of Zbb or
> riscv_has_extension_[un]likely(). You'd need to do something like the
> existing users of Zbb instructions does, with an alternative used to
> avoid the custom asm implementations when the hardware does not support
> them. (That's what the CONFIG_ALTERNATIVE & CONFIG_AS_HAS_OPTION_ARCH
> options you made the TOOLCHAIN_HAS_ZBA depend on are for).

I can see how to get this to work if I port this code into assembly and
write two different versions (one with Zbb and one without), but
I don't see how this would work in C. Unless I am mistaken, there would
need to be some sort of wrapper around the C code that told the compiler
to compile it multiple times for different extension combinations and
then use the riscv_has_extension_[un]likely() functions to determine
which version to use at runtime. Is this feasible?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
