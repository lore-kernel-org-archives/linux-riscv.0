Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD8AC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 13:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXmebjldAstqNFPDQo29VjQZLCFYJLXuakI3Ai9jvVg=; b=PgEYU85CEjU4XY
	xaTvTi6A1R1UhS6OfpEzFRrL3SXo09QG6RJXDrD6Kq0NmH8KwBg5xvIl9nAqBK/fWntCNvlhxFoO/
	HFfihF4Lg6G0UXY39mEOl44wBAckSmMlOBuAzzM/LBLmLxbuIfWn2nVRNPIfLSLrjGq6SwMX/o/fU
	2yIt8CJYDlJ2g6kHEXeTdlq6ktN8DD8lv/t0ktMKOH8ulvrBi0BjIo6V4PkfLP1r81Jy9REYNULm7
	SpHW80m3O0Pj8oK0S5xZaBaae+cuQs2FXSMKdQ04o6S1MhRHS8HZ0QNtBz7zltQM/dKUUhM2pRtE2
	y58lTJEahpVvx4rIqalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLkBw-00GxYh-2B;
	Fri, 05 Jan 2024 13:24:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLkBu-00GxY7-0D
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 13:24:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a28e31563ebso177346066b.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 05:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704461087; x=1705065887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWrxWM20Sc/0fg8zOr8GrEJNxiypntEhdE5ySeFTgNc=;
        b=oZpGGZYXXrQMp5PfSCY15dTZKGQHtW+VvWB6psFRdxm3/uHUI+nTLQSWH5s6BxG1pH
         8VU0T0/SWtSyRq/j/lc44SOmr7QXaPW3F6hsTJYOX6QryQ3BAE7tfRcdAb+ATflSwkMd
         zAsHHXkdFsjiqfKGpfCozsitaXOapWE+VbG/MB68XT8LIm/LtVZUsoSS3o1tfJrtg6mJ
         wHdpkqA0ZdMxNabQiW18wYcviabM8qryWtZEA7syLrtwtmNQ3Y9Boeq9jvqt39YLNqPU
         k4sSjJW4r5wHjWK+P9D7CC4OfcDsKzWc1p2jC1315XMaEUCb1r3ROYE0Iy0ErJuXepSY
         Vw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461087; x=1705065887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWrxWM20Sc/0fg8zOr8GrEJNxiypntEhdE5ySeFTgNc=;
        b=F2LUeEs/hS8Q+TKDrV5BWpd35PAYcyiN6PIFLbW+oiyVKnPwXf85Myzew0o/M6GM/2
         k+f08EbXnT+WqTceUjGzbHy0uj2rjK3MgkeUlJE5G84iWdRASWZh/9J4yJVC010QkLKQ
         witY6EVXk56NK3ukYTX0lZSjad+QcLJ0GcqBIJUan0fH/RgzgauKuyxJCQui9OOXuNl/
         ts5utx5SFXCSTRVO6uQmumyVGsG0nmcciXpaX/Viph1FNfAbZEq6P7MB4h4I1+WB4z32
         K6So5ZXtaqdl7OXN7tdQIGdD2892u3TXmQl3ajGcfilLqn2JGhTEooML8F9Fgy0SR9tm
         JQMw==
X-Gm-Message-State: AOJu0YxVY1Ja6WbIMXfwHyuBxeJ/CD1OzuUik23NcU3wjSPs270O1yY1
	+feELEBsT3x/4xRGU0nx5yoem/KjQtJchg==
X-Google-Smtp-Source: AGHT+IE4KzVZAe1lCDbe9dWTEOivaccz0byV8T1YuB4aioJo6qHOOt4mWa3WyJ9xY8x4iUl3yRwkcw==
X-Received: by 2002:a17:907:940f:b0:a26:cee8:3713 with SMTP id dk15-20020a170907940f00b00a26cee83713mr1417765ejc.55.1704461086710;
        Fri, 05 Jan 2024 05:24:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r22-20020a1709062cd600b00a26f5e9506fsm879710ejr.109.2024.01.05.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:24:46 -0800 (PST)
Date: Fri, 5 Jan 2024 14:24:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: Re: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction
 definitions & cpufeature
Message-ID: <20240105-faa40f2c20534ea498246cc3@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <ZZWs0C19tz763FnH@LeoBras>
 <20240103-0c96ceea88523b7b946e4ba8@orel>
 <ZZXEpU-JzsvD2UDW@LeoBras>
 <20240104-4ecfb92d2f8c95fa773ca695@orel>
 <ZZbI3clKUbNbNtZj@LeoBras>
 <20240104-d6981cf63a39af4dff1d380a@orel>
 <ZZbuKCvATa7yyQOc@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZbuKCvATa7yyQOc@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_052450_147152_CA69AAE0 
X-CRM114-Status: GOOD (  35.44  )
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

On Thu, Jan 04, 2024 at 02:43:04PM -0300, Leonardo Bras wrote:
...
> > > > > I don't think we can detect a caller with non-zero offset at compile time, 
> > > > > since it will be used in locks which can be at (potentially) any place in 
> > > > > the block size. (if you have any idea though, please let me know :) )
> > 
> > I forgot to reply to this before. The reason I think it may be possible to
> > validate offset at compile time is because it must be a constant, i.e.
> > __builtin_constant_p(offset) must return true. So maybe something like
> > 
> >  static_assert(__builtin_constant_p(offset) && !(offset & 0x1f))
> > 
> > I'll try to find time to play with it.
> > 
> 
> Let me know if you find anything.

There's nothing we can do in this file (insn-def.h), other than maybe
masking, since all magic must happen at preprocessor time, other than
a tiny bit of constant arithmetic allowed at assembly time. For C, using
a wrapper, like patch 2 of this series introduces, we could add the
static assert above. I'll suggest that in patch 2, since I've already
thought it through, but it sort of feels like overkill to me.

> 
> > > > > 
> > > > > On the other hand, we could create a S-Type macro which deliberately 
> > > > > ignores imm[4:0], like  
> > > > > 
> > > > > + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> > > > > +                 SIMM12(offset), RS1(base))
> > > > > 
> > > > > Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> > > > > imm[4:0], like
> > > > > 
> > > > > +#define DEFINE_INSN_S                                                    \
> > > > > + __DEFINE_ASM_GPR_NUMS                                           \
> > > > > +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> > > > > +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> > > > > +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> > > > > +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > > > > +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > > > > +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > > > > +"        .endm\n"
> > > > > +
> > > > > 
> > > > > Does this make sense?
> > > > 
> > > > If we create a special version of INSN_S, then I suggest we create one
> > > > where its two SIMM fields are independent and then define prefetch
> > > > instructions like this
> > > > 
> > > >  #define PREFETCH_W(base, offset) \
> > > >      INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
> > > >          SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))
> > > > 
> > > > which would allow simple review against the spec and potentially
> > > > support other instructions which use hard coded values in the
> > > > immediate fields.
> > > > 
> > > 
> > > I agree, it looks better this way.
> > > 
> > > We could have:
> > > INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2, SIMM_11_5, SIMM_4_0)
> > > 
> > > and implement INSN_S like:
> > > #define INSN_S(OPCODE, FUNC3, RS1, RS2, SIMM_11_0) \
> > > 	INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2,  \
> > > 		SIMM_11_0 >> 5, SIMM_11_0 & 0x1f)
> > 
> > That won't work since SIMM_11_0 will be a string. Actually, with
> > stringification in mind, I don't think defining INSN_S_SPLIT_IMM()
> > is a good idea.
> 
> I don't see how SIMM_11_0 will be a string here. Is this due to using it 
> on asm code?
> 
> I understand a user will call 
> ---
> PREFETCH_W(base, offset), which becomes:
> 
> INSN_S(OPCODE_OP_IMM, 6, base, 3, offset) , which becomes:
> 
> INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), RS1(base), RS2(3), \
> 	SIMM_11_5(offset >> 5), SIMM_4_0(offset & 0x1f))

The other annotations, like SIMM12, stringify their arguments. So, if
SIMM_11_5 and SIMM_4_0 also stringified, then it wouldn't be possible
to recombine them into a simm12 for the '.insn s' directive. I suppose
SIMM_11_5 and SIMM_4_0 could just expand their arguments without
stringifying. With that, along with throwing even more ugly at it, then
it is possible to get the end result we want, which is

 - PREFETCH_* instructions are defined with annotations and have a
   SIMM_4_0(0) in their definitions to explicitly point out that field

 - the INSN_S definition still directly maps to the .insn s directive


I got that to work with this

#define __RV_SIMM(v)           v
#define RV___SIMM_11_5(v)      __RV_SIMM(v)
#define RV___SIMM_4_0(v)       __RV_SIMM(v)

#define __INSN_S_SPLIT_IMM(opcode, func3, rs2, simm12, rs1) \
        INSN_S(opcode, func3, rs2, SIMM12(simm12), rs1)

#define INSN_S_SPLIT_IMM(opcode, func3, rs2, simm_11_5, simm_4_0, rs1) \
        __INSN_S_SPLIT_IMM(opcode, func3, rs2, (RV_##simm_11_5 << 5) | RV_##simm_4_0, rs1)

#define CBO_PREFETCH_W(base, offset)                            \
        INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3),     \
                __SIMM_11_5((offset) >> 5), __SIMM_4_0(0), RS1(base))


But, again, I feel like it's probably overkill...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
