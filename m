Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD6BC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:54:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E0D6135F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E0D6135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2viPYDQ4Fkl4kH9bx7z5o2moFCHwKoPrSC9WekFGgS0=; b=Pm1zqS4ZXH71CgoA0cIQAm4D3
	X5/bugWDE7Z6WXyCYFpqmN7xydIYL18lEI4/VPgoxbTihHqAaayimIrD/i/NqqISvpz4B7U/x/9Xz
	AeVLXtgPw3G9Hv0XvwbdNIqr09+yG3h7oKqRVQ74CucdSpM7gDFa5vRQjtvm5yzfrwSpFaVKK0T3J
	dW5LKiwYerWO5pc5P+SrcRD6sCXs4PYEMDBA5mNbxCKOmYiLhrWWP3FSIaXAIcrmjPslMwVO6ss6F
	PltCDDkS00l+eP0wpSpdkUbLDYTV7UmrdtueSS4sIxhhkwIsqc/XroO8XFOCeA2ZtrVe/9TAKzyc6
	P1eyzBnOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljG6K-00342u-HD; Wed, 19 May 2021 06:54:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG6H-003424-Qm
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2ScD741o+QURZZPw733RWWmwYXPFhfmlwQ+Cj/Nypb0=; b=4GdSjl2f5aItw16cxUcbA03OdX
 q5jDsLDqnhsFYFwwgre+3w5ui4nIKQFmOf1CrWUHTii0GZbzl4KRWAI/va8wu1iEnzGe+ZVs+cY97
 pm83Akx82XZ2UJfdPJ7Ils+U8UX9NGS+77JW8WOwVBhP18vaZ7SpYFjKfJSp86dXf0CFvTTBMrn62
 HVSeCQ8KS6/GZekDZCUEpK8ggpEm4giDnwhktqId2Va1JM3CO6iuptIaz2arXa4C+1JIPIhEr+9BE
 x+XW/aDnQMntqWUyw5hgA1Vj47bkqfph63iMfsODxlJ/SDPxI8SKgvmTHz6cHvO7CVwPjHjvdgzlB
 SygQtkWg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG6F-00FCI0-90
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:54:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso2956309pjp.5
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ScD741o+QURZZPw733RWWmwYXPFhfmlwQ+Cj/Nypb0=;
 b=cX7NlRVxOwOKhhSA4/69Ayqnip1ZqdQVgVcbl0bX/edQVkh3QLIKaii0yMSLrECxj+
 Dbvotak+LCZxfuQOc3f08xucZP8jQokPJjyMHYeBXHENqK/U3qXyjtgWmJHXc7f91PK6
 KTMoO0H4H0HWHbBk/0OR2tXgoAB93ZoPznOd/ACvhTFzSUwvaWppBpmZVbDyVNhneDmk
 KZVYGuEQOSKMWnh0kaRc34BqlJZoGw4bfVbgsHdbSK1UviGHP3zRK1BgqUC1A9dVSviH
 /KOgvBznGPu7GY8wGtR9tBiTF2fmLca+yccav0EOn60Oy/SUssiHLMUDAiJ4PBEenpbV
 4lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ScD741o+QURZZPw733RWWmwYXPFhfmlwQ+Cj/Nypb0=;
 b=NNT4UafiYXBqiypAmvK2HQ5gOswlU2yIR6QnH8MF10h+mIJrQlj67U1vQXoskoovQv
 OuECgbzRNf7swcXBg8/mPFTKK8QmvFw6LLN6qfjDiqRgHqHo0aeX5K3glwB309sTorZD
 5H/b6VBLNMQGwsyJHWn0dgXD9f8E4/jmYuGIDxuyvnP236+oolRRgd/twzTAhBTY+ISB
 EJ/D9BTENWEhGfI4qhrUI1DaqUzXB2KqdQdxTlhwnS83H8DmLx2Kx6NZAVjVnaWbE0uQ
 hKREF9+WjkULG5mr2PIRquwuCf7fej2s5wA9SCvbZaCEsT9YrRTsBhLAu5YJuj6QmDzK
 TKAA==
X-Gm-Message-State: AOAM5329D/sGECcmZ+WhMQC2mxoT1AJTysnWo8n9io6Fl+af14rqQyaC
 Y4H3W3oi9Ool2OKfV3VmzdA4jg==
X-Google-Smtp-Source: ABdhPJx+meH2AZClfHyVtpeacNdTvFk5+2vdyzAovgo9a7hj5AkNu+XhOzxniHuRliV60D2l7mpiQA==
X-Received: by 2002:a17:90a:560b:: with SMTP id
 r11mr10039603pjf.224.1621407273992; 
 Tue, 18 May 2021 23:54:33 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:9384:8c4b:dc2b:c4d0])
 by smtp.gmail.com with ESMTPSA id k14sm5063003pfu.80.2021.05.18.23.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 23:54:33 -0700 (PDT)
Date: Tue, 18 May 2021 23:54:31 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 paul.walmsley@sifive.com
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519065431.GB3076809@x1>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519060617.GA28397@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_235435_342279_77B22ADA 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
> On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > Since the existing RISC-V ISA cannot solve this problem, it is better
> > to provide some configuration for the SOC vendor to customize.
> 
> We've been talking about this problem for close to five years.  So no,
> if you don't manage to get the feature into the ISA it can't be
> supported.

Isn't it a good goal for Linux to support the capabilities present in
the SoC that a currently being fab'd?

I believe the CMO group only started last year [1] so the RV64GC SoCs
that are going into mass production this year would not have had the
opporuntiy of utilizing any RISC-V ISA extension for handling cache
management.

Thanks,
Drew

[1] https://github.com/riscv/riscv-CMOs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
