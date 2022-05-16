Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6262CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMiiBREX5rbD0usLfMIviO8PYFmWnrjX9NUxGSh1P2Y=; b=XhyqIbPb1RgDXc
	0Wt2frpOWMHedu8rBRjP/a8zQRI3De1JC8Pt3TO7lL8kIJ2ahabr17SwW21DUcjRniCvYgbK+U/bj
	ghmxNUa7UVeCAeCO4c4CPsIUcwOgfacq5emXJwfF/ZtViP5d/GQ/daZxfxOMSHWXgt2w17TogNtix
	MNjXy9oYoUjTmhY0DBXc1K4+fpZeCxo9wj+2gn1BYKj1lPXuPRqGgnP7m7PGakeliww7NfDLtJl6j
	A94FkYHFICjo+UsOchnEJkLdbaivJCunRgqDhovg9v+V9EXhqP6LnxDULoJpdI98X6jNMRCywppd4
	KKSx2WMse8BEvz+1p44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqWjL-006pzz-4X; Mon, 16 May 2022 09:09:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqWjJ-006pyV-67
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 09:09:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso10508820wma.0
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4y1lUQE4jcfytaW0Wa1mHb+7bWWQjJjq9fZCketHKQ=;
 b=X1DNS3izGDmG2ZzNwvKwxubD4dAzvtune5mqBpUfMaC9AZjnraMTJnXgdFUIyF2x8l
 LpSUaDNEShEjSSelQzC1RgUbQEVH4tRAKa8t5gVFugBLXmG8gwhO+xsowghGh1Z86GSI
 h68cyD6r7+NpmD0LUWLywlB0zmSOm5GJxaT8l/5sYrnNyYCUtNR16XtgoBxDfZQQMSY7
 mmDv4thUTnvZkUNzp8v5ULMPpXBqIlv4QwUiL7c6NFJ+DNVEeXBm7z0Z2imtZrkK/Wq+
 Z4gDfU9HjbF9BLHILP8lNkrvw7yNct7x6tCww/34XQf+x906GIwQASqqcESIo1cu6LBE
 4UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4y1lUQE4jcfytaW0Wa1mHb+7bWWQjJjq9fZCketHKQ=;
 b=Gby2dTG6g9qW8puXKcSCyujqRRbWkKvfxmc3JFWoTPzNSbjzOom0t/DRJLt8VfcCHq
 jUaDGywj1XzkY2fqzkADEy+5VsZmsUFVXAuZo9PfApdJSDcg6JhP0YG/SN168C4tBR8Y
 ME+2BdpNrMviVFQDduhW0eR1FlIx23kEbGLCdu1TTOzlU2OmTt4EPHmdlWxpeTjpDK2t
 yXATR4pjJYJgQ055uXWvFD9M2vrAUwkDT93juxp3teXtTgsh+OL+E0SqrGDEebXJUR36
 Pyr05SWPveGTUTYpdc+ry44SP+jSFHI8rsmDvx0YE6v1SR744Djp73veKAl1PD5UAtEO
 eqLw==
X-Gm-Message-State: AOAM533xTqnpZpMQSPsk/QPk0vXhXcdq77t+RjmKphmLXlfSQt/5Gz8B
 FmSI/RgB6f7cwzB5N/qYItsR+gMVnSnJDPZiL20AmbE0RYX16Q==
X-Google-Smtp-Source: ABdhPJzaH5D/cwvGZZz2FqkpuCt6jbGdMpmbQ0qiLJscQytQAeNBmss4eT1Hr7IgpgoBwJev5e9CSA8k5/ijl63BYYY=
X-Received: by 2002:a05:600c:19c9:b0:394:766a:318d with SMTP id
 u9-20020a05600c19c900b00394766a318dmr26005246wmq.199.1652692163753; Mon, 16
 May 2022 02:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-10-heiko@sntech.de>
 <20220516061057.GL12339@lst.de>
In-Reply-To: <20220516061057.GL12339@lst.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 16 May 2022 11:09:12 +0200
Message-ID: <CAAeLtUA1FWQRot6=zHXWBa3YnfxuhL2TW-a-TNomDeUFPrrz1A@mail.gmail.com>
Subject: Re: [PATCH 09/12] riscv: add RISC-V Svpbmt extension support
To: Christoph Hellwig <hch@lst.de>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, wefu@redhat.com, liush@allwinnertech.com, 
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org, 
 drew@beagleboard.org, arnd@arndb.de, wens@csie.org, maxime@cerno.tech, 
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu, 
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com, 
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org, 
 cmuellner@linux.com, Wei Wu <lazyparser@gmail.com>, 
 Daniel Lustig <dlustig@nvidia.com>, Bill Huffman <huffman@cadence.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_020929_314534_7F4BF488 
X-CRM114-Status: GOOD (  17.78  )
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

On Mon, 16 May 2022 at 08:11, Christoph Hellwig <hch@lst.de> wrote:
>
> > +config RISCV_ISA_SVPBMT
> > +     bool "SVPBMT extension support"
>
> I don't think this prompt is very useful as it doesn't describe
> what it does.  But do we even want people to disable it as it is
> really essentially for a fully functioning kernel and a pity that
> it took RISC-V so long to get there?

Given that RISC-V is (in some ways) an ISA construction set, there
will be valid use cases for embedded users to disable this (e.g. if
they have their own non-standard way to configure these).  So while
kernels for binary distributions (and desktop, server, or
general-purpose embedded) will always enable these, I would fully
expect some users to want to turn these off.

@Heiko: I would request that we have a longer help text on this, which
explains what it is and ends with the usual "When in doubt, say Y."

> > +     depends on 64BIT && MMU
> > +     select RISCV_ALTERNATIVE
> > +     default y
> > +     help
> > +        Adds support to dynamically detect the presence of the SVPBMT extension
>
> overly long line here.
>
> > index 5f1046e82d9f..dbfcd9b72bd8 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -14,6 +14,9 @@
> >  #define      ERRATA_SIFIVE_NUMBER 2
> >  #endif
> >
> > +#define      CPUFEATURE_SVPBMT 0
> > +#define      CPUFEATURE_NUMBER 1
>
> is errata_list.h really the right place for architectural features?
>
> Otherwise looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
