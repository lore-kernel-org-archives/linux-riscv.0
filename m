Return-Path: <SRS0=lqWX=5F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06820C4332B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2020 12:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C447D2072C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2020 12:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vq7s5HsR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lt0RjWJC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C447D2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P9FGEgOAfhZlBc/XacSwIrzHCsoMEro42zO9AhjeszQ=; b=Vq7s5HsRyTlWVc3z5r92E0ic4
	iN8Cn7/qZdU1qWtMcmj+zW5IpqlSXdV2p+djJPXSXx32LxJ2wsJL1lowhEPJ/8/4qj4OKY8stduWv
	6/7LXiw/3/sB/Rn+A7Bq6RWKT6kgT/nRgyJ4GF4EYy+GsOD8pLo5n08T3uvBeKUZ/3pJqX0Zw9+6L
	ajHCuxbos5kyVmRExMeOD+cpHXTR1XggSgazPV0XjSFM8LSbv9yL9cn2UelrtnYHsMaAjmp4Tickx
	86ydYxSG/KoAbIeGaEdr2MDn2Vnwe87/g0FgnzJ0JbdlHkDddB11ZDFHj4qmKVqNGkbyyIUMhAQUD
	JD9N6KxWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFGh5-00048P-WC; Fri, 20 Mar 2020 12:24:08 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFGh1-00047r-Mo
 for linux-riscv@lists.infradead.org; Fri, 20 Mar 2020 12:24:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id j17so3776752wru.13
 for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2020 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P9FGEgOAfhZlBc/XacSwIrzHCsoMEro42zO9AhjeszQ=;
 b=lt0RjWJCMYrQNn5DVfBeFcHQT4MQUy8RZO3hbRsNwh+AQMzx2cEziX6QhdVXEtmpPJ
 75CnCpcDwjzzTiyTURPPTQClOeZJeVm+Yw4lJ+r/r7ktyppBWK2E4teJeMUBTk0NqiM2
 hObxie+r8RLlvGM01QRmeMSiYrSxEEPMzrflwRzYIfx2OskEC+TtZCaiu+dxOBdaITUN
 3VDZlSFnNRoRea2CABKOB40j6jTII/f0DuHq5UXoNY+xSee39JAH0YmgvqjHyN2nMNLY
 JHgQEAJ/hpTzcurw+nJ/+FerfPHMOiKg8xs1oJx38sOAigZe68L7NnGCXuZPYwuPMa3Q
 ybbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P9FGEgOAfhZlBc/XacSwIrzHCsoMEro42zO9AhjeszQ=;
 b=a9Kp7QzNwsjCSgnGC/Qb97AwIyRB70CCxUGZdzd6qwI9r0d4+J26ekt2oR2DB1k75z
 pFyXdpzdkELyFfY/BEW7mUa3BHFHlR0wSAz93NCP2pgTAHh5E8o2ii2EzOIZw8tzhI6W
 fMAQifXWEOhDeOcjEcAdK66nK2tbKvGBFzDmtBdP/tD7xiw7HRivbg1DkznjOmZpVT5e
 yQAKYrQEusXvu740mCOQGulCxSOwajsG/6xX3ddfd/HK+e2wglZIxeAj8yTgBa0UdWWL
 8g+Dw/vuJTIGqahUCWB4wIEmaCt6vJL95NPLT2q5dAsHDPYhtxYGvjDnnNEDvZGkS0gt
 aNlw==
X-Gm-Message-State: ANhLgQ3ZD7p/haBcYYSiAu/r3OPzRZdZusp6BDrzQivnkxtNxpBztPxb
 DAfWuC3tuJE/fom0PhLz46GkGQ==
X-Google-Smtp-Source: ADFU+vvjjWmAxAHsZLa2RZx9qbbKk8Hav1XxXrmaPSE4Ey3RcK/rSL+sm11U6c0A3URK0ySDjVkm9w==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr10517139wrc.373.1584707040616; 
 Fri, 20 Mar 2020 05:24:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm7930243wrx.54.2020.03.20.05.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 05:24:00 -0700 (PDT)
Date: Fri, 20 Mar 2020 12:23:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/5] kgdb: Add kgdb_has_hit_break function
Message-ID: <20200320122358.3yjxglibgiedvmt6@holly.lan>
References: <20200319114032.376mvrq3npyxej5q@holly.lan>
 <mhng-2a35854d-fb2f-484b-aa28-8f858631bce3@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-2a35854d-fb2f-484b-aa28-8f858631bce3@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_052403_777250_E79CAF2A 
X-CRM114-Status: GOOD (  32.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 jason.wessel@windriver.com, dianders@chromium.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 19, 2020 at 10:34:33AM -0700, Palmer Dabbelt wrote:
> On Thu, 19 Mar 2020 04:40:32 PDT (-0700), daniel.thompson@linaro.org wrote:
> > On Wed, Mar 18, 2020 at 11:03:25AM -0700, Palmer Dabbelt wrote:
> > > On Tue, 03 Mar 2020 00:47:00 PST (-0800), vincent.chen@sifive.com wrote:
> > > > The break instruction in RISC-V does not have an immediate value field, so
> > > > the kernel cannot identify the purpose of each trap exception through the
> > > > opcode. This makes the existing identification schemes in other
> > > > architecture unsuitable for the RISC-V kernel. To solve this problem, this
> > > > patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
> > > > the KGDB trap exception.
> > > >
> > > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > > ---
> > > >  kernel/debug/debug_core.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > > > index 2b7c9b67931d..01bc3eea3d4d 100644
> > > > --- a/kernel/debug/debug_core.c
> > > > +++ b/kernel/debug/debug_core.c
> > > > @@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +int kgdb_has_hit_break(unsigned long addr)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > > > +		if (kgdb_break[i].state == BP_ACTIVE &&
> > > > +		    kgdb_break[i].bpt_addr == addr)
> > > > +			return 1;
> > > > +	}
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  int dbg_remove_all_break(void)
> > > >  {
> > > >  	int error;
> > > 
> > > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > 
> > I've been slow to review this because I wanted to take a closer
> > look at whether this issue is unique to RV or whether one of the
> > other architectures solved it a different way so, out of interest,
> > did you do any investigations in this direction?
> 
> Not specifically in the context of KGDB implementations, but we've been chasing
> these issues around in the rest of the debug stack for years now (I also
> maintain the RISC-V GDB port, though much less actively than I used to).  For
> many projects we've solved this by adding an ABI restriction that defines a
> two-instruction pairing for certain types of breakpoints that looks something
> like
> 
>   addi x0, x0, MAGIC
>   ebreak
> 
> I generally prefer the approach here, as it doesn't impose an ABI restriction,
> but we've had to shoehorn it into so many projects I just kind of pattern
> matched KGDB into the same bin.
> 
> Looking through "find -name "*kgdb*" | grep arch", I see that most
> architectures that have KGDB support also have immediates in their breakpoints.
> I'm just going to assume they're all differentiating between their types of
> breakpoints based on the immediate:

Many thanks for the summary here.

The implementation looked fine... I just wanted to be sure that there
wasn't a second solution to the same problem lurking in one of the less
common architectures!

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> 
> * Microblaze has a "brki" instruction, presumably the immediate indicates it's
>  a KGDB breakpoint.  I think they spin on BUG().
> * arm64 has a "brk" insturction with an immediate.  They're using 0 for BUG(),
>  0x401 for KDB.
> * PPC uses "twge r2, r2".  I can't find it in the ISA manual, but they have
>  other traps with immediates and there seems to be more than sufficient
>  information to differentiate between the types of traps.  They use "twi 31,
>  0, 0" for BUG.
> * ARC uses "trap_s   0x4", and they appear to use different immediates for
>  different purposes (0 for a user breakpoint).  They use __builtin_trap() for
>  BUG(), which I'm assuming is the same as the user breakpoint.
> * H8 uses "trapa #2", and they're using "trapa #3" for userspace breakpoints.
>  As far as I can tell they're spinning on BUG().
> * SPARC64 uses "ta 0x72".  That matches too many things for me to grep, though
>  :).  They're using __builtin_trap() for BUG.
> * PA-RISC doesn't name the instruciton, but they have two that appear to differ
>  by an immediate and use different ones for KGDB and BUG.
> * NIOS uses "trap 30", which goes directly to a KGDB handler.  I think they
>  spin on BUG().
> * SH uses "trapa #0x3c" for KGDB and other immediates for other breakpoints.
>  Looks like they use 0x3C for BUG(), and while there's some tables being built
>  I don't think those are to differentiate between KGDB and BUG.
> * ARM uses an undefined instruction, which needs to be hooked into the
>  undefined instruction trap handler.  I think it's a unique undefined
>  instruction for kgdb, though.
> 
> The only architecture that doesn't work this way is Hexagon.  Hexagon uses
> "trap0(#0xDB)" for both, just switching on whether the trap came from user mode
> or kernel mode.  Breakpoint traps from user mode cause SIGBREAK, those from
> kernel mode go to KGDB.  They don't have a bug.h, which I think means they're
> just spinning on BUG().  We use ebreak for BUG(), so we need something to
> differentiate between BUG() and KGDB.  I guess we could build up the tables in
> BUG(), but given that KGDB already knows the breakpoints this seems simpler --
> I'd prefer to avoid having BUG rely on the sanity of the kernel image :).
> 
> Presumably this mechanism could be used for H8, microblaze, and NIOS.
> 
> > 
> > 
> > Daniel.

