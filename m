Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D7FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpooNDbIFRlhGPM5puwBq0j4fpWK4QVvFC4mLAE203k=; b=N+6IRy6DunuUpu
	Ivzng8tbW7ynOThiGJeV/+YeS30MLYv07VCpAHEdkJLCLn4vTBd6Fx2ZGNI8hvRXCf7aHVo/JtN8L
	aZZi3/poo9hnSfzcFCrBXtUYDuOsXDMCxD0IFMIzjiK3zBoueJC4oPs6ZQNkhBkP3Ogv6z+vyy6nf
	K+bCaJDwhAthHs814eO0tOd5/znNPbB+6D9IStFeTMtdJxOgyo8joZWApLHX49IVru6ZCRAHt+5tt
	ES1h8m2pBxph3IObN6FN4Pmxt/0+J/ZbcxiEOGh7NvQ1RptPhAsUMMNGEZ2xT4ygDUck4fVEbGWYN
	bDDcq8tP1ar/Ga/4JvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1hS-003iUs-2u; Thu, 24 Nov 2022 02:10:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1hP-003iSL-4o
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 02:10:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 571D9CE28E6
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E8FC43470
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669255843;
	bh=c9UdDpmuSX8C2v9Fvfsgma0HGHdxBqm/WGUiMAoGwYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VvMk2EdcB/JEOwaACLaobDK0LM6aSZsv05+QJOQVurIilX3a86ec2z7dNQvXEVAlZ
	 Q2CWCvIVwCRZWCRxKDGxp7vCelwKFVkb8Igbr1YqjI1Zwnv9a3XeMsK9OyXxpx4Yhv
	 DOa2MqTm4mN+Rv3ZDbyD4YEjApXeGzxw2tg+DJeBn0sl+u6oLQ3NuQNel+52TvGPR3
	 iidAH8+uMf4T4bWdn2pZCRaLGTaWuFBg1t6+U5pJ7/Nvi9n/18MRXySOCO/kTxIAWO
	 B91SRXLFMhLeHA0YEYhFKB+RozESS+hWpSw9xKOiWpZ/7DYOFIC4HojFmESX0FWlAm
	 rZVat8eD1zt1A==
Received: by mail-ed1-f47.google.com with SMTP id l11so722384edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 18:10:43 -0800 (PST)
X-Gm-Message-State: ANoB5pnPNBdjnB66vu2ac5V7wRmRO77Spn745rY3DchJ97n0IEQTDCR5
	tvoQ16QYMZlUOrac7mEQUE6fQriw1I6adXtG2k4=
X-Google-Smtp-Source: AA0mqf7MS5mBZeSUrHoSEyV74Sek3FEghp4uaQK/VbW8jtQyx7r3Uu9BLluaul+nOfZ4ky6g9FT8jZB3FVPUTSyDoNA=
X-Received: by 2002:a05:6402:19a:b0:460:7413:5d46 with SMTP id
 r26-20020a056402019a00b0046074135d46mr28223123edv.47.1669255841778; Wed, 23
 Nov 2022 18:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20221123153950.2911981-1-guoren@kernel.org> <20221123153950.2911981-2-guoren@kernel.org>
 <Y359eOOrm/lpDHjt@spud>
In-Reply-To: <Y359eOOrm/lpDHjt@spud>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Nov 2022 10:10:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRvSkXD+dmVGfObrKE6ZsJdQdcH1G-hRxmYsMSoMbm8vg@mail.gmail.com>
Message-ID: <CAJF2gTRvSkXD+dmVGfObrKE6ZsJdQdcH1G-hRxmYsMSoMbm8vg@mail.gmail.com>
Subject: Re: [PATCH V3 1/5] riscv: ftrace: Fixup panic by disabling preemption
To: Conor Dooley <conor@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_181047_541753_4E8014F6 
X-CRM114-Status: GOOD (  19.04  )
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

On Thu, Nov 24, 2022 at 4:07 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Nov 23, 2022 at 10:39:46AM -0500, guoren@kernel.org wrote:
> > From: Andy Chiu <andy.chiu@sifive.com>
> >
> > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > forming a jump that jumps to an address over 4K. This may cause errors
> > if we want to enable kernel preemption and remove dependency from
> > patching code with stop_machine(). For example, if a task was switched
> > out on auipc. And, if we changed the ftrace function before it was
> > switched back, then it would jump to an address that has updated 11:0
> > bits mixing with previous XLEN:12 part.
> >
> > p: patched area performed by dynamic ftrace
> > ftrace_prologue:
> > p|      REG_S   ra, -SZREG(sp)
> > p|      auipc   ra, 0x? ------------> preempted
> >                                       ...
> >                               change ftrace function
> >                                       ...
> > p|      jalr    -?(ra) <------------- switched back
> > p|      REG_L   ra, -SZREG(sp)
> > func:
> >       xxx
> >       ret
> >
> > Fixes: fc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
>
> ==========
> verify_fixes - FAILED
>
> Commit: be26b864dac9 ("riscv: ftrace: Fixup panic by disabling preemption")
>         Fixes tag: Fixes: fc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
>         Has these problem(s):
>                 - Target SHA1 does not exist
>
> This should instead be:
> Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Thank you! Sorry, I missed the first letter :P

>
> Thanks,
> Conor.
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
