Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxcigZp9YCAzsYqmON3+dBzzhamLZCpIqtbj86VZNkU=; b=tvGfnnFykOH4iA
	drqAMnxEfJmAqnnTNWhF3pMT/9f+lwiuy45+gwsjayhdvFy7hzkGenpKTWVJw+XdzsbtxlHYqlUGp
	zcGSIbcAJ/zYBKtUiLuqH3bc1mdn2PMxKIkPVDgxrOpP+D6uUOSOPKa16YjSMaiufS1hGZWkkh3V5
	CbNcD7ieomjfpw2V8YtQ4l2HClvH7ppPSIelNqhGhFsX4qMhjTtlEfSplPa5GAlGhzFwwY8a9b5dF
	ZZGyjjLEUp7Dglkj34eGQOmxZRI4cERRyM4hGjz0nbGPT0nQWPvmvyi3+IS940sSesnJZYsl9dotD
	rim5cTJ9EGqlryIlJ9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpNI-00Dmrf-Ad; Wed, 23 Feb 2022 11:00:00 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpNE-00Dmn9-Tt; Wed, 23 Feb 2022 10:59:58 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJEEf-1ngQSJ2Y7X-00KhWK; Wed, 23 Feb 2022 11:59:52 +0100
Received: by mail-wr1-f43.google.com with SMTP id p9so38896286wra.12;
 Wed, 23 Feb 2022 02:59:52 -0800 (PST)
X-Gm-Message-State: AOAM532gIoMUCfnQpT9+tPh2aJo6euVvUJN3mAaKXw3UYDzvzHgTupiT
 KmIJUc+edRo3yEwHzlhNwA3GX1WCxy64kOUVyn0=
X-Google-Smtp-Source: ABdhPJz3tjc3IejYq+UPcpb0b0B/1/NsttPG6/6KnMrBytsQxjHYO0/p2daBPMgz1AgVYfLNcxR3Ydw+Oyz4L5S8GiA=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr23150986wri.219.1645613992251; Wed, 23
 Feb 2022 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
In-Reply-To: <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Feb 2022 11:59:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Subject: Re: [PATCH V5 00/21] riscv: compat: Add COMPAT mode support for rv64
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 Greg KH <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:a9paZ+50ozM88a4PODpA9UubFj9vNsnmVTKnSQxxMqCTjo/bJ20
 mcnwltQrwoJ032lZrTAPAVofREQ2us6uzxk7OOMQ1RZU8yl4F/BKtxcJJ6Vvu+Nt4Z0Oyrs
 uWNDo6f4fKwcsDLBA/FYV4r82QaFmsRwI6WAfzAHoEkRhuJlh1YvlJUYnUGs74uJofl0YFV
 6ASh3ayHQKqQ/d/BAcQOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nUZtzt7Noak=:zeYB9VEJA200Wymeqa1EEw
 Oub2Guq3S7oHkCd6e5hG01WLrCMjnrULV3iwzrEyqQBIo9lYiiYYj8WPGR2N1rmRitE818gNp
 ddzAULCsm1GAz6ZHUqiI51+5c4/I3K2Nc/LIQM89poR4xRpbX02N3CJGIgF/3VER/rZxL0f7A
 rPqs29mWKJhvLVQ4wnMcAEUcTLzcaa0FbhdzCYAGX667dQnks/9zXBOBsDAHM2QZoFp5oFAly
 mfBUadhaBHkx0QXYrkMJzBl/2KjYe+f500AI0wpH7pVZfBbtMyjr23+izJnejCjo3ZoLit+X7
 fkATh4zl6XOKzyCXa1kUO5DQxkvjUDaHuPPp4rKZM0YFOMWjRzjnVUPQmF6iVyYHl+kod0xmw
 I0RHLL7CT4rClRGTx3VwkKXfF3KQ2Ixc5/caTDLvCOrGLqC4LdeB1TcZdIXeqbTZTyVVxKk4q
 Q9zY54WXGXwcX7hVMHe8odr9lEXl/BFAHLG+WVom/4RYj4T0hLPGfPNgT3EUQ3CmSRflVzySJ
 14CZeGY9hCitGXUKtlnSfaaLfSQwUJ9sMG8yuwZQHWXkEdjx//IqNTT+Uzev3VuN2ASHf+pmV
 1SRHzi8ZFzyB2lgOh9M/Dv2fNWXxC3SHsNCVkeKwzV1DYhDGFVk7B3UA1lcaBOrt6mMag6RmM
 r6iv16vOshrL880uIS3bVWiFcaiTJ8CK1kx80FIG3wZnORDIqcQ06UVDV1HFDOCzmTdRXwHt9
 bOoVG7x704qhQAkY1QRkIFu5rvV0t+aMemudtl7fG0W+gFGsWXDIcWFp5USNBeQBdAt8ZDJo4
 WOOjYkQ9QQgR/wwIggHujPPaMxt5DfVidaRJ6pMJ9B/R/u2pLA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_025957_310113_64C2DAB8 
X-CRM114-Status: GOOD (  25.05  )
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

On Wed, Feb 23, 2022 at 2:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:24 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> > s390, mips, sparc) have supported COMPAT mode. But they all have
> > history issues and can't use standard linux unistd.h. RISC-V would
> > be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> > /unistd.h.
>
> TBH, I'd always sort of hoped we wouldn't have to do this: it's a lot of
> ABI surface to keep around for a use case I'm not really sure is ever
> going to get any traction (it's not like we have legacy 32-bit
> userspaces floating around, the 32-bit userspace is newer than the
> 64-bit userspace).

The low-end embedded market isn't usually that newsworthy, but the
machines ship in huge quantities, and they all run 32-bit user
space for good reasons:

The cheapest Linux systems at the moment use a low-end MIPS or
Arm core with a single DDR2 (32MB to 128MB) or DDR3 (128MB
to 512MB) memory chip that for now is a bit cheaper than a larger
LP-DDR4 (256MB+). The smaller configurations will go away over
time as they get outpriced by systems with LP-DDR4, but a 32-bit
system with 256MB will keep beating a 64-bit-only system with
512MB on price, and will run most workloads better than a 64-bit
system with the same amount of RAM.

On the Arm side, I hope that these systems will migrate to Armv8
based designs (Cortex-A53/A35 or newer) running 64-bit kernel
with 32-bit user space to replace the currently dominant but aging
32-bit Cortex-A7 cores. As you say, RISC-V is at a disadvantage
here because there is no existing 32-bit ecosystem, but it may take
a chunk of that market anyway based on licensing cost. Between
doing this using pure 32-bit cores or on mixed 32/64-bit cores,
I found Guo Ren's explanation very sensible, it lets you use the
same chip both as a low-end embedded version with SiP
memory, or using an external DDR3/LPDDR4 chip with enough
capacity to run a generic 64-bit distro.

> My assumption is that users who actually wanted the
> memory savings (likely a very small number) would be better served with
> rv64/ilp32, as that'll allow the larger registers that the hardware
> supports.  From some earlier discussions it looks like rv64/ilp32 isn't
> going to be allowed, though, so this seems like the only way to go.

Right, between rv32 user space and a hypothetical rv64-ilp32 target,
I think it's clear that the former is better because it means introducing
only one fringe ABI rather than two incompatible ones with minor
performance differences.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
