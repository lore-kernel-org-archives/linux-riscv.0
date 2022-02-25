Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2ADC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W611fhPhlkDTaomB6feAFIYA73vL5jBSQf28yvxgx44=; b=XN1IXJ1o1F/609
	6H1Bqe0PyUfDMnxs4AeZ40nApd6eEkOB5iM6y3nWELwcfnnwPitbWyqsPc80/QWqADvDw0GJdQwUK
	G0kzB8HtJ7Lmkd4D53aZgPj7ox2rrQngerrH9V9Ks5ptY8G0faBdshpw/pi4/JncdeVycY5fGf1F1
	qxXNgPl6SIOsPcg0uP2B3ixT3e3NgqbVPUE0LFamv0cDiZfqc5wnlu/W7KtioLKms3rciBLujTnwh
	e+TX+Iq9+jej/J1MwGNEV/VoSfu/wCqZ9bgIspDSUYrIR94yWOGfL+o5xkHCltF1j7VfAxZuUIojI
	ULauy19Oxeg2rM8HcWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNaIm-004yrd-8j; Fri, 25 Feb 2022 13:06:28 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaIi-004yqM-EJ
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 13:06:26 +0000
Received: by mail-yb1-xb32.google.com with SMTP id u12so5735880ybd.7
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 05:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91lfqerMyrhcvkt/Xxml96fIqw1rCGTngu2Yekjv2ZI=;
 b=E+tFHAQ5pyr27wKtgDUnzIAZDktAJK1JxSFWfkF+uK5aNwQybxvr9cfZBFwUHlYZZ0
 MK6E+8qKnHRMT2xPb+Y3izP3sho0aJIaHAWWU6WGuMItBEnSLrYkcV2CPRjJzz6ddAD8
 J+br2bR3zJSJbZ1lAl0Zvhjwde64U/c0dbzLVJokqOYSaVRdGySmQbY+mcgRVV91wJ/S
 S0gSuJmSMUVTB3rcIJiMxIy2B8ateNHDJ54h/N+KaemldpyDH7ioajAiIRB41VhZYbzZ
 2wUnoYDRvJ3UgTuByfaLZj+2wiy2OjRN7WW0Gev0AeiFZk/NzaBfeAurcujexBgjgpq9
 dmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91lfqerMyrhcvkt/Xxml96fIqw1rCGTngu2Yekjv2ZI=;
 b=WQm+mTlAhloAUFtMQX40D26NNDSdmYMh2rjuyoiRJbhI2tgi2E7y2N+cG5gRff2/b5
 XmmEgHL+MHOu/mu/XR6F/6xzEoa3QX46H8SEA5ACyb60uQlGxE83nOjzqHGlk3GZXKCn
 ESr6qI7zaaRewz918D1XRtON0KmepNa3h+V4oW7oLECQtXsBqG3aP+x951rZHwn0ZjD/
 0bzkjVTRnliG6iB698ceuFKUlgPo9o8n5y6Z7TJT0BPgTzs/5Swk8H01b9vxYrZDVH3b
 GvThWC+pFmFJ9Oeodsyxk0NR3YO08pxI9RjrDCycdEBtusMn6/9vS3dd+ViScVp8WWyK
 Ur5A==
X-Gm-Message-State: AOAM533qHlBvFUSlVvM000urzREdkkF8A20rtKrIjyjWMjlRLsIoYkgf
 DbrQ/31evVKob7t1CntkgBA+HmovtzbryKxa+DUCw2Q7U5Y=
X-Google-Smtp-Source: ABdhPJxnv0D/Higle+O11O1DFAqioIx1d2WO7mloPNrhUPfrQPNRwDoAfE17Xn9OXd9PJjOxozfDe+0uLf3STxtqJ9A=
X-Received: by 2002:a05:6902:2:b0:624:4cb5:fd3b with SMTP id
 l2-20020a056902000200b006244cb5fd3bmr7286257ybh.1.1645794379723; Fri, 25 Feb
 2022 05:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
From: Marco Elver <elver@google.com>
Date: Fri, 25 Feb 2022 14:05:42 +0100
Message-ID: <CANpmjNN304EZfFN2zobxKGXbXWXAfr92nP1KvtR7j-YqSFShvQ@mail.gmail.com>
Subject: Re: [PATCH -fixes v3 0/6] Fixes KASAN and other along the way
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Aleksandr Nogikh <nogikh@google.com>,
 Nick Hu <nickhu@andestech.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_050624_512415_D9490F94 
X-CRM114-Status: GOOD (  13.23  )
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

On Fri, 25 Feb 2022 at 13:40, Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> As reported by Aleksandr, syzbot riscv is broken since commit
> 54c5639d8f50 ("riscv: Fix asan-stack clang build"). This commit actually
> breaks KASAN_INLINE which is not fixed in this series, that will come later
> when found.
>
> Nevertheless, this series fixes small things that made the syzbot
> configuration + KASAN_OUTLINE fail to boot.
>
> Note that even though the config at [1] boots fine with this series, I
> was not able to boot the small config at [2] which fails because
> kasan_poison receives a really weird address 0x4075706301000000 (maybe a
> kasan person could provide some hint about what happens below in
> do_ctors -> __asan_register_globals):

asan_register_globals is responsible for poisoning redzones around
globals. As hinted by 'do_ctors', it calls constructors, and in this
case a compiler-generated constructor that calls
__asan_register_globals with metadata generated by the compiler. That
metadata contains information about global variables. Note, these
constructors are called on initial boot, but also every time a kernel
module (that has globals) is loaded.

It may also be a toolchain issue, but it's hard to say. If you're
using GCC to test, try Clang (11 or later), and vice-versa.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
