Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E6AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcCNYQK9oFpuazRZdOy+zOfLkfYDzjrMXh+NrZge18A=; b=IYCBWjUAsIIB5Z
	ke6+7r6qjsIhjuKlpcZIHxHlIj4pTtR3RRxUDZCrj1/Z7iXUBpmcEyhoLkxqRwIy3BS6J9lztmeB3
	Q2BMDHTFJasYiADgcH7kw5A07BjF1y5vvYcldL1ifi4Z1gQkshfDPRRIQIbK1/Wjl7ICTxBmA/5dS
	MhZYUoddF3bLXEqCEBmPdKCzHYoKJ0/OGr4H2qH1LKgD/SkwkHC4QFnurpEOkjeqqsKHNX9znocq+
	Om7gIcpKgDm50BDGgaUPbBw+qzJfrVO1tvAMVVs+SMJP2YI/oaDqznZHy08uUSbe5iJqMMNWbNN17
	9Ziqn2enpnDiLR3FZlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuE7f-00F5pv-OI; Thu, 26 May 2022 14:05:55 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuE7d-00F5ot-AJ
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 14:05:54 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdwRi-1nJFTX1hKA-00b6uA for <linux-riscv@lists.infradead.org>; Thu, 26 May
 2022 16:05:49 +0200
Received: by mail-yb1-f176.google.com with SMTP id i11so3036022ybq.9
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 07:05:48 -0700 (PDT)
X-Gm-Message-State: AOAM533t8NFtc5FmBSHJF4eMokOzF/ZSfamHiyGIMLY22kuXjhz5oCpM
	UGp6XOQeyzfmZYOVxwAe1/zKMd0LjTtuKIkqd1o=
X-Google-Smtp-Source: ABdhPJyW6T0HxS8nRfGN2cj5Oi1n80F2UiMCqhaJN6XDQc/NZEUlfe2VDIsdY5cT/6NAmJsBfTfBFsZDS2WvmRY6bXM=
X-Received: by 2002:a25:bd8b:0:b0:657:8392:55c3 with SMTP id
 f11-20020a25bd8b000000b00657839255c3mr1620326ybh.452.1653573947731; Thu, 26
 May 2022 07:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220307140804.1400-1-jszhang@kernel.org> <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
 <YoCMJhH9EP4+01pB@xhacker> <CAK8P3a0dNbwyJm3Zq-H6MQDrEcTA+wu01VvSHtFVyBT2NtMRCQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0dNbwyJm3Zq-H6MQDrEcTA+wu01VvSHtFVyBT2NtMRCQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 16:05:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ezympZ0EDJPV9ipLWxqcNKm5QC-O44uA0oRhbFvMnqQ@mail.gmail.com>
Message-ID: <CAK8P3a1ezympZ0EDJPV9ipLWxqcNKm5QC-O44uA0oRhbFvMnqQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add irq stack support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:KgPY4oiJeYE55B5BCBf714J025xro4bnQVQNIe+UCZzXlFlQNOx
 GjqGyGROT1fyszZWTZB+5AGp6mUkmLzRqmjx6q5sAT8Ftz0Xci5cQAGRvVbbZiIP35nX9db
 GLWQjF63saZsmkpaWBeoi5tXDws7ocKomN7aJQD5egYQyQu1esi+a74yfzVSvU7NCJ21VW5
 H5axeCUZ79qhQZ98GfLBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XOUJNVvbnpg=:2gcKitzzihMofQ94NAOteh
 +ipHJjwJibz4lCdHbnx4Ct5cAqIzJBfAmpcH5MFRtMvXUrILPDg8vMqS6a1v75iCh8quYmzAB
 iLhhVsmfSJL/EItzfO69Sbf6DOvtJpTlM1fJaPbCIGGOcKsVNk/apVUApsgv2OD5H3VikHaEN
 ImdbSLsQKksYfvOdsfOQS7mmXOM7li38mMcJG2hMHACT6g182gyFSYByYeehLSUM0Y0L9s2jM
 xX3JEWaTnebj3lgu93WQVHfqCC8AvgZaksPsq6zSgx288her628bSQsTpwnt5ClRRSCZH5ln0
 SZb45ohBuqxeuXwifXq9b27e0JPjG21LZmnB0Z3KRXp3sCwMiIcnV+XDXTYBe9vKRBCjjMzLx
 6azpY1YyrChWhZXuKcWdQhdHna897WtAEQBeHzCOvIKygKUp0OlFNeyUR8wiPCrkY7F1Tl9Nq
 admc4WL0VPdK7exDC0f0Oo6dHrW3LVnBaDVsOEntJTTXeqNHgyZSJlQkH4yTdO4N1/g+u+Suh
 +MHYuCDzJJMNidXaSd8tXjEuIQqdTT5gjLoidj4mRs07fmWFJXFeTAuKLOVFz+neea+wDASpT
 DwUFyD0+AwcdQkAoHd2XC0MkPqMLhRMDl6FxU3FPEVY+Mbn59BsJuQJ29jZxjHJaDuNC6VuTv
 KdFPWEg0mDmTekHkitEtg8wT8l0wG8uV8U4AuXYfVYgBynBYDe7T20CBhcHcOiHqgR+ufGL9J
 /xAFhsa8BfZeJpyd2p0XnwmFJJtxhFZaJW312/b7NbnR+UqX5Xi3sTi60vv1zYrKFDxeIQkmp
 6AEZRRJr5TT6OHZDSBmeija0fe/vqkFTipiYEnI7iJeTgGsL5YnXs88zxO0DkkOjn5Arl+6J3
 Cicjlv+ukYkA2v1mhW/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_070553_688424_E31A9F95 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, May 23, 2022 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > +       for_each_possible_cpu(cpu) {
> > > > +#ifdef CONFIG_VMAP_STACK
> > > > +               void *s = __vmalloc_node(IRQ_STACK_SIZE, THREAD_ALIGN,
> > > > +                                        THREADINFO_GFP, cpu_to_node(cpu),
> > > > +                                        __builtin_return_address(0));
> > > > +#else
> > > > +               void *s = (void *)__get_free_pages(GFP_KERNEL, get_order(IRQ_STACK_SIZE));
> > > > +#endif
> > >
> > > On a related topic: is there a reason to still keep the non-VMAP_STACK
> >
> > irq stack is 16KB on RV64 now, vmalloc doesn't gurantee physical
> > continuous pages, I want to keep the stack physical continuous
> > characteristic for !VMAP_STACK case.
>
> I don't understand. What is the benefit of having a physically continuous
> stack? If this is required for something, you could still get that with a VMAP
> stack by using alloc_pages() to allocate the stack and them using vmap() to
> put it into the vmalloc range with appropriate guard pages.
>
> I think we really want to avoid the case of missing guard pages around
> the stack, and eliminate the part where the stack is in the linear map.

I was actually confused here and mixed up a few things: I thought this
was about whether to use vmap stacks unconditionally, and this is in
fact not even an architecture specific decision, it's a global option as you
are probably aware.

Since one can still turn off VMAP_STACK for normal thread stacks,
it doesn't make much of a difference whether one can do the same for
IRQ stacks. Please just ignore what I said above. I see you already
sent a modified v3, and I think either way is fine, feel free to revert back
to this method if it makes life easier.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
