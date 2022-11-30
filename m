Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C5FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEwoYIbjksgPzlJEoqXxRQOdKkAHguyZe7/f+Rsp/FQ=; b=oYdOcYj+Oipk7U
	xCpnRdpgXsV1nGRvNGma6LUD+5YgCwOIQA4+icixjffc6Fae9Zg6Utsgmfzt7yriURrzwwaiJzKlH
	bjNpPkNtDYCXfXN2W4dNEA054GkTH6/un3ERVhaggQTJ+PXC4IrmWbEc3Jakusx7WDpEuZVmLT7yE
	T5Qr65LEdI7skkEgnJYe/JJB+fiLFLR6WSsYOd4dlCxRvETZLFzixkztZRCkB2W31BfhSByABJ3zm
	cdvhQa0Q3jWqTruh5NSl1lgGirVUiYl4oOYHFTa+XDgn0XfK/0h0VGzcAV9r17aOhqSc02bkWezX1
	dL5efHRfuGiyOxV8pLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OSo-00H6Vf-Gp; Wed, 30 Nov 2022 14:53:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OSd-00H6QD-Ka
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:53:20 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0OSY-0002f3-Lu; Wed, 30 Nov 2022 15:53:14 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 04/13] RISC-V: Move riscv_insn_is_* macros into a common header
Date: Wed, 30 Nov 2022 15:53:13 +0100
Message-ID: <9886285.T7Z3S40VBb@diego>
In-Reply-To: <Y4aRK9CvoH56A+Ai@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-5-heiko@sntech.de> <Y4aRK9CvoH56A+Ai@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_065319_707396_03E6695D 
X-CRM114-Status: GOOD (  23.33  )
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

Am Mittwoch, 30. November 2022, 00:09:31 CET schrieb Conor Dooley:
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
> function created?

Yep, simulate-insn.c only actually defined these functions, so the original
macro just defined empty prototypes for the rest.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
