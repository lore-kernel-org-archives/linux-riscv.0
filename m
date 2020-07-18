Return-Path: <SRS0=CPyr=A5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF22C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 10:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2703920691
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 10:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxjxX/VB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2703920691
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wuLBgv/0HcEjmY4Es9E3VotCM/pt5nhbmYz0fwaxURE=; b=NxjxX/VBdGQT5EFYkirVbyrpf
	6Ex/6YhSI6bPDvDgFaJ/gegXzUz0MjWgZHjxbnMclsMiIs18LwxXSG3BAQ6dnTTYWjaEHNXdxj+mR
	p8OSA9G+X0+F1wKtljUeltucEsQqCJlB90x766dxhtLslfeXBsKDJ2ImzUnkv5EfPXPeLVdHayg+X
	bGS+TUeCaqexf3SSqTp/yCDQxEtbAB4AJfWXWQhwRCwpUwEmHPPArE5/Gel2NybpSXDjcEjBR8Svt
	bZDnsvhyEHilu57aJjXN/WbX53ADPrynRsLp0oUF3NrHVblw9rMMpMjEnVclccNdhVb1LC1uQWf8R
	iw/85JVQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwkAN-0000Um-Jx; Sat, 18 Jul 2020 10:34:03 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwj5W-0003fk-DY; Sat, 18 Jul 2020 09:25:15 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MhTt7-1kR5hL1PLX-00ectW; Sat, 18 Jul 2020 11:24:56 +0200
Received: by mail-qv1-f43.google.com with SMTP id el4so5296779qvb.13;
 Sat, 18 Jul 2020 02:24:56 -0700 (PDT)
X-Gm-Message-State: AOAM532Larqa/VhRLn7o/iVxa8smVao0LuXBljzCsXvtvXk4HffnYmqx
 pBcSWMBkXkWFMLOACHmWY0Usf30oyUJYk92a2Fk=
X-Google-Smtp-Source: ABdhPJylb3dPfzQat4mnZza6VESrMWsJMNd5HBuOk3P1n07BaEOYyHneqkgGN31SwLj1hOM7gXSsT32wRFFWmYUoWFQ=
X-Received: by 2002:a05:6214:1926:: with SMTP id
 es6mr12756912qvb.222.1595064295108; 
 Sat, 18 Jul 2020 02:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
 <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 18 Jul 2020 11:24:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
Message-ID: <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Atish Patra <atishp@atishpatra.org>
X-Provags-ID: V03:K1:L4btL1Mon4qgn+1k48dS9IK2xpxqK1GqSgnHObbHJ9PvsqwsEhH
 Km/vkFe1qjTbWu4fvsVa2yktIiWJ/zCLQRAyRrsFfqv1B4eJPAVOp5mAHSQ4bC9ZpCcGFkc
 9jpAl0nCZhJEWDEU31uYHHlrgJvbS+3ieDQiYURXB5jFWHBxGYD9i3S0nihOjFfLyJD5j8/
 medhHol2gpgbnrNZsTPOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YulAm/hy6VM=:79+36NzYhEn8wawGvnnXWD
 +u+NwakTylnW5BoA1dqX+x/qt0SG7YBJeia4pZtpsGFIhsDsRf4zh/X/j7CPRdQRMTiht0hiA
 /9A4aBiaLlLZy9WHpc5cZwRphm1IC8emEaFjobWKKqsmRjEdJsUTk0YOsEw1E3lN9f5wNgZWx
 hyb2eZwuh9Ur/gd1f4WnCbjbX8n6S9pw10JaIvZzlvcO7ceyzKTuAliRVV2AcFynRv4GLtm06
 N3RdMEkr5BnD6EfpljJMF6DudnkYSY4eDdpQ7N5lzFuyQB15InO4B4oroP6oixO9GrKdo0lDw
 TOcdSJCiNYrXSG1/KTdAlLSRNbm13JSgEweQ/s/tifxJVCvncW/4Jj890A6xPahZRjF5aylsp
 M5xwRkYPgaxka3xTVUPePmAY4hIx8BXmHcV0WdUrpYOuca1yTATadfKpdv6HzB6WwjMEyCUdU
 aJ7ZWetjs2NF9y43t7OkT77HiWmyqneYvA6LcLS3/JSkFFDI6RWkpCJIlV6QIc6mnSchY2+VG
 V36Ea4EWhwhdETybva+nXu85TN5xfGMjxK5rSedEOQ0dnCAeRGcOHP+mRf5duYC37aENeefu2
 sCfmnZHUkYLKJe6NB0TKB43qoTBFMQiOSBoLFLa09Al96WX1/JoKF0FZz+6fXawfv0S2UQ42a
 Z70pyOsX5OCT9eU6Vfp4i/3M3iszDzbulow6q7YrNVYufDFxobriqzK4c4QZCZojSSW49NrBR
 Kp9k7QA/bBRKvtgq/Pte/qI1XBsEI5rAjEtBD7KrawqKgoUYO6AVdlQqYMbLfkKLO3bDcbZIY
 uY2qDnecUrl4CwXn0A3XokYtu9k7w4iY8HL8hN+/6inc1oxgCiqrHjXsRdQ4UbqyT9VerQCZF
 AqTuc1UkxqjqlZ+xikjpzj7nRntWT4XatvJEnoiLc9Fz9sqSd/WBlfXVhpnn+dVWQEwpqpUAW
 t2TMACEXCLw1O3vwNICjtvkcyOv6PSHxDcjHEcYFkQIByzWb50lna
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_052458_702652_CD9AB113 
X-CRM114-Status: GOOD (  21.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 18, 2020 at 3:05 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Thu, Jul 16, 2020 at 11:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Jul 17, 2020 at 1:41 AM Atish Patra <atish.patra@wdc.com> wrote:
> > > +#define DTB_EARLY_SIZE         SZ_1M
> > > +static char early_dtb[DTB_EARLY_SIZE] __initdata;
> >
> > Hardcoding the size in .bss seems slightly problematic both for
> > small and for big systems. On machines with very little memory,
> > this can lead to running out of free pages before .initdata gets freed,
> > and it increases the size of the uncompressed vmlinux file by quite
> > a bit.
> >
> > On some systems, the 1MB limit may get too small. While most dtbs
> > would fall into the range between 10KB and 100KB, it can also be
> > much larger than that, e.g. when there are DT properties that include
> > blobs like device firmware that gets loaded into hardware by a kernel
> > driver.
> >
> I was not aware that we can do such things. Is there a current example of that ?

I worked on a product in the distant past where the host firmware
included the ethernet controller firmware as a DT property[1] to get around
restrictions on redistributing the blob in the linux-firmware package.

For the .dts files we distribute with the kernel, that would not make
sense, and I don't know of any current machines that do this in their
system firmware.

> > Is there anything stopping you from parsing the FDT in its original
> > location without the extra copy before it gets unflattened?
>
> That's what the original code was doing. A fixmap entry was added to
> map the original fdt
> location to a virtual so that parse_dtb can be operated on a virtual
> address. But we can't map
> both FDT & early ioremap within a single PMD region( 2MB ). That's why
> we removed the DT
> mapping from the fixmap to .bss section. The other alternate option is
> to increase the fixmap space to 4MB which seems more fragile.

Could the original location just be part of the regular linear mapping of all
RAM? I'm not too familiar with the early mapping code myself, so it may not
be possible, but that would be the most logical place where I'd put it.

        Arnd

[1] drivers/net/ethernet/toshiba/spider_net.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
