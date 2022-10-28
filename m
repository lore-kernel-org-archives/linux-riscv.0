Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C4FA373D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHrHOtiqT1ovqz/Fpi/phzq+DYmu+aW8XBunDK4thyY=; b=SpOIxFFh7pj6no
	FK7zO50KmAnwea+2VARjRg/lrVbQUh1S6FLNvX53kto163XjXey8Osj8GIkxM9AsrUqktlvIYG760
	ozRDzD7EAQvEr8DjoU4oubTCUu8Z3A6vgerC6XEGVsZ+OoOHjce8/O5r6RHBl7gmXVC+KwLlq3+uV
	Up4HZ9uB+sFO3CoUrBrGao6LxlhCuY+/ztyTmuChug0H4NGVV2IQIwxOW24wrQt/JypNkVtYZoQcm
	o/ay8Q46/e+jtNwgo5YeN9Y88al56AN1SdEDEu8pY/whUCMehXbJVqNj02En/iqr8iMjncEp7F1Jt
	+UcN9tI2Pkvr/TJ6Fv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDRw-00FKPm-Oh; Fri, 28 Oct 2022 00:42:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDRu-00FKOn-SN
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 00:42:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF1B62597
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 00:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DC3C43144
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666917731;
	bh=OqTqHR7aJNAlusR5J+bbP39YaIgwBQNV5K4n8/o5iU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vBkF5ACowgKO/BUd0E9ckrOCWw55Mr+LwyFbwkfKwwGttn5bR5ndai2mdIU2TTwQ7
	 4WPgq6lUwCHEwpIeSrPx6coCs1TIrSy+l94FGMakEnxd9Msum16RdXDAnPOM/zUdAc
	 yWcIx0ZdULGx3svDd0xz61HkiwrCH4T2bPm/eJv0W5b2WEP0heFPdrONptYrAD/Ocf
	 eAxs9nBbbtNyXuSLOh9BeSv/yEd2hvrOePRYqMM43giQTg4aJOiIJSU3jjiA/a11TJ
	 hALbPACUcU53NneZD7jwVU3v93wL2fGSwXetNFclxRSN+ry+zpMX47fiid6vf1Idnc
	 qgEFk522Pjv0g==
Received: by mail-oi1-f179.google.com with SMTP id g130so4567514oia.13
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 17:42:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf0QTK3qQQPaHch5zVfKB/KqpZoMFNt2/UWFtS7Xu8K3akM8pFaW
	soTTQWaWlfWb/H4yzF6juuMj2u/6CECICdHnm28=
X-Google-Smtp-Source: AMsMyM72Nk5qQhNJoO1pbF8ISKZnODY9wB5JhxG1/d8B7XGjSHXoSz2fy7ZE2vRZMglqil2HmBMzIREAH67JlKut7sI=
X-Received: by 2002:a05:6808:f0e:b0:359:b055:32ea with SMTP id
 m14-20020a0568080f0e00b00359b05532eamr5745735oiw.112.1666917730449; Thu, 27
 Oct 2022 17:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220804025448.1240780-1-guoren@kernel.org> <Y1qlRlncUqTtwzE2@invisiblethingslab.com>
In-Reply-To: <Y1qlRlncUqTtwzE2@invisiblethingslab.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 28 Oct 2022 08:41:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQs1Y4RR+ZYB17oW0beWfbpEF+7Wxnk91z=R14LSEqhjQ@mail.gmail.com>
Message-ID: <CAJF2gTQs1Y4RR+ZYB17oW0beWfbpEF+7Wxnk91z=R14LSEqhjQ@mail.gmail.com>
Subject: Re: [PATCH V2] uapi: Fixup strace compile error
To: arnd@arndb.de, Wojtek Porczyk <woju@invisiblethingslab.com>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Eugene Syromiatnikov <esyr@redhat.com>, Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@linux.alibaba.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
	guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_174214_990294_A826DC5D 
X-CRM114-Status: GOOD (  23.07  )
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

On Thu, Oct 27, 2022 at 11:35 PM Wojtek Porczyk
<woju@invisiblethingslab.com> wrote:
>
> On Wed, Aug 03, 2022 at 10:54:48PM -0400, guoren@kernel.org wrote:
> > Export F_*64 definitions to userspace permanently. "ifndef" usage made it
> > vailable at all times to the userspace, and this change has actually broken
> > building strace with the latest kernel headers. There could be some debate
> > whether having these F_*64 definitions exposed to the user space 64-bit
> > applications, but it seems that were no harm (as they were exposed already
> > for quite some time), and they are useful at least for strace for compat
> > application tracing purposes.
> >
> > Fixes: 306f7cc1e9061 "uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h"
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Reported-by: Eugene Syromiatnikov <esyr@redhat.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  include/uapi/asm-generic/fcntl.h | 2 --
> >  1 file changed, 2 deletions(-)
>
> Hello,
>
> Is this patch getting merged for 6.1? Will it be included in stable 6.0?
Em... It seems it hasn't been in Arnd's tree for next. It should be in
stable 6.0.

>
>
> --
> pozdrawiam / best regards
> Wojtek Porczyk
> Gramine / Invisible Things Lab
>
>  I do not fear computers,
>  I fear lack of them.
>     -- Isaac Asimov



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
