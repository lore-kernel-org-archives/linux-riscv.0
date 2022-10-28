Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFEFA3742
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rreLNE4CQdjk/3ot3kE10uxRoRmSgB3e77yK1RNoINI=; b=vZuVzB1oA2gQNi
	TQ92UAymSXO/SMGSibsVeRQL00jHr5RWBS3kl5mfILyYON79t97tJ4kQy1WWon9y3ZRqwv0el/HY+
	IzGZA8fQHysyR9DoEKVAvUqr1indtaCOPYoAqduojS0WxkveC6gndnWwiESrwk7+JS/G1yecDowGw
	uVqrJ/INatBd3KhLFmpUcZaaID52ngm9623z9VmYRkjfQKhDx+pdp8HvjFhJ6Nlwal46QFaqx6NR0
	eODGlaxOUu5ks6HGjubda1Xb9U8ENOtPr41ca6xJTPI5dlNj8tI9Ro7UZ6jUXYHIcUFrhwWz6O/yw
	l5KmZf3vmTBWNoVCG4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRlM-000iss-4z; Fri, 28 Oct 2022 15:59:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRio-000hNm-Qb
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 15:56:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so5673806wms.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6E7H3z2d3Ny84B+WxrT0Nbdu+75wu0zFUmTx14Wpg50=;
        b=nbqBckQAHBvrPJF/H9TfzY++8HH2/irCn0kFwVbxdkL68nu7vQt06B0LNT5DqO4Fzd
         zqgV4erp4yxuO3eRsyDPuzFJE51v8Q8kHummVss1t+zCOrXyF9exwGfyH2RNHKtnvstP
         snIxVgYMIuikCgsoE9mbQE9Rd+xxGy8Y0ezc8qhmdSxxHFQZI4KjOhSZG0hR5/YlJOiR
         bSkt94aGPrIxW39+YujLpjIrghTQp8WObjBfpz5XktfobC2ii0E/bzZgjitoqGpE6259
         XkoQk3l5zvGoCciytSZaduELL7j+XrxtDjtskpxcX2+gMDCKePFPYjjIrKKh0sbhFfTe
         xj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E7H3z2d3Ny84B+WxrT0Nbdu+75wu0zFUmTx14Wpg50=;
        b=Q2XlVhYH5kXx36V2uQNGJAbjTBSVmPwI7QakiGMkjMKtZYLvbjhhHVLvzJZojGjLcM
         ETQOT9fmhRI1YyyUGeL63bE6zeWXJ4k2tP9UjGMeDgOkk5WuFNdPzbTKzNlwrx/iNt5S
         YGhYKfVH/utRkgsHy1MVlHkOuL2nf1ad/64PxMilzUL2F4VdeEBqp0muPNfAjQ2KNLxg
         4jBlaK/hLGnrOGiQCESrEeURk6G5CTzyikzll9yRv+eUHE1pze4Py5NBHFR0P5YEqCHv
         as8darMLwNMYmu2WcSVQisWEu7VsWo1EcyRH0+v9v1sI0PuYqApSG7iSHBiIjJLDixe2
         Cj8Q==
X-Gm-Message-State: ACrzQf1wHmTsfGz93RvzjneW9+c8Qz3pPHrWWkUcWg3nufRSsOPbT1xl
	qWjl9Y/hgBRMOBhNVd94O4m5uwODLhIz3w==
X-Google-Smtp-Source: AMsMyM5U2LaaKmL6vt6fuVoQdXG5o+yVfu3AmYdu8umZWE9mtbbdus+rPE6twT1sTqSclMyna18JqA==
X-Received: by 2002:a05:600c:4e86:b0:3cf:5ec5:d3fd with SMTP id f6-20020a05600c4e8600b003cf5ec5d3fdmr2595426wmq.32.1666972594956;
        Fri, 28 Oct 2022 08:56:34 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id r18-20020adfda52000000b002365730eae8sm3832712wrl.55.2022.10.28.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:56:34 -0700 (PDT)
Date: Fri, 28 Oct 2022 17:56:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] RISC-V: reduce mcount save space on RV32
Message-ID: <20221028155633.wcvmfvq72qhfzn2a@kamzik>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
 <20221027172435.2687118-3-jamie@jamieiles.com>
 <20221028144925.3wfpsenrt7cql7yt@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028144925.3wfpsenrt7cql7yt@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_085638_930506_8AB23C75 
X-CRM114-Status: GOOD (  20.90  )
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

On Fri, Oct 28, 2022 at 04:49:25PM +0200, Andrew Jones wrote:
> On Thu, Oct 27, 2022 at 06:24:33PM +0100, Jamie Iles wrote:
> > For RV32 we can reduce the size of the ABI save+restore state by using
> > SZREG so that register stores are packed rather than on an 8 byte
> > boundary.
> > 
> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> > ---
> >  arch/riscv/kernel/mcount.S | 32 ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> > index 9cf0904afd6d..4166909ce7b3 100644
> > --- a/arch/riscv/kernel/mcount.S
> > +++ b/arch/riscv/kernel/mcount.S
> > @@ -15,8 +15,8 @@
> >  
> >  	.macro SAVE_ABI_STATE
> >  	addi	sp, sp, -16
> > -	REG_S	s0, 0(sp)
> > -	REG_S	ra, 8(sp)
> > +	REG_S	s0, 0*SZREG(sp)
> > +	REG_S	ra, 1*SZREG(sp)
> >  	addi	s0, sp, 16
> >  	.endm
> 
> Shouldn't we only be adjusting sp by 2*SZREG?. Indeed RESTORE_ABI_STATE
> below is getting modified that way.

It just occurred to me that leaving this adjustment as 16 is correct,
since we need to maintain 16-byte alignment, so the issue is below
in RESTORE_ABI_STATE where it isn't adding back 16.

> 
> >  
> > @@ -25,24 +25,24 @@
> >  	 * register if a0 was not saved.
> >  	 */
> >  	.macro SAVE_RET_ABI_STATE
> > -	addi	sp, sp, -32
> > -	REG_S	s0, 16(sp)
> > -	REG_S	ra, 24(sp)
> > -	REG_S	a0, 8(sp)
> > +	addi	sp, sp, -4*SZREG
> > +	REG_S	s0, 2*SZREG(sp)
> > +	REG_S	ra, 3*SZREG(sp)
> > +	REG_S	a0, 1*SZREG(sp)
> >  	addi	s0, sp, 32
> 
> This should be 'addi s0, sp, -4*SZREG'

And here I made copy+paste mistake, it should of course be 4*SZREG.

Thanks,
drew

> 
> >  	.endm
> >  
> >  	.macro RESTORE_ABI_STATE
> > -	REG_L	ra, 8(sp)
> > -	REG_L	s0, 0(sp)
> > -	addi	sp, sp, 16
> > +	REG_L	ra, 1*SZREG(sp)
> > +	REG_L	s0, 0*SZREG(sp)
> > +	addi	sp, sp, 2*SZREG
> >  	.endm
> >  
> >  	.macro RESTORE_RET_ABI_STATE
> > -	REG_L	ra, 24(sp)
> > -	REG_L	s0, 16(sp)
> > -	REG_L	a0, 8(sp)
> > -	addi	sp, sp, 32
> > +	REG_L	ra, 3*SZREG(sp)
> > +	REG_L	s0, 2*SZREG(sp)
> > +	REG_L	a0, 1*SZREG(sp)
> > +	addi	sp, sp, 4*SZREG
> >  	.endm
> >  
> >  ENTRY(ftrace_stub)
> > @@ -101,10 +101,10 @@ ENTRY(MCOUNT_NAME)
> >   * prepare_to_return(&ra_to_caller_of_caller, ra_to_caller)
> >   */
> >  do_ftrace_graph_caller:
> > -	addi	a0, s0, -8
> > +	addi	a0, s0, -SZREG
> >  	mv	a1, ra
> >  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> > -	REG_L	a2, -16(s0)
> > +	REG_L	a2, -2*SZREG(s0)
> >  #endif
> >  	SAVE_ABI_STATE
> >  	call	prepare_ftrace_return
> > @@ -117,7 +117,7 @@ do_ftrace_graph_caller:
> >   * (*ftrace_trace_function)(ra_to_caller, ra_to_caller_of_caller)
> >   */
> >  do_trace:
> > -	REG_L	a1, -8(s0)
> > +	REG_L	a1, -SZREG(s0)
> >  	mv	a0, ra
> >  
> >  	SAVE_ABI_STATE
> > -- 
> > 2.34.1
> >
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
