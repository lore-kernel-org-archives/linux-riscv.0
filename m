Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A283C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAYQL67umk/tnDlQweq3T/xTkOdN6H4MIdgvRyWqyts=; b=QFtzog7A/fjItt
	umvuJCXomHuYokyno8hyRlJHK+aBZbqvpEI0cT35rFkciDWMFoJ3GPAgqrg3IpS8YhA1+9PB2Cn3B
	gHpjZ3B/1AGg0K1kuFcBvM8FoInRYvZHHt/XSg/WQGn7syBW/kq/Ns9D/fh9baBvz/2QQOxLP4BxY
	g7l/VzWf1/dT4ulzs+pZwFeRQTqn6wmXNWQakMTZd3J+3Uz0FBppoRzu3FsFHp36FgQNvoKNnMbZ0
	PSxpWNja6zQjyPUh61W76ZYJpdipxMmakNagfBKXZcEcLTHsSbSnSjZKMyJnBJngJLYBQ5L/lP3ue
	S8n/nBoSkJxFPmI5NRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqi3-005NN6-2q;
	Mon, 08 Jan 2024 14:34:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqi0-005NL9-2W
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 14:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704724468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KkiqsaVDl5/2LelsXlVddSZIPY53rJQPMJGJG6V+LnM=;
	b=REhOEXcaAuL/ZCTROCSvIRH4plN6XpfCfv0dKbdWDAW1oicSAAUvTa2roYFNAj1HTTU91T
	zhdb5r5P7OQwd5E6MKo436HxHB1OyZb2xo56RdrMfh9gp4xv1b6i9TDVekmRyGVCeoBclA
	h4YpWFmplhp/vUSCRUHLK6owNsqpEuI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-G-l7OWmlPQSfmN5DayvAEQ-1; Mon, 08 Jan 2024 09:34:27 -0500
X-MC-Unique: G-l7OWmlPQSfmN5DayvAEQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6d9c07b2372so1907245b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 06:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724466; x=1705329266;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkiqsaVDl5/2LelsXlVddSZIPY53rJQPMJGJG6V+LnM=;
        b=u3nRSqo1mJjndSo1fHMkSoTIpGFog3tuiKd93sQLeJ280PgIiIZAs5OoEu78/ZfN32
         4ePc/ysqgR3HEEP9baL0MmAeo443beSeDXUKPtUjIERX34kejL5qe35h8HjkABzlAd07
         Syn89MLesV7OWJ2/N8ONZWd0POgoRc4kccdshqHWIdr9A1jY6Yq8cAu3FhykAfp2dQcz
         2oEsjSaKPODVuiCF3mjh3b2lIG963b/fN/9npsW4R8kUB0DdhH1BQNCph25tlp5LTfZx
         UG6lIvZt/Ve0vOHvzs0CvrjfE5AAzc+p2j283paYNIMvLOoFqwGamslHBr/cARv37MKJ
         K1VA==
X-Gm-Message-State: AOJu0YwjgNrcRxY7UjRMvQipJ699otTEl3t1oFZ2l5gmK+tzKgiZywZI
	Us3vR89dC1SlCn0omUga9NUQ6M+AviWNQN+PqVNXWdw/eplqbLwfFDaiF/pAl6maTZmMzKD2CbD
	ekkKJOfxGKq6ECsfeQskxXMAopd7PAhn0dKIL
X-Received: by 2002:a05:6a20:914b:b0:199:afa3:25f7 with SMTP id x11-20020a056a20914b00b00199afa325f7mr2404071pzc.39.1704724466222;
        Mon, 08 Jan 2024 06:34:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwR7HdOtCOkj2Ss21wiDgFQrjnmmvRn1uShoSU6/NrXe4s+oZV3zebXCwrGIsW5414AL4AyQ==
X-Received: by 2002:a05:6a20:914b:b0:199:afa3:25f7 with SMTP id x11-20020a056a20914b00b00199afa325f7mr2404045pzc.39.1704724465817;
        Mon, 08 Jan 2024 06:34:25 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a803:26a5:3f32:e12b:5335:3c2d])
        by smtp.gmail.com with ESMTPSA id fk10-20020a056a003a8a00b006da8b181bfbsm6035561pfb.169.2024.01.08.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:34:25 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Re: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Mon,  8 Jan 2024 11:34:15 -0300
Message-ID: <ZZwH5w2QLN4t1KtU@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105-faa40f2c20534ea498246cc3@orel>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-2-guoren@kernel.org> <ZZWs0C19tz763FnH@LeoBras> <20240103-0c96ceea88523b7b946e4ba8@orel> <ZZXEpU-JzsvD2UDW@LeoBras> <20240104-4ecfb92d2f8c95fa773ca695@orel> <ZZbI3clKUbNbNtZj@LeoBras> <20240104-d6981cf63a39af4dff1d380a@orel> <ZZbuKCvATa7yyQOc@LeoBras> <20240105-faa40f2c20534ea498246cc3@orel>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_063432_890901_0EACADDE 
X-CRM114-Status: GOOD (  47.22  )
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

On Fri, Jan 05, 2024 at 02:24:45PM +0100, Andrew Jones wrote:
> On Thu, Jan 04, 2024 at 02:43:04PM -0300, Leonardo Bras wrote:
> ...
> > > > > > I don't think we can detect a caller with non-zero offset at compile time, 
> > > > > > since it will be used in locks which can be at (potentially) any place in 
> > > > > > the block size. (if you have any idea though, please let me know :) )
> > > 
> > > I forgot to reply to this before. The reason I think it may be possible to
> > > validate offset at compile time is because it must be a constant, i.e.
> > > __builtin_constant_p(offset) must return true. So maybe something like
> > > 
> > >  static_assert(__builtin_constant_p(offset) && !(offset & 0x1f))
> > > 
> > > I'll try to find time to play with it.
> > > 
> > 
> > Let me know if you find anything.
> 
> There's nothing we can do in this file (insn-def.h), other than maybe
> masking, since all magic must happen at preprocessor time, other than
> a tiny bit of constant arithmetic allowed at assembly time. For C, using
> a wrapper, like patch 2 of this series introduces, we could add the
> static assert above. I'll suggest that in patch 2, since I've already
> thought it through, but it sort of feels like overkill to me.

It makes sense.

> 
> > 
> > > > > > 
> > > > > > On the other hand, we could create a S-Type macro which deliberately 
> > > > > > ignores imm[4:0], like  
> > > > > > 
> > > > > > + INSN_S_TRUNCATE(OPCODE_OP_IMM, FUNC3(6), __RS2(3),               \
> > > > > > +                 SIMM12(offset), RS1(base))
> > > > > > 
> > > > > > Which saves the bits 11:5 of offset  into imm[11:5], and zero-fill 
> > > > > > imm[4:0], like
> > > > > > 
> > > > > > +#define DEFINE_INSN_S                                                    \
> > > > > > + __DEFINE_ASM_GPR_NUMS                                           \
> > > > > > +"        .macro insn_s, opcode, func3, rs2, simm12, rs1\n"               \
> > > > > > +"        .4byte  ((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"  \
> > > > > > +"                 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"    \
> > > > > > +"                 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > > > > > +"                 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > > > > > +"                 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > > > > > +"        .endm\n"
> > > > > > +
> > > > > > 
> > > > > > Does this make sense?
> > > > > 
> > > > > If we create a special version of INSN_S, then I suggest we create one
> > > > > where its two SIMM fields are independent and then define prefetch
> > > > > instructions like this
> > > > > 
> > > > >  #define PREFETCH_W(base, offset) \
> > > > >      INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3), \
> > > > >          SIMM_11_5(offset >> 5), SIMM_4_0(0), RS1(base))
> > > > > 
> > > > > which would allow simple review against the spec and potentially
> > > > > support other instructions which use hard coded values in the
> > > > > immediate fields.
> > > > > 
> > > > 
> > > > I agree, it looks better this way.
> > > > 
> > > > We could have:
> > > > INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2, SIMM_11_5, SIMM_4_0)
> > > > 
> > > > and implement INSN_S like:
> > > > #define INSN_S(OPCODE, FUNC3, RS1, RS2, SIMM_11_0) \
> > > > 	INSN_S_SPLIT_IMM(OPCODE, FUNC3, RS1, RS2,  \
> > > > 		SIMM_11_0 >> 5, SIMM_11_0 & 0x1f)
> > > 
> > > That won't work since SIMM_11_0 will be a string. Actually, with
> > > stringification in mind, I don't think defining INSN_S_SPLIT_IMM()
> > > is a good idea.
> > 
> > I don't see how SIMM_11_0 will be a string here. Is this due to using it 
> > on asm code?
> > 
> > I understand a user will call 
> > ---
> > PREFETCH_W(base, offset), which becomes:
> > 
> > INSN_S(OPCODE_OP_IMM, 6, base, 3, offset) , which becomes:
> > 
> > INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), RS1(base), RS2(3), \
> > 	SIMM_11_5(offset >> 5), SIMM_4_0(offset & 0x1f))
> 
> The other annotations, like SIMM12, stringify their arguments. So, if
> SIMM_11_5 and SIMM_4_0 also stringified, then it wouldn't be possible
> to recombine them into a simm12 for the '.insn s' directive. I suppose
> SIMM_11_5 and SIMM_4_0 could just expand their arguments without
> stringifying. With that, along with throwing even more ugly at it, then
> it is possible to get the end result we want, which is
> 
>  - PREFETCH_* instructions are defined with annotations and have a
>    SIMM_4_0(0) in their definitions to explicitly point out that field
> 
>  - the INSN_S definition still directly maps to the .insn s directive
> 
> 
> I got that to work with this
> 
> #define __RV_SIMM(v)           v
> #define RV___SIMM_11_5(v)      __RV_SIMM(v)
> #define RV___SIMM_4_0(v)       __RV_SIMM(v)
> 
> #define __INSN_S_SPLIT_IMM(opcode, func3, rs2, simm12, rs1) \
>         INSN_S(opcode, func3, rs2, SIMM12(simm12), rs1)
> 
> #define INSN_S_SPLIT_IMM(opcode, func3, rs2, simm_11_5, simm_4_0, rs1) \
>         __INSN_S_SPLIT_IMM(opcode, func3, rs2, (RV_##simm_11_5 << 5) | RV_##simm_4_0, rs1)
> 
> #define CBO_PREFETCH_W(base, offset)                            \
>         INSN_S_SPLIT_IMM(OPCODE_OP_IMM, FUNC3(6), __RS2(3),     \
>                 __SIMM_11_5((offset) >> 5), __SIMM_4_0(0), RS1(base))
> 
> 
> But, again, I feel like it's probably overkill...

I though our intention was to avoid the extra IMM masking in asm, while 
keeping the 5 lower bits zeroed at all times.

But IIUC here you are writing a insn_s_split_imm in terms of a plain 
insn_s, which guarantees the zeroed 5 lower bits but still does an 
unnecessaty masking in asm. In fact, if we use the split version, it 
concatenates the two IMM parts, to then split them again in order to build 
the instruction.

In my suggestion above, we make INSN_S_SPLIT_IMM() the helper / standard 
way to write an s-type and write a INSN_S() in terms of the SPLIT version.

This allows using the split version when we don't need one of the halfs, 
thus avoiding a masking or a rotation. The full version just splits the 
halfs and pass to the split version that directly builds the instruction.

Well, I think I was under the wrong impression that we wanted to avoid the 
rotation and masking, but I just noticed that we are just dealing with 
splitting the offset, which is supposed to be a constant during the 
generation of the instruction, so we can just guarantee the value being 
masked at no runtime cost. 

So in the end we are just thinking on how it could look better to the user, 
and maybe the split version is unnecessary if the user guarantees the 
masking to be correct. But if we are going to have it, I suggest we do 
INSN_S in terms of INSN_S_SPLIT_IMM() instead of the other way around.


Thanks!
Leo

> 
> Thanks,
> drew
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
