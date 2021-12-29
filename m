Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7BDC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 02:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZJsiZaxsc34zFePCEMUo2cENTKMD7AMPmKACdkjYls=; b=2UsKSJ+CAK+uPn
	pUtOzvGCGGp12zeZjLBf7xr8cDerOUfxDgXtGcNF115+SWpMwftL4Lfp9B3o2EnYY1uaODI5uleZJ
	cMVfFf3dJ5UsTaZwRAH/CY7e/k8e/NG2bMGtAVD9m54ikSRSuurkRsO6EjcjHo01xcZP1mknxoG1q
	WJoiHRScnOfpJFwdHfK0R6e1aJJD+cQzzNgOMn+qy66k3atvf4cRozRnFVz5o1bSk8zmM0UvFtBuy
	lUVmvOFU+559SQFXp9fngaQS2izPCFEdBU79V9WUMm+BeZMu/ykMRqcTINGQfoBwQ+BIbcFAoZkkT
	/P4zc2z3SCfFA1cfTvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2PBC-002AoB-CM; Wed, 29 Dec 2021 02:59:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2PBA-002Ano-3z
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 02:59:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 158DB613E2
 for <linux-riscv@lists.infradead.org>; Wed, 29 Dec 2021 02:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784A8C36AEC
 for <linux-riscv@lists.infradead.org>; Wed, 29 Dec 2021 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640746742;
 bh=WWehljrE+d9Z+3M+T9SrX10/EYU7Gcap3svFN0FpHdY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=doH0dqKHCCTGOPu7FBhWS2NixYdNIAZs3lvbFohR9oR9TumeD881kf9+IoQao0Fnn
 D2nm6NiAyKk+tf4J71AFRLYpRNAqCU9tOabxkqydkOGq0cyZbBEWV/CyJw1Ro+l24Z
 zrX7Qo+Xtx4pDEZzhBUX6fdPKU/THYX+AUPG/HXQt7fC2J6CET/D6gW7X9kgSCV1zI
 yyXR9O9uizkViq/MpkH2MiXqAWEtjTgI35mbL0pLm+RwbwBXu6rHSMSebd0G3g2ObM
 5ro9OAUNI/kzdBc373QdKLKbYDKg5NLrw91WExPg9pC1lzu2PRgPs73T+8XHdadHTC
 g1lCqK3LJsZxw==
Received: by mail-wr1-f47.google.com with SMTP id v7so41593813wrv.12
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 18:59:02 -0800 (PST)
X-Gm-Message-State: AOAM533sVcQ8TGN7vsKr7RHzddauorS6xX2Bc//u+JZuKQlZTJQsoNl5
 zr0LaXxroovuepoiWlPsbe0Y8h0LoNWSuXm/Wxs=
X-Google-Smtp-Source: ABdhPJxrps/NwZGe5JTUmDrzyXLa9rjvKVDghRb3MXHYJ0NDa0CGgiMBThXsngnn+H2n+tqEv9R0l1/E9RkqUJy1fEI=
X-Received: by 2002:adf:f051:: with SMTP id t17mr18729122wro.192.1640746740813; 
 Tue, 28 Dec 2021 18:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-5-schnelle@linux.ibm.com>
 <CAMuHMdVBXBXSE8bQFNqxkbCASZKq25evHGXHjC6u7f3ktW4dpQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVBXBXSE8bQFNqxkbCASZKq25evHGXHjC6u7f3ktW4dpQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Dec 2021 21:58:51 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2uw2PMjAEeEA36hssL9aoNv4BCNpubon+0UK=ubCbLXQ@mail.gmail.com>
Message-ID: <CAK8P3a2uw2PMjAEeEA36hssL9aoNv4BCNpubon+0UK=ubCbLXQ@mail.gmail.com>
Subject: Re: [RFC 04/32] parport: PC style parport depends on HAS_IOPORT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_185904_292033_963AAC44 
X-CRM114-Status: GOOD (  18.58  )
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

On Tue, Dec 28, 2021 at 5:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Niklas,
>
> On Mon, Dec 27, 2021 at 5:48 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > not being declared. As PC style parport uses these functions we need to
> > handle this dependency for HAS_IOPORT.
> >
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>
> Thanks for your patch!
>
> > --- a/drivers/parport/Kconfig
> > +++ b/drivers/parport/Kconfig
> > @@ -14,7 +14,6 @@ config ARCH_MIGHT_HAVE_PC_PARPORT
> >
> >  menuconfig PARPORT
> >         tristate "Parallel port support"
> > -       depends on HAS_IOMEM
>
> Why drop this?
> Don't all other parport drivers depend on it?

The other drivers all have dependencies on specific platforms, so I
probably dropped it in the original draft because the remaining dependencies
are sufficient.

Technically, the partport_pc driver only needs HAS_IOPORT, not HAS_IOMEM,
but in the end this makes very little difference.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
