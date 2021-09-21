Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A90C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 15:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B19160F56
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 15:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B19160F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHwukAoG2TAtzu7PJNoXNo2YYaesq6871DToxa4VML4=; b=qar8d1QwtOqlYI
	15o5IAZNu2LhjgnDhgxmuEUaaMlVct4pJcPrr2Gam6KRc/qsMfYBlyz0WGvmY6psApQ4ZfjEjhzsD
	fpS53fy2ojZcvgnIjC2nISEqs3rNKP21sBPL9ehM9E2NvPL6Pym+Qd2/4HKVJpWz5Dwx5xXTLVJPl
	s0bweOZ/zI48b1pCUb04G0011WV0ItN8XFIahJNA2cBOB9LtSBEe3XRJGxZZimu7UjUmWl0IT0BJR
	h/T29uT/PIEJGOLd4JKv9y+fbI4LJhsoLtcaAXib993Kc5uQZvyxnt5TJQSkuFxT4HSnmVUfANi5q
	hMcXDyWKZGo1g76QiMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mShuX-004wrp-BY; Tue, 21 Sep 2021 15:42:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mShuU-004wqy-3n
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 15:42:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7E4260E08
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632238936;
 bh=fsjbdWhaoEfRC8WZUJZWmQoz3Z1K+BhTC5bgPI2OUwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T8Dele6USWsyuWm+XdmdEVndgpotPyRX51J0C97UMLPZK+cs57qWNnXeDGcaI/tHE
 NZQ6uJPDPFgbZdPrUbZ3cyL5BCvmr1jYlok2zdpPVjk/QGx+qg2V91BzO+xKh8lnLn
 VBh7fcjv76RU3jre8m3EvDJ2ilZd7oa4Mnw2yLBd5WogsyPvJeEapkIQbWQgLWaSqJ
 uDliGOCuF1Do10zh80FfSBJebnARX4xCFAFlT8Ke3y9dT6/JsKtAX/L5bWF4YPd97A
 fJQqsA19AVvmuURB6muhMQixeLL8Mgh89ckPMQIG4tsi9mxvSzE5mzo/MynitI8BtJ
 4WmrECufvO6dg==
Received: by mail-wr1-f53.google.com with SMTP id q26so40472692wrc.7
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 08:42:16 -0700 (PDT)
X-Gm-Message-State: AOAM5329GlvdNxLqjBGzZYnzBwBgr/UzTAVRQcD1eWLVt7Rc0/iggrJW
 NVM65Jk5lHiZq3fTlLjUp0B6qOEXmi941K+MLwk=
X-Google-Smtp-Source: ABdhPJxGTopYiF3OBAqRLkSep1+4ZT7zRaVkA2do2C6Qe3HFsc8eV27bRIwi9KNJqEZq+iitDSLyD3XEYzWG5Cg6+sg=
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr5344103wmp.35.1632238935395; 
 Tue, 21 Sep 2021 08:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
In-Reply-To: <YTkjJPCdR1VGaaVm@archlinux-ax161>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 21 Sep 2021 17:41:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0tswcc1icb99cmdX7w0nBc4CAXjaAKJMuYSdJC1MS8YQ@mail.gmail.com>
Message-ID: <CAK8P3a0tswcc1icb99cmdX7w0nBc4CAXjaAKJMuYSdJC1MS8YQ@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_084218_250194_CE412969 
X-CRM114-Status: GOOD (  23.08  )
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

On Wed, Sep 8, 2021 at 10:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Sep 07, 2021 at 11:11:17AM +0200, Arnd Bergmann wrote:
> > On Tue, Sep 7, 2021 at 4:32 AM Nathan Chancellor <nathan@kernel.org> wrote:
function 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]
> > > arm32-fedora.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: error: stack frame size (1376) exceeds limit (1024) in function 'bw_calcs' [-Werror,-Wframe-larger-than]
> > > arm32-fedora.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: error: stack frame size (5384) exceeds limit (1024) in function 'calculate_bandwidth' [-Werror,-Wframe-larger-than]
> > >
> > > Aside from the dce_calcs.c warnings, these do not seem too bad. I
> > > believe allmodconfig turns on UBSAN but it could also be aggressive
> > > inlining by clang. I intend to look at all -Wframe-large-than warnings
> > > closely later.
> >
> > I've had them close to zero in the past, but a couple of new ones came in.
> >
> > The amdgpu ones are probably not fixable unless they stop using 64-bit
> > floats in the kernel for
> > random calculations. The crypto/* ones tend to be compiler bugs, but hard to fix
>
> I have started taking a look at these. Most of the allmodconfig ones
> appear to be related to CONFIG_KASAN, which is now supported for
> CONFIG_ARM.
>
> The two in bpmp-debugfs.c appear regardless of CONFIG_KASAN and it turns
> out that you actually submitted a patch for these:
>
> https://lore.kernel.org/r/20201204193714.3134651-1-arnd@kernel.org/
>
> Is it worth resending or pinging that?

I'm now restarting from a clean tree for my randconfig patches to see which
ones are actually needed, will hopefully get to that.

> The dce_calcs.c ones also appear without CONFIG_KASAN, which you noted
> is probably unavoidable.

(adding amdgpu folks to Cc here)

Harry Wentland did a nice rework for dcn_calcs.c that should also be
portable to dce_calcs.c, I hope that he will be able to get to that as well.

Looking at my older patches now, I found that I had only suppressed that one
and given up fixing it, but I did put my analysis into
https://bugs.llvm.org/show_bug.cgi?id=42551, which should be helpful
for addressing it in either the kernel or the compiler.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
