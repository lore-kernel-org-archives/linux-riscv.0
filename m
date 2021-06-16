Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E307C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 19:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F16611CE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 19:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F16611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6GEIAc89HnZLGASQ0c8wqKynOPswHpK6GeLECO3fnk=; b=V5l4eDcCwWf7lx
	o9oRCrHoiorA/3QvqhmpGZNSUQkXQKxOuMTDkyjDuf0AdOz+/sdpRo/+Y5Z68AfYra9BU5BGQYzFt
	fz/V1brE362sJZ4gJ7rxLrlyBh2iRgl0mcfdwFSCzsG2jAirq5GRuEMk7t/zsssrNI3/0NmPmGMEv
	Mw4nCzHGfgMp/EdgYgtDos+8hzAQgvLDFBTDHUy0fEFPxtfm+VPqJnr9ZYRH6wHD9C/1AZWvJWerA
	QTSdOTzleJT+8ta72YuUk9tvIuZqT4kznJafCcPcCYNDV80SSQ0w80NH1vc4cvKJUxsW8/GOUuY71
	oh1iehEXZXsLBfQ2i+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltasf-007VNk-LJ; Wed, 16 Jun 2021 19:07:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltasc-007VN2-J0
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 19:07:16 +0000
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by linux.microsoft.com (Postfix) with ESMTPSA id EF5CC20B83FA
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 12:07:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF5CC20B83FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623870434;
 bh=pMMmTT3PXQgTrevuxlj2F3JLlcd4EM9l6Fepj29X/Bg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fnIQibaX/TJP/gqa9cx6DHuiUdafKIEgVMx4RI11DnYKa2iIhp+TnDagsVnoX6c0L
 anCASR4fGPGJcZoWzGdVTeTN/VsuL9VjP/X5Hhj3L3qqf9j4fYZwU1t88ZNkh4IHHs
 pBzgVi5y+ffbWWWT3KWHBEVA2lBFk3Jdtcgy/tP4=
Received: by mail-pg1-f178.google.com with SMTP id l184so2766371pgd.8
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 12:07:13 -0700 (PDT)
X-Gm-Message-State: AOAM532eoAFJaF1jdZbDS7laAH7S+KyddfHXFcUZCVKJepiY+30Dv8Rv
 VfqAC+OWaVq3gXK2lNv6nd/EYc2YyPHNjX2ZBos=
X-Google-Smtp-Source: ABdhPJx9sD4Hv60I5h6KAYTe91Zo1s5HoDH8VwMli9/OBjeUKnpAHtllS55ebWXOgWb1A5g5i1Y5vWiMz6iFCmYlJ6k=
X-Received: by 2002:a05:6a00:24d0:b029:2ed:c309:8b0f with SMTP id
 d16-20020a056a0024d0b02902edc3098b0fmr1281204pfv.41.1623870433450; Wed, 16
 Jun 2021 12:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
 <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
 <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
 <CAEUhbmX_wsfU9FfRJoOPE0gjUX=Bp7OZWOZDyMNfO6=M-fX_0A@mail.gmail.com>
 <20210616040132.7fbdf6fe@linux.microsoft.com>
 <db7a011867a742528beb6ec17b692842@AcuMS.aculab.com>
In-Reply-To: <db7a011867a742528beb6ec17b692842@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 16 Jun 2021 21:06:37 +0200
X-Gmail-Original-Message-ID: <CAFnufp2OiF6-ta5og9u-foKDT2fqE171NvfowFkUr2jc4KJEDQ@mail.gmail.com>
Message-ID: <CAFnufp2OiF6-ta5og9u-foKDT2fqE171NvfowFkUr2jc4KJEDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Gary Guo <gary@garyguo.net>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_120714_711978_3C1F805F 
X-CRM114-Status: GOOD (  29.86  )
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

On Wed, Jun 16, 2021 at 10:24 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Matteo Croce
> > Sent: 16 June 2021 03:02
> ...
> > > > That's a good idea, but if you read the replies to Gary's original
> > > > patch
> > > > https://lore.kernel.org/linux-riscv/20210216225555.4976-1-gary@garyguo.net/
> > > > .. both Gary, Palmer and David would rather like a C-based version.
> > > > This is one attempt at providing that.
> > >
> > > Yep, I prefer C as well :)
> > >
> > > But if you check commit 04091d6, the assembly version was introduced
> > > for KASAN. So if we are to change it back to C, please make sure KASAN
> > > is not broken.
> > >
> ...
> > Leaving out the first memcpy/set of every test which is always slower, (maybe
> > because of a cache miss?), the current implementation copies 260 Mb/s when
> > the low order bits match, and 114 otherwise.
> > Memset is stable at 278 Mb/s.
> >
> > Gary's implementation is much faster, copies still 260 Mb/s when euqlly placed,
> > and 230 Mb/s otherwise. Memset is the same as the current one.
>
> Any idea what the attainable performance is for the cpu you are using?
> Since both memset and memcpy are running at much the same speed
> I suspect it is all limited by the writes.
>
> 272MB/s is only 34M writes/sec.
> This seems horribly slow for a modern cpu.
> So is this actually really limited by the cache writes to physical memory?
>
> You might want to do some tests (userspace is fine) where you
> check much smaller lengths that definitely sit within the data cache.
>

I get similar results in userspace, this tool write to RAM with
variable data width:

root@beaglev:~/src# ./unalign_check 1 0 1
size:           1 Mb
write size:      8 bit
unalignment:    0 byte
elapsed time:   0.01 sec
throughput:     124.36 Mb/s

# ./unalign_check 1 0 8
size:           1 Mb
write size:      64 bit
unalignment:    0 byte
elapsed time:   0.00 sec
throughput:     252.12 Mb/s

> It is also worth checking how much overhead there is for
> short copies - they are almost certainly more common than
> you might expect.
> This is one problem with excessive loop unrolling - the 'special
> cases' for the ends of the buffer start having a big effect
> on small copies.
>

I too believe that they are much more common than long ones.
Indeed, I wish to reduce the MIN_THRESHOLD value from 64 to 32 or even 16.
Or having it dependend on the word size, e.g. sizeof(long) * 2.

Suggestions?

> For cpu that support misaligned memory accesses, one 'trick'
> for transfers longer than a 'word' is to do a (probably) misaligned
> transfer of the last word of the buffer first followed by the
> transfer of the rest of the buffer (overlapping a few bytes at the end).
> This saves on conditionals and temporary values.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
