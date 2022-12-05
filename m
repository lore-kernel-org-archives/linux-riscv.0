Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LeYbUfbeDdxcDcoDsPNLa8v+T3Bb/FPNxyjideISos=; b=QQwrZcK4mfQy9M
	hxxcqDyzPobhAlkFI1GsvDsvoiZohJ2BI9Xds7U3XNEyqbOlfPcEdjFZ8mBQfo+f06rhhMxhkEwDg
	3NKOXMRcr7z+bYeYUPrRhsCN95czIkIPgnbWfiRS5fNk+sTyd9dgJ38d8J6umlDKELVbbPvblLVjk
	hwoVx2aPbptKPu3ugsaB8cjHN+R1OYOQmkyXuBl7PZR3wzLOSGSX6u6HnI+FQGaTXfTT/THbDMBJN
	QTNbNlT70eR0OF385spwNkYgDldYjoSwtZyq3xsyFDtmAdLOMva+N2WS/nWojO1/q0q/JX9N2dj+Y
	ZO1IANAbTLE5uSXEiAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DfW-005DgB-2N; Mon, 05 Dec 2022 15:46:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DeE-005BX6-Dh; Mon, 05 Dec 2022 15:44:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFD24B81120;
	Mon,  5 Dec 2022 15:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17496C433D6;
	Mon,  5 Dec 2022 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670255087;
	bh=kLds0EAX38PcsH1RVZzcV0FMIXhwc9AbQWevfB3I1bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxhlDq1YidqwKK8oO7edrYIs5R41zn9FkQPbVJG5FFEssLk9fSoYoCEmfcGR9YJyh
	 FCSIX/yOMblm5cGMXHw297/HuPK/FI87G5UtzfTOUVBFVM3MhHCZ60AgLLzq+ZmqaM
	 OvTvJ453ZhlxLyHw6E9SWDMJsSEM0N0EC/mOz3u6I6xLGEOMf0DONP40o0EZFLEnwX
	 81/jYhETOrXjorpTXlNJJifiNwV7z45rMNiFvVj4gEPVxdMhQyMasK7gCnMaUkRXWB
	 d9oWxkJz0amvzK2ZQOjE16BV+OCacMyug7rWmRn4MTQ8v4t86b1jENoOuU0UHLVXSU
	 /jUFBSQkVBEzQ==
Date: Mon, 5 Dec 2022 23:34:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y44PmvL878v57CzZ@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-2-jszhang@kernel.org>
 <20221205145710.xzb4prrc44gv7mwm@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205145710.xzb4prrc44gv7mwm@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_074450_802060_5CDEE44F 
X-CRM114-Status: GOOD (  29.62  )
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

On Mon, Dec 05, 2022 at 03:57:10PM +0100, Andrew Jones wrote:
> On Mon, Dec 05, 2022 at 01:46:20AM +0800, Jisheng Zhang wrote:
> > Alternatives live in a different section, so offsets used by jal
> > instruction will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/alternative.h |  2 ++
> >  arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c       |  3 +++
> >  3 files changed, 43 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index c58ec3cc4bc3..33eae9541684 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t length);
> >  
> >  void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> >  				      int patch_offset);
> > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > +			       int patch_offset);
> >  
> >  struct alt_entry {
> >  	void *old_ptr;		 /* address of original instruciton or data  */
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index 292cc42dc3be..9d88375624b5 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> >  	}
> >  }
> >  
> > +#define to_jal_imm(value)						\
> > +	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) | \
>                                                                  ^ RV_J_IMM_10_1_OPOFF

Good catch! I was lucky when testing the whole series ;) will fix it in
newer version.

> 
> > +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> > +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> > +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> 
> Should put () around value

good idea, previously, I just follow to_jalr_imm(), will update it in
newer version.

> 
> > +
> > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > +			       int patch_offset)
> > +{
> > +	int num_instr = len / sizeof(u32);
> > +	unsigned int call;
> > +	int i;
> > +	int imm;
> > +
> > +	for (i = 0; i < num_instr; i++) {
> > +		u32 inst = riscv_instruction_at(alt_ptr, i);
> > +
> > +		if (!riscv_insn_is_jal(inst))
> > +			continue;
> > +
> > +		/* get and adjust new target address */
> > +		imm = RV_EXTRACT_JTYPE_IMM(inst);
> > +		imm -= patch_offset;
> > +
> > +		/* pick the original jal */
> > +		call = inst;
> > +
> > +		/* drop the old IMMs, all jal imm bits sit at 31:12 */
> > +		call &= ~GENMASK(31, 12);
> 
> It'd be nice if this had a define.
> 
> > +
> > +		/* add the adapted IMMs */
> > +		call |= to_jal_imm(imm);
> > +
> > +		/* patch the call place again */
> > +		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
> > +	}
> > +}
> > +
> >  /*
> >   * This is called very early in the boot process (directly after we run
> >   * a feature detect on the boot CPU). No need to worry about other CPUs
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index ba62a4ff5ccd..c743f0adc794 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> >  							 alt->alt_len,
> >  							 alt->old_ptr - alt->alt_ptr);
> > +			riscv_alternative_fix_jal(alt->old_ptr,
> > +						  alt->alt_len,
> > +						  alt->old_ptr - alt->alt_ptr);
> >  		}
> >  	}
> >  }
> > -- 
> > 2.37.2
> >
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
