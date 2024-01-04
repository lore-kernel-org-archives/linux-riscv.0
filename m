Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0162C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScWLBRAalRg5EaBC1A6Evg6+lXc0RzNaOytza1qP5xg=; b=zYH4LZ1MNCYXb0
	B0HPE9zjzg596DEM3kfHkOUib/sU3Q9lhXcNPwgmogK/ygwB56v34JzYvg0l/88ds1oIGxjfL3Kuq
	MHdjEFmI/b8CfcVjoS4ObyZlWUzstY+/xdhQhRifZz8pwjkePrQOABdi8DQJbcZpjyd3jwVl3VaHd
	OLu7SB2JfoQIBI9hOV3BnHPBFp+xkeclHNzXXDOKap79HDVZeq8pQ5tkF7vDr38eZrppq1Tah6QiQ
	7Z45PwrNZv7IlHpcIbTZxeK91mlayUXQgn3VDrQFRN2NNzTtLG3OuibCgjvSuEbiYLi9FR6YoDuLX
	k+QeyX0tKIF/T23Lp8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKKE-00DQWy-02;
	Thu, 04 Jan 2024 09:47:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKKA-00DQW4-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 09:47:40 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cd1919f0acso4366131fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704361656; x=1704966456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjIOzASFKXtnzifSOlgR7uNlr9WKjwKVoy2m9WsQklE=;
        b=A0E0pS79wzNycqVo+3JVrFlw9ZNi4moHpdwN47dgL/SqI7EqQGD3+6QVoXACLW/OWl
         q4M85tet981xJJhL/f60QgQ+ScRbJmNyd16EQEDMzKjUiEuPsJE9Kqkp92w7FlLGheJY
         ylvfn8IwfhxYAh8omw83wyN7ei6+d+21dgTOuPOleWoLB7TiSFy29544J8d6uIJG54U+
         UamXqPEXxfkMSjCIdZ3Md++5WYfVrwr6daKq0/n71Dpm/TSjqbJwX1P9E8c0sk0bfyNC
         NQEdnf7dM2/CA4zsLg9Gk6GQPH3s8aytPtftVSg6d9dwJ6arsxaPFkpvhpm/d8bPg5rr
         5Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704361656; x=1704966456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjIOzASFKXtnzifSOlgR7uNlr9WKjwKVoy2m9WsQklE=;
        b=TAiBD4nYoJeJEj8Fej3d3VvzGIOuqANTdh+kmfxZiEjpsU2871Cd5AeqjK3+VKso4t
         rzTcuO4C4PQa1TU7TpFusQrPqfWBUdksJilqixY4NeM4HV6/cxiYNJSlwyrL4QDHzd4Y
         ytk5e5yEuu4UvDgIdY3lA4GpFtM6PUXrWbF2o4Sukl+YsXHVdN6UbwBUjuWE4k/ncvAC
         /z7j1A9zti/RX/B5zeh23xVVY8KC6g/WpemEHflywmB8S1j3fE/ST9HwA9O+VfYgaeD4
         H7P+Crh85sNkgnVzd5IIVWC/r34xs+unTwSMiOEa+KcVY5+rwzxMpdf9phZ2y9yBC52/
         S3Cg==
X-Gm-Message-State: AOJu0Yw5jxQu+bkyZ/uVSV//UizzN9fcZWW604C7W+E0JgG5qTzXEP1W
	pM89I1j++HbFKJjEKEAYvtJzJegjY794XQ==
X-Google-Smtp-Source: AGHT+IHokDrCyFOkfMV2ZJkoKUpPp5Z2frj1npon3QRHNkknpBQw7ofTk3TqPl1odKml1sS1MObQxw==
X-Received: by 2002:a05:6512:2141:b0:50e:6a07:5c02 with SMTP id s1-20020a056512214100b0050e6a075c02mr201705lfr.15.1704361656189;
        Thu, 04 Jan 2024 01:47:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p9-20020a170907910900b00a26ac5e3683sm12848872ejq.100.2024.01.04.01.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 01:47:35 -0800 (PST)
Date: Thu, 4 Jan 2024 10:47:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions
 & cpufeature
Message-ID: <20240104-4ecfb92d2f8c95fa773ca695@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <ZZWs0C19tz763FnH@LeoBras>
 <20240103-0c96ceea88523b7b946e4ba8@orel>
 <ZZXEpU-JzsvD2UDW@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZXEpU-JzsvD2UDW@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_014738_796233_6532057C 
X-CRM114-Status: GOOD (  39.33  )
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

On Wed, Jan 03, 2024 at 05:33:41PM -0300, Leonardo Bras wrote:
> On Wed, Jan 03, 2024 at 08:29:39PM +0100, Andrew Jones wrote:
> > On Wed, Jan 03, 2024 at 03:52:00PM -0300, Leonardo Bras wrote:
> > > On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
...
> > > The shifts seem correct for S-Type, but I would name the IMM defines in a 
> > > way we could understand where they fit in IMM:
> > > 
> > > 
> > > INSN_S_SIMM5_SHIFT -> INSN_S_SIMM_0_4_SHIFT
> > > INSN_S_SIMM7_SHIFT -> INSN_S_SIMM_5_11_SHIFT
> > > 
> > > What do you think?
> > 
> > I'm in favor of this suggestion, but then wonder if we don't need another
> > patch before this which renames INSN_I_SIMM12_SHIFT to
> > INSN_I_SIMM_0_11_SHIFT in order to keep things consistent.
> 
> Agree. If it's ok, I can provide a patch doing the rename on top of this 
> patchset.

The INSN_I change is only needed if we also take the new INSN_S shift
macros, so I think the INSN_I change should be part of this series.

BTW, I just noticed we wrote the numbers backwards. They should be

 INSN_I_SIMM_11_0_SHIFT
 INSN_S_SIMM_11_5_SHIFT
 INSN_S_SIMM_4_0_SHIFT

> > > >  
> > > > +#define CBO_PREFETCH_I(base, offset)				\
> > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> > > > +	       SIMM12(offset), RS1(base))
> > > > +
> > > > +#define CBO_PREFETCH_R(base, offset)				\
> > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> > > > +	       SIMM12(offset), RS1(base))
> > > > +
> > > > +#define CBO_PREFETCH_W(base, offset)				\
> > > > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> > > > +	       SIMM12(offset), RS1(base))
> > > > +
> > > 
> > > For OP_IMM & FUNC3(6) we have ORI, right?
> > > For ORI, rd will be at bytes 11:7, which in PREFETCH.{i,r,w} is
> > > offset[4:0].
> > > 
> > > IIUC, when the cpu does not support ZICBOP, this should be fine as long as 
> > > rd = 0, since changes to r0 are disregarded.
> > > 
> > > In this case, we need to guarantee offset[4:0] = 0, or else we migth write 
> > > on an unrelated register. This can be noticed in ZICBOP documentation pages 
> > > 21, 22, 23, as offset[4:0] is always [0 0 0 0 0]. 
> > > (Google docs in first comment)
> > > 
> > > What we need here is something like:
> > > + enum {
> > > + 	PREFETCH_I,
> > > + 	PREFETCH_R,
> > > + 	PREFETCH_W,
> > > + }	 
> > 
> > Can't use enum. This header may be included in assembly.
> 
> Oh, I suggest defines then, since it's better to make it clear instead of 
> using 0, 1, 3.

I don't think we gain anything by adding another define in order to create
the instruction define. We have to review the number sooner or later. I'd
prefer we use the number inside the instruction define so we only need
to look one place, which is also consistent with how we use FUNC fields.

> 
> > 
> > > +
> > > + #define CBO_PREFETCH(type, base, offset)                      \
> > > +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> > > +            SIMM12(offset & ~0x1f), RS1(base))
> > 
> > Yes. I suggested we mask offset as well, but ideally we'd detect a caller
> > using an offset with nonzero lower 5 bits at compile time.
> 
> I would suggest the compiler would take care of this, but I am not sure 
> about the assembly, since I am not sure if it gets any optimization.
> 
> I don't think we can detect a caller with non-zero offset at compile time, 
> since it will be used in locks which can be at (potentially) any place in 
> the block size. (if you have any idea though, please let me know :) )
> 
> On the other hand, we could create a S-Type macro which deliberately 
> ignores imm[4:0], like  
> 
> + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> +                 SIMM12(offset), RS1(base))
> 
> Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> imm[4:0], like
> 
> +#define DEFINE_INSN_S                                                    \
> + __DEFINE_ASM_GPR_NUMS                                           \
> +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> +"        .endm\n"
> +
> 
> Does this make sense?

If we create a special version of INSN_S, then I suggest we create one
where its two SIMM fields are independent and then define prefetch
instructions like this

 #define PREFETCH_W(base, offset) \
     INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
         SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))

which would allow simple review against the spec and potentially
support other instructions which use hard coded values in the
immediate fields.

But I'm not sure it's worth it. I think

 #define PREFETCH_W(base, offset) \
     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
         SIMM12(offset & ~0x1f), RS1(base))

is also pretty easy to review against the spec and we don't have any other
instructions yet with other requirements for the immediates.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
