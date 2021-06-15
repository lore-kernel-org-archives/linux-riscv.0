Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427BC48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 14:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8958E61490
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 14:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8958E61490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJOaX3O2B6p+b/ksEiKXysqwhGD3s1NDU+dcMM3MQns=; b=hyiDV8VKBRII4G
	9WPntswzizYJj4kvErb1uYWCKMXQK3SAbEWg7GTclXHwd+/caxgFHv3OJTDpCw6gE8ydLWxAxBTLW
	62xnC+uaVVA8LnXbbis1MSHuBzKPf+QLRssLwueaSPnZLaYAjdHoJffJ1vjTF+hQqQR5joE8lBom0
	FtorQHLj6iJtF8GSEuBL5YvjIC0RbwzxmvnpjUnYstc4/PSdv1MHBuxKs5SsHSyoEWdfbYzqKOh97
	UJcEhEHKa/cSy+w7BBniZZnKKycyWpwl7DOeTG7dspGWt0LGRZ/TER21VlcbbeQ1LNSpANNCyDOvV
	AiuHo0ccFIL9hvjYpjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltADQ-000eVa-K1; Tue, 15 Jun 2021 14:38:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Ng-000Hn9-S2
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:45:30 +0000
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by linux.microsoft.com (Postfix) with ESMTPSA id 93EA420B6C14
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:45:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 93EA420B6C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623764724;
 bh=7UULkM9VpH3Wm7vWsgwZVD3p39+NvKKLXs8u9XWsGBo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oq4u01Z10/CBCJu1HPj1Vvu1ftm2kYNH8idZjB5WxkhgjgnbVMq39iDdAuuSQLAKZ
 VpLVpJEDIigDfAepMNu7TJYWdwBEnpDnzMtuRsyP711OYly94uxU2aKOYJp+2iOD13
 muGQXPdC0UaG2FxC5mIDCKB+7DBU9tQHsbH7EBnM=
Received: by mail-pg1-f179.google.com with SMTP id t13so4129064pgu.11
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:45:24 -0700 (PDT)
X-Gm-Message-State: AOAM531DgqhiOjJTv4ungf5gxiL7ZzzFaab0A/Wrw/5UWZgfwNNHPN8n
 sKIf8n4ynzbRriFHl+cgC8KlHfqRaQ1hRammKek=
X-Google-Smtp-Source: ABdhPJyzNMA1hikc4GzmgcUaRxwOH9kITpR2EgDgak8cpnVdiiCAfUiybdtEp1A5PpHdPahqGVJBiDJhevSMLxRuI3Q=
X-Received: by 2002:a63:1703:: with SMTP id x3mr22496302pgl.421.1623764724145; 
 Tue, 15 Jun 2021 06:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
In-Reply-To: <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Tue, 15 Jun 2021 15:44:48 +0200
X-Gmail-Original-Message-ID: <CAFnufp208bY29Zs9w7OtMtK0vcFOs1OosO2U6tJzm6ju-Awe4g@mail.gmail.com>
Message-ID: <CAFnufp208bY29Zs9w7OtMtK0vcFOs1OosO2U6tJzm6ju-Awe4g@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_064529_028697_EF73ECA3 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Jun 15, 2021 at 3:18 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Bin Meng
> > Sent: 15 June 2021 14:09
> >
> > On Tue, Jun 15, 2021 at 4:57 PM David Laight <David.Laight@aculab.com> wrote:
> > >
> ...
> > > I'm surprised that the C loop:
> > >
> > > > +             for (; count >= bytes_long; count -= bytes_long)
> > > > +                     *d.ulong++ = *s.ulong++;
> > >
> > > ends up being faster than the ASM 'read lots' - 'write lots' loop.
> >
> > I believe that's because the assembly version has some unaligned
> > access cases, which end up being trap-n-emulated in the OpenSBI
> > firmware, and that is a big overhead.
>
> Ah, that would make sense since the asm user copy code
> was broken for misaligned copies.
> I suspect memcpy() was broken the same way.
>
> I'm surprised IP_NET_ALIGN isn't set to 2 to try to
> avoid all these misaligned copies in the network stack.
> Although avoiding 8n+4 aligned data is rather harder.
>

That's up to the network driver, indeed I have a patch already for the
BeagleV one:

https://lore.kernel.org/netdev/20210615012107.577ead86@linux.microsoft.com/T/

> Misaligned copies are just best avoided - really even on x86.
> The 'real fun' is when the access crosses TLB boundaries.
>

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
