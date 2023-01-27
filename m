Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59619C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbZUtwJUQrFLQV7MUXr3BHN0idMfQJPrz3euzcMksEA=; b=mKlJ0Wjlh7VHK2
	DFmWmXMbPuGLOlzXn5Rp4JNqqw2b57UM2EcMFZL4TePjI8sW0idWh6IAeOTSqylAakjKryF0vVO4g
	k9zRXppG93bfT8L4SD2gpL9HoLR/4WUwPpntfAG1pilXoZ5X6fD7zCJEYEvF8kD9cyFdOeb0ODsj5
	itRnj1WoU/Gqcr5KC7aT/sf+avXidCNJrbmSIFohUrN1BhcG1/hzBysLHseyBmoShL4T/HDmv7JMX
	0Wt5VvqBfzL/gKdzJr5s3L38dfqfaaeJK6QsmMrs+nXEJ/zYXd77ATDC5fEsAHPemw4SwsgkLyEsm
	bkz97bWcg+wNOpN3M70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKYi-00DZGa-4p; Fri, 27 Jan 2023 08:58:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKYf-00DZFv-OK
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 08:58:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j17so2959647wms.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 00:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYMteubS+4lwOGc2I7JiDeXqE7nT4Xb62g6ujdBjlpE=;
        b=gly/Ah19V9gpzED0uxuLEtUd8b2f3KZf9Z3F5llZ7GPh2M2DQsUzBwNWErueqqKwOK
         2IAcgKEbiNGtg++g45thG+xXmIA4Tto8tPfjISHiN5h/kUVp0xZnk9tn7XQwdrlWnZkY
         tn1OOjDuwMXRVnLhLwkJ20zWcnheaHrd95IgmLye+uFgvmHWG9apsp9IubCtRHBI2MzC
         oIJfLmqRPKMAtFdTD6OUc0pl8hwNl0ALmQnKK8GS6pYz6+ErcmE2MDOlXhSl3sntDOO6
         Wo4TU7LR0Ttl99QFAGCq/czH+h4HdB9ejMDMIXBY9mzkXgHaEm4g6jh3Y9R9dVpkCj+9
         07Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYMteubS+4lwOGc2I7JiDeXqE7nT4Xb62g6ujdBjlpE=;
        b=TAIIGjYpX4Qyby27/CnMjMOYPJdORWF2xif21XMvSkXu4ID2lWeRA89/apL1HuQsUU
         +q/cSogWwPRR7TqPtpLL3nqYQbwVORnFMOKXe0YWMw/kSfvVPfVhzwQg4ymYF/3wHLvK
         CCGlPQbjpaBLR8S0BZUvSaMK47bYyJa7TCgkRhu1kPfvPJXh1AgRk1at/mRCU935LVPr
         U3e56qJuSW5H2UWTaJOUQbFvGMFyP7Nnn6zZRygdwn6Ns8o6mCCM3RMed1wNjqNEQURP
         oPvygCSw0y/Qmn6JZNdsWnzCjCQCtgJ1h8JGeHQa/KBGDdsgDNRFxVoCYtPlPirLie2a
         O+Cg==
X-Gm-Message-State: AFqh2koniJFDJkzkg5El/hEmg2odb6SSYaCgMqy4m2KKlRsye9iWMdOy
	fDOnQ8i8wWnRtLdPxackIQW/Sw==
X-Google-Smtp-Source: AMrXdXtav/oM3qM10MujDBkbMkvfbbVRSYWQH3g8HyfDNMvHTIctgxxkkiyCrXTT8buQVGYHDEyK7Q==
X-Received: by 2002:a1c:f317:0:b0:3d0:480b:ac53 with SMTP id q23-20020a1cf317000000b003d0480bac53mr38981050wmq.12.1674809884477;
        Fri, 27 Jan 2023 00:58:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c349300b003cfa622a18asm7342751wmq.3.2023.01.27.00.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 00:58:04 -0800 (PST)
Date: Fri, 27 Jan 2023 09:58:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <20230127085803.ruj624323wxeyllx@orel>
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
 <20230123142554.f22ajf6upfk2ybxk@orel>
 <20230125104102.2thvourt3lx2p36a@orel>
 <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
 <20230125151041.ijhjqswqiwmrzljd@orel>
 <CAHVXubjR8AsZhMz59goxfmf8LmA4bjePKUx=AkvmbqoF42tzmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjR8AsZhMz59goxfmf8LmA4bjePKUx=AkvmbqoF42tzmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_005805_817695_13F6D5DF 
X-CRM114-Status: GOOD (  29.44  )
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

On Fri, Jan 27, 2023 at 09:45:21AM +0100, Alexandre Ghiti wrote:
...
> > > > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > > > index f08b25195ae7..58107bd56f8f 100644
> > > > > > --- a/drivers/of/fdt.c
> > > > > > +++ b/drivers/of/fdt.c
> > > > > > @@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
> > > > > >  static void __early_init_dt_declare_initrd(unsigned long start,
> > > > > >                                        unsigned long end)
> > > > > >  {
> > > > > > -   /* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> > > > > > -    * enabled since __va() is called too early. ARM64 does make use
> > > > > > -    * of phys_initrd_start/phys_initrd_size so we can skip this
> > > > > > -    * conversion.
> > > > > > +   /*
> > > > > > +    * __va() is not yet available this early on some platforms. In that
> > > > > > +    * case, the platform uses phys_initrd_start/phys_initrd_size instead
> > > > > > +    * and does the VA conversion itself.
> > > > > >      */
> > > > > > -   if (!IS_ENABLED(CONFIG_ARM64)) {
> > > > > > +   if (!IS_ENABLED(CONFIG_ARM64) &&
> > > > > > +       !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
> > > > >
> > > > > There are now two architectures, so maybe it's time for a new config
> > > > > symbol which would be selected by arm64 and riscv64 and then used here,
> > > > > e.g.
> > > > >
> > > > >   if (!IS_ENABLED(CONFIG_NO_EARLY_LINEAR_MAP)) {
> > > >
> > > > I see v5 left this as it was. Any comment on this suggestion?
> > >
> > > Introducing a config for this only use case sounds excessive to me,
> > > but I'll let Rob decide what he wants to see here.
> >
> > To me, the suggestion is less about trying to tidy up DT code and more
> > about bringing this comment about arm64 and riscv64 not being able to
> > use the linear map as early as other architectures up out of the
> > depths of DT code. Seeing an architecture select something like
> > NO_EARLY_LINEAR_MAP, which has a paragraph explaining what that
> > means, may help avoid other early uses of __va() which may or may
> > not fail quickly and cleanly with a BUG.
> >
> 
> You're right, do you have some bandwidth for doing that?
>

Sure, I'll post something today.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
