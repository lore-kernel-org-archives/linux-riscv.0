Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F54CC4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 10:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49A256105A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 10:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49A256105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4asaDmL4e2V2v69TSZW2fqHvdLAp8kuLGmu1O9JHWIw=; b=28DzmMZSyzd/7i
	nw5pY4qvSD9rV8l44TIIOBQmwk9OERv/2xpCQkBt3eVk9SGNhMBWi/k2RR4W2ZKD5atAbZsEOZ+Jq
	YbDv7HELPVCuE5R/vc5Y9C49mUvB35snQ2JnYQxUm4q6ihlP2RhR0+Ez5joYZPNEcmYJq2bFHBK5s
	ruDul2B6/Mtq4BixHWlSYyfxsXDa5G5KYPbUrmN4lNzZCgMPlHMwDxhKGE3qUcEX+MrPhBdO0N4iF
	8BT0aPrMUqSA7xg35g/BXiqf7GOgIPJASBCoYQHbfHhEH41jG1P9VU1NI4no5WYhqe67oCj2iSJcj
	eiCQIGEv4XuM8mZMNfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBaf9-0098sH-TL; Thu, 05 Aug 2021 10:31:43 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBaf7-0098rP-F2
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 10:31:42 +0000
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8113820B36EA
 for <linux-riscv@lists.infradead.org>; Thu,  5 Aug 2021 03:31:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8113820B36EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1628159499;
 bh=ePlKPhwRIbIIFc+MuT827+okoKvGxizkUBUP/w4ErsE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pjAa4Q58vbxnUikwyYqOtoHBFxksV2ox51gdNK8v6ZdmyeLfBka8OCjfdWkiu/oQR
 8Io+iu0nNtKxyKl2Jn9y+eBlz9MQWvgCaFoqtiQcluqUgeqL1GkwiDN+LfVHszd+np
 EA0N1IBvlOvftaEGDTq/I2JWJJ+4umT2At7V+VHc=
Received: by mail-pj1-f52.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so8268078pjd.0
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 03:31:39 -0700 (PDT)
X-Gm-Message-State: AOAM533/s2r0VdUq43jvYvViXL7jMF3kfrloGZPlrkkIgTOuVUhEdQx2
 fxgNWhzq4ivSw7qct+IIbklu6tzZCto98Bniavo=
X-Google-Smtp-Source: ABdhPJxdohcSXq2Fna33fIGUiEu6kUIdxZ6/UhzFU8Koaz6JrTkw4lOh1yVNgX/OfIBQqhE040kGEhxRvLm7q8DNB0E=
X-Received: by 2002:aa7:80d1:0:b029:399:ce3a:d617 with SMTP id
 a17-20020aa780d10000b0290399ce3ad617mr4286293pfn.16.1628159499106; Thu, 05
 Aug 2021 03:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFnufp1QpMc87+-hwPa887iQQGCjjkGNanVSKOUsE-0ti82jrA@mail.gmail.com>
 <mhng-7b8d3a12-e223-4b69-a35a-617b0d7ac8f7@palmerdabbelt-glaptop>
In-Reply-To: <mhng-7b8d3a12-e223-4b69-a35a-617b0d7ac8f7@palmerdabbelt-glaptop>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Thu, 5 Aug 2021 12:31:04 +0200
X-Gmail-Original-Message-ID: <CAFnufp0eVejrDJoGE900D2U5-9qi-srVEmPOc9zHC5mSH4DgLg@mail.gmail.com>
Message-ID: <CAFnufp0eVejrDJoGE900D2U5-9qi-srVEmPOc9zHC5mSH4DgLg@mail.gmail.com>
Subject: Re: [PATCH] riscv: use the generic string routines
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, David Laight <David.Laight@aculab.com>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_033141_674461_5C781C80 
X-CRM114-Status: GOOD (  20.16  )
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

On Wed, Aug 4, 2021 at 10:40 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 03 Aug 2021 09:54:34 PDT (-0700), mcroce@linux.microsoft.com wrote:
> > On Mon, Jul 19, 2021 at 1:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >>
> >> From: Matteo Croce <mcroce@microsoft.com>
> >>
> >> Use the generic routines which handle alignment properly.
> >>
> >> These are the performances measured on a BeagleV machine for a
> >> 32 mbyte buffer:
> >>
> >> memcpy:
> >> original aligned:        75 Mb/s
> >> original unaligned:      75 Mb/s
> >> new aligned:            114 Mb/s
> >> new unaligned:          107 Mb/s
> >>
> >> memset:
> >> original aligned:       140 Mb/s
> >> original unaligned:     140 Mb/s
> >> new aligned:            241 Mb/s
> >> new unaligned:          241 Mb/s
> >>
> >> TCP throughput with iperf3 gives a similar improvement as well.
> >>
> >> This is the binary size increase according to bloat-o-meter:
> >>
> >> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
> >> Function                                     old     new   delta
> >> memcpy                                        36     324    +288
> >> memset                                        32     148    +116
> >> strlcpy                                      116     132     +16
> >> strscpy_pad                                   84      96     +12
> >> strlcat                                      176     164     -12
> >> memmove                                       76      52     -24
> >> Total: Before=1225371, After=1225767, chg +0.03%
> >>
> >> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> ---
> >
> > Hi,
> >
> > can someone have a look at this change and share opinions?
>
> This LGTM.  How are the generic string routines landing?  I'm happy to
> take this into my for-next, but IIUC we need the optimized generic
> versions first so we don't have a performance regression falling back to
> the trivial ones for a bit.  Is there a shared tag I can pull in?

Hi,

I see them only in linux-next by now.

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
