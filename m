Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC90C43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 08:14:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB216208C7
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 08:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWGUX9AY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB216208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MY24Q50SCkf2gfTr67++zHBQRmm3dqkL4xUnzvU4Czs=; b=bWGUX9AYWjqNUPzBS48tn7Omr
	JP3jB/7j0vsLEftK1+GVIHHtclUoloXkETYvp0w2vitqSoWhO1q1qzRq1Nr9unzDLDHq1PvC/8g8v
	ThNf83cwvPDVo6qxfbJ2uFdh0D8o13glo6UWQXjZn31SFrXRYJYwrcUmVPNHyQ2ssbowTkYo9Izpp
	JmIodpsfOwMS40X6dE20Buirymi9B25PAK+MrKpv0aLAXHQjI0+6RHMbnkgNCW7kPvwed5SqdEkAq
	P/NK+hzHClQ9w/R26I6vh0w7obxWm5/pQ/ndkxTwbWflAxlFatwt8r7fNHosrL/rLYEs8vQ2EyLCG
	0MvNL2RZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCHn-0000J2-RV; Mon, 07 Sep 2020 08:13:59 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCHl-0000I7-77
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 08:13:58 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MspyA-1kYmT00uvQ-00t8kp for <linux-riscv@lists.infradead.org>; Mon, 07
 Sep 2020 10:13:50 +0200
Received: by mail-qt1-f172.google.com with SMTP id 19so7823117qtp.1
 for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2020 01:13:47 -0700 (PDT)
X-Gm-Message-State: AOAM532SKNaoda9h3NJt5ratgP1CSgugW+FkIi/g/83p4SbzZTjzD/pr
 eD308cmj2zIILLOoFnnzSBa+e/HphAdgwJjlXLw=
X-Google-Smtp-Source: ABdhPJyqFRCsrEeyEM7bZdvSSTo4jU+m6vlP8peN5tbIXRsYf0JCy1F91ON0vW5MemSI01VaMJ40x2L3jNNufU0/pXE=
X-Received: by 2002:a05:620a:15a7:: with SMTP id
 f7mr11286689qkk.3.1599466085512; 
 Mon, 07 Sep 2020 01:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
 <20200904180617.GQ1236603@ZenIV.linux.org.uk>
 <20200904223518.GR1236603@ZenIV.linux.org.uk>
In-Reply-To: <20200904223518.GR1236603@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Sep 2020 10:07:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1doHskr=8uPrGetCAtD7QTRS5r=cfy6VJSoDsnE0=Aaw@mail.gmail.com>
Message-ID: <CAK8P3a1doHskr=8uPrGetCAtD7QTRS5r=cfy6VJSoDsnE0=Aaw@mail.gmail.com>
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from, to}_user
To: Al Viro <viro@zeniv.linux.org.uk>
X-Provags-ID: V03:K1:L0sna3yw++0RgqSSWA/KsjwKlVYuakgzEkFzvzra0Oz0aKjXtUm
 kpdwkTjI2MjT2sKnC3p0f5GoK7pw/ZyToAOHqIlsjRzUclDMKygLry1GvghOe2ypfE83PjX
 HlUZj0b/mW4NvzGVB8ySUAYPdXsbj0Kn5u3t/wAGY8lk1nImRzxsGV6DkZylzjXFqjCRSG6
 +nLu6Z12t6oo8Zxurxy+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vAUmkS/hYUo=:X+C+bYXXb43wmlp3FJ5rjk
 fd4/157W6lIAXEcoTWOTQrJJVBzXgili+QJVQ+5XmwCMlpD7fIeuqr06CWz4qRMXfHpM7EzSS
 H37YVuiag2gPZuLsfLa1iqp5o8JDP8EAdHjQFfEGwt0jzvHaw2NpKVjikucU7faH8fwcYmYOM
 fTY/MYdci027PxznR/PRpSXV+9VbKR2u0yYbezlju7CqlbtG16yOdZ4qC2yh3EHw2L1s5KDHV
 kEk/BltvU/EDj65HOCgofc9O4Om1oV3zjC8XVdQUH/NEwWngZd03f54bDXIq4jTXP0skoV6Fu
 G9bYsd2LNmsWBZsilH6ZYWELXD26fRY7Fjal27synKwgQRIW+xY3SVLRH23YEnwJhrN73dUj7
 zY527psgEET7hD7BQdiMHVjJLzCDL8N0RjySiugX26FDx3WnHl2Vr8ckfqEW+2i9Z06byLtyz
 D024ojU9RepCgbjEr0qacjoeqDDAX1Ks4HHrAgUKB1lWB5k0WviztUL3RiCmweYi3kLIhebZ2
 XPgvFRDzjMZFQt57oFYfEpLiAgfn7TqSfgBDwtY0yoHqWxmqrxOgk3WzAoiRKh4L2vSivPlBl
 JBXAhSuyU/ZkbuUOXLjTH/TY1m8/kxWJKYRuPjyzDucCdQFBCqaTeO4Oy68zqv+Y/1ZTBd3WG
 rGdIccRShJ0qAC24S05Bz5GVPbEXaQHHY58+xX9VANY3ZfRrwKyXIV7ExdyF9LOhPQ99GBZJP
 +5hPyYcShW12lJKlqXOyZ5vl882j853tb2a+2rvBiK2HiN2/hfoP752yk1OE7G2whZvhgqgTh
 MT014ifW4lz0PpSQCO5e/eZ5TqVhxkZ2XqFkSmkVAi1b75WBxU6nZn5s0nwzrMrRf+B5ACbTc
 Fwa79wF8cznpzNbP+3/Y7ICU9cCWbWvJwLPk7uIycnoMaV93Xb9W73Kh22xjtXpIZJF337eOU
 u1FMwMVeoXSWEVCnrscHAPCgot7aGsIYHI9vevLW6Jg4TZvEvSPe0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_041357_462214_AEF62846 
X-CRM114-Status: GOOD (  22.37  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2020 at 12:35 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Sep 04, 2020 at 07:06:17PM +0100, Al Viro wrote:
> > On Fri, Sep 04, 2020 at 06:52:11PM +0200, Christoph Hellwig wrote:
> > > Use get_unaligned and put_unaligned for the small constant size cases
> > > in the generic uaccess routines.  This ensures they can be used for
> > > architectures that do not support unaligned loads and stores, while
> > > being a no-op for those that do.
> >
> > Frankly, I would rather get rid of those constant-sized cases entirely;
> > sure, we'd need to adjust asm-generic/uaccess.h defaults for __get_user(),
> > but there that kind of stuff would make sense; in raw_copy_from_user()
> > it really doesn't.

Right. When I originally wrote that part of asm-generic/uaccess.h, the
idea was that its __get_user()/__put_user() would end up being used
across most architectures, which then would only have to implement
custom __copy_from_user()/__copy_to_user() with those special cases
to get the optimum behavior. It didn't work out in the end, since
copy_from_user() also has to deal with unaligned or partial copies
that prevent it from degrading into a single instruction on anything
other than the simplest NOMMU architectures.

I'd still hope we can eventually come up with a generic
__get_user()/__put_user() helper that avoids all the common
architecture specific bugs in them, with a simpler way for
an architecture to hook into with a set of inline functions
while leaving the macros to common code, but that can be
done another time.

> IOW, there's a scattering of potentially valid uses that might be better
> off with get_user().  And there's generic non-MMU variant that gets
> used in get_user()/__get_user() on h8300 and riscv.  This one *is*
> valid, but I don't think that raw_copy_from_user() is the right layer
> for that.
>
> For raw_copy_to_user() the picture is similar.  And I'd like to get
> rid of that magical crap.  Let's not make it harder...

Agreed

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
