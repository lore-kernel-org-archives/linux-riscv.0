Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DBC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5Sk0iX2Oo+LazhorH2LeinYS8HmT13H4yAAMaFrcc4=; b=NiHS9cZK3JiDjT
	tGrRq5PfqdccBX8/R0LIXIUnAZS6KHdUeAVWpZlljmuzc8Q+x5hqCL6Xtv8VoKjEX2BpwV4k0pNGv
	gVKrj02ZGgkcM8T2REI0gRLh+ThJiCDa0UxZkGkfNmyO4eJ8xYauRnEm9RCOBPMQBA1DaejxRBfCl
	eYPpTCWipAYHaDQ1sryS/fZcnQtUT6RMgEH0IMTqvjGB/Uz4bewzzHgN1DJ8ZmLUO13c/jeaOcYmd
	x9MGiIaTeJ1biF9DIy6jc74/cdw24iTZPWHn4n1siXNqFWI2F0kP+V1c36KXJCBjmnvtm4IZj0zEA
	EYSVuwX5vShXB4RZ9tZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbTEH-00EF0m-2M;
	Wed, 30 Aug 2023 22:00:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbTEF-00EEzs-1K
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 22:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693432796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+mxn40Q4u4VXbxSDjH2/pQXmjepfrkxICdZHVve550=;
	b=WRXXu67kW905oX/zIx3nCbrvh/NsqafTw4/mUQD+xt58k7sssnPwCj6DBkiN0rgtY7+u0r
	yXTfmdEDD/bX8byZDdzRtERnPjMawNH60JHjrUPdR/3w/aKuwbowPu2v/vdLA79kw9nQPA
	fBddEEGpvL2om+dr58wuL+sZwMImepA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ZtQPudGcP5qsX4_Xm9uP4g-1; Wed, 30 Aug 2023 17:59:51 -0400
X-MC-Unique: ZtQPudGcP5qsX4_Xm9uP4g-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a9f2f6d356so138441b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 14:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693432791; x=1694037591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCsmQQPDEzpO7dEIPUF9oZqzMMjxWy62IcLqscO/fPk=;
        b=SCBCfzjfTOO9s5BsAyW7HEpWVdwkSdQZ78Iep1fMq5kt6mzZo0TIyNtYnmoP4/TvOp
         v1ZWDAG2jub64o6ZvrCJKsJmy1HYU3FwFN6Kc5AOVLHeoQzbhdnBsVDJKS5RIt3RtSv8
         ZFgNv+NcRnJeahXBuz4wQYNlHjloHxb2Aeyzz93r0RepGUP7TwwLnmTweAShMxHBeS82
         D8oGi5JsfbeasEOYasddRT2+gMvafq9rFFf/99OzxPV+U69wHYS5Xk7T6Vz+MakHpksH
         xSgI/3t/DszYw5Jldl84jiYoqNs+CeS9L151pblQ6DB//iGediOd5Vec+kWVyOT8eAtU
         oALQ==
X-Gm-Message-State: AOJu0YxBrunnc1NX0GYwylqHyoVNyhcGbu7fKqRWL2N9dU/p1wb6oyqK
	8yw6OVEBgZa/EK+KhlZm/N1s3RuraRVtWo9vWV77WEXAABPKPK0UhPusTVjyqSawIXzVEaIc9b5
	8cij7l4kN2KqzEmAubjBYN2HODRvT
X-Received: by 2002:a54:4017:0:b0:3a4:1c16:b1bc with SMTP id x23-20020a544017000000b003a41c16b1bcmr3765398oie.12.1693432791240;
        Wed, 30 Aug 2023 14:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwg5SrLVVQrMeLuskHMokNg/1gc9T7B5J3L1TkDvyTpxCprhAnkYx2pW90OEk85mNU2825yQ==
X-Received: by 2002:a54:4017:0:b0:3a4:1c16:b1bc with SMTP id x23-20020a544017000000b003a41c16b1bcmr3765381oie.12.1693432790991;
        Wed, 30 Aug 2023 14:59:50 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a802:98e3:3c98:3d83:9703:4411? ([2804:1b3:a802:98e3:3c98:3d83:9703:4411])
        by smtp.gmail.com with ESMTPSA id 15-20020aca120f000000b003a1f359ba4esm43252ois.14.2023.08.30.14.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 14:59:50 -0700 (PDT)
Message-ID: <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables
 of size 1 and 2
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
 peterz@infradead.org, boqun.feng@gmail.com, Mark Rutland
 <mark.rutland@arm.com>,  Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, parri.andrea@gmail.com,  andrzej.hajda@intel.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 30 Aug 2023 18:59:46 -0300
In-Reply-To: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
References: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_145959_524230_26989A11 
X-CRM114-Status: GOOD (  40.41  )
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

On Thu, 2023-08-10 at 09:23 -0700, Palmer Dabbelt wrote:
> On Thu, 10 Aug 2023 09:04:04 PDT (-0700), leobras@redhat.com wrote:
> > On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
> > > On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> > > > xchg for variables of size 1-byte and 2-bytes is not yet available for
> > > > riscv, even though its present in other architectures such as arm64 and
> > > > x86. This could lead to not being able to implement some locking mechanisms
> > > > or requiring some rework to make it work properly.
> > > > 
> > > > Implement 1-byte and 2-bytes xchg in order to achieve parity with other
> > > > architectures.
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > 
> > 
> > Hello Arnd Bergmann, thanks for reviewing!
> > 
> > > Parity with other architectures by itself is not a reason to do this,
> > > in particular the other architectures you listed have the instructions
> > > in hardware while riscv does not.
> > 
> > Sure, I understand RISC-V don't have native support for xchg on variables of
> > size < 4B. My argument is that it's nice to have even an emulated version for
> > this in case any future mechanism wants to use it.
> > 
> > Not having it may mean we won't be able to enable given mechanism in RISC-V. 
> 
> IIUC the ask is to have a user within the kernel for these functions.  
> That's the general thing to do, and last time this came up there was no 
> in-kernel use of it -- the qspinlock stuff would, but we haven't enabled 
> it yet because we're worried about the performance/fairness stuff that 
> other ports have seen and nobody's got concrete benchmarks yet (though 
> there's another patch set out that I haven't had time to look through, 
> so that may have changed).
> 
> So if something uses these I'm happy to go look closer.

IIUC patches 4 & 5 will be used by qspinlock, which may not be done yet, so we
don't have an use for them for the time being.

Otherwise, any comments on patches 1, 2 & 3?

> 
> > > Emulating the small xchg() through cmpxchg() is particularly tricky
> > > since it's easy to run into a case where this does not guarantee
> > > forward progress.
> > > 
> > 
> > Didn't get this part:
> > By "emulating small xchg() through cmpxchg()", did you mean like emulating an
> > xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?
> > 
> > If so, yeah, it's a fair point: in some extreme case we could have multiple
> > threads accessing given cacheline and have sc always failing. On the other hand,
> > there are 2 arguments on that:
> > 
> > 1 - Other architectures, (such as powerpc, arm and arm64 without LSE atomics)
> > also seem to rely in this mechanism for every xchg size. Another archs like csky
> > and loongarch use asm that look like mine to handle size < 4B xchg. 
> >     
> > 
> > >  This is also something that almost no architecture
> > > specific code relies on (generic qspinlock being a notable exception).
> > > 
> > 
> > 2 - As you mentioned, there should be very little code that will actually make
> > use of xchg for vars < 4B, so it should be safe to assume its fine to not
> > guarantee forward progress for those rare usages (like some of above mentioned
> > archs).
> > 
> > > I would recommend just dropping this patch from the series, at least
> > > until there is a need for it.
> > 
> > While I agree this is a valid point, I believe its more interesting to have it
> > implemented if any future mechanism wants to make use of this. 
> > 
> > 
> > Thanks!
> > Leo
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
