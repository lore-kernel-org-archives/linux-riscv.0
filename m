Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181C3C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 06:16:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75E420738
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 06:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQg7QMyB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TALpIUmS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75E420738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hh0hfrM6tkTdP4LTM0EhXrNAm682pAwQ72AHnHLSS+M=; b=RQg7QMyBPvPFeFmVaz9F2wCbm
	HaUfqWR3SO9rWUFrC7fctAPBUQaHu8ba0ZoD+1NQMbq/c+y6t3ySgWbLz7vn1NgNDGRy3kWDi4mss
	4hNcIegj5gGUAlzSUcAFY0QznGN/nuB0+hS7xNa7htWj65HApKbage+aF11z8icwKlsNHD20344Tr
	qUxZCWujlkpNecc/YCThJDbg2rITSPNTSWTR/ehpKhedXRqhrLBOQyE+9LVUgoSTLvVUlrZHSvhz3
	4LBiijdN285SS3Owy9v/IyU9M2J9t4ApcZmaV1/JdQhFrehGloVOcYpNB67BJz2qhhZt0RRQ/Q9EA
	/YyPc06Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCd6l-0003n8-HS; Mon, 31 Aug 2020 06:15:59 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCd6e-0003ll-92
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 06:15:54 +0000
Received: by mail-ot1-x342.google.com with SMTP id u25so369518otq.6
 for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2020 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3I5LujjeL7ILNQ6KrieN1i8IkA5pY4H5QUa+PdQ4xo0=;
 b=TALpIUmSCxI7Jz57R5opGXjDzPhTyBi2ccZqW6mkMTR9Lhw2WKffUsymErhXFASqja
 0m7Qo+5ZOr8mTAd1KfyJCF7vFwAv1pTGuWrWRRgAU46crjjMEMmRwCzX+Qp78EO6MkSI
 tg8u5OD7cc3yrJ5RLKJPeu1svFziTglA6HiLz/eCgszj13q26MYYRFvgswSjDVg5JzbC
 vpVAiKNs8klDevVbSoz3IR0jojJz8fuCw9sPjimwpwrbNYKDaZW/ky/ObnkVYkH1+Vu4
 VMmu9gD0XvTMnWjYQtp+6N+EKC019+CdpLmoQf+SZJQgapzramZamBYoB7+Z2rt1TNLG
 ARCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3I5LujjeL7ILNQ6KrieN1i8IkA5pY4H5QUa+PdQ4xo0=;
 b=BalRoKhdMUJ0CBKGi1Dkskk36wAuzu6sNrueOlyJfu+6Y6uRQZLwKwuRDhFimIMf2N
 6oXu6NOBpgt+9UY8FrC5NpmxFdYu56STEUTO1eKfGx9WHRrWi1FCzKgbZzquI5oWQuEj
 q07A4z7vpAxZ3J0km4fZNxZyHlKjtXm0YDUNjQNBwMhX63aZAh/lwt1m5ZerNY5PJLvV
 ag7emYdKSzKXtRGTNannLYD4jwtm9YMZfzPr+BoBWaY+bnq+3K7OuPwzoWhde1K/opu6
 aJqpEo6nHx+XIiD3krXjuSUYupwizUSP0y5AjgU67KYiTvReO128KrQVcilQpi8zKl3r
 tMSQ==
X-Gm-Message-State: AOAM530CGOLICmJX4KWpE8trXtpuYk73XMg1s+uuJV5L3O/TJK3Uql5A
 rPkOwiOrc2RpFqWfNvi0PVD/UDgaz6yEdpvhsxvTgiHBG00PDA==
X-Google-Smtp-Source: ABdhPJwX2YDWFxt6ejUMKcV0WG4NR1WX2+KgVIHXy4QQlll2wDglV/Uc3bKraQavw2X0aKcsmmwO8e8qxp3lnpN3Y9c=
X-Received: by 2002:a05:6830:1d94:: with SMTP id
 y20mr83892oti.129.1598854548582; 
 Sun, 30 Aug 2020 23:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
 <CAOJsxLHOvvt8WGQUynGkLxZCA4OQQ+KgxxJJD7s_iP8Pxf-Omg@mail.gmail.com>
In-Reply-To: <CAOJsxLHOvvt8WGQUynGkLxZCA4OQQ+KgxxJJD7s_iP8Pxf-Omg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 31 Aug 2020 14:15:38 +0800
Message-ID: <CANXhq0r2jg_fVZJE0shquGc25QNgenL+Qq6HRUBXEYPSf=QcFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Set more data to cacheinfo
To: Pekka Enberg <penberg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_021552_685136_39E36A8A 
X-CRM114-Status: GOOD (  22.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 30, 2020 at 3:54 PM Pekka Enberg <penberg@gmail.com> wrote:
>
> Hi,
>
> On Fri, Aug 28, 2020 at 10:09 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > Set cacheinfo.{size,sets,line_size} for each cache node, then we can
> > get these information from userland through auxiliary vector.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/kernel/cacheinfo.c | 59 ++++++++++++++++++++++++++---------
> >  1 file changed, 44 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> > index bd0f122965c3..8b85abfbd77a 100644
> > --- a/arch/riscv/kernel/cacheinfo.c
> > +++ b/arch/riscv/kernel/cacheinfo.c
> > @@ -25,12 +25,46 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
> >         return NULL;
> >  }
> >
> > -static void ci_leaf_init(struct cacheinfo *this_leaf,
> > -                        struct device_node *node,
> > -                        enum cache_type type, unsigned int level)
> > +static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
> > +                        unsigned int level, unsigned int size,
> > +                        unsigned int sets, unsigned int line_size)
> >  {
> >         this_leaf->level = level;
> >         this_leaf->type = type;
> > +       this_leaf->size = size;
> > +       this_leaf->number_of_sets = sets;
> > +       this_leaf->coherency_line_size = line_size;
> > +
> > +       /*
> > +        * If the cache is fully associative, there is no need to
> > +        * check the other properties.
> > +        */
> > +       if (!(sets == 1) && (sets > 0 && size > 0 && line_size > 0))
>
> Can you explain what this is attempting to do? AFAICT, the if
> expression can be reduced to "sets > 1 && size > 0 && size > 0", but
> what do you mean with the comment about fully associative caches?

If the sets is one, it means that the cache is fully associative, then
we don't need to fill the ways number, just keep way number as zero,
so here we want to find the fully associative case first and make the
if expression fail at the beginning. We might also rewrite it as
follow:

/* Fully associative */
if (sets == 1)
    return;

/* n-ways associative, make sure all properties are big than zero, it
is meaningless when one of them are zero.  Full associative case is
filtered by the condition above, so we don't need to consider sets ==
1 again. */
if (sets > 0 && size > 0 && line_size >0)
    this_leaf->ways_of_associativity = (size / sets) / line_size;

>
> > +               this_leaf->ways_of_associativity = (size / sets) / line_size;
> > +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
