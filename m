Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C0BC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dAgLOtZBRG44ku/+wQUCvPnVB7wnhS4TQh4JEdyk/A=; b=p5KRwy+rcdmoao
	6cJ2BfOlI3hSji++swd7k6koPeiwcUtPTxX2ekCrwfJ9hU2yyY0EwWsZ4jz12Z2i5CnTzhSR1wsE7
	jT13yldWAu4/T8ULO/1hs5wG+THuMa/e9YsSKgsRVwtuE1r4VyqxNRv2LwVc0gdyrZmN05TTIct26
	z6mw4UPtFZSlJsFJUEgbHMXrFEriFSoh/nbjHeqdmfBrPxZxbKiF7GEtyU2CpPeINis9Rv/EXdqzR
	Kq6MHLgtLAsmzzZ/UuQ+O/ym8vvYHHPk1+tXZ3rGIrtbRnvXqWT08ChfngrRdayUxIoZtn8fox7g/
	YfLCWjCSqMFtjXdXc1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPGe-00EQvW-1F;
	Thu, 04 Jan 2024 15:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPGY-00EQrr-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704380653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54czl3D5X40O/vQlC+9Ni2dHi6OnEwWDJH786ySVlbE=;
	b=gAo6hyHFFctAMVrDq+YJE0SG8sD58e85kLJU9GJOXp23Vo2n3pxnMv0lmuc1i/GPpIuK0w
	tNUuOOGLuWQVNlxa6n1DnOBcC9bjSWsDhfQkp0fKGoPzCmphLWyqohWM/WHNgNUK/8C6Vz
	h67YQFv1/jb7rM3k4f4MZ1uWjTkn3SI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-JurNno2JMjOg7REqnB73Lg-1; Thu, 04 Jan 2024 10:04:11 -0500
X-MC-Unique: JurNno2JMjOg7REqnB73Lg-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1d3fa1ff824so3755145ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704380651; x=1704985451;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54czl3D5X40O/vQlC+9Ni2dHi6OnEwWDJH786ySVlbE=;
        b=D1sVMSVgqgG7L9ZQVgbwJq2idof1hluR/recG0x/X2SPVehxtuivdyRIfxdfUXSJ5b
         PegHYzpvDUgIgwRsl7n7OyQABcwKWgihtFtKhJmJjKJ0mVGWx+4IvTw4X1wsjSdkOF+s
         sLMZxdaL3HR8lPnKJKl5IqVJ3imTiAvDwBpyGKDGuQP4PqcGZK8qKIo9Fu+HgSYiGSWe
         3hZpeMMAtahuEiF79r6qaHXl9qaLBlhKBSW4dzgNEDbW3b+cgLL7s1MX9WT2I6Th804r
         878GiqIWNht8TmpAdjQOf6BGsHATJRkScl4g2kH/LJZZlHNBPCDA+83+cjzMN/UOwy1r
         byOw==
X-Gm-Message-State: AOJu0Ywdvh8O4eQLT4pu6HiogbUTGxit+TQ50RJYDOiMAyTGiVnRTTJv
	aV33NW9G59JHPZWbpNvTaKELzNKsrlwoAvlWKuVtKjtnhnNmE3r/YEj7RDBfgjIxlBwRkIU8TV2
	AB2C0LiX9CLUk7h/xim1290tKAzf2CaFLDtWS
X-Received: by 2002:a17:902:7ec8:b0:1d4:df66:42fa with SMTP id p8-20020a1709027ec800b001d4df6642famr484766plb.65.1704380650529;
        Thu, 04 Jan 2024 07:04:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBUSGQH4kHn/+tNl9EDAVAQc3MloODmEGyIqw0UaTuZn9ttpODkJIeEzjf6zBFcG/+1lIqkQ==
X-Received: by 2002:a17:902:7ec8:b0:1d4:df66:42fa with SMTP id p8-20020a1709027ec800b001d4df6642famr484738plb.65.1704380650191;
        Thu, 04 Jan 2024 07:04:10 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:3b60:7b8a:588b:5256:ce57])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902d2c600b001d49e742d51sm11304580plc.30.2024.01.04.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:04:09 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Thu,  4 Jan 2024 12:03:57 -0300
Message-ID: <ZZbI3clKUbNbNtZj@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104-4ecfb92d2f8c95fa773ca695@orel>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-2-guoren@kernel.org> <ZZWs0C19tz763FnH@LeoBras> <20240103-0c96ceea88523b7b946e4ba8@orel> <ZZXEpU-JzsvD2UDW@LeoBras> <20240104-4ecfb92d2f8c95fa773ca695@orel>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_070414_300844_4DF67818 
X-CRM114-Status: GOOD (  50.64  )
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

On Thu, Jan 04, 2024 at 10:47:34AM +0100, Andrew Jones wrote:
> On Wed, Jan 03, 2024 at 05:33:41PM -0300, Leonardo Bras wrote:
> > On Wed, Jan 03, 2024 at 08:29:39PM +0100, Andrew Jones wrote:
> > > On Wed, Jan 03, 2024 at 03:52:00PM -0300, Leonardo Bras wrote:
> > > > On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
> ...
> > > > The shifts seem correct for S-Type, but I would name the IMM defines in a 
> > > > way we could understand where they fit in IMM:
> > > > 
> > > > 
> > > > INSN_S_SIMM5_SHIFT -> INSN_S_SIMM_0_4_SHIFT
> > > > INSN_S_SIMM7_SHIFT -> INSN_S_SIMM_5_11_SHIFT
> > > > 
> > > > What do you think?
> > > 
> > > I'm in favor of this suggestion, but then wonder if we don't need another
> > > patch before this which renames INSN_I_SIMM12_SHIFT to
> > > INSN_I_SIMM_0_11_SHIFT in order to keep things consistent.
> > 
> > Agree. If it's ok, I can provide a patch doing the rename on top of this 
> > patchset.
> 
> The INSN_I change is only needed if we also take the new INSN_S shift
> macros, so I think the INSN_I change should be part of this series.

Ok then,

> 
> BTW, I just noticed we wrote the numbers backwards. They should be
> 
>  INSN_I_SIMM_11_0_SHIFT
>  INSN_S_SIMM_11_5_SHIFT
>  INSN_S_SIMM_4_0_SHIFT
>

That's right, so it matches ISA documentation :)

 
> > > > >  
> > > > > +#define CBO_PREFETCH_I(base, offset)				\
> > > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> > > > > +	       SIMM12(offset), RS1(base))
> > > > > +
> > > > > +#define CBO_PREFETCH_R(base, offset)				\
> > > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> > > > > +	       SIMM12(offset), RS1(base))
> > > > > +
> > > > > +#define CBO_PREFETCH_W(base, offset)				\
> > > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> > > > > +	       SIMM12(offset), RS1(base))
> > > > > +
> > > > 
> > > > For OP_IMM & FUNC3(6) we have ORI, right?
> > > > For ORI, rd will be at bytes 11:7, which in PREFETCH.{i,r,w} is
> > > > offset[4:0].
> > > > 
> > > > IIUC, when the cpu does not support ZICBOP, this should be fine as long as 
> > > > rd = 0, since changes to r0 are disregarded.
> > > > 
> > > > In this case, we need to guarantee offset[4:0] = 0, or else we migth write 
> > > > on an unrelated register. This can be noticed in ZICBOP documentation pages 
> > > > 21, 22, 23, as offset[4:0] is always [0 0 0 0 0]. 
> > > > (Google docs in first comment)
> > > > 
> > > > What we need here is something like:
> > > > + enum {
> > > > + 	PREFETCH_I,
> > > > + 	PREFETCH_R,
> > > > + 	PREFETCH_W,
> > > > + }	 
> > > 
> > > Can't use enum. This header may be included in assembly.
> > 
> > Oh, I suggest defines then, since it's better to make it clear instead of 
> > using 0, 1, 3.
> 
> I don't think we gain anything by adding another define in order to create
> the instruction define. We have to review the number sooner or later. I'd
> prefer we use the number inside the instruction define so we only need
> to look one place, which is also consistent with how we use FUNC fields.
> 

Sorry, I was unable to understand the reasoning.

If we are going to review the numbers sooner or later, would not it be 
better to have the instruction define to have "PREFETCH_W" instead of a 
number, and a unified list of defines for instructions.

This way we don't need to look into the code for 0's 1's and 3's, but 
instead just replace the number in the define list.

What am I missing?  

> > 
> > > 
> > > > +
> > > > + #define CBO_PREFETCH(type, base, offset)                      \
> > > > +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> > > > +            SIMM12(offset & ~0x1f), RS1(base))
> > > 
> > > Yes. I suggested we mask offset as well, but ideally we'd detect a caller
> > > using an offset with nonzero lower 5 bits at compile time.
> > 
> > I would suggest the compiler would take care of this, but I am not sure 
> > about the assembly, since I am not sure if it gets any optimization.
> > 
> > I don't think we can detect a caller with non-zero offset at compile time, 
> > since it will be used in locks which can be at (potentially) any place in 
> > the block size. (if you have any idea though, please let me know :) )
> > 
> > On the other hand, we could create a S-Type macro which deliberately 
> > ignores imm[4:0], like  
> > 
> > + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> > +                 SIMM12(offset), RS1(base))
> > 
> > Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> > imm[4:0], like
> > 
> > +#define DEFINE_INSN_S                                                    \
> > + __DEFINE_ASM_GPR_NUMS                                           \
> > +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> > +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> > +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> > +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > +"        .endm\n"
> > +
> > 
> > Does this make sense?
> 
> If we create a special version of INSN_S, then I suggest we create one
> where its two SIMM fields are independent and then define prefetch
> instructions like this
> 
>  #define PREFETCH_W(base, offset) \
>      INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
>          SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))
> 
> which would allow simple review against the spec and potentially
> support other instructions which use hard coded values in the
> immediate fields.
> 

I agree, it looks better this way.

We could have:
INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2, SIMM_11_5, SIMM_4_0)

and implement INSN_S like:
#define INSN_S(OPCODE, FUNC3, RS1, RS2, SIMM_11_0) \
	INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2,  \
		SIMM_11_0 >> 5, SIMM_11_0 & 0x1f)

This would avoid extra instructions in asm while not having duplicated 
code.


> But I'm not sure it's worth it. I think
> 
>  #define PREFETCH_W(base, offset) \
>      INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
>          SIMM12(offset & ~0x1f), RS1(base))
> 
> is also pretty easy to review against the spec and we don't have any other
> instructions yet with other requirements for the immediates.
> 

It makes sense, but I think having INSN_S being implemented with 
INSN_S_SPLIT_IMM like suggested above would allow us to have the 
benefits of a split version without the code duplication.

> Thanks,
> drew
> 

Thanks!
Leo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
