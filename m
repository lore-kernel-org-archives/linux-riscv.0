Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2997BC54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssQfidZ0Xn7aaPeIsuINFa/AleyuSIPGvUZKsa1TAAc=; b=eqXffaQ6a6COv0
	4n5KGeK1/SOrnX/9xTsWQVECQISeLqlBkfQZSEOjZFCmWqu+dZdLL11ZJvgTNHoLIu0tJDlKHmwHd
	xmv7BMuwBawDt2xdC8C3K8AqMXyXgdf/nClq5hZzLmMl1LdRHQ50bixrFd0KBAmGNgMtxiiRK65g4
	qV3TwQIM2rfulu7Fb1SlnRvdH/kbiaekLmZI+PVlRWQAwjICYKo11Ni87/yXK7pjwdy8kdgWNPUI2
	RyXD/tLzD6iA8CRtSo8ffjz2w40EYiocHaeaWCB2tuUyf9kwskNh+xijB6gPx52TG39qg+x3C8bcu
	io5JccnWDDInNc6Ouo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFera-00COzd-7L; Wed, 11 Jan 2023 17:26:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFerB-00COll-7h
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 17:25:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83B4461D7C;
	Wed, 11 Jan 2023 17:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B146C433F0;
	Wed, 11 Jan 2023 17:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457944;
	bh=R1vg8o58O8/I6LrkvWmGsYfPZcDbM2eJ3WMV1AXgCK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HicwLINAXaQWcnrAhaX0FFkEBG6YnO+MCg4VHaVq1XZdwyzCi4KjfZBVmtgMLBT0M
	 IxkPE+kc+0iLRVoGESJs0RdrmhWWCH/DsYQmdWQAgPB8z0oMrf/Pe9d952w4EWMpOC
	 /d+Mi1KKhUcKKSa/pLPBqO8G3XWGVWSomu+4sDAtKbj5pJYbsyVYa17lcPXeLs5zhF
	 cl8/+xW+EQdZEMEojMZeDV33Yeqgf84F5PAoSFwcVrZwN0BM7xHksqQsEEEpBJ9Em3
	 9X3zti/3rTq5sayGCp0GZhbL4izL4I9Q65qOK9zTq0FfnEbxalBUUHvNdxktGaY5xz
	 O8wjTb9hm7/Vg==
Date: Thu, 12 Jan 2023 01:15:27 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Message-ID: <Y77ur5WyfTCCliaV@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-4-heiko@sntech.de>
 <20230110092809.nvad7vac2liivqs3@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230110092809.nvad7vac2liivqs3@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092545_384239_BCDD9BF0 
X-CRM114-Status: GOOD (  28.96  )
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

On Tue, Jan 10, 2023 at 10:28:09AM +0100, Andrew Jones wrote:
> On Mon, Jan 09, 2023 at 07:17:53PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Alternatives live in a different section, so addresses used by jal
> > instructions will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
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
> 
> instruction
> 
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
> 
> I think we should add an i++ here. There's not a problem now, since we're
> only adding a fixup for jal, not jalr, but we should future-proof this and
> there's no reason to revisit an already fixed-up instruction anyway.

Hi Andrew,

IMHO, adding the i++ here belongs to the aupic jalr imm patching
commit, since the patch has been merged to riscv-next, I think
it's better to add a seperate patch to do this improvement, thus
I didn't update as commented here in my v3 series.

Thanks

> 
> >  		}
> > +
> > +		if (riscv_insn_is_jal(insn)) {
> > +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> > +
> > +			/* don't modify jumps inside the alternative block */
> 
> Don't
> 
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
> > -- 
> > 2.35.1
> >
> 
> Otherwise
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
