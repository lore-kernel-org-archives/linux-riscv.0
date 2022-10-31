Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A50FA3740
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qe1RJCZc4OkkQ+Dg2vLrXE0/IVY+Jzaljp0ijCJOZGY=; b=sIn9cF5OKaru4r
	92FFSisJVar8o1o783DRHP75MqoLSQC6VSrSu4ieU54ggV6KoOC36LmiwVYmfk6ojLNRS0APOuZGv
	tDVMuly+EP2CZ8qXI56q4EtTlc/o2pCkrfoV/uU8rAizSd1eawkLcXnXOiVk4xtko2BRmfqFRPnsD
	MYiIX75zwfwHBPA26VS6DRqqOdN2bpg1VL42ch94nlNse3Qf6INiO52bbB21bZ6k1BAGgyctMKbIP
	Rt/3qCAMd+Xo1shsTw8+eSviy0K1rMZoTiwv8Wb2bXASJBeR0ZAkS8iQZZItpuXNH9JmUEEiFvy49
	wasJb6n1g8y+vxbl5vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQ6F-009ZLW-Gg; Mon, 31 Oct 2022 08:24:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQ64-009ZEG-OQ
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:24:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id z18so11340855edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+xNPkkLzOzdK/KsVClvjrUJ1F347K5PcLVmBVuX5xU=;
        b=AC5o3gC6RxiPVxE+QCBa/1WF3ll4ssgXU+0cQdbDTDJ3m10r7ap4/ScwyRR8yhgc9u
         XhYm5P93bq5gJQxof2LS7hyX8on/T9JeeDQrJwAboqcLsIcM7unqMGqEgYklqV8k1jkw
         x+pal5ha3nZyCf2BY39vtcQFhtDBM+8lUr78D5vvkr8QxnvShTYPuB6D9E30BtHERrRZ
         dm8BrXR9ORSn/bRHRsBrSdE+129b9dwj4biJ1+LDX/D0zcj4UOUDCRMAAjls4nvAWsPy
         s9MAy2jE/lMuX2LBZ/CemeOQ9ZLv9gcJPK/DWL7QzISfEAon/9qhWgDfWrxAuwThLne2
         7OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+xNPkkLzOzdK/KsVClvjrUJ1F347K5PcLVmBVuX5xU=;
        b=4RQqgRnCsf8mi+JEBIZdX8SXT5Bsn6Lkj7bTR2VcFV6Ak5uE+w/VYl6+DUrYvEBd2Q
         tZqBqzSc44pl3IwjJnNl6SVtDaB4T6e7YkMc83dNhlinYPWmuvSpuXFXYEphEoYCAMDe
         ZQceoscr/MhMXNKUmgTCUrRKehbAfDGNuHqnO92TxFuNbcJW5z3a0TzHbV/KmM307c7D
         rEzbdZWNhq6vtIPnC6QpOibn74nkPdcAjYadiSk6nvBZF1Lc408K5QsCwu2Py+Sdp6AE
         r29VWM5zLJu+HSHSqjIAbjXQgG/PTBDrAd9tDiOzfAVc/+FVc/QLVFOLDbnPRQ0V8SKA
         vb7g==
X-Gm-Message-State: ACrzQf07VHJsLhxFslImWRcTVnEpEQ2lNLMl1HBcoDTrgFVUYLIH2hNy
	GxhMVnib1FCpUGjgbKZVfJM4pA==
X-Google-Smtp-Source: AMsMyM7m71V44v6JxpNh6fZ+++qdn/txLze55mh693SaECCCZ9TSNjQjY07HHz7i+lMtXAhb5mJlkw==
X-Received: by 2002:a05:6402:380a:b0:451:ae08:7a6c with SMTP id es10-20020a056402380a00b00451ae087a6cmr11916047edb.161.1667204678394;
        Mon, 31 Oct 2022 01:24:38 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kx25-20020a170907775900b0073ae9ba9ba8sm2703089ejc.3.2022.10.31.01.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:24:38 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:24:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 8/9] RISC-V: lib: Use named labels in memset
Message-ID: <20221031082437.tyucqlssemebfan7@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-9-ajones@ventanamicro.com>
 <Y173j6+YaxpLgf4E@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y173j6+YaxpLgf4E@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_012440_828869_4661DAD5 
X-CRM114-Status: GOOD (  26.70  )
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

On Sun, Oct 30, 2022 at 10:15:43PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:46PM +0200, Andrew Jones wrote:
> > In a coming patch we'll be adding more branch targets. Let's
> 
> rather minor nit: I don't think "In a coming patch" will be
> particularly meaningful if anyone does some history diving.

Yes, I struggle with these. I think "next patch" is typically frowned upon
because things get reordered and then 'next' is no longer appropriate, but
it is good to convey somehow that while this patch doesn't provide much
use on its own it does serve a preparation purpose. Maybe I should just
write "Improve readability and prepare for extensions which will add
more labels..."

I'll do something like that for v2.

> 
> > change the numeric labels to named labels to make it easier
> > to read and integrate with.
> > 
> > No functional change intended.
> 
> It looks fine to me..
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/lib/memset.S | 29 +++++++++++++++--------------
> >  1 file changed, 15 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index e613c5c27998..74e4c7feec00 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -13,7 +13,7 @@ WEAK(memset)
> >  
> >  	/* Defer to byte-oriented fill for small sizes */
> >  	sltiu	a3, a2, 16
> > -	bnez	a3, 4f
> > +	bnez	a3, .Lfinish
> >  
> >  	/*
> >  	 * Round to nearest XLEN-aligned address
> > @@ -21,17 +21,18 @@ WEAK(memset)
> >  	 */
> >  	addi	a3, t0, SZREG-1
> >  	andi	a3, a3, ~(SZREG-1)
> > -	beq	a3, t0, 2f		/* Skip if already aligned */
> > +	beq	a3, t0, .Ldo_duff	/* Skip if already aligned */
> >  
> >  	/* Handle initial misalignment */
> >  	sub	a4, a3, t0
> > -1:
> > +.Lmisaligned1:
> >  	sb	a1, 0(t0)
> >  	addi	t0, t0, 1
> > -	bltu	t0, a3, 1b
> > +	bltu	t0, a3, .Lmisaligned1
> >  	sub	a2, a2, a4		/* Update count */
> >  
> > -2: /* Duff's device with 32 XLEN stores per iteration */
> > +.Ldo_duff:
> > +	/* Duff's device with 32 XLEN stores per iteration */
> >  	/* Broadcast value into all bytes */
> >  	andi	a1, a1, 0xff
> >  	slli	a3, a1, 8
> > @@ -48,7 +49,7 @@ WEAK(memset)
> >  	add	a3, t0, a4
> >  
> >  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> > -	beqz	a4, 3f			/* Shortcut if no remainder */
> > +	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
> >  	neg	a4, a4
> >  	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
> >  
> > @@ -57,13 +58,13 @@ WEAK(memset)
> >  
> >  	/* Jump into loop body */
> >  	/* Assumes 32-bit instruction lengths */
> > -	la	a5, 3f
> > +	la	a5, .Lduff_loop
> >  #ifdef CONFIG_64BIT
> >  	srli	a4, a4, 1
> >  #endif
> >  	add	a5, a5, a4
> >  	jr	a5
> > -3:
> > +.Lduff_loop:
> >  	REG_S	a1,        0(t0)
> >  	REG_S	a1,    SZREG(t0)
> >  	REG_S	a1,  2*SZREG(t0)
> > @@ -98,17 +99,17 @@ WEAK(memset)
> >  	REG_S	a1, 31*SZREG(t0)
> >  
> >  	addi	t0, t0, 32*SZREG
> > -	bltu	t0, a3, 3b
> > +	bltu	t0, a3, .Lduff_loop
> >  	andi	a2, a2, SZREG-1		/* Update count */
> >  
> > -4:
> > +.Lfinish:
> >  	/* Handle trailing misalignment */
> > -	beqz	a2, 6f
> > +	beqz	a2, .Ldone
> >  	add	a3, t0, a2
> > -5:
> > +.Lmisaligned2:
> >  	sb	a1, 0(t0)
> >  	addi	t0, t0, 1
> > -	bltu	t0, a3, 5b
> > -6:
> > +	bltu	t0, a3, .Lmisaligned2
> > +.Ldone:
> >  	ret
> >  END(__memset)
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
