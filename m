Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225DDEE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3X2K1LmHq2usRAy/V3N/Lkfe4gR/rERSdGuOQWPFF8=; b=LqyURaYjJnJ3sg
	0l+zB0eG8my6WUJSGMulKPPr+UaEM6Qe1XmLGdviOCyobC2h7LDSRGu4ZUDuFL/3WNCeb3oRVonIW
	/aouQlKDN+AOBmUAP3x0o2LyzMEKdJ/y8amlAXJ48W1gn23T6/KuvetSzSbl8G4UTiEKCo04V+cUj
	L272+tBT3zIskLRWbl1ONPOnbkHQxf9drF8v/gpdZxA4yyeCrX5/udJEN1+S/x8guwMlwsTSRuiSq
	lkUS1bR/fOnRzo/BwSj05yE0BDXzCucfuj/Ry7QqonMcIeGuf9VJpSaFdheAO8wbaFr8pSg7Lf2il
	vr6ORcl8XEIqj82tf6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6fu-00Ad1n-27;
	Fri, 15 Sep 2023 11:07:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6fr-00Aczr-26
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 11:07:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so2396631a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694776061; x=1695380861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSTaAUWNZeJ+ndvekCOCXTKsKtVD+1FflqQrKtE2spY=;
        b=SpB12i+tDxITectI5fos+wDRUxrwYLjN6NbkdfFYx0veEbh3e1WjAvGQVDmrK/S4ux
         +PrPqz7f4m89UI5HXjQc95cp7+GXxvi6Yx2XNyhUdbf8ZY5pQBsZEfByHSo05aktbWe0
         pAMz+hAbw9bxe40/B4sIA9qEeysISJgqpAUm+CkjWkuxxAni0R+GKnPw9HtLsiRFAYpT
         ixyqMb5TJw5ecYucUeKTl5HJtpiXxSj/NkiL0WI9Rioa7jeDUwlNUO9W0V77qmujey/p
         WfIelkTiv4xqoeULWsiM5Pth+PDsgzZ18RiK3Dh2Dp2AOU8S4zqIWQmEVMXTxQbXChfb
         63iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694776061; x=1695380861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSTaAUWNZeJ+ndvekCOCXTKsKtVD+1FflqQrKtE2spY=;
        b=l9pAhHBZgFfxLxcWTb40Fnv9xDMgqU3a91XyAAeUYhLRu251PmCwIemLPefRj93thP
         dFsBppzRSiMZIy1S/njCjrnweXw5uKmVQkSFGE5d314ODyDZc3bvmdsmdigg1vAAWWHB
         mGH5rZJShYVU0b1V+5vl0g4vSFdUsjoaoC+PNFPuA9dS1WjG4AxPJIlLX+0XJLNOE33b
         ajM7Ref3MEAb9TcPpUlIJI26hoSv1ZTIbMN1jo7a8+YRBitypMy5sUFMPDCUR42efUFB
         FtcSKoJh5Jt59tsP6W2bmjgYL2XVCzKUHUu0iB9j2LsxVtQe8c2Z+oz6lVPdeXjo0qNr
         Wpnw==
X-Gm-Message-State: AOJu0Yx4iBC3v2Ja/K7OLgQ9IRqYxUbLUnmMaomwnyMQEwD4PUt0oZbD
	oLO5Yzce1eN9uwnH19oBlwRNuQ==
X-Google-Smtp-Source: AGHT+IGiV2IqFyocnUwP0Im2AbML69a4y/CuwGmjKXzDT8nO6Dk8Ye+9+SetD4JmUqgKSsACAavsSQ==
X-Received: by 2002:aa7:c2cb:0:b0:523:33d7:e324 with SMTP id m11-20020aa7c2cb000000b0052333d7e324mr1234271edp.38.1694776061469;
        Fri, 15 Sep 2023 04:07:41 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z10-20020aa7c64a000000b0052c11951f4asm2075997edr.82.2023.09.15.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 04:07:40 -0700 (PDT)
Date: Fri, 15 Sep 2023 13:07:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-85238ac7734cf543bff3ddad@orel>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-1ce4f391a14e56b456d88188@orel>
 <ZQQUQjOaAIc95GXP@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQQUQjOaAIc95GXP@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_040747_688851_C9A3C2F2 
X-CRM114-Status: GOOD (  29.70  )
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

On Fri, Sep 15, 2023 at 05:22:26AM -0300, Leonardo Bras wrote:
> On Thu, Sep 14, 2023 at 03:47:59PM +0200, Andrew Jones wrote:
> > On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
...
> > > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > > index 6960beb75f32..dc590d331894 100644
> > > --- a/arch/riscv/include/asm/insn-def.h
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -134,6 +134,7 @@
> > >  
> > >  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> > >  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> > > +#define RV_OPCODE_PREFETCH	RV_OPCODE(19)
> > 
> > This should be named RV_OPCODE_OP_IMM and be placed in
> > numerical order with the others, i.e. above SYSTEM.
> > 
> > >  
> > >  #define HFENCE_VVMA(vaddr, asid)				\
> > >  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17),		\
> > > @@ -196,4 +197,8 @@
> > >  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> > >  	       RS1(base), SIMM12(4))
> > >  
> > > +#define CBO_prefetchw(base)					\
> > 
> > Please name this 'PREFETCH_w' and it should take an immediate parameter,
> > even if we intend to pass 0 for it.
> 
> It makes sense.
> 
> The mnemonic in the previously mentioned documentation is:
> 
> prefetch.w offset(base)
> 
> So yeah, makes sense to have both offset and base as parameters for 
> CBO_prefetchw (or PREFETCH_w, I have no strong preference).

I have a strong preference :-)

PREFETCH_w is consistent with the naming we already have for e.g.
cbo.clean, which is CBO_clean. The instruction we're picking a name
for now is prefetch.w, not cbo.prefetchw.

> 
> > 
> > > +	INSN_R(OPCODE_PREFETCH, FUNC3(6), FUNC7(0),		\
> > > +	       RD(x0), RS1(base), RS2(x0))
> > 
> > prefetch.w is not an R-type instruction, it's an S-type. While the bit
> > shifts are the same, the names are different. We need to add S-type
> > names while defining this instruction. 
> 
> That is correct, it is supposed to look like a store instruction (S-type), 
> even though documentation don't explicitly state that.
> 
> Even though it works fine with the R-type definition, code documentation 
> would be wrong, and future changes could break it.
> 
> > Then, this define would be
> > 
> >  #define PREFETCH_w(base, imm) \

I should have suggested 'offset' instead of 'imm' for the second parameter
name.

> >      INSN_S(OPCODE_OP_IMM, FUNC3(6), IMM_11_5(imm), __IMM_4_0(0), \
> >             RS1(base), __RS2(3))
> 
> s/OPCODE_OP_IMM/OPCODE_PREFETCH
> 0x4 vs 0x13

There's no major opcode named "PREFETCH" and the spec says that the major
opcode used for prefetch instructions is OP-IMM. That's why we want to
name this OPCODE_OP_IMM. I'm not sure where the 0x4 you're referring to
comes from. A 32-bit instruction has the lowest two bits set (figure 1.1
of the unpriv spec) and table 27.1 of the unpriv spec shows OP-IMM is
0b00100xx, so we have 0b0010011. Keeping the naming of the opcode macros
consistent with the spec also keeps them consistent with the .insn
directive where we could even use the names directly, i.e.

 .insn s OP_IMM, 6, x3, 0(a0)

> > 
> > When the assembler as insn_r I hope it will validate that

I meant insn_s here, which would be the macro for '.insn s'

> > (imm & 0xfe0) == imm

I played with it. It won't do what we want for prefetch, only
what works for s-type instructions in general, i.e. it allows
+/-2047 offsets and fails for everything else. That's good enough.
We can just mask off the low 5 bits here in our macro

 #define PREFETCH_w(base, offset) \
    INSN_S(OPCODE_OP_IMM, FUNC3(6), IMM_11_5((offset) & ~0x1f), \
           __IMM_4_0(0), RS1(base), __RS2(3))

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
