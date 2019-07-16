Return-Path: <SRS0=54+r=VN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D19C76192
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 08:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6ED72145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 08:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KiDgFbSP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="xjl0EfoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6ED72145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lfydy/s2L9cTJJcPYzUfny5N61PywKvPXiv0cEEnENU=; b=KiDgFbSPoZVyzXxHiWneQRPehV
	UCAYc8dDHkDAxaEf0eCA4019RGDZwbFapaYxdfbAkLgIKWBrqirEP6QUWQC3po96swQqJWfQ6MzEP
	o3JMI5WJOGuSnm36CIammwdFLOsxrCXl5deJna2F773IeFHcCzQNCjPdohr7LD8aDo2J7neavjDj7
	F4iOGQ6w6AmV5dn0b3dAzki8QYme8CzijXhgWHT6CCcQtTojFKR9Mfb8x2Q/w65aYMGqkO21mFn45
	3nJuFRCwPw3YWcACNy5jEgC5p+4JZLAdoAbhJFudprK18fpv9P1LIZ6wvDOOv01BLgGIYvMFKlofq
	Y/ITAE5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnJJL-00069D-Nr; Tue, 16 Jul 2019 08:59:47 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnJJI-00066G-Vz
 for linux-riscv@lists.infradead.org; Tue, 16 Jul 2019 08:59:46 +0000
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x6G8xPdb013005
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2019 17:59:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6G8xPdb013005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563267566;
 bh=Z7uszMuyFiQN/JEv5Khco5zhTZDWKsMGjjbxCAL2vn0=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=xjl0EfoUv2LWcMjHaWGJj2QAp+PfZ4YAY4bubrXbkpoFfvOCMnapa2uch+59w+yWD
 gY9NAdqzbKPiEnX1d7Pq5ODK9kXyjpf8eEZj/Ki4dL7WqngIhizzkSgbU+Fqzcld5s
 r6yu2xB4hmGghppKBI2mIk9QUbtYW+1ngkmoN6loLx/R4wuKzFp8NUq3E13F3t0jYV
 dRolajvEYtHcArbARa/nLw0DsxXoLIUHpNKypzDhB2wawcPGWHFwNrcjKAicw7+e0f
 gJT9IGkJqZi2UuRM0oQDkHhMkoLvvJCYHr0gnCcR3omz7xVkqOi3NrX1vwJs7yIfb7
 thtpmAOBNxjwQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id 2so13357262vso.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2019 01:59:26 -0700 (PDT)
X-Gm-Message-State: APjAAAUuodzMWQS198rU+CYH7gRXZ7iz/Bm1NERKYEL8gmrftLHVqtov
 FkJcsp0FdJXcTKrSNtQY92X/1aoDa5bEx99Beys=
X-Google-Smtp-Source: APXvYqxWiERg3AnjFRNlCdVDv8wJv18i4DgeGMwOj5CNPv8VuDfBCsO+imH1kcAW5CJWBWqHfIgf1nWfGnDUuHnSoC0=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr18872370vsl.155.1563267565192; 
 Tue, 16 Jul 2019 01:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
In-Reply-To: <20190715191245.GD3068@mit.edu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Jul 2019 17:58:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
Message-ID: <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
Subject: Re: [PATCH 4/4] debian: add generic rule file
To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>,
 Joe Perches <joe@perches.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_015945_262556_39D060D6 
X-CRM114-Status: GOOD (  25.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 16, 2019 at 4:13 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Mon, Jul 15, 2019 at 08:56:25PM +0200, Enrico Weigelt, metux IT consult wrote:
> > On 15.07.19 14:28, Masahiro Yamada wrote:
> >
> > >> The rule file contains a rule for creating debian/control and
> > >> other metadata - this is done similar to the 'deb-pkg' make rule,
> > >> scripts/packaging/mkdebian.
> > >
> > > I saw a similar patch submission before, and negative feedback about it.
> >
> > Do you recall what negative feedback exactly ?

Sorry, my memory was broken.

I did not like this patch set from the beginning,
but missed to express my opinion strongly.

I want debian/ to be kept as a drop-in directory
for packagers, without replacing the upstream debian/rules.

If a check-in source file is modified in anyway,
scripts/setlocalversion would set -dirty flag,
which I want to avoid.



> It's possible I'm not remembering some of the feedback, but the only
> thing I recall was the comment I made that I'd really like this use
> case:
>
> make O=/build/linux-build bindeb-pkg
>
> to not break.  And as far as I can tell from the proposed patch series
> (I haven't had a chance to experimentally verify it yet), I don't
> think it should break anything --- I'm assuming that we will still
> have a way of creating the debian/rules file in
> /build/linux-build/debian/rules when doing a O= build, and that the
> intdeb-pkg rule remains the same.  At least, it appears to be the case
> from my doing a quick look at the patches.
>
> > > Debian maintains its own debian/rules, and it is fine.
> >
> > Not for me, I don't use it - given up trying to make anything useful
> > out of it. It's extremly complex, practically undebuggable and doesn't
> > even work w/o lots of external preparations.
>
> Yeah, the official Debian debian/rules is optimized for doing a
> distribution release, and in addition to the issues Enrico has raised,
> last time I tried it, it was S-L-O-W since it was building a fully
> generic kernel.  It's not at all useable for general developer use.

It is OK if the package is targeting normal users instead of
kernel developers.


> It sounds like what Enrico is trying to do is to enable running
> "dpkg-buildpackage -us -uc -b" from the the top-level kernel package
> as being easier than running "make bindeb-pkg".  I suspect this might
> be because his goal is to integrate individual kernel builds from
> using Debian's hermetic build / chroot systems (e.g., sbuild, pbuilder)?

I am OK with generating debian/rules with 'make bindeb-pkg', a shell scripts
or whatever, but I dislike to commit it in upstream git tree.

debian/rules is a hook for packagers to do their jobs in downstream.
"We kindly committed a generic one for you" sounds weird to me.

-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
