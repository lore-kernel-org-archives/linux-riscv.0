Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQoMznxeWYBzdLtk7B37QCNi8GKfvOEFAecpMY16xgw=; b=eYBkKl5uuOa9oG
	Ko9sVrp8hKjaAUHbViyowkm6H4ZACG+szelFS7wF2bd8EgZal2NJrWoiX4BUUkJvtDZwBBvP46HTc
	d9v+gJa3EOIekTpM+VQpqo68k9S4flCzCZdV2jVs84IIhK0rBwI/nI5I23pb54L7N5i+2opYcZlzq
	MPdltZ3EHgqysR3uYVfCZCa+fvmNbic08DqVdbAlMMijgdKW68Xx8I1yHBy/b1yGWTtYieTspmvH6
	E9XQxWe96Fvk8WDzfDdUDrqvXa1FAD1fRkqExsdKfm3wDuBMmx/vp9nOdXO5gtjew23v2AfswyMEo
	oZNgoJl+TOqjEFUg39Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZlPb-000Wcf-Rw; Thu, 31 Mar 2022 03:23:51 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZlPZ-000WcI-6F
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 03:23:50 +0000
Received: by mail-io1-xd30.google.com with SMTP id x4so27168054iop.7
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 20:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqXJLbSTChe0Sf0lABIwluUF9NPq+42ebG5usKX7e3U=;
 b=a9Bd31rfNvaps8dSKPTYB4cGbmTLW2DxWLgshGUin8Qm2qjGmDxYoh5a1HJD7nxVxH
 B9lPSXVRD8p4wVTNJAvu6hbgf7sFGRN4gwfigF179e5csvWcvHNSnzAc9MOTlKAHOxWO
 tmFHwyu5M5iInyd7x9P/P8FP70Gxr38xRxvncUmWdKtF/7b/7FmIXR/To//4Y0Jlr6st
 +hXwBtTIYKBqjVk7MXjkzTQAQLp6AtssB2kt41z3PnIUYl9UfMz+PCVKf5i4bEKrFO+f
 kRCEVGrRvoGhq4QwkWvUNim7Ix4iJpTiG6TvADL0MKODIyhpFe4iYTpVJG8GcclCTQwt
 jvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqXJLbSTChe0Sf0lABIwluUF9NPq+42ebG5usKX7e3U=;
 b=kB3+HNXqXRpl30Zexqc2QF2z/Cin+W4z1rEy1fKztx3e6kiYI2d5wqn1c9wOqhuX2Y
 kqIG7uNX5YLEl1U1uudwfgd+rbP0FudVlqKvVJW999ywsjphzidBekYl3PCkBNQnSe4P
 krjT5IE6kDVuaSlV7lUzPpAYO0Dd8UX3yqU+XfXRfRTFKlZlH1vHuzwsPngZskI3vb1c
 Vb28pOiYPUVMgBP6SMZCkabroxVZKgEvpWZ5xS+8i7z56YKy+TSqJ0Le1jIEg1gWauoY
 kFs7byKs6Rg7P8kUfkp+NgR+H5lbRRwF9wKn1Y8odo3wq3NbFGbubRHKxNXsGCPDNZ+Y
 FbrA==
X-Gm-Message-State: AOAM531jHT0dh74Zr/zLolBZ4h5lrGSRgXFD4cSkDIxXYKphHDxqFyYI
 E4vo/VUkc9RzDQgC3H7uhR27ga9wU8nnGNkmers=
X-Google-Smtp-Source: ABdhPJzGzrJ2GVzoQoSPEVYm3yY1Ed6FM0OkhSoy+2rSNGNTGw6D++3AAnAOTVROFyIVD2cE+S32K33POY5zOZEd+AU=
X-Received: by 2002:a02:a88f:0:b0:323:6ce5:fb36 with SMTP id
 l15-20020a02a88f000000b003236ce5fb36mr1859806jam.21.1648697027785; Wed, 30
 Mar 2022 20:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
 <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
 <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
In-Reply-To: <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 13:23:21 +1000
Message-ID: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, phantom@zju.edu.cn, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_202349_258733_03BA8CAF 
X-CRM114-Status: GOOD (  18.35  )
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

On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> >
> > Presumably you mean "revert" here?  That might be the right way to go,
> > just to avoid breaking users (even if we fix the kernel bug, it'll take
> > a while to get everyone to update).  That said, this smells like the
> > sort of thing that's going to crop up at arbitrary times in dynamic
> > systems so while a revert looks like it'd work around the boot issue we
> > might be making more headaches for folks down the road.
> >
>
> The opposite in fact, I did not suggest to revert it, but rather undo
> the revert (as Alistair already removed it from the apply-next tree),
> since my original patch fixes buggy behaviour that is blocking the
> testing of some embedded software on QEMU.

So, this is a little tricky.

We want to apply the fix, but that will break current users.

Once the fix is merged into Linux we can apply it here. That should
hopefully be right at the start of the 7.1 QEMU development window,
which should give time for the fix to propagate into stable kernels
and not break too many people by the time QEMU is released.

Alistair

>
> Idan Horowitz
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
