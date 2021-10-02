Return-Path: <SRS0=Ne9D=OW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25425C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 17:21:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF1061A7D
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 17:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF1061A7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+kBY6uDKIyNmEufAW6d7dep5T2LeCXflFFnRvFi5gg=; b=y+4IWK5ujkpTll
	v/+bDAoCo/BWhDTpSnQYgm7JfzTAe6ypI0qEBDEn1iwb/EBJhlLY2Kys/qNV19t4L/S1/CwaHcqiq
	OUowua1tGihqy0LGhXSWDXO1SnM4GaQ8bBPLmszQ/VY3eEa2wmB8y8UAxR+38e5P+UdZAFQCFRxMM
	cnqfm0Ka6ifdXX7QDT+sWaXmERyqamcKSaA3lXMdtLISdBoWScNb44Dpk0MXlsSlqtdBp/+V0vf8S
	RZhAi9lUhrUffAOlvdQ4ieae3xbu0NfudBIdRpgkRRiiNO7lrNy9zsJ0sajp8+Ymjax+p+su+tAyo
	QspUA4YqF0ZMXOOcw5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWih7-002Wbo-So; Sat, 02 Oct 2021 17:21:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWih4-002Waz-UK
 for linux-riscv@lists.infradead.org; Sat, 02 Oct 2021 17:21:04 +0000
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by linux.microsoft.com (Postfix) with ESMTPSA id A9A6220B4841
 for <linux-riscv@lists.infradead.org>; Sat,  2 Oct 2021 10:21:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A9A6220B4841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1633195260;
 bh=pWCqFFkYasORJJMiOzE5VQLaiyHxduAqYZzlCIytLqQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LyKrWMc38OVWl2j9tIYxU3ZFOduqLihYwvTtN171qiIhb3+T9MTX0va4g/YVFU62x
 XHX/SCETWaXXuR9pGbnaHiejpw9tyr1vCA5lpM5q7KyOAUE5ovJjUjvCHFheHtzO6d
 w2HUr0aShPeR9dZOpCNqrEpn531swZTi1scougEw=
Received: by mail-pg1-f181.google.com with SMTP id 66so12059807pgc.9
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 10:21:00 -0700 (PDT)
X-Gm-Message-State: AOAM531QJyhqCPy7I3utlicRJibrRmDys5YiIKV/UoB67jq8XK+8gnZ8
 3h7QqmTZ4+aSK7m7wqpMWCTAm7IgXpbII9UlxaA=
X-Google-Smtp-Source: ABdhPJwRgcg38SDaLtejzUC7b3vUQaLoXhosdn0Luf4+osGEZjiBK/kt73FsWwkr6Ivx47XCMUrE42724JxbuCOWnTQ=
X-Received: by 2002:a65:528a:: with SMTP id y10mr3603950pgp.103.1633195260173; 
 Sat, 02 Oct 2021 10:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210929172234.31620-1-mcroce@linux.microsoft.com>
 <20210929172234.31620-2-mcroce@linux.microsoft.com>
 <20211001112354.GA10720@duo.ucw.cz>
In-Reply-To: <20211001112354.GA10720@duo.ucw.cz>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Sat, 2 Oct 2021 19:20:24 +0200
X-Gmail-Original-Message-ID: <CAFnufp3uD7Wx=TnHYFaHBCy3mQu08zvv2NO=dws=tOMkKTpKCA@mail.gmail.com>
Message-ID: <CAFnufp3uD7Wx=TnHYFaHBCy3mQu08zvv2NO=dws=tOMkKTpKCA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] riscv: optimized memcpy
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>, 
 Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_102103_072915_4F521F33 
X-CRM114-Status: GOOD (  20.48  )
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

On Fri, Oct 1, 2021 at 1:23 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Write a C version of memcpy() which uses the biggest data size allowed,
> > without generating unaligned accesses.
> >
> > The procedure is made of three steps:
> > First copy data one byte at time until the destination buffer is aligned
> > to a long boundary.
> > Then copy the data one long at time shifting the current and the next u8
> > to compose a long at every cycle.
> > Finally, copy the remainder one byte at time.
> >
> > On a BeagleV, the TCP RX throughput increased by 45%:
> >
> > before:
> >
> > $ iperf3 -c beaglev
> > Connecting to host beaglev, port 5201
> > [  5] local 192.168.85.6 port 44840 connected to 192.168.85.48 port 5201
> > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > [  5]   0.00-1.00   sec  76.4 MBytes   641 Mbits/sec   27    624 KBytes
> > [  5]   1.00-2.00   sec  72.5 MBytes   608 Mbits/sec    0    708 KBytes
> >
> > after:
> >
> > $ iperf3 -c beaglev
> > Connecting to host beaglev, port 5201
> > [  5] local 192.168.85.6 port 44864 connected to 192.168.85.48 port 5201
> > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > [  5]   0.00-1.00   sec   109 MBytes   912 Mbits/sec   48    559 KBytes
> > [  5]   1.00-2.00   sec   108 MBytes   902 Mbits/sec    0    690
> > KBytes
>
> That's really quite cool. Could you see if it is your "optimized
> unaligned" copy doing the difference?>
>
> +/* convenience union to avoid cast between different pointer types */
> > +union types {
> > +     u8 *as_u8;
> > +     unsigned long *as_ulong;
> > +     uintptr_t as_uptr;
> > +};
> > +
> > +union const_types {
> > +     const u8 *as_u8;
> > +     unsigned long *as_ulong;
> > +     uintptr_t as_uptr;
> > +};
>
> Missing consts here?
>
> Plus... this is really "interesting" coding style. I'd just use casts
> in kernel.
>

Yes, the one for as_ulong is missing.

By using casts I had to use too many of them, making repeated
assignments in every function.
This is basically the same, with less code :)

Cheers,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
