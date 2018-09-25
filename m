Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E532C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:50:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D6720896
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VrfPHwcS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="U4I1qhbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D6720896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLNm9bRNfNavLhRBjKBf3s8PYtclboO+UCRFEhy5XtU=; b=VrfPHwcSLRhLRc
	p+TpgPpnd5poNXnDqrZBOtTFDlyivMQ2bAJS0PwBT5IuQKkQPUDcd1ZYKZQ1SLLg/l3aOGGYRbCYI
	qTPCZUnw/QOekHtB2mlZx0FScG6FPfRAukkV63sLoVuaJT6wVqBrqws5zG3NrSE60Qd3KYylmTVNl
	C2GRvmnlQJGq2XUmZZUHja13lFeALZjYH4CiBV00RDcsEXkxXTglsNiRUOaqPzxAH6IkEHiT8XPTP
	V4O0sd3sI+EWN+yFSjff/dbTMpIKzgOnspirSQ7q9UVy9bOwxlWrHFtNc12+YuiYFcuRI3UvuswtU
	z8UlCXzjH0f8lALa9yxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4rTO-0003kP-ND; Tue, 25 Sep 2018 17:50:10 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4rT0-0003hH-EE
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:49:49 +0000
Received: by mail-ed1-x541.google.com with SMTP id k14-v6so20069550edr.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dW6Z3tPoCmRuns3nBOd/KOLpwzZGNOM2TtEOQHse3bU=;
 b=U4I1qhbiSvtgDPWBNJ9PBjj2LDqdntomnuk+txI3m9qG2iK7SX1eOGGM9Sy0Q4rHKd
 ujoN09/jDEooXjY5P0t3Id3vUca7Llt/3KeCOZOU7ftVN4+MmUJexRprCs1cnd1DFNR3
 PUHRqVEP8F2vMzXhr7yRvF8fb76t7VODYGgjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dW6Z3tPoCmRuns3nBOd/KOLpwzZGNOM2TtEOQHse3bU=;
 b=bLpOoexui92kyn0ZpiEI6eKy8sR6GOSHh4wUoIJAU2GlDcA7sCFbW5+Tr8sVqCt+Id
 zleVlgCMiFa/0SFekfpJdPW5Y9ohVKfDriU/zJRVXHDFjGQt4BnVpGIy41ZU6Ghg/9In
 40li5yDqEI1efw69VhtWfDzRkmIfrhsKlLEZrSPaADroFWgP5MS0kyt7Q7J2h/7aN06B
 b15q+S7ezeqpe40C4/sdR3A4rlTexivqZdeKa4vS2KYORxk6hIuf93WAM/HNkOZiIyzg
 Cs9tmgEBaoErdky3H2/m7JGdcUH64qsGy08jTGz/3gN1JJiu9wC3Y3K+R5V/MS7cfRgM
 MLgg==
X-Gm-Message-State: ABuFfoiwcSyqknsF4nvfxdbr88UFJEgmWN46G7Ndcm/RzRjfUUVerQIk
 kDoizt6FwPG3I6Wa4Yy5ppWqTtdu/mlN8w==
X-Google-Smtp-Source: ACcGV63P4f5F99lixtcxVD+4jet7Ess+0eFkKLDWcL8uJIwmM42jlRVAEhCq0aLPV4fWMW8cjHo1dg==
X-Received: by 2002:a50:b045:: with SMTP id
 i63-v6mr3454270edd.18.1537897754596; 
 Tue, 25 Sep 2018 10:49:14 -0700 (PDT)
Received: from andrea (15.152.230.94.awnet.cz. [94.230.152.15])
 by smtp.gmail.com with ESMTPSA id m35-v6sm6852725ede.14.2018.09.25.10.49.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Sep 2018 10:49:13 -0700 (PDT)
Date: Tue, 25 Sep 2018 19:49:06 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 1/2] riscv/bitops: Remove
 smp_mb__{before,after}_clear_bit()
Message-ID: <20180925174906.GA4372@andrea>
References: <20180925121225.9917-2-andrea.parri@amarulasolutions.com>
 <mhng-2c59d90d-9cf9-4462-bfb6-5c90ffa0c6d0@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-2c59d90d-9cf9-4462-bfb6-5c90ffa0c6d0@palmer-si-x1c4>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_104946_494247_E8E79F5F 
X-CRM114-Status: GOOD (  13.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925174906.c0l7_toJ2_xszpY4xKZ9xOegjrSq9ksSW6E7LXALobc@z>

On Tue, Sep 25, 2018 at 10:19:24AM -0700, Palmer Dabbelt wrote:
> On Tue, 25 Sep 2018 05:12:24 PDT (-0700), andrea.parri@amarulasolutions.com wrote:
> > The barriers are unused; remove their definition.
> > 
> > Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: <linux-riscv@lists.infradead.org>
> > ---
> >  arch/riscv/include/asm/bitops.h | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> > index f30daf26f08f4..01db98dfd0435 100644
> > --- a/arch/riscv/include/asm/bitops.h
> > +++ b/arch/riscv/include/asm/bitops.h
> > @@ -23,11 +23,6 @@
> >  #include <asm/barrier.h>
> >  #include <asm/bitsperlong.h>
> > 
> > -#ifndef smp_mb__before_clear_bit
> > -#define smp_mb__before_clear_bit()  smp_mb()
> > -#define smp_mb__after_clear_bit()   smp_mb()
> > -#endif /* smp_mb__before_clear_bit */
> > -
> >  #include <asm-generic/bitops/__ffs.h>
> >  #include <asm-generic/bitops/ffz.h>
> >  #include <asm-generic/bitops/fls.h>
> 
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thank you.


> 
> Do you want me to take this via the RISC-V tree?  I only ended up with patch
> 1/2 in my inbox, and I probably shouldn't take both.

I expected this to go via the RISC-V tree and 2/2 via the H8/300 tree,
but really no preference from me as long as they get upstreamed. ;-)

Thanks,
  Andrea


> 
> Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
