Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5A4C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 21:16:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF0ED60FE4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 21:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF0ED60FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TazXsVXGmksVaGlyvtjyhgWoe7OIpUO1fQrgDV9omLY=; b=qk9vXI6aCKrUfnAVw5cCL+P05
	tfM+eJZU6bv1pgaJamqJ4WLGP2QTgAYGTeghmy8IdAFp7RBPA99SLz0NVeVFkl/WyYD096Csv4Muc
	YoEmNqw7hJdXRIKCgOTot8Cao1QTaNKW3LIGA9KO9jHSldYUij3SUEpQ1ugeLdcYuNLCBh9GD8shl
	v4rP9Rw8nXRCRTxddd6zMu1eNXCCs7+ylAEBVePtLKZC1aQWgb1F36zWYCR0SbBvXQQd563uOzWtd
	jwVWMi9eqOWyaoR5khD35sbuIEhL6ap3fEZaMkGTsy5h9txyHMQbsih2aO5ESzCjlVDGPCjeZsxb1
	7Zj46sImA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldJRw-00CVNW-8U; Sun, 02 May 2021 21:16:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldJRs-00CVMz-6c
 for linux-riscv@desiato.infradead.org; Sun, 02 May 2021 21:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=; b=cUv8XVXvn2SeCFlM18xdScY5oO
 XGs3R3Bt5MPutHv2VDTDyzPcvAvjOpfkS3O90Wk3sGgcR9CIgMGael6F5C8itOibGd7WVu4J4Ke7v
 G+PizJTxRaQ8EhTr+tm82RR9f1Lvv9Nk/a7dhzCPrYFDTH89iR42kFjqgnuN1Hkz1XWyAQ3Fg4+tU
 vj1sk+ByLHbvIYHdMxpMUCvhOX0MRnP6Cb4+14Xses2Pw9rIjgPL5wxqejF1D6Ccxw76luMx+gvcF
 MAKssQXLCQ95bAicTHhjkQ8CV7Y8A8JaWQyaszOnxjJF4GuC4M2kr3mGfKr88Di93ukwdXs4niWxS
 VvM0Cg0A==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldJRp-002gwg-98
 for linux-riscv@lists.infradead.org; Sun, 02 May 2021 21:16:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id x19so5247057lfa.2
 for <linux-riscv@lists.infradead.org>; Sun, 02 May 2021 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
 b=YBiD6aB1h/sCqYhKTphH+dg0wIZGGo6mw2O+h2UbBPaKs2j+amxCQcnTb6T4EcSFDi
 569RK7dsnKNOuJGN1Zq3Sl1+5gAq1k0k2Eo073vJURqtQ79ulv+UTiBKQN1QHx0TnXJL
 8kMigLRMuOZq6Z9mW4YA2S0oPDLTJFBkJG6AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
 b=HL4hWcLaNqcpYcl7SA8+gur1AXni6/iCkqOapOvnQrlIUQYwInriAPNjyYk+1LY71U
 2/y327b+KsBe7q6r2coDkGBnxqMQd4hdeXcqKsiV7/IyHFsRhxTfWksmQ+wwjmF8VJOB
 DZ2Uvzb5koTa/abBLnNr/JFZee9LrhjOxBTfhPAw8DYvWGm8gKeciX77lWVSAXN9/2HT
 2ad+915VDa7oSH3r42aQ3A8Rnne5XVLHKy4TocV5paaaYhL3gtvsJT7qzFMczd1L5xdO
 sC4S16JKqashomYUXpCJrUNvh+oCJ/Se2vvk9Z0Y/UjrxTBh/1lJTne22ahGso1+3525
 nTAQ==
X-Gm-Message-State: AOAM531dR+PCpIl6bMyCwsE2VXokUTlbCsB8hSsiTUgC0WaVyd2lmDNS
 Lvhy1/iTeyW1c0ATnETw7zUA3RstNQCSwjh+YdQ=
X-Google-Smtp-Source: ABdhPJyNfZ5QYjsL+qGd9muUl8wvrU2B31+FvINlsgLPOucFGSnCvlfZT5r6nR4MXiDPi5D5bRLhKQ==
X-Received: by 2002:ac2:53a2:: with SMTP id j2mr11376197lfh.246.1619990175109; 
 Sun, 02 May 2021 14:16:15 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id x19sm1038827ljh.50.2021.05.02.14.16.14
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 14:16:14 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id z9so756927lfu.8
 for <linux-riscv@lists.infradead.org>; Sun, 02 May 2021 14:16:14 -0700 (PDT)
X-Received: by 2002:a2e:330f:: with SMTP id d15mr11126850ljc.251.1619989727157; 
 Sun, 02 May 2021 14:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 May 2021 14:08:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_141617_334075_2DC47FF9 
X-CRM114-Status: GOOD (  18.41  )
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

On Sun, May 2, 2021 at 1:38 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> The point is, you inconvenience users if you require a compiler version
> they do not already have.  Five years might be fine, but three years is
> not.

So this should be our main issue - not how old a compiler is, but how
our compiler version limitations end up possibly making it harder for
users to upgrade.

Of course, one issue there is whether said users would have upgraded
regardless - if you have a very old distribution, how likely are you
to upgrade the kernel at all?

But we do very much want to encourage people to upgrade their kernels,
even if they might be running otherwise fairly old user space. If for
no other reason than that it's good for our kernel coverage testing -
the more different distributions people test a new kernel with, the
better. And some of the less common architectures have their own
issues, with distros possibly not even supporting them any more (if
they ever did - considering all the odd ad-hoc cross-compiler builds
people have had..)

This is why "our clang support requires a very recent version of
clang" is not relevant - distributions won't have old versions of
clang anyway, and even if they do, such distributions will be
gcc-based, so "build the kernel with clang" for that situation is
perhaps an exercise for some intrepid person who is willing to do odd
and unusual things, and might as well build their own clang version
too.

So I really wish people didn't get hung about some "three years ago"
or similar. It's not relevant.

What is relevant is what version of gcc various distributions actually
have reasonably easily available, and how old and relevant the
distributions are. We did decide that (just as an example) RHEL 7 was
too old to worry about when we updated the gcc version requirement
last time.

Last year, Arnd and Kirill (maybe others were involved too) made a
list of distros and older gcc versions. But I don't think anybody
actually _maintains_ such a list. It would be perhaps interesting to
have some way to check what compiler versions are being offered by
different distros.

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
