Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA480C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMIYFae2fIda7paFbMlRSsVcQ2C5gPeC3JY8gX0JLGg=; b=xGcuTrP5drUaP1
	BBvDmdJU7zYd9pAL/VVI3VeYBTXwLxa5J7lAAS1TfbqYfzr5+EBJrJyGAeI3gEN13sJqWFo/7Rhvs
	a095ZqxbJpUrdgWx+Kzfi+gN11cqdrHNiwlEtEwWC5Yampj5qWCXnnn2LaqSGlsfMX7RuIccxrG45
	8zGhRnR4dHsaL/vxGpGgyt+5YRNPt9PD7DEEKvFBtMSWFIFPebyS0kiv64arWvq21iGWqoxnzRxuy
	k5bNQd/L8hect1OUkmvo/TfgeM1MMjOC67YbZIGrsIopnD7e/kL9S6lD+AjT10sGX3ONNTEdFKByB
	51xkA9+wCxreHph4E3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl51f-00FuYY-12; Sun, 01 May 2022 08:33:55 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl51b-00FuWU-O3; Sun, 01 May 2022 08:33:53 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhlCg-1oOpcx0C5g-00dlDK; Sun, 01 May 2022 10:33:47 +0200
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f7d621d1caso121987007b3.11; 
 Sun, 01 May 2022 01:33:46 -0700 (PDT)
X-Gm-Message-State: AOAM530xjGufpN5v6yTqQeVxcvuwqn7jz76wVpC1t/jKzC/mr6m6bD9k
 fw3Xvj5IZtzn2+ySRtI1/xTDrsK9iTr28oamx9Y=
X-Google-Smtp-Source: ABdhPJx7EkELZrBAmPjNc/73odhjEgqgTI5PwY7c4bA/A+enkyNER6K6fXqCt4wvYWQxX6D6K32sBvkhhAy1mpKvnE4=
X-Received: by 2002:a81:5594:0:b0:2f8:f39c:4cfc with SMTP id
 j142-20020a815594000000b002f8f39c4cfcmr3827327ywb.495.1651394025779; Sun, 01
 May 2022 01:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220430090518.3127980-1-chenhuacai@loongson.cn>
 <20220430090518.3127980-22-chenhuacai@loongson.cn>
 <CAK8P3a0LwJ3mMQMFkxGxr+umCMM3dKGRnLF+dMCmD5j43hq2sA@mail.gmail.com>
 <CAAhV-H6vPdLeup38YTj64Xxxk+PTact=DMJTs9efsa1b3t-y2A@mail.gmail.com>
In-Reply-To: <CAAhV-H6vPdLeup38YTj64Xxxk+PTact=DMJTs9efsa1b3t-y2A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 1 May 2022 10:33:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0E7P_TOJsT9=+O56L2=oyeMGckTvkb4OnK1MPcETLdtg@mail.gmail.com>
Message-ID: <CAK8P3a0E7P_TOJsT9=+O56L2=oyeMGckTvkb4OnK1MPcETLdtg@mail.gmail.com>
Subject: Re: [PATCH V9 21/24] LoongArch: Add zboot (compressed kernel) support
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, 
 Yanteng Si <siyanteng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-efi <linux-efi@vger.kernel.org>
X-Provags-ID: V03:K1:L6VoyogA8lan4uBMcnDuKwVkYgCZapJP9yl53I5usgtNuw7FXg+
 2sGlBMhqVrWC+VBMbuSBWkyEJIjiaMN4GG8LlIbaUnsni7DM3qx0eM3oKQ+KERI/TVkUE8o
 Asyo94qNf1E9pfcmhbAtisXIZdZ6F2pSoh7Ll4o5wM0NJIYC3N7Nxk5D/dDl4pYxSyaHsDT
 PmwnTxtbvzb2pkabvts/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hjg6jd/29dY=:zu9VKsxOq5W3nKO0cfznGe
 fodXNz35O8Cbv+/JPfZSodG/1KYaBilZl1xHLmmY/Qjcgyu8C4yVEABQzgDiDTfyIgJq3Eu3p
 nVsJk4Uw3QcMK7KtMNq94gsX9+KeLtrNez/9QE7Qe7PDhrhiEtSR+98zr3rA+dCouEqh7khz/
 18ffQMu2hPXb1PDmnkAwHrobAoYoxillB35B/ru3vtiAtBxI3ZWwpEsQNglJFvumtiAZaf5P4
 BPLYbn9uY/Pn748qYRAjKR8RneuvtovM+si1rVyvaI2rZdyPf2LmY1nzwv/lseAqxftQSyDrW
 9Ohurj2aeTYTFRVy8WD6jYGWRdyRmYpPz2UsSGHs6yCaIeHqsdw942YcsPLZMabY0kig7WFQw
 D8vwr6gGDCni6KjxXNTIv4L9AsDb3PEdGVlIRC349Y430XzglgeWKgWJ/JHQ4TFqJwIBo+qXD
 3Xt9OAW1/GP06PLWNUHmP43s8xa837gL6Ya1POPj1WVLhhRRnjvi58R5z8O29ElUGdcn1XMqc
 W41N/NOITOnCdUD+vKeDjfWd/3YMcM8YjNTmoQFu4FhFmdbILQz8QxXUgtjUsq8+bhGM1Mnyl
 O8DK1N/lBg7Sh+xx2VVl8J9XX8N9ENWC7cOVQdhMD5FFMBdqsCNSIlFBIJYsvEKj0tkpN1UY/
 nMwA4+bWFwJLUfOlZ134NNVLBihVFM6A21PGDBLzIUJhWTAgdMUkKvZAD57XGxR2SKIk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_013352_103152_5B1B463C 
X-CRM114-Status: GOOD (  25.30  )
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

On Sun, May 1, 2022 at 7:22 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Sat, Apr 30, 2022 at 7:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Apr 30, 2022 at 11:05 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > >
> > > This patch adds zboot (self-extracting compressed kernel) support, all
> > > existing in-kernel compressing algorithm and efistub are supported.
> > >
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >
> > I have no objections to adding a decompressor in principle, and
> > the implementation seems reasonable. However, I think we should try to
> > be consistent between architectures. On both arm64 and riscv, the
> > maintainers decided to not include a decompressor and instead leave
> > it up to the boot loader to decompress the kernel and enter it from there.
>
> X86, ARM32 and MIPS already support self-extracting kernel, and in
> 5.17 we even support self-extracting modules. So I think a
> self-extracting kernel is better than a pure compressed kernel.

These three support it because they always have and it's hard to
remove features later because it breaks user setups. Among the
architectures we merged since the start of the git history in 2005, only
xtensa supports compressed kernels, the rest rely on the boot loader.

> > Adding the arm64, risc-v and uefi maintainers for further discussion here,
> > see full below.
>
> Keeping consistency across architectures (support self-extracting for
> all modern architectures) looks good to me, but can we do that after
> this series? I think that needs a long time to discuss and develop.

Right, just drop this patch then, and we can get back to doing it for
all UEFI users after loongarch is merged.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
