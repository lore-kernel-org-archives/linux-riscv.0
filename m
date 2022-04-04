Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1020C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aEK51OGdHf8S7g4MbYYddDHndUKOFLZxNDtWY6WM/Y=; b=JMrqh1tkFhwNYE
	GTJmXbNYRehG/D+9jaThp7pphNbQGcIQmO61j1WwXedQ/wTKZkb9UiQ05Ksk6pn7jGNaidnbkJ4YU
	7gs0pTn5SdQZTBmVShuPHD3UMtTcWcOzVVDSxrYk2dKKMZcoUCGvPoZ6Fq+7A9VpMT3mrPjSma/Ci
	wVRXwqbXHKNBu8YrLjS88283GzjWWgF84Q7ay/h86Kfmz6Gre3LEvNGDpQSAKSyFFDdPt3kzzY1vF
	uyp1tPKv0pl7GbccygXm+3+A/a3wR+A1kP7zT5lrwwZnjdRhgljphEdKlnMFFLBudk+I2lPSTpoyb
	BG3GSSt7EBqNdjIRxa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbRxA-00GEbo-0U; Mon, 04 Apr 2022 19:01:28 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbRx6-00GEaf-I6
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 19:01:26 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxmBi-1nvtp13RR0-00zCgL for <linux-riscv@lists.infradead.org>; Mon, 04 Apr
 2022 21:01:21 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso141298wmz.4
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 12:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM530cZy1yVjLTzu2tsAREBPRLYOJ/LKgT2XOjC6B5qEXhzRoK5JUc
 uyOrwGL3E84z+WdAngftH2IIYYE9bbefo/TVxIQ=
X-Google-Smtp-Source: ABdhPJwz/M4LKrm3IRclV8UgrUcDHyP4nLiAeM9chnwMC8xte+ec0eWR310JC5CzRN6KPW7x0SBYcBjNd+/TV08TLsg=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr474508wmc.94.1649098881420; Mon, 04 Apr
 2022 12:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
In-Reply-To: <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Apr 2022 21:01:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
Message-ID: <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:9P+DWGOc+Jk3goPlxR0bKDP1OIWFm8kKHVQGavrfqflzhMNSDa4
 1O0W9Slm3ihQqN9QtJvcp4bBU0UVVXm5/YYJfkFZM3RoYltKOkiJOOrnvPceS+9WmLf36zw
 lktQ+NGiuDUXjpdOj8X5BcFGD2sSbcPN/1gaud+RHSqADFRCtquPJzQj/YLRI4iAWRg5TDd
 k1WS6kzd/nfwPu6JFTaDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SicSfmBCr7M=:AP3ieTpRqwbQlcZTHU6LNQ
 +NJMFop2HKwYn84/UsM5lckqE4uDyFvw/w/uCj7leQJ2BOvlYngCXWEqcG0GUvPfD9Jo+m+qb
 78ojIOuJmltDu0Hgl4brxoMfeBl2KulSv2k3efYjQhTjNUkBD4CJSzv7LkedCzeSPuf6Q2LaG
 QXdEpBBmRKNFZZaFXDCzoxF5jYxAwjHNuYB7IAkZujTUr4EB3ku9NqscLPPyOvRDhTnzEnDYd
 kjdfN+TSuBO5q+bcXzHTaH4wQgqt+04YMHwkC/STh2ru5LrUenggIHOaxwFud8UEKvcvUr6Zt
 /6Bpz5Wk06m9rPdoqb/HZM5VwZppNFYPXv0qruSxivjj5dOENKArBXGvQqHRWRVdij3QRjgX/
 yN93qTyXdNhNN+oZzUGs6aSR7HVB3jJMAC6zQ+2nbBRlnInP56AbfVWBllzovFEqgjwsI71cS
 fOFvudNEAGpubBem4P+yd78dORMZcQbqJUiK1R3F78wbiO+MwU5Vyx0pCa7mG4P+0hgyYg70K
 8DzJg9Aueu79Yu5YVPAkys4F2zHHWT4bf8LnHRgXpNC/WAwOjL8yAl9gm7IU/QV1KvW8p/whx
 pTBqEhbN79OmILDb8wzFCOxT6ZEWeiO4IyY7oLYv/pNTSLojOf+qOhE+GH3rTDPqNndnLZQ/w
 YdNz40ooo+Bftb78eklGJH6ZCZEg7cUBBVubMaWuOmchoC4s7aPXtn/WINtpVKbu8jOY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_120124_934028_C079861A 
X-CRM114-Status: GOOD (  16.25  )
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

On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Arnd,
>
> On Mon, Apr 4, 2022 at 6:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > 1. xtensa nommu has does not compile in mainline and as far as I can
> > tell never did
>
> I have a different picture here. If you look at the logs at
>   https://kerneltests.org/builders/qemu-xtensa-master/
>
> there's a line for noMMU config in every one of them:
>   Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... running
> ............ passed
>
> Please let me know if you observe any specific build/runtime issues.

This is what I get:

$ make ARCH=xtensa O=build/xtensa nommu_kc705_defconfig vmlinux V=1
....
xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
-Wp,-MMD,arch/xtensa/kernel/.head.o.d -nostdinc
-I/git/arm-soc/arch/xtensa/include -I./arch/xtensa/include/generated
-I/git/arm-soc/include -I./include
-I/git/arm-soc/arch/xtensa/include/uapi
-I./arch/xtensa/include/generated/uapi -I/git/arm-soc/include/uapi
-I./include/generated/uapi -include
/git/arm-soc/include/linux/compiler-version.h -include
/git/arm-soc/include/linux/kconfig.h -D__KERNEL__
-I/git/arm-soc/arch/xtensa/variants/de212/include
-I/git/arm-soc/arch/xtensa/platforms/xtfpga/include
-fmacro-prefix-map=/git/arm-soc/= -D__ASSEMBLY__ -fno-PIE -mlongcalls
-mtext-section-literals -Wa,--fatal-warnings -I
/git/arm-soc/arch/xtensa/kernel -I ./arch/xtensa/kernel    -c -o
arch/xtensa/kernel/head.o /git/arm-soc/arch/xtensa/kernel/head.S
/git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
/git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
'atomctl' for 'wsr' instruction

I think there were other errors in the past, but every time I tried
it, the build failed for me.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
