Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E5AC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:59:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CDE61157
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CDE61157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2aUzMW0Tioz7dSK+IQ3NB9FwLZtlhqH/nVx97U2qYgo=; b=MLXug+te0y5rO/ctV5YCKw+ta
	Moqz06fKQ9yblbVzMkJnB69Pl/OAF9qDqpGoPuL57OYKeCOhCNZty/TJG6GZCuGGKRgpSYrMnE8Ye
	rOs/lf+XAeTKahL/kz0ir90y3nbh7XZx/R6PM0nN0CFEzW0y7ZuKL0DEEN5WoVBfxjY8eBKxvHe+E
	AQrNuGZY6pUgNY2cNTmIKqaPvtDP5sMqzKi2t6ncEldFEb74VZ16d0PgqV+KAHlZokeTQLdiaUXjR
	82JJ9YCsvq1+gNaHYuUjcj9wnTOYsKltaM/r7dDEFQkj4yx2lL8r5my+d/hQUzD6Y77tiuQY3687a
	uu1p3sr0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldVMJ-00DbcM-Oa; Mon, 03 May 2021 09:59:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldVLM-00DbVf-4c; Mon, 03 May 2021 09:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dk+hpgKDs7zb+Jf/5p9WgRYtrXjb4LieXdBldX0g7TU=; b=p2vGfRMaaEAX6lCQLcIfzLrB5M
 bivBdCGyfLzZ7u4Dzg2l9QrqWgOaeBalZRKqWynoNJtmPZLexG1XLxvyyUNaJabm3goj9qPrkn3Fh
 O7s5wxY6CJdWtOxjUxcDly3gPs4hlvGsPjAjeyB/Btymq3bMwJntZu7+bpLoMggJ5PQFiLiz774op
 tZMnRxf8T9AZibJYKcO85eI9TTb+ui8wv9e7ccHwxwCZC1yJtijA4fJBp/SRNKHHUCtr+RJqD70OT
 PBf9N70O/hA/obkeI9tFQI1sphIHalPp6arzaWzRvp4N6kfok/XJw4MZUcyuzfKqNofy0+A5PDVIb
 zgik8WkQ==;
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldVLJ-002xdo-74; Mon, 03 May 2021 09:58:22 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MOzjW-1lw9DW13gi-00PN9f; Mon, 03 May 2021 11:58:14 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso2961164wmj.2; 
 Mon, 03 May 2021 02:58:14 -0700 (PDT)
X-Gm-Message-State: AOAM533pv4a+VXEtE4VzKt8+VWNWSCw0eQ5EF2mvGdsrt/ylhA2vZ3aF
 WlOIub4lgQ7O0zdWdPd97G4fb9ePUFiGOZ4xKSY=
X-Google-Smtp-Source: ABdhPJwLwM4+7HWAumVwBVTy8mKR1bNlDKElkSrFM6JnoDhONvF95iiZ55DXUZCRZ5QgHthYE50RJYfEuqYwOiecy7Q=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr20474973wmk.43.1620035893994; 
 Mon, 03 May 2021 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
 <20210503004457.GI10366@gate.crashing.org>
In-Reply-To: <20210503004457.GI10366@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 11:57:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a19QJ_5tbbEq2f9=XKjVYUZcAy8QMvoM=8SNEdCnvmwyQ@mail.gmail.com>
Message-ID: <CAK8P3a19QJ_5tbbEq2f9=XKjVYUZcAy8QMvoM=8SNEdCnvmwyQ@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:H6JCGoqn+L4zyA4r+if2rcSXgoTZNIXWVMFR0cAqQgGUdMYk8ro
 bminRlmsncQ5WYSdQAFi4N8MFHmQZpsqABUqjUt+a1PvybZLjCUEK+rCiXRjharfm67BWoj
 SDxWeguE7T36/4bH6mQWHJK51xKbATIjUm3qgCuEFzcPjx39790wWOCqCCMM6a59RvpafvN
 knCZ2TfPw8g8U3uMXVjEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nrzfN7+Xa0Y=:dQ/BQDsoofAfb1xFPsKkph
 OzphfGsDNF7sugQfRaW08sRnFaqufZlYwUYdssPrVhXcvPODCxLz4KCvQGZA2hlt0n39Oj77K
 c9o5lp1iNtK66mM6tqyqweGrIYfjSJaQtzVFsztgI+WKEicket6yaDTyrw6bXfc3TsylDOcah
 cduBVUmS463wbVKezJUp337B1iRbwZNxAbX8+Gxvk7NQm9v+ZpP67Sw1C9FW8t5vKrKw4nhZi
 lDgmosLK0o3DLvCJBH7qu2WSND/0/4pIw+kf/DzofeVUAgCA1eCc7552YXn8wcu+nC3K27onb
 HEzEyPKLFNiAsoSfPj2chdiNaPdkQFrae4Ae9b/9y52qBPRLN8GWEC7KNxjqzc+HkVbCeY4oQ
 kVC4dshEEy4e0YeHLGNzHvpPwdZPGAvvL6UxP9Ew+HDc9w/0G1KCGcB3zkuE0PgDCTsp/+akD
 LMPUheh7F0kx1vyPoQurR7f4pwBf2gVvkoE6DLWBZ6uHIznO5Igbzwx7gkg5cYmt3a68a7/wI
 7TJzlwUJvnC/AZCJHq8mPGLSeOMaU5o1W5wJnm66hhAu8bT9nzjQ7vKCRAjieU3jxyIvCpWKv
 CN9QY0QmRbjXiLPOZlh8DJkZ09uSgiI+zFcYD3rWjr1UqKPTgHQvtlrgaivNuRsFA7oskzje5
 8vLk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_025821_584172_E5F6E7C4 
X-CRM114-Status: GOOD (  20.36  )
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

On Mon, May 3, 2021 at 2:44 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sun, May 02, 2021 at 02:23:01PM -0700, Joe Perches wrote:
> > On Sun, 2021-05-02 at 15:32 -0500, Segher Boessenkool wrote:
> > > On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
> > []
> > > > Perhaps 8 might be best as that has a __diag warning control mechanism.
> > >
> > > I have no idea what you mean?
> >
> > ? read the last bit of compiler-gcc.h
>
> Ah, you mean
> #pragma GCC diagnostic
> (which has existed since GCC 4.2).  Does anything in this __diag stuff
> require GCC 8?  Other than that this is hardcoded here :-)

The '8' was just a kernel thing, we made it configurable to have version
specific warnings, and I have a header file that adds these macros
for all supported compilers, but the version that is in mainline only does
it for gcc-8 or later.

Early compilers only supported "#pragma GCC diagnostic", but I think
even gcc-4.6 supported the _Pragma() syntax that lets you do it inside
of a macro.

It's something we should improve with plumbing on top, e.g. I want
a macro that lets you locally turn off both -Woverride-init on gcc
and -Winitializer-overrides on clang. It's not a reason to mandate
a newer compiler though.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
