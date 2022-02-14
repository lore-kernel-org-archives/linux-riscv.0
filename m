Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6F7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiO8oDmFA15EbMzCaS1HBcPbi6LTTkZNeQqlTNFjdJo=; b=eNg9niiRa0Geyn
	A9ECIYIGtIGU3X6IpWVxXHnPnD+xh+qMpmwg7X8QFPqiD92sSvbt/dt7ZQnpkJS9+j/6dxXxdNpOn
	FLr8VjBVZ0Pp1E7ClLSR3l6KEMVx5XjarBdQbp+jJXRA4VGR1DfD3gdtAzuFoOAN+3EosB7g0E3fp
	1cBx9r8tOZIhmnYBj7/OyS3fAvvHwTX1ghq80S5xyxamXNpqIx1h2V+5EdCWLeb15JHe/Px8dqBK5
	6GjFK/qtFwbK4FT9a4mV3+BkJ385x7Gm24S4d8OPFH3XskQ1OveoYfMUwqTOqkt3Sb0TIBldiXsvf
	F+Yw1lJmtSVOdSZEugpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhXX-00Glkx-Ry; Mon, 14 Feb 2022 20:01:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhXV-00Gljm-AY
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:01:38 +0000
Received: by mail-lf1-x131.google.com with SMTP id b9so8645564lfv.7
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgwPr3jWEXZiHeYJRBUfKrH3C5wLRAnP7Z6R5s1EJ5U=;
 b=ZcumWtnhggjMFDUHhywZOsPSWocj5WFiFD4wxX4meGi3Jv+FEek8bAx8wm544tPFuD
 FZMy/4sQc4BwvneObDdXEv1mNtlI8GPACMt1JW8whp1hkRcRU1/uCicaO7g7UXSaSO+q
 JQ0jz81cHBjFl3QlKdIkLJ7hR07DlS4kmaNNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgwPr3jWEXZiHeYJRBUfKrH3C5wLRAnP7Z6R5s1EJ5U=;
 b=Dwjzu4IoG1O2qnyenlXmCdXEk3sY5ho/AEu0VdoGGJI69mLF9cYUq8lRjTBYZNvGeo
 XxgmNAVEvS678KJ/2lphGi4A/Cvi9hIHewGeb0qeR3FHzng/mAVUSwAtD/O7XMW/xtIb
 Hb3pIMZTowCf26wHquiCR8qN5YzzpcGrMhDE2Z8rD5qK9i4RbXfOE1FRDxpzeeEKaVYJ
 Mh19TFlS+B5ynLA2GrRGADMNeKP3NIdFhUI78FPJskN7zHAG4QlnA6Fb/3ppVUs0ZDHx
 mQCJUe/59rh3AH2giP2Zlqxg/mD2SlwSKCc8d7XTrdUIGrvNTqNR6MU9S/oe5QrwD5Wn
 +MMA==
X-Gm-Message-State: AOAM5337trnAtOsbmH6xgLYEUfjCAIJ59z5pQbeBcj8H1GnCyMOidmHf
 zWAOQ71Pwkv6trxCC37D78gU9KFyoR3MmZ37xV8=
X-Google-Smtp-Source: ABdhPJz9pNHbdluGWsIbVrO80MtfoDDXuihIm3RHFR0iMxTv3e9GvRYW2vewf97BFbChm4trrBQpUw==
X-Received: by 2002:a05:6512:224b:: with SMTP id
 i11mr511860lfu.14.1644868895190; 
 Mon, 14 Feb 2022 12:01:35 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id bt24sm2049718lfb.246.2022.02.14.12.01.21
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:01:32 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id n24so21104995ljj.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 12:01:21 -0800 (PST)
X-Received: by 2002:a2e:a231:: with SMTP id i17mr205093ljm.443.1644868881602; 
 Mon, 14 Feb 2022 12:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
In-Reply-To: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 12:01:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
Message-ID: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 Nick Hu <nickhu@andestech.com>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, 
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120137_375955_DF461CE8 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Feb 14, 2022 at 11:46 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> As Al pointed out, they turned out to be necessary on sparc64, but the only
> definitions are on sparc64 and x86, so it's possible that they serve a similar
> purpose here, in which case changing the limit from TASK_SIZE to
> TASK_SIZE_MAX is probably wrong as well.

x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
get_user() assembler implementation does the same.

I think any __range_not_ok() users that use TASK_SIZE are entirely
historical, and should be just fixed.

                 Linus

(*) And by "always" I mean "as far back as I bothered to go". In the
2.6.12 git import, we had

    #define USER_DS          MAKE_MM_SEG(PAGE_OFFSET)

so the user access limit was actually not really TASK_SIZE_MAX at all,
but the beginning of the kernel mapping, which on x86-64 is much much
higher.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
