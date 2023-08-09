Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A0BC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9tdG6hOJJ4/ZYh+Lar1gfjXfHXCetzP9WM0EmE2mWk=; b=I1RfCRH6ft4T5p
	yK12tD5c4QufqUcRe7gh3PCPT0yMHBcAq+GKYJm9/THhmH8YnFpLcdwUBY/ZNt+mv9wQK1X4gmH/u
	N/FnMlCmsjnPmaStYPaz3Oaj/k4+/44Mj+LSfw4XDjFKw5SGO0ZHV0S164LcQI0uVzhkZemTiVBGw
	DaVIObzXZSkVaWApSmlFY1Lss5g9iz86oGLYeF19Ni8yXVKv1SR4mK/SJCGbgIFNnceLZrrBkkECR
	H6NYD0i/s50AT6iDrYa45RRzlyQLkhj4eMsdrCYLmwxK6PnuwLVt5wUaW4upvcZhv4ewMskqblqGo
	Sp409oFr4V6Hu/kuR73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXdu-003mO9-1e;
	Wed, 09 Aug 2023 01:05:42 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXdr-003mNa-2M
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:05:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-564b326185bso3032004a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691543138; x=1692147938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUsRmY1Xcm7ykK1suZsMHzelnTN7LprhzE12kZ8tIlw=;
        b=qEPdQN5/ZsibsJ6Ek13P2srY5X3spB6dVg4KnKybNiazDj5Iebdbp+Aa9/CL+72tDw
         6KHAGRh+sOJrFr8wYK+a8mMmGDqrBI4dr9jnKvbkpzZ0+ZMREBXoSspnBSLhbNHY+95x
         JaclkyIXapqhKBraR+aZQMw4hm0aOPn0vKKGmpJVuvbQwmRD8gdzbZdqTuQsBCOklpOx
         NQL2uAPdZsAWxdIb4wWeuidFBQ+7DcAvRtyMjdUdklxwtKVU0KnynrNnf3ZakQzFgu31
         FwDK11crbEjCmOGRGGBeZiFS21Dq+IpX9f0KWvhj7tAKFq+R2TR78JOjG/u/819aQm5d
         9Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543138; x=1692147938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUsRmY1Xcm7ykK1suZsMHzelnTN7LprhzE12kZ8tIlw=;
        b=MT24TlebB40VHrSmoKa/I6iYZWJFXIGDGYSUb9NTbNI857+2HFTdeFi+lMG2Byrpg3
         YwHlCGslNuBj2K7atDPK1EFKFCVtuSNR+Gk+RKpgvXvLFRplI3aNOZTnBsHjzbnQHd3D
         r4afRv/Rvm/rhqfNGDm4T7Tus+jkgoZkxLxdMUS8ldKTm6o0je7fK7QuiFzWWgjynSec
         HGoSKdfywaexQX4MIuitNvOtA2Zu0IEjk5q+cMM4yKiSvlZ2QN3R6Z5mF0P45UZHlqNQ
         2AAxoaknEC2XGy853F+cOS6d3IC7R+M2OeQKRjl7df9uB2LptEqnNL5PIWcBsh9ayx7T
         2g9w==
X-Gm-Message-State: AOJu0Yy3tpBRtWwnbSYFImHAxrgtT8DiNvV+urF4p+Y5y81zCXqccDIH
	8gsF2t5dp9AAshv5ZoCIz3snxQ==
X-Google-Smtp-Source: AGHT+IHTG2Or7nHex78SXgFtLnlCCknVmk+JqbSPUpPVeu1LWA3NvZlbOygXREgny3gbuBb8VrRdkQ==
X-Received: by 2002:a17:90b:3613:b0:268:522a:e31 with SMTP id ml19-20020a17090b361300b00268522a0e31mr866650pjb.42.1691543138656;
        Tue, 08 Aug 2023 18:05:38 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090a280f00b00267eead2f16sm179426pjd.36.2023.08.08.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:05:38 -0700 (PDT)
Date: Tue, 8 Aug 2023 18:05:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: kprobes: simulate c.j instruction
Message-ID: <ZNLmX1wXu3ZivilA@ghost>
References: <cover.1690704360.git.namcaov@gmail.com>
 <6ef76cd9984b8015826649d13f870f8ac45a2d0d.1690704360.git.namcaov@gmail.com>
 <ZNLZxIRM5iIjmdcD@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNLZxIRM5iIjmdcD@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_180539_981732_8CEB6A3B 
X-CRM114-Status: GOOD (  25.12  )
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

On Tue, Aug 08, 2023 at 05:11:48PM -0700, Charlie Jenkins wrote:
> On Sun, Jul 30, 2023 at 10:27:07AM +0200, Nam Cao wrote:
> > kprobes currently rejects c.j instruction. Implement it.
> > 
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  arch/riscv/kernel/probes/decode-insn.c   |  3 ++-
> >  arch/riscv/kernel/probes/simulate-insn.c | 24 ++++++++++++++++++++++++
> >  arch/riscv/kernel/probes/simulate-insn.h |  1 +
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> > index 64f6183b4717..39adb07a342d 100644
> > --- a/arch/riscv/kernel/probes/decode-insn.c
> > +++ b/arch/riscv/kernel/probes/decode-insn.c
> > @@ -29,13 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
> >  	 * TODO: the REJECTED ones below need to be implemented
> >  	 */
> >  #ifdef CONFIG_RISCV_ISA_C
> > -	RISCV_INSN_REJECTED(c_j,		insn);
> >  	RISCV_INSN_REJECTED(c_jr,		insn);
> >  	RISCV_INSN_REJECTED(c_jal,		insn);
> >  	RISCV_INSN_REJECTED(c_jalr,		insn);
> >  	RISCV_INSN_REJECTED(c_beqz,		insn);
> >  	RISCV_INSN_REJECTED(c_bnez,		insn);
> >  	RISCV_INSN_REJECTED(c_ebreak,		insn);
> > +
> > +	RISCV_INSN_SET_SIMULATE(c_j,		insn);
> >  #endif
> >  
> >  	RISCV_INSN_SET_SIMULATE(jal,		insn);
> > diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> > index 7441ac8a6843..3ba45c612cd8 100644
> > --- a/arch/riscv/kernel/probes/simulate-insn.c
> > +++ b/arch/riscv/kernel/probes/simulate-insn.c
> > @@ -188,3 +188,27 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
> >  
> >  	return true;
> >  }
> > +
> > +bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
> > +{
> > +	/*
> > +	 *  15    13 12                            2 1      0
> > +	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
> > +	 *     3                   11                    2
> > +	 */
> > +
> > +	s32 offset;
> > +
> > +	offset  = ((opcode >> 3)  & 0x7) << 1;
> > +	offset |= ((opcode >> 11) & 0x1) << 4;
> > +	offset |= ((opcode >> 2)  & 0x1) << 5;
> > +	offset |= ((opcode >> 7)  & 0x1) << 6;
> > +	offset |= ((opcode >> 6)  & 0x1) << 7;
> > +	offset |= ((opcode >> 9)  & 0x3) << 8;
> > +	offset |= ((opcode >> 8)  & 0x1) << 10;
> > +	offset |= ((opcode >> 12) & 0x1) << 11;
> > +
> > +	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
> Can you use riscv_insn_insert_jtype_imm() from insn.h since it is
> already created? It will also sign extend for you. Don't worry about
> creating a similar function for the branches, I am in the process of
> refactoring the insn.h file.
> > +
> > +	return true;
> > +}
> > diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> > index 61e35db31001..4bd6c266e7d3 100644
> > --- a/arch/riscv/kernel/probes/simulate-insn.h
> > +++ b/arch/riscv/kernel/probes/simulate-insn.h
> > @@ -24,5 +24,6 @@ bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
> >  bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
> >  bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
> >  bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> > +bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
> >  
> >  #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
> > -- 
> > 2.34.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> Thanks,
> Charlie
Oh sorry, I forgot this was compressed. You can ignore the last message.
The changes look good. You can add:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
