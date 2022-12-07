Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE7C63705
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 22:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0UQi2MWDAOWlEYzO6opnqVQcw8VmfJA/JVY6yJ88v4=; b=tB1LkKujN+c/D7
	4hjY+2z9wYLiKjWer+enRY4bmmRjefjF5Do1AByPqSKwLNIdFWXMhVpYvK+07EeVDOGR6Zi/zD18R
	OqLExwAUrmNs19Hdpsj3sSpsbYForGXNqXF8ZlO3VAl2Wx11d1TD7HOPB87Tpl5BOLtprg3beHbKK
	PyvRK6NiFr45mQpNVx4tZfC23arCTluaSqnZlX5SzCpictNssBm9IrMO17WAHzdCsB7hwi8gY3fWC
	X1ihi4gTWN2Y1NqdyBKaECctfCPD6G5LlneEsUWISF8ZC63WiwzRH3cAn98tAorcKVKA0mVaqhaz2
	FE5LweDFPdBr6ZCj35hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p332p-00EN0R-Na; Wed, 07 Dec 2022 22:37:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p332m-00EMpA-U7
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 22:37:38 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p332i-0006NF-HA; Wed, 07 Dec 2022 23:37:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com, jszhang@kernel.org
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Wed, 07 Dec 2022 23:37:30 +0100
Message-ID: <4261102.ElGaqSPkdT@phil>
In-Reply-To: <Y5D8CHkJZGmQKxdh@spud>
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-13-heiko@sntech.de> <Y5D8CHkJZGmQKxdh@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_143737_010183_A33AF327 
X-CRM114-Status: GOOD (  43.28  )
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

Am Mittwoch, 7. Dezember 2022, 21:48:08 CET schrieb Conor Dooley:
> On Wed, Dec 07, 2022 at 07:08:21PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Alternatives live in a different section, so addresses used by call
> > functions will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/alternative.h |  3 ++
> >  arch/riscv/kernel/alternative.c      | 56 ++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c       |  5 ++-
> >  3 files changed, 63 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 6511dd73e812..1bd4027d34ca 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
> >  void __init apply_early_boot_alternatives(void);
> >  void apply_module_alternatives(void *start, size_t length);
> >  
> > +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > +				   int patch_offset);
> > +
> >  struct alt_entry {
> >  	void *old_ptr;		 /* address of original instruciton or data  */
> >  	void *alt_ptr;		 /* address of replacement instruction or data */
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index a7d26a00beea..c29e198ed9df 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -15,6 +15,8 @@
> >  #include <asm/vendorid_list.h>
> >  #include <asm/sbi.h>
> >  #include <asm/csr.h>
> > +#include <asm/insn.h>
> > +#include <asm/patch.h>
> >  
> >  struct cpu_manufacturer_info_t {
> >  	unsigned long vendor_id;
> > @@ -53,6 +55,60 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
> >  	}
> >  }
> >  
> > +static u32 riscv_instruction_at(void *p)
> > +{
> > +	u16 *parcel = p;
> > +
> > +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> 
> I feel bad for not mentioning this before - can we replace this magic 16
> with something self documenting?
> 
> > +}
> > +
> > +static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 insn1, u32 insn2, int patch_offset)
> > +{
> > +	/* pick the original auipc + jalr */
> > +	u32 call[2] = { insn1, insn2 };
> > +	s32 imm;
> > +
> > +	/* get and adjust new target address */
> > +	imm = riscv_insn_extract_utype_itype_imm(insn1, insn2);
> > +	imm -= patch_offset;
> > +
> > +	/* update instructions */
> > +	riscv_insn_insert_utype_itype_imm(call, imm);
> > +
> > +	/* patch the call place again */
> > +	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> > +}
> 
> Obv. I have not left R-b tags on stuff without trying to understand
> what's going on, but from a lay-observer point of view, I think these
> function names & flow does a good job of explaining some of the black
> magic in this neck of the woods.
> 
> > +
> > +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > +				      int patch_offset)
> > +{
> > +	int num_instr = len / sizeof(u32);
> 
> instr...
> 
> > +	int i;
> > +
> > +	/*
> > +	 * stop one instruction before the end, as we're checking
> > +	 * for auipc + jalr
> > +	 */
> > +	for (i = 0; i < num_instr; i++) {
> > +		u32 inst = riscv_instruction_at(alt_ptr + i * sizeof(u32));
> 
> ...inst...
> 
> > +
> > +		/* may be the start of an auipc + jalr pair */
> > +		if (riscv_insn_is_auipc(inst) && i < num_instr - 1) {
> 
> ...insn.
> 
> Is there a reason for that?

I guess more of a generational issue - with the code spanning
too much time :-)

So poll question, what would be preferred?
I think I remember seeing all of them somewhere, so I'm unsure what
to standardize on.

> 
> Also, I've gotten myself slightly confused about the loop. You "stop one
> instruction before the end" but the main loop goes from 0 -> num_instr.
> The inner loop then checks for i < num_instr - 1. What am I missing that
> prevents the outer loop from stopping at num_instr - 1 instead?

The idea with this is to allow a
	if(riscv_insn_is_jal(inst))
		riscv_alternative_fix_jal(...)

etc, and everything else is a single instruction so needs one more
loop iteration, only for auipc+jalr do we want to stop one earlier.

So to get this alternatives_fix_offsets() main entry point I
made the loop do the one iteration more again.


> > +			u32 inst2 = riscv_instruction_at(alt_ptr + (i + 1) * sizeof(u32));
> > +
> > +			if (!riscv_insn_is_jalr(inst2))
> > +				continue;
> > +
> > +			/* call will use ra register */
> 
> Super minor, but "call will use ra register" is a little unclear. As
> written, it makes perfect sense when you've been staring at this code,
> but not so much if you're passing through.. How about:
> /* if this instruction pair is a call, it will use the ra register */

sure :-)

> 
> > +			if (RV_EXTRACT_RD_REG(inst) != 1)
> > +				continue;
> >
> 
> All minor stuff though, so you can re-add my R-b either way:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

thanks :-)

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
