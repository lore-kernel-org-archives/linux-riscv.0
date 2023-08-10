Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AF3C04FE0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNUH09hZF0c5s8SR1W/itYAx61IlXk0lhEkRHezmzas=; b=c9huhM0cBVkyuW
	LfEroIBYxagDewTJeybmvsrGqTJB1YCDRmy2GD6vGir82yqtotXFgQqBcv5SeWzDvht1qgfnNTr/I
	vjnBHeRtMG0vLVFscwUm09Ft16b3v9UM5JnwbiBiPUXP1H+WjP5X9Lq+ERGkCvGIMaHFALaaYBlKf
	/67NspqZhJXgomqSIemmvu36uPe+iHv90tTqxTa4kmI6RrLLCPXQ6e29tJ44BmTmuKhKYuOjAwS1R
	PAjWi9AyMJ7y6yR9RN+5AcVabHH4riPv0iLvjhuzOqs8ZYYOT/IxpaSFXJyRiqLpgtZs/XY8RwCFf
	L9d8P/F52m02QColSakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU896-008825-2m;
	Thu, 10 Aug 2023 16:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU894-0087yP-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 16:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691683456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xeRtj3kf/cDHXsZACsC9s7MVF5RBhbsWR/SF5fgzvs=;
	b=DANtcEFfyQfyOX5lCk9cnOV/R8NIl0MxXx50ycS5+oNGOaaBo3DlRlo3qakRAjXdDF5uzR
	MYJDXOxMlxNXZiFdceQ7JfEEFJR7cNoJoFnpjFQaeEweNE2XVArtmN+Bdy9Yarz8ZiiSib
	JdiZqNe369U6QwoThl2vPjnR/do5oYc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-Nd78LFYRPo-OuXCDZM0TLQ-1; Thu, 10 Aug 2023 12:04:14 -0400
X-MC-Unique: Nd78LFYRPo-OuXCDZM0TLQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6bd1e0975cbso860836a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683453; x=1692288253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xeRtj3kf/cDHXsZACsC9s7MVF5RBhbsWR/SF5fgzvs=;
        b=f94k6zZ+8qUaA0WG0LusYXuJPyH2mkf2HBR1tc8wf40rRvP9qLcm7bdV8ndGEQC0zN
         3Vjd7oZg9wx1FeLCptAg+PqivUB/jA5aMNd1t54tpyYpGJsFNv8CEIY2pVgtBV0bOkF9
         WYPt2X2YcwNrC/yBe0jDHObILAql5VTfT7aipiWmgL+SaC+miD8Kfue+BMaRo0n3Redu
         0q3s6qZBT4NDPcdik1NAR/pZyPzneU54PlS73kWW0lZ7ktwgr+18yKTfOg1VtaPmTSZb
         FpCyZtFWxVQ6Olywiks3eLIu8R0RflPKwDGkxANDzFfYiPyRxZID62IS/awA6uzg/9+r
         GZwg==
X-Gm-Message-State: AOJu0YyxhcnnKf5CsUENvHsriujKUzbio4bVGuE1DEwzy9HaPfPfJ9wf
	Bklg82PbkJ8WsVKpVlEQOx10LeFc6glDnN0WB3+mnZklUXPwJGY4YeYUmwOmRKyOqHFSLbzCdeV
	dWKYIfHvIlK6JygCWww7d09wMqDIo
X-Received: by 2002:a05:6871:814:b0:1be:deef:748a with SMTP id q20-20020a056871081400b001bedeef748amr3694246oap.50.1691683453373;
        Thu, 10 Aug 2023 09:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAS+a5G7Ws0gVldTZb/ex2IEIk5Jlst7RFNazV1Y5r7yShFP9fQOFUQETq+6a0lDS92XDcrA==
X-Received: by 2002:a05:6871:814:b0:1be:deef:748a with SMTP id q20-20020a056871081400b001bedeef748amr3694218oap.50.1691683453061;
        Thu, 10 Aug 2023 09:04:13 -0700 (PDT)
Received: from ?IPv6:2804:431:c7ec:e667:6b7d:ed55:c363:a088? ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id o19-20020a056870a51300b001c02f12abd0sm890118oal.38.2023.08.10.09.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:12 -0700 (PDT)
Message-ID: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables
 of size 1 and 2
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Palmer Dabbelt <palmer@rivosinc.com>, guoren
 <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 10 Aug 2023 13:04:04 -0300
In-Reply-To: <b0cc2cd8-e246-40d1-b091-f40a74b31f61@app.fastmail.com>
References: <20230810040349.92279-2-leobras@redhat.com>
	 <20230810040349.92279-7-leobras@redhat.com>
	 <b0cc2cd8-e246-40d1-b091-f40a74b31f61@app.fastmail.com>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090418_253133_603BED83 
X-CRM114-Status: GOOD (  25.08  )
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

On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
> On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> > xchg for variables of size 1-byte and 2-bytes is not yet available for
> > riscv, even though its present in other architectures such as arm64 and
> > x86. This could lead to not being able to implement some locking mechanisms
> > or requiring some rework to make it work properly.
> > 
> > Implement 1-byte and 2-bytes xchg in order to achieve parity with other
> > architectures.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 

Hello Arnd Bergmann, thanks for reviewing!

> Parity with other architectures by itself is not a reason to do this,
> in particular the other architectures you listed have the instructions
> in hardware while riscv does not.

Sure, I understand RISC-V don't have native support for xchg on variables of
size < 4B. My argument is that it's nice to have even an emulated version for
this in case any future mechanism wants to use it.

Not having it may mean we won't be able to enable given mechanism in RISC-V. 

> 
> Emulating the small xchg() through cmpxchg() is particularly tricky
> since it's easy to run into a case where this does not guarantee
> forward progress.
> 

Didn't get this part:
By "emulating small xchg() through cmpxchg()", did you mean like emulating an
xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?

If so, yeah, it's a fair point: in some extreme case we could have multiple
threads accessing given cacheline and have sc always failing. On the other hand,
there are 2 arguments on that:

1 - Other architectures, (such as powerpc, arm and arm64 without LSE atomics)
also seem to rely in this mechanism for every xchg size. Another archs like csky
and loongarch use asm that look like mine to handle size < 4B xchg. 
    

>  This is also something that almost no architecture
> specific code relies on (generic qspinlock being a notable exception).
> 

2 - As you mentioned, there should be very little code that will actually make
use of xchg for vars < 4B, so it should be safe to assume its fine to not
guarantee forward progress for those rare usages (like some of above mentioned
archs).

> I would recommend just dropping this patch from the series, at least
> until there is a need for it.

While I agree this is a valid point, I believe its more interesting to have it
implemented if any future mechanism wants to make use of this. 


Thanks!
Leo



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
