Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CECC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrUDxKMTpG/gvrfPbhoSbEuGFfjU7yw1XJ18HTSOIWY=; b=Ln27OGHm8fPB4L
	y+ZMsXD11V3ngGYWHCIKmYydbntNUCyhE+2vSYGjZO5R+N9lOPkusn9+iWiqvxF1vyi4s30M70aM2
	L7Oi9+wL44R4gpBY0gZzZfEJACg5U1H0OwjPVpJUovXQBoICxf0XRSu5TtoXCCJemftPfea957HrS
	PiLfdl1eFOy20BEpNsxtx3xhBNovoR+W8wQdqE0YN/MfUXW22Cq+0XB05c0cuSAeCwHF+5/qWZfqt
	CWJ+ztg+TvtPdUaYOY4Q2ge3qUtlK84iUHYEp8rHKidm6AIOMb1AGDIse19QDlprAG/wuooMYqu6k
	E0XKMC1uvWeGg4w1o2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbY6-00Bh3u-Mn; Wed, 11 Jan 2023 13:53:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbY4-00Bh1E-9a
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:53:49 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFbXy-0005rb-Dp; Wed, 11 Jan 2023 14:53:42 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Date: Wed, 11 Jan 2023 14:53:41 +0100
Message-ID: <2873113.tIAgqjz4sF@diego>
In-Reply-To: <Y763FrvFkrNGkIDN@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de> <20230109181755.2383085-4-heiko@sntech.de> <Y763FrvFkrNGkIDN@xhacker>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_055348_362200_1A088A58 
X-CRM114-Status: GOOD (  26.35  )
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

Hi,

Am Mittwoch, 11. Januar 2023, 14:18:14 CET schrieb Jisheng Zhang:
> On Mon, Jan 09, 2023 at 07:17:53PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Alternatives live in a different section, so addresses used by jal
> > instructions will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
> 
> I already submitted this in a month ago.
> https://lore.kernel.org/linux-riscv/20221204174632.3677-2-jszhang@kernel.org/

Yep, though the now merged base series for the call fixups changed a lot
since that. With changes needed as we discussed in your series.

As the change for the jal fixer itself was this small and I needed it for
my work, I did just go ahead and implemented it so I could move forward.


I'm not that attached to the authorship, so if you want we can set you as
author or Co-Developed-by or so that is just fine.


Heiko


> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/kernel/alternative.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index 6212ea0eed72..985c284fe9f4 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -79,6 +79,21 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> >  	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> >  }
> >  
> > +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > +{
> > +	s32 imm;
> > +
> > +	/* get and adjust new target address */
> > +	imm = riscv_insn_extract_jtype_imm(jal_insn);
> > +	imm -= patch_offset;
> > +
> > +	/* update instructions */
> > +	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> > +
> > +	/* patch the call place again */
> > +	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > +}
> > +
> >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> >  				      int patch_offset)
> >  {
> > @@ -106,6 +121,18 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> >  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> >  							 insn, insn2, patch_offset);
> >  		}
> > +
> > +		if (riscv_insn_is_jal(insn)) {
> > +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> > +
> > +			/* don't modify jumps inside the alternative block */
> > +			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&
> > +			    (alt_ptr + i * sizeof(u32) + imm) < (alt_ptr + len))
> > +				continue;
> > +
> > +			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> > +						  insn, patch_offset);
> > +		}
> >  	}
> >  }
> >  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
