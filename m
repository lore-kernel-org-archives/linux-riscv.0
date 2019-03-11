Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095B72084F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+ZKrCHJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Jbr9GUCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095B72084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1loXMc8FcraIM14OFjYvlUmXBLX8cPJrM8KQVvqQ2WQ=; b=O+ZKrCHJdTI/IP
	gXymOEZIra5KE8WlPjequPjcNis1Rkc+487bFZRgvHSUgKZ9ioSPECzeYLW4CxKE7Jg7gfmF9VISB
	Wt6DtQfubvYLi/PaP23cDeBQY36uHv0hDTwPXSHYdhWnxq01F7kqHoFjOfsCzeheJGrCmUNGt9hgq
	WTqeFlteW6OClZXyeIccF29OoBmwUhBYk0GDmJugVlkQNj33td4AHEo5IkXUqTtzVf7MBdX5FNJwr
	ru4Ee5sCuX065xWvrqq+R/Z/4E/pB/GlVG39PqDFhslg40YVIE0KDAUiAZjYz1o6FUXffiJHxNkOw
	VXoYvd2pyiwd16tmmXQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3NfJ-0008VP-Hm; Mon, 11 Mar 2019 16:20:37 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NfG-0008UI-17
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 16:20:35 +0000
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x2BGK45W014604
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 01:20:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x2BGK45W014604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552321205;
 bh=J2EdVSMmdVb73H7hclqhuXeBYWCnyXXRAAl39GsBCyU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jbr9GUCrbDqCMDuTMdRmqH0KTMCkskLwi9Ya5m0mLdFbZo2Oub59T6hLLURA1oqK8
 6FbHfQGBHqScjvs7XBenKXupoH0427lazeYw51SfIgWrvJbrjHCi0FXCKn7KSPRNAl
 IQmmmkiqLR9zVE+rbT08sjcRRVKTn6pcrqQgxBc3zlBaHkTAzivb7dpYiH4liIDFum
 0dkOvqrtoN44sToT7hmb7lBlr2Ny2QKAaGPkbnEhFoO2wke2FIKVospdOS3SeM3rbF
 uG596JuI48+HixMgOCu+9mWLnbzWBPvRaG+JjRFjbG9FAAb7ZrUVc7rrJYyyKYcyOQ
 DS6aFdDvB4x6w==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id j12so3080146vsd.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 09:20:04 -0700 (PDT)
X-Gm-Message-State: APjAAAW9XQXifSSpzUPbxjexWfsvf2FGHiSK2UHoecK6ToVf7fmFsDiP
 u+1OTdFOmzNFiRn4nbON8GKaj3CE10g4hA3/nnU=
X-Google-Smtp-Source: APXvYqy8Hp4yuoC9tjYEKoLSVSOg7YGAF2RZugJBbadOrjo58qsbNZdSq7uwdIITP/hALlq2dVQK6TEwY+Gy/AD3IAw=
X-Received: by 2002:a67:7bd3:: with SMTP id
 w202mr17253529vsc.179.1552321203680; 
 Mon, 11 Mar 2019 09:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <1552049064-32044-1-git-send-email-info@metux.net>
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Mar 2019 01:19:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUc3CQXDKogH0MVWCbWatQK0-0PRrG5QbOaz+bb_rMsA@mail.gmail.com>
Message-ID: <CAK7LNARUc3CQXDKogH0MVWCbWatQK0-0PRrG5QbOaz+bb_rMsA@mail.gmail.com>
Subject: Re: Debian build polishing
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_092034_281559_9448500A 
X-CRM114-Status: GOOD (  17.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Riku Voipio <riku.voipio@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Robo Bot <apw@canonical.com>,
 linux-riscv@lists.infradead.org, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

(+CC more debian folks)


On Fri, Mar 8, 2019 at 9:45 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Hi folks,
>
>
> here're some patches for polishing up the Debian packaging stuff,
> so it can be directly used w/ usual Debian machinery like
> pbuilder, git-buildpackage, dck-buildpackage, etc.
>
> These expect debian/rules to exist in the unpacked/patched tree
> and drive the whole build. Currently 'make deb-pkg' does it in
> the opposite direction - it creates debian/rules and fills in
> some data, that's derived from .config etc.
>
> My goal is building the kernel package in exactly the same way as
> any other Debian package - so there must be a debian/rules as the
> primary entry point. To do that, w/ minimal change and w/o breaking
> the existing machinery, I'm going in several steps:
>
> #1: add Makefile rules for retrieving missing makefile-internal
>     variables kernel config system .config (eg. kernel arch).
>
>     this could be used for other build systems, too.
>     just call: `make kernelarch` or `make kernellocalversion`
>
> #2: add an env variable for changing the name of the rules file
>     generated by mkdebian. When coming from an existing rules
>     file, we can prevent this from being overwritten.
>
> #3: add a generic debian/rules file, that calls mkdebian to
>     create the remaining debian control files (w/ rules redirected
>     into nirvana)
>
> The existing `make deb-pkg` is bypassed and remains ontouched.
>
> One point still puzzling me: once the debian/rules is applied and
> somebody calls `make deb-pkg`, he'll end up w/ unclean tree, as
> now a git-tracked file is changed.


Then, setlocalversion will set -dirty flag.

Committing debian/rules looks questionable to me.


> Perhaps I just change deb-pkg to call debian/rules then, but I'd
> like to hear your oppinions about this, before.
>
>
> What do you think about that ?
>
>
> --mtx
>
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
