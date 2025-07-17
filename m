Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B403C83F27
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkEQORr58sYLpp+Cv1z5BxCBCzG1+oxDCN186IA7nzA=; b=ZZPaaZSS26lMla
	CX3fF7XV88QNciGEgAVixPQNGNhWFbwQ6iwDnEJUh2RV3MSgnnLG7AemE39xWhpn+VmO9VPB8QZwX
	uL8x87kvqTeD5EzBny6nzI+nIWlG9tCs0HZdhlF8iGDV2zEy/3uTL+w+Q8Wx+1buJ4qsnuU/AOy8u
	28bWFK5+krLLAfNEQZREZeX9v4NOUd5VMPYExxSV67IJivU/mBhNX9+Q8TWqGBz246452Ru5te14R
	NbegXMtDVWemYUN5F84YgyZOroW36ua+FQC5eOFR2Uw/oqETQ2E1GTdLmQIjOo9yy12aXHV45gHFF
	ZmH+a/3lr2gzmUFsm7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucF7q-000000096vX-3BN1;
	Thu, 17 Jul 2025 03:17:38 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucF7o-000000096vC-2yTS
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 03:17:37 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-615a80bb75cso134638eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752722256; x=1753327056; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y81AqTyJAgC90px8z1GDMnTxobUHSoeR1l3JmPgATFQ=;
        b=Tk8NZw1n6EbxWIIFzPUuv0YNfHY54DvlA3ily0d2/MzCNs7bqO6U24yCbEqruXpKW7
         lfxIzw8071xFY6vS6cGqWdJQB1/9FzULI5AX1fi81gAbVTWUBMONgQfr9DypeE/cKjjD
         Y1G6NUil73PWing8+wH2I3hFoxXQHvp73Uk8ZEzjkt5U1ASQp1j/oISTjV9fChgc6Ha9
         qDhRkYYxu2Az9pGDgv8syEbHS51kun6RuzUVNG95dv5aCDFYvawQDUdR2c+7VFLnT0r6
         sO41YTohZGBPNrhV+AxAAj92odBGepWKp6fr2CpCLMy1+Kp78ksWI5bz142183n+7Wj3
         0yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752722256; x=1753327056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y81AqTyJAgC90px8z1GDMnTxobUHSoeR1l3JmPgATFQ=;
        b=KAJUR6al1S/A11nibwiPk7SS7qaul56VEEVB7Xod3osvY7vti1VTixBCKaGlyUIypL
         tQF0S6VXHaKM/2M5h2lClLNQjWpINeeyxA6kfEaTzsgtk0qHSnkjf4c+pAz+3HSF2QNU
         DpcX0rDM4mKMU+qzbgEiekideZnm8bcTnZ6QVLds9O9WFA7YpUy08sR/K/8HywSYt4c9
         wdkrmh0MHNzpAjoH0Q53G76cTCTGvUh6uhByM8C1X5g56OhAbcLnlZjBDbAZZxXs75OV
         WvpFdoVypq/sNCJpB2EIYt3mMfDdjKj7/A+sxwiNcb0M/g7+SXxqYCKMqyGhdL/ObXoW
         4RPA==
X-Forwarded-Encrypted: i=1; AJvYcCWZNvTlbl1cHDOxX3/nc0Cu1Yz77lmjfzbdBBPsuXNdjYvepsap1xECV/DGpgJutGJZJzaG/YXgd6n3ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyedqMcZmpMTgCq1MmFb/H41j4b5o9msqE4kJ0lFtCZTE2jmdO5
	xHHJPzoQx7+DaCMz3MiJY/BN7wk7y3zkJBFN58c9gJj+KViDVSIsX4Cdf+LltDW8LL7fJLCXwsb
	KhFQW7zK3PHLk0zQlPFjX7Mo1yNfBl24=
X-Gm-Gg: ASbGncuGMTPy9kXhgQmt0PmjPjfw52ZIoZrCSYhw/7iHU0Vco82xASA5DSbK4o+lATB
	xrJQ1H0x/V3XRBKOLOc6PKKq8YThjcW8BgPpq9CGqvt20/oq6Y3OqqD9sXyjpaycWfBRaK9Hteg
	YaZWKpC31HFX2k2+7Al1I56guBzFg/S8O9g4FUz8JNJD/kT+gohq+eGWp6X76UAU9olRK+WUEGh
	90EzGyuAUvpHsR4ZaLO4G3A/HYM2mEb2uVKulU=
X-Google-Smtp-Source: AGHT+IEtivipB9g5w338UTRAKjaClj6lUtcIUZrPdJL7TzeqNtyLNmcxsaTO5OsL1EPNBz4plqK1kSPLlVSgIdEoJBw=
X-Received: by 2002:a05:6820:2d0c:b0:611:4701:bcd2 with SMTP id
 006d021491bc7-6159fee52d9mr3917716eaf.6.1752722255686; Wed, 16 Jul 2025
 20:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
 <20250711100930.3398336-4-zhangchunyan@iscas.ac.cn> <69e3f295-3b43-4a13-bb84-3f9a89171331@ghiti.fr>
In-Reply-To: <69e3f295-3b43-4a13-bb84-3f9a89171331@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 17 Jul 2025 11:16:59 +0800
X-Gm-Features: Ac12FXzbOyvDEa_I8t7LghI6yF9EP3lV6Llna9xJ2JKwX9MGZBvjrNJNq1DOr7g
Message-ID: <CAAfSe-vMGzJOwnTyo-O6WKZmHLY=FMBEVde6h=j52W+cSOwSaw@mail.gmail.com>
Subject: Re: [PATCH V2 3/5] raid6: riscv: Add a compiler error
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_201736_752350_A9A300FF 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Alex,

On Wed, 16 Jul 2025 at 21:43, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> First, the patch title should be something like:

Yeah, I've also recognized the phrase is not right when rereading
after the patch was sent.

>
> "raid6: riscv: Prevent compiler with vector support to build already
> vectorized code"
>
> Or something similar.
>
> On 7/11/25 12:09, Chunyan Zhang wrote:
> > The code like "u8 **dptr = (u8 **)ptrs" just won't work when built with
>
>
> Why wouldn't this code ^ work?

I actually didn't quite get this compiler issue ^_^||

>
> I guess preventing the compiler to vectorize the code is to avoid the
> inline assembly code to break what the compiler could have vectorized no?
>

This states the issue clearly, I will cook a new patchset.

Thanks for the review,
Chunyan

>
> > a compiler that can use vector instructions. So add an error for that.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   lib/raid6/rvv.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> > index 89da5fc247aa..015f3ee4da25 100644
> > --- a/lib/raid6/rvv.c
> > +++ b/lib/raid6/rvv.c
> > @@ -20,6 +20,10 @@ static int rvv_has_vector(void)
> >       return has_vector();
> >   }
> >
> > +#ifdef __riscv_vector
> > +#error "This code must be built without compiler support for vector"
> > +#endif
> > +
> >   static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
> >   {
> >       u8 **dptr = (u8 **)ptrs;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
