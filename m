Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FFFC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZFZqlIbYOmxXLh4ZVP6Tq1GifDTvDu70Okpu9TxnMI=; b=N+h8XoyeB9Nh4V
	4CklU0P3EP4aeWkUuIa+rltozyeMEM1ekCCb5XWQ0cHtfX4aS00IHrcyJ1w4L2kiARKLDzgwCihs+
	0V2iFrTONuztKmX83cP3/jh/aG0mEOeQ/nZ+holuaq0qywpW4gGWuANgAcLTGZHXzpq8Q2J4+YgVN
	TaTWUDuM7/E4+cCBA4QBz5z2Cmi94AaSnC/ebvlHyGBnIiZmZEKdUdqanNhI+qyMBEQzVSMwoWGTn
	y6LfspO6BbTKGSAIQR+Vr84q7je1i2QDws+7jash1abKVACfm0x29kEHSWlza3QIoEhwOvT3RxCOQ
	whMjubCa9TCuIiaDbTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09oV-00BcGd-2o; Tue, 29 Nov 2022 23:14:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09oS-00BcGB-MV
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:14:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14D1561941;
	Tue, 29 Nov 2022 23:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A126C433C1;
	Tue, 29 Nov 2022 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669763691;
	bh=Q7UwTAa1OQzOoim1v9HHGlbIyF3MNyfG7aUT1o/vYpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSG028ecTpW9/zYzldn8Z42gmAz/0futx5c1kEzKA/HTFYOAvLg1eiQKHJnHnd0Lt
	 Vm11TRKZtavPYR7wOKwoj+EORBEmtd7M3nNtB4cwUCw14f5qA8tKLIgXY6tx/oFAfH
	 q0PTvrfuB3mWzoJvk/XHufjyI0uD8FGAqdAx3tj+zaM0Y9WJ9/Lb3v4eyMgtzGv02F
	 +BxzdzdTrbAxq7rEdQdoa61cU53FBl/zZh51H0jkRb/HwiJF9I1G2uxjsBYEQu737e
	 6hmzwO/uykOIoc56MbodNWwnW0Vvxp6AHmGOuKo+3dH1DvZfUrnt/CbOREGThzZGCF
	 qSdHGS/KuMquw==
Date: Tue, 29 Nov 2022 23:14:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 04/13] RISC-V: Move riscv_insn_is_* macros into a
 common header
Message-ID: <Y4aSZ3iGBR1PkRlN@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-5-heiko@sntech.de>
 <Y4aRK9CvoH56A+Ai@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4aRK9CvoH56A+Ai@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_151452_830770_C5092659 
X-CRM114-Status: GOOD (  23.13  )
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

On Tue, Nov 29, 2022 at 11:09:36PM +0000, Conor Dooley wrote:
> On Mon, Nov 28, 2022 at 11:26:23AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Right now the riscv kernel has (at least) two independent sets
> > of functions to check if an encoded instruction is of a specific
> > type. One in kgdb and one kprobes simulate-insn code.
> > 
> > More parts of the kernel will probably need this in the future,
> > so instead of allowing this duplication to go on further,
> > move macros that do the function declaration in a common header,
> > similar to at least aarch64.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/parse_asm.h       | 41 ++++++++++++++++----
> >  arch/riscv/kernel/kgdb.c                 | 49 ++++++++----------------
> >  arch/riscv/kernel/probes/simulate-insn.h | 26 +++----------
> >  3 files changed, 54 insertions(+), 62 deletions(-)
> 
> > diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> > index cb6ff7dccb92..29fb16cd335c 100644
> > --- a/arch/riscv/kernel/probes/simulate-insn.h
> > +++ b/arch/riscv/kernel/probes/simulate-insn.h
> > @@ -3,14 +3,7 @@
> >  #ifndef _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
> >  #define _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
> >  
> > -#define __RISCV_INSN_FUNCS(name, mask, val)				\
> > -static __always_inline bool riscv_insn_is_##name(probe_opcode_t code)	\
> > -{									\
> > -	BUILD_BUG_ON(~(mask) & (val));					\
> > -	return (code & (mask)) == (val);				\
> > -}									\
> > -bool simulate_##name(u32 opcode, unsigned long addr,			\
> > -		     struct pt_regs *regs)
> > +#include <asm/parse_asm.h>
> >  
> >  #define RISCV_INSN_REJECTED(name, code)					\
> >  	do {								\
> > @@ -30,18 +23,9 @@ __RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
> >  		}							\
> >  	} while (0)
> >  
> > -__RISCV_INSN_FUNCS(c_j,		0xe003, 0xa001);
> > -__RISCV_INSN_FUNCS(c_jr,	0xf007, 0x8002);
> > -__RISCV_INSN_FUNCS(c_jal,	0xe003, 0x2001);
> > -__RISCV_INSN_FUNCS(c_jalr,	0xf007, 0x9002);
> > -__RISCV_INSN_FUNCS(c_beqz,	0xe003, 0xc001);
> > -__RISCV_INSN_FUNCS(c_bnez,	0xe003, 0xe001);
> > -__RISCV_INSN_FUNCS(c_ebreak,	0xffff, 0x9002);
> > -
> > -__RISCV_INSN_FUNCS(auipc,	0x7f, 0x17);
> > -__RISCV_INSN_FUNCS(branch,	0x7f, 0x63);
> > -
> > -__RISCV_INSN_FUNCS(jal,		0x7f, 0x6f);
> > -__RISCV_INSN_FUNCS(jalr,	0x707f, 0x67);
> > +bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
> > +bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
> > +bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
> > +bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> 
> I assume the other ones didn't actually have a user and so didn't need a
> function created? Code movement here looks fine. Dropping the double
> definitions is always nice :)
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I should've waited for allmodconfig on this particular commit to finish:
/stuff/linux/arch/riscv/kernel/probes/decode-insn.c:43:2: error: call to undeclared function 'riscv_insn_is_auipc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
        RISCV_INSN_SET_SIMULATE(auipc,          insn);
        ^
/stuff/linux/arch/riscv/kernel/probes/simulate-insn.h:20:7: note: expanded from macro 'RISCV_INSN_SET_SIMULATE'
                if (riscv_insn_is_##name(code)) {                       \
                    ^
<scratch space>:62:1: note: expanded from here
riscv_insn_is_auipc
^
1 error generated.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
