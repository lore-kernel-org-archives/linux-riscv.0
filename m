Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A635C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VN+Eo7iWsZUfPbPmi4wEgVDGjK5ov9dfd/M+1v92Sr0=; b=KAffyMCyGxLaCI
	cOKWjyWQFPKLEFtQkXVcCYCR4veudfLu8LfSC7hqOiD1i+EwJJlkPz3PMvj2Xut3hQyaxziWz3VsL
	OjUeYzATNjxxdxiOgzxDQON5b/uyuJMNWEZFQ16W+hRSasF+626bcu4O4EFGOK0SDQCRS93YRZ6zb
	/CaTOrJ0Fd/uNEewST7xlC5tl15VTy3u2R9m8S6Pj5kWO6xCOMyNIjJ6MieG40Gi7S+GGYTIaBQzc
	WsH4HPvcXhHJlqsj00HOv/OAITwOpEQoAROks9TLXe+tMfr3e3+UWzRmaX3HPYXUr4qIPKO3FV/MM
	R9vVID9odT1Ukl5zHmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdQH-00DSF4-4n; Thu, 17 Nov 2022 11:51:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdQE-00DSCS-0Q
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 11:51:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ovdQ7-0003ht-Sb; Thu, 17 Nov 2022 12:51:03 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Thu, 17 Nov 2022 12:51:02 +0100
Message-ID: <3281765.mvXUDI8C0e@diego>
In-Reply-To: <CA+V-a8v4=vvCMNRfOtgA2LQN+O5S3w6oQJfY5ZdBtSHCKJ=Hcw@mail.gmail.com>
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de> <CA+V-a8v4=vvCMNRfOtgA2LQN+O5S3w6oQJfY5ZdBtSHCKJ=Hcw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_035110_077755_307B602D 
X-CRM114-Status: GOOD (  22.63  )
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

Am Dienstag, 15. November 2022, 15:28:27 CET schrieb Lad, Prabhakar:
> Hi Heiko,
> 
> Thank you for the patch.
> 
> On Thu, Nov 10, 2022 at 4:50 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > Alternatives live in a different section, so addresses used by call
> > functions will point to wrong locations after the patch got applied.
> >
> > Similar to arm64, adjust the location to consider that offset.
> >
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 79 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 77 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 694267d1fe81..026512ca9c4c 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -298,6 +298,74 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> >         return cpu_req_feature;
> >  }
> >
> > +#include <asm/parse_asm.h>
> > +
> > +DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> > +DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
> > +
> > +static inline bool is_auipc_jalr_pair(long insn1, long insn2)
> > +{
> > +       return is_auipc_insn(insn1) && is_jalr_insn(insn2);
> > +}
> > +
> > +#define JALR_SIGN_MASK         BIT(I_IMM_SIGN_OPOFF - I_IMM_11_0_OPOFF)
> > +#define JALR_OFFSET_MASK       I_IMM_11_0_MASK
> > +#define AUIPC_OFFSET_MASK      U_IMM_31_12_MASK
> > +#define AUIPC_PAD              (0x00001000)
> > +#define JALR_SHIFT             I_IMM_11_0_OPOFF
> > +
> > +#define to_jalr_imm(offset)                                            \
> > +       ((offset & I_IMM_11_0_MASK) << I_IMM_11_0_OPOFF)
> > +
> > +#define to_auipc_imm(offset)                                           \
> > +       ((offset & JALR_SIGN_MASK) ?                                    \
> > +       ((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) :    \
> > +       (offset & AUIPC_OFFSET_MASK))
> > +
> > +static void riscv_alternative_fix_auipc_jalr(unsigned int *alt_ptr,
> > +                                            unsigned int len, int patch_offset)
> > +{
> 
> I am yet to test this with my ASM code yet, but maybe can we move this
> to [0] so that other erratas can make use of it too?
> 
> [0] arch/riscv/kernel/patch.c

yeah, that sounds like a very good plan.

I also want to make the to_foo_imm macros shared.
I.e. right now they're just duplicated from the ftrace patching code.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
