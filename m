Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4885BC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HI5dAJP/raVTck5w1ktrPgU+8A9CCLeJ9rfouDnJWIQ=; b=jYPq7WMMsf8n+x
	TeiUClitU2IzLeY8zpGYiXZ+qZNNEXLLkeZiV5RvFNFQDabEpZYhgobnBqSR865/cMoDCr8Ed20Yn
	4pwIbaTHfkBI+d9oReKagFNKblMOJu0R0NjfcKCoY6dWWKkQaKk9E0IQVjuVosKoEAQNp6TAurOMI
	kY0kdpVMJnqzkhGdxlhfxGkzIdK8LYv9VSXyMVztEenR7wLaM3M4ZCWx4qvfngJXMEeh+sJLXYBNo
	m4w8kSQ4z6q45E3b/YoHc5x064Sciz42xjv5v5M+8NIBa60jSLui+NHutlc6pySApLBU26liiYz/f
	wKFpjtOxHoyPeWvj9wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sLF-0000000G4Fy-0Ial;
	Tue, 14 May 2024 13:37:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sLC-0000000G4DS-0fVQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 13:37:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a59ae3efbb3so18524666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715693824; x=1716298624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cx8eGFgWusFqzKnU2m9G7FMZaETmak6wJbi8q40vVg=;
        b=JUGlRd2yD8UUcvgWUxYAtngSGF4XHB/rAd7FfZDFKOS0WSc79aWI19VyBPIN7Uy87c
         AAQlmd0CrFVQfe0U76gNSKEhhQdUfJxmdkzvWyKmTbsBoZfvZy6Fcm8YPg5iHPf/pXuW
         dVtV0WA+4ixLlrW279m2GlxND3Njx9JYhruXqBxhT878DF8L1lSDjbalPr0VLioCU5UL
         KIBHqOG6a2+Ngjn3KiU5cybR1fCjPHc1o3b1R9oJ0/8WUS5gD0bOT6KZEUBkh3YowmeG
         F8/kAFv2PofrFHBndMiau8LQ3YJscHKOyZOktzaIsRqJPs0ol46tcNewAPmXmga0sAqN
         mnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693824; x=1716298624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cx8eGFgWusFqzKnU2m9G7FMZaETmak6wJbi8q40vVg=;
        b=HuhUMzcO4PdF9v6Pvo2nwPKoesNl2odybuyITY7SZH0aV58CFDc0/vrwG94e2rPWoK
         gsuTbCLGnjMz0cMWO+jfMpXPdF8+vq1cgkw457c2FzsNILHM896Pk6L6WXncL4Yd00/B
         VaxqdxsPGsZ90s3cVtDH3QdAZZC+OHrLc4phJT9VHfwPGu8Z6cHhwfuY5VL6Hrx0RqpS
         Jrc4q5CpqdIyY1xXvVLAfeHf2j3pYNmrZX4m+/J18sBBg3KJKEkUSYSnHEgK27XurRLf
         cLc4qgRfWAJU9sVclw2bnYrFObKfHCW45AHqcR43rog8OVATLxg2rouymtGqmE44QJRG
         9nNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7WlwP4q7lBTFSy9F0u2/c6GFZWY0HWVLNpyc1R9lAvxC7ztHVuk/+TE+2DsLGT2/NvMmjhWTmseQtpm2dkqRgKIvzIo6FtKHd9p9qWKft
X-Gm-Message-State: AOJu0YwSMEWDdNS+2Sx5qAqqCkh7QWaSgCEWcVvc6TIybG1OkQKd0Ze8
	fKzbeMtrsAzqBoh2GRkypGHkeYX8unYKqCE6m2VDSPeC754qfmlpTc0Sx1hf/Zo=
X-Google-Smtp-Source: AGHT+IEG34t1nBcoasxIfz0onNp1LM/pKZDSI+MHo8bRyXMguGfrUzwtpC0PIzhm4BplctJR8CpzvQ==
X-Received: by 2002:a50:935b:0:b0:574:ecec:1887 with SMTP id 4fb4d7f45d1cf-574ecec19camr187645a12.32.1715693823501;
        Tue, 14 May 2024 06:37:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bebb6d5sm7523102a12.34.2024.05.14.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:37:03 -0700 (PDT)
Date: Tue, 14 May 2024 15:37:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"luke.r.nels@gmail.com" <luke.r.nels@gmail.com>, "xi.wang@gmail.com" <xi.wang@gmail.com>, 
	"bjorn@kernel.org" <bjorn@kernel.org>, "ast@kernel.org" <ast@kernel.org>, 
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@google.com" <sdf@google.com>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "pulehui@huawei.com" <pulehui@huawei.com>, 
	"Li, Haicheng" <haicheng.li@intel.com>, "conor@kernel.org" <conor@kernel.org>, 
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Message-ID: <20240514-944dec90b2c531d8b6c783f7@orel>
References: <20240511023436.3282285-1-xiao.w.wang@intel.com>
 <20240513-5c6f04fb4a29963c63d09aa2@orel>
 <DM8PR11MB575179A3EB8D056B3EEECA74B8E32@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB575179A3EB8D056B3EEECA74B8E32@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_063714_247646_55C74726 
X-CRM114-Status: GOOD (  28.33  )
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

On Tue, May 14, 2024 at 07:36:04AM GMT, Wang, Xiao W wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Tuesday, May 14, 2024 12:53 AM
> > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; luke.r.nels@gmail.com; xi.wang@gmail.com;
> > bjorn@kernel.org; ast@kernel.org; daniel@iogearbox.net; andrii@kernel.org;
> > martin.lau@linux.dev; eddyz87@gmail.com; song@kernel.org;
> > yonghong.song@linux.dev; john.fastabend@gmail.com; kpsingh@kernel.org;
> > sdf@google.com; haoluo@google.com; jolsa@kernel.org; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
> > pulehui@huawei.com; Li, Haicheng <haicheng.li@intel.com>;
> > conor@kernel.org
> > Subject: Re: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
> > 
> > On Sat, May 11, 2024 at 10:34:36AM GMT, Xiao Wang wrote:
> > > The Zba extension provides add.uw insn which can be used to implement
> > > zext.w with rs2 set as ZERO.
> > >
> > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > ---
> > > v2:
> > > * Add Zba description in the Kconfig. (Lehui)
> > > * Reword the Kconfig help message to make it clearer. (Conor)
> > > ---
> > >  arch/riscv/Kconfig       | 22 ++++++++++++++++++++++
> > >  arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
> > >  2 files changed, 40 insertions(+)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 6bec1bce6586..e262a8668b41 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
> > >  	  preemption. Enabling this config will result in higher memory
> > >  	  consumption due to the allocation of per-task's kernel Vector
> > context.
> > >
> > > +config TOOLCHAIN_HAS_ZBA
> > > +	bool
> > > +	default y
> > > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> > > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> > > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > > +	depends on AS_HAS_OPTION_ARCH
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >  	bool
> > >  	default y
> > > @@ -601,6 +609,20 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
> > >  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
> > >  	depends on AS_HAS_OPTION_ARCH
> > >
> > > +config RISCV_ISA_ZBA
> > > +	bool "Zba extension support for bit manipulation instructions"
> > > +	depends on TOOLCHAIN_HAS_ZBA
> > 
> > We handcraft the instruction, so why do we need toolchain support?
> 
> Good point, we don't need toolchain support for this bpf jit case.
> 
> > 
> > > +	depends on RISCV_ALTERNATIVE
> > 
> > Also, while riscv_has_extension_likely() will be accelerated with
> > RISCV_ALTERNATIVE, it's not required.
> 
> Agree, it's not required. For this bpf jit case, we should drop these two dependencies.
> 
> BTW, Zbb is used in bpf jit, the usage there also doesn't depend on toolchain and
> RISCV_ALTERNATIVE, but the Kconfig for RISCV_ISA_ZBB has forced the dependencies
> due to Zbb assembly programming elsewhere.
> Maybe we could just dynamically check the existence of RISCV_ISA_ZB* before jit code
> emission? or introduce new config options for bpf jit? I prefer the first method and
> welcome any comments.

My preferences is to remove as much of the TOOLCHAIN_HAS_ stuff as
possible. We should audit the extensions which have them to see if
they're really necessary. I don't mind depending on RISCV_ALTERNATIVE,
since it's almost required for riscv at this point anyway.

Thanks,
drew

> 
> Thanks,
> Xiao
> 
> [...]
> > >  {
> > > +	if (rvzba_enabled()) {
> > > +		emit(rvzba_zextw(rd, rs), ctx);
> > > +		return;
> > > +	}
> > > +
> > >  	emit_slli(rd, rs, 32, ctx);
> > >  	emit_srli(rd, rd, 32, ctx);
> > >  }
> > > --
> > > 2.25.1
> > >
> > 
> > Thanks,
> > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
