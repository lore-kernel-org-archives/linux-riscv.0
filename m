Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C349CC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNlHcPrLz+YsRirZj59OV9L/IkdWCLzDEiic7s9k+oo=; b=Hl7Ol2FmnFYiBE
	zD5MftBM9uuT5QJj4ACkRzcZRuY5S6Gtu9SqZlVEFqoO4rsezb81XI9NB3NRg9jDy7pOQ9Ayhf2oq
	/8uUqCGSo+N/L+hJRPEY5M6dx5F640ldfFooopiZ71tZf4T+KThswHM/xADDHQw/dnfe6LnJVd0D7
	kr3yeKDcbtWf/FgkbOLUkxoN9BBacihmXB3HBYAPSEPW1sGBksTRvQQnmRzdZ1SBzXZWHx7nCLemI
	B0uEXv3aJPGNuz0z1hOnn3ARe9Xx0GhPKp1biiw6mKUgb5iXDMVxseQHy+7ngz0YZFKuxJPOOxeYs
	3WPYFs6fPVhbNRZoL8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQmB-00EiVx-25;
	Thu, 04 Jan 2024 16:40:59 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQm8-00EiTH-0I
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 16:40:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso773785e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704386452; x=1704991252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2FqLd+7fSNFOVRetfmjHxaVxLnzYZGauh/919f31n4=;
        b=hanMmbDTTK1x1bpOHKI2ZK1fM9KHoUap0lLLS4Gdm4sVlmBrpM7RWptcYLYolUT5Wb
         pQ71UYDFX77/CbMFWRTGoomOLk/8QVjR/FD9B9rq0YhIDSc2RbEVIcuYtAutA1QChZyQ
         i+70t0itXOZGObvl7am3VDp4h4UQ84foN24y6THpBZcqaOcFSibf5Fv2pe9UWK/l6Q6e
         RpigmpGS21dpcTjOExKIIYnQlYFFtfj2dytUrlOSU1FfXreng6w7VRG8j6Tafatvlhti
         3nSA4C4ER2Ns06KLqDwK2CxAFt8FeVHiZtvSQsGNl+loJSZjqerOLU0r4DELrHWuEVgy
         V08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704386452; x=1704991252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2FqLd+7fSNFOVRetfmjHxaVxLnzYZGauh/919f31n4=;
        b=HUfa4xuDKoaeHIcLsBmyNahLjr421gyQlHma+Aypmi5fBo0/ho0ErnE+U0RzmJThPm
         fig8CVK/Ges4l3en2f+RxbFutMqZ/rOmtZaGOxhVtvjUvRYGSAVu+i8FWhZJuetMShq+
         lCLAXiTwVMZ/wu/Fsqj31eNojl6SnbbDNG8TlwpP0g+JBn3CQDafuY8+lT8GWXigLaJA
         BfXuQ6LHE8cdNGCJJ9G3W7T7s2rpTvzmoRG+xo4fxidGSNauOIyIUgwJogXIYorniqhl
         +OOsy5rpxgbwPGlv3NcmO+ZP8/NgaBoIidUAd2+zyee81QDcM71v8j8RN4h6GD9wk11W
         d8sQ==
X-Gm-Message-State: AOJu0YxJRSoGFfWVKuUsEotb2PNYXphtlFr14LxvC6pFxTteFd2yE139
	Ng8mWHHqExVoTIjywdumKDtLZb/xgHFo5A==
X-Google-Smtp-Source: AGHT+IGFO2UvTUj/ZscmTQoKmtFIQwFPXy9Y4BV7rHK7k8Pt7EyqdVTqewSUkncC86IP3RAOZJP0Rw==
X-Received: by 2002:ac2:5bdb:0:b0:50e:7a2d:6cd7 with SMTP id u27-20020ac25bdb000000b0050e7a2d6cd7mr473965lfn.55.1704386451954;
        Thu, 04 Jan 2024 08:40:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ez9-20020a056402450900b0055504002a5fsm13025509edb.72.2024.01.04.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 08:40:51 -0800 (PST)
Date: Thu, 4 Jan 2024 17:40:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction
 definitions & cpufeature
Message-ID: <20240104-d6981cf63a39af4dff1d380a@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <ZZWs0C19tz763FnH@LeoBras>
 <20240103-0c96ceea88523b7b946e4ba8@orel>
 <ZZXEpU-JzsvD2UDW@LeoBras>
 <20240104-4ecfb92d2f8c95fa773ca695@orel>
 <ZZbI3clKUbNbNtZj@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZbI3clKUbNbNtZj@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_084056_132516_6317F11E 
X-CRM114-Status: GOOD (  40.65  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, atishp@atishpatra.org, peterz@infradead.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, wuwei2016@iscas.ac.cn, palmer@dabbelt.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, guoren@kernel.org, linux-riscv@lists.infradead.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 04, 2024 at 12:03:57PM -0300, Leonardo Bras wrote:
...
> > > > > What we need here is something like:
> > > > > + enum {
> > > > > + 	PREFETCH_I,
> > > > > + 	PREFETCH_R,
> > > > > + 	PREFETCH_W,
> > > > > + }	 
> > > > 
> > > > Can't use enum. This header may be included in assembly.
> > > 
> > > Oh, I suggest defines then, since it's better to make it clear instead of 
> > > using 0, 1, 3.
> > 
> > I don't think we gain anything by adding another define in order to create
> > the instruction define. We have to review the number sooner or later. I'd
> > prefer we use the number inside the instruction define so we only need
> > to look one place, which is also consistent with how we use FUNC fields.
> > 
> 
> Sorry, I was unable to understand the reasoning.
> 
> If we are going to review the numbers sooner or later, would not it be 
> better to have the instruction define to have "PREFETCH_W" instead of a 
> number, and a unified list of defines for instructions.
> 
> This way we don't need to look into the code for 0's 1's and 3's, but 
> instead just replace the number in the define list.
> 
> What am I missing?  

PREFETCH_W isn't defined as just 3, it's defined as
   INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3), ...)

Adding a define (PREFETCH_W_RS2?) for the 3 just bloats the code and
requires reviewers of PREFETCH_W to go look up another define.
OPCODE_OP_IMM gets a define because it's used in multiple instructions,
but everything else in an instruction definition should be a number
exactly matching the spec, making it easy to review, or be an argument
passed into the instruction macro.

> 
> > > 
> > > > 
> > > > > +
> > > > > + #define CBO_PREFETCH(type, base, offset)                      \
> > > > > +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> > > > > +            SIMM12(offset & ~0x1f), RS1(base))
> > > > 
> > > > Yes. I suggested we mask offset as well, but ideally we'd detect a caller
> > > > using an offset with nonzero lower 5 bits at compile time.
> > > 
> > > I would suggest the compiler would take care of this, but I am not sure 
> > > about the assembly, since I am not sure if it gets any optimization.
> > > 
> > > I don't think we can detect a caller with non-zero offset at compile time, 
> > > since it will be used in locks which can be at (potentially) any place in 
> > > the block size. (if you have any idea though, please let me know :) )

I forgot to reply to this before. The reason I think it may be possible to
validate offset at compile time is because it must be a constant, i.e.
__builtin_constant_p(offset) must return true. So maybe something like

 static_assert(__builtin_constant_p(offset) && !(offset & 0x1f))

I'll try to find time to play with it.

> > > 
> > > On the other hand, we could create a S-Type macro which deliberately 
> > > ignores imm[4:0], like  
> > > 
> > > + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> > > +                 SIMM12(offset), RS1(base))
> > > 
> > > Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> > > imm[4:0], like
> > > 
> > > +#define DEFINE_INSN_S                                                    \
> > > + __DEFINE_ASM_GPR_NUMS                                           \
> > > +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> > > +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> > > +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> > > +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > > +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > > +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > > +"        .endm\n"
> > > +
> > > 
> > > Does this make sense?
> > 
> > If we create a special version of INSN_S, then I suggest we create one
> > where its two SIMM fields are independent and then define prefetch
> > instructions like this
> > 
> >  #define PREFETCH_W(base, offset) \
> >      INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
> >          SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))
> > 
> > which would allow simple review against the spec and potentially
> > support other instructions which use hard coded values in the
> > immediate fields.
> > 
> 
> I agree, it looks better this way.
> 
> We could have:
> INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2, SIMM_11_5, SIMM_4_0)
> 
> and implement INSN_S like:
> #define INSN_S(OPCODE, FUNC3, RS1, RS2, SIMM_11_0) \
> 	INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2,  \
> 		SIMM_11_0 >> 5, SIMM_11_0 & 0x1f)

That won't work since SIMM_11_0 will be a string. Actually, with
stringification in mind, I don't think defining INSN_S_SPLIT_IMM()
is a good idea.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
