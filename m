Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D27C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZ0U5H12mTgxQDRFsEcWWnumzO0/7LHR5s3bPWiQvV4=; b=dEyW1LSa5q4u0T
	qXgUkrGotX0im3hCYagBn/lg2f2ItwykNS8iFyo5YVthCvV9hLonLj3izQFvrsd9Kh+HLcb6/l69i
	Mdd1wpZpIaCzwmp7y4GFd+L8XQZmJ6GHFFUPsq+pYI4ITXbydcgbQ9akRzkHjR6z2XK7zLQiZgMAt
	wHvU0CJJDTkgnPJc5/hg3lTVnbRQEpi5sR9yNFaoDSlluoKwM6/eRM8I2zQVtGxznXRApA5ZueBns
	0VX3eC2WKe9r439WANfA/4ivMxymjH3RAIHkNnMOdPSZ7e1JWw8NGExLgSz7RpL9TjFfftQzS2WlF
	yGFQVgfFKz2eDHyz2W4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tux9t-00000009hCQ-0CJZ;
	Wed, 19 Mar 2025 17:24:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tux9p-00000009hBL-3pkZ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 17:24:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22359001f1aso32164505ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742405085; x=1743009885; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ovtjsc/ngsMtbRru+3v3f/ts46HtxiqzAUDsNuQW/M=;
        b=k699obz+THDqXGTZYzNBGGuuQklNKGu6IksLcPorX0OTizgZ+C5h9PZ6/FG5czNp+Y
         EavKT73z4EE95rovbXlni8ED/GBlWngWyeh4pVlUio3oThhGvYNO2VVqe03c+UiakwXK
         DE+z69pXcXeoGkfzt21mrFsH4KzBUOsQaI6ab+nu99b5Jhzsj/Shw/kZMluV9Sm1sk/A
         RiFsp0dNG0+IKJ99MUC1acmenAn0i+/j4+KEkpk+lHlBz0a1Brk+XTVpWBdQqZw9593e
         XBpWQ/90XhvQkdSDo0y262/ji75YL0gcaJgBCdt/kkkxRkao+OMXjQhb9Cb/utb5DhkF
         Godg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405085; x=1743009885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ovtjsc/ngsMtbRru+3v3f/ts46HtxiqzAUDsNuQW/M=;
        b=qDA6lD1nb9wVkOQ+oHdHzrBZPur1LnFuupVLQrg2Oah49ZlgPCy2Cp6TugmHWcrWz5
         e/Q1mO5O9E07PSgXnOXx9oZqiXvdulPUpyGAHRqXWx7BhRHIAu/0MBalas3jPF92rqOH
         /AYV3rZkX9HPbyRsxVNZKszCoI5d21govhaLtSf+1MySDCVEJ2jci4cx/36PRqmLTzTt
         YoKQFjrYOIInUlmMgA9+V60C4NZxWiCAG7uHftHb5b76HygOeW0eTIWIXDqjFXgw1tBS
         65w9XMKSx0Bq0KgZFa+GlLSl6SSQxDKGFnIJZFzo5G3abyPVohExpmNnFtJjuxBUTUUl
         dTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhDpbmQXvzN+grCBZokw0piOkQMfFuer0651F8x4hcgpsjNNdLcIXHx01P+CT8DGP1zvmePETHakRHgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYX0Ofr8WaCm14f/Cm2VqbwSvStb0pXPMmLALDTCtNwzRgtfwi
	NBUxool2gGLhawDt8mzpPx/Qc4bwmwpnPjha0u3LAfKhC5zgNYNXT6B1hUdkO94=
X-Gm-Gg: ASbGnctDYs74a3LZ8Ms4ORvDAP9hKMWdEmVr1OMj/nkc0Bc14q9NtLZa5hfqpdqYBTZ
	bTvCkraoCfiW640vWL2bbdc/tjLHh+o9fhYsXN4q18gYyUunaSV2SxG5l71dLbOx75dCqysdgmD
	V2ERz09+I3bZLkRddpSDOFeK8s17ywSNmO4mjTt/QkfFzGLI7JfZlnxQR8xgldk6I6rouZ2ejpW
	DdO+fxyYssbPWbFg2WYJL0KC8j+h/s3HaRixjYRdzqVc5ApDRV8Ujki48au5HZaGKNo1iCSwdN+
	dtI9eW4rpUPPpDRn0cxWF0PxiVFw1jIOUYUZPD7R
X-Google-Smtp-Source: AGHT+IGGukMmGzrRkcCLcnDVIfPfEcGzaPbBFEMioj9IaaorGdbf4I/BJxhdPW8WI0glghzqTFGz+Q==
X-Received: by 2002:a17:903:41ce:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22649caaa83mr46300995ad.51.1742405085227;
        Wed, 19 Mar 2025 10:24:45 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:4763:97aa:9309:154a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888562sm117615825ad.2.2025.03.19.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 10:24:44 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:24:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] riscv: Move nop definition to insn-def.h
Message-ID: <Z9r92tCdsjoJTQ88@ghost>
References: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com>
 <20250318-runtime_const_riscv-v9-1-ddd3534d3e8e@rivosinc.com>
 <20250319-3bf29b05bf02bfdaa32b261c@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-3bf29b05bf02bfdaa32b261c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_102446_149851_26584A13 
X-CRM114-Status: GOOD (  30.65  )
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

On Wed, Mar 19, 2025 at 04:27:39PM +0100, Andrew Jones wrote:
> On Tue, Mar 18, 2025 at 05:38:45PM -0700, Charlie Jenkins wrote:
> > We have duplicated the definition of the nop instruction in ftrace.h and
> > in jump_label.c. Move this definition into the generic file insn-def.h
> > so that they can share the definition with each other and with future
> > files.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/ftrace.h   | 1 -
> >  arch/riscv/include/asm/insn-def.h | 2 ++
> >  arch/riscv/kernel/ftrace.c        | 6 +++---
> >  arch/riscv/kernel/jump_label.c    | 4 ++--
> >  4 files changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> > index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..b7f361a50f6445d02a0d88eef5547ee27c1fb52e 100644
> > --- a/arch/riscv/include/asm/ftrace.h
> > +++ b/arch/riscv/include/asm/ftrace.h
> > @@ -79,7 +79,6 @@ struct dyn_arch_ftrace {
> >  #define AUIPC_RA		(0x00000097)
> >  #define JALR_T0			(0x000282e7)
> >  #define AUIPC_T0		(0x00000297)
> > -#define NOP4			(0x00000013)
> >  
> >  #define to_jalr_t0(offset)						\
> >  	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index 9a913010cdd93cdfdd93f467e7880e20cce0dd2b..0a1fc5134f29da190554c59f8cee3b5374c9aa2d 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -200,4 +200,6 @@
> >  #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
> >  #define ZAWRS_WRS_STO	".4byte 0x01d00073"
> >  
> > +#define RISCV_INSN_NOP4	0x00000013U
> 
> This should be _AC(0x00000013, U), but since this is the first of its kind
> (all other defines are of the form ".4byte ..." -- either explicitly, like
> the ones above, or through the INSN_* macros), then it feels like it
> either doesn't belong here at all or that we should provide it and a
> ".4byte ..." version.

Sure, I don't have a strong opinion about this. I was debating adding
the .4byte version also but decided against it because it isn't being
used yet, I will add it.

- Charlie

> 
> Thanks,
> drew
> 
> > +
> >  #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> > index 3524db5e4fa014a4594465f849d898a030bfb7b8..674dcdfae7a149c339f1e791adb450535f22991b 100644
> > --- a/arch/riscv/kernel/ftrace.c
> > +++ b/arch/riscv/kernel/ftrace.c
> > @@ -36,7 +36,7 @@ static int ftrace_check_current_call(unsigned long hook_pos,
> >  				     unsigned int *expected)
> >  {
> >  	unsigned int replaced[2];
> > -	unsigned int nops[2] = {NOP4, NOP4};
> > +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
> >  
> >  	/* we expect nops at the hook position */
> >  	if (!expected)
> > @@ -68,7 +68,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
> >  				bool enable, bool ra)
> >  {
> >  	unsigned int call[2];
> > -	unsigned int nops[2] = {NOP4, NOP4};
> > +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
> >  
> >  	if (ra)
> >  		make_call_ra(hook_pos, target, call);
> > @@ -97,7 +97,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
> >  		    unsigned long addr)
> >  {
> > -	unsigned int nops[2] = {NOP4, NOP4};
> > +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
> >  
> >  	if (patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
> >  		return -EPERM;
> > diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> > index 654ed159c830b3d5e34ac58bf367107066eb73a1..b4c1a6a3fbd28533552036194f27ed206bea305d 100644
> > --- a/arch/riscv/kernel/jump_label.c
> > +++ b/arch/riscv/kernel/jump_label.c
> > @@ -11,8 +11,8 @@
> >  #include <asm/bug.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/text-patching.h>
> > +#include <asm/insn-def.h>
> >  
> > -#define RISCV_INSN_NOP 0x00000013U
> >  #define RISCV_INSN_JAL 0x0000006fU
> >  
> >  bool arch_jump_label_transform_queue(struct jump_entry *entry,
> > @@ -33,7 +33,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
> >  			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
> >  			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
> >  	} else {
> > -		insn = RISCV_INSN_NOP;
> > +		insn = RISCV_INSN_NOP4;
> >  	}
> >  
> >  	if (early_boot_irqs_disabled) {
> > 
> > -- 
> > 2.43.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
