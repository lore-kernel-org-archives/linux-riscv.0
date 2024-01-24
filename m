Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B47C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 21:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4wVzJbawhqJdrRheWHY9dZcwubzB+JaGl4TnD0r4Z0=; b=SoTMVYO0OciDtM
	t/g0TNNhWkHJkFe1DV2JaLmrHb0t7PXNjmn13mDxnCAF8tYslSEU6HAB8enomcIBJ6SxefHky93yA
	7EUVjq2BAPITph7ceW6gVFHOH6dCnnca2f2EHsJsztCRix/E9X7FlmrvS6pkjMMqpzlWaGMcIXipn
	+HTqcYK96POdJgNS6TJWbKcKEcyd7OCrqWSeA7jyQiluMm+kWcvengQP2y4tjfr3b7Ybc9H56gOf3
	785tI4Pw01545LRAX4BtfJhCoEypSFleOGbiJ19YV+OYZ4rPUOlkJP/24e21V3exRoZQ/3PeX52yT
	6URMyf/zH81ZiGvZ1bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSl2G-005ByC-1s;
	Wed, 24 Jan 2024 21:43:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSl2C-005Bx1-2j
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 21:43:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-337d32cd9c1so5259448f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 13:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706132622; x=1706737422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tg6vlOJdIGK8tq0vrQAo3bCHPF7VlBCqruzxipzmg3E=;
        b=gZdsrDmPwFlGlC1Cx/J3BeOwAkYafKi6+un3ll+UcCo+DrHoAYeQNQufPa127nnNuI
         oCNhbHHVNlm8ex15cv24UE19nDEdYB7x9MifYVmGWJTZaphpZGQuulYl5BrldHxB0wAg
         kQGb3sudjIvTdXsD64I719nQp+JDJsUvZkz+nq6i8a1y/MrZNEdRCh0fVj2LbM/3QXY/
         r3nFvaGwTjmZBxmJtJfIkIcQWuBKFRfR20oUaDZB5ggPaiCMYjJqngzOt1jA+U35EDpQ
         UFwY55dd/4grxfhjN4bvmoO1UvfgtBpDU5e4kLtQbFfJHweZlybFUNi8tkQ1NxXQ3lc2
         hRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706132622; x=1706737422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg6vlOJdIGK8tq0vrQAo3bCHPF7VlBCqruzxipzmg3E=;
        b=RmGbYFcBVEssa0uNMsuTUruFKDSXX59ErdOg2LoogyCRkz2SMzT/Te+2e/pyw2MZqZ
         68e/BsS7AIORCLnkpej4sBGkyXOjQGvM/+qnnkGfCgUAQDJYcLg1PgOjmrw6LtZuQ8Zg
         70O5DSUxntNshVHl6Z+M+T+9wci+NEOuYA3p/oxP2B9XRJmlZVFBSMlYGXKOFW0BPL6P
         Ug/nhS+IVl75xpd1t0SR2hhoyfr9+ssitBb8pSsiAWBll2h69xRaeqK/RbqvkEikdFz7
         IklEcBW3fb4LjLR/y6ERR5NNGrTFzckX819e/7HaxqCFQgOagXv4QuL0TtfAPR6ROfpj
         Vc/g==
X-Gm-Message-State: AOJu0Yzgek12mobaufbd6c3lxAm61os9NXLQsHkGrIcsueT1zOudwuZi
	W9WMaV6SqjSDCNLdCjpNFlVeTZLdSjkS4zv1HDYDybSI7KHiSA6x
X-Google-Smtp-Source: AGHT+IHr4rlR/jsqg4UhvhM22LlkdwhEz3vyqEedXc7T2SDNhM04UimPxufVBGGISy/LOD8NkSJcyQ==
X-Received: by 2002:adf:a188:0:b0:336:5f15:5533 with SMTP id u8-20020adfa188000000b003365f155533mr941828wru.54.1706132621880;
        Wed, 24 Jan 2024 13:43:41 -0800 (PST)
Received: from andrea ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id cl22-20020a170906c4d600b00a26a061eef8sm292575ejb.69.2024.01.24.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 13:43:41 -0800 (PST)
Date: Wed, 24 Jan 2024 22:43:36 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	paulmck@kernel.org, corbet@lwn.net, mmaas@google.com,
	hboehm@google.com, striker@us.ibm.com, charlie@rivosinc.com,
	rehn@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] membarrier: riscv: Provide core serializing
 command
Message-ID: <ZbGEiEgeGwzUcTe0@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-5-parri.andrea@gmail.com>
 <aabea058-0088-41bb-822a-402669f348bb@efficios.com>
 <ZbFahHxi5laA6CbI@andrea>
 <e4e1ee4d-b96c-47c7-bf81-5f4d3b0ce5dc@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4e1ee4d-b96c-47c7-bf81-5f4d3b0ce5dc@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_134348_911318_C0D54CFC 
X-CRM114-Status: GOOD (  19.58  )
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

On Wed, Jan 24, 2024 at 01:56:39PM -0500, Mathieu Desnoyers wrote:
> On 2024-01-24 13:44, Andrea Parri wrote:
> > > > +# riscv uses xRET as return from interrupt and to return to user-space.
> > > > +#
> > > > +# Given that xRET is not core serializing, we rely on FENCE.I for providing
> > > > +# core serialization:
> > > > +#
> > > > +#  - by calling sync_core_before_usermode() on return from interrupt (cf.
> > > > +#    ipi_sync_core()),
> > > > +#
> > > > +#  - via switch_mm() and sync_core_before_usermode() (respectively, for
> > > > +#    uthread->uthread and kthread->uthread transitions) to go back to
> > > > +#    user-space.
> > > 
> > > I don't quite get the meaning of the sentence above. There seems to be a
> > > missing marker before "to go back".
> > 
> > Let's see.  Without the round brackets, the last part becomes:
> > 
> >    - via switch_mm() and sync_core_before_usermode() to go back to
> >      user-space.
> > 
> > This is indeed what I meant to say.  What am I missing?
> 
> Would it still fit your intent if we say "before returning to
> user-space" rather than "to go back to user-space" ?

Yes, works for me.  Will change in v4.


> Because the switch_mm(), for instance, does not happen exactly on
> return to user-space, but rather when the scheduler switches tasks.
> Therefore, I think that stating that core serialization needs to
> happen before returning to user-space is clearer than stating that
> it happens "when" we go back to user-space.
> 
> Also, on another topic, did you find a way forward with respect of
> the different choice of words between the membarrier man page and
> documentation vs the RISC-V official semantic with respect to "core
> serializing" vs FENCE.I ?

The way forward I envision involves the continuous (iterative) discussion
/review of the respective documentation and use-cases/litmus tests/models
/etc.

AFAICS, that is not that different from discussions about smp_mb() (as in
memory-barriers.txt) vs. FENCE RW,RW (RISC-V ISA manual) - only time will
tell.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
