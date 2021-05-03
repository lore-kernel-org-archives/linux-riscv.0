Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B07BC433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 11:38:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99A646103E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 11:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99A646103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WLcXGeKWFQDi77vCObcJqjx55X7asIhut9kafBcZDu4=; b=fRSX5pwRSpd+Cjja9pOXZhx+g
	Ni2BPnDRu/afhji0+mpkWz/XR+x53TlUuRS2nm76w+lUJZu48Ss0oO0NK2xCkngpPI1wnu5X5ZuFn
	TbUYirKIW/AFxFgJj3IymaaOKWb0KWtHLhpqljrvO1X4xf0uGXpmt+7C9pmhrLwUzzayK2x8+RvDX
	/fNAH3m5qD/KrlJFjutkoxUI5ShXFvoCPZwGUq6K5SatrHPndi6A5s+4k9AaqcKUlWhRcodBiKTMV
	GHWS685jR15ZVYGJrhBA8ixA++xGmJAnS+0yv7IEb1KtjqeAdP/HKsor4HEsQeBCIEhcZvikjOiSG
	lQFpsKyhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldWta-00DlYM-IW; Mon, 03 May 2021 11:37:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldWs9-00DlLv-Ue; Mon, 03 May 2021 11:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QGraUf8N3sJ1aJwRoluRH5lxaNYz5v4100GlVPYI/b4=; b=W4OvdDMMRmGUpFT1TwSkHy6f23
 +kOj5TLv1bzrfIN6JDI8nCasDGrgfTu25mwrQCioQK0OVjaH47BS474J95qsfL+GXQacKSocBfuMU
 OiY/W9DuGiYbdg2pYn6mqsH3+BwgZteKImW6tZH9yfjsKtAqnf0byAL5zWZLV/JSUaCQisi0ssJ6A
 QfR+v9s6st6XasJiiWfPKS5rNQKCf/NgBhbhYEQsw2tworCiTgBFlIzusAC6O6+hjMF6hpwNsOLoG
 3xgxM3DnnDrRr6Vk8oYgA/fxk/sEAGgaQOclC+hLdIfBWcItf+L9oQ7sakSFGcQ99WqwQ2RrNjveg
 oVzyY9yA==;
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldWs6-00318h-9E; Mon, 03 May 2021 11:36:20 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTRIg-1m0XOE3azk-00Tp4q; Mon, 03 May 2021 13:36:14 +0200
Received: by mail-wr1-f54.google.com with SMTP id l13so3572316wru.11;
 Mon, 03 May 2021 04:36:14 -0700 (PDT)
X-Gm-Message-State: AOAM53010y5ed5gDXrlmqMVNwF7lEu6FPlA/C43PiQbnCwtnC0vdGjxn
 vjYStFzFLg/m92DXzPI9azcc7oVTP7k2ARYTVtE=
X-Google-Smtp-Source: ABdhPJwIvsv/yMchaa4sUSYzSCPmfiG5zkCBHBNNq2yUma7fb0HtVe+fV0tBIbTslxWLhW72fs4l8PW7OasotEimGEc=
X-Received: by 2002:adf:d223:: with SMTP id k3mr24144176wrh.99.1620041774578; 
 Mon, 03 May 2021 04:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
In-Reply-To: <20210502223007.GZ1847222@casper.infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 13:35:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:mp0O0TeafIdQqfz5hmXct5bOLIQPz8jXZgbrEfKp/IT1Wol3lUs
 0208JIjPbM1oLrM18r2PMc4zdXBJxfxntyMxGK6GeG+qULloqnE2CEY36FwJPRifkpnKtHk
 +JOmvv4dQjqQrX9hiJ514awXb/AHxdOuQ2i/eu90wgoWKsl17ujXi7Sq29PwAs1JL2QemWu
 vYkMwpD919s0cFsKIrhQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NXKvrdKh7+Q=:JWlILXpuyA6SqK2MkEW1zn
 3HYN6Q+NlNofUjE5ldT3q7sXhh8k0JJJwRb38RlhKBxgMDl1+lvjA6pHmmMUCbmPc3LQt/ix4
 N3sIYi1i7S+hTLswngGxncEDWeT37/Vl3tUb56OYGGBBhfw+YETs2ToAYPxpiivK/Wnrb+0gs
 Ti+v0/g+kRIISBDiB8IO29qrEgtrijR9CubDpiJ3fuXQ0ji97gxEq93/4Ly3QwL5k32SMNAyI
 PFqP90t6PgXzqJrp2ZLITVkeJsAf7YJgPbgr3nJSxXdwituro/VuFsackLpkfb/s93lOHFip1
 mjSi11lUZ+rbTa/hn/TmycCImY5hxzmDu/d/fyMClph2hU5opnu/ZHFKO7bNr6xOJJqqwx43Y
 f9fIvlGTvFj36/wbgrMinThpDZnf5ziMjZam4qMR6YVEbqE57Z55WnxKfAanEXCMJbgbF7lWV
 9ZsyOEbIKg0CCv2PksSBQ1iCroNS4ZjNHtZ4WSt0FS3WFo80AxrSfYrsAhMJEO1ck34nMIizF
 HiDKR3V3zyyGLqUTruSjUqmjSLeFs96paTJdJ4VkIa+E+FFshW8X0CtWEP0OX4jaFnu2JPTMg
 JbnZ5sHcBwLh/YG84sFgRAlrQ9jSXS8zAWUuHOic5Q0anuKmpTSADXjpvmUi98dHpMtw8wyYe
 THEo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_043618_636992_67E26D24 
X-CRM114-Status: GOOD (  22.71  )
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

On Mon, May 3, 2021 at 12:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> > What is relevant is what version of gcc various distributions actually
> > have reasonably easily available, and how old and relevant the
> > distributions are. We did decide that (just as an example) RHEL 7 was
> > too old to worry about when we updated the gcc version requirement
> > last time.
> >
> > Last year, Arnd and Kirill (maybe others were involved too) made a
> > list of distros and older gcc versions. But I don't think anybody
> > actually _maintains_ such a list. It would be perhaps interesting to
> > have some way to check what compiler versions are being offered by
> > different distros.
>
> fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
> Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
> Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.
>
> So do we care about people who haven't bothered to upgrade userspace
> since 2017?  If so, we can't go past 4.9.

I would argue that we shouldn't care about distros that are officially
end-of-life. Jessie support ended last July according to the official
Debian pages at https://wiki.debian.org/LTS.

It's a little harder for distros that are still officially supported, like the
RHEL7 case that Linus mentioned, Debian Stretch (gcc-6.3),
Slackware 14.2 (gcc-5.3), or Ubuntu 18.04 (gcc-7.3). For any of
these you could make the argument one way or the other: either
say we care as long as the distro cares, or the users that want
to build their own kernels can be reasonably expected to either
upgrade their distro or install a newer compiler manually.

Looking at the Debian case specifically, I see these numbers
from https://popcon.debian.org/:

testing/unstable: 16730
buster/stable: 113881
stretch/oldstable: 39147
jessie/oldoldstable: 19286

Assuming the numbers of users that installed popcon are
proportional to the actual number of users, that's still a large
chunk of people running stretch or older. Presumably,
these users are actually less likely to build their own kernels.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
