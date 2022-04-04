Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2DEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TZxZzs6WRSmidJY3eTcTOc68821ofX9F6tck3TXpdA=; b=lnTFj9IAcc4CnO
	bLF6JW0dWVW7QNjFsxuY6CAsAeQAmzfkjGXYrtVCoNm74QNeBcSHZb1/ulQhsIOk+Q5SA6xn0MvoM
	1ZHMf7fvWtM3NPdohD71/PpqC7GrciNuNqjndvQrT0e2zAtvQs2o/IQnwuEe0GNjd2/4trE5GILSU
	6hBXj+mPt/ppBUNfD8JYtr+nExTVpAmqQSY1IB09R6oWdeE0v82oErMOM1u/o18RpBLT6Sv34OoZQ
	o2SYK68PxTQEMoCuDfteTw2sDnHrCbKfK4HNi+rSDLHHGmXtDs7IVmVL2NiC4V239Q+SYKjoBzaFp
	6T/rgBVmeS55bkAOnwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbSUk-00GHn2-Nt; Mon, 04 Apr 2022 19:36:10 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbSUh-00GHmD-68
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 19:36:08 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHEPI-1noi280Ezo-00DIo0 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr
 2022 21:36:04 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso213876wme.2
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 12:36:03 -0700 (PDT)
X-Gm-Message-State: AOAM533w6BMt6q4gEECpEM41y8KU+IZnYHtVbVoSxOOgKf8fn3dLhfuu
 iAwAYdKylkg3+rr44+juNikcClmgWkPFzi8j0rU=
X-Google-Smtp-Source: ABdhPJxpqVUnzSThWxFis0+czy1waV2fEyvClqHAXtfCqV11EeZgFuDvKELwz3h19yH6dPE8NNhk9binn9y/5RzmubM=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr626838wmj.20.1649100963560; Mon, 04 Apr
 2022 12:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
In-Reply-To: <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Apr 2022 21:35:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
Message-ID: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
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
X-Provags-ID: V03:K1:BLgnrk/8TC2A7tj3fk8SBcKzZmXkN3AToQxgTPmjT/SCFzEIZVs
 rXE2AgvpYz0cKKjUM4gWFHX1H6ZQTqUcKSP31PIHrZ4ha9cwUNFyIqKVc3HCg4jDvQ4fmi8
 yjpIW4r6hr1cj6LRY5m/LkTglZCtONJqCk0PFKjRP0QTB3D3lZmyuOBl6H73vYs6tsUYrBN
 nCxKa/9nQYkqtQaAjv3Ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+N4bjprYls0=:tNjljGOtaMpsULqhLP6lYr
 XOYDU4Wo7h1xiPxnFIZPDYeof/adbeiWPlHO35Kh0vWvolYuSWtWXlXGTU0GVXUuQ645lgel7
 KgXERjo/JXzGYOLpifp6mttwYTHt9p0fMAkMkdSMR1MPmSwX6yvxneA+4wn332Bna/pOKAi/I
 672uNuOS6q/e+0PVCG4IzyScEA4xKn5YY0OjzcVBIR96SNT4sJGM7CfJHj9TTzw0R9YrixWWl
 4Ju3yXPrXA4cr2WsG1HiVo9DdY3aqiObUr7cj9Rd0XNAUgbaDRVpcSWgwwJ25o9voI/Oxu1Oj
 l1hxj9XSMzRdjrYyx270PcxzrAalLxUzru5Ew/I8u4DGsx7cmk/DRgDPD61rDw/fSHRKM1GHL
 zjL8FRVukPtFwkeNh8YffYd0sAcvFFBwAbc4yS0S09ec2V085wki9QstkE8RhVJgbew9+Fn3Y
 fIiQyB+QBMXyxu7oYvTdi3oC8YEImc2GiaHWrlEYxio0SHVfkGhc9DVElDojpDrepoPbsqsu+
 EW2u0RW6vG+3qI2qy7paChmXg+CNXmfCNq6aWRfsTnLY+0jDALrfC1gkuEckRyL86FBFWtb0X
 Et5jarkUmDw737VCps9RMTJiIN+R5PCmUlcMc5Fialz7icZoaULHi0tQ2kGDTBxcszm9fHPlK
 JSITAVk59pY+ZywkRTvnVIR0NhkKOs4+h/ZrD+fpwdUIQCW4Z39NX9R16r8XeBpIiVNwjpymj
 v0K8FJ6p0+FqvvMQqSdVbJQsyq2yN31XWTZuxaE54QjS/br1VD15PeeDXc/BQH2NZQFfPqQD3
 anlKJUjVSExqULwpwPI7AyxYoaqpecpZQkG4X4xKsOXWa1WYk0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_123607_556608_3BF17C9D 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > Please let me know if you observe any specific build/runtime issues.
> > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> ...
> > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > 'atomctl' for 'wsr' instruction
>
> Sure, one cannot use an arbitrary xtensa compiler for the kernel
> build, the compiler configuration must match the core variant selected
> in the linux configuration. Specifically, for the nommu_kc705_defconfig
> the following compiler can be used:
>
> https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
>
> If you build the toolchain yourself using crosstool-ng or buildroot they
> accept the 'configuration overlay' parameter that does the compiler
> customization.
>
> Perhaps the documentation for this part is what needs to be improved.

It sounds like a bug in the kernel Makefile. On all other architectures,
you can generally just pick any (recent) compiler and build any kernel,
as the compiler arguments set the exact target machine type based
on the kernel config. You can't normally rely on the compiler defaults
for kernel builds.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
