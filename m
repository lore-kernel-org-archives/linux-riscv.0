Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411E3C2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 22:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F20586128C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 22:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20586128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ4EjscZhi5SkjPW4aJUVxYnKEQAZEa9mBW2CkcJI+w=; b=bgC/8G3tomnwiq
	OpWt6z4GUhE32xaGqxo5hlGDScp8uNJanXbbummBz4wKJCusWYlcphCIOKokLJvW2gN/aoMpwTrk2
	sCfGpPqcBrm045yCRYtUOWm8uDY/TQN7ZPO9g12UBCl5/fb6BqCJ9XDXVg11ltwpk/tKuIL6IHVHe
	k3aHf1a17Okm6nYedUDnBYKePuvK1QnOb+UM3M7RMsBuv6fSy7PpUE44zDKj/2uNv7NT8QbH2tUGp
	IwZq+/FQevwyRKiCaDAp++eCEMRx/8FN+L+6CDoWbiKGcA/jpdQU9z5Y6wXW4hduHe/TtshyRiBoe
	LXbXOZX5DL6/u25a1eJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvpHb-008gOZ-2O; Tue, 22 Jun 2021 22:54:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvpHY-008gNb-Tu
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 22:54:14 +0000
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by linux.microsoft.com (Postfix) with ESMTPSA id 00D2420B83F2
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 15:54:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 00D2420B83F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624402452;
 bh=Tl/MqcbHnp8xGqeWdgRroSBwVZt7wf+ch9P7/tROCwQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LZr8dere25hRYrIwsqepbSC7c9RBhgWJoAio/czDnnDRic+ysxh9KIqgIXm6i1rt5
 rDq8tNDYywd347O4qai+01tQx6NAl0zCU46QTfdG07VpOrD9mYak/dcFqTbR6poEnP
 rByhGtU52fE4oGJkbKcyiPevkbeo+j81WCsfi0aA=
Received: by mail-pj1-f48.google.com with SMTP id bb20so312908pjb.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 15:54:11 -0700 (PDT)
X-Gm-Message-State: AOAM531bhYmXgXtZTRoQ4ahDPlSiObKaPNN5uUJMki/f5X9u3mYoczBy
 7gzp3HbrAmNBTSsprQREG5Pzza69kPyZRvrXIRk=
X-Google-Smtp-Source: ABdhPJwur4gE5RoxKcLIaOyclPiSjF5vB4YWJrdEMaEpXNmQlecOYJB/5NdbhATAhHnr4SEgjhJIq+fga2b+ZlM+mbE=
X-Received: by 2002:a17:90a:1e82:: with SMTP id
 x2mr6352268pjx.11.1624402451512; 
 Tue, 22 Jun 2021 15:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
 <YNChl0tkofSGzvIX@infradead.org>
 <17bb90eef20145cd9cca1b8e72a514ad@AcuMS.aculab.com>
In-Reply-To: <17bb90eef20145cd9cca1b8e72a514ad@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 23 Jun 2021 00:53:35 +0200
X-Gmail-Original-Message-ID: <CAFnufp06+s43z5SxL48LB73=GdzYFiq578MCHZ_NMUNZkwdo9g@mail.gmail.com>
Message-ID: <CAFnufp06+s43z5SxL48LB73=GdzYFiq578MCHZ_NMUNZkwdo9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Christoph Hellwig <hch@infradead.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_155413_040736_7A1C44F8 
X-CRM114-Status: GOOD (  17.76  )
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

On Tue, Jun 22, 2021 at 10:19 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Christoph Hellwig
> > Sent: 21 June 2021 15:27
> ...
> > > +           for (next = s.ulong[0]; count >= bytes_long + mask; count -= bytes_long) {
> >
> > Please avoid the pointlessly overlong line.  And (just as a matter of
> > personal preference) I find for loop that don't actually use a single
> > iterator rather confusing.  Wjy not simply:
> >
> >               next = s.ulong[0];
> >               while (count >= bytes_long + mask) {
> >                       ...
> >                       count -= bytes_long;
> >               }
>
> My fist attack on long 'for' statements is just to move the
> initialisation to the previous line.
> Then make sure there is nothing in the comparison that needs
> to be calculated every iteration.
> I suspect you can subtract 'mask' from 'count'.
> Giving:
>                 count -= mask;
>                 next = s.ulong[0];
>                 for (;; count > bytes_long; count -= bytes_long) {
>

This way we'll lose the remainder, as count is used at the end to copy
the leftover.
Anyway, both bytes_long and mask are constant, I doubt they get summed
at every cycle.

> Next is to shorten the variable names!
>
>         David
>

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
