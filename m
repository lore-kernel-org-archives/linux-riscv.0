Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1ECC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiysEEaeoQ47U5kt4fRPY3becdf5LCGLaDje5VXfZWw=; b=On+zAixXZQAVso
	t4LEhjUXMjTD4UYGk1iaoIdwu5X4Au20wcqthfrWc1x3gKvqlAb0D2atG0utHQtLzei6imlKdTqGM
	UlfiUrE74fQ2V2sfkyjs1sU0YBuVWVvYZkaiOA7ZzCvhd9j2j/5QK4GkwDAIh35HN2LSzY8ANcjP1
	k42f460qOB9I9LhSp55Qtld6dMWBs8QLCEKdU6FCLQAajcy2JzGU3+S+yX+qPh7B7M2oAMKYXpZ7H
	/TVjKZ3x+lZzZbwGk0bVEKBR01YSGqtIYmUoVV6ReaCYjIvTzNBLE3JdEah33/tYNDdf2pyQ2wQ0k
	JOFrVY+CCdfI3rDSMVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRkb-00EsIa-0l;
	Thu, 04 Jan 2024 17:43:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRkY-00EsHl-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 17:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704390199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuNvixvj7I1gCW2L3EcndNwefy5FlO7a/IFG5Uu5x20=;
	b=J6KN+m9GdgkWYTkDS0ybJnOQIVBT+Rkvb97dJKiQnQJ4XE8pPCnPE6PcfTGKs+qRYROyUy
	7SQUqosuZecVtoCQvlUHTj7VoOoaub/W8Cp2k68xnEBsDx42JY6F+9EIXOBZjKfbqB3p4V
	ekeg4E3EXuJxq2Cy+6hw+uw/LId48zY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-CtrGwhbuMYaPdaPN8Jzpdw-1; Thu, 04 Jan 2024 12:43:17 -0500
X-MC-Unique: CtrGwhbuMYaPdaPN8Jzpdw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6d9b050e9a8so819533b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 09:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704390197; x=1704994997;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuNvixvj7I1gCW2L3EcndNwefy5FlO7a/IFG5Uu5x20=;
        b=XVhBr2kwzvOzCSTcqmmSW94PmOHuwlAKWzHkYcNHmj7aj9T3hbr9cOP3ryLbxTfyQo
         ckyq7ooHJJBwdP1qdExltnQXVFNHgYb63t/NyAIhmOothwbyzPi5Pp55aD8DM6zUx26Z
         6P9MX5308rqkmWnUklF+9PSLFowFfrqW4LCJglpeLsjeWpF/XM2ls5fcV5CZKTIgW1Gn
         eF/DErtGwrsfj7b32nO/0g30LBnyKgWmsfEMyvu6bnoYx/Sy7Ddufgh1Ex+qqXpOuZzS
         m2+y0eI9/xgzdTcxGhw+2h25nzb6o1OI7zpDgo8AwHZjRTAv78uh4QZrot6XOv8HASu5
         13cg==
X-Gm-Message-State: AOJu0YyHOo5ML9Znh8fAhi9IwpHnTX3bNk2a3JFQ6V4fM9zLNnlrxet6
	nz+lHgiQY1pZEmyl6PndvMAvkjUl7X2OoAQaLqJR/2HtM1f8WaxhSnywk7RDLAFq57FNmp9q/HC
	epCx04tNW3JlddM1pJUz2W4cwez1RDOq9OL+V
X-Received: by 2002:a62:5346:0:b0:6d9:b66f:3d16 with SMTP id h67-20020a625346000000b006d9b66f3d16mr1158923pfb.50.1704390196831;
        Thu, 04 Jan 2024 09:43:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExGwukcRooOCfEMKqSkNigh0IbyweP45i/89S1/IF+npn5FOcVr9q1nCUpn3nOrCZCCxpcug==
X-Received: by 2002:a62:5346:0:b0:6d9:b66f:3d16 with SMTP id h67-20020a625346000000b006d9b66f3d16mr1158903pfb.50.1704390196500;
        Thu, 04 Jan 2024 09:43:16 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:3c39:8a36:75f0:8b6e:b898])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00098500b006d9bf35dd1fsm18498772pfg.142.2024.01.04.09.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 09:43:15 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Thu,  4 Jan 2024 14:43:04 -0300
Message-ID: <ZZbuKCvATa7yyQOc@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104-d6981cf63a39af4dff1d380a@orel>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-2-guoren@kernel.org> <ZZWs0C19tz763FnH@LeoBras> <20240103-0c96ceea88523b7b946e4ba8@orel> <ZZXEpU-JzsvD2UDW@LeoBras> <20240104-4ecfb92d2f8c95fa773ca695@orel> <ZZbI3clKUbNbNtZj@LeoBras> <20240104-d6981cf63a39af4dff1d380a@orel>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_094322_362390_4FDB4E5F 
X-CRM114-Status: GOOD (  48.13  )
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
Cc: wefu@redhat.com, keescook@chromium.org, atishp@atishpatra.org, peterz@infradead.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, Guo Ren <guoren@linux.alibaba.com>, guoren@kernel.org, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 04, 2024 at 05:40:50PM +0100, Andrew Jones wrote:
> On Thu, Jan 04, 2024 at 12:03:57PM -0300, Leonardo Bras wrote:
> ...
> > > > > > What we need here is something like:
> > > > > > + enum {
> > > > > > + 	PREFETCH_I,
> > > > > > + 	PREFETCH_R,
> > > > > > + 	PREFETCH_W,
> > > > > > + }	 
> > > > > 
> > > > > Can't use enum. This header may be included in assembly.
> > > > 
> > > > Oh, I suggest defines then, since it's better to make it clear instead of 
> > > > using 0, 1, 3.
> > > 
> > > I don't think we gain anything by adding another define in order to create
> > > the instruction define. We have to review the number sooner or later. I'd
> > > prefer we use the number inside the instruction define so we only need
> > > to look one place, which is also consistent with how we use FUNC fields.
> > > 
> > 
> > Sorry, I was unable to understand the reasoning.
> > 
> > If we are going to review the numbers sooner or later, would not it be 
> > better to have the instruction define to have "PREFETCH_W" instead of a 
> > number, and a unified list of defines for instructions.
> > 
> > This way we don't need to look into the code for 0's 1's and 3's, but 
> > instead just replace the number in the define list.
> > 
> > What am I missing?  
> 
> PREFETCH_W isn't defined as just 3, it's defined as
>    INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3), ...)
> 
> Adding a define (PREFETCH_W_RS2?) for the 3 just bloats the code and
> requires reviewers of PREFETCH_W to go look up another define.
> OPCODE_OP_IMM gets a define because it's used in multiple instructions,
> but everything else in an instruction definition should be a number
> exactly matching the spec, making it easy to review, or be an argument
> passed into the instruction macro.

Ok, I see your point now.
It's fine by me, then.


> 
> > 
> > > > 
> > > > > 
> > > > > > +
> > > > > > + #define CBO_PREFETCH(type, base, offset)                      \
> > > > > > +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> > > > > > +            SIMM12(offset & ~0x1f), RS1(base))
> > > > > 
> > > > > Yes. I suggested we mask offset as well, but ideally we'd detect a caller
> > > > > using an offset with nonzero lower 5 bits at compile time.
> > > > 
> > > > I would suggest the compiler would take care of this, but I am not sure 
> > > > about the assembly, since I am not sure if it gets any optimization.
> > > > 
> > > > I don't think we can detect a caller with non-zero offset at compile time, 
> > > > since it will be used in locks which can be at (potentially) any place in 
> > > > the block size. (if you have any idea though, please let me know :) )
> 
> I forgot to reply to this before. The reason I think it may be possible to
> validate offset at compile time is because it must be a constant, i.e.
> __builtin_constant_p(offset) must return true. So maybe something like
> 
>  static_assert(__builtin_constant_p(offset) && !(offset & 0x1f))
> 
> I'll try to find time to play with it.
> 

Let me know if you find anything.

> > > > 
> > > > On the other hand, we could create a S-Type macro which deliberately 
> > > > ignores imm[4:0], like  
> > > > 
> > > > + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> > > > +                 SIMM12(offset), RS1(base))
> > > > 
> > > > Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> > > > imm[4:0], like
> > > > 
> > > > +#define DEFINE_INSN_S                                                    \
> > > > + __DEFINE_ASM_GPR_NUMS                                           \
> > > > +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> > > > +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> > > > +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> > > > +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > > > +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > > > +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > > > +"        .endm\n"
> > > > +
> > > > 
> > > > Does this make sense?
> > > 
> > > If we create a special version of INSN_S, then I suggest we create one
> > > where its two SIMM fields are independent and then define prefetch
> > > instructions like this
> > > 
> > >  #define PREFETCH_W(base, offset) \
> > >      INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
> > >          SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))
> > > 
> > > which would allow simple review against the spec and potentially
> > > support other instructions which use hard coded values in the
> > > immediate fields.
> > > 
> > 
> > I agree, it looks better this way.
> > 
> > We could have:
> > INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2, SIMM_11_5, SIMM_4_0)
> > 
> > and implement INSN_S like:
> > #define INSN_S(OPCODE, FUNC3, RS1, RS2, SIMM_11_0) \
> > 	INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2,  \
> > 		SIMM_11_0 >> 5, SIMM_11_0 & 0x1f)
> 
> That won't work since SIMM_11_0 will be a string. Actually, with
> stringification in mind, I don't think defining INSN_S_SPLIT_IMM()
> is a good idea.

I don't see how SIMM_11_0 will be a string here. Is this due to using it 
on asm code?

I understand a user will call 
---
PREFETCH_W(base, offset), which becomes:

INSN_S(OPCODE_OP_IMM, 6, base, 3, offset) , which becomes:

INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), RS1(base), RS2(3), \
	SIMM_11_5(offset >> 5), SIMM_4_0(offset & 0x1f))
---

I don't see an issue here, the same wouldwork for every INSN_S() 

Now suppose we make PREFETCH_W use SPLIT_IMM directly:
---
PREFETCH_W(base, offset), which becomes:

INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), RS1(base), RS2(3), \
	 SIMM_11_5(offset >> 5), SIMM_4_0(0))
---

I don't see how stringification gets in the way.

Thanks!
Leo




 #define CBO_PREFETCH(type, base, offset)                      \
> > > > > > +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> > > > > > +            SIMM12(offset & ~0x1f), RS1(base))



> 
> Thanks,
> drew
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
