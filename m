Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82A1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjaymQ7wqDEY8t0hNYGN6uxo/8f0wkwyL/Lw27ixzaQ=; b=29Msw4+Eh8SlbH
	kTlBT238uJYVw+NDmIvTcK2fGp09KyR+DARUsWqzGHzQBUBxW2vPb7n7xAVc0jCpfctqRnaXdmYFA
	IRoBMTvSFo0wRSkBpZ3EGsA9j/sIEfDS28YaRYpj/1Qh+rZdfl40p9qP7XebPf/5vWzoxF1e2Ltzj
	H7YPmEA6FXGVu5qu494TV8apuXOlo0U4DGTXj9ZDIU+sSisV6sOWoCR0kQL5JCa0PCifRoKC8Ry3/
	naB6vIvKH7nc3ympTdL717k/lOZLJ5ZLi9gykZ4akZGKvlQ+ikon1NXJoRLGOLY5yiP2ngusI8bZi
	UDg1sz/uMDbobR5CJTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9dy-005w41-II; Wed, 20 Jul 2022 13:21:38 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9di-005vja-WD; Wed, 20 Jul 2022 13:21:24 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 72so16403951pge.0;
        Wed, 20 Jul 2022 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kkXoj+qRduj7qTMK4wk6bSavIb9EMzMuh8HC0Q0nrLk=;
        b=jQ6dX9nCD5D/DxdQW23LRNMfGlUAuEwuaP/RNO4rJfNhep1BaxhgsLIM1CqTfUp6uZ
         o0POAHKQW9W+z0rrbNRFWZNsJBLEOz8EBbaw73ers5GPX9FAQAu+r5jn/UvInipkgs4a
         3gw7hNdLdwAd4/+g0ByAir2ePNPNzvMLKu/WJzP6ta+74Qd//pA3R1UKVJb31QoBs13c
         zQLttdc00sMa8sioPAXa+3AdnSntToir+4Vk27yBf2oTxpEaDNwSPk9Eiz/cDDtcFbB0
         Wh8mg3Q9xNCMNal8hXslUMwO51OwFniWdUCX9oBF8FMgv2A942cpcCpxF2ll7GaxW6nH
         DLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kkXoj+qRduj7qTMK4wk6bSavIb9EMzMuh8HC0Q0nrLk=;
        b=rxE4LTgs3W3sW3i6EyhoWWOfuRgtofxRua/v4uCBZDvzrD8GxrBzHYPrIXqnECMCOa
         YflNx3JYkhRxryGvt/MRs+EorUvnI9stnAFIdKlmZgE/4b5SWTw7odQWX0URyuhGKYLU
         9RTTsnGjdEV6I9hYlvoMxCJ62DlTEitit149hpmamXfoetKmBe+apHYN7lGUeK73ArAI
         I+rnFaoMhenfV04EAL96MZXMcWv7OOh6zgeW3yoCx1UuiTmBhFaS73nuMJ/aek7VfQs8
         EjGA0YW2uR5ub3lWp39fDtAc7Bbj0bsfUltDZd10ZJsWbxdm/mXr1/SH1M1H+7oRaIE8
         3i0Q==
X-Gm-Message-State: AJIora+qU6QXaHdVtRyJXi++qeUXwMwmxJfuQoRCxThwT5i6KJcjaPQw
	0ucyk8OhQRLsb6dGm6QEmzE=
X-Google-Smtp-Source: AGRyM1voG/cBkqWxwFzO1B88vQuX5jEvcrxTRuhs985ZhRpdZRNiAoO7QgcQORY/zAroDGgcuEz/0g==
X-Received: by 2002:a63:1f4b:0:b0:41a:daa:3068 with SMTP id q11-20020a631f4b000000b0041a0daa3068mr16866885pgm.330.1658323280131;
        Wed, 20 Jul 2022 06:21:20 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016cf195eb16sm6815532plh.185.2022.07.20.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:21:19 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:21:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
Message-ID: <YtgBTaP/O32ANOHU@antec>
References: <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
 <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
 <YtaNvpE7AA/4eV1I@antec>
 <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
 <YtaiSEAnMhVqR4HS@antec>
 <YtasKiPrkFlBXZvh@antec>
 <YtbAjsDkVt1a6c08@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtbAjsDkVt1a6c08@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_062123_069442_47408D8A 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, Jul 19, 2022 at 07:32:46AM -0700, Christoph Hellwig wrote:
> On Tue, Jul 19, 2022 at 10:05:46PM +0900, Stafford Horne wrote:
> > > > Or we could try to keep the generic definition in a global header
> > > > like linux/isa-dma.h.
> > > 
> > > Perhaps option 3 makes the whole patch the most clean.
> > 
> > And this is the result, I will get this into the series and create a v4 tomorrow
> > if no issues.
> 
> Yes, this is what I tried to suggest earlier and it looks fine to me.
> If we want to overengineer it we could add a ISA_DMA_BRIDGE_BUGGY
> Kconfig symbol and select it from x86.

I left it as X86_32, I feel it it would be more confusing/hard to maintain to
add the extra level of indirection.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
