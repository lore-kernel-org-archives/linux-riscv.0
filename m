Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E410FCCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjDJQ7imstGgWbjsiV4YmKkoLFCUYBjHDjDhn0W5NRA=; b=fZSSyVshT/n0W2
	ccOD/djscXMlTfGnlgjpWPUJwoOtEofyx31FDbmeLbB5rB+RCrbbQ1SwrouR6roIjETPa5ndcqIW4
	Ao8HdUFuR+iEwE1kE+s+T3tDPI/xHHxo74xXO73JEYx8kWz70FLy/stLPVelECN4DCc4h+DaOe6JG
	Qn/0PWj/Niex9i0EwfKKj0AdgGs/HebYD4aB5myIoZaQ/6fcL1qHBwcMHTDfjZX1wa/x3kST+PcZG
	HaQZ2tJvd+Ji/fW4UlobX2eFJhoDwljdCYVnJ53DaKkf2G7uIL1mGBe3YuSulERWVe6fFqQyiuvst
	Srerb+4fHTk603TEG5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjNQ-00000007boA-2xim;
	Thu, 26 Sep 2024 07:57:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjLV-00000007bIk-3c6y
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 07:55:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e0a74ce880so125402a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727337328; x=1727942128; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LgZ47RUL9Q35qhgvnJyIYSeIdz+lshHPal4Oi/Rxhg=;
        b=BUH9wuLu2x+HBytBy359ut1QCfh9D4sLInGHiTnhYwREZTr29WQKBgKfpJ9IuRfHkH
         cwHfn0VnoDhkuyKpDn1kpmk7YMevrGvzGuQvpZ/pqhBKEBhPrOfLM8NFI35PQjb9J3gC
         v88UIQnjn2ojLZD0waIGxSN9ac6onetNbXWFILoFX6y4yGdSUJuIgkVaVceaw2Hq8BDi
         8/EKUIKfHZJvYjLaFQz7TTus6PxgjZR3KaBMRk0gXuYE6yN8RyNdsRYSgGz/Zcq6RrXD
         KbZB6RRXzTDLVnEeAwdjTESLuAR0biBRRFt+GW2onrnJ9gcg3fpqs65nuKnTOSJfXvIh
         QRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727337328; x=1727942128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LgZ47RUL9Q35qhgvnJyIYSeIdz+lshHPal4Oi/Rxhg=;
        b=MzJEjAV+dGS7Ced439QEcFrQ2me2gGGHMyxhpEb2y8guHNX9kabwvzMNlWeB6eHOHB
         YC/QRs+IoaKXfW7bSih6jRWzXPnTtz9Ypa7g6pKSi5VAEfttK2CB/b41q1HhfS8E4ReH
         YD+34u0vZUQ6SmQjlQZG+V1QixOP9C9CXrgawXYSvBt2NNBj9GHTVMbPCI88mhoeDgP+
         e1XgxK6faNSnISKLJNEogK5gevHSuv/vrLbdxMJGGbfSKncCeUe+DOsm4+4xoRNZlHVf
         ve4Q6tv5kSWgbfaQcMtTQCii3b8bVpjbkF0/X4ltb/8qcLbssT052WRIDR/vpBZ2qo7L
         ausw==
X-Forwarded-Encrypted: i=1; AJvYcCX3fWeamPvUuiJgITnvBgXuWMC8aNHDOxa2RYh+6VlJ51UZzp2pw4g9oIvxnnX1Uxhwn81PtAnzNaexbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyonIh+hLF8jmDqs4xEpbal7q2VgJrQYqrKsOaJmHuz2//2UOwe
	417SCBVXAibaXhmCL+k2lhoHnHJ7U0/056u5nNjDTIfwge4TXky23sLn7cNx2j/6tz2PMHiaLHp
	X00dmPVKdrCTeM97at4STv6TIFlsS1UoAYEV8dA==
X-Google-Smtp-Source: AGHT+IGfCsPiGE2BFpV4KG5e5VOW6U22ie7unsTyky8krBo2ODZZk3WquPDzFMghPM8+SRvaTcZ5PAFYHsrzAW5xO3k=
X-Received: by 2002:a17:90b:4ac4:b0:2cf:f3e9:d5c8 with SMTP id
 98e67ed59e1d1-2e06afc142emr7296939a91.31.1727337327759; Thu, 26 Sep 2024
 00:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240925131547.42396-1-luxu.kernel@bytedance.com>
 <20240925131547.42396-2-luxu.kernel@bytedance.com> <CAJF2gTTzqcNyeSAxg0uTm0JVXvE0PYuKL5qeivVSUh87FTu95w@mail.gmail.com>
In-Reply-To: <CAJF2gTTzqcNyeSAxg0uTm0JVXvE0PYuKL5qeivVSUh87FTu95w@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 26 Sep 2024 15:55:16 +0800
Message-ID: <CAPYmKFsJu8fswWD1da6Bj=GrdNvjnsyF9434e9NNP=4PKz5t6A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/2] riscv: process: Introduce idle
 thread using Zawrs extension
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, christoph.muellner@vrull.eu, ajones@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lihangjing@bytedance.com, dengliang.1214@bytedance.com, 
	xieyongji@bytedance.com, chaiwen.cc@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_005529_923777_4943D840 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Guo Ren,

> The hardware implementations of "WFI & WRS" are different.
> - The WFI could enter a more profound power consumption-saving needed
> to keep IRQ alive, but the WRS doesn't.
> - WRS is designed for cond_load, which needs to keep cache coherency alive.
>
> So, we couldn't simply & statically use an extension check to choose
> WRS or WFI for idle.

Great comment.

I think maintaining cache coherence is not a big power problem for
WRS. In a naive implementation, the wrs instruction only needs to
maintain a valid cache line in L1 and wake up when other cpu wants to
make it invalid. This behavior won't incur too much power consumption.

And there does exist a power consumption gap if some vendors implement
WFI instruction to flush and power down the entire L1/L2 cache (for
example, provide CPUPWRCTLR register to control WFI behavior like
ARM), while WRS can not do the same thing. Whether WFI will power down
cache is not mentioned in RISC-V spec and is somehow vendor-customized
(Please remind me if I missed anything). So it is hard to use a
unified method to detect or control the cache power down behavior of
WFI instruction. And that is why we provide a CONFIG to let the user
choose whether to enable WRS IDLE or not.

>
> > +}
> > +
> >  int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
> >  {
> >         if (!unaligned_ctl_available())
> > --
> > 2.20.1
> >
>
>
> --
> Best Regards
>  Guo Ren

Best Regards,

Xu Lu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
